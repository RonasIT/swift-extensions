//
//  Created by Anton Dityativ on 06.04.2022
//  Copyright © 2022 Ronas IT. All rights reserved.
//

import Foundation

public extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return !self.isEmpty && emailPred.evaluate(with: self)
    }
}
