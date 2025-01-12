//
//  Drink.swift
//  Lecture17
//
//  Created by LiziChichua on 12.01.25.
//

// MARK: - DrinkResponse
struct DrinkResponse: Decodable {
    let drinks: [Drink]
}

// MARK: - Drink
struct Drink: Decodable {
    let name: String
    let imageUrl: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name       = "strDrink"
        case imageUrl   = "strDrinkThumb"
        case id         = "idDrink"
    }
}
