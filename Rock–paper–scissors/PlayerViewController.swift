//
//  PlayerViewController.swift
//  Rock–paper–scissors
//
//  Created by Mert Demirezen on 1.06.2019.
//  Copyright © 2019 Mert Demirezen. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    //IBVARIABLES-----------=========================------------
    var winner = "Scoreless"
    var gamePoint = 10 {
        willSet (newGame){
            gamePointText.text = "Game: \(newGame)"
        }
    }
    
    var computerPoint = 0 {
        willSet (newPoint) {
            computerPointText.text = "\(newPoint)"
        }
        
    }
    var playerPoint = 0 {
        willSet (newPointp) {
            playerPointText.text  = "\(newPointp)"
        }
    }
    var choices = ["Rock","Paper","Scissors"]
    var playerCh1 = 9
    var playerChh2 = 9
    
    
    //IBOUTLETSS-----------=========================------------
    
    @IBOutlet weak var gamePointText: UILabel!
    @IBOutlet weak var computerPointText: UILabel!
    @IBOutlet weak var playerPointText: UILabel!
    @IBOutlet weak var mark: UILabel!
    
    @IBOutlet weak var playerChoice: UILabel!
    @IBOutlet weak var computerChoice: UILabel!
    
    @IBOutlet weak var whoWin: UILabel!
    @IBOutlet var gameArray: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mark.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    // MARK: - Navigation-----------=========================------------
    
    @IBAction func finishedGame(_ sender: Any) {
        self.finished()
    }
    
    
    //IBACTIONS-----------=========================------------
    
    
    @IBAction func clickedMoves(_ sender: UIButton) {
      
        let playerCh = sender.tag
        playerCh1 = playerCh
       
        
    }
    
    @IBAction func didPassBack (_ sender : UIStoryboardSegue){
        guard let secondPlayerVc = sender.source as? SecondPlayerViewController else { return }
        playerChh2 = secondPlayerVc.secondChoice
       
        self.showResult()
        game(PlayerMove: playerCh1, SecondPlayer: playerChh2)
    }
    
    
    @objc func showResult() {
        
        print("First  : \(playerCh1)")
        print("Second : \(playerChh2)")
    }
    
    
    @objc func game (PlayerMove pm : Int , SecondPlayer sp : Int) {
        
        if pm == 0 && sp == 0 {
            whoWin.text = "Scoreless"
            gamePoint -= 1
            finishedCheck()
        }
        else if pm == 0 && sp == 1 {
            whoWin.text = "Secon Player Win"
            self.computerPoint += 1
            gamePoint -= 1
            finishedCheck()
        }
        else if pm == 0 && sp == 2 {
            whoWin.text = "Player Win"
            self.playerPoint += 1
            gamePoint -= 1
            finishedCheck()
        }
        else if pm == 1 && sp == 1 {
            whoWin.text = "Scoreless"
            gamePoint -= 1
            finishedCheck()
        }
        else if pm == 1 && sp == 0 {
            whoWin.text = "Player Win"
            self.playerPoint += 1
            gamePoint -= 1
            finishedCheck()
        }
        else if pm == 1 && sp == 2 {
            whoWin.text = "Secon Player Win"
            self.computerPoint += 1
            gamePoint -= 1
            finishedCheck()
            
        }
        else if pm == 2 && sp == 2 {
            whoWin.text = "Scoreless"
            gamePoint -= 1
            finishedCheck()
        }
        else if pm == 2 && sp == 0 {
            whoWin.text = "Secon Player Win"
            self.computerPoint += 1
            gamePoint -= 1
            finishedCheck()
        }
        else if pm == 2 && sp == 1 {
            whoWin.text = "Player Win"
            self.playerPoint += 1
            gamePoint -= 1
            finishedCheck()
        }
        else {
            print("Error Moving")
        }
        
    }
    @objc func win () {
        if playerPoint > computerPoint {
            winner = "Player Win"
        }else if computerPoint > playerPoint {
            winner = "Computer Win"
        }
        else {
            winner = "Scoreless"
        }
    }
    @objc func gameOver () {
        
        let alert = UIAlertController (title: "Game Over", message: "\(winner)!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            self.finished()
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func finished () {
        playerPoint = 0
        computerPoint = 0
        playerChoice.text = ""
        computerChoice.text = ""
        whoWin.text = ""
        performSegue(withIdentifier: "goBack", sender: nil)
    }
    
    @objc func finishedCheck () {
        if gamePoint < 1 {
            win()
            gameOver()
            
        }
    }
    
    
    
    
    
    
}
