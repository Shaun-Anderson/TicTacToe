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
var player1Score = 0
var player1Image = UIImage()

var player2Name = ""
var player2Score = 0
var player2Image = UIImage()

var vsAI = false

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func PvCButton(_ sender: UIButton)
    {
        vsAI = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

