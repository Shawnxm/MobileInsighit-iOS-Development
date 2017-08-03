//
//  ViewController.m
//  Hello World
//
//  Created by mssn on 7/11/17.
//  Copyright © 2017 iOS. All rights reserved.
//

#import "ViewController.h"
#import "NSTask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ButtonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState: UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed", title];
    _statusLabel.text = plainText;
}

- (IBAction)TRIGGER:(UIButton *)sender {
    /*[NSTask launchedTaskWithLaunchPath: @"/bin/sh"
     arguments: [NSArray arrayWithObjects: @"-c", @"su -c ps ax|grep omm|grep ys|xargs", nil]];
     
     */
    
    // int pid = [[NSProcessInfo processInfo] processIdentifier];
    
    
    
    NSTask *task = [[NSTask alloc] init];
    //[task setCurrentDirectoryPath: @"/bin/"];
    [task setLaunchPath : @"/bin/bash"];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-c", @"\"su root -c 'ps aux'\"", nil];
    [task setArguments : arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput : pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    
    /*
    NSTask *task1 = [[NSTask alloc] init];
    //[task setCurrentDirectoryPath: @"/bin/"];
    [task1 setLaunchPath : @"/bin/bash"];
    
    NSArray *arguments1;
    arguments1 = [NSArray arrayWithObjects: @"ps", nil];
    [task1 setArguments : arguments1];
    
    NSPipe *pipe1;
    pipe1 = [NSPipe pipe];
    [task1 setStandardOutput : pipe1];
    
    NSFileHandle *file1;
    file1 = [pipe1 fileHandleForReading];
    
    [task1 launch];*/
    
    
    NSData *data;
    data = [file readDataToEndOfFile];
    // [file closeFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data
                                   encoding: NSUTF8StringEncoding];
    NSLog (@"woop!  got\n%@", string);
}

@end
