//
//  SunTextViewWithPlaceHolder.swift
//  TextViewWithPlaceHolderDemo
//
//  Created by 孙博弘 on 14/12/1.
//  Copyright (c) 2014年 Sun. All rights reserved.
//

import UIKit

class SunTextViewWithPlaceHolder: UITextView {
    var placeHolderLabel: UILabel = UILabel(frame: CGRectZero)
    
    var attributedPlaceholder:NSAttributedString = NSAttributedString(string: "") {
        didSet{
            self.configNotifications()
            
            placeHolderLabel.attributedText = self.attributedPlaceholder
            placeHolderLabel.textColor = UIColor.lightGrayColor()
            
            if self.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0{
                placeHolderLabel.removeFromSuperview()
            }
            else{
                self.addSubview(placeHolderLabel)
            }
            
            self.setNeedsLayout()
        }
    }
    
    
    
    override func layoutSubviews() ->Void {
        //下面的判断可以在通过代码修改text时，移除placeHolderLabel
        if self.isFirstResponder() || (self.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0) {
            placeHolderLabel.removeFromSuperview()
        }
        else {
            self.addSubview(placeHolderLabel)
        }
        
        placeHolderLabel.sizeToFit()
        
        var frameLabelUpdated = self.bounds
        
        frameLabelUpdated.origin.x = self.layer.borderWidth
        frameLabelUpdated.origin.y = self.layer.borderWidth
        
        frameLabelUpdated.size.width = CGRectGetWidth(self.frame) - 2.0*self.layer.borderWidth
        frameLabelUpdated.size.height = CGRectGetHeight(self.placeHolderLabel.frame)
        
        
        self.placeHolderLabel.frame = frameLabelUpdated
    }
    
    //配置监听事件
    func configNotifications() ->Void {
        let de = NSNotificationCenter.defaultCenter()
        
        de.addObserver(self, selector: "textDidChange:", name: UITextViewTextDidChangeNotification, object: self)
        
        de.addObserver(self, selector: "editDidBegin:", name: UITextViewTextDidBeginEditingNotification, object: self)
        
        de.addObserver(self, selector: "editDidEnd:", name: UITextViewTextDidEndEditingNotification, object: self)
    }
    
    //通知事件
    func textDidChange(notification:NSNotification) -> Void {
        placeHolderLabel.removeFromSuperview()
    }
    
    func editDidBegin(notification:NSNotification) -> Void {
        placeHolderLabel.removeFromSuperview()
    }
    
    func editDidEnd(notification:NSNotification) -> Void {
        if (self.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0) {
            placeHolderLabel.removeFromSuperview()
        }
        else {
            self.addSubview(placeHolderLabel)
        }
    }
}
