//
//  ViewController.swift
//  fmdbDatabase
//
//  Created by R82 on 04/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var t3: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        fmdbHelper.createFile()
    }

    @IBAction func saveAction(_ sender: Any) {
        if let x = t1.text,let y = Int(x),let a = t3.text,let b = Int(a){
            fmdbHelper.addData(name: t2.text ?? "", id: y ,no: b)
        }
    }
    @IBAction func deleteAction(_ sender: Any) {
        if let x = t1.text,let y = Int(x),let a = t3.text,let b = Int(a){
            fmdbHelper.deleteData(name: t2.text ?? "", id: y ,no: b)
    }
}

}
