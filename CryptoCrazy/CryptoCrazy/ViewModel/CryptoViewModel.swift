//
//  CryptoViewModel.swift
//  CryptoCrazy
//
//  Created by Erberk Yaman on 6.06.2023.
//

import Foundation

struct CryptoListModel {
    let cryptoCurrencyList : [CryptoCurrency]
    
}

extension CryptoListModel {
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
        
    }
    
    func cryptoIndex (_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}


struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    
}

extension CryptoViewModel {
    var name : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }

}
