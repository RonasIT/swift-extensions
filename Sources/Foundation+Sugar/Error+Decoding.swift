//
//  Created by Александр on 8.09.2019
//  Copyright © 2019 Ronas IT. All rights reserved.
//

import Foundation

public extension Error {
    static func error<T>(from data: Data) throws -> T where T: Decodable {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
