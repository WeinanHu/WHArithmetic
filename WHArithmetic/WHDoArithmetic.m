//
//  WHDoArithmetic.m
//  WHArithmetic
//
//  Created by Wayne on 16/5/11.
//  Copyright © 2016年 WayneHu. All rights reserved.
//
/**
 * 实现输出4个int型数字加减乘除或括号得到任意整数的接口
 */

#import "WHDoArithmetic.h"
#import "NSString+Equal.h"
@interface WHDoArithmetic()
@property(nonatomic,assign) int index;
@property(nonatomic,strong) NSString *str;
@property(nonatomic,assign) double result;
@property(nonatomic,assign) double *ari;
@property(nonatomic,strong) NSMutableArray<NSString*> *strArr;
@property(nonatomic,strong) NSMutableSet<NSString*> *strSet;
@end
typedef enum{
    ADD,
    SUBTRACT,
    MULTIPLY,
    DIVIDE
    
}SIGN;
@implementation WHDoArithmetic

-(NSArray<NSString*> *)arithmeticWith:(int)num {
    [self arithmetic];
    return nil;
}
-(void)arithmetic{
    
    double a[4];
    for (a[0] = 1; a[0]<9.9; a[0]++) {
        for (a[1] = 1; a[1]<9.9; a[1]++) {
            for (a[2] = 1; a[2]<9.9; a[2]++) {
                for (a[3] = 1; a[3]<9.9; a[3]++) {
                    
                    for (int sign1 = 0; sign1<4; sign1++) {
                        for (int sign2 = 0; sign2<4; sign2++) {
                            for (int sign3 = 0; sign3<4; sign3++) {
                                [self arithmeticWithFourInt:a sign1:sign1 sign2:sign2 sign3:sign3];
                            }
                        }
                    }
                    
                }
            }
        }
    }
    printf("set cout:%ld",self.strSet.count);
}
-(void)arithmeticWithFourDouble:(double*)ari{
    for (int sign1 = 0; sign1<4; sign1++) {
        for (int sign2 = 0; sign2<4; sign2++) {
            for (int sign3 = 0; sign3<4; sign3++) {
                [self arithmeticWithFourInt:ari sign1:sign1 sign2:sign2 sign3:sign3];
            }
        }
    }
}
-(void)arithmeticWithFourInt:(double*)ari sign1:(SIGN)sign1 sign2:(SIGN)sign2 sign3:(SIGN)sign3{
    
//    _str = [NSString stringWithFormat:@"%g",ari[0]];
    
    SIGN* sign;
    sign[0] = sign1;
    sign[1] = sign2;
    sign[2] = sign3;
    for (int i = 0; i<4; i++) {
        for (int j = 0; j<3; j++) {
            self.ari =ari;
            self.str = nil;
            self.strArr = [NSMutableArray array];
            for (int k=0; k<4; k++) {
                
                [self.strArr addObject:[NSString stringWithFormat:@"%g",self.ari[k]]];
            }
            
            [self doSign:sign atSignIndex:i signIndexNext:j];
            if (self.result <24.001&&self.result>23.999) {
                if (![self.strSet containsObject:self.str]) {
                    printf("%s = %g\n",[self.str UTF8String],self.result);
                }
                [self.strSet addObject:self.str];
                
//                printf("%s = %g\n",[self.str UTF8String],self.result);
            }
        }
    }
    
    
}
-(void)doSign:(SIGN*)sign atSignIndex:(int)signIndex signIndexNext:(int)signNext{
    
    if (signIndex == 0) {
        [self doSign:sign[0] withNum1Index:0 andNum2Index:1];

        double ariTemp[3] = {self.result,self.ari[2],self.ari[3] };
        self.ari = ariTemp;
        NSArray *strArrTemp = @[self.str,self.strArr[2],self.strArr[3]];
        self.strArr = [strArrTemp mutableCopy];
        if (signNext == 0) {
            [self doSign:sign[1] withNum1Index:0 andNum2Index:1];
            double ariTemp[2] = {self.result,self.ari[2] };
            self.ari = ariTemp;
            NSArray *strArrTemp = @[self.str,self.strArr[2]];
            self.strArr = [strArrTemp mutableCopy];
            [self doSign:sign[2] withNum1Index:0 andNum2Index:1];
        }else{
            [self doSign:sign[2] withNum1Index:1 andNum2Index:2];
            double ariTemp[2] = {self.ari[0],self.result };
            self.ari = ariTemp;
            NSArray *strArrTemp = @[self.strArr[0],self.str];
            self.strArr = [strArrTemp mutableCopy];
            [self doSign:sign[1] withNum1Index:0 andNum2Index:1];
        }
    }else if(signIndex ==1){
        [self doSign:sign[1] withNum1Index:1 andNum2Index:2];
        double ariTemp[3] = {self.ari[0],self.result,self.ari[3] };
        self.ari = ariTemp;
        NSArray *strArrTemp = @[self.strArr[0],self.str,self.strArr[3]];
        self.strArr = [strArrTemp mutableCopy];
        if (signNext == 0) {
            [self doSign:sign[0] withNum1Index:0 andNum2Index:1];
            double ariTemp[2] = {self.result,self.ari[2] };
            self.ari = ariTemp;
            NSArray *strArrTemp = @[self.str,self.strArr[2]];
            self.strArr = [strArrTemp mutableCopy];
            [self doSign:sign[2] withNum1Index:0 andNum2Index:1];
        }else{
            [self doSign:sign[2] withNum1Index:1 andNum2Index:2];
            double ariTemp[2] = {self.ari[0],self.result };
            self.ari = ariTemp;
            NSArray *strArrTemp = @[self.strArr[0],self.str];
            self.strArr = [strArrTemp mutableCopy];
            [self doSign:sign[0] withNum1Index:0 andNum2Index:1];
        }
    }else{
        [self doSign:sign[2] withNum1Index:2 andNum2Index:3];
        double ariTemp[3] = {self.ari[0],self.ari[1],self.result };
        self.ari = ariTemp;
        NSArray *strArrTemp = @[self.strArr[0],self.strArr[1],self.str];
        self.strArr = [strArrTemp mutableCopy];
        if (signNext == 0) {
            [self doSign:sign[0] withNum1Index:0 andNum2Index:1];
            double ariTemp[2] = {self.result,self.ari[2] };
            self.ari = ariTemp;
            NSArray *strArrTemp = @[self.str,self.strArr[2]];
            self.strArr = [strArrTemp mutableCopy];
            [self doSign:sign[1] withNum1Index:0 andNum2Index:1];
        }else{
            [self doSign:sign[1] withNum1Index:1 andNum2Index:2];
            double ariTemp[2] = {self.ari[0],self.result };
            self.ari = ariTemp;
            NSArray *strArrTemp = @[self.strArr[0],self.str];
            self.strArr = [strArrTemp mutableCopy];
            [self doSign:sign[0] withNum1Index:0 andNum2Index:1];
        }
    }
}
-(void)doSign:(SIGN)sign withNum1Index:(int)index1 andNum2Index:(int)index2{
    if (sign ==ADD) {
        self.str = [NSString stringWithFormat:@"%@+%@",self.strArr[index1],self.strArr[index2]];
        self.result = self.ari[index1]+self.ari[index2];
    }else if(sign ==SUBTRACT){
        if (self.strArr[index2].length>2&&([[self.strArr[index2] substringWithRange:(NSRange){1,2}]containsString:@"-"] || [[self.strArr[index2] substringWithRange:(NSRange){1,2}]containsString:@"+"])) {
            self.strArr[index2]=[NSString stringWithFormat:@"(%@)",self.strArr[index2]];
        }
        self.str = [NSString stringWithFormat:@"%@-%@",self.strArr[index1],self.strArr[index2]];
        self.result = self.ari[index1]-self.ari[index2];
        
    }else if(sign ==MULTIPLY){
        for (int i = 0; i<2; i++) {
            int idx = i==0?index1:index2;
            if (self.strArr[idx].length>2&&([[self.strArr[idx] substringFromIndex:self.strArr[idx].length-2]containsString:@"+"]  ||  [[self.strArr[idx] substringToIndex:2]containsString:@"+"])) {
                self.strArr[idx]=[NSString stringWithFormat:@"(%@)",self.strArr[idx]];
            }else if (self.strArr[idx].length>2&&([[self.strArr[idx] substringFromIndex:self.strArr[idx].length-2]containsString:@"-"]  ||  [[self.strArr[idx] substringToIndex:2]containsString:@"-"])) {
                self.strArr[idx]=[NSString stringWithFormat:@"(%@)",self.strArr[idx]];
            }
        }
        self.str = [NSString stringWithFormat:@"%@×%@",self.strArr[index1],self.strArr[index2]];
        self.result = self.ari[index1]*self.ari[index2];
        
    }else{
        if (self.strArr[index2].length>2&&([[self.strArr[index2] substringWithRange:(NSRange){1,2}]containsString:@"÷"] || [[self.strArr[index2] substringWithRange:(NSRange){1,2}]containsString:@"×"])) {
            self.strArr[index2]=[NSString stringWithFormat:@"(%@)",self.strArr[index2]];
        }
        
        for (int i = 0; i<2; i++) {
            int idx = i==0?index1:index2;

            if (self.strArr[idx].length>2&&([[self.strArr[idx] substringFromIndex:self.strArr[idx].length-2]containsString:@"+"]  ||  [[self.strArr[idx] substringToIndex:2]containsString:@"+"])) {
                self.strArr[idx]=[NSString stringWithFormat:@"(%@)",self.strArr[idx]];
            }else if (self.strArr[idx].length>2&&([[self.strArr[idx] substringFromIndex:self.strArr[idx].length-2]containsString:@"-"]  ||  [[self.strArr[idx] substringToIndex:2]containsString:@"-"])) {
                self.strArr[idx]=[NSString stringWithFormat:@"(%@)",self.strArr[idx]];
            }
        }
        self.str = [NSString stringWithFormat:@"%@÷%@",self.strArr[index1],self.strArr[index2]];
        self.result = 1.0*self.ari[index1]/self.ari[index2];
        
    }
}
- (NSMutableSet<NSString*> *)strSet {
	if(_strSet == nil) {
		_strSet = [NSMutableSet set];
                   
	}
	return _strSet;
}

@end
