//
//  SearchTableViewController.swift
//  TableSearch
//
//  Created by Murat Menzilci on 19.10.2021.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate{
 
    var wordList = [WordData]()
    var searcing = false
    var searchedWord = [WordData]()
    
    let searchController = UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let word1 = WordData(word: "Accord", meaning: "concurrence of opinion")
        wordList.append(word1)
        let word2 = WordData(word: "Consider", meaning: "deem to be")
        wordList.append(word2)
        let word3 = WordData(word: "evident", meaning: "clearly revealed to the mind or the senses or judgment")
        wordList.append(word3)
        let word4 = WordData(word: "intend", meaning: "have in mind as a purpose")
        wordList.append(word4)
        let word5 = WordData(word: "concern", meaning: "something that interests you because it is important")
        wordList.append(word5)
        
        configSearchController()
    

    }
    
    private func configSearchController() {
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        
        self.navigationItem.searchController = searchController
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true
        
        searchController.searchBar.placeholder = "Search by Word"
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searcing
        {
            return searchedWord.count
        } else
        {
            return wordList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WordTableViewCell
        
        if searcing
        {
            cell.wordLabel.text = searchedWord[indexPath.row].word
            cell.meaningLabel.text = searchedWord[indexPath.row].meaning
        } else
        {
            cell.wordLabel.text = wordList[indexPath.row].word
            cell.meaningLabel.text = wordList[indexPath.row].meaning
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searcing = false
        searchedWord.removeAll()
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty
        {
            searcing = true
            searchedWord.removeAll()
            for word in wordList
            {
                if word.word.lowercased().contains(searchText.lowercased())
                {
                    searchedWord.append(word)
                }
            }
            
        } else{
            searcing = false
            searchedWord.removeAll()
            searchedWord = wordList
        }
        
        tableView.reloadData()
    }


}
