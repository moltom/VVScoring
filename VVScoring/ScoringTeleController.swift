//
//  ScoringTeleController.swift
//  NBNP2Scoring
//
//  Created by MUELLER, HANS on 11/9/16.
//  Copyright © 2016 CLARK. All rights reserved.
//

import UIKit

class ScoringTeleController: UIViewController {
    
    
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
        
        let r1neg = matchData[currentMatch][0].beacons < 0
        let r2neg = matchData[currentMatch][1].beacons < 0
        let b1neg = matchData[currentMatch][2].beacons < 0
        let b2neg = matchData[currentMatch][3].beacons < 0
        
        //Calculate and score the calculated data points
        
        
        //RED 1
        matchData[currentMatch][0].autoPts = (matchData[currentMatch][0].autoCorner * 5) + (matchData[currentMatch][0].autoVortex * 15) + (matchData[currentMatch][0].autoBeacons * 30) + matchData[currentMatch][0].parkPts + matchData[currentMatch][0].autoCapBallPts
        matchData[currentMatch][0].telePts = matchData[currentMatch][0].cornerBalls + (matchData[currentMatch][0].vortexBalls * 5)
        matchData[currentMatch][0].endGamePts = matchData[currentMatch][0].capBallPts
        if(!r1neg){
            matchData[currentMatch][0].endGamePts += matchData[currentMatch][0].beacons * 10
        }
        matchData[currentMatch][0].calculatedScore = matchData[currentMatch][0].autoPts + matchData[currentMatch][0].telePts + matchData[currentMatch][0].endGamePts
        
        
        //RED 2
        matchData[currentMatch][1].autoPts = (matchData[currentMatch][1].autoCorner * 5) + (matchData[currentMatch][1].autoVortex * 15) + (matchData[currentMatch][1].autoBeacons * 30) + matchData[currentMatch][1].parkPts + matchData[currentMatch][1].autoCapBallPts
        matchData[currentMatch][1].telePts = matchData[currentMatch][1].cornerBalls + (matchData[currentMatch][1].vortexBalls * 5)
        matchData[currentMatch][1].endGamePts = matchData[currentMatch][1].capBallPts
        if(!r2neg){
            matchData[currentMatch][1].endGamePts += matchData[currentMatch][1].beacons * 10
        }
        matchData[currentMatch][1].calculatedScore = matchData[currentMatch][1].autoPts + matchData[currentMatch][1].telePts + matchData[currentMatch][1].endGamePts
        
        matchData[currentMatch][0].allianceScore = matchData[currentMatch][0].calculatedScore + matchData[currentMatch][1].calculatedScore
        matchData[currentMatch][1].allianceScore = matchData[currentMatch][0].calculatedScore + matchData[currentMatch][1].calculatedScore
        
        
        //BLUE 1
        matchData[currentMatch][2].autoPts = (matchData[currentMatch][2].autoCorner * 5) + (matchData[currentMatch][2].autoVortex * 15) + (matchData[currentMatch][2].autoBeacons * 30) + matchData[currentMatch][2].parkPts + matchData[currentMatch][2].autoCapBallPts
        matchData[currentMatch][2].telePts = matchData[currentMatch][2].cornerBalls + (matchData[currentMatch][2].vortexBalls * 5)
        matchData[currentMatch][2].endGamePts = matchData[currentMatch][2].capBallPts
        if(!b1neg){
            matchData[currentMatch][2].endGamePts += matchData[currentMatch][2].beacons * 10
        }
        matchData[currentMatch][2].calculatedScore = matchData[currentMatch][2].autoPts + matchData[currentMatch][2].telePts + matchData[currentMatch][2].endGamePts
        
        
        //BLUE 2
        matchData[currentMatch][3].autoPts = (matchData[currentMatch][3].autoCorner * 5) + (matchData[currentMatch][3].autoVortex * 15) + (matchData[currentMatch][3].autoBeacons * 30) + matchData[currentMatch][3].parkPts + matchData[currentMatch][3].autoCapBallPts
        matchData[currentMatch][3].telePts = matchData[currentMatch][3].cornerBalls + (matchData[currentMatch][3].vortexBalls * 5)
        matchData[currentMatch][3].endGamePts = matchData[currentMatch][3].capBallPts
        if(!b2neg){
            matchData[currentMatch][3].endGamePts += matchData[currentMatch][3].beacons * 10
        }
        matchData[currentMatch][3].calculatedScore = matchData[currentMatch][3].autoPts + matchData[currentMatch][3].telePts + matchData[currentMatch][3].endGamePts
        
