
//  Created by Devine Lu Linvega on 2015-11-22.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import SpriteKit

class MainViewController: UIViewController
{
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		let value = UIInterfaceOrientation.landscapeRight.rawValue
		UIDevice.current.setValue(value, forKey: "orientation")
		
		splash_load()
	}
	
	// MARK: Flow -
	
	var scene:SplashGameScene!
	
	func splash_load()
	{
		scene = SplashGameScene(fileNamed:"Splash")
		let skView = self.view as! SKView
		scene.viewController = self
		scene.scaleMode = .aspectFill
		skView.presentScene(scene)
		scene.start()
	}
	
	func splash_exited()
	{
		
	}
	
	var frameCount:Int = 0
	
	func takeScreenshot()
	{
		if frameCount > 240 { exit(0) }
		
		let fileManager = FileManager.default
		UIGraphicsBeginImageContextWithOptions(view.frame.size, false, UIScreen.main.scale)
		scene.view?.drawHierarchy(in: view.frame, afterScreenUpdates: true)
		let screenshotFile = UIImageJPEGRepresentation(UIGraphicsGetImageFromCurrentImageContext()!, 1.0)
		fileManager.createFile(atPath: "/Users/VillaMoirai/Desktop/export/frame.\(frameCount).jpg", contents: screenshotFile, attributes: nil)
		UIGraphicsEndImageContext()
		
		frameCount += 1
	}
	
	// MARK: Defaults -
	
	override var shouldAutorotate : Bool
	{
		return false
	}
	
	override var supportedInterfaceOrientations : UIInterfaceOrientationMask
	{
		if UIDevice.current.userInterfaceIdiom == .phone {
			return .allButUpsideDown
		} else {
			return .all
		}
	}
	
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
	}
	
	override var prefersStatusBarHidden : Bool
	{
		return true
	}
}
