//
//  SubmitOrderDetailViewController.swift
//  Shopping List
//
//  Created by Marc Jacques on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderDetailViewController: UIViewController {
    
    @IBOutlet var itemsInCartLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    var numberOfItems: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let num = numberOfItems else { return }
        print(num)
        itemsInCartLabel.text = "You currently have \(num) item(s) in your shopping list."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func placeOrderTapped(_ sender: Any) {
        guard let name = nameTextField.text, let addr = addressTextField.text else { return }
        
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your shopping items will be delivered to \(addr)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
