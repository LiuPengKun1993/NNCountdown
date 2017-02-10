//
//  UIButton+NNCountdown.h
//  NNCountdown
//
//  Created by 刘朋坤 on 17/2/10.
//  Copyright © 2017年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (NNCountdown)

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
           withDuringColor:(UIColor *)duringColor;

@end
