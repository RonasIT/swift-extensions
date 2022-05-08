//
//  Created by Anton Dityativ on 06.04.2022
//  Copyright © 2022 Ronas IT. All rights reserved.
//

import Foundation

public extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    var hasDigits: Bool {
        let stingRegEx = ".*[0-9]+.*"
        let stingPred = NSPredicate(format:"SELF MATCHES %@", stingRegEx)
        return stingPred.evaluate(with: self)
    }

    var hasLowerCase: Bool {
        let stingRegEx = ".*[a-z]+.*"
        let stingPred = NSPredicate(format:"SELF MATCHES %@", stingRegEx)
        return stingPred.evaluate(with: self)
    }

    var hasUpperCase: Bool {
        let stingRegEx = ".*[A-Z]+.*"
        let stingPred = NSPredicate(format:"SELF MATCHES %@", stingRegEx)
        return stingPred.evaluate(with: self)
    }

    var hasSymbols: Bool {
        let stingRegEx = ".*[ !@#$%^&*()?._-]+.*"
        let stingPred = NSPredicate(format:"SELF MATCHES %@", stingRegEx)
        return stingPred.evaluate(with: self)
    }

    var isValidPassword: Bool {
        hasDigits && hasLowerCase && hasUpperCase && hasSymbols && count >= 6
    }
}
