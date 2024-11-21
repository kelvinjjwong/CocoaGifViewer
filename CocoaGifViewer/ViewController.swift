//
//  ViewController.swift
//  SwiftyGifMacExample
//
//  Created by Carlo Rapisarda on 2020-08-04.
//  Copyright © 2020 alexiscreuzot. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet private var gifImageView: NSImageView!
    
    let gifManager = SwiftyGifManager(memoryLimit:100)
    let images = [
        "https://media.giphy.com/media/5tkEiBCurffluctzB7/giphy.gif",
        "2.gif",
        "https://media.giphy.com/media/5xtDarmOIekHPQSZEpq/giphy.gif",
        "3.gif",
        "https://media.giphy.com/media/3oEjHM2xehrp0lv6bC/giphy.gif",
        "5.gif",
        "https://media.giphy.com/media/l1J9qg0MqSZcQTuGk/giphy.gif",
        "4.gif",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewGif(self.currentI)
    }
    
    var currentI = 0
    
    func viewGif(_ i:Int) {
        let imageSource = images[i]
        
        if let image = try? NSImage(imageName: imageSource) {
            gifImageView.setImage(image, manager: gifManager, loopCount: -1)
        } else if let url = URL.init(string: imageSource) {
            gifImageView.setGifFromURL(url, showLoader: true)
        } else {
            gifImageView.clear()
        }
    }

    @IBAction func onNextClicked(_ sender: NSButton) {
        self.currentI += 1
        if self.currentI > (images.count-1) {
            self.currentI = 0
        }
        self.viewGif(self.currentI)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

