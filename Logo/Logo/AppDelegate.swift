
//  Created by Devine Lu Linvega on 2015-11-12.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification)
	{
        /* Pick a size for the scene */
        if let scene = GameScene(fileNamed:"GameScene") {
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
			scene.backgroundColor = NSColor.blackColor()
            self.skView!.presentScene(scene)
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool
	{
        return true
    }
}
