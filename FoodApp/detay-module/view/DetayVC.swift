//
//  DetayVC.swift
//  FoodApp
//
//  Created by Azra Kaya on 26.05.2022.
//

import UIKit

class DetayVC: UIViewController {

    @IBOutlet weak var yemekImageView: UIImageView!
    
    @IBOutlet weak var labelYemekAd: UILabel!
    
    @IBOutlet weak var labelFiyat: UILabel!
    
    @IBOutlet weak var labelAdet: UILabel!
    
    var yemekler:Yemekler?
    var yemekDetayPresenterNesnesi:ViewToPresenterDetayProtocol?
    var sayi = 0
    
    //sayfa ilk açıldığında çalışacak
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yemekler {
            yemekImageView.image = UIImage(named: y.yemek_resim_adi!)
            labelYemekAd.text = y.yemek_adi
            labelFiyat.text = "\(y.yemek_fiyat!) ₺"
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)")
            yemekImageView.kf.setImage(with: url)
        }
        
        DetayRouter.createModule(ref: self)
        
    }
    
    @IBAction func buttonAddSpecialInst(_ sender: Any) {
        //boş button
    }
    
    
    @IBAction func buttonEksi(_ sender: Any) {
        adetEksiltme()
    }
    
    @IBAction func buttonArti(_ sender: Any) {
        adetArttirma()
    }
    
    @IBAction func buttonSepetEkle(_ sender: Any) {
        yemekDetayPresenterNesnesi?.sepeteEkle(yemek_adi: (yemekler?.yemek_adi)!, yemek_resim_adi: (yemekler?.yemek_resim_adi)!, yemek_fiyat: Int((yemekler?.yemek_fiyat)!)!, yemek_adet: Int(labelAdet.text!)!, kullanici_adi: "melis")
    }
    func adetArttirma(){
        sayi = sayi + 1
        labelAdet.text = String(sayi)
    }
    
    func adetEksiltme(){
        sayi = sayi - 1
        labelAdet.text = String(sayi)
        
        if sayi < 0 {
            labelAdet.text = "0"
        }
    }
    
}
