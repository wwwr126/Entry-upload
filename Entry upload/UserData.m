//
//  UserData.m
//  Entry upload
//
//  Created by 林晓龙 on 14-4-10.
//  Copyright (c) 2014年 qc. All rights reserved.
//

#import "UserData.h"
#define KEY_STR @"Entry upload"

@implementation UserData

+(NSArray *)allRecord
{
    return [[NSUserDefaults standardUserDefaults]objectForKey:KEY_STR];
}

+(void)record:(NSString *)my computer:(NSString *)computer result:(NSString *)result
{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:KEY_STR]) {
        NSArray *arr = [[NSArray alloc]init];
        [[NSUserDefaults standardUserDefaults]setObject:arr forKey:KEY_STR];
        [arr release];
    }
    NSArray *arr = [[NSUserDefaults standardUserDefaults]objectForKey:KEY_STR];
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:arr];
    NSArray *single = [[NSArray alloc]initWithObjects:my,result,computer,nil];
    [mutArr addObject:single];
    [single release];
    [[NSUserDefaults standardUserDefaults]setObject:mutArr forKey:KEY_STR];
    
}

@end
