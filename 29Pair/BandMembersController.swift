//
//  BandMembersController.swift
//  29Pair
//
//  Created by Andrew Drechsel on 3/4/17.
//  Copyright © 2017 Andrew Drechsel. All rights reserved.
//

import Foundation
import UIKit

class BandMembersController {
    
    static let shared = BandMembersController()
    
    var members = [BandMembers]()
    
//    var members = ["Annie Clark", "Anna Calvi", "Regina Spektor", "Lana Del Rey", "Dave Grohl", "Andrew Drechsel", "Kimbra", "Beyonce", "Rihanna", "Jimmy Page"]
    
    func add(name: String) {
        
        let newBandMember = BandMembers(name: name)
        members.append(newBandMember)
    }
    
}
