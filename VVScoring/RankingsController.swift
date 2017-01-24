//
//  RankingsController.swift
//  NBNP2Scoring
//
//  Created by CLARK, THOMAS on 10/18/16.
//  Copyright © 2016 CLARK. All rights reserved.
//

import UIKit

class RankingsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    
    @IBAction func reloadThings(_ sender: AnyObject) {
        tableView.reloadData()
    }
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    let cellReuseIdendifier = "RankingsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RankingsCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTeamButton(_ sender: AnyObject) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addTeamController") as! AddTeamController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    /*
    @IBAction func editMode(_ sender: AnyObject) {
        if(!tableView.isEditing){
            tableView.setEditing(true, animated: true)
        }else{
            tableView.setEditing(false, animated: true)
        }
    }*/
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
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
        let dat = sortTeamsBy(mode: "", dir: 0)
        let t = dat[indexPath.row]
        
        cell.labels["number"]?.Label.text = String (t.number)
        cell.labels["name"]?.Label.text = teamList[String (t.number)]?.name
        cell.labels["rank"]?.Label.text = String (indexPath.row + 1)
        cell.labels["RP"]?.Label.text = String(getAverages(num: t.number).averages.RP)
        cell.labels["wins"]?.Label.text = String(getAverages(num: t.number).wins)
        cell.labels["losses"]?.Label.text = String(getAverages(num: t.number).losses)
        cell.labels["tie"]?.Label.text = String(getAverages(num: t.number).ties)
        cell.labels["opr"]?.Label.text = String(t.opr)
        cell.labels["autoPts"]?.Label.text = String(t.autoPts)
        cell.labels["autoBalls"]?.Label.text = String(t.autoVortex)
        cell.labels["autoBeacons"]?.Label.text = String(t.autoBeacons)
        cell.labels["teleBalls"]?.Label.text = String(t.vortexBalls)
        cell.labels["endBeacons"]?.Label.text = String(t.beacons)
        cell.labels["capPts"]?.Label.text = String(t.capBallPts)
        cell.labels["partnerScore"]?.Label.text = String(t.allianceScore - t.opr)
        
        
        return cell
    }
}
