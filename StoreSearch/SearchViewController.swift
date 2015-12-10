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
    struct TableViewCellIdentifiers {
        //static value can be used without an instance so you dont need to instatiate TableViewCellIndentifiers before you can use it.
        static let searchResultCell = "SearchResultCell"
        static let nothingFoundCell = "NothingFoundCell"
    }
    
    
// MARK: - app action methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        //tell the tableView to have a top margin for the status bar and search bar
        //20 points for the status bar, 44 points for the search bar
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        //use the table cell nib
        var cellNib = UINib(nibName: TableViewCellIdentifiers.searchResultCell, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.searchResultCell)
        cellNib = UINib(nibName: TableViewCellIdentifiers.nothingFoundCell, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.nothingFoundCell)
        //make the keyboard immediately visible when you start the app
        searchBar.becomeFirstResponder()
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

        if searchResults.count == 0 {
            return tableView.dequeueReusableCellWithIdentifier(TableViewCellIdentifiers.nothingFoundCell, forIndexPath: indexPath)
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCellIdentifiers.searchResultCell, forIndexPath: indexPath) as! SearchResultCell
            let searchResult = searchResults[indexPath.row]
            cell.nameLabel.text = searchResult.name
            cell.artistNameLabel.text = searchResult.artistName
            return cell
        }
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



