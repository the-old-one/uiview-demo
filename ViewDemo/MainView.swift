//
//  MainView.swift
//  ViewDemo
//
//  Created by Oleg Chernyshenko on 7/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit

class MainView: UIView {
    var likeAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
        addActions()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.addSubview(contentView)
        self.addSubview(likeButton)
    }

    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        setupContentViewConstraints()
        setupLikeButtonConstraints()
    }

    func addActions() {
        likeButton.addTarget(self, action: #selector(self.onLikeButton), for: .touchUpInside)
    }

    @objc func onLikeButton() {
        likeAction?()
    }

    fileprivate func setupContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }

    fileprivate func setupLikeButtonConstraints() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        likeButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
    }

    let contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Like", for: .normal)
        return button
    }()
}
