//
//  newProc.swift
//  NBNP2Scoring
//
//  Created by Tom Clark on 11/2/16.
//  Copyright © 2016 CLARK. All rights reserved.
//

import Foundation

struct teamInMatch{
    var number: Int = 0 //Team number
    var match: Int = 0
    /*  Match number for qualification match                ex. qualification match 45 = 45
     *  1000 plus match number for semifinal match          ex. semifinal match 2-3 = 1023
     *  10000 plus match number for division final match    ex. final match 1 = 10001
     *  100000 plus match number for final match            ex. interdivision final match 2 = 100002
    */
    var autoCorner: Int = 0 //amount
    var autoVortex: Int = 0 //amount
    var autoBeacons: Int = 0 //amount
    var autoBeaconsDNA: Bool = false
    var parkPts: Int = 0 //points
    var autoCapBallPts: Int = 0 //points
    var autoCapBallDNA: Bool = false
    var autoPts: Int = 0 //points
    var cornerBalls: Int = 0 // amount
    var vortexBalls: Int = 0 //amount
    var telePts: Int = 0 //points
    var capBallPts: Int = 0 //points
    var capBallDNA: Bool = false
    var beacons: Int = 0 //amount
    var endGamePts: Int = 0 //points
    var outcome: Int = 0 //Win 0, loss 1, tie 2
    var calculatedScore: Int = 0 //OPR points
    var allianceScore: Int = -1
    var officialScore: Int = -1
}

struct teamAverage{
    var number: Int = 0
    var autoCorner: Double = 0.0
    var autoVortex: Double = 0.0
    var autoCapBallPts: Double = 0.0
    var autoBeacons: Double = 0.0
    var parkPts: Double = 0.0
    var autoPts: Double = 0.0
    var cornerBalls: Double = 0.0
    var vortexBalls: Double = 0.0
    var telePts: Double = 0.0
    var capBallPts: Double = 0.0
    var beacons: Double = 0.0
    var endGamePts: Double = 0.0
    var opr: Double = 0.0
    var allianceScore: Double = 0.0
    var QP: Int = 0
    var RP: Int = 0
}

var teamList: [String : (name: String, fav: Bool)] = [:]

var matchData: [[teamInMatch]] = []

struct tournament{
    var name: String = "nil"
    var type: String = "nil"
    var date: String = "nil"
    var fileLocation: String = "nil"
}

var tournamentList: [tournament] = []

let elimData: [[teamInMatch]] = []

func sortMatchData(){
    matchData = matchData.sorted{ $0[0].match < $1[0].match }
}

func getMatchLabel(index: Int) -> String {
    if matchData[index][0].match < 1010 {
        return "Q\(matchData[index][0].match + 1)"
    }
    if matchData[index][0].match < 1020 {
        return "S1-\(matchData[index][0].match - 1009)"
    }
    if matchData[index][0].match < 1030 {
        return "S2-\(matchData[index][0].match - 1019)"
    }
    if matchData[index][0].match < 1040 {
        return "F\(matchData[index][0].match - 1029)"
    }
    else {
        return "C\(matchData[index][0].match - 1039)"
    }
    
}

