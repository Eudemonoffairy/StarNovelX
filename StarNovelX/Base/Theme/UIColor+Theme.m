//
//  UIColor+Theme.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/15.
//

#import "UIColor+Theme.h"
#import "UIColor+Extension.h"

@implementation UIColor (Theme)

+(UIColor *)moliRed{
    return [UIColor colorWithHex:@"#ef475d"];
}

+(UIColor *)jingzi{
    return [UIColor colorWithHex:@"#806d9e"];
}

+(UIColor *)yaju{
    return [UIColor colorWithHex:@"#525288"];
}
+(UIColor *)honglan{
    return [UIColor colorWithHex:@"#1ba784"];
}

+(UIColor *)orangeTheme{
    return [UIColor colorWithHex:@"#fca104"];
}

+(UIColor *)bookCellTitle{
    return [UIColor colorWithHex:@"#e2e1e4"];
}

+(UIColor *)bookCellAuthor{
    return [UIColor colorWithHex:@"#a7a8bd"];
}

+(UIColor *)themeColor{
    return [UIColor colorWithHex:@"#c7e1fe"];
}

+(UIColor *)readFontColor{
    return [UIColor colorWithHex:@"#082D52"];
}





+(UIColor *)readBackGroung_1{
    return [UIColor colorWithHex:@"f9e9cd"];
}
+(UIColor *)readBackGroung_2{
    return [UIColor colorWithHex:@"92b3a5"];
}
+(UIColor *)readBackGroung_3{
    return [UIColor colorWithHex:@"e1ece5"];
}
+(UIColor *)readBackGroung_4{
    return [UIColor colorWithHex:@"707771"];
}
+(UIColor *)readBackGroung_5{
    return [UIColor colorWithHex:@"90b1c9"];
}


+(UIColor *)readBackGroundColor:(NSUInteger)colorIdx{
    switch (colorIdx) {
        case 1:
            return [UIColor readBackGroung_1];
            break;
        case 2:
            return [UIColor readBackGroung_2];
            break;
        case 3:
            return [UIColor readBackGroung_3];
            break;
        case 4:
            return [UIColor readBackGroung_4];
            break;
        case 5:
            return [UIColor readBackGroung_5];
            break;
        default:
            return [UIColor whiteColor];
            break;
    }
}


@end
