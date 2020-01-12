//
//  CardViewModel.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/20/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import Foundation

 
struct CardViewModel {
    
    private(set) var cardNumber: String = ""
    private var cardHolderName: String = ""
    private var expYear: String = ""
    private var expMonth: String = ""
    
    mutating func updateCardNumber(cardNumber: String, cardHolderName: String, expYear: String, expMonth: String){
        
        self.cardNumber = cardNumber
        self.cardHolderName = cardHolderName
        self.expYear = expYear
        self.expMonth = expMonth
    }
  
    
    
    
    
}
