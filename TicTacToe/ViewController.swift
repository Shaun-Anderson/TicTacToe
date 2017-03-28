//
//  ViewController.swift
//  TicTacToe
//
//  Created by Shaun Anderson on 16/03/2017.
//  Copyright © 2017 Shaun Anderson. All rights reserved.
//

import UIKit

//SETUP GLOBAL VARIABLES TO BE USED THROUGHOUT THE APP
var player1Name = ""
var player1Icon = UIImage()
var player1Image = UIImage()

var player2Name = ""
var player2Icon = UIImage()
var player2Image = UIImage()

var vsAI = false
var AIEasy = true

var checkHistory = false
var history : NSMutableString = ""

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        vsAI = false
        checkHistory = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func PvCButton(_ sender: UIButton)
    {
        vsAI = true
    }
    
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        exit(1)
    }
    
    @IBAction func historyButtonPressed(_ sender: UIButton) {
        checkHistory = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

