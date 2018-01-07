//
//  MainViewController.swift
//  ViewDemo
//
//  Created by Oleg Chernyshenko on 7/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var mainView: MainView { return self.view as! MainView }
    var liked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.likeAction = { [weak self] in self?.likeAction() }
    }

    private func likeAction() {
        self.liked = !self.liked
        if self.liked {
            UIView.animate(withDuration: 0.5, animations: {
                self.mainView.likeButton.setTitle("Dislike", for: .normal)
                self.mainView.contentView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.mainView.likeButton.setTitle("Like", for: .normal)
                self.mainView.contentView.backgroundColor = .clear
            })
        }
    }

    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
