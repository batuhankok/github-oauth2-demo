//
//  ViewController.swift
//  GitHubAuth
//
//  Created by Batuhan Kök on 02/04/2018.
//  Copyright © 2018 D-Teknoloji. All rights reserved.
//

import UIKit
import SafariServices
import Alamofire

let kSafariViewControllerCloseNotification = "kSafariViewControllerCloseNotification"

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    var safariVC: SFSafariViewController?
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var accessToken: UILabel!
    
    // data from your Github app
    let client_id = "your client id"
    let client_secret = "your client scret"
    let scope = "user repo:status"
    let redirect_uris = ["githuboauth://oauth/callback"] // same with Github app settings
    let token_uri = "https://github.com/login/oauth/access_token"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add observer to vc
        NotificationCenter.default.addObserver(self, selector: #selector(safariLogin(notification:)), name: NSNotification.Name(rawValue: kSafariViewControllerCloseNotification), object: nil)
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        // you can set the scope and client id
        if let stringUrl = "https://github.com/login/oauth/authorize?scope=\(scope)&client_id=\(client_id)".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed), let url = URL(string: stringUrl) {
            safariVC = SFSafariViewController(url: url)
            safariVC!.delegate = self
            self.present(safariVC!, animated: true, completion: nil)
        }
  
    }
    
    @objc func safariLogin(notification: NSNotification) {
        
        // returned url from Github
        let url = notification.object as! NSURL
        
        // returned code
        let code = self.getParameterFrom(url: String(describing: url), param: "code")
        
        // parameters for access token request
        let parameters = ["client_id": client_id, "client_secret": client_secret, "code": code!, "accept": "application/json"] as [String : Any]
        
        // get access token from Github with the code
        Alamofire.request(token_uri, method: .post, parameters: parameters).responseString { response in
            
            if let result = response.result.value, let makeItUrl = NSURL(string: "https://api.github.com/?\(result)") {
                
                if let access_code = self.getParameterFrom(url: String(describing: makeItUrl), param: "access_token") {
                    // # here is the access token # //
                    self.accessToken.text = access_code
                }
            }
            
        }
        
        // dismiss the Safari View Controller
        self.safariVC!.dismiss(animated: true, completion: nil)
    }
    
    // parse the parameters from the url string
    func getParameterFrom(url: String, param: String) -> String? {
        
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        
        // dismiss the SafariViewController
        controller.dismiss(animated: true)
    }

}