        matchData[currentMatch][2].allianceScore = matchData[currentMatch][2].calculatedScore + matchData[currentMatch][3].calculatedScore
        matchData[currentMatch][3].allianceScore = matchData[currentMatch][2].calculatedScore + matchData[currentMatch][3].calculatedScore
        
        
        
        //Check if beacons were scored for the other teams
        if(matchData[currentMatch][2].autoBeacons < 0){
            matchData[currentMatch][0].allianceScore -= (matchData[currentMatch][2].autoBeacons * 30)
            matchData[currentMatch][1].allianceScore -= (matchData[currentMatch][2].autoBeacons * 30)
        }
        if(matchData[currentMatch][3].autoBeacons < 0){
            matchData[currentMatch][0].allianceScore -= (matchData[currentMatch][3].autoBeacons * 30)
            matchData[currentMatch][1].allianceScore -= (matchData[currentMatch][3].autoBeacons * 30)
        }
        if(matchData[currentMatch][0].autoBeacons < 0){
            matchData[currentMatch][2].allianceScore -= (matchData[currentMatch][0].autoBeacons * 30)
            matchData[currentMatch][3].allianceScore -= (matchData[currentMatch][0].autoBeacons * 30)
        }
        if(matchData[currentMatch][1].autoBeacons < 0){
            matchData[currentMatch][2].allianceScore -= (matchData[currentMatch][1].autoBeacons * 30)
            matchData[currentMatch][3].allianceScore -= (matchData[currentMatch][1].autoBeacons * 30)
        }
        
        //Tele
        if(matchData[currentMatch][2].beacons < 0){
            matchData[currentMatch][0].allianceScore -= (matchData[currentMatch][2].beacons * 10)
            matchData[currentMatch][1].allianceScore -= (matchData[currentMatch][2].beacons * 10)
        }
        if(matchData[currentMatch][3].beacons < 0){
            matchData[currentMatch][0].allianceScore -= (matchData[currentMatch][3].beacons * 10)
            matchData[currentMatch][1].allianceScore -= (matchData[currentMatch][3].beacons * 10)
        }
        if(matchData[currentMatch][0].beacons < 0){
            matchData[currentMatch][2].allianceScore -= (matchData[currentMatch][0].beacons * 10)
            matchData[currentMatch][3].allianceScore -= (matchData[currentMatch][0].beacons * 10)
        }
        if(matchData[currentMatch][1].beacons < 0){
            matchData[currentMatch][2].allianceScore -= (matchData[currentMatch][1].beacons * 10)
            matchData[currentMatch][3].allianceScore -= (matchData[currentMatch][1].beacons * 10)
        }

        
        if(matchData[currentMatch][0].allianceScore > matchData[currentMatch][2].allianceScore){
            matchData[currentMatch][0].outcome = 0
            matchData[currentMatch][1].outcome = 0
            matchData[currentMatch][2].outcome = 1
            matchData[currentMatch][2].outcome = 1
        }
        else if(matchData[currentMatch][0].allianceScore < matchData[currentMatch][2].allianceScore){
            matchData[currentMatch][0].outcome = 1
            matchData[currentMatch][1].outcome = 1
            matchData[currentMatch][2].outcome = 0
            matchData[currentMatch][2].outcome = 0
        }
        else{
            matchData[currentMatch][0].outcome = 2
            matchData[currentMatch][1].outcome = 2
            matchData[currentMatch][2].outcome = 2
            matchData[currentMatch][3].outcome = 2
        }
        
        
        
        
        
        
        matchLabel.text = "Match \(currentMatch)"
        
        
        //RED 1
        r1TCenter.text = String(matchData[currentMatch][0].vortexBalls)
        r1TCorner.text = String(matchData[currentMatch][0].cornerBalls)
        r1TBeacons.text = String(matchData[currentMatch][0].beacons)
        r1TCapPts.text = String(matchData[currentMatch][0].capBallPts)
        r1TCapDNA.setOn(matchData[currentMatch][0].capBallDNA, animated: false)
        
