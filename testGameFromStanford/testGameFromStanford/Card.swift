//
//  Card.swift
//  testGameFromStanford
//
//  Created by Konstantine Tsirgvava on 12/1/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp  = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0;
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
