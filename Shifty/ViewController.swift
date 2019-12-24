//
//  ViewController.swift
//  Shifty
//
//  Created by Graham Place on 12/24/19.
//  Copyright © 2019 Graham Place. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var statusBarItem: NSStatusItem!
    var clock: Clock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clock = Clock()
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.variableLength)
        let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")
        statusBarItem.menu = statusBarMenu

        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @objc func updateTime() {
        let ts = clock.getTimeStr()
        statusBarItem.button?.title = ts
    }

}

