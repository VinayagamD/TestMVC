//
// Created by VinayLogics on 31/05/17.
// Copyright (c) 2017 VinayLogics. All rights reserved.
//

import Foundation

class ResponseModel<T> : BaseObject where T:BaseObject {
    var message : String?
    var output : T?

    public override init() {
        super.init()
    }

    public convenience init(data: NSDictionary?) {
        self.init()
         if let message = data?["message"]{
           self.message = message as? String
        }

        if let output = data?["output"]{
            self.output = BaseObject(data: output as? NSDictionary) as? T
        }
    }

}
