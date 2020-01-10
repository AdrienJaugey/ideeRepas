//
//  TableViewCell.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 19/12/2019.
//  Copyright © 2019 Adrien Jaugey. All rights reserved.
//

import UIKit

class RepasCell: UITableViewCell {

    @IBOutlet weak var repasLabel: UILabel!
    @IBOutlet weak var repasImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
