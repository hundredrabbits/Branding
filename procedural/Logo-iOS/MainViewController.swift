
//  Created by Devine Lu Linvega on 2015-11-22.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import SpriteKit

class MainViewController: UIViewController
{
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		let value = UIInterfaceOrientation.LandscapeRight.rawValue
		UIDevice.currentDevice().setValue(value, forKey: "orientation")
		
		splash_load()
	}
	
	// MARK: Flow -
	
	var scene:SplashGameScene!
	
	func splash_load()
	{
		scene = SplashGameScene(fileNamed:"Splash")
		let skView = self.view as! SKView
		scene.viewController = self
		scene.scaleMode = .AspectFill
		skView.presentScene(scene)
		scene.start()
	}
	
	func splash_exited()
	{
		
	}
	
	var frameCount:Int = 0
	
	func takeScreenshot()
	{
		if frameCount > 140 { exit(0) }
		
		let fileManager = NSFileManager.defaultManager()
		UIGraphicsBeginImageContextWithOptions(view.frame.size, false, UIScreen.mainScreen().scale)
		scene.view?.drawViewHierarchyInRect(view.frame, afterScreenUpdates: true)
		let screenshotFile = UIImageJPEGRepresentation(UIGraphicsGetImageFromCurrentImageContext(), 1.0)
		fileManager.createFileAtPath("/Users/VillaMoirai/Desktop/export/frame.\(frameCount).jpg", contents: screenshotFile, attributes: nil)
		UIGraphicsEndImageContext()
		
		frameCount++
	}
	
	// MARK: Defaults -
	
	override func shouldAutorotate() -> Bool
	{
		return false
	}
	
	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask
	{
		if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
			return .AllButUpsideDown
		} else {
			return .All
		}
	}
	
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
	}
	
	override func prefersStatusBarHidden() -> Bool
	{
		return true
	}
}
