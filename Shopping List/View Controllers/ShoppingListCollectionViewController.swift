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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
    
        // Configure the cell
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "ShowOrderDetailSegue" {
                if let submitOrderDetailVC = segue.destination as? SubmitOrderDetailViewController {
                    submitOrderDetailVC.numberOfItems = String(shoppingItemsController.addedItems.count)
                }
            }
        }
}
