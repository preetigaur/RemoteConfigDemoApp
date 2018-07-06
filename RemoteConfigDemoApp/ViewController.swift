//
//  ViewController.swift
//  RemoteConfigDemoApp
//
//  Created by Preeti Gaur on 26/06/18.
//  Copyright © 2018 Preeti Gaur. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var btnRandomButton: UIButton!
    @IBAction func btnReloadData_Click(_ sender: AnyObject) {
        
        Constants().setupApp()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func setupView() {
        
        btnRandomButton.backgroundColor = HelperMethods().hexStringToUIColor(Constants().getButtonBackgroundColor())
        
        btnRandomButton.setTitleColor(HelperMethods().hexStringToUIColor(Constants().getButtonTextColor()), for: UIControlState())
        
        btnRandomButton.setTitle(Constants().getButtonText(), for: UIControlState())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

