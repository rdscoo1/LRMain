//
//  DataSource.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import Foundation

class DataSource {
    static func getBestPriceProducts() -> [Product] {
        return [
            .init(name: "Обои флизелиновые", price: 1068.0, image: .oboiFliz),
            .init(name: "Кашпо Idea Дюна", price: 658.0, image: .kashpoIdea),
            .init(name: "Средство для мытья стекол", price: 116.0, image: .mitieStekol),
            .init(name: "Обои флизелиновые", price: 1068.0, image: .oboiFliz),
            .init(name: "Кашпо Idea Дюна", price: 658.0, image: .kashpoIdea),
            .init(name: "Средство для мытья стекол", price: 116.0, image: .mitieStekol),
            .init(name: "Обои флизелиновые", price: 1068.0, image: .oboiFliz),
            .init(name: "Кашпо Idea Дюна", price: 658.0, image: .kashpoIdea),
            .init(name: "Средство для мытья стекол", price: 116.0, image: .mitieStekol)
        ]
    }
    
    static func getLimitedOfferProducts() -> [Product] {
        return [
            .init(name: "Керамогранит Euroceramika", price: 170.35, image: .keramogranit),
            .init(name: "Штукатурка гипсовая", price: 413.0, image: .shtukaturka),
            .init(name: "Грунтовка", price: 722.0, image: .gruntovka),
            .init(name: "Керамогранит Euroceramika", price: 170.35, image: .keramogranit),
            .init(name: "Штукатурка гипсовая", price: 413.0, image: .shtukaturka),
            .init(name: "Грунтовка", price: 722.0, image: .gruntovka),
            .init(name: "Керамогранит Euroceramika", price: 170.35, image: .keramogranit),
            .init(name: "Штукатурка гипсовая", price: 413.0, image: .shtukaturka),
            .init(name: "Грунтовка", price: 722.0, image: .gruntovka)
        ]
    }
    
    static func getCategories() -> [Category] {
        return [
            .init(title: "Сад", image: .sad),
            .init(title: "Освещение", image: .osveshchenie),
            .init(title: "Декор", image: .dekor),
            .init(title: "Стройматериалы", image: .stroymaterialy),
            .init(title: "Инструменты", image: .instrumenty)
        ]
    }
}
