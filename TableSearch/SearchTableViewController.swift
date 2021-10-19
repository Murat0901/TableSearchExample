//
//  SearchTableViewController.swift
//  TableSearch
//
//  Created by Murat Menzilci on 19.10.2021.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var wordList = [WordData]()
    var searcing = false
    var searchedWord = [WordData]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let word1 = WordData(word: "Hello", meaning: "Hello")
        wordList.append(word1)
        let word2 = WordData(word: "Hello", meaning: "Hello")
        wordList.append(word2)
        let word3 = WordData(word: "Hello", meaning: "Hello")
        wordList.append(word3)
        let word4 = WordData(word: "Hello", meaning: "Hello")
        wordList.append(word4)
        let word5 = WordData(word: "Hello", meaning: "Hello")
        wordList.append(word5)
        
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
