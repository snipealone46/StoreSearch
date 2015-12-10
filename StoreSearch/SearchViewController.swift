//
//  ViewController.swift
//  StoreSearch
//
//  Created by Shaohui Yang on 12/9/15.
//  Copyright © 2015 Shaohui Yang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
// MARK: - variables, outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchResults = [SearchResult]()
    //fix the ("No result") shows even the user hasn't searched anything
    var hasSearched = false
    
    
// MARK: - app action methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //tell the tableView to have a top margin for the status bar and search bar
        //20 points for the status bar, 44 points for the search bar
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: - app function methods
    


}
// MARK: - extensions
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        hasSearched = true
        searchBar.resignFirstResponder()
        searchResults = [SearchResult]()
        if searchBar.text! != "hey" {
        for i in 0...2 {
            //%@ is for all kinds of objects, e.g. Strings
            let searchResult = SearchResult()
            searchResult.name = String(format: "Fake result %d is:", i )
            searchResult.artistName = searchBar.text!
            searchResults.append(searchResult)
        }
        
        
        }
        tableView.reloadData()
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        //fixed the white gap above the search bar
        return .TopAttached
    }
}

// UITableViewDataSource has to be implemented with basic setup for
extension SearchViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasSearched {
            //if user hasn't performed search
          return 0
        } else if searchResults.count == 0 {
            return 1
        } else {
            return searchResults.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchResultCell"
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        print(searchResults.count)
        if searchResults.count == 0 {
            cell.textLabel!.text = "(Nothing found)"
            cell.detailTextLabel!.text = ""
        } else {
        let searchResult = searchResults[indexPath.row]
        cell.textLabel!.text = searchResult.name
        cell.detailTextLabel!.text = searchResult.artistName
        }
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    //deselect the row with an animation
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    //make sure only search results are selectable
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if searchResults.count == 0 {
            return nil
        } else {
            return indexPath
        }
    }
}



