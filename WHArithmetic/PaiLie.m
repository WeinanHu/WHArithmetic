//
//  PaiLie.m
//  PaiLie
//
//  Created by Gary on 14-7-20.
//  Copyright (c) 2014年 Gary. All rights reserved.
//

#import "PaiLie.h"
@interface PaiLie()
@property(nonatomic,strong) NSMutableArray* paiLieArray;
@end
@implementation PaiLie

- (void)getCombination:(NSMutableArray*)aArrary n:(NSInteger)n begin:(NSInteger)begin bArrary:(NSMutableArray*)bArrary index:(NSInteger)index
{

    if (n == 0) {
        [self getAllPermutation:bArrary index:0];
        return;
    }
    
    for(NSInteger i = begin; i < aArrary.count; i++){
        
        bArrary[index] = aArrary[i];
        [self getCombination:aArrary n:n-1 begin:i+1 bArrary:bArrary index:index+1];
    }
}
- (void)getAllPermutation:(NSMutableArray*)aArrary index:(NSInteger)index
{
    /*与a的元素个数相同则输出*/
    if(index == aArrary.count - 1){
        NSMutableArray *mutaArr = [NSMutableArray array];
        for(NSInteger i = 0; i < aArrary.count; i++){
            [mutaArr addObject:aArrary[i]];
            NSLog(@"%ld ",[aArrary[i] integerValue]);
        }
        [self.paiLieArray addObject:mutaArr];
        NSLog(@"\n");
        return;
    }
    
    for(NSInteger i = index; i < aArrary.count; i++){
        [self swap:aArrary i:index j:i];
        [self getAllPermutation:aArrary index:index + 1];
        [self swap:aArrary i:index j:i];
    }
}

- (void)swap:(NSMutableArray*)aArrary i:(NSInteger)i j:(NSInteger)j
{
    NSInteger temp = [aArrary[i] integerValue];
    aArrary[i] = aArrary[j];
    [aArrary replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:temp]];
}

- (void)runPermutation:(NSMutableArray*)aArrary n:(NSInteger)n
{
    if(nil == aArrary || aArrary.count == 0 || n <= 0 || n > aArrary.count){
        return;
    }
    
    NSMutableArray *bArrary = [NSMutableArray arrayWithCapacity:n];
    
    [self getCombination:aArrary n:n begin:0 bArrary:bArrary index:0];
}


+(NSArray<NSArray*>*)getPaiLieArrayWithArray:(NSArray*)array withCount:(NSInteger)n{
    
    PaiLie *pailie = [PaiLie new];
    [pailie runPermutation:[array mutableCopy] n:n];
    return pailie.paiLieArray;
}

- (NSMutableArray *)paiLieArray {
	if(_paiLieArray == nil) {
		_paiLieArray = [[NSMutableArray alloc] init];
	}
	return _paiLieArray;
}

@end
