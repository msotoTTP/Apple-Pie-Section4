//
//  ViewController.swift
//  Apple Pie Section4
//
//  Created by Mathew Soto on 4/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["disaster", "weigh", "wording", "leader", "haunt"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        correctWordLabel.text = currentGame.formattedWord
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
        //figure out the guessed letter
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        
        //figure out if the letter is in the word the player is guessing
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
    
}

