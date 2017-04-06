//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Shaun Anderson on 16/03/2017.
//  Copyright © 2017 Shaun Anderson. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class GameViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var player1IconImageView: UIImageView!
    @IBOutlet weak var player2IconImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var tieLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var nextRoundButton: UIButton!
    
    //MARK: Variables
    var isSpace = true
    var gameOn = true
    var whoseTurn: Int = 1
    var tie: Int = 0
    var player1Score = 0
    var player2Score = 0
    var aiHelp : [Int] = [0,1,2,3,4,5,6,7,8]
    var soundPlayer : AVAudioPlayer!
    
    //MARK: Actions
    //Reset the game and scores.
    @IBAction func restartGame(_ sender: UIButton)
    {
        gameOn = true
        nextRoundButton.isHidden = true
        
        player2NameLabel.backgroundColor = UIColor.clear
        player1NameLabel.backgroundColor = UIColor (colorLiteralRed: 46/255.0, green: 11/255.0, blue: 49/255.0, alpha: 2.0)
        player1Score = 0
        player2Score = 0
        player1NameLabel.text = "\(player1Name): \n \(player1Score)"
        player2NameLabel.text = "\(player2Name): \n \(player2Score)"

        
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
    
    @IBAction func nextRound(_ sender: UIButton)
    {
        gameOn = true
        
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
        nextRoundButton.isHidden = true
    }
    
    //MARK: Functions
    override func viewDidLoad()
    {
        //Set all the UI elements to their starting states.
        super.viewDidLoad()
        player1NameLabel.text = "\(player1Name): \n \(player1Score)"
        player1NameLabel.backgroundColor = UIColor (colorLiteralRed: 46/255.0, green: 11/255.0, blue: 49/255.0, alpha: 1.0)
        player1IconImageView.image = player1Icon
        player2NameLabel.text = "\(player2Name): \n \(player2Score)"
        player2IconImageView.image = player2Icon
        tieLabel.text = "TIE: \n \(tie)"
        
        //Set scores to zero.
        player1Score = 0
        player2Score = 0
        
        //Get mp3 for background music then play it.
        if let path = Bundle.main.path(forResource: "BackgroundSong", ofType: "mp3")
        {
            let url = URL(fileURLWithPath: path)
            
            do {
                try soundPlayer = AVAudioPlayer(contentsOf: url)
                soundPlayer.play()
                print("Audio loaded")
                }
                catch {print("File not found")}
        }
        else
        {
            print("path not found")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //This function controls the AI's whole turn and involves both checking player. This function also takes the difficulty set by the player that they selected.
    func AITurn()
    {
        var done = false
        
        while done != true
        {
            let randomInt = Int(arc4random_uniform(9))
            
            if(AIEasy == false)
            {
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
            
                //Check for middle horizontal win from player
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
                
                //Check for botton horizontal win from player
                if(buttons[6].tag == 0 && buttons[7].tag == 1 && buttons[8].tag == 1)
                {
                    buttons[6].setImage(player2Image, for: .normal)
                    buttons[6].tag = 2
                    done = true
                    break
                }
                if(buttons[6].tag == 1 && buttons[7].tag == 0 && buttons[8].tag == 1)
                {
                    buttons[7].setImage(player2Image, for: .normal)
                    buttons[7].tag = 2
                    done = true
                    break
                }
                if(buttons[6].tag == 1 && buttons[7].tag == 1 && buttons[8].tag == 0)
                {
                    buttons[8].setImage(player2Image, for: .normal)
                    buttons[8].tag = 2
                    done = true
                    break
                }
                
                //Check for left vertical win from player
                if(buttons[0].tag == 0 && buttons[3].tag == 1 && buttons[6].tag == 1)
                {
                    buttons[0].setImage(player2Image, for: .normal)
                    buttons[0].tag = 2
                    done = true
                    break
                }
                if(buttons[0].tag == 1 && buttons[3].tag == 0 && buttons[6].tag == 1)
                {
                    buttons[3].setImage(player2Image, for: .normal)
                    buttons[3].tag = 2
                    done = true
                    break
                }
                if(buttons[0].tag == 1 && buttons[3].tag == 1 && buttons[6].tag == 0)
                {
                    buttons[6].setImage(player2Image, for: .normal)
                    buttons[6].tag = 2
                    done = true
                    break
                }
                
                //Check for middle vertical win from player
                if(buttons[1].tag == 0 && buttons[4].tag == 1 && buttons[7].tag == 1)
                {
                    buttons[1].setImage(player2Image, for: .normal)
                    buttons[1].tag = 2
                    done = true
                    break
                }
                if(buttons[1].tag == 1 && buttons[4].tag == 0 && buttons[7].tag == 1)
                {
                    buttons[4].setImage(player2Image, for: .normal)
                    buttons[4].tag = 2
                    done = true
                    break
                }
                if(buttons[1].tag == 1 && buttons[4].tag == 1 && buttons[7].tag == 0)
                {
                    buttons[7].setImage(player2Image, for: .normal)
                    buttons[7].tag = 2
                    done = true
                    break
                }
                
                //Check for left vertical win from player
                if(buttons[2].tag == 0 && buttons[5].tag == 1 && buttons[8].tag == 1)
                {
                    buttons[2].setImage(player2Image, for: .normal)
                    buttons[2].tag = 2
                    done = true
                    break
                }
                if(buttons[2].tag == 1 && buttons[5].tag == 0 && buttons[8].tag == 1)
                {
                    buttons[5].setImage(player2Image, for: .normal)
                    buttons[5].tag = 2
                    done = true
                    break
                }
                if(buttons[2].tag == 1 && buttons[5].tag == 1 && buttons[8].tag == 0)
                {
                    buttons[8].setImage(player2Image, for: .normal)
                    buttons[8].tag = 2
                    done = true
                    break
                }
                
                //Check for left diagonal win from player
                if(buttons[0].tag == 0 && buttons[4].tag == 1 && buttons[8].tag == 1)
                {
                    buttons[0].setImage(player2Image, for: .normal)
                    buttons[0].tag = 2
                    done = true
                    break
                }
                if(buttons[0].tag == 1 && buttons[4].tag == 0 && buttons[8].tag == 1)
                {
                    buttons[4].setImage(player2Image, for: .normal)
                    buttons[4].tag = 2
                    done = true
                    break
                }
                if(buttons[0].tag == 1 && buttons[4].tag == 1 && buttons[8].tag == 0)
                {
                    buttons[8].setImage(player2Image, for: .normal)
                    buttons[8].tag = 2
                    done = true
                    break
                }
                
                //Check for left diagonal win from player
                if(buttons[2].tag == 0 && buttons[4].tag == 1 && buttons[6].tag == 1)
                {
                    buttons[2].setImage(player2Image, for: .normal)
                    buttons[2].tag = 2
                    done = true
                    break
                }
                if(buttons[2].tag == 1 && buttons[4].tag == 0 && buttons[6].tag == 1)
                {
                    buttons[4].setImage(player2Image, for: .normal)
                    buttons[4].tag = 2
                    done = true
                    break
                }
                if(buttons[2].tag == 1 && buttons[4].tag == 1 && buttons[6].tag == 0)
                {
                    buttons[6].setImage(player2Image, for: .normal)
                    buttons[6].tag = 2
                    done = true
                    break
                }
            }
            
            //Check if middle is taken and if it is choose a random
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
            player2NameLabel.backgroundColor = UIColor.clear
            player1NameLabel.backgroundColor = UIColor (colorLiteralRed: 46/255.0, green: 11/255.0, blue: 49/255.0, alpha: 2.0)
            whoseTurn = 1;
            turnLabel.text = "Player \(whoseTurn) Turn"
        }

    }
    
    //Check if a win condiditon is met aswell and then change the UI elements to reflect that as well as change the background of the 3 buttons within the win condition to show which way the player/computer won.
    func CheckGrid()
    {
        //Make isSpace false and check against grid array to see if there are any spaces left
        isSpace = false
        
        //HORIZONTAL TOP CHECK
        if(buttons[0].tag == whoseTurn && buttons[1].tag == whoseTurn && buttons[2].tag == whoseTurn)
        {
            gameOn = false
            nextRoundButton.isHidden = false
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
                    buttons[0].backgroundColor = UIColor.purple
                    buttons[1].backgroundColor = UIColor.purple
                    buttons[2].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[0].backgroundColor = UIColor.cyan
                    buttons[1].backgroundColor = UIColor.cyan
                    buttons[2].backgroundColor = UIColor.cyan
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
                    buttons[0].backgroundColor = UIColor.cyan
                    buttons[1].backgroundColor = UIColor.cyan
                    buttons[2].backgroundColor = UIColor.cyan
                }
            }
        }
        
        //HORIZONAL MIDDLE CHECK
        if(buttons[3].tag == whoseTurn && buttons[4].tag == whoseTurn && buttons[5].tag == whoseTurn)
        {
            gameOn = false
            nextRoundButton.isHidden = false
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
            nextRoundButton.isHidden = false
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
                    buttons[6].backgroundColor = UIColor.purple
                    buttons[7].backgroundColor = UIColor.purple
                    buttons[8].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[6].backgroundColor = UIColor.cyan
                    buttons[7].backgroundColor = UIColor.cyan
                    buttons[8].backgroundColor = UIColor.cyan
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
                    buttons[6].backgroundColor = UIColor.purple
                    buttons[7].backgroundColor = UIColor.purple
                    buttons[8].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[6].backgroundColor = UIColor.cyan
                    buttons[7].backgroundColor = UIColor.cyan
                    buttons[8].backgroundColor = UIColor.cyan
                }
            }
        }
        
        //VERTICAL LEFT CHECK
        if(buttons[0].tag == whoseTurn && buttons[3].tag == whoseTurn && buttons[6].tag == whoseTurn)
        {
            gameOn = false
            nextRoundButton.isHidden = false
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
                    buttons[0].backgroundColor = UIColor.purple
                    buttons[3].backgroundColor = UIColor.purple
                    buttons[6].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[0].backgroundColor = UIColor.cyan
                    buttons[3].backgroundColor = UIColor.cyan
                    buttons[6].backgroundColor = UIColor.cyan
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
                    buttons[3].backgroundColor = UIColor.purple
                    buttons[6].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[0].backgroundColor = UIColor.cyan
                    buttons[3].backgroundColor = UIColor.cyan
                    buttons[6].backgroundColor = UIColor.cyan
                }
            }
        }
        
        //VERTICAL MIDDLE CHECK
        if(buttons[1].tag == whoseTurn && buttons[4].tag == whoseTurn && buttons[7].tag == whoseTurn)
        {
            gameOn = false
            nextRoundButton.isHidden = false
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
                    buttons[1].backgroundColor = UIColor.purple
                    buttons[4].backgroundColor = UIColor.purple
                    buttons[7].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[1].backgroundColor = UIColor.cyan
                    buttons[4].backgroundColor = UIColor.cyan
                    buttons[7].backgroundColor = UIColor.cyan
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
                    buttons[1].backgroundColor = UIColor.purple
                    buttons[4].backgroundColor = UIColor.purple
                    buttons[7].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[1].backgroundColor = UIColor.cyan
                    buttons[4].backgroundColor = UIColor.cyan
                    buttons[7].backgroundColor = UIColor.cyan
                }
            }
        }
        
        //VERTICAL RIGHT CHECK
        if(buttons[2].tag == whoseTurn && buttons[5].tag == whoseTurn && buttons[8].tag == whoseTurn)
        {
            gameOn = false
            nextRoundButton.isHidden = false
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
                    buttons[2].backgroundColor = UIColor.purple
                    buttons[5].backgroundColor = UIColor.purple
                    buttons[8].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[2].backgroundColor = UIColor.cyan
                    buttons[5].backgroundColor = UIColor.cyan
                    buttons[8].backgroundColor = UIColor.cyan
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
                    buttons[2].backgroundColor = UIColor.purple
                    buttons[5].backgroundColor = UIColor.purple
                    buttons[8].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[2].backgroundColor = UIColor.cyan
                    buttons[5].backgroundColor = UIColor.cyan
                    buttons[8].backgroundColor = UIColor.cyan
                }
            }
        }
        
        //RIGHT DIAGONAL CHECK
        if(buttons[0].tag == whoseTurn && buttons[4].tag == whoseTurn && buttons[8].tag == whoseTurn)
        {
            gameOn = false
            nextRoundButton.isHidden = false
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
                    buttons[0].backgroundColor = UIColor.purple
                    buttons[4].backgroundColor = UIColor.purple
                    buttons[8].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[0].backgroundColor = UIColor.cyan
                    buttons[4].backgroundColor = UIColor.cyan
                    buttons[8].backgroundColor = UIColor.cyan
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
                    buttons[4].backgroundColor = UIColor.purple
                    buttons[8].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[0].backgroundColor = UIColor.cyan
                    buttons[4].backgroundColor = UIColor.cyan
                    buttons[8].backgroundColor = UIColor.cyan
                }
            }
        }
        
        //LEFT DIAGONAL CHECK
        if(buttons[2].tag == whoseTurn && buttons[4].tag == whoseTurn && buttons[6].tag == whoseTurn)
        {
            gameOn = false
            nextRoundButton.isHidden = false
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
                    buttons[2].backgroundColor = UIColor.purple
                    buttons[4].backgroundColor = UIColor.purple
                    buttons[6].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[2].backgroundColor = UIColor.cyan
                    buttons[4].backgroundColor = UIColor.cyan
                    buttons[6].backgroundColor = UIColor.cyan
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
                    buttons[2].backgroundColor = UIColor.purple
                    buttons[4].backgroundColor = UIColor.purple
                    buttons[6].backgroundColor = UIColor.purple
                }
                else
                {
                    buttons[2].backgroundColor = UIColor.cyan
                    buttons[4].backgroundColor = UIColor.cyan
                    buttons[6].backgroundColor = UIColor.cyan
                }
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
                    if(whoseTurn == 1)
                    {
                        turnLabel.text = "\(player1Name)'s Turn"
                    }
                    else
                    {
                        turnLabel.text = "\(player2Name)'s Turn"
                    }
                }
            }
        }
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
}
