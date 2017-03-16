//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Shaun Anderson on 16/03/2017.
//  Copyright © 2017 Shaun Anderson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
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
    
    
    var grid = [Int](arrayLiteral: 0,0,0,0,0,0,0,0,0)
    
    var isSpace = true
    var gameOn = true
    var whoseTurn: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ButtonPressed(_ sender: UIButton)
    {
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
                    sender.setImage(UIImage (named: "Cross"), for: .normal)
                    whoseTurn = 2
                }
                else
                {
                    sender.setImage(UIImage (named: "Circle"), for: .normal)
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
                    sender.setImage(UIImage (named: "Cross"), for: .normal)
                    whoseTurn = 2
                }
                else
                {
                    sender.setImage(UIImage (named: "Circle"), for: .normal)
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
                    sender.setImage(UIImage (named: "Cross"), for: .normal)
                    whoseTurn = 2
                }
                else
                {
                    sender.setImage(UIImage (named: "Circle"), for: .normal)
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
                    sender.setImage(UIImage (named: "Cross"), for: .normal)
                    whoseTurn = 2
                }
                else
                {
                    sender.setImage(UIImage (named: "Circle"), for: .normal)
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
                    sender.setImage(UIImage (named: "Cross"), for: .normal)
                    whoseTurn = 2
                }
                else
                {
                    sender.setImage(UIImage (named: "Circle"), for: .normal)
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
                    sender.setImage(UIImage (named: "Cross"), for: .normal)
                    whoseTurn = 2
                }
                else
                {
                    sender.setImage(UIImage (named: "Circle"), for: .normal)
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
                    sender.setImage(UIImage (named: "Cross"), for: .normal)
                    whoseTurn = 2
                }
                else
                {
                    sender.setImage(UIImage (named: "Circle"), for: .normal)
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
                    sender.setImage(UIImage (named: "Cross"), for: .normal)
                    whoseTurn = 2
                }
                else
                {
                    sender.setImage(UIImage (named: "Circle"), for: .normal)
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
                    sender.setImage(UIImage (named: "Cross"), for: .normal)
                    whoseTurn = 2
                }
                else
                {
                    sender.setImage(UIImage (named: "Circle"), for: .normal)
                    whoseTurn = 1
                }
            }
        default:
            print("hi")
        }
        
        //Check if game has ended and if not display next players name.
        if(gameOn)
        {
        turnLabel.text = "Player \(whoseTurn) Turn"
        }
        }
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
            turnLabel.text = "PLAYER 1 wins"
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
            print(i)
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
        }
        
    }
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBAction func restartGame(_ sender: UIButton)
    {
        gameOn = true
        restartButton.isHidden = true
        grid = [Int](arrayLiteral: 0,0,0,0,0,0,0,0,0)
        turnLabel.text = "Player 1 Turn"
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
