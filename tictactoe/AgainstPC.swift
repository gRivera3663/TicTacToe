//
//  AgainstPC.swift
//  tictactoe
//
//  Created by Gabriel Rivera on 1/16/21.
//

import Foundation
import UIKit

class AgainstPC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "Player's Move"
    }
    
    var gameActive = true
    var didPCWin = true
    var xImage = UIImage(named: "x.png")
    var oImage = UIImage(named: "o.png")
    var spacesAvailable = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    var pcMoves: [Int] = []
    var userMoves: [Int] = []
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
    @IBOutlet var statusLabel: UILabel!
    
    func computerMove(){
        guard gameActive == true else {
            print("Game Over!")
            if didPCWin {
                statusLabel.text = "PC Wins!"
            } else {
                statusLabel.text = "Player Wins!"
            }
            return
        }
        let spaceChoice = spacesAvailable[Int.random(in: 0..<spacesAvailable.count)]
        
        /*
        if (pcMoves.count == 0){
            spaceChoice = Int.random(in: 0..<spacesAvailable.count)
        } else {
            for x in winningMoves{
                for y in pcMoves{
                    if x.contains(y){
                        let index = Int.random(in: 0..<3)
                        if !pcMoves.contains(x[index]){
                            spaceChoice = x[index]
                            break
                        }
                    }
                }
            }
        }
        */

        switch(spaceChoice){
        case 0:
            square0.setImage(oImage, for: .normal)
            print("PC went to square 0")
        case 1:
            square1.setImage(oImage, for: .normal)
            print("PC went to square 1")
        case 2:
            square2.setImage(oImage, for: .normal)
            print("PC went to square 2")
        case 3:
            square3.setImage(oImage, for: .normal)
            print("PC went to square 3")
        case 4:
            square4.setImage(oImage, for: .normal)
            print("PC went to square 4")
        case 5:
            square5.setImage(oImage, for: .normal)
            print("PC went to square 5")
        case 6:
            square6.setImage(oImage, for: .normal)
            print("PC went to square 6")
        case 7:
            square7.setImage(oImage, for: .normal)
            print("PC went to square 7")
        case 8:
            square8.setImage(oImage, for: .normal)
            print("PC went to square 8")
        default:
            print("oof")
        }
        
        spacesAvailable.remove(at: findIndexOfSpace(spaceChoice))
        pcMoves.append(spaceChoice)
        if pcMoves.count >= 3 {
            checkForWin(pcMoves, true)
        }
        if gameActive{
            statusLabel.text = "Player's Move"
        }
    }
    
    func checkForWin(_ moves: [Int], _ isItPCMove: Bool){
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
                if isItPCMove {
                    colorWinningSpaces(x)
                    statusLabel.text = "PC Wins!"
                    gameActive = false
                    print("PC Wins!")
                } else {
                    colorWinningSpaces(x)
                    statusLabel.text = "Player Wins!"
                    gameActive = false
                    didPCWin = false
                    print("Player Wins!")
                }
            }
        }
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
    
    @IBAction func square0Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        print("square 0 pressed")
        square0.setImage(xImage, for: .normal)
        spacesAvailable.remove(at: findIndexOfSpace(0))
        userMoves.append(0)
        if userMoves.count >= 3 {
            checkForWin(userMoves, false)
        }
        statusLabel.text = "PC's Move"
        computerMove()
    }
    
    @IBAction func square1Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        print("square 1 pressed")
        square1.setImage(xImage, for: .normal)
        spacesAvailable.remove(at: findIndexOfSpace(1))
        userMoves.append(1)
        if userMoves.count >= 3 {
            checkForWin(userMoves, false)
        }
        statusLabel.text = "PC's Move"
        computerMove()
    }
    
    @IBAction func square2Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        print("square 2 pressed")
        square2.setImage(xImage, for: .normal)
        spacesAvailable.remove(at: findIndexOfSpace(2))
        userMoves.append(2)
        if userMoves.count >= 3 {
            checkForWin(userMoves, false)
        }
        statusLabel.text = "PC's Move"
        computerMove()
        
    }
    
    @IBAction func square3Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        print("square 3 pressed")
        square3.setImage(xImage, for: .normal)
        spacesAvailable.remove(at: findIndexOfSpace(3))
        userMoves.append(3)
        if userMoves.count >= 3 {
            checkForWin(userMoves, false)
        }
        statusLabel.text = "PC's Move"
        computerMove()
    }
    
    @IBAction func square4Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        print("square 4 pressed")
        square4.setImage(xImage, for: .normal)
        spacesAvailable.remove(at: findIndexOfSpace(4))
        userMoves.append(4)
        if userMoves.count >= 3 {
            checkForWin(userMoves, false)
        }
        statusLabel.text = "PC's Move"
        computerMove()
    }
    
    @IBAction func square5Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        print("square 5 pressed")
        square5.setImage(xImage, for: .normal)
        spacesAvailable.remove(at: findIndexOfSpace(5))
        userMoves.append(5)
        if userMoves.count >= 3 {
            checkForWin(userMoves, false)
        }
        statusLabel.text = "PC's Move"
        computerMove()
    }
    
    @IBAction func square6Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        print("square 6 pressed")
        square6.setImage(xImage, for: .normal)
        spacesAvailable.remove(at: findIndexOfSpace(6))
        userMoves.append(6)
        if userMoves.count >= 3 {
            checkForWin(userMoves, false)
        }
        statusLabel.text = "PC's Move"
        computerMove()
    }
    
    @IBAction func square7Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        print("square 7 pressed")
        square7.setImage(xImage, for: .normal)
        spacesAvailable.remove(at: findIndexOfSpace(7))
        userMoves.append(7)
        if userMoves.count >= 3 {
            checkForWin(userMoves, false)
        }
        statusLabel.text = "PC's Move"
        computerMove()
    }
    
    @IBAction func square8Pressed(_ sender: Any) {
        guard gameActive == true else {
            print("Game Over!")
            return
        }
        
        print("square 8 pressed")
        square8.setImage(xImage, for: .normal)
        spacesAvailable.remove(at: findIndexOfSpace(8))
        userMoves.append(8)
        if userMoves.count >= 3 {
            checkForWin(userMoves, false)
        }
        statusLabel.text = "PC's Move"
        computerMove()
    }
}
