//
//  ScoringController.swift
//  NBNP2Scoring
//
//  Created by MUELLER, HANS on 11/2/16.
//  Copyright © 2016 CLARK. All rights reserved.
//

import UIKit

class ScoringAutoController: UIViewController {
    
    //TRANSITION TO TELE
    @IBAction func transferViews(_ sender: AnyObject) {
        
    }
    
    //LABEL MARK PROPERTIES
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var redAllianceScore: UILabel!
    @IBOutlet weak var blueAllianceScore: UILabel!
    
    
    //RED 1
    @IBOutlet weak var r1NumField: UITextField!
    @IBOutlet weak var r1ABeaconsDNA: UISwitch!
    @IBOutlet weak var r1ABeacons: UILabel!
    @IBOutlet weak var r1ACenter: UILabel!
    @IBOutlet weak var r1ACorner: UILabel!
    @IBOutlet weak var r1APark: UILabel!
    @IBOutlet weak var r1ACapSwitch: UISwitch!
    @IBOutlet weak var r1ACapDNA: UISwitch!
    @IBOutlet weak var r1AScore: UILabel!
    @IBOutlet weak var r1MatchScore: UILabel!
    
    //RED 2
    @IBOutlet weak var r2NumField: UITextField!
    @IBOutlet weak var r2ABeaconsDNA: UISwitch!
    @IBOutlet weak var r2ABeacons: UILabel!
    @IBOutlet weak var r2ACenter: UILabel!
    @IBOutlet weak var r2ACorner: UILabel!
    @IBOutlet weak var r2APark: UILabel!
    @IBOutlet weak var r2ACapSwitch: UISwitch!
    @IBOutlet weak var r2ACapDNA: UISwitch!
    @IBOutlet weak var r2AScore: UILabel!
    @IBOutlet weak var r2MatchScore: UILabel!
    
    //BLUE 1
    @IBOutlet weak var b1NumField: UITextField!
    @IBOutlet weak var b1ABeaconsDNA: UISwitch!
    @IBOutlet weak var b1ABeacons: UILabel!
    @IBOutlet weak var b1ACenter: UILabel!
    @IBOutlet weak var b1ACorner: UILabel!
    @IBOutlet weak var b1APark: UILabel!
    @IBOutlet weak var b1ACapSwitch: UISwitch!
    @IBOutlet weak var b1ACapDNA: UISwitch!
    @IBOutlet weak var b1AScore: UILabel!
    @IBOutlet weak var b1MatchScore: UILabel!
    
    //BLUE 2
    @IBOutlet weak var b2NumField: UITextField!
    @IBOutlet weak var b2ABeaconsDNA: UISwitch!
    @IBOutlet weak var b2ABeacons: UILabel!
    @IBOutlet weak var b2ACenter: UILabel!
    @IBOutlet weak var b2ACorner: UILabel!
    @IBOutlet weak var b2APark: UILabel!
    @IBOutlet weak var b2ACapSwitch: UISwitch!
    @IBOutlet weak var b2ACapDNA: UISwitch!
    @IBOutlet weak var b2AScore: UILabel!
    @IBOutlet weak var b2MatchScore: UILabel!
    
    
    
