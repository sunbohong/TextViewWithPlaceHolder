//
//  CALayer+Attributes.swift
//  TextViewWithPlaceHolderDemo
//
//  Created by 孙博弘 on 14/12/1.
//  Copyright (c) 2014年 Sun. All rights reserved.
//

import UIKit

extension CALayer
{
    func setBorderColorFromUIColor(color:UIColor)
    {
        self.borderColor = color.CGColor
    }

}