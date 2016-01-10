//
//  NonScrollingScrollView.swift
//  ResizingTextViewController
//
//  Created by Todd Olsen on 1/10/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Cocoa

class NonScrollingScrollView: NSScrollView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        hideScrollers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        hideScrollers()
    }
    
    private func hideScrollers() {
        hasHorizontalScroller = false
        hasVerticalScroller = false
    }
    
    override func scrollWheel(theEvent: NSEvent) {
        self.nextResponder?.scrollWheel(theEvent)
    }
    
}