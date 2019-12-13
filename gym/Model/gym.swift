//  Created by ac1ra on 12/12/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import Foundation

class gym {
    var name: String
    var type:String
    var local:String
    var image:String
    var isVisited: Bool
    
    init(name:String,type:String,local:String,image:String,isVisited:Bool) {
        self.name = name
        self.type = type
        self.local = local
        self.image = image
        self.isVisited = isVisited
    }
    
    convenience init() {
        self.init(name:"",type:"",local:"",image:"",isVisited:false)
    }
}
