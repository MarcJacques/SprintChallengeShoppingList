//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Marc Jacques on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemsController {
    private(set) var shoppingList: [ShoppingItem] = []
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var addedItems: [ShoppingItem] {
        let added = shoppingList.filter { $0.hasBeenAdded == true }
        return added
    }
    
    let userDefaults = UserDefaults.standard
    
    init() {
        let hasList: Bool = UserDefaults.standard.bool(forKey: "hasList")
        if hasList {
            loadFromPersistentStore()
        } else {
            for i in 0..<itemNames.count {
                shoppingList.append(ShoppingItem(item: itemNames[i], hasBeenAdded: false))
            }
            saveToPersistentStore()
            
            userDefaults.set(true, forKey: "hasList")
        }
    }
    
    func notAdded(for shoppingItem: ShoppingItem, hasBeenAdded: Bool) {
        guard let index = shoppingList.firstIndex(of: shoppingItem) else { return }
        shoppingList[index].hasBeenAdded = hasBeenAdded
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving shopping list: \(error)")
        }
    }
    
    func loadFromPersistentStore(){
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error encountered while loading list: \(error)")
        }
    }
}

