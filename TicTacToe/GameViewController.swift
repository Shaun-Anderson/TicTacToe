//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Shaun Anderson on 16/03/2017.
//  Copyright © 2017 Shaun Anderson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var tieLabel: UILabel!
    
    //MARK: Variables
    var grid = [Int](arrayLiteral: 0,0,0,0,0,0,0,0,0)
    var isSpace = true
    var gameOn = true
    var whoseTurn: Int = 1
    var tie: Int = 0
    
    //MARK: Actions
    @IBAction func ButtonPressed(_ sender: UIButton)
    {
        //Called when a button on the grid is pressed and will change the image and value in array to the specific player.
        if(gameOn == true)
        {
            switch sender.tag
            {
            case 0:
                //Check if a player or the computer has not already taken this node of the grid and then change its value and image to reflect the player.
                if(grid[0] == 0)
                {
                    
                    grid[0] = whoseTurn
                    CheckGrid()
                    //Change Image of button
                    if(whoseTurn == 1)
                    {
                        sender.setImage(player1Image, for: .normal)
                        whoseTurn = 2
                    }
                    else
                    {
                        sender.setImage(player2Image, for: .normal)
                        whoseTurn = 1
                    }
                }
            case 1:
                if(grid[1] == 0)
                {
                    grid[1] = whoseTurn
                    CheckGrid()
                    //Change Image of button
                    if(whoseTurn == 1)
                    {
                        sender.setImage(player1Image, for: .normal)
                        whoseTurn = 2
                    }
                    else
                    {
                        sender.setImage(player2Image, for: .normal)
                        whoseTurn = 1
                    }
                }
            case 2:
                if(grid[2] == 0)
                {
                    grid[2] = whoseTurn
                    CheckGrid()
                    if(whoseTurn == 1)
                    {
                        sender.setImage(player1Image, for: .normal)
                        whoseTurn = 2
                    }
                    else
                    {
                        sender.setImage(player2Image, for: .normal)
                        whoseTurn = 1
                    }
                }
            case 3:
                if(grid[3] == 0)
                {
                    grid[3] = whoseTurn
                    CheckGrid()
                    if(whoseTurn == 1)
                    {
                        sender.setImage(player1Image, for: .normal)
                        whoseTurn = 2
                    }
                    else
                    {
                        sender.setImage(player2Image, for: .normal)
                        whoseTurn = 1
                    }
                }
                
            case 4:
                if(grid[4] == 0)
                {
                    grid[4] = whoseTurn
                    CheckGrid()
                    //Change Image of button
                    if(whoseTurn == 1)
                    {
                        sender.setImage(player1Image, for: .normal)
                        whoseTurn = 2
                    }
                    else
                    {
                        sender.setImage(player2Image, for: .normal)
                        whoseTurn = 1
                    }
                }
                
                
            case 5:
                if(grid[5] == 0)
                {
                    grid[5] = whoseTurn
                    CheckGrid()
                    //Change Image of button
                    if(whoseTurn == 1)
                    {
                        sender.setImage(player1Image, for: .normal)
                        whoseTurn = 2
                    }
                    else
                    {
                        sender.setImage(player2Image, for: .normal)
                        whoseTurn = 1
                    }
                }
            case 6:
                if(grid[6] == 0)
                {
                    grid[6] = whoseTurn
                    CheckGrid()
                    //Change Image of button
                    if(whoseTurn == 1)
                    {
                        sender.setImage(player1Image, for: .normal)
                        whoseTurn = 2
                    }
                    else
                    {
                        sender.setImage(player2Image, for: .normal)
                        whoseTurn = 1
                    }
                }
            case 7:
                if(grid[7] == 0)
                {
                    grid[7] = whoseTurn
                    CheckGrid()
                    //Change Image of button
                    if(whoseTurn == 1)
                    {
                        sender.setImage(player1Image, for: .normal)
                        whoseTurn = 2
                    }
                    else
                    {
                        sender.setImage(player2Image, for: .normal)
                        whoseTurn = 1
                    }
                }
            case 8:
                if(grid[8] == 0)
                {
                    grid[8] = whoseTurn
                    CheckGrid()
                    //Change Image of button
                    if(whoseTurn == 1)
                    {
                        sender.setImage(player1Image, for: .normal)
                        whoseTurn = 2
                    }
                    else
                    {
                        sender.setImage(player2Image, for: .normal)
                        whoseTurn = 1
                    }
                }
            default:
                print("hi")
            }
            
            //Check if game has ended and if not display next players name.
            if(gameOn)
            {
                if(vsAI)
                {
                    gameOn = false
                    turnLabel.text = "AI's Turn"
                    
                    DispatchQueue.main.asyncAfter(
                        deadline: .now() + 0.5,
                        execute: {self.AITurn()})
                    
                }
                else
                {
                    turnLabel.text = "Player \(whoseTurn) Turn"
                }
            }
        }
    }
    @IBAction func restartGame(_ sender: UIButton)
    {
        gameOn = true
        restartButton.isHidden = true
        grid = [Int](arrayLiteral: 0,0,0,0,0,0,0,0,0)
        turnLabel.text = "Player 1 Turn"
        whoseTurn = 1
        //Reset Buttons
        button0.setImage(UIImage(), for: .normal)
        button1.setImage(UIImage(), for: .normal)
        button2.setImage(UIImage(), for: .normal)
        button3.setImage(UIImage(), for: .normal)
        button4.setImage(UIImage(), for: .normal)
        button5.setImage(UIImage(), for: .normal)
        button6.setImage(UIImage(), for: .normal)
        button7.setImage(UIImage(), for: .normal)
        button8.setImage(UIImage(), for: .normal)
    }
    
    //MARK: Functions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        player1NameLabel.text = "\(player1Name): \n \(player1Score)"
        player2NameLabel.text = "\(player2Name): \n \(player2Score)"
        tieLabel.text = "TIE: \n \(tie)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func AITurn()
    {
        
        //CHECK IF THE MIDDLE POINT IS TAKEN
        if(grid[4] == 0)
        {
            button4.setImage(player2Image, for: .normal)
            grid[4] = 2
        }
        
        //CHECK IF FOR TOP WIN FROM PLAYER
        if(grid[0] == 1 && grid[1] == 1)
        {
            button2.setImage(player2Image, for: .normal)
            grid[2] = 2
        }
        if(grid[1] == 1 && grid[2] == 1)
        {
            button0.setImage(player2Image, for: .normal)
            grid[0] = 2
        }
        if(grid[0] == 1 && grid[2] == 1)
        {
            button1.setImage(player2Image, for: .normal)
            grid[1] = 2
        }
        
        //CHECK FOR HORIZONAL MIDDLE WIN FROM PLAYER
        if(grid[3] == 1 && grid[4] == 1)
        {
            button5.setImage(player2Image, for: .normal)
            grid[5] = 2
        }
        
        whoseTurn = 1;
        turnLabel.text = "Player \(whoseTurn) Turn"
        gameOn = true
        CheckGrid()
    }
    
    func CheckGrid()
    {
        //Make isSpace false and check against grid array to see if there are any spaces left
        isSpace = false
        
        
        //HORIZONTAL TOP CHECK
        if(grid[0] == whoseTurn && grid[1] == whoseTurn && grid[2] == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            if(whoseTurn == 1)
            {
                turnLabel.text = "\(player1Name) wins"
                player1Score += 1
                player1NameLabel.text = "\(player1Name): \(player1Score)"
            }
            else
            {
                turnLabel.text = "\(player2Name) wins"
                player2Score += 1
                player2NameLabel.text = "\(player2Name): \(player2Score)"            }
        }
        
        //HORIZONAL MIDDLE CHECK
        if(grid[3] == whoseTurn && grid[4] == whoseTurn && grid[5] == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            turnLabel.text = "PLAYER 1 wins"
        }
        
        //HORIZONTAL BOTTON CHECK
        
        
        
        //Check if a space is still clear
        for i in grid
        {
            if(i == 0)
            {
                isSpace = true
            }
        }
        // if no space is found it is a draw
        if(!isSpace)
        {
            gameOn = false
            restartButton.isHidden = false
            turnLabel.text = "No spaces left - TIE"
            tie += 1
            tieLabel.text = "TIE: \n \(tie)"
        }
        
    }
    

}
