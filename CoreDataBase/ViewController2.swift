//
//  ViewController2.swift
//  CoreDataBase
//
//  Created by Bhautik Rajodiya on 20/03/23.
//

import UIKit
import CoreData

class ViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    

    @IBOutlet weak var tb: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        return cell
    }

}
