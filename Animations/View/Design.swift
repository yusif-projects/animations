//Created by Yusif Aliyev
//March 9, 2018

import UIKit

@IBDesignable
class Design: UIView {
    @IBInspectable
    var corner_radius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = corner_radius
        }
    }
}
