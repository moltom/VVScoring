//
//  FileUtility.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 12/9/16.
//  Copyright © 2016 Q Is Silqent. All rights reserved.
//

import Foundation

func readMatchDataFromFile(file: String) -> Bool{
    let path = Bundle.main.path(forResource: file, ofType: "txt")
    let fm = FileManager.default
    
    if fm.fileExists(atPath: path!){
        do{
            let fullText = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            let lines = fullText.components(separatedBy: "\n") as [String]
            for i in 1..<lines.count{
                let data = lines[i].components(separatedBy: ",")
                var tmp = 0
                for j in 0..<4{
                    //matchData[i][j] = data[j]
                    matchData[i][j].number = Int(data[tmp+0])!
                    matchData[i][j].match = Int(data[tmp+1])!
                    matchData[i][j].autoCorner = Int(data[tmp+2])!
                    matchData[i][j].autoVortex = Int(data[tmp+3])!
                    matchData[i][j].autoBeacons = Int(data[tmp+4])!
                    matchData[i][j].autoBeaconsDNA = Bool(data[tmp+5])!
                    matchData[i][j].parkPts = Int(data[tmp+6])!
                    matchData[i][j].autoCapBallPts = Int(data[tmp+7])!
                    matchData[i][j].autoCapBallDNA = Bool(data[tmp+8])!
                    matchData[i][j].autoPts = Int(data[tmp+9])!
                    matchData[i][j].cornerBalls = Int(data[tmp+10])!
                    matchData[i][j].vortexBalls = Int(data[tmp+11])!
                    matchData[i][j].telePts = Int(data[tmp+12])!
                    matchData[i][j].capBallPts = Int(data[tmp+13])!
                    matchData[i][j].capBallDNA = Bool(data[tmp+14])!
                    matchData[i][j].beacons = Int(data[tmp+15])!
                    matchData[i][j].endGamePts = Int(data[tmp+16])!
                    matchData[i][j].outcome = Int(data[tmp+17])!
                    matchData[i][j].calculatedScore = Int(data[tmp+18])!
                    matchData[i][j].allianceScore = Int(data[tmp+19])!
                    matchData[i][j].officialScore = Int(data[tmp+20])!
                    tmp += 21
                }
            }
            return true
        }catch{
            return false
        }
    }
    else{
        return false
    }
}

func saveMatchData(){
    let matchDataInString = convertMatchDataToCSV()
    writeMatchDataToFile(file: "data", value: matchDataInString)
}

func convertMatchDataToCSV() -> String{
    var output: String = ""
    for i in 0..<matchData.count{
        for j in 0..<4{
            output += String(matchData[i][j].number) + ","
            output += String(matchData[i][j].match) + ","
            output += String(matchData[i][j].autoCorner) + ","
            output += String(matchData[i][j].autoVortex) + ","
            output += String(matchData[i][j].autoBeacons) + ","
            output += String(matchData[i][j].autoBeaconsDNA) + ","
            output += String(matchData[i][j].parkPts) + ","
            output += String(matchData[i][j].autoCapBallPts) + ","
            output += String(matchData[i][j].autoCapBallDNA) + ","
            output += String(matchData[i][j].autoPts) + ","
            output += String(matchData[i][j].cornerBalls) + ","
            output += String(matchData[i][j].vortexBalls) + ","
            output += String(matchData[i][j].telePts) + ","
            output += String(matchData[i][j].capBallPts) + ","
            output += String(matchData[i][j].capBallDNA) + ","
            output += String(matchData[i][j].beacons) + ","
            output += String(matchData[i][j].endGamePts) + ","
            output += String(matchData[i][j].outcome) + ","
            output += String(matchData[i][j].calculatedScore) + ","
            output += String(matchData[i][j].allianceScore) + ","
            output += String(matchData[i][j].officialScore)
            if j != 3{
                output += ","
            }
        }
        if i != matchData.count{
            output += "\n"
        }
    }
    return output
}

func writeMatchDataToFile(file: String, value: String){
    let path = Bundle.main.path(forResource: file, ofType: "txt")!
    print("\n \(path) --> \(value)")
    
    do {
        try value.write(toFile: path, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to create file")
        print("\(error)")
    }
}
