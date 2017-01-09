//
//  MatchesController.swift
//  NBNP2Scoring
//
//  Created by CLARK, THOMAS on 10/24/16.
//  Copyright © 2016 CLARK. All rights reserved.
//

import UIKit

var currentMatch = 0

class MatchesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellReuseIdendifier = "MatchCell"
    
    @IBOutlet weak var tView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tView.register(MatchCell.self, forCellReuseIdentifier: self.cellReuseIdendifier)
        
        tView.dataSource = self
        tView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMatchTriggered(_ sender: AnyObject) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newMatch") as! NewMatchController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
        
        /*matchData.append([teamInMatch(),teamInMatch(),teamInMatch(),teamInMatch()])
        tView.reloadData()*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //Get reversed index
        let nindex = (matchData.count - 1) - indexPath.row
        currentMatch = nindex
        
        //Transfer Views
        let vcName = "match"
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        viewController?.navigationItem.title = "Autonomous Scoring"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tView.dequeueReusableCell(withIdentifier: self.cellReuseIdendifier, for: indexPath as IndexPath) as! MatchCell
        
        //Non reversed Index
        let nindex = (matchData.count - 1) - indexPath.row
        
        //Get Team numbers
        var tmpTeams: [String] = []
        for x in 0..<4{
            if matchData[nindex][x].number != 0{
                tmpTeams.append(String(matchData[nindex][x].number))
            }else{
                tmpTeams.append("-")
            }
        }
        
        //Font Size
        let cfs: CGFloat = 18
        
        //Match Number
        cell.labels["match"]?.Label.text = "Q\(nindex)"
        cell.labels["match"]?.Label.font = UIFont.boldSystemFont(ofSize: cfs)
        
        //Red 1
        cell.labels["r1"]?.Label.text = String(tmpTeams[0])
        cell.labels["r1"]?.Label.font = cell.labels["r1"]?.Label.font.withSize(cfs)
        cell.labels["r1name"]?.Label.text = teamList[String(tmpTeams[0])]?.name
        cell.labels["r1name"]?.Label.font = cell.labels["r1name"]?.Label.font.withSize(16)
        
        //Red 2
        cell.labels["r2"]?.Label.text = String(tmpTeams[1])
        cell.labels["r2"]?.Label.font = cell.labels["r2"]?.Label.font.withSize(cfs)
        cell.labels["r2name"]?.Label.text = teamList[String(tmpTeams[1])]?.name
        cell.labels["r2name"]?.Label.font = cell.labels["r2name"]?.Label.font.withSize(16)
        
        //Red Score
        if matchData[nindex][0].allianceScore == -1{
            cell.labels["rscore"]?.Label.text = "-"
        }else{
            if matchData[nindex][0].officialScore == -1{
                cell.labels["rscore"]?.Label.text = String(matchData[nindex][0].allianceScore)
            }else{
                cell.labels["rscore"]?.Label.text = String(matchData[nindex][0].officialScore)
            }
        }
        cell.labels["rscore"]?.Label.font = cell.labels["rscore"]?.Label.font.withSize(20)
        
        //Divider
        cell.labels["divider"]?.Label.text = "|"
        cell.labels["divider"]?.Label.font = UIFont.boldSystemFont(ofSize: 20)
        
        //Blue Score
        if matchData[nindex][2].allianceScore == -1{
            cell.labels["rscore"]?.Label.text = "-"
        }else{
            if matchData[nindex][2].officialScore == -1{
                cell.labels["bscore"]?.Label.text = String(matchData[nindex][2].allianceScore)
            }else{
                cell.labels["bscore"]?.Label.text = String(matchData[nindex][2].officialScore)
            }
        }
        
        cell.labels["bscore"]?.Label.font = cell.labels["bscore"]?.Label.font.withSize(20)
        
        //Blue 1
        cell.labels["b1"]?.Label.text = String(tmpTeams[2])
        cell.labels["b1"]?.Label.font = cell.labels["b1"]?.Label.font.withSize(cfs)
        cell.labels["b1name"]?.Label.text = teamList[String(tmpTeams[2])]?.name
        cell.labels["b1name"]?.Label.font = cell.labels["b1name"]?.Label.font.withSize(16)
        
        //Blue 2
        cell.labels["b2"]?.Label.text = String(tmpTeams[3])
        cell.labels["b2"]?.Label.font = cell.labels["b2"]?.Label.font.withSize(cfs)
        cell.labels["b2name"]?.Label.text = teamList[String(tmpTeams[3])]?.name
        cell.labels["b2name"]?.Label.font = cell.labels["b2name"]?.Label.font.withSize(16)
        
        return cell
    }
}
