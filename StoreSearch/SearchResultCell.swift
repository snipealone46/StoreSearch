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
    var downloadTask: NSURLSessionDownloadTask?
    
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
// MARK: - cell support methods
    func configureForSearchResult(searchResult: SearchResult) {
        nameLabel.text = searchResult.name
        
        if searchResult.artistName.isEmpty {
            artistNameLabel.text = "Unknown"
        } else {
            artistNameLabel.text = String(format: "%@ (%@)", searchResult.artistName, kindForDisplay(searchResult.kind))
        }
        artworkImageView.image = UIImage(named: "Placeholder")
        if let url = NSURL(string: searchResult.artworkURL60) {
            downloadTask = artworkImageView.loadImageWithURL(url)
        }
    }
    
    func kindForDisplay(kind: String) -> String {
        switch kind {
        case "album": return "Album"
        case "audiobook": return "Audio Book"
        case "book": return "Book"
        case "ebook": return "E-book"
        case "feature-movie": return "Movie"
        case "music-video": return "Music Video"
        case "podcast": return "Podcast"
        case "software": return "App"
        case "song": return "App"
        case "tv-episode": return "TV Episode"
        default: return kind
        }
    }
    //cancel the pending download if user already scroll pass the cell
    override func prepareForReuse() {
        super.prepareForReuse()
        
        downloadTask?.cancel()
        downloadTask = nil
        nameLabel.text = nil
        artistNameLabel.text = nil
        artworkImageView.image = nil
        
    }
    

}
