//
//  DataManager.swift
//  CapselSample
//
//  Created by cmStudent on 2023/02/08.
//

import SwiftUI
import Firebase


class DataManeger: ObservableObject{
    @Published var dogs: [Dog] = []
    @StateObject private var dataManeger = DataManeger()

    
    
    init(){
        fetchDogs()
    }
    
        
    
    func fetchDogs(){
        print("kwjdfbvo")
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments{ snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot{
                for document in snapshot.documents{
                    let data = document.data()
                    let breed = data["breed"] as? String ?? ""
                    let score = data["score"] as? String ?? ""
                    let dog = Dog(breed: breed, score: score)
                    self.dogs.append(dog)

                }
                self.dogs.sort(by: {Int($0.score)! > Int($1.score)!})
            }
        }
    }

    
    func add(dogBreed : String, dogScore : String){
        let db = Firestore.firestore()
        
        let ref = db.collection("Dogs").document()
        
        ref.setData(["breed": dogBreed,"score": dogScore]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
        fetchDogs()
        
    }
   
    
    
}