    //SCORING
    func refreshLabels(){
        matchLabel.text = "Match \(currentMatch)"
        
        r1NumField.text = String(matchData[currentMatch][0].number)
        r1ABeaconsDNA.setOn(matchData[currentMatch][0].autoBeaconsDNA, animated: false)
        r1ABeacons.text = String(matchData[currentMatch][0].autoBeacons)
        r1ACenter.text = String(matchData[currentMatch][0].autoVortex)
        r1ACorner.text = String(matchData[currentMatch][0].autoCorner)
        
        //Parking
        switch (matchData[currentMatch][0].parkPts){
        case 0:
            r1APark.text = "None"
        case 5:
            r1APark.text = "Partial"
        case 10:
            r1APark.text = "Full"
        default:
            print("Error: odd parking value")
        }
        
        r1ACapSwitch.setOn((matchData[currentMatch][0].autoCapBallPts > 0), animated: false)
        r1ACapDNA.setOn(matchData[currentMatch][0].autoCapBallDNA, animated: false)
        r1AScore.text = String(matchData[currentMatch][0].autoPts)
        r1MatchScore.text = String(matchData[currentMatch][0].calculatedScore)
    }
    @IBAction func r1ABeaconsPlus(_ sender: AnyObject) {
        if matchData[currentMatch][0].autoBeacons + 1 <= 2{
            matchData[currentMatch][0].autoBeacons += 1
            refreshLabels()
        }
    }
    @IBAction func r1ABeaconsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][0].autoBeacons - 1 >= 0{
            matchData[currentMatch][0].autoBeacons -= 1
            refreshLabels()
        }
    }
    @IBAction func r1ABeaconsDNA(_ sender: AnyObject) {
        matchData[currentMatch][0].autoBeaconsDNA = r1ABeaconsDNA.isOn
        refreshLabels()
    }
    @IBAction func r1ACenterBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][0].autoVortex += 1
        refreshLabels()
    }
    @IBAction func r1ACenterBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][0].autoVortex - 1 >= 0{
            matchData[currentMatch][0].autoVortex -= 1
            refreshLabels()
        }
    }
    @IBAction func r1ACornerBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][0].autoCorner += 1
        refreshLabels()
    }
    @IBAction func r1ACornerBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][0].autoCorner - 1 >= 0{
            matchData[currentMatch][0].autoCorner -= 1
            refreshLabels()
        }
    }
    //Check score here
    @IBAction func r1AElevPtsPlus(_ sender: AnyObject) {
        if matchData[currentMatch][0].autoVortex + 5 <= 10{
            matchData[currentMatch][0].autoVortex += 5
            refreshLabels()
        }
    }
    //Check score here
    @IBAction func r1AElevPtsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][0].autoVortex - 5 >= 0{
            matchData[currentMatch][0].autoVortex -= 5
            refreshLabels()
        }
    }
    //Check score here
    @IBAction func r1ACapBallScored(_ sender: AnyObject) {
        matchData[currentMatch][0].capBallPts += 10
        refreshLabels()
        
    }
    @IBAction func r1ACapBallDNA(_ sender: AnyObject) {
        matchData[currentMatch][0].autoCapBallDNA = r1ACapDNA.isOn
        refreshLabels()
    }
    
    
    @IBAction func r2ABeaconsPlus(_ sender: AnyObject) {
        if matchData[currentMatch][1].autoBeacons + 1 <= 2{
            matchData[currentMatch][1].autoBeacons += 1
            refreshLabels()
        }
    }
    @IBAction func r2ABeaconsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][1].autoBeacons - 1 >= 0{
            matchData[currentMatch][1].autoBeacons -= 1
            refreshLabels()
        }
    }
    @IBAction func r2ABeaconsDNA(_ sender: AnyObject) {
        matchData[currentMatch][1].autoBeaconsDNA = r1ABeaconsDNA.isOn
        refreshLabels()
    }
    @IBAction func r2ACenterBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][1].autoVortex += 1
        refreshLabels()
    }
    @IBAction func r2ACenterBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][1].autoVortex - 1 >= 0{
            matchData[currentMatch][1].autoVortex -= 1
            refreshLabels()
        }
    }
    @IBAction func r2ACornerBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][1].autoCorner += 1
        refreshLabels()
    }
    @IBAction func r2ACornerBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][1].autoCorner - 1 >= 0{
            matchData[currentMatch][1].autoCorner -= 1
            refreshLabels()
        }
    }
    @IBAction func r2AElevPtsPlus(_ sender: AnyObject) {
    }
    @IBAction func r2AElevPtsMinus(_ sender: AnyObject) {
    }
    @IBAction func r2ACapBallScored(_ sender: AnyObject) {
    }
    @IBAction func r2ACapBallDNA(_ sender: AnyObject) {
    }
    
    //BLUE 1
    @IBAction func b1ABeaconsPlus(_ sender: AnyObject) {
        if matchData[currentMatch][2].autoBeacons + 1 <= 2{
            matchData[currentMatch][2].autoBeacons += 1
            refreshLabels()
        }
    }
    @IBAction func b1ABeaconsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][2].autoBeacons - 1 >= 0{
            matchData[currentMatch][2].autoBeacons -= 1
            refreshLabels()
        }
    }
    @IBAction func b1ABeaconsDNA(_ sender: AnyObject) {
        matchData[currentMatch][2].autoBeaconsDNA = r1ABeaconsDNA.isOn
        refreshLabels()
    }
    @IBAction func b1ACenterBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][2].autoVortex += 1
        refreshLabels()
    }
    @IBAction func b1ACenterBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][2].autoVortex - 1 >= 0{
            matchData[currentMatch][2].autoVortex -= 1
            refreshLabels()
        }
    }
    @IBAction func b1ACornerBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][2].autoCorner += 1
        refreshLabels()
    }
    @IBAction func b1ACornerBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][2].autoCorner - 1 >= 0{
            matchData[currentMatch][2].autoCorner -= 1
            refreshLabels()
        }
    }
    @IBAction func b1AElevPtsPlus(_ sender: AnyObject) {
    }
    @IBAction func b1AElevPtsMinus(_ sender: AnyObject) {
    }
    @IBAction func b1ACapBallScored(_ sender: AnyObject) {
    }
    @IBAction func b1ACapBallDNA(_ sender: AnyObject) {
    }
    
    //BLUE 2
    @IBAction func b2ABeaconsPlus(_ sender: AnyObject) {
        if matchData[currentMatch][3].autoBeacons + 1 <= 2{
            matchData[currentMatch][3].autoBeacons += 1
            refreshLabels()
        }
    }
    @IBAction func b2ABeaconsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][3].autoBeacons - 1 >= 0{
            matchData[currentMatch][3].autoBeacons -= 1
            refreshLabels()
        }
    }
    @IBAction func b2ABeaconsDNA(_ sender: AnyObject) {
        matchData[currentMatch][3].autoBeaconsDNA = r1ABeaconsDNA.isOn
        refreshLabels()
    }
    @IBAction func b2ACenterBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][3].autoVortex += 1
        refreshLabels()
    }
    @IBAction func b2ACenterBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][3].autoVortex - 1 >= 0{
            matchData[currentMatch][3].autoVortex -= 1
            refreshLabels()
        }
    }
    @IBAction func b2ACornerBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][3].autoCorner += 1
        refreshLabels()
    }
    @IBAction func b2ACornerBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][3].autoCorner - 1 >= 0{
            matchData[currentMatch][3].autoCorner -= 1
            refreshLabels()
        }
    }
    @IBAction func b2AElevPtsPlus(_ sender: AnyObject) {
    }
    @IBAction func b2AElevPtsMinus(_ sender: AnyObject) {
    }
    @IBAction func b2ACapBallScored(_ sender: AnyObject) {
    }
    @IBAction func b2ACapBallDNA(_ sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
