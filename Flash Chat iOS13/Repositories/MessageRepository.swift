//
//  MessageRepository.swift
//  Flash Chat iOS13
//
//  Created by Kourtnie Jenkins on 4/8/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import Firebase

class MessageRepository: PMessageRepository {
    
    private let db: Firestore
    
    init(db: Firestore){
        self.db = db
    }
    
    func getAll(completion: @escaping ([PMessage], Error?) -> Void) {
        
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { (querySnapshot, error) in
            
            var messages: [PMessage] = []
            
            if let e = error {
                
                print("There was an issue retreiving data from the Firestore. \(e)")
                completion(messages, e)
                return
                
            } else {
                
                if let snapshotDocument = querySnapshot?.documents {
                    
                    for doc in snapshotDocument {
                        let data = doc.data()
                        if let sender = data[K.FStore.senderField] as? String,
                            let body = data[K.FStore.bodyField] as? String,
                            let timestamp = data[K.FStore.dateField] as? Timestamp{
                            
                            let message = Message(sender: sender, body: body, timeStamp: timestamp.dateValue())
                            
                                messages.append(message)
                            
                    }
                }
                completion(messages, nil)
                
                }
            }
        
        }
    }
    
    func get(identifier: String, completion: @escaping (PMessage, Error?) -> Void){
        //not implemented
    }
    
    func create(message: PMessage, completion: @escaping (Bool, Error?) -> Void){
        
        db.collection(K.FStore.collectionName).addDocument(data: [
            K.FStore.senderField: message.sender,
            K.FStore.bodyField: message.body,
            K.FStore.dateField: message.timeStamp
        ]) { (error) in
            
            if let e = error {
                
                print("There was an issue saving data to Firestore. \(e)")
                completion(false, e)
                
            }else {
                
                completion(true, nil)
                
            }
            
        }
    }
    
    func update(message: PMessage, completion: @escaping (Bool, Error?) -> Void){
     //not implemented
    }
    
    func delete(message: PMessage, completion: @escaping (Bool, Error?) -> Void){
        //not implemented
    }
    
    func create(message: PMessage) -> Bool {
        
        var result = true
        
        db.collection(K.FStore.collectionName).addDocument(data: [
            K.FStore.senderField: message.sender,
            K.FStore.bodyField: message.body
        ]) { (error) in
            if let e = error {
                print(e)
                result = false
            }
        }
        
        return result
    }
    
    func update(message: PMessage) -> Bool {
        //Not implemented
        return false
    }
    
    func delete(message: PMessage) -> Bool {
        //Not implemented
        return false
    }

}
