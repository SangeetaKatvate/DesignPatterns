//
//  PizzaFactory.swift
//  FactoryPattern
//
//  Created by Sangeeta on 12/12/24.
//



//Step 1: Define a protocol for Pizza
protocol Pizza {
    func prepare() -> String
}

//Step 2: Create different types of Pizza (Concrete implementation)
class Margerita: Pizza {
    func prepare() -> String {
        return "preparing Margerita Pizza"
    }
}

class Veggie: Pizza {
    func prepare() -> String {
        return "preparing Veggie Pizza"
    }
}

class Cheese: Pizza {
    func prepare() -> String {
        return "preparing Cheese Pizza"
    }
}

//Step 3: Create Factory to make Pizza

enum PizzaType: String, CaseIterable{
    case Margerita = "Margerita"
    case Veggies = "Veggies"
    case Cheese = "Cheese"
}

class PizzaFactory {
    static func createPizza(type: PizzaType) -> Pizza? {
        switch type {
        case .Margerita:
            return Margerita()
        case .Veggies:
            return Veggie()
        case .Cheese:
            return Cheese()
        }
    }
}
