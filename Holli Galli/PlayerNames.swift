//
//  PlayerNames.swift
//  Holli Galli
//
//  Created by Bobby Tortorello on 3/21/20.
//  Copyright © 2020 App Industries Inc. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

struct PlayerNames {
    
    var playerName: String
    var playerReady: Bool
    
    var dictionaryString: [String: Any] {
        return [
            "playerName": playerName
        ]
    }
    
    var dictionaryBool: [Bool: Any] {
        return [
            Bool(): playerReady
        ]
    }
}

extension PlayerNames: DocumentSerializable {
    init?(dictionary: [String: Any]) {
        guard let playerName = dictionary["playerName"] as? String else {return nil}
        self.init(
            playerName: playerName
        )
    }
    
    init?(dictionaryB: [Bool: Any]) {
        guard (dictionaryB[playerReady] as? Bool) != nil else {return nil}
    }
}
