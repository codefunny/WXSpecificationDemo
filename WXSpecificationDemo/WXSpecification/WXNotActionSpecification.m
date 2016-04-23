//
//  WXNotCompositeSpecification.m
//  WXSpecificationDemo
//
//  Created by wenchao on 16/4/23.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "WXNotActionSpecification.h"

@interface WXNotActionSpecification ()

@property(nonatomic) id<IWXSpecification> spec;

@end

@implementation WXNotActionSpecification

- (instancetype)initWithSpec:(id<IWXSpecification>)spec {
    self = [super init];
    if (self) {
        _spec = spec;
    }
    
    return self;
}

- (BOOL)isSatisfiedBy:(id)candidate {
    return ![self.spec isSatisfiedBy:candidate];
}

@end
