//
//  PhotosViewController.swift
//  Tumblr
//
//  Created by Dhriti Chawla on 1/10/18.
//  Copyright © 2018 Dhriti Chawla. All rights reserved.
//

import UIKit
import AlamofireImage


class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts: [[String: Any]] = []
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(PhotosViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        myTable.insertSubview(refreshControl, at: 0)
        
        myTable.delegate = self
        myTable.dataSource = self
        fetchData()

        // Do any additional setup after loading the view.
//        // Network request snippet
//        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data,
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                print(dataDictionary)
//
//                // TODO: Get the posts and store in posts property
//
//                // Get the dictionary from the response key
//                let responseDictionary = dataDictionary["response"] as! [String: Any]
//                // Store the returned array of dictionaries in our posts property
//                self.posts = responseDictionary["posts"] as! [[String: Any]]
//
//                // TODO: Reload the table view
//               self.myTable.reloadData()
//            }
//        }
//        task.resume()
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ myTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(posts.count)
        return posts.count
    }
    
    func tableView(_ myTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = myTable.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
        
        //cell.textLabel?.text = "This is row \(indexPath.row)"
        
        let post = posts[indexPath.row]
        
        if let photos = post["photos"] as? [[String: Any]] {
            // photos is NOT nil, we can use it!
            // TODO: Get the photo url
            
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
            let urlString = originalSize["url"] as! String
            print(urlString)
            // 4.
            let url = URL(string: urlString)
            cell.myImage.af_setImage(withURL: url!)
        }
        
        
        return cell
    }
    
    func fetchData () {
        
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                // TODO: Get the posts and store in posts property
                
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                // Store the returned array of dictionaries in our posts property
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                
                // TODO: Reload the table view
                self.myTable.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
        task.resume()
        
    }
    
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
//
//        // Configure YourCustomCell using the outlets that you've defined.
//
//        return cell
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