func sortTeamsBy(mode: String, dir: Int) -> [teamAverage]{
    //dir: Int is the sorting direction (increasing/decreasing) inc is 1, dec is 0
    //Output array
    var output: [teamAverage] = []
    
    //Check for extraneous values in the direction parameter
    if dir > 1 || dir < 0{
        print("Can't find direction in data process")
        return output
    }
    
    //Averages from all teams
    var teamAverages: [teamAverage] = []
    
    //Stores all averages based on all teams in list
    for (number, _) in teamList {
        teamAverages.append(getAverages(num: Int(number)!).averages)    }
    
    //Check mode to sort by
    switch(mode){
    case "autoCorner":
        if(dir == 0){
            output = teamAverages.sorted{ $0.autoCorner < $1.autoCorner }
        }else{
            output = teamAverages.sorted{ $0.autoCorner > $1.autoCorner }
        }
    case "autoVortex":
        if(dir == 0){
            output = teamAverages.sorted{ $0.autoVortex < $1.autoVortex }
        }else{
            output = teamAverages.sorted{ $0.autoVortex > $1.autoVortex }
        }
        
    case "autoBeacons":
        if(dir == 0){
            output = teamAverages.sorted{ $0.autoBeacons < $1.autoBeacons }
        }else{
            output = teamAverages.sorted{ $0.autoBeacons > $1.autoBeacons }
        }
        
    case "parkPts":
        if(dir == 0){
            output = teamAverages.sorted{ $0.parkPts < $1.parkPts }
        }else{
            output = teamAverages.sorted{ $0.parkPts > $1.parkPts }
        }
        
    case "autoCapBallPts":
        if(dir == 0){
            output = teamAverages.sorted{ $0.autoCapBallPts < $1.autoCapBallPts }
        }else{
            output = teamAverages.sorted{ $0.autoCapBallPts > $1.autoCapBallPts }
        }
        
    case "autoPts":
        if(dir == 0){
            output = teamAverages.sorted{ $0.autoPts < $1.autoPts }
        }else{
            output = teamAverages.sorted{ $0.autoPts > $1.autoPts }
        }
        
    case "cornerBalls":
        if(dir == 0){
            output = teamAverages.sorted{ $0.cornerBalls < $1.cornerBalls }
        }else{
            output = teamAverages.sorted{ $0.cornerBalls > $1.cornerBalls }
        }
        
    case "vortexBalls":
        if(dir == 0){
            output = teamAverages.sorted{ $0.vortexBalls < $1.vortexBalls }
        }else{
            output = teamAverages.sorted{ $0.vortexBalls > $1.vortexBalls }
        }
        
    case "telePts":
        if(dir == 0){
            output = teamAverages.sorted{ $0.telePts < $1.telePts }
        }else{
            output = teamAverages.sorted{ $0.telePts > $1.telePts }
        }
        
    case "capBallPts":
        if(dir == 0){
            output = teamAverages.sorted{ $0.capBallPts < $1.capBallPts }
        }else{
            output = teamAverages.sorted{ $0.capBallPts > $1.capBallPts }
        }
        
    case "beacons":
        if(dir == 0){
            output = teamAverages.sorted{ $0.beacons < $1.beacons }
        }else{
            output = teamAverages.sorted{ $0.beacons > $1.beacons }
        }
        
    case "endGamePts":
        if(dir == 0){
            output = teamAverages.sorted{ $0.endGamePts < $1.endGamePts }
        }else{
            output = teamAverages.sorted{ $0.endGamePts > $1.endGamePts }
        }
        
    case "opr":
        if(dir == 0){
            output = teamAverages.sorted{ $0.opr < $1.opr }
        }else{
            output = teamAverages.sorted{ $0.opr > $1.opr }
        }
    default:
        //Sort by rank
        if(dir == 0){
            output = teamAverages.sorted{
                if $0.QP != $1.QP{
                    return $0.QP > $1.QP
                }
                else{
                    return $0.RP > $1.RP
                }
            }
        }
        else{
            output = teamAverages.sorted{ $0.QP > $1.QP }
        }
    }
    
    //Return sorted averages array
    return output
}


