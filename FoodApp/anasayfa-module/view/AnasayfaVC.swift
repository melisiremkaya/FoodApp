//
//  ViewController.swift
//  FoodApp
//
//  Created by Azra Kaya on 25.05.2022.
//

import UIKit
import Kingfisher

class AnasayfaVC: UIViewController {

    @IBOutlet weak var yemeklerTableView: UITableView!
    
    //boş liste
    var yemekListe = [Yemekler]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.tumYemekleriYukle()
    }
    
    //geçişi dinleme - filtreleme yapmak için
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetay" {
            if let yemekler = sender as? Yemekler {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.yemekler = yemekler
            }
        }
    }
    
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemekListe = yemeklerListesi
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()
        }
    }
}


extension AnasayfaVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemekListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemekListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemekHucre", for: indexPath) as! YemeklerTableViewCell
        
        hucre.yemekAdLabel.text = yemek.yemek_adi
        hucre.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
        //hucre.yemekResimImageView.image = UIImage(named: yemek.yemek_resim_adi!)
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
        hucre.yemekResimImageView.kf.setImage(with: url)
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaplan.layer.cornerRadius = 10.0
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemekListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
