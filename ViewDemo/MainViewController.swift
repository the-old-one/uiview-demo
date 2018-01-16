//
//  MainViewController.swift
//  ViewDemo
//
//  Created by Oleg Chernyshenko on 7/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let presenter: MainViewPresenter!
    var mainView: MainView { return self.view as! MainView }

    init(with presenter: MainViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.likeAction = { [weak self] in self?.likeAction() }
    }

    private func likeAction() {
        presenter.updateLike()

        UIView.animate(withDuration: 0.5, animations: {
            self.mainView.likeButton.setTitle(self.presenter.likeButtonTitle, for: .normal)
            self.mainView.contentView.backgroundColor = self.presenter.viewColor
        })
    }

    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }
}
