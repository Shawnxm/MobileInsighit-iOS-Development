//
//  ViewController.h
//  Hello World
//
//  Created by mssn on 7/11/17.
//  Copyright © 2017 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)ButtonPressed:(UIButton *)sender;
//- (IBAction)ButtonPressed2:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)TRIGGER:(UIButton *)sender;


@end

