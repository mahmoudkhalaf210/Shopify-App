//
//  ThankViewController.swift
//  Shopify
//
//  Created by Macintosh on 17/07/2022.
//

import UIKit

class ThankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func continueShooping(_ sender: Any) {
         performSegue(withIdentifier: "gotohome2", sender: self)
    }
   

}
