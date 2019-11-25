

import Foundation

struct User: Decodable  {
    let friends: [Friend]
    let id: String
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
}
