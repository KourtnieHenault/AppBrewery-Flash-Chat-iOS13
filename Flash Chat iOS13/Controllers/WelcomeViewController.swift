//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let title = "⚡️FlashChat"
        
        animateTitleLabel(label: titleLabel, title: title)
    }
    
    func animateTitleLabel(label: UILabel, title: String) {

        var charIndex = 0.0

        for character in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(character)

            }
            charIndex += 1.0
        }
    }

}
