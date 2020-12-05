//
//  ViewController.swift
//  HelloWorld
//
//  Created by sentilab on 12/07/2019.
//  Copyright © 2019 sentilab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func Click_moveBtn(_ sender: Any) {
        //storyboard find controller : DetailController
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") {
           self.navigationController?.pushViewController(controller, animated: true)
        }
        
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
}

