//
//  DetayRouter.swift
//  FoodApp
//
//  Created by Azra Kaya on 26.05.2022.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
        ref.yemekDetayPresenterNesnesi = DetayPresenter()
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = DetayInteractor()
        
    }
}
