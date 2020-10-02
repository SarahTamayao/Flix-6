//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Tom Riddle on 9/28/20.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  @IBOutlet weak var collectionView: UICollectionView!
  var movies = [[String:Any]]();
  
    override func viewDidLoad() {
        super.viewDidLoad()
      collectionView.delegate = self;
      collectionView.dataSource = self;
      
      //custom layout
      let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout;

      layout.minimumLineSpacing = 4;
      layout.minimumInteritemSpacing = 4;

      //let width = CGFloat(300.0);
      let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3; //width of phone
      let height = width * 3 / 2;
      layout.itemSize = CGSize(width: width, height: height);
      //
      
      let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
        print(self.movies);
        self.collectionView.reloadData();
       }
      }
      task.resume();
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count;
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell;
    
    let movie = movies[indexPath.row];
    
    //build image url
    let baseUrl = "https://image.tmdb.org/t/p/w185";
    let posterPath = movie["poster_path"] as! String;
    let posterUrl = URL(string: baseUrl + posterPath);
    cell.posterView.af.setImage(withURL: posterUrl!);
    return cell;
  }
  
  //navigate to detail screen when a movie is selected
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let cell = sender as! UICollectionViewCell;
    let indexPath = collectionView.indexPath(for: cell)!;
    //data to pass to detailsViewcontroller
    let movie = movies[indexPath.row];
    
    let detailsViewController = segue.destination as! MovieDetailsViewController;
    detailsViewController.movie = movie;
    
  }
}
