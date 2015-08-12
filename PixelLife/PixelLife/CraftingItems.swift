//
//  CraftingItems.swift
//  PixelLife
//
//  Created by Jack Jiang on 8/9/15.
//  Copyright (c) 2015 Yifang. All rights reserved.
//

import Foundation

class CraftingItems {
    
    var blacksmithCrafting: [String : Bool]
    var sorcererCrafting: [String : Bool]
    var carpenterCrafting: [String : Bool]
    
    init() {
        blacksmithCrafting = ["Copper Pickaxe": true, "Copper Axe": true,"Copper Shovel": true]
        sorcererCrafting = ["Red Potion": true, "Copper Axe": true]
        carpenterCrafting = ["Wooden Table": true, "Wooden Chair": true]
    }
    
    
    
}