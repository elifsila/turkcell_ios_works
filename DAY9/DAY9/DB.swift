//
//  DB.swift
//  DAY9
//
//  Created by Elif Sıla Okutucu on 10.02.2021.
//

import Foundation
import SQLite

//Bu yapıyı ayrıca Structs diye bir klasör kurup da yapabilirdik.
struct UserSt {
    var id:Int64 = 0
    var name:String = ""
    var email:String = ""
    
    
}

class DB {
    //initilize db nesnesi için;
    var db:Connection! //1.nesne
    var tableUser = Table("user") //2.duruş, bunun içinde bulunacak sütunlar için; (struct türü)
    
    let id = Expression<Int64>("id")
    let name = Expression<String?>("name")
    let email = Expression<String>("email")
    
    //db nesnesi initilize olmalı; (kullanıcı programı kullanabilsin diye)
    //artık ihtiyacımız bir dinamik path yolu belirlemektir. (path dizi oldu burda)
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    //path içinde 0 getirdi -> 0. üyesi dizinin
    
    //connection nesnesini initilize et
    func fncConnection() {
        
        let dbPath = path + "/db.sqlite3"
        print("Full Path : \(dbPath)")
        db = try! Connection(dbPath)
        
        //try ın karşısına hata olma olasılığı olan yeri yazarız
        //statement a da hatanın olduğunu,gerçek nedenlerini söyleriz.
        do {
            try db.scalar(tableUser.exists)
        } catch  {
            
            try! db.run(tableUser.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(email, unique: true)
            }) //bir sefer tablo üretilince tekrar yaratmıcaz.
            
        }

    }
    
    //datanın kaydolup kaydolmadığını anlayacağız.
    //name ve email i dışarıdan alan bir method sağlayacağız.
    //return de tamsayı dönmeli (Int64 kısmı (intereger ın max. sırası kadar yer açar))
    func userInsert(name: String, email: String) -> Int64 {
        
        do {
            let insert = tableUser.insert( self.name <- name, self.email <- email)
            return try db.run(insert)
        } catch  {
            return -1 //aynı mail tekrar dönünce -1 verdi -> kayıt kısmı için kullanılabilir!
        }
        
    }
    
    func userList() -> [UserSt] {
        var arr:[UserSt] = []
        let users = try! db.prepare(tableUser)
        //şimdi bunu içindeki elemanlarla birlikte tüketmemiz gerekiyor.
        //for döngüsü ile dataların başarılı bir şekilde gelip gelmediğini görelim;
        for item in users {
            let us = UserSt(id: item[id], name: item[name]!, email: item[email])
            arr.append(us)
        }
        return arr
    }
    
    // DELETE user
    func userDelete( uid:Int64 ) -> Int {
        let alice = tableUser.filter( id == uid )
        return try! db.run(alice.delete()) //silmey asıl tetikleyen unsurlardan.
        // Artık bu fonksiyonu tetikleyebiliriz. (userTable a dön, source'dan silme yap.)
    }
    
    
}
