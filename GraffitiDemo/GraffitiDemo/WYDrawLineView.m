//
//  WYDrawLineView.m
//  GraffitiDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import "WYDrawLineView.h"

@implementation WYDrawLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.allDrawLineInfo = [NSMutableArray arrayWithCapacity:0];
        self.backgroundColor = [UIColor whiteColor];
        self.drawLineColor = [UIColor blackColor];
        self.drawLineWidth = 4.f;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(contextRef, kCGLineCapRound);
    CGContextSetLineJoin(contextRef, kCGLineJoinRound);
    if (self.allDrawLineInfo.count > 0) {
        for (int i = 0; i < self.allDrawLineInfo.count; i++) {
            WYDrawLineInfo *info = self.allDrawLineInfo[i];
            CGContextBeginPath(contextRef);
            CGPoint startPoint = [info.drawLinePoints[0] CGPointValue];
            CGContextMoveToPoint(contextRef, startPoint.x, startPoint.y);
            if (info.drawLinePoints.count > 1) {
                for (int j = 0; j < info.drawLinePoints.count - 1; j++) {
                    CGPoint point = [info.drawLinePoints[j+1] CGPointValue];
                    CGContextAddLineToPoint(contextRef, point.x, point.y);
                }
            }else {
                CGContextAddLineToPoint(contextRef, startPoint.x, startPoint.y);
            }
            CGContextSetStrokeColorWithColor(contextRef, info.lineColor.CGColor);
            CGContextSetLineWidth(contextRef, info.lineWidth+1);
            CGContextStrokePath(contextRef);
        }
    }
}

//触摸开始
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch=[touches anyObject];
    
    [self drawPaletteTouchesBeganWithWidth:self.drawLineWidth andColor:self.drawLineColor andBeginPoint:[touch locationInView:self]];
    [self setNeedsDisplay];
}

//触摸移动
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSArray* MovePointArray=[touches allObjects];
    [self drawPaletteTouchesMovedWithPonit:[[MovePointArray objectAtIndex:0] locationInView:self]];
    [self setNeedsDisplay];
}

//在触摸开始的时候 添加一条新的线条 并初始化
- (void)drawPaletteTouchesBeganWithWidth:(float)width andColor:(UIColor *)color andBeginPoint:(CGPoint)bPoint {
    WYDrawLineInfo *info = [WYDrawLineInfo new];
    info.lineColor = color;
    info.lineWidth = width;
    
    [info.drawLinePoints addObject:[NSValue valueWithCGPoint:bPoint]];
    
    [self.allDrawLineInfo addObject:info];
}

//在触摸移动的时候 将现有的线条的最后一条的 point增加相应的触摸过的坐标
- (void)drawPaletteTouchesMovedWithPonit:(CGPoint)mPoint {
    WYDrawLineInfo *lastInfo = [self.allDrawLineInfo lastObject];
    [lastInfo.drawLinePoints addObject:[NSValue valueWithCGPoint:mPoint]];
}

/**
 清除所有的线条
 */
- (void)cleanAllDrawLine {
    if ([self.allDrawLineInfo count]>0)  {
        [self.allDrawLineInfo removeAllObjects];
        [self setNeedsDisplay];
    }
}

/**
 撤销上一步
 */
- (void)cleanLastDrawLine {
    if (self.allDrawLineInfo.count > 0) {
        [self.allDrawLineInfo removeLastObject];
        [self setNeedsDisplay];
    }
}


@end
