import Foundation

extension String {
    // Source: https://betterprogramming.pub/5-swift-extensions-to-generate-randoms-87401ccc60f
    func random(of length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
