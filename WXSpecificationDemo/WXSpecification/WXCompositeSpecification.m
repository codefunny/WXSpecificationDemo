//
//  WXCompositeSpecification.m
//  WXSpecificationDemo
//
//  Created by wenchao on 16/4/23.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "WXCompositeSpecification.h"
#import "WXAndActionSpecification.h"
#import "WXOrActionSpecification.h"
#import "WXNotActionSpecification.h"

@implementation WXCompositeSpecification

- (BOOL)isSatisfiedBy:(id)candidate {
    NSAssert(NO, @"base class,do not call this");
    return NO;
}

- (id<IWXSpecification>)andAction:(id<IWXSpecification>)spec {
    return [[WXAndActionSpecification alloc] initWithLeft:self right:spec];
}

- (id<IWXSpecification>)orAction:(id<IWXSpecification>)spec {
    return [[WXOrActionSpecification alloc] initWithLeft:self right:spec];
}

- (id<IWXSpecification>)notAction {
    return [[WXNotActionSpecification alloc] initWithSpec:self];
}

@end
