//
//  SepetVC.swift
//  FoodApp
//
//  Created by Azra Kaya on 25.05.2022.
//

import UIKit

class SepetVC: UIViewController {

    @IBOutlet weak var sepetTableView: UITableView!
    @IBOutlet weak var labelToplamFiyat: UILabel!
    
    //boş liste
    var sepetYemekListe = [SepetYemekler]()
    
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        SepetRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepeteEklenenYemekleriYukle(kullanici_adi: "melis")
    }
    
    @IBAction func buttonSepetiOnayla(_ sender: Any) {
        performSegue(withIdentifier: "toOdeme", sender: nil)
    }
}

extension SepetVC : PresenterToViewSepetProtocol {
    
    func vieweVeriGonder(sepetYemeklerListesi: Array<SepetYemekler>) {
        self.sepetYemekListe = sepetYemeklerListesi
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
    }
}

extension SepetVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetYemekListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepet = sepetYemekListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        
        hucre.sepetYemekAdLabel.text = sepet.yemek_adi
        hucre.sepetFiyatLabel.text = "\(sepet.yemek_fiyat!) ₺"
        //hucre.sepetImageView.image = UIImage(named: sepet.yemek_resim_adi!)
        hucre.sepetAdetLabel.text = "\(sepet.yemek_siparis_adet!)"
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepet.yemek_resim_adi!)")
        hucre.sepetImageView.kf.setImage(with: url)
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.sepetHucreArkaplan.layer.cornerRadius = 10.0
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
            let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
            let yemek = self.sepetYemekListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.sepetPresenterNesnesi?.sepetYemekSil(sepet_yemek_id: Int(yemek.sepet_yemek_id!)!, kullanici_adi: yemek.kullanici_adi)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}



