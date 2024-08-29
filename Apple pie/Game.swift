//
//  Game.swift
//  Apple pie
//
//  Created by mario on 28/08/2024.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
    var formattedword: String {
        var guessedword = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedword += "\(letter)"
            } else {
                guessedword += "_"
                }
    }
    return guessedword
}
}
