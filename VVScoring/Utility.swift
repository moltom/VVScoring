//
//  Utility.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 12/23/16.
//  Copyright © 2016 Q Is Silqent. All rights reserved.
//

import Foundation

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
