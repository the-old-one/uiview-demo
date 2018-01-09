//
//  MainViewPresenter.swift
//  ViewDemo
//
//  Created by Oleg Chernyshenko on 9/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import Foundation
import UIKit

class MainViewPresenter {
    var model = MainModel(liked: false)
    var likeButtonTitle: String {
        return model.liked ? "Dislike" : "Like"
    }
    var viewColor: UIColor {
        return model.liked ? UIColor.red.withAlphaComponent(0.5) : .clear
    }
    init() {
        
    }
}

struct MainModel {
    var liked: Bool
}
