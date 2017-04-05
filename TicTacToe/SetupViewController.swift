//
//  SetupViewController.swift
//  TicTacToe
//
//  Created by Shaun Anderson on 18/03/2017.
//  Copyright © 2017 Shaun Anderson. All rights reserved.
//

import UIKit
import CoreData

class SetupViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    

    @IBOutlet weak var player2IconButton: UIButton!
    @IBOutlet weak var player1IconButton: UIButton!
    //MARK: Properties
    @IBOutlet weak var player2NameTextfield: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var selectIconLabel: UILabel!
    @IBOutlet weak var difficultySegment: UISegmentedControl!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var historyView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SETUP DEPENDING ON GAME MODE SELECTED
        if(!checkHistory)
        {
            historyView.isHidden = true
        if(vsAI)
        {
            titleLabel.text = "PLAYER VS COMPUTER"
            player2NameTextfield.isHidden = true
            player2NameLabel.isHidden = true
            player2Name = "COMPUTER"
            player2IconButton.isUserInteractionEnabled = false
            selectIconLabel.text = "SELECT ICON"
            difficultySegment.isHidden = false
        }
        else
        {
            historyTextView.insertText(history as String)
            titleLabel.text = "PLAYER VS PLAYER"
            player2Name = "PLAYER 2"
        }
        
        //setup inital values incase player just hits start game
        
        player1Name = "PLAYER 1"
        player1Image = UIImage(named: "X")!
        player2Image = UIImage(named: "O")!
        player1ImageName = "X"
        player2ImageName = "O"
        crossButton.backgroundColor = UIColor.gray
        circleButton.backgroundColor = UIColor.darkGray
        
        }
        else
        {
            titleLabel.text = "HISTORY"
            historyTextView.text = ""
            historyView.isHidden = false
            
            guard  let AppDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = AppDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "History")
            
            do{
                let data = try managedContext.fetch(fetchRequest)
                print(data.count)
                if(data.count >= 0)
                {
                    for datas in data
                    {
                    let datastuff = datas.value(forKey: "history")
                    history.insert(datastuff as! String, at: 0)
                    }
                }
            } catch _ as NSError
            {
                print("ISSUE LOADING")
            }
            historyTextView.text = history as String
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func difficultySet(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0)
        {
        AIEasy = true
        sender.tintColor = UIColor.white
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
            player2Image = UIImage(named: "O")!
            sender.backgroundColor = UIColor.gray
            circleButton.backgroundColor = UIColor.darkGray
            player1ImageName = "X"
            player2ImageName = "O"
        }
        else
        {
            player1Image = sender.currentImage!
            player2Image = UIImage(named: "X")!
            sender.backgroundColor = UIColor.gray
            crossButton.backgroundColor = UIColor.darkGray
            player1ImageName = "O"
            player2ImageName = "X"
        }
    }

    var imagePicked: Int = 0
    
    @IBAction func iconPressed(_ sender: UIButton)
    {
        imagePicked = sender.tag
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
        {
                        
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let foundImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            if(imagePicked == 1)
            {
                player1Icon = foundImage
                player1IconButton.setBackgroundImage(player1Icon, for: .normal)
            }
            else
            {
                player2Icon = foundImage
                player2IconButton.setBackgroundImage(player2Icon, for: .normal)
            }
        }
        else
        {
            print("Error retrieving image from gallery")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
        //DELETE SAVED GAMES
        guard  let AppDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = AppDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "History")
        
        do{
            let data = try managedContext.fetch(fetchRequest)
            if(data.count > 0)
            {
                for datas in data
                {
                    managedContext.delete(datas)
                }
            }
        } catch _ as NSError
        {
            print("ISSUE deleting")
        }
        
        do{
            try managedContext.save()
        } catch _ as NSError
        {
            print("Error saving")
        }
        history = ""
        historyTextView.text = ""
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
}
