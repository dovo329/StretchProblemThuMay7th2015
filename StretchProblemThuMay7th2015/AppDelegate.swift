//
//  AppDelegate.swift
//  StretchProblemThuMay7th2015
//
//  Created by Douglas Voss on 5/7/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//
//* Create a minutes property and a seconds property that hold NSIntegers
//* Create a method called decreaseSecond that will subtract the seconds and minutes until the timer expires
//* If the seconds remaining is greater than zero, decrease one
//* If the seconds is less than or equal to zero and minutes are greater than zero, subtract one minute and set seconds to 59
//* After updated minutes and seconds remaining, schedule the method to run itself in one second (instance method on NSObject to perform a selector after delay)
//* If minutes and seconds are equal to zero, log 'Timer Complete'

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var minutes: Int = 0
    var seconds: Int = 0
    var timer: NSTimer?

    func decreaseSecond() {
        var totalSeconds = minutes + (seconds*60)
        
        println("Minutes: \(minutes); Seconds: \(seconds)")
        
        seconds--
        if (seconds < 0) {
            seconds = 59
            minutes--
            if (minutes < 0) {
                println("Timer Complete")
                minutes = 0
                seconds = 0
                timer!.invalidate()
            }
        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        minutes = 0
        seconds = 10
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("decreaseSecond"), userInfo: nil, repeats: true)

        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