func compareTeams(num1: Int, num2: Int) -> (team1Averages: teamAverage, team2Averages: teamAverage, compare: [Int])
{
    var team1Averages = getAverages(num: num1).averages
    var team2Averages = getAverages(num: num2).averages
    var compare = [Int]()                           // 0=team1 greater  1=team2 greater     2=equal or close
    if(abs(team1Averages.allianceScore - team2Averages.allianceScore) <= 10){
        compare[0] = 2
    }
    else{
        if(team1Averages.allianceScore < team2Averages.allianceScore){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.autoBeacons - team2Averages.autoBeacons) <= 0.2){
        compare[0] = 2
    }
    else{
        if(team1Averages.autoBeacons < team2Averages.autoBeacons){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.autoCapBallPts - team2Averages.autoCapBallPts) <= 5){
        compare[0] = 2
    }
    else{
        if(team1Averages.autoCapBallPts < team2Averages.autoCapBallPts){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.autoCorner - team2Averages.autoCorner) <= 0.5){
        compare[0] = 2
    }
    else{
        if(team1Averages.autoCorner < team2Averages.autoCorner){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.autoPts - team2Averages.autoPts) <= 5){
        compare[0] = 2
    }
    else{
        if(team1Averages.autoPts < team2Averages.autoPts){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.autoVortex - team2Averages.autoVortex) <= 0.5){
        compare[0] = 2
    }
    else{
        if(team1Averages.autoVortex < team2Averages.autoVortex){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.beacons - team2Averages.beacons) <= 0.5){
        compare[0] = 2
    }
    else{
        if(team1Averages.beacons < team2Averages.beacons){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.capBallPts - team2Averages.capBallPts) <= 5){
        compare[0] = 2
    }
    else{
        if(team1Averages.capBallPts < team2Averages.capBallPts){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.cornerBalls - team2Averages.cornerBalls) <= 1){
        compare[0] = 2
    }
    else{
        if(team1Averages.cornerBalls < team2Averages.cornerBalls){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.endGamePts - team2Averages.endGamePts) <= 5){
        compare[0] = 2
    }
    else{
        if(team1Averages.endGamePts < team2Averages.endGamePts){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.opr - team2Averages.opr) <= 3){
        compare[0] = 2
    }
    else{
        if(team1Averages.opr < team2Averages.opr){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.parkPts - team2Averages.parkPts) <= 2){
        compare[0] = 2
    }
    else{
        if(team1Averages.parkPts < team2Averages.parkPts){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.telePts - team2Averages.telePts) <= 5){
        compare[0] = 2
    }
    else{
        if(team1Averages.telePts < team2Averages.telePts){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    if(abs(team1Averages.vortexBalls - team2Averages.vortexBalls) <= 1){
        compare[0] = 2
    }
    else{
        if(team1Averages.vortexBalls < team2Averages.vortexBalls){
            compare[0] = 1
        }
        else{
            compare[0] = 0
        }
    }
    
    
    return (team1Averages, team2Averages, compare)
}


func getAverages(num: Int) -> (wins: Int, losses: Int, ties: Int, averages: teamAverage){
    var output = teamAverage()
    var extra: (w: Int, l: Int, t: Int) = (0, 0, 0)
    var matchAmount = 0.0
    
    for match in matchData{
        for team in match{
            if team.number == num{
                matchAmount += 1
                
                output.autoCorner += Double(team.autoCorner)
                output.autoVortex += Double(team.autoVortex)
                if(!team.autoCapBallDNA){
                    output.autoCapBallPts += Double(team.autoCapBallPts)
                }
                if(!team.autoBeaconsDNA){
                    output.autoBeacons += Double(team.autoBeacons)
                }
                output.parkPts += Double(team.parkPts)
                output.autoPts += Double(team.autoPts)
                output.cornerBalls += Double(team.cornerBalls)
                output.vortexBalls += Double(team.vortexBalls)
                output.telePts += Double(team.telePts)
                if(!team.capBallDNA){
                    output.capBallPts += Double(team.capBallPts)
                }
                output.beacons += Double(team.beacons)
                output.endGamePts += Double(team.endGamePts)
                output.allianceScore += Double(team.allianceScore)
                output.opr += Double(team.calculatedScore)
                
                //Outcome
                switch(team.outcome){
                case 0:
                    extra.w += 1
                    output.QP += 2
                case 1:
                    extra.l += 1
                case 2:
                    extra.t += 1
                    output.QP += 1
                default:
                    print("Error in data process: Outcome is not desired")
                }
            }
        }
    }
    
    //Calculate RP
    for x in 0..<matchData.count{
        for i in 0..<4{
            if matchData[x][i].number == num {
                if (i == 0)||(i == 1){
                    if matchData[x][i].outcome == 0 {
                        output.RP += matchData[x][2].calculatedScore
                    }
                    else{
                        output.RP += matchData[x][0].calculatedScore
                    }
                }
                else{
                    if matchData[x][i].outcome == 0 {
                        output.RP += matchData[x][0].calculatedScore
                    }
                    else{
                        output.RP += matchData[x][2].calculatedScore
                    }
                }

            }
        }
    }
    
    output.number = num
    output.autoCorner /= matchAmount
    output.autoVortex /= matchAmount
    output.autoBeacons /= matchAmount
    output.parkPts /= matchAmount
    output.autoPts /= matchAmount
    output.cornerBalls /= matchAmount
    output.vortexBalls /= matchAmount
    output.telePts /= matchAmount
    output.capBallPts /= matchAmount
    output.beacons /= matchAmount
    output.endGamePts /= matchAmount
    output.allianceScore /= matchAmount
    output.opr /= matchAmount
    
    return (extra.w, extra.l, extra.t, output)
}


