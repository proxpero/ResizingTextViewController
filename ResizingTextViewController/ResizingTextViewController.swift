//
//  ResizingTextViewController.swift
//  ResizingTextView
//
//  Created by Todd Olsen on 1/9/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Cocoa

class ResizingTextViewController: NSViewController, NSTextViewDelegate {

    let font = NSFont.systemFontOfSize(15)
    var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet var textView: NSTextView!

    override func viewDidLoad() {
        
        NSNotificationCenter.defaultCenter().addObserverForName(NSViewFrameDidChangeNotification, object: view, queue: nil) { [unowned self] (note) -> Void in
            self.resizeTextView()
        }
        
        textView.delegate = self
        textView.textContainerInset = NSMakeSize(font.pointSize, font.pointSize)
        textView.font = font
        heightConstraint = NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: singleLineHeight())
        view.addConstraint(heightConstraint)
        resizeTextView()
        
    }
    
    func textDidChange(notification: NSNotification) {
        resizeTextView()
    }
    
    func resizeTextView() {
        
        let width   = 2.0 * textView.textContainerInset.width
        let height  = 2.0 * textView.textContainerInset.height
        
        heightConstraint.constant = (textView.string == nil || textView.string!.isEmpty) ? singleLineHeight() + height : (textView.attributedString().heightForWidth(textView.bounds.size.width - width)) + height
        
    }
    
    func singleLineHeight() -> CGFloat {
        return "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12345667890".heightForWidth(CGFloat.max, font: font)
    }
    
}

