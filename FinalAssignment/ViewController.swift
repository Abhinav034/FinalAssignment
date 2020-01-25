//
//  ViewController.swift
//  FinalAssignment
//
//  Created by Abhinav Bhardwaj on 2020-01-24.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var productTextView: UITextView!
    
    var name:String?
    var id:String?
    var desc:String?
    var price:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         productTextView.text = "name:  " + name! + "\n" + "id:  " + id! + "\n" + "desc:  " + desc! + "\n" + "price:  " + price!
    }


}

