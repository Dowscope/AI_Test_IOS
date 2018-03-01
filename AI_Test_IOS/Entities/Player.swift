//
//  Player.swift
//  AI_Test_IOS
//
//  Created by Timothy Dowling on 2018-02-28.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class Player: GKEntity {
    
    init(position: CGPoint, em: EntityManager){
        super.init()
        
        // Add a sprite to this entity.
        addComponent(SpriteComponent(position: position))
        addComponent(MoveComponent(maxSpeed: 0.0001, maxAcceleration: 0.001, radius: 32 * 0.3, em: em))
        addComponent(TeamComponent(team: .PLAYER))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        for component in components {
            component.update(deltaTime: seconds)
        }
    }
}
