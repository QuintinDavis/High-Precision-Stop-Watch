//
//  ViewController.m
//  timer
//
//  Created by Quintin Davis on 1/6/14.
//  Copyright (c) 2014 KAPP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSTimer *timer;
NSDate * start;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    labelTime.text=@"0";
    segControl.selectedSegmentIndex=1;
//    start = [[NSDate alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)startTime:(id)sender {
//    [timer invalidate];
//    start = [[NSDate alloc] init];
//    timer = [NSTimer scheduledTimerWithTimeInterval:-1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
//}

- (IBAction)segmentedController:(id)sender {
    if(segControl.selectedSegmentIndex==0){
        [timer invalidate];
        start = [[NSDate alloc] init];
        timer = [NSTimer scheduledTimerWithTimeInterval:-1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    }
    if(segControl.selectedSegmentIndex==1){
        [timer invalidate];
    }
//    if(segControl.selectedSegmentIndex==2){
//        [timer invalidate];
//        labelTime.text=@"0";
//    }
}

- (void) tick {
    NSDate * stop = [[NSDate alloc] init];
   float timeElapsed = [stop timeIntervalSinceDate:start];
//    NSLog(@"%f",timeElapsed);
    int timeTick;
    double timeMiliSec;
    int timeSec;
    int timeMin;
    int timeHour;
    NSString *spacerMiliSec = @"";
    NSString *spacerSec = @"0";
    NSString *spacerMin = @"0";
    NSString *spacerHour = @"0";
    timeMiliSec = floor((timeElapsed-floor(timeElapsed))*100000000000000);
    NSString *lengthString = [[NSString alloc] initWithFormat:@"%f",timeMiliSec];
    int length = [lengthString length];
//    NSLog(@"%d",length);
    for(int i =length; i<21;i++){
        spacerMiliSec = [[NSString alloc] initWithFormat:@"0%@",spacerMiliSec];
    }
    timeTick=floor(timeElapsed);
    timeSec = timeTick%60;
    timeMin=((timeTick-(timeTick%60))/60)%60;
    timeHour= ((timeTick-(timeTick%3600))/3600)%24;
    if (timeSec>9) {
        spacerSec = @"";
    }
    if (timeMin>9) {
        spacerMin = @"";
    }
    if (timeHour>9) {
        spacerHour = @"";
    }
    NSString *timeString = [[NSString alloc] initWithFormat:@"%@%d:%@%d:%@%d.%@%.0f",spacerHour,timeHour,spacerMin,timeMin,spacerSec,timeSec,spacerMiliSec,timeMiliSec];
    labelTime.text=timeString;
}
@end
