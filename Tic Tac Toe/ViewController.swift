//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by George Gogarten on 6/17/16.
//  Copyright © 2016 George Gogarten. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePLayer = 1 // 1 = noughts, 2 = crosses
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2,],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var gameActive = true
    
    @IBOutlet weak var gameOver: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
        
            gameState[sender.tag] = activePLayer
            
        if activePLayer == 1 {
        
        
        sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
        
            activePLayer = 2
            
            
        
        } else {
            
            sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            
            activePLayer = 1
            
            
            
            }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOver.text = "Noughts have won!"
                        
                    } else {
                        
                        gameOver.text = "Crosses have won!"
                    }
                    
                    gameOver.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: {
                        
                    self.gameOver.center = CGPointMake(self.gameOver.center.x + 500, self.gameOver.center.y)
                        
                    })
                }
                
            }
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOver.hidden = true
        
        gameOver.center = CGPointMake(gameOver.center.x - 500, gameOver.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

