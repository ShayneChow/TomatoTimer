//
//  ZXTimerViewController.h
//  TomatoTimer
//
//  Created by Xiang on 15/11/17.
//  Copyright © 2015年 微加科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZTimerLabel.h"

@interface ZXTimerViewController : UIViewController <MZTimerLabelDelegate> {
    MZTimerLabel *easyTimer;
    MZTimerLabel *smallTimer;
}

@property (weak, nonatomic) IBOutlet UILabel *easyTimer;

- (IBAction)timerStart;

@property (weak, nonatomic) IBOutlet UILabel *smallTimer;

@end
