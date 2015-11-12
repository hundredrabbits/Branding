
//  Created by Devine Lu Linvega on 2015-11-12.
//  Copyright © 2015 Devine Lu Linvega. All rights reserved.

import Foundation
import SpriteKit

class Rabbit : SKNode
{
	var x:Int!
	var y:Int!
	var sprite:SKShapeNode!
	
	init(x:Int,y:Int)
	{
		super.init()
		
		sprite = SKShapeNode(circleOfRadius: 10)
		sprite.fillColor = NSColor.whiteColor()
		addChild(sprite)
		position = CGPoint(x: x * 25,y: y * 25)
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}