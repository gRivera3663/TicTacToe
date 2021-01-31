//
//  TwoPlayer.swift
//  tictactoe
//
//  Created by Gabriel Rivera on 1/27/21.
//

import Foundation
import UIKit

class TwoPlayer: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "Player 1's Turn"
    }
    
    var gameActive = true
    var didPlayer1Win = true
    var isItPlayer1Turn = true
    var xImage = UIImage(named: "x.png")
    var oImage = UIImage(named: "o.png")
    var spacesAvailable = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    var player1Moves: [Int] = []
    var player2Moves: [Int] = []
    var winningMoves = [
        [0, 1, 2],
        [6, 7, 8],
        [2, 5, 8],
        [0, 3, 6],
        [0, 4, 8],
        [2, 4, 6],
        [1, 4, 7],
        [3, 4, 5]
    ]
    
    @IBOutlet var statusLabel: UILabel!
    
    /*
     Formatting of tic tac toe board
     0 1 2
     3 4 5
     6 7 8
     */
    @IBOutlet var square0: UIButton!
    @IBOutlet var square1: UIButton!
    @IBOutlet var square2: UIButton!
    @IBOutlet var square3: UIButton!
    @IBOutlet var square4: UIButton!
    @IBOutlet var square5: UIButton!
    @IBOutlet var square6: UIButton!
    @IBOutlet var square7: UIButton!
    @IBOutlet var square8: UIButton!
    
    func checkForWin(_ moves: [Int]){
        for x in winningMoves{
            if (moves.count >= 3 && x.contains(moves[0]) && x.contains(moves[1]) && x.contains(moves[2])) ||
                (moves.count >= 4 && x.contains(moves[1]) && x.contains(moves[2]) && x.contains(moves[3])) ||
                (moves.count >= 4 && x.contains(moves[0]) && x.contains(moves[2]) && x.contains(moves[3])) ||
                (moves.count >= 4 && x.contains(moves[0]) && x.contains(moves[1]) && x.contains(moves[3])) ||
                (moves.count >= 5 && x.contains(moves[2]) && x.contains(moves[3]) && x.contains(moves[4])) ||
                (moves.count >= 5 && x.contains(moves[1]) && x.contains(moves[3]) && x.contains(moves[4])) ||
                (moves.count >= 5 && x.contains(moves[0]) && x.contains(moves[3]) && x.contains(moves[4])) ||
                (moves.count >= 5 && x.contains(moves[0]) && x.contains(moves[1]) && x.contains(moves[4])) ||
                (moves.count >= 5 && x.contains(moves[0]) && x.contains(moves[2]) && x.contains(moves[4])) ||
                (moves.count >= 5 && x.contains(moves[1]) && x.contains(moves[2]) && x.contains(moves[4])){
                if isItPlayer1Turn {
                    colorWinningSpaces(x)
                    gameActive = false
                    print("Player 1 Wins!")
                } else {
                    colorWinningSpaces(x)
                    gameActive = false
                    didPlayer1Win = false
                    print("Player 2 Wins!")
                }
            }
        }
    }
    
    func updateLabelForWin(){
        if didPlayer1Win && !gameActive{
            statusLabel.text = "Player 1 Wins!"
        } else if !didPlayer1Win && !gameActive{
            statusLabel.text = "Player 2 Wins!"
        } else if spacesAvailable.count == 0 && gameActive{
            statusLabel.text = "It's a tie!"
        }
    }
    
    func findIndexOfSpace(_ space: Int) -> Int{
        var index = 0
        for x in spacesAvailable{
            if x == space{
                break
            }
            index += 1
        }
        return index
    }
    
    func colorWinningSpaces (_ spaces: [Int]){
        for x in spaces{
            switch(x){
            case 0:
                square0.backgroundColor = UIColor.yellow
            case 1:
                square1.backgroundColor = UIColor.yellow
            case 2:
                square2.backgroundColor = UIColor.yellow
            case 3:
                square3.backgroundColor = UIColor.yellow
            case 4:
                square4.backgroundColor = UIColor.yellow
            case 5:
                square5.backgroundColor = UIColor.yellow
            case 6:
                square6.backgroundColor = UIColor.yellow
            case 7:
                square7.backgroundColor = UIColor.yellow
            case 8:
                square8.backgroundColor = UIColor.yellow
            default:
                print("oof")
            }
        }
    }
    
    @IBAction func square0Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        guard spacesAvailable.contains(0) == true else {
            print("Please select another space")
            return
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(0))
        
        if isItPlayer1Turn{
            player1Moves.append(0)
            square0.setImage(xImage, for: .normal)
            if player1Moves.count >= 3{
                checkForWin(player1Moves)
            }
            isItPlayer1Turn = false
            statusLabel.text = "Player 2's Turn"
        } else {
            player2Moves.append(0)
            square0.setImage(oImage, for: .normal)
            if player2Moves.count >= 3{
                checkForWin(player2Moves)
            }
            isItPlayer1Turn = true
            statusLabel.text = "Player 1's Turn"
        }
        
        updateLabelForWin()
    }
    
    @IBAction func square1Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        guard spacesAvailable.contains(1) == true else {
            print("Please select another space")
            return
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(1))
        
        if isItPlayer1Turn{
            player1Moves.append(1)
            square1.setImage(xImage, for: .normal)
            if player1Moves.count >= 3{
                checkForWin(player1Moves)
            }
            isItPlayer1Turn = false
            statusLabel.text = "Player 2's Turn"
        } else {
            player2Moves.append(1)
            square1.setImage(oImage, for: .normal)
            if player2Moves.count >= 3{
                checkForWin(player2Moves)
            }
            isItPlayer1Turn = true
            statusLabel.text = "Player 1's Turn"
        }
        
        updateLabelForWin()
    }
    
    @IBAction func square2Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        guard spacesAvailable.contains(2) == true else {
            print("Please select another space")
            return
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(2))
        
        if isItPlayer1Turn{
            player1Moves.append(2)
            square2.setImage(xImage, for: .normal)
            if player1Moves.count >= 3{
                checkForWin(player1Moves)
            }
            isItPlayer1Turn = false
            statusLabel.text = "Player 2's Turn"
        } else {
            player2Moves.append(2)
            square2.setImage(oImage, for: .normal)
            if player2Moves.count >= 3{
                checkForWin(player2Moves)
            }
            isItPlayer1Turn = true
            statusLabel.text = "Player 1's Turn"
        }
        
        updateLabelForWin()
    }
    
    @IBAction func square3Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        guard spacesAvailable.contains(3) == true else {
            print("Please select another space")
            return
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(3))
        
        if isItPlayer1Turn{
            player1Moves.append(3)
            square3.setImage(xImage, for: .normal)
            if player1Moves.count >= 3{
                checkForWin(player1Moves)
            }
            isItPlayer1Turn = false
            statusLabel.text = "Player 2's Turn"
        } else {
            player2Moves.append(3)
            square3.setImage(oImage, for: .normal)
            if player2Moves.count >= 3{
                checkForWin(player2Moves)
            }
            isItPlayer1Turn = true
            statusLabel.text = "Player 1's Turn"
        }
        
        updateLabelForWin()
    }
    
    @IBAction func square4Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        guard spacesAvailable.contains(4) == true else {
            print("Please select another space")
            return
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(4))
        
        if isItPlayer1Turn{
            player1Moves.append(4)
            square4.setImage(xImage, for: .normal)
            if player1Moves.count >= 3{
                checkForWin(player1Moves)
            }
            isItPlayer1Turn = false
            statusLabel.text = "Player 2's Turn"
        } else {
            player2Moves.append(4)
            square4.setImage(oImage, for: .normal)
            if player2Moves.count >= 3{
                checkForWin(player2Moves)
            }
            isItPlayer1Turn = true
            statusLabel.text = "Player 1's Turn"
        }
        
        updateLabelForWin()
    }
    
    @IBAction func square5Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        guard spacesAvailable.contains(5) == true else {
            print("Please select another space")
            return
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(5))
        
        if isItPlayer1Turn{
            player1Moves.append(5)
            square5.setImage(xImage, for: .normal)
            if player1Moves.count >= 3{
                checkForWin(player1Moves)
            }
            isItPlayer1Turn = false
            statusLabel.text = "Player 2's Turn"
        } else {
            player2Moves.append(5)
            square5.setImage(oImage, for: .normal)
            if player2Moves.count >= 3{
                checkForWin(player2Moves)
            }
            isItPlayer1Turn = true
            statusLabel.text = "Player 1's Turn"
        }
        
        updateLabelForWin()
    }
    
    @IBAction func square6Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        guard spacesAvailable.contains(6) == true else {
            print("Please select another space")
            return
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(6))
        
        if isItPlayer1Turn{
            player1Moves.append(6)
            square6.setImage(xImage, for: .normal)
            if player1Moves.count >= 3{
                checkForWin(player1Moves)
            }
            isItPlayer1Turn = false
            statusLabel.text = "Player 2's Turn"
        } else {
            player2Moves.append(6)
            square6.setImage(oImage, for: .normal)
            if player2Moves.count >= 3{
                checkForWin(player2Moves)
            }
            isItPlayer1Turn = true
            statusLabel.text = "Player 1's Turn"
        }
        
        updateLabelForWin()
    }
    
    @IBAction func square7Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        guard spacesAvailable.contains(7) == true else {
            print("Please select another space")
            return
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(7))
        
        if isItPlayer1Turn{
            player1Moves.append(7)
            square7.setImage(xImage, for: .normal)
            if player1Moves.count >= 3{
                checkForWin(player1Moves)
            }
            isItPlayer1Turn = false
            statusLabel.text = "Player 2's Turn"
        } else {
            player2Moves.append(7)
            square7.setImage(oImage, for: .normal)
            if player2Moves.count >= 3{
                checkForWin(player2Moves)
            }
            isItPlayer1Turn = true
            statusLabel.text = "Player 1's Turn"
        }
        
        updateLabelForWin()
    }
    
    @IBAction func square8Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        guard spacesAvailable.contains(8) == true else {
            print("Please select another space")
            return
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(8))
        
        if isItPlayer1Turn{
            player1Moves.append(8)
            square8.setImage(xImage, for: .normal)
            if player1Moves.count >= 3{
                checkForWin(player1Moves)
            }
            isItPlayer1Turn = false
            statusLabel.text = "Player 2's Turn"
        } else {
            player2Moves.append(8)
            square8.setImage(oImage, for: .normal)
            if player2Moves.count >= 3{
                checkForWin(player2Moves)
            }
            isItPlayer1Turn = true
            statusLabel.text = "Player 1's Turn"
        }
        
        updateLabelForWin()
    }
}
