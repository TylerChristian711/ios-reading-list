//
//  BookTableViewCell.swift
//  ReadingList
//
//  Created by Lambda_School_Loaner_218 on 11/12/19.
//  Copyright © 2019 Lambda_School_Loaner_218. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBAction func btnCheck(_ sender: Any) {
    }
    @IBOutlet weak var check: UIButton!
    @IBOutlet weak var titleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
