//
//  ViewController.swift
//  Holli Galli
//
//  Created by Bobby Tortorello on 3/21/20.
//  Copyright © 2020 App Industries Inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore


class ViewController: UIViewController {

    let db = Firestore.firestore()
    var playerName = String()
    var playerDelegate: SpecificPlayerName?
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func joinGameButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "What is your name?", message: "Enter name in field below!", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let okay = UIAlertAction(title: "Okay", style: .default) { (action) in
            let textField = alert.textFields![0]
            self.playerName = textField.text!
            self.db.collection("playerNames").document("\(self.playerName)").setData([
                "playerName" : self.playerName,
                "playerReady" : false
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                    let alert = UIAlertController(title: "Error Occurred", message: "Please Try Again", preferredStyle: .alert)
                    let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
                    alert.addAction(okay)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    let vc = self.storyboard?.instantiateViewController(identifier: "lobbyVC")
                    self.navigationController?.show(vc!, sender: nil)
                    self.defaults.set(textField.text!, forKey: "playerName")
                }
            }
        }
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
    }
}

protocol SpecificPlayerName: class {
    func addingPlayerName(playerName: String)
}
