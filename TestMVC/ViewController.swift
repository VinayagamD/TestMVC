//
//  ViewController.swift
//  TestMVC
//
//  Created by VinayLogics on 31/05/17.
//  Copyright (c) 2017 VinayLogics. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var emailTextFeild: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }



    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let user = Utils.getDeviceUser()
        user.email = emailTextFeild.text
        user.password = passwordTextField.text
        User.login(user: user, success: { (response) in
            print(response as Any)
            print(response?.output as Any)
            print(response?.output?.userId as Any)
        }) { (response, error) in
            print(error as Any)
            print(error?.code as Any)
            print(error?.message as Any)
            print(error?.error as Any)
        }
    }
}
