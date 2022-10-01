//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ios Developer on 1.10.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    
    var mySimpsons = [Simpson]()
    
    var secilecekSimpson : Simpson?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        // simpson object
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "nuclear safety", simpsonImage: UIImage(named: "homer")!)
        
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "housewife", simpsonImage: UIImage(named: "marge")!)
        
        let bart = Simpson(simpsonName: "bart Simpson", simpsonJob: "student", simpsonImage: UIImage(named: "bart")!)
        
        let lisa = Simpson(simpsonName: "lisa Simpson", simpsonJob: "student", simpsonImage: UIImage(named: "lisa")!)
        
        let maggie = Simpson(simpsonName: "maggie Simpson", simpsonJob: "baby", simpsonImage: UIImage(named: "maggie")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var concert = cell.defaultContentConfiguration()
        concert.text = mySimpsons[indexPath.row].name //.name ekleme sebebimiz mysimpson bir obje ama bize string hatası veriyor
        
        cell.contentConfiguration = concert
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilecekSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.secilenSimpson = secilecekSimpson
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            mySimpsons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}

