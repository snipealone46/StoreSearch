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
    //awakeFromNib method is called after this cell object has been loaded from the nib
    //but before the cell is added to the table view
    //use this method to do additional work to prepare the object for use
    //similar with the viewDidLoad() in a view controller
    override func awakeFromNib() {
        super.awakeFromNib()
        // change the row color when it is selected
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 0.5)
        selectedBackgroundView = selectedView
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
