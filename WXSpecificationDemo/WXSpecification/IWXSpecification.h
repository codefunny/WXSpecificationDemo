//
//  IWXSpecification.h
//  WXSpecificationDemo
//
//  Created by wenchao on 16/4/23.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IWXSpecification <NSObject>

- (BOOL)isSatisfiedBy:(id)candidate;
- (id<IWXSpecification>)andAction:(id<IWXSpecification>)spec;
- (id<IWXSpecification>)orAction:(id<IWXSpecification>)spec;
- (id<IWXSpecification>)notAction;

@end
