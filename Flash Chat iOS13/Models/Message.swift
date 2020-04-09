//
//  Message.swift
//  Flash Chat iOS13
//
//  Created by Kourtnie Jenkins on 4/9/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct Message: PMessage {
    var sender: String
    var body: String
    var timeStamp: Date
}
