
//  Created by Devine Lu Linvega on 2015-11-12.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import UIKit
import SpriteKit

let rabbits = SKNode()
var logo:SKLabelNode!
var steps = 0
let rabbitSize:CGFloat = 15
let black = SKColor.black
let white = SKColor.white
let animationRatio:Double = 2.5

class SplashGameScene: SKScene
{
	var viewController: MainViewController!
	
	override func didMove(to view: SKView)
	{
		print(self.view?.frame)
	}
	
	func start()
	{
		self.backgroundColor = black
		
		createLogo()
		createRabbits()
		
		Timer.scheduledTimer(timeInterval: 3 * animationRatio, target: self, selector: #selector(SplashGameScene.delayedStart), userInfo: nil, repeats: false)
	}
	
	func delayedStart()
	{
		Timer.scheduledTimer(timeInterval: 0.5 * animationRatio, target: self, selector: #selector(SplashGameScene._appear), userInfo: nil, repeats: false)
		Timer.scheduledTimer(timeInterval: 0.5 * animationRatio, target: self, selector: #selector(SplashGameScene._call), userInfo: nil, repeats: true)
	}
	
	func createLogo()
	{
		logo = SKLabelNode(fontNamed: "Alte Haas Grotesk Bold")
		logo.position = CGPoint(x:self.frame.midX,y:self.frame.midY - (rabbitSize * 8))
		logo.horizontalAlignmentMode = .center
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
		rabbits.position = CGPoint(x:self.frame.midX,y:self.frame.midY)
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
		let action_fade = SKAction.fadeAlpha(to: 1, duration: 1 * animationRatio)
		logo.run(action_fade)
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
	
	override func update(_ currentTime: TimeInterval)
	{
		viewController.takeScreenshot()
	}
}
