//
//  WXAndCompositeSpecification.m
//  WXSpecificationDemo
//
//  Created by wenchao on 16/4/23.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "WXAndActionSpecification.h"

@interface WXAndActionSpecification ()

@property (nonatomic) id<IWXSpecification> leftSpec;
@property(nonatomic) id<IWXSpecification> rightSpec;

@end

@implementation WXAndActionSpecification

- (instancetype)initWithLeft:(id<IWXSpecification>)left right:(id<IWXSpecification>)right {
    self = [super init];
    if (self) {
        _leftSpec = left;
        _rightSpec = right;
    }
    
    return self;
}

- (BOOL)isSatisfiedBy:(id)candidate {
    return [self.leftSpec isSatisfiedBy:candidate] && [self.rightSpec isSatisfiedBy:candidate];
}

@end