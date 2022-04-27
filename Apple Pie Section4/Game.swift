//
//  Game.swift
//  Apple Pie Section4
//
//  Created by Mathew Soto on 4/25/22.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        
        for char in word {
            if guessedLetters.contains(char) {
                guessedWord.append(char)
            } else {
                guessedWord.append("_")
            }
            guessedWord.append(" ")
        }
        
        return guessedWord
    }
    var formattedWordWithoutSpaces: String {
        var guessedWord = ""
        
        for char in word {
            if guessedLetters.contains(char) {
                guessedWord.append(char)
            } else {
                guessedWord.append("_")
            }
        }
        
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
