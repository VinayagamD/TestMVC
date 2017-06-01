//
// Created by VinayLogics on 31/05/17.
// Copyright (c) 2017 VinayLogics. All rights reserved.
//

import Foundation

class Utils {
    public static func getDeviceUser()-> User{
        let user = User()
        user.fcmToken = "abcd123"
        user.deviceKey = "abcd123456"
        user.deviceOs = "iOS"
        user.osVersion = "10.1"
        user.loginType = "mobile"

        return user
    }
}
