//
//  Cat.swift
//  DemoRealm
//
//  Created by Fahim Rahman on 23/5/21.
//

import Foundation
import RealmSwift

class LivingThing: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    @objc dynamic var gender: String = ""
}

class Cat: Object {
    @objc dynamic var details:LivingThing? = LivingThing()
}

class Dog: Object {
    @objc dynamic var details:LivingThing? = LivingThing()
}
