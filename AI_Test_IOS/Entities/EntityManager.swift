//
//  EntityManager.swift
//  AI_Test_IOS
//
//  Created by Timothy Dowling on 2018-02-28.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class EntityManager {
    
    let gameScene: SKScene
    var entities = [GKEntity]()
    
    init(scene: SKScene) {
        self.gameScene = scene
    }
    
    func add(entity: GKEntity) {
        if let sprite = entity.component(ofType: SpriteComponent.self)?.sprite {
            gameScene.addChild(sprite)
            entities.append(entity)
        }
    }
    
    func update(_ deltaTime: TimeInterval) {
        for entity in entities {
            entity.update(deltaTime: deltaTime)
        }
    }
    
    func getPlayerMoveComponent() -> MoveComponent? {
        for entity in entities {
            if let teemComponent = entity.component(ofType: TeamComponent.self)?.team {
                if teemComponent == .PLAYER {
                    return entity.component(ofType: MoveComponent.self)
                }
            }
        }
        return nil
    }
    
    func movePlayer(to point: CGPoint){
        for entity in entities {
            if let teemComponent = entity.component(ofType: TeamComponent.self)?.team {
                if teemComponent == .PLAYER {
                    if let sprite = entity.component(ofType: SpriteComponent.self)?.sprite {
                        sprite.run(SKAction.move(to: point, duration: 0.5))
                    }
                }
            }
        }
    }
    
    func moveComponents(for team: Team) -> [MoveComponent] {
        var components = [MoveComponent]()
        
        for entity in entities {
            guard let teamComponent = entity.component(ofType: TeamComponent.self)?.team else{
                continue
            }
            
            if teamComponent == team {
                components.append(entity.component(ofType: MoveComponent.self)!)
            }
        }
        
        return components
    }
}
