//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A builder for popcorn popups.
@_functionBuilder public struct PopcornBuilder {

    public static func buildBlock() -> PopcornBucket {
        PopcornBucket(
            names: [],
            types: [],
            views: []
        )
    }
    
    public static func buildBlock<P0>(_ p0:P0) -> PopcornBucket where P0:View {
        PopcornBucket(
            names: [n(p0)],
            types: [t(p0)],
            views: [v(p0)]
        )
    }
    
}

extension PopcornBuilder {
    
    public static func buildBlock<P0,P1>(_ p0:P0,_ p1:P1) -> PopcornBucket where P0:View,P1:View {
        PopcornBucket(
            names: [n(p0),n(p1)],
            types: [t(p0),t(p1)],
            views: [v(p0),v(p1)]
        )
    }
    
    public static func buildBlock<P0,P1,P2>(_ p0:P0,_ p1:P1,_ p2:P2) -> PopcornBucket where P0:View,P1:View,P2:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2)],
            types: [t(p0),t(p1),t(p2)],
            views: [v(p0),v(p1),v(p2)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3)],
            types: [t(p0),t(p1),t(p2),t(p3)],
            views: [v(p0),v(p1),v(p2),v(p3)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10,_ p11:P11) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View,P11:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10),n(p11)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10),t(p11)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10),v(p11)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10,_ p11:P11,_ p12:P12) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View,P11:View,P12:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10),n(p11),n(p12)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10),t(p11),t(p12)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10),v(p11),v(p12)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10,_ p11:P11,_ p12:P12,_ p13:P13) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View,P11:View,P12:View,P13:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10),n(p11),n(p12),n(p13)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10),t(p11),t(p12),t(p13)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10),v(p11),v(p12),v(p13)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10,_ p11:P11,_ p12:P12,_ p13:P13,_ p14:P14) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View,P11:View,P12:View,P13:View,P14:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10),n(p11),n(p12),n(p13),n(p14)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10),t(p11),t(p12),t(p13),t(p14)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10),v(p11),v(p12),v(p13),v(p14)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10,_ p11:P11,_ p12:P12,_ p13:P13,_ p14:P14,_ p15:P15) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View,P11:View,P12:View,P13:View,P14:View,P15:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10),n(p11),n(p12),n(p13),n(p14),n(p15)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10),t(p11),t(p12),t(p13),t(p14),t(p15)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10),v(p11),v(p12),v(p13),v(p14),v(p15)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10,_ p11:P11,_ p12:P12,_ p13:P13,_ p14:P14,_ p15:P15,_ p16:P16) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View,P11:View,P12:View,P13:View,P14:View,P15:View,P16:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10),n(p11),n(p12),n(p13),n(p14),n(p15),n(p16)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10),t(p11),t(p12),t(p13),t(p14),t(p15),t(p16)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10),v(p11),v(p12),v(p13),v(p14),v(p15),v(p16)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10,_ p11:P11,_ p12:P12,_ p13:P13,_ p14:P14,_ p15:P15,_ p16:P16,_ p17:P17) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View,P11:View,P12:View,P13:View,P14:View,P15:View,P16:View,P17:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10),n(p11),n(p12),n(p13),n(p14),n(p15),n(p16),n(p17)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10),t(p11),t(p12),t(p13),t(p14),t(p15),t(p16),t(p17)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10),v(p11),v(p12),v(p13),v(p14),v(p15),v(p16),v(p17)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10,_ p11:P11,_ p12:P12,_ p13:P13,_ p14:P14,_ p15:P15,_ p16:P16,_ p17:P17,_ p18:P18) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View,P11:View,P12:View,P13:View,P14:View,P15:View,P16:View,P17:View,P18:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10),n(p11),n(p12),n(p13),n(p14),n(p15),n(p16),n(p17),n(p18)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10),t(p11),t(p12),t(p13),t(p14),t(p15),t(p16),t(p17),t(p18)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10),v(p11),v(p12),v(p13),v(p14),v(p15),v(p16),v(p17),v(p18)]
        )
    }
    
    public static func buildBlock<P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19>(_ p0:P0,_ p1:P1,_ p2:P2,_ p3:P3,_ p4:P4,_ p5:P5,_ p6:P6,_ p7:P7,_ p8:P8,_ p9:P9,_ p10:P10,_ p11:P11,_ p12:P12,_ p13:P13,_ p14:P14,_ p15:P15,_ p16:P16,_ p17:P17,_ p18:P18,_ p19:P19) -> PopcornBucket where P0:View,P1:View,P2:View,P3:View,P4:View,P5:View,P6:View,P7:View,P8:View,P9:View,P10:View,P11:View,P12:View,P13:View,P14:View,P15:View,P16:View,P17:View,P18:View,P19:View {
        PopcornBucket(
            names: [n(p0),n(p1),n(p2),n(p3),n(p4),n(p5),n(p6),n(p7),n(p8),n(p9),n(p10),n(p11),n(p12),n(p13),n(p14),n(p15),n(p16),n(p17),n(p18),n(p19)],
            types: [t(p0),t(p1),t(p2),t(p3),t(p4),t(p5),t(p6),t(p7),t(p8),t(p9),t(p10),t(p11),t(p12),t(p13),t(p14),t(p15),t(p16),t(p17),t(p18),t(p19)],
            views: [v(p0),v(p1),v(p2),v(p3),v(p4),v(p5),v(p6),v(p7),v(p8),v(p9),v(p10),v(p11),v(p12),v(p13),v(p14),v(p15),v(p16),v(p17),v(p18),v(p19)]
        )
    }
    
}

extension PopcornBuilder {
    
    /// Gets the name (in this case, we use the type as the name)
    static func n<T>(_ t: T) -> Any.Type where T:View {
        return type(of: t)
    }
    
    /// Gets the underlying type of the view's body
    static func t<T>(_ t: T) -> Any.Type where T:View {
        return T.Body.self
    }
    
    /// Gets the view and converts to AnyView
    static func v<V>(_ v: V) -> AnyView where V:View{
        return AnyView(v)
    }
    
}
