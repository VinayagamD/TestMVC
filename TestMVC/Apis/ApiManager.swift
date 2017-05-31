//
// Created by VinayLogics on 31/05/17.
// Copyright (c) 2017 VinayLogics. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
    typealias Success = (_ json: Any?) -> Void
    typealias Fail = (_ json: Any? , _ error: ErrorModel?) -> Void

    public static func post(url : String, param : NSDictionary, success: @escaping Success, fail: @escaping Fail){
        let url = URL(string: url)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"



        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: param, options: [])
        } catch {
            // No-op
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        Alamofire.request(urlRequest).validate(statusCode: 200..<300 ).responseJSON { response in
            switch response.result{
            case .success(let data) :

                success(data)

            case .failure(let error) :
                let errorModel:ErrorModel = ErrorModel()
                errorModel.error = error;
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {

                    case 401:
                        errorModel.code = ErrorModel.UNAUTHORIZE
                    default:
                        errorModel.code = ErrorModel.INVALID

                    }
                } else {
                    errorModel.code = ErrorModel.UNKNOWN
                }
                errorModel.message = error.localizedDescription
                fail(nil , errorModel)
                break

            }
         }


    }

}
