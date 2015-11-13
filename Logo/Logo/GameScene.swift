
//  Created by Devine Lu Linvega on 2015-11-12.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import SpriteKit

let rabbits = SKNode()
var logo:SKLabelNode!
var steps = 0

class GameScene: SKScene
{
    override func didMoveToView(view: SKView)
	{
		var x = 0
		var y = 0
		while x < 10 {
			y = 0
			while y < 10 {
				let rabbit = Rabbit(x:x,y:y)
				rabbits.addChild(rabbit)
				y += 1
			}
			x += 1
		}
		addChild(rabbits)
		rabbits.position = CGPoint(x:CGRectGetMidX(self.frame) - (25*10)/2,y:CGRectGetMidY(self.frame) - (25*10)/2)
		
		scare()
		scare()
		scare()
		scare()
		scare()
		scare()
		
		NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "call", userInfo: nil, repeats: true)
		
		logo = SKLabelNode(fontNamed: "Alte Haas Grotesk Bold")
		logo.position = CGPoint(x:CGRectGetMidX(self.frame) - (25*10)/2 - 12.5,y:CGRectGetMidY(self.frame) - (25 * 8))
		logo.horizontalAlignmentMode = .Center
		logo.text = "hundredrabbits"
		logo.fontSize = 20
		logo.alpha = 0
		addChild(logo)
	}
	
	func displayLogo()
	{
		let action_fade = SKAction.fadeAlphaTo(1, duration: 1)
		logo.runAction(action_fade)
	}
	
	func scare()
	{
		for case let rabbit as Rabbit in rabbits.children {
			rabbit.flee()
		}
	}
	
	func call()
	{
		steps += 1
		for case let rabbit as Rabbit in rabbits.children {
			rabbit.sneak()
		}
		
		if steps == 8 {
			displayLogo()
		}
	}
	
    override func update(currentTime: CFTimeInterval)
	{
        /* Called before each frame is rendered */
    }
}
