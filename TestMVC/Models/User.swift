//
// Created by VinayLogics on 31/05/17.
// Copyright (c) 2017 VinayLogics. All rights reserved.
//

import Foundation

class User: BaseObject {

    typealias Success = (_ response: ResponseModel<User>?) -> Void
    typealias Fail = (_ response: ResponseModel<User>? , _ error: ErrorModel?) -> Void

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


    public override init() {
        super.init()
    }

    public convenience init(data: NSDictionary?) {
        self.init()
        if let userId = data?["user_id"] {
            self.userId = userId as? String
        }
        if let name = data?["name"] {
            self.name = name as? String
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

    public static func login(user : User, success: @escaping Success, fail: @escaping Fail){
        ApiManager.post(url: Urls.LOGIN, param: user.toLoginDict(), success: { (json) in
            let response = ResponseModel<User>(data: (json as? NSDictionary))
            success(response)
        }) { (json, error) in
            fail(nil ,error)
        }
       
    }

}
