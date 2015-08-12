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
    
    var classSelection: Int = 100
    var actionSelection: Int = 100
    
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
            
            //node reference
            let nodesInTouch = self.nodesAtPoint(location)
            let allNodes = self.children
            var classNodes = [self.childNodeWithName("blacksmith"),self.childNodeWithName("sorcerer"),self.childNodeWithName("carpenter")]
            var actionNodes = [self.childNodeWithName("research"),self.childNodeWithName("craft")]
            
            for node in nodesInScene {
                var nodeColor: SKLabelNode = node as! SKLabelNode
                nodeColor.fontColor = SKColor.whiteColor()
            }
            
            
            
            /*if ([node.name isEqualToString:@"scene button"]) {
                
                SKTransition *reveal = [SKTransition fadeWithDuration:3];
                
                MyScene *scene = [MyScene sceneWithSize:self.view.bounds.size];
                scene.scaleMode = SKSceneScaleModeAspectFill;
                [self.view presentScene:scene transition:reveal];
            }*/
            
           // self.addChild(sprite)
            for node in nodesInTouch {
                
                var nodeColor: SKLabelNode = node as! SKLabelNode
                
                if (node.name == "blacksmith") {
                    classSelection = 0
                } else if (node.name == "sorcerer") {
                    classSelection = 1
                } else if (node.name == "carpenter") {
                    classSelection = 2
                } else if (node.name == "research") {
                    actionSelection = 0
                    openResearchTree(classSelection)
                } else if (node.name == "craft") {
                    actionSelection = 1
                    openCrafting(classSelection)
                } else {
                    
                }
                // to next page
                else if(node.name == "Next")
                {
                    let transition = SKTransition.revealWithDirection(SKTransitionDirection.Left, duration: 1.0)
                    let scene = ShoppingScene(size: self.scene!.size)
                    scene.scaleMode = SKSceneScaleMode.AspectFill
                    self.scene!.view!.presentScene(scene, transition: transition)
                
                }
                
                
            }
            //node color reset
            for node in allNodes {
                var nodeColor: SKLabelNode = node as! SKLabelNode
                nodeColor.fontColor = SKColor.whiteColor()
            }
            //node color
            if (classSelection < classNodes.count) {
                var selectedClass: SKLabelNode = classNodes[classSelection] as! SKLabelNode
                selectedClass.fontColor = SKColor.redColor()
            }
            if (actionSelection < actionNodes.count) {
                var selectedAction: SKLabelNode = actionNodes[actionSelection] as! SKLabelNode
                selectedAction.fontColor = SKColor.redColor()
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
