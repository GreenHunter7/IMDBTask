//
//  MovieCell.swift
//  ImdbTask
//
//  Created by Mohamed Hussien on 25/06/2018.
//  Copyright © 2018 Mohamed Hussien. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var movieDesciptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
