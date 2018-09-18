//
//  LJYTest.h
//  ConnToMySQL
//
//  Created by 李俊宇 on 2018/9/18.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJYTest : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *password;
@property(nonatomic,copy)NSString *sex;






-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)testWithDict:(NSDictionary *)dict;

@end
