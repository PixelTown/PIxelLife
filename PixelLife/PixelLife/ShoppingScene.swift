//
//  ShoppingScene.swift
//  PixelLife
//
//  Created by Yifang Zhang on 8/11/15.
//  Copyright (c) 2015 Yifang. All rights reserved.
//

import Foundation

import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class ShoppingScene: SKScene {
    
    //script references
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Welcome to the shopping page";
        myLabel.fontSize = 40;
        myLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center;
        myLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center;
        myLabel.position = CGPoint(x:CGRectGetMaxX(self.frame)/2, y:CGRectGetMaxY(self.frame)/4);
        myLabel.name = "Welcome"
        myLabel.fontColor = SKColor.blueColor()
        self.addChild(myLabel)
        
        //set the label to previous page:
        let previous = SKLabelNode(fontNamed: "Chalkduster")
        previous.text = "previous page"
        previous.fontSize = 24;
        previous.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        previous.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        previous.position = CGPoint(x:CGRectGetMaxX(self.frame)/2, y:CGRectGetMaxY(self.frame)*3/4)
        previous.name = "previous"
        previous.fontColor = SKColor.whiteColor()
        self.addChild(previous)
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.locationInNode(self)
            
            let nodesInTouch = self.nodesAtPoint(location)
         
            for node in nodesInTouch {
                if(node.name == "previous"){
                    let transition = SKTransition.revealWithDirection(SKTransitionDirection.Right, duration: 1.0)
                    
                    let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene
                    scene!.scaleMode = .AspectFill
                    
                    self.scene!.view!.presentScene(scene, transition: transition)
                
                }
            }
            
        }
        

    }
    
    override func update(currentTime: NSTimeInterval) {
        // do something here
    }

}