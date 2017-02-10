//
//  SingleTeamViewController.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 1/31/17.
//  Copyright © 2017 Q Is Silqent. All rights reserved.
//

import UIKit

class SingleTeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellReuseIdendifier = "SingleTeamViewCell"
    
    var matches: [teamInMatch] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        matches = getMatches(num: selectedTeam)
        
        tableView.register(SingleTeamViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath as IndexPath) as! SingleTeamViewCell
        
        cell.labels["match"]?.Label.text = String(matches[indexPath.row].match + 1)
        cell.labels["autoCorBalls"]?.Label.text = String(matches[indexPath.row].autoCorner)
        cell.labels["autoVorBalls"]?.Label.text = String(matches[indexPath.row].autoVortex)
        cell.labels["autoBeacons"]?.Label.text = String(matches[indexPath.row].autoBeacons)
        cell.labels["autoPark"]?.Label.text = String(matches[indexPath.row].parkPts)
        cell.labels["autoCapPts"]?.Label.text = String(matches[indexPath.row].autoCapBallPts)
        cell.labels["autoPts"]?.Label.text = String(matches[indexPath.row].autoPts)
        cell.labels["corBalls"]?.Label.text = String(matches[indexPath.row].cornerBalls)
        cell.labels["vorBalls"]?.Label.text = String(matches[indexPath.row].vortexBalls)
        cell.labels["telePts"]?.Label.text = String(matches[indexPath.row].telePts)
        cell.labels["capPts"]?.Label.text = String(matches[indexPath.row].capBallPts)
        cell.labels["beaconsControlled"]?.Label.text = String(matches[indexPath.row].beacons)
        cell.labels["beaconsHit"]?.Label.text = String(matches[indexPath.row].bCount)
        cell.labels["endPts"]?.Label.text = String(matches[indexPath.row].endGamePts)
        cell.labels["calcScore"]?.Label.text = String(matches[indexPath.row].calculatedScore)
        cell.labels["allianceScore"]?.Label.text = String(matches[indexPath.row].allianceScore)
        cell.labels["officialScore"]?.Label.text = String(matches[indexPath.row].officialScore)
        if(cell.labels["officialScore"]?.Label.text == "-1"){
            cell.labels["officialScore"]?.Label.text = "N/A"
        }
        
        return cell
    }
}
