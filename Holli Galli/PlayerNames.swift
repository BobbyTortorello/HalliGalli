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
    
    var name: String
    
    var dictionaryString: [String: Any] {
        return [
            "playerName": name
        ]
    }
}

extension PlayerNames: DocumentSerializable {
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["playerName"] as? String else {return nil}
        self.init(
            name: name
        )
    }
}
