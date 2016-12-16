//
//  ScoringTeleController.swift
//  NBNP2Scoring
//
//  Created by MUELLER, HANS on 11/9/16.
//  Copyright © 2016 CLARK. All rights reserved.
//

import UIKit

class ScoringTeleController: UIViewController {
    
    
    var red1 = matchData[currentMatch][0]
    var red2 = matchData[currentMatch][1]
    var blue1 = matchData[currentMatch][2]
    var blue2 = matchData[currentMatch][3]
    
    
    @IBOutlet var redAllianceScore: UILabel!
    @IBOutlet var blueAllianceScore: UILabel!
    @IBOutlet var matchLabel: UILabel!
    
    
    
    @IBOutlet var r1TCenter: UILabel!
    @IBOutlet var r1TCorner: UILabel!
    @IBOutlet var r1TBeacons: UILabel!
    @IBOutlet var r1TCapPts: UILabel!
    @IBOutlet var r1TScore: UILabel!
    @IBOutlet var r1TMatchScore: UILabel!
    
    
    @IBOutlet var r2TCenter: UILabel!
    @IBOutlet var r2TCorner: UILabel!
    @IBOutlet var r2TBeacons: UILabel!
    @IBOutlet var r2TCapPts: UILabel!
    @IBOutlet var r2TScore: UILabel!
    @IBOutlet var r2TMatchScore: UILabel!
    
    
    @IBOutlet var b1TCenter: UILabel!
    @IBOutlet var b1TCorner: UILabel!
    @IBOutlet var b1TBeacons: UILabel!
    @IBOutlet var b1TCapPts: UILabel!
    @IBOutlet var b1TScore: UILabel!
    @IBOutlet var b1TMatchScore: UILabel!
    
    
    @IBOutlet var b2TCenter: UILabel!
    @IBOutlet var b2TCorner: UILabel!
    @IBOutlet var b2TBeacons: UILabel!
    @IBOutlet var b2TCapPts: UILabel!
    @IBOutlet var b2TScore: UILabel!
    @IBOutlet var b2TMatchScore: UILabel!
    
    
    
    
    //SCORING
    func refreshLabels(){
        
        var red1 = matchData[currentMatch][0]
        var red2 = matchData[currentMatch][1]
        var blue1 = matchData[currentMatch][2]
        var blue2 = matchData[currentMatch][3]
        
        //Calculate and score the calculated data points
        
        
        //RED
        red1.autoPts = (red1.autoCorner * 5) + (red1.autoVortex * 15) + (red1.autoBeacons * 30) + red1.parkPts + red1.autoCapBallPts
        red1.telePts = red1.cornerBalls + (red1.vortexBalls * 5)
        red1.endGamePts = (red1.beacons * 10) + red1.capBallPts
        red1.calculatedScore = red1.autoPts + red1.telePts + red1.endGamePts
        
        red2.autoPts = (red2.autoCorner * 5) + (red2.autoVortex * 15) + (red2.autoBeacons * 30) + red2.parkPts + red2.autoCapBallPts
        red2.telePts = red2.cornerBalls + (red2.vortexBalls * 5)
        red2.endGamePts = (red2.beacons * 10) + red2.capBallPts
        red2.calculatedScore = red2.autoPts + red2.telePts + red2.endGamePts
        
        red1.allianceScore = red1.calculatedScore + red2.calculatedScore
        red2.allianceScore = red1.calculatedScore + red2.calculatedScore
        
        //BLUE
        blue1.autoPts = (blue1.autoCorner * 5) + (blue1.autoVortex * 15) + (blue1.autoBeacons * 30) + blue1.parkPts + blue1.autoCapBallPts
        blue1.telePts = blue1.cornerBalls + (blue1.vortexBalls * 5)
        blue1.endGamePts = (blue1.beacons * 10) + blue1.capBallPts
        blue1.calculatedScore = blue1.autoPts + blue1.telePts + blue1.endGamePts
        
        blue2.autoPts = (blue2.autoCorner * 5) + (blue2.autoVortex * 15) + (blue2.autoBeacons * 30) + blue2.parkPts + blue2.autoCapBallPts
        blue2.telePts = blue2.cornerBalls + (blue2.vortexBalls * 5)
        blue2.endGamePts = (blue2.beacons * 10) + blue2.capBallPts
        blue2.calculatedScore = blue2.autoPts + blue2.telePts + blue2.endGamePts
        
        blue1.allianceScore = blue1.calculatedScore + blue2.calculatedScore
        blue2.allianceScore = blue1.calculatedScore + blue2.calculatedScore
        
        
        
        //Check if beacons were scored for the other teams
        if(blue1.autoBeacons < 0){
            red1.allianceScore += (blue1.autoBeacons * 30)
            red2.allianceScore += (blue1.autoBeacons * 30)
        }
        if(blue2.autoBeacons < 0){
            red1.allianceScore += (blue2.autoBeacons * 30)
            red2.allianceScore += (blue2.autoBeacons * 30)
        }
        if(red1.autoBeacons < 0){
            blue1.allianceScore += (red1.autoBeacons * 30)
            blue2.allianceScore += (red1.autoBeacons * 30)
        }
        if(red2.autoBeacons < 0){
            blue1.allianceScore += (red2.autoBeacons * 30)
            blue2.allianceScore += (red2.autoBeacons * 30)
        }
        
        if(red1.allianceScore > blue1.allianceScore){
            red1.outcome = 0
            red2.outcome = 0
            blue1.outcome = 1
            blue1.outcome = 1
        }
        else if(red1.allianceScore < blue1.allianceScore){
            red1.outcome = 1
            red2.outcome = 1
            blue1.outcome = 0
            blue1.outcome = 0
        }
        else{
            red1.outcome = 2
            red2.outcome = 2
            blue1.outcome = 2
            blue2.outcome = 2
        }
        
        
        
        
        
        
        matchLabel.text = "Match \(currentMatch)"
        
        
        //RED 1
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
        
        
        //RED 2
        r2NumField.text = String(matchData[currentMatch][1].number)
        r2ABeaconsDNA.setOn(matchData[currentMatch][1].autoBeaconsDNA, animated: false)
        r2ABeacons.text = String(matchData[currentMatch][1].autoBeacons)
        r2ACenter.text = String(matchData[currentMatch][1].autoVortex)
        r2ACorner.text = String(matchData[currentMatch][1].autoCorner)
        
        //Parking
        switch (matchData[currentMatch][1].parkPts){
        case 0:
            r2APark.text = "None"
        case 5:
            r2APark.text = "Partial"
        case 10:
            r2APark.text = "Full"
        default:
            print("Error: odd parking value")
        }
        
        r2ACapSwitch.setOn((matchData[currentMatch][1].autoCapBallPts > 0), animated: false)
        r2ACapDNA.setOn(matchData[currentMatch][1].autoCapBallDNA, animated: false)
        r2AScore.text = String(matchData[currentMatch][1].autoPts)
        r2MatchScore.text = String(matchData[currentMatch][1].calculatedScore)
        
        
        redAllianceScore.text = String(matchData[currentMatch][0].allianceScore)
        
        //BLUE 1
        b1NumField.text = String(matchData[currentMatch][2].number)
        b1ABeaconsDNA.setOn(matchData[currentMatch][2].autoBeaconsDNA, animated: false)
        b1ABeacons.text = String(matchData[currentMatch][2].autoBeacons)
        b1ACenter.text = String(matchData[currentMatch][2].autoVortex)
        b1ACorner.text = String(matchData[currentMatch][2].autoCorner)
        
        //Parking
        switch (matchData[currentMatch][2].parkPts){
        case 0:
            b1APark.text = "None"
        case 5:
            b1APark.text = "Partial"
        case 10:
            b1APark.text = "Full"
        default:
            print("Error: odd parking value")
        }
        
        
        
        b1ACapSwitch.setOn((matchData[currentMatch][2].autoCapBallPts > 0), animated: false)
        b1ACapDNA.setOn(matchData[currentMatch][2].autoCapBallDNA, animated: false)
        b1AScore.text = String(matchData[currentMatch][2].autoPts)
        b1MatchScore.text = String(matchData[currentMatch][2].calculatedScore)
        
        //BLUE 2
        b2NumField.text = String(matchData[currentMatch][3].number)
        b2ABeaconsDNA.setOn(matchData[currentMatch][3].autoBeaconsDNA, animated: false)
        b2ABeacons.text = String(matchData[currentMatch][3].autoBeacons)
        b2ACenter.text = String(matchData[currentMatch][3].autoVortex)
        b2ACorner.text = String(matchData[currentMatch][3].autoCorner)
        
        //Parking
        switch (matchData[currentMatch][3].parkPts){
        case 0:
            b2APark.text = "None"
        case 5:
            b2APark.text = "Partial"
        case 10:
            b2APark.text = "Full"
        default:
            print("Error: odd parking value")
        }
        
        
        blueAllianceScore.text = String(matchData[currentMatch][2].allianceScore)
        
        
        
        r1AScore.text = String(red1.autoPts)
        r1MatchScore.text = String(red1.calculatedScore)
        r2AScore.text = String(red2.autoPts)
        r2MatchScore.text = String(red2.calculatedScore)
        redAllianceScore.text = String(red1.allianceScore)
        
        b1AScore.text = String(blue1.autoPts)
        b1MatchScore.text = String(blue1.calculatedScore)
        b2AScore.text = String(blue2.autoPts)
        b2MatchScore.text = String(blue2.calculatedScore)
        blueAllianceScore.text = String(blue2.allianceScore)
        
        
    }
    
    
    
