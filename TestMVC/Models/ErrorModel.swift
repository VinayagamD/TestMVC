//
// Created by VinayLogics on 31/05/17.
// Copyright (c) 2017 VinayLogics. All rights reserved.
//

import Foundation

class ErrorModel {
    static let UNAUTHORIZE = 1
    static let FORMAT = 2
    static let INVALID = 3
    static let UNKNOWN = 4
    static let SERVER = 5

    var code : Int!
    var message : String?
    var error : Error?
}
