//
//  FileUtility.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 12/9/16.
//  Copyright © 2016 Q Is Silqent. All rights reserved.
//

import Foundation

func truncateFile(fileName: String){
    let path = Bundle.main.path(forResource: fileName, ofType: "txt")!
    let file: FileHandle? = FileHandle(forWritingAtPath: path)
    
    if file != nil {
        
        // Write it to the file
        file?.truncateFile(atOffset: 1102)
        
        // Close the file
        file?.closeFile()
    }
    else {
        print("Ooops! Something went wrong! (Tournaments)")
    }
}

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
    truncateFile(fileName: "data")
    writeMatchDataToFile(fileName: "data", value: matchDataInString)
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

func writeMatchDataToFile(fileName: String, value: String){
    let path = Bundle.main.path(forResource: fileName, ofType: "txt")!
    let file: FileHandle? = FileHandle(forWritingAtPath: path)
    
    print(path)
    
    if file != nil {
        // Set the data we want to write
        let data = (value as NSString).data(using: String.Encoding.utf8.rawValue)
        
        // Write it to the file
        file?.seekToEndOfFile()
        file?.write(data!)
        
        // Close the file
        file?.closeFile()
    }
    else {
        print("Ooops! Something went wrong!")
    }
}

//TOURNAMENT CONTROL
func readTournamentList() -> Bool{
    let path = Bundle.main.path(forResource: "tournaments", ofType: "txt")
    let fm = FileManager.default
    
    if fm.fileExists(atPath: path!){
        do{
            let fullText = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            let lines = fullText.components(separatedBy: "\n") as [String]
            var index = 0
            for i in 1..<lines.count{
                let data = lines[i].components(separatedBy: ",")
                tournamentList[index].name = data[0]
                tournamentList[index].type = Int(data[1])!
                tournamentList[index].date = data[2]
                tournamentList[index].fileLocation = data[3]
                index += 1
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

func formatTournamentsToCSV() -> String{
    var out: String = ""
    
    for i in 0..<tournamentList.count{
        out += (tournamentList[i].name + ",")
        out += (String(tournamentList[i].type) + ",")
        out += (tournamentList[i].date + ",")
        out += (tournamentList[i].fileLocation)
        if i != tournamentList.count - 1{
            out += "\n"
        }
    }
    return out
}

func addTournament(Tname: String, Ttype: Int, Tdate: String, TfileName: String){
    //Add a new index to tournament list
    tournamentList.append(tournament())
    let index = tournamentList.count - 1
    
    //Add inputed data into new tournament index
    tournamentList[index].name = Tname
    tournamentList[index].type = Ttype
    tournamentList[index].date = Tdate
    tournamentList[index].fileLocation = TfileName
    
    //Save tournament array to list file
    truncateFile(fileName: "tournaments")
    writeToTournamentList(value: formatTournamentsToCSV())
}

//Removes tournament from list by name
func removeTournament(name: String){
    for t in 0..<tournamentList.count{
        if tournamentList[t].name == name{
            tournamentList.remove(at: t)
        }
    }
    writeToTournamentList(value: formatTournamentsToCSV())
}

//Removes tournament from list by file name
func removeTournament(fileName: String){
    for t in 0..<tournamentList.count{
        if tournamentList[t].fileLocation == fileName{
            tournamentList.remove(at: t)
        }
    }
    writeToTournamentList(value: formatTournamentsToCSV())
}

func writeToTournamentList(value: String){
    let path = Bundle.main.path(forResource: "tournaments", ofType: "txt")!
    let file: FileHandle? = FileHandle(forWritingAtPath: path)
    
    print(path)
    
    if file != nil {
        // Set the data we want to write
        let data = (value as NSString).data(using: String.Encoding.utf8.rawValue)
        
        // Write it to the file
        file?.seekToEndOfFile()
        file?.write(data!)
        
        // Close the file
        file?.closeFile()
    }
    else {
        print("Ooops! Something went wrong! (Tournaments)")
    }
}

/*
 *  MAXIMUM EFFICIENCY
 */
extension String
{
    func substring(_ start: Int, end: Int) -> String
    {
        
        
        let endVal = self.characters.index(self.startIndex, offsetBy: end + 1)
        let startVal = self.characters.index(self.startIndex, offsetBy: start, limitedBy: endVal)
        return self.substring(with: (startVal! ..< endVal))
        
        //return self.substringWithRange(Range<String.Index>(start: self.startIndex.advancedBy(start), end: self.startIndex.advancedBy(end + 1)))
    }
    func indexOf(_ string: String) -> String.Index? {
        return range(of: string, options: .literal, range: nil, locale: nil)?.lowerBound
    }
}
