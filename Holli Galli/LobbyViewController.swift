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
}

class LobbyViewController: UIViewController, UITableViewDelegate {
    
    private var playerName = PlayerName.playerName
    let db = Firestore.firestore()
    
    private var playerNames: [PlayerNames] = []
    private var documents: [DocumentSnapshot] = []

    @IBOutlet weak var playerTableView: UITableView!
    let backgroundView = UIImageView()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        query = baseQuery()
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
        observeQuery()
      }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopObserving()
      }
}

extension LobbyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return playerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = playerNames[indexPath.row].name
        return cell
    }
}