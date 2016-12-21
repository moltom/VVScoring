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
    @IBOutlet var r1TCapDNA: UISwitch!
    
    
    @IBOutlet var r2TCenter: UILabel!
    @IBOutlet var r2TCorner: UILabel!
    @IBOutlet var r2TBeacons: UILabel!
    @IBOutlet var r2TCapPts: UILabel!
    @IBOutlet var r2TScore: UILabel!
    @IBOutlet var r2TMatchScore: UILabel!
    @IBOutlet var r2TCapDNA: UISwitch!
    
    
    @IBOutlet var b1TCenter: UILabel!
    @IBOutlet var b1TCorner: UILabel!
    @IBOutlet var b1TBeacons: UILabel!
    @IBOutlet var b1TCapPts: UILabel!
    @IBOutlet var b1TScore: UILabel!
    @IBOutlet var b1TMatchScore: UILabel!
    @IBOutlet var b1TCapDNA: UISwitch!
    
    
    @IBOutlet var b2TCenter: UILabel!
    @IBOutlet var b2TCorner: UILabel!
    @IBOutlet var b2TBeacons: UILabel!
    @IBOutlet var b2TCapPts: UILabel!
    @IBOutlet var b2TScore: UILabel!
    @IBOutlet var b2TMatchScore: UILabel!
    @IBOutlet var b2TCapDNA: UISwitch!
    
    
    
    
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
        
        //Tele
        if(blue1.beacons < 0){
            red1.allianceScore += (blue1.beacons * 10)
            red2.allianceScore += (blue1.beacons * 10)
        }
        if(blue2.beacons < 0){
            red1.allianceScore += (blue2.beacons * 10)
            red2.allianceScore += (blue2.beacons * 10)
        }
        if(red1.beacons < 0){
            blue1.allianceScore += (red1.beacons * 10)
            blue2.allianceScore += (red1.beacons * 10)
        }
        if(red2.beacons < 0){
            blue1.allianceScore += (red2.beacons * 10)
            blue2.allianceScore += (red2.beacons * 10)
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
        r1TCenter.text = String(red1.vortexBalls)
        r1TCorner.text = String(red1.cornerBalls)
        r1TBeacons.text = String(red1.beacons)
        r1TCapPts.text = String(red1.capBallPts)
        r1TCapDNA.setOn(red1.capBallDNA, animated: false)
        
        //RED 2
        r2TCenter.text = String(red2.vortexBalls)
        r2TCorner.text = String(red2.cornerBalls)
        r2TBeacons.text = String(red2.beacons)
        r2TCapPts.text = String(red2.capBallPts)
        r2TCapDNA.setOn(red2.capBallDNA, animated: false)
        
        //BLUE 1
        b1TCenter.text = String(blue1.vortexBalls)
        b1TCorner.text = String(blue1.cornerBalls)
        b1TBeacons.text = String(blue1.beacons)
        b1TCapPts.text = String(blue1.capBallPts)
        b1TCapDNA.setOn(blue1.capBallDNA, animated: false)
        
        //BLUE 2
        b2TCenter.text = String(blue2.vortexBalls)
        b2TCorner.text = String(blue2.cornerBalls)
        b2TBeacons.text = String(blue2.beacons)
        b2TCapPts.text = String(blue2.capBallPts)
        b2TCapDNA.setOn(blue2.capBallDNA, animated: false)
        

        
        
        redAllianceScore.text = String(red1.allianceScore)
        blueAllianceScore.text = String(blue1.allianceScore)
        
        
        r1TScore.text = String(red1.autoPts)
        r1TMatchScore.text = String(red1.calculatedScore)
        r2TScore.text = String(red2.autoPts)
        r2TMatchScore.text = String(red2.calculatedScore)
        redAllianceScore.text = String(red1.allianceScore)
        
        b1TScore.text = String(blue1.autoPts)
        b1TMatchScore.text = String(blue1.calculatedScore)
        b2TScore.text = String(blue2.autoPts)
        b2TMatchScore.text = String(blue2.calculatedScore)
        blueAllianceScore.text = String(blue2.allianceScore)
        
        
    }
    
    
    
    @IBAction func r1TCenterBallsPlus(_ sender: AnyObject) {
       
        red1.autoVortex += 1
        refreshLabels()
    
    }
    @IBAction func r1TCenterBallsMinus(_ sender: AnyObject) {
        if red1.autoVortex - 1 >= 0{
            red1.autoVortex -= 1
            refreshLabels()
        }

    }
    @IBAction func r1TCornerBallsPlus(_ sender: AnyObject) {
        red1.autoCorner += 1
        refreshLabels()
    }
    @IBAction func r1TCornerBallsMinus(_ sender: AnyObject) {
        if red1.autoCorner - 1 >= 0{
            red1.autoCorner -= 1
            refreshLabels()
        }
    }
    @IBAction func r1TBeaconsPlus(_ sender: AnyObject) {
        if red1.autoBeacons + 1 <= 4{
            red1.autoBeacons += 1
            refreshLabels()
        }
    }
    @IBAction func r1TBeaconsMinus(_ sender: AnyObject) {
        if red1.autoBeacons - 1 >= -4{
            red1.autoBeacons -= 1
            refreshLabels()
        }
    }
    @IBAction func r1TCapBallPtsPlus(_ sender: AnyObject) {
        red1.autoVortex += 10
        refreshLabels()
    }
    @IBAction func r1CapBallPtsMinus(_ sender: AnyObject) {
        if red1.autoVortex - 1 >= 0{
            red1.autoVortex -= 1
            refreshLabels()
        }
    }
    @IBAction func r1TCapBallDNA(_ sender: AnyObject) {
        red1.autoCapBallDNA = r1TCapDNA.isOn
        refreshLabels()

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
        refreshLabels()
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
