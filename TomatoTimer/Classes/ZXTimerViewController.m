//
//  ZXTimerViewController.m
//  TomatoTimer
//
//  Created by Xiang on 15/11/17.
//  Copyright © 2015年 微加科技. All rights reserved.
//

#import "ZXTimerViewController.h"
#import "MZTimerLabel.h"

@interface ZXTimerViewController ()

@end

@implementation ZXTimerViewController

@synthesize easyTimer = _easyTimer;
@synthesize smallTimer = _smallTimer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    easyTimer = [[MZTimerLabel alloc] initWithLabel:_easyTimer andTimerType:MZTimerLabelTypeTimer];
    [easyTimer setCountDownTime:1500];
    easyTimer.resetTimerAfterFinish = NO;
    easyTimer.delegate = self;
    easyTimer.timeFormat = @"mm:ss";
    
    smallTimer = [[MZTimerLabel alloc] initWithLabel:_smallTimer andTimerType:MZTimerLabelTypeTimer];
    [smallTimer setCountDownTime:1500];
    smallTimer.resetTimerAfterFinish = NO;
    smallTimer.delegate = self;
    smallTimer.timeFormat = @"SS";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)timerStart {
    if(![easyTimer counting] && ![smallTimer counting]){
        _easyTimer.textColor = [UIColor colorWithWhite:0.298 alpha:1.000];
        _smallTimer.textColor = [UIColor colorWithWhite:0.298 alpha:1.000];
        [easyTimer reset];
        [smallTimer reset];
        [easyTimer start];
        [smallTimer start];
    }
}

- (void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    NSString *msg = [NSString stringWithFormat:@"番茄时间计时完成!\n计时时间: %i 分钟",(int)countTime/60];
    if([timerLabel isEqual:easyTimer]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"再接再厉" message:msg delegate:nil cancelButtonTitle:@"恭喜完成!" otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)timerLabel:(MZTimerLabel *)timerLabel countingTo:(NSTimeInterval)time timertype:(MZTimerLabelType)timerType{
    if(time < 301) {
        timerLabel.timeLabel.textColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
    }
}

@end
