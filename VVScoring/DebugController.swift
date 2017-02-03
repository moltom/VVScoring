//
//  DebugController.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 2/2/17.
//  Copyright © 2017 Q Is Silqent. All rights reserved.
//

import UIKit

class DebugController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellReuseIdendifier = "FileCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(FileCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            //Deleting files
            removeFile(withName: <#T##String#>)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath as IndexPath) as! FileCell
        
        let documentList = getFileList()
        
        cell.labels["file"]?.Label.text = documentList[indexPath.row]
        
        return cell
    }
}