        //RED 2
        r2TCenter.text = String(matchData[currentMatch][1].vortexBalls)
        r2TCorner.text = String(matchData[currentMatch][1].cornerBalls)
        r2TBeacons.text = String(matchData[currentMatch][1].beacons)
        r2TCapPts.text = String(matchData[currentMatch][1].capBallPts)
        r2TCapDNA.setOn(matchData[currentMatch][1].capBallDNA, animated: false)
        
        //BLUE 1
        b1TCenter.text = String(matchData[currentMatch][2].vortexBalls)
        b1TCorner.text = String(matchData[currentMatch][2].cornerBalls)
        b1TBeacons.text = String(matchData[currentMatch][2].beacons)
        b1TCapPts.text = String(matchData[currentMatch][2].capBallPts)
        b1TCapDNA.setOn(matchData[currentMatch][2].capBallDNA, animated: false)
        
        //BLUE 2
        b2TCenter.text = String(matchData[currentMatch][3].vortexBalls)
        b2TCorner.text = String(matchData[currentMatch][3].cornerBalls)
        b2TBeacons.text = String(matchData[currentMatch][3].beacons)
        b2TCapPts.text = String(matchData[currentMatch][3].capBallPts)
        b2TCapDNA.setOn(matchData[currentMatch][3].capBallDNA, animated: false)
        

        
        
        redAllianceScore.text = String(matchData[currentMatch][0].allianceScore)
        blueAllianceScore.text = String(matchData[currentMatch][2].allianceScore)
        
        
        r1TScore.text = String(matchData[currentMatch][0].telePts + matchData[currentMatch][0].endGamePts)
        r1TMatchScore.text = String(matchData[currentMatch][0].calculatedScore)
        r2TScore.text = String(matchData[currentMatch][1].telePts + matchData[currentMatch][1].endGamePts)
        r2TMatchScore.text = String(matchData[currentMatch][1].calculatedScore)
        redAllianceScore.text = String(matchData[currentMatch][0].allianceScore)
        
