//
//  CryptoCellTableView.swift
//  CryptoCrazy
//
//  Created by Erberk Yaman on 23.05.2023.
//

import UIKit

class CryptoCellTableView: UITableViewCell {

    @IBOutlet weak var currencyText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
