//
//  RequestApi.swift
//  DemoTrain
//
//  Created by Nguyễn Thành on 10/5/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class CallBaseApi: NSObject {
    class var sharedInstance: CallBaseApi {
        struct Singleton {
            static let instance = CallBaseApi()
        }
        return Singleton.instance
    }
    func getEmployees<T:Mappable>(success: @escaping (T) -> Void) {
        guard let url = URL(string: "https://my-json-server.typicode.com/vantrung8794/ttcTrainingRepo/db") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard let jsonData = try? JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String: Any] else {return}
            if let result = Mapper<T>().map(JSON: jsonData) {
                success(result)
            }
        }
        task.resume()
    }
    
}

