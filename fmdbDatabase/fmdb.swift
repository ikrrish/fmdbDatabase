//
//  fmdb.swift
//  fmdbDatabase
//
//  Created by R82 on 04/04/23.
//

import Foundation

struct Model{
    var id: Int
    var name: String
    var no: Int
}

class fmdbHelper{
    static var file: FMDatabase!
    
    static func createFile(){
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("My FMDB File36.db")
        file = FMDatabase(url: x)
        file.open()
        print(x.path)
        createTable()
    }
    static func createTable(){
        let q = "Create Table if not exists Students (name text,id integer,no integer)"
        try? file.executeUpdate(q, values: nil)
        print("create table")
    }
    static func addData(name:String,id:Int,no:Int){
        let q = "insert into Students values('\(name)',\(id),\(no)"
        try? file.executeUpdate(q, values: [name,id,no])
        print("add data")
    }
    static func getData() -> [Model]{
        var arr = [Model]()
        let q = "select * from Students"
        if let data = try? file.executeQuery(q, values: nil){
            while data.next(){
                let name = data.object(forColumnName: "name")as? String ?? ""
                let id = data.object(forColumnName: "id")as? Int ?? 0
                let no = data.object(forColumnName: "no")as? Int ?? 0
                let obj = Model(id: id, name: name, no: no)
                arr.append(obj)
                
            }
        }
        return arr
        
    }
    static func deleteData(name:String,id:Int,no:Int){
        let q = "DELETE FROM Students WHERE id = \(id)"
        try? file.executeUpdate(q, values: nil)
        print("delete data")
    }
}
