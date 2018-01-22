//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Dhriti Chawla on 1/17/18.
//  Copyright © 2018 Dhriti Chawla. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    
    
    
    var url = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "HumansOfNewYork"
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.tintColor = UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 0.8)
            
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.gray.withAlphaComponent(0.5)
            shadow.shadowBlurRadius = 4
            navigationBar.titleTextAttributes = [
                NSAttributedStringKey.foregroundColor : UIColor(red: 0.8, green: 0.15, blue: 0.15, alpha: 0.8),
                NSAttributedStringKey.shadow : shadow
            ]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
