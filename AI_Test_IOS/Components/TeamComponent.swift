//
//  TeamComponent.swift
//  AI_Test_IOS
//
//  Created by Timothy Dowling on 2018-02-28.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

enum Team {
    case ENEMY
    case PLAYER
}

class TeamComponent: GKComponent {
    
    let team: Team
    
    init(team: Team){
        self.team = team
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
