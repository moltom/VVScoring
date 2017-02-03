//
//  SingleTeamViewCell.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 1/31/17.
//  Copyright © 2017 Q Is Silqent. All rights reserved.
//

import UIKit

class SingleTeamViewCell: UITableViewCell {

    var labels: [String: (Label: UILabel, x: Int, y: Int, width: Int, height: Int)] = [
        "number":        (UILabel(),20, 0, 50, 30),
        "autoCorBalls":  (UILabel(),20, 0, 50, 30),
        "autoVorBalls":  (UILabel(),20, 0, 50, 30),
        "autoBeacons":   (UILabel(),20, 0, 50, 30),
        "autoPark":      (UILabel(),20, 0, 50, 30),
        "autoPts":       (UILabel(),20, 0, 50, 30),
        "corBalls":      (UILabel(),20, 0, 50, 30),
        "vorBalls":      (UILabel(),20, 0, 50, 30),
        "telePts":       (UILabel(),20, 0, 50, 30),
        "beaconsHit":    (UILabel(),20, 0, 50, 30),
        "beaconsCntrled":(UILabel(),20, 0, 50, 30),
        "capBall":       (UILabel(),20, 0, 50, 30),
        "totalPts":      (UILabel(),20, 0, 50, 30),
    ]
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Add elements as subview to the contentView
        //self.contentView.addSubview(dataLabel)
        for ( _ , value) in labels{
            self.contentView.addSubview(value.Label)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Set element sizes
        //dataLabel.frame = CGRect(x: 20, y: 0, width: 70, height: 30)
        
        for (_, val) in labels{
            val.Label.frame = CGRect(x: val.x, y: val.y, width: val.width, height: val.height)
        }
    }

}
