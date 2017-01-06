//
//  ScoringController.swift
//  NBNP2Scoring
//
//  Created by MUELLER, HANS on 11/2/16.
//  Copyright © 2016 CLARK. All rights reserved.
//

import UIKit

class ScoringController: UIViewController {
    
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
        
        //Calculate and score the calculated data points
        
        var red1 = matchData[currentMatch][0]
        var red2 = matchData[currentMatch][1]
        var blue1 = matchData[currentMatch][2]
        var blue2 = matchData[currentMatch][3]
        
        
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
        
        //Auto
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
    @IBAction func r1ABeaconsPlus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].autoBeacons) + absn(matchData[currentMatch][3].autoBeacons) + absn(matchData[currentMatch][0].autoBeacons) + absn(matchData[currentMatch][1].autoBeacons)) < 4){
            matchData[currentMatch][0].autoBeacons += 1
        }
        else if matchData[currentMatch][0].autoBeacons < 0 {
            matchData[currentMatch][0].autoBeacons += 1
        }
        refreshLabels()
    }
    @IBAction func r1ABeaconsMinus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].autoBeacons) + absn(matchData[currentMatch][3].autoBeacons) + absn(matchData[currentMatch][0].autoBeacons) + absn(matchData[currentMatch][1].autoBeacons)) < 4){
            matchData[currentMatch][0].autoBeacons -= 1
        }
        else if matchData[currentMatch][0].autoBeacons > 0 {
            matchData[currentMatch][0].autoBeacons -= 1
        }
        refreshLabels()
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
        if(matchData[currentMatch][0].parkPts < 10){
            matchData[currentMatch][0].parkPts += 5
        }
            refreshLabels()
    }
    //Check score here
    @IBAction func r1AElevPtsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][0].parkPts - 5 >= 0{
            matchData[currentMatch][0].parkPts -= 5
            refreshLabels()
        }
    }
    //Check score here
    @IBAction func r1ACapBallScored(_ sender: AnyObject) {
        if(r1ACapSwitch.isOn){
            matchData[currentMatch][0].autoCapBallPts = 5
        }
        else{
            matchData[currentMatch][0].autoCapBallPts = 0
        }
        refreshLabels()
    
        
    }
    @IBAction func r1ACapBallDNA(_ sender: AnyObject) {
        matchData[currentMatch][0].autoCapBallDNA = r1ACapDNA.isOn
        refreshLabels()
    }
    
    
    
    //RED 2
    @IBAction func r2ABeaconsPlus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].autoBeacons) + absn(matchData[currentMatch][3].autoBeacons) + absn(matchData[currentMatch][0].autoBeacons) + absn(matchData[currentMatch][1].autoBeacons)) < 4){
            matchData[currentMatch][1].autoBeacons += 1
        }
        else if matchData[currentMatch][1].autoBeacons < 0 {
            matchData[currentMatch][1].autoBeacons += 1
        }
        refreshLabels()
    }
    @IBAction func r2ABeaconsMinus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].autoBeacons) + absn(matchData[currentMatch][3].autoBeacons) + absn(matchData[currentMatch][0].autoBeacons) + absn(matchData[currentMatch][1].autoBeacons)) < 4){
            matchData[currentMatch][1].autoBeacons -= 1
        }
        else if matchData[currentMatch][1].autoBeacons > 0 {
            matchData[currentMatch][1].autoBeacons -= 1
        }
        refreshLabels()
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
        if(matchData[currentMatch][1].parkPts < 10){
            matchData[currentMatch][1].parkPts += 5
        }
        refreshLabels()
    }
    @IBAction func r2AElevPtsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][1].parkPts - 5 >= 0{
            matchData[currentMatch][1].parkPts -= 5
            refreshLabels()
        }
    }
    @IBAction func r2ACapBallScored(_ sender: AnyObject) {
        if(r2ACapSwitch.isOn){
            matchData[currentMatch][1].autoCapBallPts = 5
        }
        else{
            matchData[currentMatch][1].autoCapBallPts = 0
        }
        refreshLabels()
    }
    @IBAction func r2ACapBallDNA(_ sender: AnyObject) {
        matchData[currentMatch][1].autoCapBallDNA = r2ACapDNA.isOn
        refreshLabels()
    }
    
    //BLUE 1
    @IBAction func b1ABeaconsPlus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].autoBeacons) + absn(matchData[currentMatch][3].autoBeacons) + absn(matchData[currentMatch][0].autoBeacons) + absn(matchData[currentMatch][1].autoBeacons)) < 4){
            matchData[currentMatch][2].autoBeacons += 1
        }
        else if matchData[currentMatch][2].autoBeacons < 0 {
            matchData[currentMatch][2].autoBeacons += 1
        }
        refreshLabels()
    }
    @IBAction func b1ABeaconsMinus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].autoBeacons) + absn(matchData[currentMatch][3].autoBeacons) + absn(matchData[currentMatch][0].autoBeacons) + absn(matchData[currentMatch][1].autoBeacons)) < 4){
            matchData[currentMatch][2].autoBeacons -= 1
        }
        else if matchData[currentMatch][2].autoBeacons > 0 {
            matchData[currentMatch][2].autoBeacons -= 1
        }
        refreshLabels()
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
        if(matchData[currentMatch][2].parkPts < 10){
            matchData[currentMatch][2].parkPts += 5
        }
        refreshLabels()
    }
    @IBAction func b1AElevPtsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][2].parkPts - 5 >= 0{
            matchData[currentMatch][2].parkPts -= 5
            refreshLabels()
        }
    }
    @IBAction func b1ACapBallScored(_ sender: AnyObject) {
        if(b1ACapSwitch.isOn){
            matchData[currentMatch][2].autoCapBallPts = 5
        }
        else{
            matchData[currentMatch][2].autoCapBallPts = 0
        }
        refreshLabels()
    }
    @IBAction func b1ACapBallDNA(_ sender: AnyObject) {
        matchData[currentMatch][2].autoCapBallDNA = b1ACapDNA.isOn
        refreshLabels()
    }
    
    //BLUE 2
    @IBAction func b2ABeaconsPlus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].autoBeacons) + absn(matchData[currentMatch][3].autoBeacons) + absn(matchData[currentMatch][0].autoBeacons) + absn(matchData[currentMatch][1].autoBeacons)) < 4){
            matchData[currentMatch][3].autoBeacons += 1
        }
        else if matchData[currentMatch][3].autoBeacons < 0 {
            matchData[currentMatch][3].autoBeacons += 1
        }
        refreshLabels()
    }
    @IBAction func b2ABeaconsMinus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].autoBeacons) + absn(matchData[currentMatch][3].autoBeacons) + absn(matchData[currentMatch][0].autoBeacons) + absn(matchData[currentMatch][1].autoBeacons)) < 4){
            matchData[currentMatch][3].autoBeacons -= 1
        }
        else if matchData[currentMatch][3].autoBeacons > 0 {
            matchData[currentMatch][3].autoBeacons -= 1
        }
        refreshLabels()
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
        if matchData[currentMatch][3].parkPts + 5 <= 10{
            matchData[currentMatch][3].parkPts += 5
            refreshLabels()
        }
    }
    @IBAction func b2AElevPtsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][3].parkPts - 5 >= 0{
            matchData[currentMatch][3].parkPts -= 5
            refreshLabels()
        }
    }
    @IBAction func b2ACapBallScored(_ sender: AnyObject) {
        if(b2ACapSwitch.isOn){
            matchData[currentMatch][3].autoCapBallPts = 5
        }
        else{
            matchData[currentMatch][3].autoCapBallPts = 0
        }
        refreshLabels()
    }
    @IBAction func b2ACapBallDNA(_ sender: AnyObject) {
        matchData[currentMatch][3].autoCapBallDNA = b1ACapDNA.isOn
        refreshLabels()
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
