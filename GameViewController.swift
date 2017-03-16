//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Shaun Anderson on 16/03/2017.
//  Copyright © 2017 Shaun Anderson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var grid = [Int](arrayLiteral: 0,0,0,0,0,0,0,0,0)
    
    var isSpace = true
    var gameOn = true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var whoseTurn: Int = 1
    
    @IBOutlet weak var turnLabel: UILabel!
    
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
        
        turnLabel.text = "Player \(whoseTurn) Turn"
        CheckGrid()
        }
    }
    
    
    func CheckGrid()
    {
        //Make isSpace false and check against grid array to see if there are any spaces left
        isSpace = false
        
        if(grid[0] == 1 && grid[1] == 1 && grid[2] == 1)
        {
            gameOn = false
            restartButton.isHidden = false
            turnLabel.text = "PLAYER 1 wins"
        }
        for i in grid
        {
            print(i)
            if(i == 0)
            {
                isSpace = true
            }
        }
        
        if(!isSpace)
        {
            turnLabel.text = "No spaces left - TIE"
        }
        
    }
    
    @IBOutlet weak var restartButton: UIButton!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
