//
//  BaseObject.swift
//  DemoTrain
//
//  Created by Nguyễn Thành on 10/5/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import Foundation
import ObjectMapper

class EmployeeObject: Mappable {
    var employees: [EmployeeBO]?
    
    init() {
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        employees <- map["employees"]
    }
}

class EmployeeBO: Mappable {
    var id: String?
    var createdAt: String?
    var name: String?
    var avatar: String?
    var address: String?
    var isMale: Bool = false
    var status: Int?
    var level: Level?
    var dayWorking: Int = 0 {
        didSet {
            if dayWorking < 60 {
                level = .Intern
            } else if dayWorking > 200 {
                level = .Senior
            } else {
                level = .Junior
            }
        }
    }
    
    init() {
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        createdAt <- map["createdAt"]
        name <- map["name"]
        avatar <- map["avatar"]
        address <- map["address"]
        isMale <- map["isMale"]
        status <- map["status"]
        dayWorking <- map["dayWorking"]
    }
}

enum Level: String
{
    case Intern = "Intern"
    case Junior = "Junior"
    case Senior = "Senior"
    
}
