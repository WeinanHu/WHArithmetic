//
//  ViewController.m
//  WHArithmetic
//
//  Created by Wayne on 16/5/11.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "ViewController.h"
#import "WHDoArithmetic.h"
#import "PaiLie.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[WHDoArithmetic alloc]arithmetic];
    [[WHDoArithmetic alloc]arithmetic];
//    double ari[4]={1,3,2,6};
//    [[WHDoArithmetic alloc]arithmeticWithFourDouble:ari];
//    NSMutableArray *array = [NSMutableArray array];
//    for (int i = 0; i<4; i++) {
//        [array addObject:[NSNumber numberWithDouble:ari[i]]];
//    }
//    NSArray *arrs = [PaiLie getPaiLieArrayWithArray:array withCount:4];
//    NSMutableArray *noRepeatArr = [NSMutableArray array];
//    [noRepeatArr addObject:arrs[0]];
//    for (NSArray *arr in arrs) {
//        for (NSArray *noR in noRepeatArr) {
//            if ([arr[0] isEqualToNumber:noR[0]] && [arr[1] isEqualToNumber:noR[1]] && [arr[2] isEqualToNumber:noR[2]] && [arr[3] isEqualToNumber:noR[3]]) {
//                
//            }else{
//                [noRepeatArr addObject:arr];
//            }
//        }
//        
//    }
//    
//    for (NSArray *ar in noRepeatArr) {
//        double arrari[4];
//        for (int i = 0; i<4; i++) {
//            arrari[i] = [ar[i] doubleValue];;
//        }
//        [[WHDoArithmetic alloc]arithmeticWithFourDouble:ari];
//    }
//    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
