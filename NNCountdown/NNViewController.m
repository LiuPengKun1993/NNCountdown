//
//  NNViewController.m
//  NNCountdown
//
//  Created by 刘朋坤 on 17/2/10.
//  Copyright © 2017年 刘朋坤. All rights reserved.
//

#import "NNViewController.h"
#import "UIButton+NNCountdown.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]


@interface NNViewController ()
@property (weak, nonatomic) IBOutlet UIButton *countdownButton;

@end

@implementation NNViewController

- (IBAction)countdownButtonClick:(UIButton *)sender {
    [self.countdownButton startWithTotalTime:10
                         withPlaceholderText:@"获取验证码"
                                    withUnit:@"秒后重试"
                               withStopColor:RGBA(0, 114, 198, 1.0f)
                             withDuringColor:RGBA(204, 204, 204, 1.0f)];
}

@end
