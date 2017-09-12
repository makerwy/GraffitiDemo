//
//  WYDrawLineInfo.h
//  GraffitiDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYDrawLineInfo : NSObject

/**
 线条所包含的所有点
 */
@property (nonatomic, strong) NSMutableArray *drawLinePoints;

/**
 线条颜色
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 线条宽度
 */
@property (nonatomic, assign) float lineWidth;

@end
