//  Created by ac1ra on 12/12/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import Foundation

class gym {
    var name: String
    var type:String
    var local:String
    var image:String
    var description: String
    var phone: String
    
    var isVisited: Bool
    var rating: String
    
    init(name:String,type:String,local:String,image:String,description:String,phone:String,isVisited:Bool,rating: String="") {
        self.name = name
        self.type = type
        self.local = local
        self.image = image
        self.description = description
        self.phone = phone
        self.isVisited = isVisited
        self.rating = rating
    }
    
    convenience init() {
        self.init(name:"",type:"",local:"",image:"",description:"",phone:"",isVisited:false)
    }
}
