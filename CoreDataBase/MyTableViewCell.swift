//
//  MyTableViewCell.swift
//  CoreDataBase
//
//  Created by Bhautik Rajodiya on 20/03/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
