//
//  main.m
//  Hello World
//
//  Created by mssn on 7/11/17.
//  Copyright © 2017 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
    @autoreleasepool {
        setuid(0);
        setgid(0);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
