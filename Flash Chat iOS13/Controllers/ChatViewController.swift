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

    private var mockMessages: [Message] = [
        Message(sender: "User1", body: "Scelerisque fermentum dui faucibus in ornare quam viverra orci."),
        Message(sender: "User2", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut pharetra sit amet aliquam id. Id consectetur purus ut faucibus pulvinar elementum integer enim."),
        Message(sender: "User3", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
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
