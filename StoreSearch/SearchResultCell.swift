//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Shaohui Yang on 12/9/15.
//  Copyright © 2015 Shaohui Yang. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
// MARK: - variables and outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    
// MARK: - app action methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
