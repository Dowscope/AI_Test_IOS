//
//  Enemy.swift
//  AI_Test_IOS
//
//  Created by Timothy Dowling on 2018-02-28.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class Enemy: GKEntity {
    
    init(position: CGPoint){
        super.init()
        
        // Add a sprite to this entity.
        let sprite = SpriteComponent(position: position)
        addComponent(sprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
