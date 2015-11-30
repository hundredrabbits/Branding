
//  Created by Devine Lu Linvega on 2015-11-12.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import UIKit
import SpriteKit

let rabbits = SKNode()
var logo:SKLabelNode!
var steps = 0
let rabbitSize:CGFloat = 15
let black = SKColor.blackColor()
let white = SKColor.whiteColor()
let animationRatio:Double = 2.5

class SplashGameScene: SKScene
{
	var viewController: MainViewController!
	
	override func didMoveToView(view: SKView)
	{
		print(self.view?.frame)
	}
	
	func start()
	{
		self.backgroundColor = black
		
		createLogo()
		createRabbits()
		
		NSTimer.scheduledTimerWithTimeInterval(3 * animationRatio, target: self, selector: "delayedStart", userInfo: nil, repeats: false)
	}
	
	func delayedStart()
	{
		NSTimer.scheduledTimerWithTimeInterval(0.5 * animationRatio, target: self, selector: "_appear", userInfo: nil, repeats: false)
		NSTimer.scheduledTimerWithTimeInterval(0.5 * animationRatio, target: self, selector: "_call", userInfo: nil, repeats: true)
	}
	
	func createLogo()
	{
		logo = SKLabelNode(fontNamed: "Alte Haas Grotesk Bold")
		logo.position = CGPoint(x:CGRectGetMidX(self.frame),y:CGRectGetMidY(self.frame) - (rabbitSize * 8))
		logo.horizontalAlignmentMode = .Center
		logo.text = "hundredrabbits"
		logo.fontSize = 20
		logo.alpha = 0
		addChild(logo)
	}
	
	func createRabbits()
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
		rabbits.position = CGPoint(x:CGRectGetMidX(self.frame),y:CGRectGetMidY(self.frame))
		rabbits.alpha = 0
		
		scare()
		scare()
		scare()
		scare()
		scare()
		scare()
	}
	
	func displayLogo()
	{
		let action_fade = SKAction.fadeAlphaTo(1, duration: 1 * animationRatio)
		logo.runAction(action_fade)
	}
	
	func _appear()
	{
		rabbits.alpha = 1
		var count = 1
		for case let rabbit as Rabbit in rabbits.children {
			rabbit.appear(count)
			count += 1
		}
	}
	
	func _call()
	{
		steps += 1
		for case let rabbit as Rabbit in rabbits.children {
			rabbit.sneak()
		}
		
		if steps == 8 {
			displayLogo()
		}
		if steps == 14 {
			exit()
		}
	}
	
	func exit()
	{
		viewController.splash_exited()
	}
	
	func scare()
	{
		for case let rabbit as Rabbit in rabbits.children {
			rabbit.flee()
		}
	}
	
	override func update(currentTime: CFTimeInterval)
	{
		viewController.takeScreenshot()
	}
}
