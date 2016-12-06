//
//  RankingsController.swift
//  NBNP2Scoring
//
//  Created by CLARK, THOMAS on 10/18/16.
//  Copyright © 2016 CLARK. All rights reserved.
//

import UIKit

class RankingsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    let cellReuseIdendifier = "RankingsCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //POTATOES
        //POTATOES
        //teams.append((name: "The Q is Silqent", number: 7655, fav: false))
        
        //LEAVE THIS HERE PLEASE
        exampleData()
        //----------------------
        
        tableView.register(RankingsCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editMode(_ sender: AnyObject) {
        if(!tableView.isEditing){
            tableView.setEditing(true, animated: true)
        }else{
            tableView.setEditing(false, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            var counter = 0
            for (name, _) in teamList{
                if counter == indexPath.row{
                    teamList.removeValue(forKey: name)
                    break
                }
                counter += 1
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert{
            //Do stuff
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath as IndexPath) as! RankingsCell
        
        //Data for Cells
        let dat = sortTeamsBy(mode: "number", dir: 0)
        let t = dat[indexPath.row]
        
        cell.labels["number"]?.Label.text = String(t.number)
        cell.labels["name"]?.Label.text = teamList[String(t.number)]?.name
        cell.labels["rank"]?.Label.text = "1"
        cell.labels["wins"]?.Label.text = String(getAverages(num: t.number).wins)
        cell.labels["losses"]?.Label.text = String(getAverages(num: t.number).losses)
        cell.labels["tie"]?.Label.text = String(getAverages(num: t.number).ties)
        cell.labels["opr"]?.Label.text = String(t.opr)
        cell.labels["autoPts"]?.Label.text = String(t.autoPts)
        cell.labels["telePts"]?.Label.text = String(t.telePts)
        cell.labels["endGamePts"]?.Label.text = String(t.endGamePts)
        
        
        return cell
    }
}
