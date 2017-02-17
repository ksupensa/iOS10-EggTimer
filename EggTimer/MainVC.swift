//
//  MainVC.swift
//  EggTimer
//
//  Created by Spencer Forrest on 18/02/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var countDown: UILabel!
    
    private var timer = Timer()
    
    private let CONSTANT_TIME = 10
    private let DEFAULT_TIME = 210
    
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        count = DEFAULT_TIME
        
        updateLbl()
    }
    
    @IBAction func playBtnTapped(_ sender: UIBarButtonItem) {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainVC.eggTime), userInfo: nil, repeats: true)
        } else {
            print("Timer already counting")
        }
    }
    
    @IBAction func pauseBtnTapped(_ sender: UIBarButtonItem) {
        if timer.isValid{
                    timer.invalidate()
        } else {
            print("Timer already stopped")
        }
    }
    
    @IBAction func addTimeBtnTapped(_ sender: UIBarButtonItem) {
        count += CONSTANT_TIME
        updateLbl()
    }
    
    @IBAction func resetBtnTapped(_ sender: UIBarButtonItem) {
        count = DEFAULT_TIME
        updateLbl()
    }
    
    @IBAction func removeTimeBtnTapped(_ sender: UIBarButtonItem) {
        if count - CONSTANT_TIME >= 0 {
            count -= CONSTANT_TIME
            updateLbl()
        }
    }
    
    private func updateLbl(){
        countDown.text = "\(count)"
    }
    
    func eggTime(){
        if count > 0 {
            count -= 1
            updateLbl()
        } else {
            timer.invalidate()
        }
    }
}

