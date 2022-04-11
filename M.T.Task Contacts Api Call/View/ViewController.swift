//
//  ViewController.swift
//  M.T.Task Contacts Api Call
//
//  Created by Pravin Kumar on 09/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    let c_parcer = ContactsParser()
    var c_apidata = [MyData]()

    @IBOutlet weak var tableViewCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
        c_parcer.parse { [self] data in
            self.c_apidata = data
            DispatchQueue.main.async {
                self.tableViewCell.reloadData()
            }
        }
    }
}

    
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        c_apidata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "Contact_TableViewCell") as! Contact_TableViewCell
        cell.cellname?.text = c_apidata[indexPath.row].first_name+" "+c_apidata[indexPath.row].last_name
        cell.cellemail?.text = c_apidata[indexPath.row].email
        cell.cellidnum?.text = "\(c_apidata[indexPath.row].id)"
        let url = c_apidata[indexPath.row].avatar
        cell.cellImg.downloaded(from: url)
        cell.cellImg.roundedhe()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController{
            destination.c_api1 = c_apidata[(tableViewCell.indexPathForSelectedRow?.row)!]
        }
    }
    
    }

    

