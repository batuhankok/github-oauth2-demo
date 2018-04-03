![GitHub OAuth2 Demo](https://github.com/batuhankok/github-oauth2-demo/raw/master/github-icon.png "GitHub OAuth2 Demo")

## GitHub OAuth2 Demo with Swift 4 & Alamofire

[![Programming Language](https://img.shields.io/badge/languages-Swift_4-green.svg?style=flat)](#)
[![GNU v3 License](https://img.shields.io/badge/license-GNU-yellow.svg?style=flat)](http://choosealicense.com/licenses/gpl-3.0/)
[![Twitter](https://img.shields.io/badge/twitter-@BatuhanKok-blue.svg?style=flat)](http://twitter.com/BatuhanKok)
[![Website](https://img.shields.io/badge/website-batuhan.me-lightgrey.svg?style=flat)](http://batuhan.me)
[![Contact](https://img.shields.io/badge/contact-here!-brightgreen.svg?style=flat)](http://batuhan.me/contact)

This demo application shows you how to implement GitHub login with OAuth2 to your apps in a VERY SIMPLE way.
I researched OAuth2 authentication demo to use in my personal project, but there wasn't any simple one and everyone of them was full of little and hard to solve box. I decided to do it myself and share it with you.

#### Do not forget to change these:

1. ViewController
```swift
// data from your Github app
let client_id = "your client id"
let client_secret = "your client scret"
let scope = "user repo:status"
let redirect_uris = ["githuboauth://oauth/callback"] // same with Github app settings
let token_uri = "https://github.com/login/oauth/access_token"
```
2. AppDelegate
```swift
...
"githubauth" == url.scheme || (url.scheme?.hasPrefix("me.batuhan.GitHubAuth")) // change the schemes
...
```


Hope you enjoy it and find it useful 🤓

*Note: I could defined the whole project: "It just works". Sorry for that.*
