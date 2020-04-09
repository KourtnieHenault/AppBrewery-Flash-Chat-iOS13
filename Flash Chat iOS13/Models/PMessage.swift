//
//  PMessage.swift
//  Flash Chat iOS13
//
//  Created by Kourtnie Jenkins on 4/9/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//
import Foundation

protocol PMessage {
    var sender: String { get }
    var body: String { get }
    var timeStamp: Date { get }
}
