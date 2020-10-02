//
//  MovieCell.swift
//  Flix
//
//  Created by Tom Riddle on 9/20/20.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var synopsisLabel: UILabel!
  @IBOutlet weak var posterView: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        self.layer.borderWidth = 1.0;
        //set color
        let color = CGColor(red: 12.0/255.0, green: 31.0/255.0, blue: 199.0/255.0, alpha: CGFloat(0.5));
        self.layer.borderColor = color;
        
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
