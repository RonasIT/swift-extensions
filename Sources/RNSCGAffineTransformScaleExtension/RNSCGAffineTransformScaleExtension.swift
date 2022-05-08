//
//  Created by Artem Sokurenko on 19/09/2019
//  Copyright © 2019 Ronas IT. All rights reserved.
//

import CoreGraphics

public extension CGAffineTransform {
    var xScale: CGFloat {
        return sqrt(self.a * self.a + self.c * self.c)
    }

    var yScale: CGFloat {
        return sqrt(self.b * self.b + self.d * self.d)
    }
}
