//
//  ViewController.swift
//  TextViewWithPlaceHolderDemo
//
//  Created by 孙博弘 on 14/12/1.
//  Copyright (c) 2014年 Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textViewWithPlaceHolder: SunTextViewWithPlaceHolder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        textViewWithPlaceHolder.attributedPlaceholder = NSAttributedString(string: "attributedPlaceholder", attributes: [NSFontAttributeName:UIFont.systemFontOfSize(22), NSForegroundColorAttributeName: UIColor.orangeColor()])
       textViewWithPlaceHolder.text=""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

