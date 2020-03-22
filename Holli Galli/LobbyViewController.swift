//
//  LobbyViewController.swift
//  Holli Galli
//
//  Created by Jack Delahunty on 3/21/20.
//  Copyright © 2020 App Industries Inc. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var playerNames = [""]

    @IBOutlet weak var playerTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return playerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = playerNames[indexPath.row]
        return cell
    }

}
