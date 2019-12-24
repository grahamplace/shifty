//
//  AppDelegate.swift
//  Shifty
//
//  Created by Graham Place on 12/24/19.
//  Copyright © 2019 Graham Place. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    var clock: Clock!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        clock = Clock()
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.variableLength)
        let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")
        statusBarItem.menu = statusBarMenu

        let timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func updateTime() {
        let ts = clock.getTimeStr()
        statusBarItem.button?.title = ts
    }
}

