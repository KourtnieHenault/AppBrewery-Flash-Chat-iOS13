//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    var messageRepository: PMessageRepository?
    let dispatchGroup = DispatchGroup()

    private var mockMessages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Date())

        messageRepository = MessageRepository(db: db)
        
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
        
    }
    
    func loadMessages() {
        
        messageRepository?.getAll(){ messages, error in
            if let e = error{
                return
            }

            self.mockMessages = messages as? [Message] ?? []
            self.tableView.reloadData()        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageRepo = messageRepository,
            let messageBody = messageTextfield.text,
            let messageSender = Auth.auth().currentUser?.email {
            
            messageRepo.create(message: Message(sender: messageSender, body: messageBody, timeStamp: Date())){ result, error in
                if result {
                    
                    self.messageTextfield.text = ""
                    
                }
                print(result)
            }
            
        }
        
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.label.text = mockMessages[indexPath.row].body
        
        return cell
    }
    
}
