//
//  ViewController.m
//  WXSpecificationDemo
//
//  Created by wenchao on 16/4/23.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "ViewController.h"
#import "WXSpecification.h"

@interface YYChannelUserInfo : NSObject

@property (nonatomic) NSNumber* topSid;
@property (nonatomic) NSNumber* subSid;
@property (nonatomic) NSNumber* uid;

@end

@implementation YYChannelUserInfo

- (NSString*)description {
    NSString* res = [NSString stringWithFormat:@"<%@,%@,%@>",self.topSid,self.subSid,self.uid];
    
    return res;
}

@end

@interface WXSubFilter : WXCompositeSpecification

@property(nonatomic)NSArray<YYChannelUserInfo*>* subData;

- (BOOL)isSatisfiedBy:(YYChannelUserInfo*)candidate ;

@end

@implementation WXSubFilter

- (BOOL)isSatisfiedBy:(YYChannelUserInfo*)candidate {
    for (YYChannelUserInfo* item in self.subData) {
        if ((item.topSid.unsignedLongLongValue == candidate.topSid.unsignedLongLongValue &&
             item.subSid.unsignedLongLongValue == candidate.subSid.unsignedLongLongValue) || (item.uid.unsignedLongLongValue == candidate.uid.unsignedLongLongValue)) {
            return YES;
        }
    }
    return NO;
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self combTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)combTest {
    NSArray* origin = [self createUserInfo:10];
    
    NSArray* forFilter = [self createUserInfo:3];
    
    NSArray* forFilter1 = [self createUserInfo:5];
    
    NSArray* forFilter2 = [self createUserInfo:7];
    
    NSMutableArray* filter = [ NSMutableArray array];
    WXSubFilter* subtract = [WXSubFilter new];
    subtract.subData = forFilter;
    
    WXSubFilter* subtract1 = [WXSubFilter new];
    subtract1.subData = forFilter1;
    
    WXSubFilter* subTract2 = [WXSubFilter new];
    subTract2.subData = forFilter2;
    
    for (YYChannelUserInfo* item in origin) {
        //if ([[subtract orAction:subtract1]  isSatisfiedBy:item]) {
        //if ([[[subtract andAction:subtract1] orAction:subTract2]  isSatisfiedBy:item]) {
        if ([[subtract notAction] isSatisfiedBy:item]) {
        //if ([subtract isSatisfiedBy:item]) {
            [filter addObject:item];
        }
    }
    
    NSLog(@"origin:%@",origin);
    NSLog(@"filter:%@",forFilter);
    NSLog(@"filter1:%@",forFilter1);
    NSLog(@"filter2:%@",forFilter2);
    NSLog(@"filterOut:%@",filter);
}

- (NSArray*)createUserInfo:(NSInteger)count {
    NSMutableArray* resultArray = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        YYChannelUserInfo* info = [YYChannelUserInfo new];
        info.topSid = @(i);
        info.subSid = @(i+1);
        info.uid = @(i+2);
        
        [resultArray addObject:info];
    }
    
    return resultArray;
}

@end
