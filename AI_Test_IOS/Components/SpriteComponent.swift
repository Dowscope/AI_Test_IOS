//
//  SpriteComponent.swift
//  AI_Test_IOS
//
//  Created by Timothy Dowling on 2018-02-28.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class SpriteComponent: GKComponent {
    
    // Add a sprite or shape to repersent the entity this component will
    // be attached to.
    let sprite = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 32, height: 32))
    
    init(position: CGPoint){
        super.init()
        
        sprite.position = position;
        sprite.fillColor = .blue;
        sprite.lineWidth = 0;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
