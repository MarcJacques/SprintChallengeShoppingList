//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Marc Jacques on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.


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
    
    override var isSelected: Bool {
        didSet {
            guard let shoppingItemsController = shoppingItemsController, let item = shoppingItem else { return }
            shoppingItemsController.Added(for: item)
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
