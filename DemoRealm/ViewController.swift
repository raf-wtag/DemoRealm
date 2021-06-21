//
//  ViewController.swift
//  DemoRealm
//
//  Created by Fahim Rahman on 23/5/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if ReachabilityTest.isConnectedToNetwork() {
            print("Internet connection available")
        }
        else{
           print("No internet connection available")
        }
        
        do {
            let realmrefference = try Realm()
            print(Realm.Configuration.defaultConfiguration)
            
            try realmrefference.write {
                realmrefference.delete(realmrefference.objects(Cat.self))
                realmrefference.delete(realmrefference.objects(Dog.self))
                realmrefference.delete(realmrefference.objects(LivingThing.self))
            }
            
            
            let myCat = Cat()
            myCat.details!.name = "Mini Mini"
            myCat.details!.color = "black"
            myCat.details!.gender = "Male"
            
            let myDog = Dog()
            myDog.details!.name = "JBL"
            myDog.details!.color = "Ash"
            myDog.details!.gender = "Male"
            
            do {
                try realmrefference.write {
                    realmrefference.add(myCat)
                    realmrefference.add(myDog)
                }
            } catch {
                print("Error in Writting")
            }
            
        } catch {
            print("Somthing Error Handled!!")
        }
    
        do {
            let realmrefference = try Realm()
            
            let result = realmrefference.objects(Cat.self).count
            print(result)
        } catch {
            print("Error In Reading")
        }
        
        readData()
    }

    func readData() {
        do {
            let realmReference = try Realm()
            
            let data1 = realmReference.objects(Cat.self)
            let data2 = realmReference.objects(Dog.self)
            
            print("--------------------")
            print(data1)
            print(data2)
        } catch {
            print("Error In Reading")
        }
    }

}

