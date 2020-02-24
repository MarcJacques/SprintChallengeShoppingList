//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Marc Jacques on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var shoppingItemsController: ShoppingItemsController?
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    var hasBeenAdded: Bool {
        didSet {
            guard let shoppingItemController = shoppingItemsController, let item = shoppingItem else { return }
            shoppingItemController.notAdded(for: item, hasBeenAdded: !item.hasBeenAdded)
            shoppingItem?.hasBeenAdded = !item.hasBeenAdded
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        itemImage.image = UIImage(named: shoppingItem.item)
        nameLabel.text = shoppingItem.item
        hasBeenAddedLabel.text = shoppingItem.hasBeenAdded ? "Added" : "Not Added"
    }
}
