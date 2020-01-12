//
//  StringExtension.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/5/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import Foundation

extension String {
    
    func checkPlural(count: Int, word: String) -> String {
        
        var filterWord = "\(count) \(word)"
        
        if  count > 1{
            
            switch word.lowercased() {
            case "adult":
                filterWord = "\(count) Adults"
            case "child":
                filterWord = "\(count) Children"
            case "infant":
                filterWord =  "\(count) Infants"
            default:
                return filterWord
            }
            
        }
        
        return filterWord
    }
    
}
