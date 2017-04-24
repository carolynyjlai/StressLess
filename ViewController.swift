//
//  ViewController.swift
//  StressLess
//
//  Created by Chubby Bunny on 4/10/17.
//  Copyright © 2017 Techie Telly Tubbies. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
            if didAllow {
                print("Approval granted to send notifications")
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func notifStart(_ sender: Any) {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (45*60), repeats: true)
        
            let content = UNMutableNotificationContent()
            content.title = "Take a break!"
            content.body = "Choose a relaxing activity to complete and feel less stressed :)"
            content.sound = UNNotificationSound.default()
            content.badge = 1
        
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    @IBAction func notifEnd(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications() // To remove all delivered notifications
        center.removeAllPendingNotificationRequests()
        
    }
}




