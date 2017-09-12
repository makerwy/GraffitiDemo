//
//  WYDrawLineView.h
//  GraffitiDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYDrawLineInfo.h"

@interface WYDrawLineView : UIView

/**
 所有线段信息
 */
@property (nonatomic, strong) NSMutableArray *allDrawLineInfo;

/**
 线段颜色
 */
@property (nonatomic, strong) UIColor *drawLineColor;

/**
 线段宽度
 */
@property (nonatomic, assign) float drawLineWidth;

@end
