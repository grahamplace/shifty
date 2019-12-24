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
    var dateItem: NSMenuItem!
    var clock: Clock!
    dynamic var ts = ""
    dynamic var ds = ""


    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateAllTimes), userInfo: nil, repeats: true)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func updateAllTimes() {
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.variableLength)
        let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")
        statusBarItem.menu = statusBarMenu
        statusBarItem.button?.title = ts

        let _ = statusBarMenu.addItem(
            withTitle: ds,
            action: nil,
            keyEquivalent: "")
        
        updateMenuTime()
        updateDropdownDate()
    }
    
    func updateMenuTime() {
        let clock = Clock()
        ts = clock.getTimeStr()
    }
    
    func updateDropdownDate() {
        let clock = Clock()
        ds = clock.getDateStr()
    }
}

