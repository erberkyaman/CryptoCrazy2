//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Erberk Yaman on 23.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableview: UITableView!
    private var cryptoListViewModel : CryptoListModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(CoinCell.nib(), forCellReuseIdentifier: CoinCell.identifier)
        
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                
                self.cryptoListViewModel = CryptoListModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableview.reloadData()
            }
                  
            }
        }
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as! CoinCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoIndex(indexPath.row)
        cell.setupCell(data: cryptoViewModel)
        
        return cell
    }

}

extension UIView {
    func roundAndShadow(radius: CGFloat) {
        self.layer.shadowColor = UIColor.black.cgColor
        //        self.layer.shadowColor = self.backgroundColor?.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 7)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 3.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = radius
    }
}
