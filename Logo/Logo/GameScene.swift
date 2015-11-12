
//  Created by Devine Lu Linvega on 2015-11-12.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import SpriteKit

class GameScene: SKScene
{
	let rabbits = SKNode()
	
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
    }
    
    override func update(currentTime: CFTimeInterval)
	{
        /* Called before each frame is rendered */
    }
}
