//
//  ViewController.swift
//  image360Rotation
//
//  Created by shishir sapkota on 5/3/17.
//  Copyright © 2017 ccr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnStartAnimation: UIButton!
    @IBOutlet weak var imgAnimationView: UIImageView!
    @IBOutlet weak var lblSelectedSequence: UILabel!
    
    var playing = false
    var increment = 1 // selects even and odd. 1 for all 2 for even 3 for odd.
    
    var index = 0
    var image_address = "TATA_KITE_360_V8_000"
    var image_address2 = "TATA_KITE_360_V8_00"
    var timer: Timer?
    let maxIndex = 69
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstImageAddress = image_address + "\(index)"
        let firstImage = UIImage(named: firstImageAddress)
        imgAnimationView.image = firstImage
        lblSelectedSequence.text = "All"
    
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func all(_ sender: UIButton) {
        lblSelectedSequence.text = "All"
        self.increment = 1
    }
    
    @IBAction func even(_ sender: UIButton) {
        lblSelectedSequence.text = "Even"
        self.increment = 2
    }
    
    @IBAction func Odd(_ sender: UIButton) {
        lblSelectedSequence.text = "Odd"
        self.increment = 3
    }
    
    
    @IBAction func swiped(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
//            swipeLeft 
            
        }
        if sender.direction == .right {
//            siwpe right
        }
    }
    
    @IBAction func btnPlayPause(_ sender: UIButton) {
       playing ?
        stopAnimation() : startAnimation()
    }
    

    func runAnimation() {
        if index > 69 { index = 0}
        imgAnimationView.image = getImage(index: index)
        playing = true
    }
    
    func stopAnimation() {
        btnStartAnimation.setTitle("Animation Stopped.", for: .normal)
        stopTimer()
        playing = false
    }
   
    
    func getImage(index: Int) -> UIImage {
        let imageAddress = index < 10 ? image_address + "\(index)" : image_address2 + "\(index)"
        
        self.index +=  increment
        print(imageAddress)
        if let image =  UIImage(named: imageAddress) {
            return image
        }else {
            return UIImage()
        }
        
    }
    
    func startAnimation() {
        btnStartAnimation.setTitle("Animating..", for: .normal)
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { timer in
            self.runAnimation()
        })
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    

}

