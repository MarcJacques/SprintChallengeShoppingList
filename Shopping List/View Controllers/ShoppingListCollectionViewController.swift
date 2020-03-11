//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Marc Jacques on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShopCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemsController = ShoppingItemsController()
    var numberOfItems = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        self.clearsSelectionOnViewWillAppear = false
        collectionView?.dataSource = self
        collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemsController.shoppingList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingItem = shoppingItemsController.shoppingList[indexPath.item]
        cell.shoppingItem = shoppingItem
        cell.shoppingItemsController = shoppingItemsController
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = collectionView.cellForItem(at: indexPath) as? ShoppingItemCollectionViewCell else {return}
        shoppingItemsController.Added(for: item.shoppingItem!)
        
        collectionView.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrderDetailSegue" {
            if let submitOrderDetailVC = segue.destination as? SubmitOrderDetailViewController {
                submitOrderDetailVC.shoppingItemsController = shoppingItemsController
            }
        }
    }
}
