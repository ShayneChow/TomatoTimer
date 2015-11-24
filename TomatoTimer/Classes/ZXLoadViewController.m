//
//  ZXLoadViewController.m
//  TomatoTimer
//
//  Created by Xiang on 15/11/24.
//  Copyright © 2015年 微加科技. All rights reserved.
//

#import "ZXLoadViewController.h"
#import "ZXTimerViewController.h"
#import "MZTimerLabel.h"

@interface ZXLoadViewController ()<MZTimerLabelDelegate> {
    MZTimerLabel *_loadTimer;
}

@property (strong, nonatomic) IBOutlet UILabel *loadTimer;

@end

@implementation ZXLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _loadTimer = [[MZTimerLabel alloc] initWithLabel:_loadTimer andTimerType:MZTimerLabelTypeTimer];
    [_loadTimer setCountDownTime:8];
    _loadTimer.resetTimerAfterFinish = NO;
    _loadTimer.delegate = self;
    _loadTimer.timeFormat = @"s";
    [_loadTimer start];
}

- (IBAction)loadTimerButtonClicked {
    [self showTimerView];
}

- (void)showTimerView {
    //获取storyboard: 通过bundle根据storyboard的名字来获取我们的storyboard
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    ZXTimerViewController *timerVC = [story instantiateViewControllerWithIdentifier:@"timerXib"];
    
    [self.view.window.rootViewController presentViewController:timerVC animated:YES completion:nil];
}

- (void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    [self showTimerView];
}

/**
 *  状态栏的样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    // 白色状态栏
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
