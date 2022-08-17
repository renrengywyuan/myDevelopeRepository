//
//  NSString+SafeString.m
//  SafeStringT
//
//  Created by Mr.吕 on 2018/3/9.
//  Copyright © 2018年 Mr.吕. All rights reserved.
//

#import "NSString+SafeString.h"

@implementation NSString (SafeString)

+ (NSString *)safe:(NSString *)str {
    
    if (str == nil) {
        
        return @"";
    }else if ([str isKindOfClass:[NSNull class]]){
        
        return @"";
    }else if (str == NULL){
        
        return @"";
    }else if ([str isEqual:[NSNull null]]){
        
        return @"";
    }else {
        
        return str;
    }
}

@end

