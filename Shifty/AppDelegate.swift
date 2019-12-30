//
//  AppDelegate.swift
//  Shifty
//
//  Created by Graham Place on 12/24/19.
//  Copyright © 2019 Graham Place. All rights reserved.
//

import Cocoa
import LaunchAtLogin


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    var dateItem: NSMenuItem!
    dynamic var ts = ""
    dynamic var ds = ""
    let clock = Clock()

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateAllTimes), userInfo: nil, repeats: true)
        toggleLaunchAtLogin()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func updateAllTimes() {
        constructMenu()
        updateMenuTime()
        updateDropdownDate()
    }
    
    func constructMenu() {
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.variableLength)
        let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")
        statusBarItem.menu = statusBarMenu
        statusBarItem.button?.title = ts

        statusBarMenu.addItem(
            withTitle: ds,
            action: nil,
            keyEquivalent: "")
        
        statusBarMenu.addItem(NSMenuItem.separator())
        
        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.quit),
            keyEquivalent: "")

        
        // build launch at login item
        let launchStatus = LaunchAtLogin.isEnabled
        let launchItem = statusBarMenu.addItem(
            withTitle: "Open at Login",
            action: #selector(AppDelegate.toggleLaunchAtLogin),
            keyEquivalent: "")
        if launchStatus {
            launchItem.state = NSControl.StateValue.on
        }
        else {
            launchItem.state = NSControl.StateValue.off
        }
    }
    
    func updateMenuTime() {
        ts = clock.getTimeStr()
    }
    
    func updateDropdownDate() {
        ds = clock.getDateStr()
    }
    
    @objc
    func quit() {
        exit(0)
    }
    
    @objc
    func toggleLaunchAtLogin() {
        LaunchAtLogin.isEnabled = !LaunchAtLogin.isEnabled
    }
}

