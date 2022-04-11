//
//  SecondViewcontroller.swift
//  M.T.Task Contacts Api Call
//
//  Created by Pravin Kumar on 09/04/22.
//

import UIKit
class SecondViewController: UIViewController {
    var c_api1 : MyData?
    
    
    @IBOutlet weak var svcimglbl: UIImageView!
    
    @IBOutlet weak var svcnamelbl: UILabel!
    
    @IBOutlet weak var svcemaillbl: UILabel!
    
    @IBOutlet weak var svcidlbl: UILabel!
    
    @IBOutlet weak var svccontinuebtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        svcnamelbl.text = "\((c_api1?.first_name)!)"+"\((c_api1?.last_name)!)"
        svcemaillbl.text = c_api1?.email
        svcidlbl.text = "\((c_api1?.id)!)"
        let url = c_api1?.avatar
        svcimglbl.downloaded(from: url!)
        svcimglbl.roundedhe()
   
        svccontinuebtn.roundedge()
    

    
    
}


}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    func roundedhe(){
        self.layer.cornerRadius = self.frame.height/2}
}


    
extension UIButton{
        func roundedge(){
            self.layer.cornerRadius = self.frame.height/2}
    }

