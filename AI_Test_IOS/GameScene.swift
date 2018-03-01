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
    var entityManager: EntityManager!
    
    override func didMove(to view: SKView) {
        
        entityManager = EntityManager(scene: self)
        
        // Set scene
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Add Enemy
        let enemy = Enemy(position: CGPoint(x: -100, y: -100), em: entityManager)
        let enemy2 = Enemy(position: CGPoint(x: 100, y: 100), em: entityManager)
        let player = Player(position: CGPoint.zero, em: entityManager)
        
        entityManager.add(entity: enemy)
        entityManager.add(entity: enemy2)
        entityManager.add(entity: player)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func update(_ currentTime: TimeInterval) {
        entityManager.update(currentTime)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        let loc = view?.convert(sender.location(in: self.view), to: self)
        entityManager.movePlayer(to: loc!)
    }
}
