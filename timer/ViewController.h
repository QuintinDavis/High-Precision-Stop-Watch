//
//  ViewController.h
//  timer
//
//  Created by Quintin Davis on 1/6/14.
//  Copyright (c) 2014 KAPP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UILabel *labelTime;
    IBOutlet UISegmentedControl *segControl;
}
//- (IBAction)startTime:(id)sender;
- (IBAction)segmentedController:(id)sender;

@end
