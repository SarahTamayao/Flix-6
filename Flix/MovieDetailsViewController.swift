//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Tom Riddle on 9/28/20.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
  
  @IBOutlet weak var backdropView: UIImageView!
  @IBOutlet weak var posterView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var synopsisLabel: UILabel!
  var movie: [String:Any]!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      if let movieId = movie["id"]{
        let test : String = "hello id: \(movieId)";
        print(test);
      }
      print(movie["title"]!);
      titleLabel.text = movie["title"] as? String;
      synopsisLabel.text = movie["overview"] as? String;
      
      let baseUrl = "https://image.tmdb.org/t/p/w185";
      let posterPath = movie["poster_path"] as! String;
      let posterUrl = URL(string: baseUrl + posterPath);
      
      posterView.af.setImage(withURL: posterUrl!);
      
      let backdropPath = movie["backdrop_path"] as! String;
      let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath);
      backdropView.af.setImage(withURL: backdropUrl!);
      
      //setup tap event for poster
      let oneTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected));
      posterView.isUserInteractionEnabled = true;
      posterView.addGestureRecognizer(oneTap);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  @objc func tapDetected() {
    print("Imageview Cliked");
    performSegue(withIdentifier: "videoSegue", sender: nil);
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let movieId = movie["id"] {
      let videoViewController = segue.destination as! VideoViewController;
      videoViewController.movieId = movieId;
    } else {
      print("Movie doesn't have trailer");
    }
  }
}
