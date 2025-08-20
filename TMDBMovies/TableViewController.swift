//
//  TableViewController.swift
//  TMDBMovies
//
//  Created by Guilherme Muniz Viana on 19/08/25.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
