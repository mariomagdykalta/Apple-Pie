//
//  ViewController.swift
//  Apple pie
//
//  Created by mario on 26/08/2024.
//

import UIKit

var listofwords = ["buccaneer",
                   "incandescent",
                   "swift",
                   "glorious",
                   "bug",
                   "program"]

let incorrectMovesAllowed = 7

class ViewController: UIViewController {
    
    var totalwins = 0 {
        didSet {
            newRound ()
        }
    }
    var totalLosses = 0 {
    didSet {
        newRound ()
    }
}

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }

    var currentGame: Game!
    
    func newRound() {
        if !listofwords.isEmpty {
            let newword = listofwords.removeFirst()
            currentGame = Game(word: newword, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }else {
            enableLetterButtons(false)

        }
    }
    
    func enableLetterButtons(_ enable : Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        
        var letters = [String]()
        for letter in currentGame.formattedword {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: "  ")
        correctWordLabel.text = wordWithSpacing
        
        correctWordLabel.text = currentGame.formattedword
        scoreLabel.text = "Wins: \(totalwins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word
                        == currentGame.formattedword {
                totalwins += 1
            } else {
                updateUI()
            }
        }
    
}