    @IBAction func r1TCenterBallsPlus(_ sender: AnyObject) {
    }
    @IBAction func r1TCenterBallsMinus(_ sender: AnyObject) {
    }
    @IBAction func r1TCornerBallsPlus(_ sender: AnyObject) {
    }
    @IBAction func r1TCornerBallsMinus(_ sender: AnyObject) {
    }
    @IBAction func r1TBeaconsPlus(_ sender: AnyObject) {
    }
    @IBAction func r1TBeaconsMinus(_ sender: AnyObject) {
    }
    @IBAction func r1TCapBallPtsPlus(_ sender: AnyObject) {
    }
    @IBAction func r1CapBallPtsMinus(_ sender: AnyObject) {
    }
    @IBAction func r1TCapBallDNA(_ sender: AnyObject) {
    }
    
    
    @IBAction func r2TCenterBallsPlus(_ sender: AnyObject) {
    }
    @IBAction func r2TCenterBallsMinus(_ sender: AnyObject) {
    }
    @IBAction func r2TCornerBallsPlus(_ sender: AnyObject) {
    }
    @IBAction func r2TCornerBallsMinus(_ sender: AnyObject) {
    }
    @IBAction func r2TBeaconsPlus(_ sender: AnyObject) {
    }
    @IBAction func r2TBeaconsMinus(_ sender: AnyObject) {
    }
    @IBAction func r2TCapBallPtsPlus(_ sender: AnyObject) {
    }
    @IBAction func r2TCapBallPtsMinus(_ sender: AnyObject) {
    }
    @IBAction func r2TCapBallDNA(_ sender: AnyObject) {
    }
    
    
    @IBAction func b1TCenterBallsPlus(_ sender: AnyObject) {
    }
    @IBAction func b1TCenterBallsMinus(_ sender: AnyObject) {
    }
    @IBAction func b1TCornerBallsPlus(_ sender: AnyObject) {
    }
    @IBAction func b1TCornerBallsMinus(_ sender: AnyObject) {
    }
    @IBAction func b1TBeaconsPlus(_ sender: AnyObject) {
    }
    @IBAction func b1TBeaconsMinus(_ sender: AnyObject) {
    }
    @IBAction func b1TCapBallPtsPlus(_ sender: AnyObject) {
    }
    @IBAction func b1TCapBallPtsMinus(_ sender: AnyObject) {
    }
    @IBAction func b1TCapBallDNA(_ sender: AnyObject) {
    }
    
    
    @IBAction func b2TCenterBallsPlus(_ sender: AnyObject) {
    }
    @IBAction func b2TCenterBallsMinus(_ sender: AnyObject) {
    }
    @IBAction func b2TCornerBallsPlus(_ sender: AnyObject) {
    }
    @IBAction func b2TCornerBallsMinus(_ sender: AnyObject) {
    }
    @IBAction func b2TBeaconsPlus(_ sender: AnyObject) {
    }
    @IBAction func b2TBeaconsMinus(_ sender: AnyObject) {
    }
    @IBAction func b2TCapBallPtsPlus(_ sender: AnyObject) {
    }
    @IBAction func b2TCapBallPtsMinus(_ sender: AnyObject) {
    }
    @IBAction func b2TCapBallDNA(_ sender: AnyObject) {
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
