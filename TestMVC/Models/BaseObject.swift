//
// Created by VinayLogics on 31/05/17.
// Copyright (c) 2017 VinayLogics. All rights reserved.
//

import Foundation

class BaseObject<T>  {
    
    var message :String?

    
    public  required init() {
        
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

    public func parseData<T>
    
    

}
