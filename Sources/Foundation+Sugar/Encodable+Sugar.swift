//
//  Created by Dmitriy Verennik on 30.03.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

public extension Encodable {
    func encode() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self),
              let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        return jsonData
    }

    func encodeArray() -> [[String: Any]]? {
        guard let data = try? JSONEncoder().encode(self),
              let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
            return nil
        }
        return jsonData
    }

    func dataToEncode() -> Data? {
        try? JSONEncoder().encode(self)
    }
}
