//
//  PlayersTableViewController.swift
//  SampleApp
//
//  Created by Tuan Phan on 4/26/18.
//  Copyright © 2018 Tuan Phan. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController, UISearchResultsUpdating  {
    var players = SampleData.generatePlayersData()
    var playerDictionary = [String: [String]]()
    var playerSelectionTitles = [String]()
    var player = [String]()
    var filteredPlayers = [Player]()

    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateIndex()

        filteredPlayers = players
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateIndex()
    }
    
    
    func updateIndex() {
        //for eachPlayer in players {
            for eachPlayer in players {
            let playerKey = String(describing: eachPlayer.name!.prefix(1))
            if var playerValues = playerDictionary[playerKey] {
                playerValues.append(eachPlayer.name!)
                playerDictionary[playerKey] = playerValues
            } else {
                playerDictionary[playerKey] = [eachPlayer.name!]
            }
        }
        
        playerSelectionTitles = [String](playerDictionary.keys)
        playerSelectionTitles = playerSelectionTitles.sorted(by: {$0 < $1})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return playerSelectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return playerSelectionTitles
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return players.count

        return filteredPlayers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell

        // Configure the cell...
        //let player = players[indexPath.row]
        let player = filteredPlayers[indexPath.row]
        cell.player = player
//            cell.textLabel?.text = player.name
//            cell.detailTextLabel?.text = player.game
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            //players.remove(at: indexPath.row)
            filteredPlayers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredPlayers = players.filter { player in
                return (player.name?.lowercased().contains(searchText.lowercased()))!
            }
            
        } else {
            filteredPlayers = players
        }
        tableView.reloadData()
    }

}

extension PlayersTableViewController {
    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        
        guard let playerDetailsTableViewController = segue.source as? PlayerDetailsTableViewController,
            let player = playerDetailsTableViewController.player else {
                return
        }
        
        // add the new player to the players array
        players.append(player)
        filteredPlayers = players
        //filteredPlayers.append(player)
        
        // update the tableView
        let indexPath = IndexPath(row: filteredPlayers.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }
}
