//
// Created by VinayLogics on 31/05/17.
// Copyright (c) 2017 VinayLogics. All rights reserved.
//

import Foundation

class User:NSObject {

    typealias Success = (_ response: User?) -> Void
    typealias Fail = (_ response: User? , _ error: ErrorModel?) -> Void

    var mobile: String?
    var password: String?
    var deviceKey: String?
    var deviceOs: String?
    var osVersion: String?
    var fcmToken: String?
    var loginType: String?
    var userId: String?
    var name: String?
    var dob: String?
    var gender: String?
    var email: String?
    var mobileVerified: String?
    var authKey: String?
    var profilePicture: String?
    var profileStatus: String?
    var message :String?
    var output : User?


    public override init() {
        super.init()
    }



    public convenience init(data: NSDictionary?) {
        self.init()
        if let message =  data?["message"]{
            self.message = message as? String
        }
        if let output = data?["output"]{
            self.output = parseData(user: User.init(), data: output as? NSDictionary)
        }


    }

    public func toLoginDict() -> NSDictionary {
        let loginDict = NSMutableDictionary()
        loginDict.setValue(mobile, forKey: "mobile")
        loginDict.setValue(password, forKey: "password")
        loginDict.setValue(deviceKey, forKey: "device_key")
        loginDict.setValue(deviceOs, forKey: "device_os")
        loginDict.setValue(osVersion, forKey: "os_version")
        loginDict.setValue(fcmToken, forKey: "FCM_token")
        loginDict.setValue(loginType, forKey: "login_type")

        return loginDict
    }


    private func parseData(user : User ,data: NSDictionary?) -> User{
        if let userId = data?["user_id"] {
            user.userId = userId as? String
        }
        if let name = data?["name"] {
            user.name = name as? String
        }

        return user
    }

    
    


    public static func login(user : User, success: @escaping Success, fail: @escaping Fail){
        ApiManager.post(url: Urls.LOGIN, param: user.toLoginDict(), success: { (json) in
            let response = User(data: (json as? NSDictionary))
            success(response)
        }) { (json, error) in
            fail(nil ,error)
        }
       
    }

}
