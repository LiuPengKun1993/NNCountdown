//
//  UIButton+NNCountdown.m
//  NNCountdown
//
//  Created by 刘朋坤 on 17/2/10.
//  Copyright © 2017年 刘朋坤. All rights reserved.
//

#import "UIButton+NNCountdown.h"

@implementation UIButton (NNCountdown)

/**
 *  倒计时按钮
 *
 *  @param totalTime           倒计时总时间
 *  @param placeholderText     倒计时停止时的占位文字
 *  @param unit                倒计时的单位（分、秒）
 *  @param stopColor           倒计时停止时的颜色
 *  @param duringColor         倒计时进行时的颜色
 */
- (void)startWithTotalTime:(NSInteger)totalTime
       withPlaceholderText:(NSString *)placeholderText
                  withUnit:(NSString *)unit
             withStopColor:(UIColor *)stopColor
           withDuringColor:(UIColor *)duringColor {
    
    __weak __typeof(self) weakSelf = self;
    __block NSInteger timeOut = totalTime;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        if (timeOut < 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = stopColor;
                [weakSelf setTitle:placeholderText
                          forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = YES;
            });
        } else {
            NSInteger allTime = totalTime + 1;
            NSInteger seconds = timeOut % allTime;
            NSString *timeStr = [NSString stringWithFormat:@"%ld", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = duringColor;
                [weakSelf setTitle:[NSString stringWithFormat:@"%@%@",timeStr,unit]
                          forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

@end
