//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Shaun Anderson on 16/03/2017.
//  Copyright © 2017 Shaun Anderson. All rights reserved.
//

import UIKit
import CoreData

class GameViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    //MARK: Properties

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var tieLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    
    //MARK: Variables
    var isSpace = true
    var gameOn = true
    var whoseTurn: Int = 1
    var tie: Int = 0
    var player1Score = 0
    var player2Score = 0
    var aiHelp : [Int] = [0,1,2,3,4,5,6,7,8]
    
    //MARK: Actions
    @IBAction func restartGame(_ sender: UIButton)
    {
        gameOn = true
        restartButton.isHidden = true
        
        player2NameLabel.backgroundColor = UIColor.clear
        player1NameLabel.backgroundColor = UIColor (colorLiteralRed: 46/255.0, green: 11/255.0, blue: 49/255.0, alpha: 2.0)
        
        turnLabel.text = "Player 1 Turn"
        turnLabel.font = turnLabel.font.withSize(17)
        whoseTurn = 1
        
        //Reset Buttons
        for button in buttons
        {
            button.setImage(UIImage(), for: .normal)
            button.tag = 0
            button.isUserInteractionEnabled = true
            button.backgroundColor = UIColor.clear
        }
    }
    
    //MARK: Functions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        player1NameLabel.text = "\(player1Name): \n \(player1Score)"
        player1NameLabel.backgroundColor = UIColor (colorLiteralRed: 46/255.0, green: 11/255.0, blue: 49/255.0, alpha: 1.0)
        player2NameLabel.text = "\(player2Name): \n \(player2Score)"
        tieLabel.text = "TIE: \n \(tie)"
        
        //SET SCORES TO ZERO
        player1Score = 0
        player2Score = 0
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func AITurn()
    {
        var done = false
        
        while done != true
        {
            let randomInt = Int(arc4random_uniform(9))
            
            //Check for top potential win from player
            if(buttons[0].tag == 1 && buttons[1].tag == 1 && buttons[2].tag == 0)
            {
                buttons[2].setImage(player2Image, for: .normal)
                buttons[2].tag = 2
                done = true
                break
            }
            if(buttons[1].tag == 1 && buttons[2].tag == 1 && buttons[0].tag == 0)
            {
                buttons[0].setImage(player2Image, for: .normal)
                buttons[0].tag = 2
                done = true
                break
            }
            if(buttons[0].tag == 1 && buttons[2].tag == 1 && buttons[1].tag == 0)
            {
                buttons[1].setImage(player2Image, for: .normal)
                buttons[1].tag = 2
                done = true
                break
            }
            
            //CHECK FOR HORIZONAL MIDDLE WIN FROM PLAYER
            if(buttons[3].tag == 1 && buttons[4].tag == 1 && buttons[5].tag == 0)
            {
                buttons[5].setImage(player2Image, for: .normal)
                buttons[5].tag = 2
                done = true
                break
            }
            if(buttons[3].tag == 1 && buttons[5].tag == 1 && buttons[4].tag == 0)
            {
                buttons[4].setImage(player2Image, for: .normal)
                buttons[4].tag = 2
                done = true
                break
            }
            if(buttons[4].tag == 1 && buttons[5].tag == 1 && buttons[3].tag == 0)
            {
                buttons[3].setImage(player2Image, for: .normal)
                buttons[3].tag = 2
                done = true
                break
            }
            
            if(buttons[4].tag == 0)
            {
                buttons[4].setImage(player2Image, for: .normal)
                buttons[4].tag = 2
                done = true
            }
            else
            {
                if(buttons[randomInt].tag == 0)
                {
                    buttons[randomInt].setImage(player2Image, for: .normal)
                    buttons[randomInt].tag = 2
                    done = true
                }
            }
        }
        gameOn = true
        CheckGrid()
        if(gameOn == true)
        {
            player2NameLabel.backgroundColor = UIColor.white
            player1NameLabel.backgroundColor = UIColor.lightGray
            whoseTurn = 1;
            turnLabel.text = "Player \(whoseTurn) Turn"
        }

    }
    
    func CheckGrid()
    {
        //Make isSpace false and check against grid array to see if there are any spaces left
        isSpace = false
        print("hi")
        
        //HORIZONTAL TOP CHECK
        if(buttons[0].tag == whoseTurn && buttons[1].tag == whoseTurn && buttons[2].tag == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            exitButton.isHidden = false
            if(whoseTurn == 1)
            {
                turnLabel.text = "\(player1Name) wins"
                turnLabel.font = turnLabel.font.withSize(25)
                player1Score += 1
                player1NameLabel.text = "\(player1Name): \n \(player1Score)"
                save(name: "\(player1Name): \(player1Score) WIN | LOST \(player2Score): \(player2Name)\n")
                //Check which image was slected by player to select what color the background should be
                if(player1ImageName == "X")
                {
                    buttons[0].backgroundColor = UIColor.purple; buttons[1].backgroundColor = UIColor.purple; buttons[2].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[0].backgroundColor = UIColor.blue; buttons[1].backgroundColor = UIColor.blue; buttons[2].backgroundColor = UIColor.blue
                }
            }
            else
            {
                turnLabel.text = "\(player2Name) wins"
                player2Score += 1
                player2NameLabel.text = "\(player2Name): \n \(player2Score)"
                save(name: "\(player2Name): \(player2Score) WIN | LOST \(player1Score): \(player1Name)\n")
                
                if(player2ImageName == "X")
                {
                    buttons[0].backgroundColor = UIColor.purple
                    buttons[1].backgroundColor = UIColor.purple
                    buttons[2].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[0].backgroundColor = UIColor.blue
                    buttons[1].backgroundColor = UIColor.blue
                    buttons[2].backgroundColor = UIColor.blue
                }
            }
        }
        
        //HORIZONAL MIDDLE CHECK
        if(buttons[3].tag == whoseTurn && buttons[4].tag == whoseTurn && buttons[5].tag == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            exitButton.isHidden = false
            if(whoseTurn == 1)
            {
                turnLabel.text = "\(player1Name) wins"
                turnLabel.font = turnLabel.font.withSize(25)
                player1Score += 1
                player1NameLabel.text = "\(player1Name): \n \(player1Score)"
                save(name: "\(player1Name): \(player1Score) WIN | LOST \(player2Score): \(player2Name)\n")
                //Check which image was slected by player to select what color the background should be
                if(player1ImageName == "X")
                {
                    buttons[3].backgroundColor = UIColor.purple
                    buttons[4].backgroundColor = UIColor.purple
                    buttons[5].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[3].backgroundColor = UIColor.cyan
                    buttons[4].backgroundColor = UIColor.cyan
                    buttons[5].backgroundColor = UIColor.cyan
                }
            }
            else
            {
                turnLabel.text = "\(player2Name) wins"
                player2Score += 1
                player2NameLabel.text = "\(player2Name): \n \(player2Score)"
                save(name: "\(player2Name): \(player2Score) WIN | LOST \(player1Score): \(player1Name)\n")
                
                if(player2ImageName == "X")
                {
                    buttons[3].backgroundColor = UIColor.purple
                    buttons[4].backgroundColor = UIColor.purple
                    buttons[5].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[3].backgroundColor = UIColor.cyan
                    buttons[4].backgroundColor = UIColor.cyan
                    buttons[5].backgroundColor = UIColor.cyan
                }
            }
        }
        
        //HORIZONTAL BOTTON CHECK
        if(buttons[6].tag == whoseTurn && buttons[7].tag == whoseTurn && buttons[8].tag == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            exitButton.isHidden = false
            if(whoseTurn == 1)
            {
                turnLabel.text = "\(player1Name) wins"
                player1Score += 1
                player1NameLabel.text = "\(player1Name): \n \(player1Score)"
                save(name: "\(player1Name): \(player1Score) WIN | LOST \(player2Score): \(player2Name)\n")
            }
            else
            {
                turnLabel.text = "\(player2Name) wins"
                player2Score += 1
                player2NameLabel.text = "\(player2Name): \n \(player2Score)"
                save(name: "\(player2Name): \(player2Score) WIN | LOST \(player1Score): \(player1Name)\n")
            }
        }
        
        //VERTICAL LEFT CHECK
        if(buttons[0].tag == whoseTurn && buttons[3].tag == whoseTurn && buttons[6].tag == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            exitButton.isHidden = false
            if(whoseTurn == 1)
            {
                turnLabel.text = "\(player1Name) wins"
                player1Score += 1
                player1NameLabel.text = "\(player1Name): \n \(player1Score)"
                save(name: "\(player1Name): \(player1Score) WIN | LOST \(player2Score): \(player2Name)\n")
            }
            else
            {
                turnLabel.text = "\(player2Name) wins"
                player2Score += 1
                player2NameLabel.text = "\(player2Name): \n \(player2Score)"
                save(name: "\(player2Name): \(player2Score) WIN | LOST \(player1Score): \(player1Name)\n")
            }
        }
        
        //VERTICAL MIDDLE CHECK
        if(buttons[1].tag == whoseTurn && buttons[4].tag == whoseTurn && buttons[7].tag == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            exitButton.isHidden = false
            if(whoseTurn == 1)
            {
                turnLabel.text = "\(player1Name) wins"
                player1Score += 1
                player1NameLabel.text = "\(player1Name): \n \(player1Score)"
                save(name: "\(player1Name): \(player1Score) WIN | LOST \(player2Score): \(player2Name)\n")
            }
            else
            {
                turnLabel.text = "\(player2Name) wins"
                player2Score += 1
                player2NameLabel.text = "\(player2Name): \n \(player2Score)"
                save(name: "\(player2Name): \(player2Score) WIN | LOST \(player1Score): \(player1Name)\n")
            }
        }
        
        //VERTICAL RIGHT CHECK
        if(buttons[2].tag == whoseTurn && buttons[5].tag == whoseTurn && buttons[8].tag == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            exitButton.isHidden = false
            if(whoseTurn == 1)
            {
                turnLabel.text = "\(player1Name) wins"
                player1Score += 1
                player1NameLabel.text = "\(player1Name): \n \(player1Score)"
                save(name: "\(player1Name): \(player1Score) WIN | LOST \(player2Score): \(player2Name)\n")
            }
            else
            {
                turnLabel.text = "\(player2Name) wins"
                player2Score += 1
                player2NameLabel.text = "\(player2Name): \n \(player2Score)"
                save(name: "\(player2Name): \(player2Score) WIN | LOST \(player1Score): \(player1Name)\n")
            }
        }
        
        //RIGHT DIAGONAL CHECK
        if(buttons[0].tag == whoseTurn && buttons[4].tag == whoseTurn && buttons[8].tag == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            exitButton.isHidden = false
            if(whoseTurn == 1)
            {
                turnLabel.text = "\(player1Name) wins"
                player1Score += 1
                player1NameLabel.text = "\(player1Name): \n \(player1Score)"
                save(name: "\(player1Name): \(player1Score) WIN | LOST \(player2Score): \(player2Name)\n")
            }
            else
            {
                turnLabel.text = "\(player2Name) wins"
                player2Score += 1
                player2NameLabel.text = "\(player2Name): \n \(player2Score)"
                save(name: "\(player2Name): \(player2Score) WIN | LOST \(player1Score): \(player1Name)\n")
            }
        }
        
        //LEFT DIAGONAL CHECK
        if(buttons[2].tag == whoseTurn && buttons[4].tag == whoseTurn && buttons[6].tag == whoseTurn)
        {
            gameOn = false
            restartButton.isHidden = false
            exitButton.isHidden = false
            if(whoseTurn == 1)
            {
                turnLabel.text = "\(player1Name) wins"
                player1Score += 1
                player1NameLabel.text = "\(player1Name): \n \(player1Score)"
                save(name: "\(player1Name): \(player1Score) WIN | LOST \(player2Score): \(player2Name)\n")
            }
            else
            {
                turnLabel.text = "\(player2Name) wins"
                player2Score += 1
                player2NameLabel.text = "\(player2Name): \n \(player2Score)"
                save(name: "\(player2Name): \(player2Score) WIN | LOST \(player1Score): \(player1Name)\n")
            }
        }
        
        //Check if a space is still clear on the grid
        for i in buttons
        {
            if(i.tag == 0)
            {
                isSpace = true
            }
        }
        // If the grid check has not found that a player has won and that there are no spaces left a tie is called.
        if(!isSpace && gameOn == true)
        {
            gameOn = false
            restartButton.isHidden = false
            //exitButton.isHidden = false
            turnLabel.text = "No spaces left - TIE"
            tie += 1
            tieLabel.text = "TIE: \n \(tie)"
        }
        
    }
    
    
    //Save function for end result.
    func save(name: String)
    {
        print(name)
        guard let AppDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        
        let managedContext = AppDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "History", in: managedContext)
        let history = NSManagedObject(entity: entity!, insertInto: managedContext)
        history.setValue(name, forKey: "history")
        
        do{
            try managedContext.save()
        } catch _ as NSError
        {
            print("Error saving")
        }
    }
    
    @IBAction func GridButtonPressed(_ sender: UIButton)
    {
        //Called when a button on the grid is pressed and will change the image and value in array to the specific player.
        if(gameOn == true && sender.tag == 0)
        {
                //Check if a player or the computer has not already taken this node of the grid and then change its value and image to reflect the player.
            sender.tag = whoseTurn
            CheckGrid()
            //Change Image of button
            if(whoseTurn == 1)
            {
                sender.setImage(player1Image, for: .normal)
                whoseTurn = 2
                player1NameLabel.backgroundColor = UIColor.clear
                player2NameLabel.backgroundColor = UIColor (colorLiteralRed: 46/255.0, green: 11/255.0, blue: 49/255.0, alpha: 1.0)
            }
            else
            {
                sender.setImage(player2Image, for: .normal)
                whoseTurn = 1
                player2NameLabel.backgroundColor = UIColor.clear
                player1NameLabel.backgroundColor = UIColor (colorLiteralRed: 46/255.0, green: 11/255.0, blue: 49/255.0, alpha: 2.0)
            }
            sender.isUserInteractionEnabled = false
            //Check if game has ended and if not display next players name or do AI's turn after delay.
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
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
}
