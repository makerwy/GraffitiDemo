//
//  WYDrawLineInfo.m
//  GraffitiDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import "WYDrawLineInfo.h"

@implementation WYDrawLineInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        //
        self.drawLinePoints = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

@end
