//
//  GameScene.swift
//  AI_Test_IOS
//
//  Created by Timothy Dowling on 2018-02-28.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        // Set scene
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Add Enemy
        let enemy = Enemy(position: CGPoint.zero)
        
        // Add sprite to scene
        if let sprite = enemy.component(ofType: SpriteComponent.self)?.sprite {
            addChild(sprite)
        }
    }
}
