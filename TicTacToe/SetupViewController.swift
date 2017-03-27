//
//  SetupViewController.swift
//  TicTacToe
//
//  Created by Shaun Anderson on 18/03/2017.
//  Copyright © 2017 Shaun Anderson. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var player2NameTextfield: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var selectIconLabel: UILabel!
    @IBOutlet weak var difficultySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SETUP DEPENDING ON GAME MODE SELECTED
        if(vsAI)
        {
            titleLabel.text = "PLAYER VS COMPUTER"
            player2NameTextfield.isHidden = true
            player2NameLabel.isHidden = true
            player2Name = "COMPUTER"
            selectIconLabel.text = "SELECT ICON"
            difficultySegment.isHidden = false
        }
        else
        {
            titleLabel.text = "PlAYER VS PLAYER"
            player2Name = "PLAYER 2"
        }
        
        //setup inital values incase player just hits start game
        
        player1Name = "PLAYER 1"
        player1Image = UIImage(named: "Cross")!
        player2Image = UIImage(named: "Circle")!
        crossButton.backgroundColor = UIColor.gray
        circleButton.backgroundColor = UIColor.darkGray

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func difficultySet(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0)
        {
        AIEasy = true
        sender.tintColor = UIColor.blue
        }
        else
        {
        AIEasy = false
        sender.tintColor = UIColor.red
        }
            
    }
    
    @IBAction func NameInput(_ sender: UITextField) {
        if(sender.tag == 2)
        {
            player1Name = sender.text!
        }
        if(sender.tag == 1)
        {
            
            player2Name = sender.text!
        }
    }
    
    @IBOutlet weak var crossButton: UIButton!

    @IBOutlet weak var circleButton: UIButton!
    
    @IBAction func PickImageButtonPressed(_ sender: UIButton) {
        if(sender.tag == 0)
        {
            player1Image = sender.currentImage!
            player2Image = UIImage(named: "Circle")!
            sender.backgroundColor = UIColor.gray
            circleButton.backgroundColor = UIColor.darkGray
        }
        else
        {
            player1Image = sender.currentImage!
            player2Image = UIImage(named: "Cross")!
            sender.backgroundColor = UIColor.gray
            crossButton.backgroundColor = UIColor.darkGray
        }
    }

}
