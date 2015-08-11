//
//  GameScene.swift
//  PixelLife
//
//  Created by Yifang Zhang on 8/8/15.
//  Copyright (c) 2015 Yifang. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //script references
    var craftingItemsReference: CraftingItems = CraftingItems()
    
    var classSelection: Int = 0
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Select your character";
        myLabel.fontSize = 35;
        myLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center;
        myLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left;
        myLabel.position = CGPoint(x:CGRectGetMaxX(self.frame)/2, y:CGRectGetMaxY(self.frame)/2);
        myLabel.name = "blacksmith"
        myLabel.fontColor = SKColor.redColor()
        
        //self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.locationInNode(self)
            
            let nodesInTouch = self.nodesAtPoint(location)
            let nodesInScene = self.children
            
            for node in nodesInScene {
                var nodeColor: SKLabelNode = node as! SKLabelNode
                nodeColor.fontColor = SKColor.whiteColor()
            }
            
           // self.addChild(sprite)
            for node in nodesInTouch {
                var nodeColor: SKLabelNode = node as! SKLabelNode
                
                if node.name == "blacksmith" {
                    classSelection = 1
                    
                    nodeColor.fontColor = SKColor.redColor()
                } else if node.name == "sorcerer" {
                    classSelection = 2
                    nodeColor.fontColor = SKColor.redColor()
                } else if node.name == "carpenter" {
                    classSelection = 3
                    nodeColor.fontColor = SKColor.redColor()
                } else if node.name == "research" {
                    nodeColor.fontColor = SKColor.redColor()
                    openResearchTree(classSelection)
                } else if node.name == "craft" {
                    nodeColor.fontColor = SKColor.redColor()
                    openCrafting(classSelection)
                }
                
            }
            
            
            
            
        }
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func openResearchTree(selection :Int) {
        if selection == 1 {
            
        } else if selection == 2 {
            
        } else if selection == 3 {
            
        }
    }
    func openCrafting(selection: Int) {
        if selection == 1 {
            for item in craftingItemsReference.blacksmithCrafting {
                debugPrintln(item)
            }
        } else if selection == 2 {
            for item in craftingItemsReference.sorcererCrafting {
                debugPrintln(item)
            }
        } else if selection == 3 {
            for item in craftingItemsReference.carpenterCrafting {
                debugPrintln(item)
            }
        }
    }
}
