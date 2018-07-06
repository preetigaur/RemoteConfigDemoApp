//
//  Constants.swift
//  RemoteConfigDemoApp
//
//  Created by Preeti Gaur on 26/06/18.
//  Copyright © 2018 Preeti Gaur. All rights reserved.
//

import UIKit
import Firebase

class Constants: NSObject {
    
    
    var remoteConfig:RemoteConfig!
    
    //Constant Keys
    let ButtonColorConfigKey = "ButtonColor"
    let ButtonTextColorConfigKey = "ButtonTextColor"
    let ButtonTextConfigKey = "ButtonText"
    
    func setupApp(){
        //Create Firebase defaults and make them accessible to the class
        configureDefaultRemoteConfigValues()
        
        //Fetch remote config values from Firebase
        remoteConfig.fetch(withExpirationDuration: 0) { (status, error) -> Void in
            if (status == RemoteConfigFetchStatus.success) {
                print("Remote Config is fetched!")
                self.remoteConfig.activateFetched()
                
            } else {
                print("Remote Config is not fetched")
                print("Error \(error!.localizedDescription)")
            }
        }
    }
    
    func configureDefaultRemoteConfigValues() {
        
        //Instantiate the variable remoteConfig as an instance of Firebase remoteConfig
        remoteConfig = RemoteConfig.remoteConfig()
        
        //Enable developer mode. This ensure that the client side throttle is never reached and will allow data to be refreshed during development. This is set to false for production.
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: true)
        
        //Instantiate config settings of the remote config variable
        remoteConfig.configSettings = remoteConfigSettings!
        
        //Point remote config to the plist containing the default values
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaultValues")
        
        
    }
    
    func getButtonText()-> String {
        //Instantiate Firebase Defaults
        configureDefaultRemoteConfigValues()
        
        //Return button Text Default Value
        return self.remoteConfig["ButtonText"].stringValue!
    }
    
    func getButtonBackgroundColor()-> String {
        configureDefaultRemoteConfigValues()
        return self.remoteConfig[Constants().ButtonColorConfigKey].stringValue!
    }
    
    func getButtonTextColor()-> String {
        configureDefaultRemoteConfigValues()
        return self.remoteConfig[Constants().ButtonTextColorConfigKey].stringValue!
    }
}
