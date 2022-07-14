//
//  Entity.swift
//  VIPERDEMO
//
//  Created by Neosoft1 on 07/07/22.
//

import Foundation
import RealmSwift

struct SomeData{
    var data : String?
}
struct Products:Codable{
    var id : Int
    var product_category: String?
    var name : String
    var producer: String
    var product_images: String
    var cost : Int
}

struct ProductData:Codable{
    var data:[Products]
}

//MODEL:
class DbProduct:Object{
    @objc dynamic var name:String?
    @objc dynamic var id:Int = 0
    @objc dynamic var producer:String?
}
