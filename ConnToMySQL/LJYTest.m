//
//  LJYTest.m
//  ConnToMySQL
//
//  Created by 李俊宇 on 2018/9/18.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "LJYTest.h"

@implementation LJYTest

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return  self;
}
+(instancetype)testWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}



@end
