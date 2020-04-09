//
//  ModelRepository.swift
//  Flash Chat iOS13
//
//  Created by Kourtnie Jenkins on 4/8/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

protocol PMessageRepository {
    func getAll(completion: @escaping ([PMessage], Error?) -> Void)
    func get(identifier: String, completion: @escaping (PMessage, Error?) -> Void)
    func create(message: PMessage, completion: @escaping (Bool, Error?) -> Void)
    func update(message: PMessage, completion: @escaping (Bool, Error?) -> Void)
    func delete(message: PMessage, completion: @escaping (Bool, Error?) -> Void)
    
    //    func get(identifier: String) -> PMessage?
//    func create(message: PMessage) -> Bool
//    func update(message: PMessage) -> Bool
//    func delete(message: PMessage) -> Bool
}
