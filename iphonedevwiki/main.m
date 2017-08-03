#import "XXAppDelegate.h"
#import "NSTask.h"


void runSystemCommand(NSString *cmd)
{
    [[NSTask launchedTaskWithLaunchPath:@"/bin/sh"
                              arguments:@[@"-c", cmd]]
     waitUntilExit];
}

int main(int argc, char *argv[]) {
	/*@autoreleasepool {
        setuid(0);
        setgid(0);
        runSystemCommand(@" \"su root -c \'ps ax > /var/root/temp.txt\'\"");
		return UIApplicationMain(argc, argv, nil, NSStringFromClass(XXAppDelegate.class));
	}*/
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
