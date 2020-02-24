//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Marc Jacques on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem : Codable, Equatable {
    let item: String
    let hasBeenAdded: Bool
    
}
