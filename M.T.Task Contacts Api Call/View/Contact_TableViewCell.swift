//
//  Contact_TableViewCell.swift
//  M.T.Task Contacts Api Call
//
//  Created by Pravin Kumar on 09/04/22.
//

import UIKit

class Contact_TableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellImg: UIImageView!
    
    
    @IBOutlet weak var cellname: UILabel!
    
    
    @IBOutlet weak var cellemail: UILabel!
    
    
    @IBOutlet weak var cellidnum: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
