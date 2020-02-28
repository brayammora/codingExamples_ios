//
//  ThirdViewController.swift
//  03-codingExamples
//
//  Created by Brayam Alberto Mora Arias on 26/02/20.
//  Copyright © 2020 Brayam Alberto Mora Arias. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var families: [String] = []
    var fonts: [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.families = UIFont.familyNames
        
        families = families.sorted(by: { return $0 < $1})
        
        for fam in families {
            self.fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowFontsForFamily") {
            let navController = segue.destination as! UINavigationController
            let destinationVC = navController.topViewController as! FontDetailViewController
            let idx = self.tableView.indexPathForSelectedRow!.row
            destinationVC.familyName = self.families[idx]
            destinationVC.fonts = self.fonts[self.families[idx]]!
        }
    }
    
    // MARK: - Metodos del protocolo UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.families.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for: indexPath)
        let fontFamily = families[indexPath.row]
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20.0)
        return cell
    }

    // MARK: - Metodos del protocolo UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let fontFamily = families[row]
        let familyFonts = fonts[fontFamily]!
        print(familyFonts)
    }
}
