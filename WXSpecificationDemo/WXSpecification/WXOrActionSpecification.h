//
//  WXOrCompositeSpecification.h
//  WXSpecificationDemo
//
//  Created by wenchao on 16/4/23.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "WXCompositeSpecification.h"

@interface WXOrActionSpecification : WXCompositeSpecification

- (instancetype)initWithLeft:(id<IWXSpecification>)left right:(id<IWXSpecification>)right ;

@end
