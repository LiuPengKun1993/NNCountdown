# NNCountdown
> 创建一个 UIButton 控件，添加一句代码就可以实现简单的短信验证码倒计时操作。

##先看示意图：
![NNCountdown 倒计时](https://github.com/liuzhongning/NNCountdown/blob/master/NNCountdown.gif)  

##步骤如下：


####步骤一：创建一个 UIButton 的分类

在 `"UIButton+NNCountdown.h"` 中添加一个方法（具体请看`"UIButton+NNCountdown.m"` 文件）：

```
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
```
     
####步骤二：在需要的地方调用 `"UIButton+NNCountdown.h"` 中的那个方法，如下所示：
     
````
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
````
