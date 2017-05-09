//
//  MainMenuScene.swift
//  Pirate Attack!
//
//  Created by Michael Horbacki (i7671439) on 09/05/2017.
//  Copyright © 2017 Michael Horbacki (i7671439). All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self);
            
            if atPoint(location).name == "Start" {
                if let scene = GameScene(fileNamed: "GameScene")
                scene.scaleMode = .aspectFill

            }
            
            
            
        }
        
    }
    
    
}