        b1TScore.text = String(matchData[currentMatch][2].telePts + matchData[currentMatch][2].endGamePts)
        b1TMatchScore.text = String(matchData[currentMatch][2].calculatedScore)
        b2TScore.text = String(matchData[currentMatch][3].telePts + matchData[currentMatch][3].endGamePts)
        b2TMatchScore.text = String(matchData[currentMatch][3].calculatedScore)
        blueAllianceScore.text = String(matchData[currentMatch][3].allianceScore)
        
        
    }
    
    
    //RED 1
    @IBAction func r1TCenterBallsPlus(_ sender: AnyObject) {
       
        matchData[currentMatch][0].vortexBalls += 1
        refreshLabels()
    
    }
    @IBAction func r1TCenterBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][0].vortexBalls - 1 >= 0{
            matchData[currentMatch][0].vortexBalls -= 1
            refreshLabels()
        }

    }
    @IBAction func r1TCornerBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][0].cornerBalls += 1
        refreshLabels()
    }
    @IBAction func r1TCornerBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][0].cornerBalls - 1 >= 0{
            matchData[currentMatch][0].cornerBalls -= 1
            refreshLabels()
        }
    }
    @IBAction func r1TBeaconsPlus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].beacons) + absn(matchData[currentMatch][3].beacons) + absn(matchData[currentMatch][0].beacons) + absn(matchData[currentMatch][1].beacons)) < 4){
            matchData[currentMatch][0].beacons += 1
        }
        else if matchData[currentMatch][0].beacons < 0 {
            matchData[currentMatch][0].beacons += 1
        }
        refreshLabels()
    }
    @IBAction func r1TBeaconsMinus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].beacons) + absn(matchData[currentMatch][3].beacons) + absn(matchData[currentMatch][0].beacons) + absn(matchData[currentMatch][1].beacons)) < 4){
            matchData[currentMatch][0].beacons -= 1
        }
        else if matchData[currentMatch][0].beacons > 0 {
            matchData[currentMatch][0].beacons -= 1
        }
        refreshLabels()
    }
    @IBAction func r1TCapBallPtsPlus(_ sender: AnyObject) {
        switch (matchData[currentMatch][0].capBallPts){
        case 0:
            matchData[currentMatch][0].capBallPts = 10
        case 10:
            matchData[currentMatch][0].capBallPts = 20
        case 20:
            matchData[currentMatch][0].capBallPts = 40
        default:
            break
        }
        refreshLabels()
    }
    @IBAction func r1CapBallPtsMinus(_ sender: AnyObject) {
        switch (matchData[currentMatch][0].capBallPts){
        case 40:
            matchData[currentMatch][0].capBallPts = 20
        case 10:
            matchData[currentMatch][0].capBallPts = 0
        case 20:
            matchData[currentMatch][0].capBallPts = 10
        default:
            break
        }
        refreshLabels()
    }
    @IBAction func r1TCapBallDNA(_ sender: AnyObject) {
        matchData[currentMatch][0].capBallDNA = r1TCapDNA.isOn
        refreshLabels()

    }
    
    
    //RED 2
    @IBAction func r2TCenterBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][1].vortexBalls += 1
        refreshLabels()
    }
    @IBAction func r2TCenterBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][1].vortexBalls - 1 >= 0{
            matchData[currentMatch][1].vortexBalls -= 1
            refreshLabels()
        }
    }
    @IBAction func r2TCornerBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][1].cornerBalls += 1
        refreshLabels()
    }
    @IBAction func r2TCornerBallsMinus(_ sender: AnyObject) {
        if matchData[currentMatch][1].cornerBalls - 1 >= 0{
            matchData[currentMatch][1].cornerBalls -= 1
            refreshLabels()
        }
    }
    @IBAction func r2TBeaconsPlus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].beacons) + absn(matchData[currentMatch][3].beacons) + absn(matchData[currentMatch][0].beacons) + absn(matchData[currentMatch][1].beacons)) < 4){
            matchData[currentMatch][1].beacons += 1
        }
        else if matchData[currentMatch][1].beacons < 0 {
            matchData[currentMatch][1].beacons += 1
        }
        refreshLabels()
    }
    @IBAction func r2TBeaconsMinus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].beacons) + absn(matchData[currentMatch][3].beacons) + absn(matchData[currentMatch][0].beacons) + absn(matchData[currentMatch][1].beacons)) < 4){
            matchData[currentMatch][1].beacons -= 1
        }
        else if matchData[currentMatch][1].beacons > 0 {
            matchData[currentMatch][1].beacons -= 1
        }
        refreshLabels()
    }
    @IBAction func r2TCapBallPtsPlus(_ sender: AnyObject) {
        switch (matchData[currentMatch][1].capBallPts){
        case 0:
            matchData[currentMatch][1].capBallPts = 10
        case 10:
            matchData[currentMatch][1].capBallPts = 20
        case 20:
            matchData[currentMatch][1].capBallPts = 40
        default:
            break
        }
        refreshLabels()
    }
    @IBAction func r2TCapBallPtsMinus(_ sender: AnyObject) {
        switch (matchData[currentMatch][1].capBallPts){
        case 40:
            matchData[currentMatch][1].capBallPts = 20
        case 10:
            matchData[currentMatch][1].capBallPts = 0
        case 20:
            matchData[currentMatch][1].capBallPts = 10
        default:
            break
        }
        refreshLabels()
    }
    @IBAction func r2TCapBallDNA(_ sender: AnyObject) {
        matchData[currentMatch][1].capBallDNA = r1TCapDNA.isOn
        refreshLabels()
    }
    
    
    //BLUE 1
    @IBAction func b1TCenterBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][2].vortexBalls += 1
        refreshLabels()
    }
    @IBAction func b1TCenterBallsMinus(_ sender: AnyObject) {
        if(matchData[currentMatch][2].vortexBalls != 0){
            matchData[currentMatch][2].vortexBalls -= 1
        }
        refreshLabels()
    }
    @IBAction func b1TCornerBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][2].cornerBalls += 1
        refreshLabels()
    }
    @IBAction func b1TCornerBallsMinus(_ sender: AnyObject) {
        if(matchData[currentMatch][2].cornerBalls != 0){
            matchData[currentMatch][2].cornerBalls -= 1
        }
        refreshLabels()
    }
    @IBAction func b1TBeaconsPlus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].beacons) + absn(matchData[currentMatch][3].beacons) + absn(matchData[currentMatch][0].beacons) + absn(matchData[currentMatch][1].beacons)) < 4){
            matchData[currentMatch][2].beacons += 1
        }
        else if matchData[currentMatch][2].beacons < 0 {
            matchData[currentMatch][2].beacons += 1
        }
        refreshLabels()
    }
    @IBAction func b1TBeaconsMinus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].beacons) + absn(matchData[currentMatch][3].beacons) + absn(matchData[currentMatch][0].beacons) + absn(matchData[currentMatch][1].beacons)) < 4){
            matchData[currentMatch][2].beacons -= 1
        }
        else if matchData[currentMatch][2].beacons > 0 {
            matchData[currentMatch][2].beacons -= 1
        }
        refreshLabels()
    }
    @IBAction func b1TCapBallPtsPlus(_ sender: AnyObject) {
        switch (matchData[currentMatch][2].capBallPts){
        case 0:
            matchData[currentMatch][2].capBallPts = 10
        case 10:
            matchData[currentMatch][2].capBallPts = 20
        case 20:
            matchData[currentMatch][2].capBallPts = 40
        default:
            break
        }
        refreshLabels()
    }
    @IBAction func b1TCapBallPtsMinus(_ sender: AnyObject) {
        switch (matchData[currentMatch][2].capBallPts){
        case 40:
            matchData[currentMatch][2].capBallPts = 20
        case 10:
            matchData[currentMatch][2].capBallPts = 0
        case 20:
            matchData[currentMatch][2].capBallPts = 10
        default:
            break
        }
        refreshLabels()
    }
    @IBAction func b1TCapBallDNA(_ sender: AnyObject) {
        matchData[currentMatch][2].capBallDNA = r1TCapDNA.isOn
        refreshLabels()
    }
    
    
    //BLUE 2
    @IBAction func b2TCenterBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][3].vortexBalls += 1
        refreshLabels()
    }
    @IBAction func b2TCenterBallsMinus(_ sender: AnyObject) {
        if(matchData[currentMatch][3].vortexBalls != 0){
            matchData[currentMatch][3].vortexBalls -= 1
        }
        refreshLabels()
    }
    @IBAction func b2TCornerBallsPlus(_ sender: AnyObject) {
        matchData[currentMatch][3].cornerBalls += 1
        refreshLabels()
    }
    @IBAction func b2TCornerBallsMinus(_ sender: AnyObject) {
        if(matchData[currentMatch][3].cornerBalls != 0){
            matchData[currentMatch][3].cornerBalls -= 1
        }
        refreshLabels()
    }
    @IBAction func b2TBeaconsPlus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].beacons) + absn(matchData[currentMatch][3].beacons) + absn(matchData[currentMatch][0].beacons) + absn(matchData[currentMatch][1].beacons)) < 4){
            matchData[currentMatch][3].beacons += 1
        }
        else if matchData[currentMatch][3].beacons < 0 {
            matchData[currentMatch][3].beacons += 1
        }
        refreshLabels()
    }
    @IBAction func b2TBeaconsMinus(_ sender: AnyObject) {
        if((absn(matchData[currentMatch][2].beacons) + absn(matchData[currentMatch][3].beacons) + absn(matchData[currentMatch][0].beacons) + absn(matchData[currentMatch][1].beacons)) < 4){
            matchData[currentMatch][3].beacons -= 1
        }
        else if matchData[currentMatch][3].beacons > 0 {
            matchData[currentMatch][3].beacons -= 1
        }
        refreshLabels()
    }
    @IBAction func b2TCapBallPtsPlus(_ sender: AnyObject) {
        switch (matchData[currentMatch][3].capBallPts){
        case 0:
            matchData[currentMatch][3].capBallPts = 10
        case 10:
            matchData[currentMatch][3].capBallPts = 20
        case 20:
            matchData[currentMatch][3].capBallPts = 40
        default:
            break
        }
        refreshLabels()
    }
    @IBAction func b2TCapBallPtsMinus(_ sender: AnyObject) {
        switch (matchData[currentMatch][3].capBallPts){
        case 40:
            matchData[currentMatch][3].capBallPts = 20
        case 10:
            matchData[currentMatch][3].capBallPts = 0
        case 20:
            matchData[currentMatch][3].capBallPts = 10
        default:
            break
        }
        refreshLabels()
    }
    @IBAction func b2TCapBallDNA(_ sender: AnyObject) {
        matchData[currentMatch][3].capBallDNA = r1TCapDNA.isOn
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
