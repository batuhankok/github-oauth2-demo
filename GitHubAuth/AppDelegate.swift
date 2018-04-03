//
//  AppDelegate.swift
//  GitHubAuth
//
//  Created by Batuhan Kök on 02/04/2018.
//  Copyright © 2018 D-Teknoloji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // handle deeplink (note that you have to set the url's in info.plist)
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        if "githubauth" == url.scheme || (url.scheme?.hasPrefix("me.batuhan.GitHubAuth"))! { // change the schemes
            
            if (window?.rootViewController as? ViewController) != nil {
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: kSafariViewControllerCloseNotification), object: url)
                return true
            }
        }
        
        return false
    }

}
