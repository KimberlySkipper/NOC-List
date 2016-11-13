//
//  SecretAgentDetailViewController.h
//  NOC-List
//
//  Created by Kimberly Skipper on 11/12/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecretAgent.h"

@interface SecretAgentDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *coverNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *realNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessLevelLabel;

@property (nonatomic) SecretAgent *secretAgent;

@end
