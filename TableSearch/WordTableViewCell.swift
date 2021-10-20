//
//  WordTableViewCell.swift
//  TableSearch
//
//  Created by Murat Menzilci on 19.10.2021.
//

import UIKit

class WordTableViewCell: UITableViewCell {
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
