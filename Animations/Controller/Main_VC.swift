//Created by Yusif Aliyev
//March 8, 2018

import UIKit

class Main_VC: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBOutlet weak var box: UIView!
    
    @IBOutlet weak var right_button: UIButton!
    @IBOutlet weak var down_button: UIButton!
    @IBOutlet weak var left_button: UIButton!
    @IBOutlet weak var up_button: UIButton!
    @IBOutlet weak var right_left_button: UIButton!
    @IBOutlet weak var down_up_button: UIButton!
    @IBOutlet weak var left_right_button: UIButton!
    @IBOutlet weak var up_down_button: UIButton!
    
    var distance_form_bounds: CGFloat!
    
    var duration: Double!
    
    var is_on_the_left: Bool!
    var is_on_the_right: Bool!
    var is_above: Bool!
    var is_below: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distance_form_bounds = 10
        
        box.center.x = distance_form_bounds + box.frame.width/2
        box.center.y = distance_form_bounds + box.frame.height/2
        
        duration = 0.3
        
        up_button.setTitleColor(UIColor.green, for: .normal)
        down_button.setTitleColor(UIColor.green, for: .normal)
        left_button.setTitleColor(UIColor.green, for: .normal)
        right_button.setTitleColor(UIColor.green, for: .normal)
        
        up_button.setTitleColor(UIColor.red, for: .disabled)
        down_button.setTitleColor(UIColor.red, for: .disabled)
        left_button.setTitleColor(UIColor.red, for: .disabled)
        right_button.setTitleColor(UIColor.red, for: .disabled)
        
        up_down_button.setTitleColor(UIColor.green, for: .normal)
        down_up_button.setTitleColor(UIColor.green, for: .normal)
        left_right_button.setTitleColor(UIColor.green, for: .normal)
        right_left_button.setTitleColor(UIColor.green, for: .normal)
        
        up_down_button.setTitleColor(UIColor.red, for: .disabled)
        down_up_button.setTitleColor(UIColor.red, for: .disabled)
        left_right_button.setTitleColor(UIColor.red, for: .disabled)
        right_left_button.setTitleColor(UIColor.red, for: .disabled)
        
        check_position(input: "DEFAULT")
        check_returning_ones()
    }
    
    func check_position(input: String) {
        switch input {
            
        case "GO-UP":
            self.is_above = true
            self.is_below = false
            self.up_button.isEnabled = false
            self.down_button.isEnabled = true
            
        case "GO-DOWN":
            self.is_below = true
            self.is_above = false
            self.down_button.isEnabled = false
            self.up_button.isEnabled = true
            
        case "GO-LEFT":
            self.is_on_the_left = true
            self.is_on_the_right = false
            self.left_button.isEnabled = false
            self.right_button.isEnabled = true
            
        case "GO-RIGHT":
            self.is_on_the_right = true
            self.is_on_the_left = false
            self.left_button.isEnabled = true
            self.right_button.isEnabled = false
            
        default:
            self.is_on_the_left = true
            self.is_on_the_right = false
            self.is_above = true
            self.is_below = false
            self.left_button.isEnabled = false
            self.right_button.isEnabled = true
            self.up_button.isEnabled = false
            self.down_button.isEnabled = true
        }
    }
    
    func check_returning_ones() {
        if right_button.isEnabled {
            right_left_button.isEnabled = true
        } else {
            right_left_button.isEnabled = false
        }
        
        if left_button.isEnabled {
            left_right_button.isEnabled = true
        } else {
            left_right_button.isEnabled = false
        }
        
        if up_button.isEnabled {
            up_down_button.isEnabled = true
        } else {
            up_down_button.isEnabled = false
        }
        
        if down_button.isEnabled {
            down_up_button.isEnabled = true
        } else {
            down_up_button.isEnabled = false
        }
    }
    
    func go_right(box: UIView) {
        if self.is_on_the_right == false {
            box.center.x = box.center.x - 2 * (distance_form_bounds + box.frame.width / 2) + self.view.frame.width
            check_position(input: "GO-RIGHT")
            check_returning_ones()
        }
    }
    
    func go_left(box: UIView) {
        if self.is_on_the_left == false {
            box.center.x = box.center.x + 2 * (distance_form_bounds + box.frame.width / 2) - self.view.frame.width
            check_position(input: "GO-LEFT")
            check_returning_ones()
        }
    }
    
    func go_up (box: UIView) {
        if self.is_above == false {
            box.center.y = box.center.y + 2 * (distance_form_bounds + box.frame.height / 2) - self.view.frame.height
            check_position(input: "GO-UP")
            check_returning_ones()
        }
    }
    
    func go_down(box: UIView) {
        if self.is_below == false {
            box.center.y = box.center.y - 2 * (distance_form_bounds + box.frame.height / 2) + self.view.frame.height
            check_position(input: "GO-DOWN")
            check_returning_ones()
        }
    }
    
    @IBAction func go_right_pressed(_ sender: Any) {
        UIView.animate(withDuration: self.duration) {
            self.go_right(box: self.box)
        }
    }
    
    @IBAction func go_left_pressed(_ sender: Any) {
        UIView.animate(withDuration: self.duration) {
            self.go_left(box: self.box)
        }
    }
    
    @IBAction func go_up_pressed(_ sender: Any) {
        UIView.animate(withDuration: self.duration) {
            self.go_up(box: self.box)
        }
    }
    
    @IBAction func go_down_pressed(_ sender: Any) {
        UIView.animate(withDuration: self.duration) {
            self.go_down(box: self.box)
        }
    }
    
    @IBAction func go_right_left_pressed(_ sender: Any) {
        UIView.animate(withDuration: self.duration, animations: {
            self.go_right(box: self.box)
        }) { (finished) in
            if finished {
                UIView.animate(withDuration: self.duration) {
                    self.go_left(box: self.box)
                }
            }
        }
    }
    
    @IBAction func go_left_right_pressed(_ sender: Any) {
        UIView.animate(withDuration: self.duration, animations: {
            self.go_left(box: self.box)
        }) { (finished) in
            if finished {
                UIView.animate(withDuration: self.duration) {
                    self.go_right(box: self.box)
                }
            }
        }
    }
    
    @IBAction func go_up_down_pressed(_ sender: Any) {
        UIView.animate(withDuration: self.duration, animations: {
            self.go_up(box: self.box)
        }) { (finished) in
            if finished {
                UIView.animate(withDuration: self.duration) {
                    self.go_down(box: self.box)
                }
            }
        }
    }
    
    @IBAction func go_down_up_pressed(_ sender: Any) {
        UIView.animate(withDuration: self.duration, animations: {
            self.go_down(box: self.box)
        }) { (finished) in
            if finished {
                UIView.animate(withDuration: self.duration) {
                    self.go_up(box: self.box)
                }
            }
        }
    }
}
