//
//  Created by Artem Sokurenko on 19/09/2019
//  Copyright © 2019 Ronas IT. All rights reserved.
//

import QuartzCore

public extension CATransform3D {
    var affine: CGAffineTransform {
        return CGAffineTransform(a: m11, b: m12, c: m21, d: m22, tx: m41, ty: m42)
    }
}
