//Created by Yusif Aliyev
//March 8, 2018

import UIKit

class Main_VC: UIViewController {
    
    @IBOutlet weak var box: UIView!
    
    @IBOutlet weak var right_button: UIButton!
    @IBOutlet weak var down_button: UIButton!
    @IBOutlet weak var left_button: UIButton!
    @IBOutlet weak var up_button: UIButton!
    
    var duration: Double!
    
    var is_on_the_left: Bool!
    var is_on_the_right: Bool!
    var is_above: Bool!
    var is_below: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        duration = 0.5
        
        up_button.setTitleColor(UIColor.green, for: .normal)
        down_button.setTitleColor(UIColor.green, for: .normal)
        left_button.setTitleColor(UIColor.green, for: .normal)
        right_button.setTitleColor(UIColor.green, for: .normal)
        
        up_button.setTitleColor(UIColor.red, for: .disabled)
        down_button.setTitleColor(UIColor.red, for: .disabled)
        left_button.setTitleColor(UIColor.red, for: .disabled)
        right_button.setTitleColor(UIColor.red, for: .disabled)
        
        check_position(input: "DEFAULT")
    }
    
    func check_position(input: String){
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
    
    func go_right(box: UIView){
        if self.is_on_the_right == false {
            box.center.x = box.center.x - 50 - box.frame.width*2 + self.view.frame.width
            check_position(input: "GO-RIGHT")
        }
    }
    
    func go_left(box: UIView){
        if self.is_on_the_left == false {
            box.center.x = box.center.x + 100 + box.frame.width - self.view.frame.width
            check_position(input: "GO-LEFT")
        }
    }
    
    func go_up (box: UIView){
        if self.is_above == false {
            box.center.y = box.center.y + 100 + box.frame.height - self.view.frame.height
            check_position(input: "GO-UP")
        }
    }
    
    func go_down(box: UIView){
        if self.is_below == false {
            box.center.y = box.center.y - 50 - box.frame.height*2 + self.view.frame.height
            check_position(input: "GO-DOWN")
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
}
