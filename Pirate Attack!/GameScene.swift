//
//  GameScene.swift
//  Pirate Attack!
//
//  Created by Michael Horbacki (i7671439) on 14/03/2017.
//  Copyright © 2017 Michael Horbacki (i7671439). All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    var spaceship: SKSpriteNode!
    
    var scoreCount = 0
    //var scoreLabel = SKLabelNode!
    

    
    let motionManager = CMMotionManager()

    let playerSpeed:CGFloat = 50
    
    
    override func didMove(to view: SKView) {
        print("loaded")
        motionManager.startAccelerometerUpdates()
        spaceship = SKSpriteNode(imageNamed: "Spaceship")
        spaceship.position = CGPoint(x: frame.size.width/2, y: 100)
        spaceship.setScale(0.3)
        self.addChild(spaceship)
        
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target:self, action: #selector(handleSwipe(sender:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        
        
      //  scoreLabel = SKLabelNode (text: "score 0")
     //   scoreLabel.position = CGPoint (x: 80, y: 700)
     //  addChild(scoreLabel)
        
    
        let distance = 20
        let time = 10
        let result = distance * time
        
        NSLog("%d", result)
        
        
    }
    
    func handleSwipe(sender: UISwipeGestureRecognizer) {
        
    
        
        if sender.direction == .right {
            spaceship.position.x += playerSpeed
        }
        
        if sender.direction == .left {
            spaceship.position.x -= playerSpeed
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("touch")
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if let accelerometerData = motionManager.accelerometerData {
            let acc = CGVector(dx: accelerometerData.acceleration.y * -50, dy: accelerometerData.acceleration.x * 50)
            spaceship.position.x += acc.dx
            spaceship.position.y += acc.dy
        }
        
    }

    
    func getDuration(pointA: CGPoint, pointB: CGPoint, speed: CGFloat) -> TimeInterval {
        let xDist = (pointB.x - pointA.x)
        let yDist = (pointB.y - pointA.y)
        let distance = sqrt((xDist * xDist) + (yDist * yDist));
        let duration = TimeInterval(distance/speed)
        return duration
    }
    
    
    func spawnItems() -> SKSpriteNode {
        let item: SKSpriteNode?
        
        if  Int.random(min: 0, max: 10) >= 6 {
            item = SKSpriteNode(imageNamed: "Bomb")
            item!.name = "Bomb"
            item!.setScale(0.6)
            item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2)
        } else {
            let num = Int.random(min: 1, max: 5)
            
            item = SKSpriteNode(imageNamed: "Fruit \(num)")
            item!.name = "Fruit 1";
            item!.setScale(0.7)
            item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2)
        }
        
      //  item!.physicsBody?.categoryBitMask = ColliderType.FRUIT_AND_BOMB
        
        item!.zPosition = 3
        item!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        item!.position.x = randomBetweenNumbers(firstNum: minX, secondNum: maxX)
        item!.position.y = 500
        
        return item!
    }
    
    

    
    
    
    
    
    
    
    
    
 
}
