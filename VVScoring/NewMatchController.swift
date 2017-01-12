//
//  NewMatchController.swift
//  VVScoring
//
//  Created by WAGNER, STEVEN on 1/9/17.
//  Copyright © 2017 Q Is Silqent. All rights reserved.
//

import UIKit

class NewMatchController: UIViewController {

    
    let variable = MatchesController()

    @IBAction func Q(_ sender: AnyObject) {
        countMatches()
        matchData.append([teamInMatch(), teamInMatch(), teamInMatch(), teamInMatch()])
        matchData[matchData.count - 1][0].match = Q + 1
        matchData[matchData.count - 1][1].match = Q + 1
        matchData[matchData.count - 1][2].match = Q + 1
        matchData[matchData.count - 1][3].match = Q + 1
        variable.reloadMatchTable()
    }
    
    @IBAction func SF1(_ sender: AnyObject) {
        countMatches()
        matchData.append([teamInMatch(), teamInMatch(), teamInMatch(), teamInMatch()])
        matchData[matchData.count - 1][0].match = SF1 + 1010
        matchData[matchData.count - 1][1].match = SF1 + 1010
        matchData[matchData.count - 1][2].match = SF1 + 1010
        matchData[matchData.count - 1][3].match = SF1 + 1010
        variable.reloadMatchTable()
    }
    
    @IBAction func SF2(_ sender: AnyObject) {
        countMatches()
        matchData.append([teamInMatch(), teamInMatch(), teamInMatch(), teamInMatch()])
        matchData[matchData.count - 1][0].match = SF2 + 1020
        matchData[matchData.count - 1][1].match = SF2 + 1020
        matchData[matchData.count - 1][2].match = SF2 + 1020
        matchData[matchData.count - 1][3].match = SF2 + 1020
        variable.reloadMatchTable()
    }

    
    @IBAction func F(_ sender: AnyObject) {
        countMatches()
        matchData.append([teamInMatch(), teamInMatch(), teamInMatch(), teamInMatch()])
        matchData[matchData.count - 1][0].match = F + 10001
        matchData[matchData.count - 1][1].match = F + 10001
        matchData[matchData.count - 1][2].match = F + 10001
        matchData[matchData.count - 1][3].match = F + 10001
        variable.reloadMatchTable()
    }
    
    @IBAction func C(_ sender: AnyObject) {
        countMatches()
        matchData.append([teamInMatch(), teamInMatch(), teamInMatch(), teamInMatch()])
        matchData[matchData.count - 1][0].match = C + 100001
        matchData[matchData.count - 1][1].match = C + 100001
        matchData[matchData.count - 1][2].match = C + 100001
        matchData[matchData.count - 1][3].match = C + 100001
        variable.reloadMatchTable()
    }

    var Q = 0
    var SF1 = 0
    var SF2 = 0
    var F = 0
    var C = 0
    
    
    func countMatches(){
        for match in matchData{
            if(match[0].match < 1010){
                Q += 1
            }
            else if((match[0].match <= 1019) && (match[0].match >= 1010)){
                SF1 += 1
            }
            else if((match[0].match <= 1029) && (match[0].match >= 1020)){
                SF2 += 1
            }
            else if((match[0].match < 100000) && (match[0].match >= 10000)){
                SF2 += 1
            }
            else if(match[0].match >= 100000){
                SF2 += 1
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
