//Created by Yusif Aliyev
//March 8, 2018

import UIKit

class Main_VC: UIViewController {
    
    @IBOutlet weak var box: UIView!
    
    var duration: Double!
    
    var is_on_the_left: Bool!
    var is_on_the_right: Bool!
    var is_above: Bool!
    var is_below: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        duration = 0.5
        
        is_on_the_left = true
        is_on_the_right = false
        is_above = true
        is_below = false
    }
    
    func go_right(box: UIView){
        if self.is_on_the_right == false {
            box.center.x = box.center.x - 50 - box.frame.width*2 + self.view.frame.width
            self.is_on_the_right = true
            self.is_on_the_left = false
        }
    }
    
    func go_left(box: UIView){
        if self.is_on_the_left == false {
            box.center.x = box.center.x + 100 + box.frame.width - self.view.frame.width
            self.is_on_the_left = true
            self.is_on_the_right = false
        }
    }
    
    func go_up (box: UIView){
        if self.is_above == false {
            box.center.y = box.center.y + 100 + box.frame.height - self.view.frame.height
            self.is_above = true
            self.is_below = false
        }
    }
    
    func go_down(box: UIView){
        if self.is_below == false {
            box.center.y = box.center.y - 50 - box.frame.height*2 + self.view.frame.height
            self.is_below = true
            self.is_above = false
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
