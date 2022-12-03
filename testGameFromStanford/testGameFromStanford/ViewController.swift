//
//  ViewController.swift
//  testGameFromStanford
//
//  Created by Konstantine Tsirgvava on 11/29/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//
import UIKit


class ViewController: UIViewController {
    
    var game = Concentration(numberOfPairsOfCards: 16)
    var emojiChoices = ["🦄","🐞","🐵","🐙","🐸","🐷","🐮","🦁", "🐶", "🐱", "🐭", "🐰", "🐻", "🐼", "🐨", "🐯"]
    var emoji = [Int:String]()
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func touchCard(_ sender: UIButton) {
       if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card chosen was not in cardButtons array")
        }
    }
   
  
    
    func updateViewFromModel () {
        flipCountLabel.text = "Flips: \(game.flipCount)"
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(getEmoji(for: card), for: UIControlState.normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    button.layer.cornerRadius = 10
            } else {
                    button.setTitle("", for: UIControlState.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 0.9574747682, green: 0.7261081338, blue: 0.4274374545, alpha: 1)
                    button.layer.cornerRadius = 10
                }
            }
        }
            
   
    
    func getEmoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
            
            
            
}
    





