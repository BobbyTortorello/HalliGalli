//
//  LobbyViewController.swift
//  Holli Galli
//
//  Created by Jack Delahunty on 3/21/20.
//  Copyright © 2020 App Industries Inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore


struct PlayerName {
    static var playerName = [QueryDocumentSnapshot]()
    static var playerReady = [QueryDocumentSnapshot]()
}

class LobbyViewController: UIViewController, UITableViewDelegate, SpecificPlayerName {
    
    func addingPlayerName(playerName: String) {
        
    }
    
    private var playerName = PlayerName.playerName
    var playerReady = PlayerName.playerReady

    let db = Firestore.firestore()
    
    private var playerNames: [PlayerNames] = []
    private var documents: [DocumentSnapshot] = []

    @IBOutlet weak var playerTableView: UITableView!
    let backgroundView = UIImageView()
    
    var specifcPlayerName = String()
    
    var defaults = UserDefaults.standard
        
    @IBAction func readyUpButton(_ sender: UIButton)
    {
        db.collection("playerNames").document("\(defaults.object(forKey: "playerName") ?? String())").updateData([
            "playerReady": true
        ])
    }
    
    //MARK: Start of FireBase Functions
    fileprivate var query: Query? {
        didSet {
          if let listener = listener {
            listener.remove()
            observeQuery()
            }
        }
    }

      private var listener: ListenerRegistration?

      fileprivate func observeQuery() {
        guard let query = query else { return }
        stopObserving()
        
        // Display data from Firestore, part one
        listener = query.addSnapshotListener { [unowned self] (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching snapshot results: \(error!)")
                return
            }
            let models = snapshot.documents.map({ (document) -> PlayerNames in
                if let model = PlayerNames(dictionary: document.data()) {
                    return model
                } else {
                    print(self.playerNames.count)
                    preconditionFailure("Unable to initialize \(PlayerNames.self) with type \(document.data())")
                }
            })

            self.playerNames = models
            self.documents = snapshot.documents
            
            if self.documents.count > 0 {
                self.playerTableView.backgroundView = nil
                print("\(self.documents.count) Document Count")
            } else {
                self.playerTableView.backgroundView = self.backgroundView
            }
            
            self.playerTableView.reloadData()
        }

      }

      fileprivate func stopObserving() {
        listener?.remove()
      }

      fileprivate func baseQuery() -> Query {
        // Firestore needs to use Timestamp type instead of Date type.
        // https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/FirestoreSettings
        let firestore: Firestore = Firestore.firestore()
        return firestore.collection("playerNames").limit(to: 99)
      }
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        query = baseQuery()
        self.navigationItem.hidesBackButton = true
    }//end of viewDidLoad
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
        observeQuery()
      }//end of viewWillAppear
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopObserving()
      }//end of viewWillDisappear
}//end of class

extension LobbyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return playerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = playerNames[indexPath.row].playerName
        
        if playerNames[indexPath.row].playerReady == false {
            cell.imageView?.image = UIImage(named: "notReady")
        } else {
            cell.imageView?.image = UIImage(named: "ready")
        }
        return cell
    }
}
