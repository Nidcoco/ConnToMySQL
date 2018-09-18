//
//  ViewController.m
//  ConnToMySQL
//
//  Created by 李俊宇 on 2018/9/18.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "ViewController.h"
#import "LJYTest.h"
#import <OHMySQL.h>
@interface ViewController ()<UITableViewDataSource>


@property(nonatomic,strong)NSMutableArray *test;


@end

@implementation ViewController


- (NSArray *) test{
    
    if(_test == nil){
        
        //初始化数据库连接用户
        OHMySQLUser *usr = [[OHMySQLUser alloc]initWithUserName:@"root" password:@"123456" serverName:@"localhost" dbName:@"IOS" port:3306 socket:nil];
        
        //初始化连接器
        OHMySQLStoreCoordinator *coordinator = [[OHMySQLStoreCoordinator alloc]initWithUser:usr];
        
        //连接到数据库
        [coordinator connect];
        
        //初始化设备上下文
        OHMySQLQueryContext *queryContext = [OHMySQLQueryContext new];
        
        //设置连接器
        queryContext.storeCoordinator = coordinator;
        
        //获取log表中的数据
        
        OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory SELECT:@"test" condition:nil orderBy:@[@"name"] ascending:NO];
        
        NSError *error = nil;
        
        //task用于存放数据库返回的数据
        
        NSArray *tasks = [queryContext executeQueryRequestAndFetchResult:query error:&error];
        NSMutableArray *arrayModels = [NSMutableArray array];
        if (tasks != nil) {
            for (NSDictionary *dict in tasks) {
                
                LJYTest *model = [LJYTest testWithDict:dict];
                [arrayModels addObject:model];
            }
                   _test = arrayModels;
        }
        else
            NSLog(@"%@",error.description);
        
        
 
    }
    return _test;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    //初始化数据库连接用户
    OHMySQLUser *usr = [[OHMySQLUser alloc]initWithUserName:@"root" password:@"123456" serverName:@"localhost" dbName:@"IOS" port:3306 socket:nil];
    
    //初始化连接器
    OHMySQLStoreCoordinator *coordinator = [[OHMySQLStoreCoordinator alloc]initWithUser:usr];
    
    //连接到数据库
    [coordinator connect];
    
    //初始化设备上下文
    OHMySQLQueryContext *queryContext = [OHMySQLQueryContext new];
    
    //设置连接器
    queryContext.storeCoordinator = coordinator;
    
    //获取log表中的数据
    
    OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory SELECT:@"test" condition:nil orderBy:@[@"name"] ascending:NO];
    
    NSError *error = nil;
    
    //task用于存放数据库返回的数据
    
    NSArray *tasks = [queryContext executeQueryRequestAndFetchResult:query error:&error];
    
    if (tasks != nil) {
        NSLog(@"%@",tasks);
    }
    else
        NSLog(@"%@",error.description);
    
    
    
   */
    
    
    LJYTest *test = self.test[1];
    
    NSLog(@"cnm,%@",test.name);
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.test.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LJYTest *test = self.test[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = test.name;
    
    return cell;
}
    
    /*
     查找操作中的condition代表筛选操作，对应对sql中的WHERE XXX AND XXX,但是，where是不需要自己加入的，我们看源码可知，作者会自动加入WHERE。比如我想查找task表中id = 10,名字为larry的字段，需要这样输入：
     OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory SELECT:@"tasks" condition:@"id = '10' AND name = 'larry'"];
     //orderBy：依据什么排序
     //ascending：是否为升序，YES为升序，NO为降序
     
     
     */
    
    
    



@end
