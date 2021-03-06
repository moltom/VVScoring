//
//  Utility.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 12/23/16.
//  Copyright © 2016 Q Is Silqent. All rights reserved.
//

import Foundation
import UIKit

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
    }
    func indexOf(_ string: String) -> String.Index? {
        return range(of: string, options: .literal, range: nil, locale: nil)?.lowerBound
    }
}

func getRecord(num: Int) -> String {
    let data = getAverages(num: num)
    return "\(data.W)-\(data.L)-\(data.T)"
}

func convertColorValues(withRGB red: Int, _ green: Int, _ blue: Int) -> (red: CGFloat, green: CGFloat, blue: CGFloat){
    
    let newRed = CGFloat(red) / 255.0
    let newGreen = CGFloat(green) / 255.0
    let newBlue = CGFloat(blue) / 255.0
    
    return (newRed, newGreen, newBlue)
}

func findNumber(_ index: Int) -> String{
    var counter = 0
    for (name, _) in teamList{
        if counter == index{
            return name
        }
        counter += 1
    }
    return ""
}

func rmvChars(from text: String) -> String{
    let output = text.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
    let newString = output.joined(separator: "")
    return (newString.characters.count == 0) ? "0" : newString
}

func absn(_ num: Int) -> Int{
    if(num >= 0){
        return num
    }
    else{
        return -num
    }
}

func Round(_ num: Double, to decimal: Double) -> Double{
    return (Double (round(decimal * num) / decimal))
}

func Round(_ num: Double) -> Double{
    return (Double (round(10 * num) / 10))
}

func filledSelections() -> Bool{
    for i in 0..<selected.count{
        if selected[i] == -1{
            return false
        }
    }
    return true
}
