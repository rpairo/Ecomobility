//
//  Auth0Properties.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct Auth0Properties: Decodable {
    // MARK: Properties
    var domain: String?
    var cliendId: String?

    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case domain = "Domain"
        case cliendId = "CientId"
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        domain = try? container?.decode(String.self, forKey: .domain)
        cliendId = try? container?.decode(String.self, forKey: .cliendId)
    }
}
