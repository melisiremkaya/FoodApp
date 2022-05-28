//
//  Protocols.swift
//  FoodApp
//
//  Created by Azra Kaya on 25.05.2022.
//

import Foundation

//ana protocoller
protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func sepeteEklenenYemekleriYukle(kullanici_adi:String)
    func sepetYemekSil(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    func sepetYemekler(kullanici_adi:String)
    func yemekSil(sepet_yemek_id:Int,kullanici_adi:String)
}

//Taşıyıcı protocoller i-p-v
protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetYemeklerListesi:Array<SepetYemekler>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetYemeklerListesi:Array<SepetYemekler>)
}

//router
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}
