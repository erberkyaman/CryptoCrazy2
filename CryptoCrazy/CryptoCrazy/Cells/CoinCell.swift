//
//  CoinCell.swift
//  CryptoCrazy
//
//  Created by Erberk Yaman on 18.06.2023.
//

import UIKit

class CoinCell: UITableViewCell {

    static let identifier = "CoinCell"
    static func nib() -> UINib {
        return UINib(nibName: "CoinCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var amountText: UILabel!
    @IBOutlet weak var cryptoText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.roundAndShadow(radius: 10)
    }

    func setupCell(data : CryptoViewModel) {
        cryptoText.text = "Crypto Name : \(data.name)"
        amountText.text = "Crypto Price : \(data.price)"
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
