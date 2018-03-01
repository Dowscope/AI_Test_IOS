//
//  MoveComponent.swift
//  AI_Test_IOS
//
//  Created by Timothy Dowling on 2018-02-28.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class MoveComponent: GKAgent2D, GKAgentDelegate {
    
    let entityManager: EntityManager

    init(maxSpeed: Float, maxAcceleration: Float, radius: Float, em: EntityManager){
        self.entityManager = em
        super.init()
        
        delegate = self
        self.maxSpeed = maxSpeed
        self.maxAcceleration = maxAcceleration
        self.radius = radius
        self.mass = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func agentWillUpdate(_ agent: GKAgent) {
        guard let sprite = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        
        position = float2(x: Float(sprite.sprite.position.x), y: Float(sprite.sprite.position.y))
    }
    
    func agentDidUpdate(_ agent: GKAgent) {
        guard let sprite = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        
        sprite.sprite.position = CGPoint(x: CGFloat(position.x), y: CGFloat(position.y))
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        guard let teamComponent = entity?.component(ofType: TeamComponent.self)?.team else {
            return
        }
        
        if teamComponent == .ENEMY {
            behavior = MoveBehaviour(targetSpeed: maxSpeed, seek: entityManager.getPlayerMoveComponent()!, avoid: entityManager.moveComponents(for: .ENEMY))
        }
    }
}
