//
//  MoviesViewController.swift
//  Flix
//
//  Created by Tom Riddle on 9/20/20.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  var movies = [[String:Any]]();
  
  @IBOutlet weak var tableView: UITableView!;
  
  override func viewDidLoad() {
      super.viewDidLoad()

      tableView.dataSource = self;
      tableView.delegate = self;
      // Do any additional setup after loading the view.
      print("hello my flix");
      let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
          self.movies = dataDictionary["results"] as! [[String:Any]];
        // TODO: Reload your table view data
          self.tableView.reloadData();

       }
      }
      task.resume();
      print(self.movies.count);
  }
   
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count;
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell;
    
    let movie = movies[indexPath.row];
    let title = movie["title"] as! String;
    let synopsis = movie["overview"] as! String;
    
    cell.titleLabel?.text = title;
    cell.synopsisLabel?.text = synopsis;
    
    //build image url
    let baseUrl = "https://image.tmdb.org/t/p/w185";
    let posterPath = movie["poster_path"] as! String;
    let posterUrl = URL(string: baseUrl + posterPath);
    
    cell.posterView.af.setImage(withURL: posterUrl!);
    return cell;
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print("Loading up the details screen");
    let cell = sender as! UITableViewCell;
    let indexPath = tableView.indexPath(for: cell)!;
    let movie = movies[indexPath.row];
    
    let detailsViewController = segue.destination as! MovieDetailsViewController;
    detailsViewController.movie = movie;
    
    tableView.deselectRow(at: indexPath, animated: true);
  }

}
