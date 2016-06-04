//
//  PaiLie.h
//  PaiLie
//
//  Created by Gary on 14-7-20.
//  Copyright (c) 2014年 Gary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaiLie : NSObject
- (void)runPermutation:(NSMutableArray*)aArrary n:(NSInteger)n;
+(NSArray<NSArray*>*)getPaiLieArrayWithArray:(NSArray*)array withCount:(NSInteger)n;
@end
