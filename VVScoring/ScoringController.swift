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
        saveMatchData()
    }
    
    //save data
    @IBAction func toMatches(_ sender: AnyObject) {
        saveMatchData()
    }
    
    @IBAction func unwindToAuto(sender: UIStoryboardSegue){
    }
    
    @IBAction func save(_ sender: AnyObject) {
        saveMatchData()
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
    @IBOutlet var r1NameField: UITextField!
    var r1numValid = true


    @IBAction func r1NumChange(_ sender: AnyObject) {
    
        if let temp = teamList[r1NumField.text!]?.name {
            r1NameField.text = teamList[r1NumField.text!]?.name
            matchData[currentMatch][0].number = Int (r1NumField.text!)!
            r1numValid = true
        }
        else {
            r1NameField.text = "Wrong Number"
            r1numValid = false
        }
        refreshLabels()
    }
    
    
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
    @IBOutlet var r2NameField: UITextField!
    var r2numValid = true
    

    @IBAction func r2NumChange(_ sender: AnyObject) {
    
        if let temp = teamList[r2NumField.text!]?.name {
            r2NameField.text = teamList[r2NumField.text!]?.name
            matchData[currentMatch][1].number = Int (r2NumField.text!)!
            r2numValid = true
        }
        else {
            r2NameField.text = "Wrong Number"
            r2numValid = false
        }
        refreshLabels()
    }
    
    
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
    @IBOutlet var b1NameField: UITextField!
    var b1numValid = true
    

    @IBAction func b1NumChange(_ sender: AnyObject) {
    
        if let temp = teamList[b1NumField.text!]?.name {
            b1NameField.text = teamList[b1NumField.text!]?.name
            matchData[currentMatch][2].number = Int (b1NumField.text!)!
            b1numValid = true
        }
        else {
            b1NameField.text = "Wrong Number"
            b1numValid = false
        }
        refreshLabels()

    }
    
    
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
    @IBOutlet var b2NameField: UITextField!
    var b2numValid = true
    
    
    @IBAction func b2NumChange(_ sender: AnyObject) {
    
        if let temp = teamList[b2NumField.text!]?.name {
            b2NameField.text = teamList[b2NumField.text!]?.name
            matchData[currentMatch][3].number = Int (b2NumField.text!)!
            b2numValid = true
        }
        else {
            b2NameField.text = "Wrong Number"
            b2numValid = false
        }
        refreshLabels()
    }
    
    //Beacons
    
    @IBOutlet var r1team: UIButton!
    @IBOutlet var r2team: UIButton!
    @IBOutlet var b1team: UIButton!
    @IBOutlet var b2team: UIButton!
    
    @IBAction func r1select(_ sender: AnyObject) {
        currentTeam = matchData[currentMatch][0].number
        selectedTeam.text = String (currentTeam)
    }
    @IBAction func r2select(_ sender: AnyObject) {
        currentTeam = matchData[currentMatch][1].number
        selectedTeam.text = String (currentTeam)
    }
    @IBAction func b1select(_ sender: AnyObject) {
        currentTeam = matchData[currentMatch][2].number
        selectedTeam.text = String (currentTeam)
    }
    @IBAction func b2select(_ sender: AnyObject) {
        currentTeam = matchData[currentMatch][3].number
        selectedTeam.text = String (currentTeam)
    }
    
    @IBOutlet var selectedTeam: UILabel!
    
    var currentTeam = 7655
    
    var bCurrent: [Int] = [0,0,0,0]
    
    func bCheck(beacon: Int, check: Int){
        for i in 0..<4{
            if(matchData[currentMatch][i].bType[beacon] == check){
                matchData[currentMatch][i].bType[beacon] = 0
                matchData[currentMatch][i].beacons -= 1
            }
        }
    }
    
    func teamIndex(number: Int) -> Int {
        for i in 0..<4{
            if(matchData[currentMatch][i].number == number){
                return i
            }
        }
        return -1
    }
    
    @IBAction func r1red(_ sender: AnyObject) {
        if(bCurrent[0] == 1){
            return
        }
        else if (bCurrent[0] == 2){
            bCheck(beacon: 0, check: 2)
        }
        else{
            
            matchData[currentMatch][teamIndex(number: currentTeam)].bType[0] = 1
            matchData[currentMatch][teamIndex(number: currentTeam)].bCount += 1
            r1owner.text = String (currentTeam)
        }
    }
    @IBAction func r1blue(_ sender: AnyObject) {
        if(bCurrent[0] == 2){
            return
        }
        else if (bCurrent[0] == 1){
            bCheck(beacon: 0, check: 1)
        }
        else{
            
            matchData[currentMatch][teamIndex(number: currentTeam)].bType[0] = 2
            matchData[currentMatch][teamIndex(number: currentTeam)].bCount += 1
            r1owner.text = String (currentTeam)
        }
    }
    @IBOutlet var r1owner: UILabel!
    
    @IBAction func r2red(_ sender: AnyObject) {
        if(bCurrent[1] == 1){
            return
        }
        else if (bCurrent[1] == 2){
            bCheck(beacon: 1, check: 2)
        }
        else{
            
            matchData[currentMatch][teamIndex(number: currentTeam)].bType[1] = 1
            matchData[currentMatch][teamIndex(number: currentTeam)].bCount += 1
            r2owner.text = String (currentTeam)
        }
    }
    @IBAction func r2blue(_ sender: AnyObject) {
        if(bCurrent[1] == 2){
            return
        }
        else if (bCurrent[1] == 1){
            bCheck(beacon: 1, check: 1)
        }
        else{
            
            matchData[currentMatch][teamIndex(number: currentTeam)].bType[1] = 2
            matchData[currentMatch][teamIndex(number: currentTeam)].bCount += 1
            r2owner.text = String (currentTeam)
        }
    }
    @IBOutlet var r2owner: UILabel!
    
    @IBAction func b1red(_ sender: AnyObject) {
        if(bCurrent[2] == 1){
            return
        }
        else if (bCurrent[2] == 2){
            bCheck(beacon: 2, check: 2)
        }
        else{
            
            matchData[currentMatch][teamIndex(number: currentTeam)].bType[2] = 1
            matchData[currentMatch][teamIndex(number: currentTeam)].bCount += 1
            b1owner.text = String (currentTeam)
        }
    }
    @IBAction func b1blue(_ sender: AnyObject) {
        if(bCurrent[2] == 2){
            return
        }
        else if (bCurrent[2] == 1){
            bCheck(beacon: 2, check: 1)
        }
        else{
            
            matchData[currentMatch][teamIndex(number: currentTeam)].bType[2] = 2
            matchData[currentMatch][teamIndex(number: currentTeam)].bCount += 1
            b1owner.text = String (currentTeam)
        }
    }
    @IBOutlet var b1owner: UILabel!
    
    @IBAction func b2red(_ sender: AnyObject) {
        if(bCurrent[3] == 1){
            return
        }
        else if (bCurrent[3] == 2){
            bCheck(beacon: 3, check: 2)
        }
        else{
            
            matchData[currentMatch][teamIndex(number: currentTeam)].bType[3] = 1
            matchData[currentMatch][teamIndex(number: currentTeam)].bCount += 1
            b2owner.text = String (currentTeam)
        }
    }
    @IBAction func b2blue(_ sender: AnyObject) {
        if(bCurrent[3] == 2){
            return
        }
        else if (bCurrent[3] == 1){
            bCheck(beacon: 3, check: 1)
        }
        else{
            
            matchData[currentMatch][teamIndex(number: currentTeam)].bType[3] = 2
            matchData[currentMatch][teamIndex(number: currentTeam)].bCount += 1
            b2owner.text = String (currentTeam)
        }
    }
    @IBOutlet var b2owner: UILabel!
    
    //SCORING
    func refreshLabels(){
        
        //Calculate and score the calculated data points
        
        let r1Aneg = matchData[currentMatch][0].autoBeacons < 0
        let r2Aneg = matchData[currentMatch][1].autoBeacons < 0
        let b1Aneg = matchData[currentMatch][2].autoBeacons < 0
        let b2Aneg = matchData[currentMatch][3].autoBeacons < 0
        
        let r1Tneg = matchData[currentMatch][0].beacons < 0
        let r2Tneg = matchData[currentMatch][1].beacons < 0
        let b1Tneg = matchData[currentMatch][2].beacons < 0
        let b2Tneg = matchData[currentMatch][3].beacons < 0
        
        //RED 1
        matchData[currentMatch][0].autoPts = (matchData[currentMatch][0].autoCorner * 5) + (matchData[currentMatch][0].autoVortex * 15) + matchData[currentMatch][0].parkPts + matchData[currentMatch][0].autoCapBallPts
        if(!r1Aneg){
            matchData[currentMatch][0].autoPts += matchData[currentMatch][0].autoBeacons * 30
        }
        matchData[currentMatch][0].telePts = matchData[currentMatch][0].cornerBalls + (matchData[currentMatch][0].vortexBalls * 5)
        matchData[currentMatch][0].endGamePts = matchData[currentMatch][0].capBallPts
        if(!r1Tneg){
            matchData[currentMatch][0].endGamePts += matchData[currentMatch][0].beacons * 10
        }
        matchData[currentMatch][0].calculatedScore = matchData[currentMatch][0].autoPts + matchData[currentMatch][0].telePts + matchData[currentMatch][0].endGamePts
        
        
        //RED 2
        matchData[currentMatch][1].autoPts = (matchData[currentMatch][1].autoCorner * 5) + (matchData[currentMatch][1].autoVortex * 15) + matchData[currentMatch][1].parkPts + matchData[currentMatch][1].autoCapBallPts
        if(!r2Aneg){
            matchData[currentMatch][1].autoPts += matchData[currentMatch][1].autoBeacons * 30
        }
        matchData[currentMatch][1].telePts = matchData[currentMatch][1].cornerBalls + (matchData[currentMatch][1].vortexBalls * 5)
        matchData[currentMatch][1].endGamePts = matchData[currentMatch][1].capBallPts
        if(!r2Tneg){
            matchData[currentMatch][1].endGamePts += matchData[currentMatch][1].beacons * 10
        }
        matchData[currentMatch][1].calculatedScore = matchData[currentMatch][1].autoPts + matchData[currentMatch][1].telePts + matchData[currentMatch][1].endGamePts
        
        matchData[currentMatch][0].allianceScore = matchData[currentMatch][0].calculatedScore + matchData[currentMatch][1].calculatedScore
        matchData[currentMatch][1].allianceScore = matchData[currentMatch][0].calculatedScore + matchData[currentMatch][1].calculatedScore
        
        
        //BLUE 1
        matchData[currentMatch][2].autoPts = (matchData[currentMatch][2].autoCorner * 5) + (matchData[currentMatch][2].autoVortex * 15) + matchData[currentMatch][2].parkPts + matchData[currentMatch][2].autoCapBallPts
        if(!b1Aneg){
            matchData[currentMatch][2].autoPts += matchData[currentMatch][2].autoBeacons * 30
        }
        matchData[currentMatch][2].telePts = matchData[currentMatch][2].cornerBalls + (matchData[currentMatch][2].vortexBalls * 5)
        matchData[currentMatch][2].endGamePts = matchData[currentMatch][2].capBallPts
        if(!b1Tneg){
            matchData[currentMatch][2].endGamePts += matchData[currentMatch][2].beacons * 10
        }
        matchData[currentMatch][2].calculatedScore = matchData[currentMatch][2].autoPts + matchData[currentMatch][2].telePts + matchData[currentMatch][2].endGamePts
        
        
        //BLUE 2
        matchData[currentMatch][3].autoPts = (matchData[currentMatch][3].autoCorner * 5) + (matchData[currentMatch][3].autoVortex * 15) + matchData[currentMatch][3].parkPts + matchData[currentMatch][3].autoCapBallPts
        if(!b2Aneg){
            matchData[currentMatch][3].autoPts += matchData[currentMatch][3].autoBeacons * 30
        }
        matchData[currentMatch][3].telePts = matchData[currentMatch][3].cornerBalls + (matchData[currentMatch][3].vortexBalls * 5)
        matchData[currentMatch][3].endGamePts = matchData[currentMatch][3].capBallPts
        if(!b2Tneg){
            matchData[currentMatch][3].endGamePts += matchData[currentMatch][3].beacons * 10
        }
        matchData[currentMatch][3].calculatedScore = matchData[currentMatch][3].autoPts + matchData[currentMatch][3].telePts + matchData[currentMatch][3].endGamePts
        
        matchData[currentMatch][2].allianceScore = matchData[currentMatch][2].calculatedScore + matchData[currentMatch][3].calculatedScore
        matchData[currentMatch][3].allianceScore = matchData[currentMatch][2].calculatedScore + matchData[currentMatch][3].calculatedScore
        
        //Check if beacons were scored for the other teams
        
        //Auto
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
            matchData[currentMatch][3].outcome = 1
        }
        else if(matchData[currentMatch][0].allianceScore < matchData[currentMatch][2].allianceScore){
            matchData[currentMatch][0].outcome = 1
            matchData[currentMatch][1].outcome = 1
            matchData[currentMatch][2].outcome = 0
            matchData[currentMatch][3].outcome = 0
        }
        else{
            matchData[currentMatch][0].outcome = 2
            matchData[currentMatch][1].outcome = 2
            matchData[currentMatch][2].outcome = 2
            matchData[currentMatch][3].outcome = 2
        }
        
        
        
        
        
        
        matchLabel.text = "Match \(currentMatch)"
        
        
        //RED 1
        if(r1numValid){
            if(matchData[currentMatch][0].number != 0){
                r1NumField.text = String(matchData[currentMatch][0].number)
                r1NameField.text = teamList[r1NumField.text!]?.name
            }
            else {
                r1NumField.text = ""
            }
        }
       // r1ABeaconsDNA.setOn(matchData[currentMatch][0].autoBeaconsDNA, animated: false)
        //r1ABeacons.text = String(matchData[currentMatch][0].autoBeacons)
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
        if(r2numValid){
            if(matchData[currentMatch][1].number != 0){
                r2NumField.text = String(matchData[currentMatch][1].number)
                r2NameField.text = teamList[r2NumField.text!]?.name
            }
            else {
                r2NumField.text = ""
            }
        }
        //r2ABeaconsDNA.setOn(matchData[currentMatch][1].autoBeaconsDNA, animated: false)
        //r2ABeacons.text = String(matchData[currentMatch][1].autoBeacons)
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
        if(b1numValid){
            if(matchData[currentMatch][2].number != 0){
                b1NumField.text = String(matchData[currentMatch][2].number)
                b1NameField.text = teamList[b1NumField.text!]?.name
            }
            else {
                b1NumField.text = ""
            }
        }
        //b1ABeaconsDNA.setOn(matchData[currentMatch][2].autoBeaconsDNA, animated: false)
        //b1ABeacons.text = String(matchData[currentMatch][2].autoBeacons)
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
        if(b2numValid){
            if(matchData[currentMatch][3].number != 0){
                b2NumField.text = String(matchData[currentMatch][3].number)
                b2NameField.text = teamList[b2NumField.text!]?.name
            }
            else {
                b2NumField.text = ""
            }
        }
        //b2ABeaconsDNA.setOn(matchData[currentMatch][3].autoBeaconsDNA, animated: false)
        //b2ABeacons.text = String(matchData[currentMatch][3].autoBeacons)
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

        
        
        r1AScore.text = String(matchData[currentMatch][0].autoPts)
        r1MatchScore.text = String(matchData[currentMatch][0].calculatedScore)
        r2AScore.text = String(matchData[currentMatch][1].autoPts)
        r2MatchScore.text = String(matchData[currentMatch][1].calculatedScore)
        redAllianceScore.text = String(matchData[currentMatch][0].allianceScore)
        
        b1AScore.text = String(matchData[currentMatch][2].autoPts)
        b1MatchScore.text = String(matchData[currentMatch][2].calculatedScore)
        b2AScore.text = String(matchData[currentMatch][3].autoPts)
        b2MatchScore.text = String(matchData[currentMatch][3].calculatedScore)
        blueAllianceScore.text = String(matchData[currentMatch][3].allianceScore)
        
        
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
