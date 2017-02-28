//
//  CompareController.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 2/22/17.
//  Copyright © 2017 Q Is Silqent. All rights reserved.
//

import UIKit

class CompareController: UIViewController {

    //MARK: Properties
    
    //Top bar
    @IBOutlet weak var t1Name: UIButton!
    @IBOutlet weak var t1Number: UIButton!
    @IBOutlet weak var t2Name: UIButton!
    @IBOutlet weak var t2Number: UIButton!
    
    
    //SIDE 1
    @IBOutlet weak var OPR: UILabel!
    @IBOutlet weak var alliance: UILabel!
    
    //Auto
    @IBOutlet weak var autoBeacons: UILabel!
    @IBOutlet weak var autoVortex: UILabel!
    @IBOutlet weak var autoCorner: UILabel!
    @IBOutlet weak var autoParkPts: UILabel!
    @IBOutlet weak var autoCapBall: UILabel!
    @IBOutlet weak var totalAuto: UILabel!
    
    //Tele
    @IBOutlet weak var vortex: UILabel!
    @IBOutlet weak var corner: UILabel!
    @IBOutlet weak var teleTotal: UILabel!
    
    //End
    @IBOutlet weak var beacons: UILabel!
    @IBOutlet weak var beaconsControl: UILabel!
    @IBOutlet weak var capBallPts: UILabel!
    @IBOutlet weak var totalEnd: UILabel!
    
    
    //SIDE 2
    @IBOutlet weak var OOPR: UILabel!
    @IBOutlet weak var Oalliance: UILabel!
    
    //Auto
    @IBOutlet weak var OautoBeacons: UILabel!
    @IBOutlet weak var OautoVortex: UILabel!
    @IBOutlet weak var OautoCorner: UILabel!
    @IBOutlet weak var OautoParkPts: UILabel!
    @IBOutlet weak var OautoCapBall: UILabel!
    @IBOutlet weak var OtotalAuto: UILabel!
    
    //Tele
    @IBOutlet weak var Ovortex: UILabel!
    @IBOutlet weak var Ocorner: UILabel!
    @IBOutlet weak var OteleTotal: UILabel!
    
    //End
    @IBOutlet weak var Obeacons: UILabel!
    @IBOutlet weak var ObeaconsControl: UILabel!
    @IBOutlet weak var OcapBallPts: UILabel!
    @IBOutlet weak var OtotalEnd: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if filledSelections(){
            let calcComp = compareTeams(num1: selected[0], num2: selected[1])
            setLabels(calcComp.team1Averages, calcComp.team2Averages, calcComp.compare)
        }
    }
    
    @IBAction func team1Transfer(_ sender: AnyObject) {
        selectedTeam = selected[0]
        let vc = (storyboard?.instantiateViewController(withIdentifier: "singleView"))!
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func team2Transfer(_ sender: AnyObject) {
        selectedTeam = selected[1]
        let vc = (storyboard?.instantiateViewController(withIdentifier: "singleView"))!
        present(vc, animated: true, completion: nil)
    }
    
    func setLabels(_ t1: teamAverage, _ t2: teamAverage, _ comp: [Int]){
        
        t1Name.setTitle(teamList["\(selected[0])"]?.name, for: .normal)
        t1Number.setTitle(String(selected[0]), for: .normal)
        
        t2Name.setTitle(teamList["\(selected[1])"]?.name, for: .normal)
        t2Number.setTitle(String(selected[1]), for: .normal)
        
        //------------Team 1------------
        OPR.text = String (t1.opr)
        alliance.text = String (Round(t1.allianceScore))
        
        autoBeacons.text = String (Round(t1.autoBeacons))
        autoVortex.text = String (Round(t1.autoVortex))
        autoCorner.text = String (Round(t1.autoCorner))
            autoParkPts.text = String (Round(t1.parkPts))
        autoCapBall.text = String (Round(t1.autoCapBallPts))
        totalAuto.text = String (Round(t1.autoPts))
        
        vortex.text = String (Round(t1.vortexBalls))
        corner.text = String (Round(t1.cornerBalls))
        teleTotal.text = String (Round(t1.telePts))
        
        beacons.text = String (Round(t1.beacons))
        beaconsControl.text = String (Round(t1.totalBeacons))
        capBallPts.text = String (Round(t1.capBallPts))
        totalEnd.text = String (Round(t1.endGamePts))
        
        //------------Team 2------------
        OOPR.text = String (t2.opr)
        Oalliance.text = String (Round(t2.allianceScore))
        
        OautoBeacons.text = String (Round(t2.autoBeacons))
        OautoVortex.text = String (Round(t2.autoVortex))
        OautoCorner.text = String (Round(t2.autoCorner))
        OautoParkPts.text = String (Round(t2.parkPts))
        OautoCapBall.text = String (Round(t2.autoCapBallPts))
        OtotalAuto.text = String (Round(t2.autoPts))
        
        Ovortex.text = String (Round(t2.vortexBalls))
        Ocorner.text = String (Round(t2.cornerBalls))
        OteleTotal.text = String (Round(t2.telePts))
        
        Obeacons.text = String (Round(t2.beacons))
        ObeaconsControl.text = String (Round(t2.totalBeacons))
        OcapBallPts.text = String (Round(t2.capBallPts))
        OtotalEnd.text = String (Round(t2.endGamePts))
        //------------------------------
        
        
        if(comp[])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
