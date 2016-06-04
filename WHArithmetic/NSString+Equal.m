//
//  NSString+Equal.m
//  WHArithmetic
//
//  Created by Wayne on 16/5/11.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "NSString+Equal.h"

@implementation NSString (Equal)
- (BOOL)isEqual:(id)other
{
    if ([other isEqualToString: self]) {
        return YES;
    }else{
        return NO;
    }
}

- (NSUInteger)hash
{
    return [super hash];
}
@end
