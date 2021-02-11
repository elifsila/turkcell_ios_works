//
//  DB.swift
//  HW4
//
//  Created by Elif Sıla Okutucu on 10.02.2021.
//

import Foundation
import SQLite

//Bu yapıyı ayrıca Structs diye bir klasör kurup da yapabilirdik.
struct ProductSt {
    var id:Int64 = 0
    var product:String = ""
    var number:String = ""
    
    
}

class DB {
    //initilize db nesnesi için;
    var db:Connection! //1.nesne
    var tableProduct = Table("product") //2.duruş, bunun içinde bulunacak sütunlar için; (struct türü)
    
    let id = Expression<Int64>("id")
    let product = Expression<String?>("product")
    let number = Expression<String>("number")
    
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
            try db.scalar(tableProduct.exists)
        } catch  {
            
            try! db.run(tableProduct.create { t in
                t.column(id, primaryKey: true)
                t.column(product)
                t.column(number)
            }) //bir sefer tablo üretilince tekrar yaratmıcaz.
            
        }

    }
    
    //datanın kaydolup kaydolmadığını anlayacağız.
    //name ve email i dışarıdan alan bir method sağlayacağız.
    //return de tamsayı dönmeli (Int64 kısmı (intereger ın max. sırası kadar yer açar))
    func productInsert(product: String, number: String) -> Int64 {
        
        do {
            let insert = tableProduct.insert( self.product <- product, self.number <- number)
            return try db.run(insert)
        } catch  {
            return -1 //aynı ürün tekrar dönünce -1 verdi -> kayıt kısmı için kullanılabilir!
        }
        
    }
    
    func productList() -> [ProductSt] {
        var arr:[ProductSt] = []
        let products = try! db.prepare(tableProduct)
        //şimdi bunu içindeki elemanlarla birlikte tüketmemiz gerekiyor.
        //for döngüsü ile dataların başarılı bir şekilde gelip gelmediğini görelim;
        for item in products {
            let us = ProductSt(id: item[id], product: item[product]!, number: item[number])
            arr.append(us)
        }
        return arr
    }
    
    // DELETE user
    func productDelete( uid:Int64 ) -> Int {
        let alice = tableProduct.filter( id == uid )
        return try! db.run(alice.delete()) //silmey asıl tetikleyen unsurlardan.
        // Artık bu fonksiyonu tetikleyebiliriz. (userTable a dön, source'dan silme yap.)
    }
    
    
}

