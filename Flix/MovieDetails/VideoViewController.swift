//
//  VideoViewController.swift
//  Flix
//
//  Created by Tom Riddle on 9/30/20.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController{

  @IBOutlet weak var webView: WKWebView!
  var movieId : Any?
  var dataDictionary = [[String:Any]]()
  var data = [[String:Any]]();
  override func viewDidLoad() {
        super.viewDidLoad()
      
    print("videoviewcontroller didload");
        // Do any additional setup after loading the view.
    //make request to get videoKey from API
    if let id = movieId {
        let apiKey : String = "a07e22bc18f5cb106bfe4cc1f83ad8ed";
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(apiKey)&language=en-US")!;
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
         // This will run when the network request returns
         if let error = error {
            print(error.localizedDescription)
         } else if let data = data {
          // TODO: Get the array of movies
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
          // TODO: Store the movies in a property to use elsewhere
            self.data = dataDictionary["results"] as! [[String:Any]];
          // TODO: load the video
          if let videoKey = self.data[0]["key"] {
            let videoURL = URL(string: "https://www.youtube.com/watch?v=\(videoKey)&ab_channel=SuperAnon9876");
            let videoRequest = URLRequest(url: videoURL!);
            self.webView.load(videoRequest);
          }
          
         }
        }
        task.resume();
      }
    }
    

  @IBAction func touchCloseBtn(_ sender: Any) {
    dismiss(animated: true, completion: nil);
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//  override func loadView() {
//    webView.uiDelegate = self;
//    
//  }
}
