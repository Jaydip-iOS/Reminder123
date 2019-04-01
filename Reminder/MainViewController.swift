//
//  ViewController.swift
//  Reminder
//
//  Created by Developer on 01/04/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit
import UserNotifications

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startTapped(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "Developer"
        content.subtitle = "Testing the app"
        content.badge = 1
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
extension MainViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
}

