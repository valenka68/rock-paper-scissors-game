//
//  ViewController.swift
//  game
//
//  Created by Валентина Буланова on 28.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ComputerLabel: UILabel!
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var RockButton: UIButton!
    @IBOutlet weak var ScissorsButton: UIButton!
    @IBOutlet weak var PaperButton: UIButton!
    @IBOutlet weak var PlayAgainButton: UIButton!
    var CurrentGameState = GameState.start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
        // Do any additional setup after loading the view.
    }

    func resetBoard () {
        ComputerLabel.text = "👩🏻‍🦰"
        StatusLabel.text = "Камень, ножницы или бумага?"
        RockButton.isHidden = false
        RockButton.isEnabled = true
        PaperButton.isHidden = false
        PaperButton.isEnabled = true
        ScissorsButton.isHidden = false
        ScissorsButton.isEnabled = true
        PlayAgainButton.isHidden = true
    }
    
    func play (_ playerTurn: Sign) {
        PaperButton.isEnabled = false
        RockButton.isEnabled = false
        ScissorsButton.isEnabled = false
        
        let opponent = randomSign()
        ComputerLabel.text = opponent.emogi
        
        let gameResult = playerTurn.takeTurn(opponent)
        switch gameResult {
        case .draw:
            StatusLabel.text = "Ничья"
        case .loose:
            StatusLabel.text = "Вы проиграли"
        case .win:
            StatusLabel.text = "Вы победили"
        case .start:
            StatusLabel.text = "Камень, ножницы или бумага?"
        }
        switch playerTurn {
        case .paper:
            PaperButton.isHidden = false
            RockButton.isHidden = true
            ScissorsButton.isHidden = true
        case .rock:
            PaperButton.isHidden = true
            RockButton.isHidden = false
            ScissorsButton.isHidden = true
        case .scissors:
            PaperButton.isHidden = true
            RockButton.isHidden = true
            ScissorsButton.isHidden = false
        }
        PlayAgainButton.isHidden = false
    }
    
    @IBAction func PlayAgainSelected(_ sender: Any) {
        resetBoard()
    }
    @IBAction func RockSelected(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func ScissorsSelected(_ sender: Any) {
        play(Sign.scissors)
    }
    @IBAction func PaperSelected(_ sender: Any) {
        play(Sign.paper)
    }
    
}

