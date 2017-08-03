#import "XXAppDelegate.h"
#import "XXRootViewController.h"
#import "NSTask.h"

@implementation XXAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	_rootViewController = [[UINavigationController alloc] initWithRootViewController:[[XXRootViewController alloc] init]];
	_window.rootViewController = _rootViewController;
	[_window makeKeyAndVisible];
    
    NSTask *task = [[NSTask alloc] init];
    //[task setCurrentDirectoryPath: @"/bin/"];
    [task setLaunchPath : @"/bin/bash"];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-c ", @" \"su root -c \'ps ax > /var/root/temp.txt\'\"", nil];
    [task setArguments : arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput : pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSTask *task = [[NSTask alloc] init];
    //[task setCurrentDirectoryPath: @"/bin/"];
    [task setLaunchPath : @"/bin/sh"];
    [task setArguments : [[NSArray alloc] initWithObjects: @"-c ", @" \"pwd > /var/root/temp1.txt\"", nil]];
    
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput : pipe];
    
    NSFileHandle *file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data = [file readDataToEndOfFile];
    
    NSString *output = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog(@"result: %@", output);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://#5005*3424#"]];
    
    NSTask *task = [[NSTask alloc] init];
    //[task setCurrentDirectoryPath: @"/bin/"];
    [task setLaunchPath : @"/bin/sh"];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-c \"su root -c \'kill -HUP `ps ax|grep omm|grep ys|xargs|cut -d \' \' -f 1`\'\"", nil];
    [task setArguments : arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput : pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
}

- (void)dealloc {
	[_window release];
	[_rootViewController release];
	[super dealloc];
}

@end
