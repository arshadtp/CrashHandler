//
//  CrashHandler.m
//  CrashHandler
//
//  Created by Arshad on 10/11/11.
//  Copyright 2011 Ab'initio. All rights reserved.
//

#import "CrashHandler.h"
#import <Parse/Parse.h>

#define MODEL @"model"
#define NAME @"name"
#define VERSION @"os_version"
#define UNCAUGHT_EXCEPTION @"uncaught exception"
#define WAIT_TIME 5

static BOOL _shouldEnableCrashHandler = NO;

@implementation CrashHandler

+ (void) setupLogging:(BOOL)shouldEnableCrashHandler{
	
	NSSetUncaughtExceptionHandler (&CrashHandlerExceptionHandler);
	_shouldEnableCrashHandler = shouldEnableCrashHandler;
}

// Method to get device info
+ (NSMutableDictionary *) getDeviceInfo {
	
	NSMutableDictionary *deviceInfo = [[NSMutableDictionary alloc] init];
	[deviceInfo setValue:[[UIDevice currentDevice] model] forKey:MODEL];
	[deviceInfo setValue:[[UIDevice currentDevice] name] forKey:NAME];
	[deviceInfo setValue:[[UIDevice currentDevice] systemVersion] forKey:VERSION];
	return deviceInfo;
}

// Method which send crash report to Parse server
+(void) reportCrash:(NSString *) name andReason:(NSString *)reason andStackTrace:(NSString *)stackTrace {
	
	NSLog(@"\nName: %@\n Reason: %@\n Stack Trace: \n%@\n", name, reason, stackTrace);
	
	NSMutableDictionary *deviceInfo = [CrashHandler getDeviceInfo];
	// Sending data to Parse server
	PFObject *crash = [PFObject objectWithClassName:@"CrashReport"];
	crash[@"Name"] = name;
	crash[@"Reason"] = reason;
	crash[@"Stack_trace"] = stackTrace;
	crash[@"Model"] = [deviceInfo valueForKey:MODEL];
	crash[@"Device"] = [deviceInfo valueForKey:NAME];
	crash[@"Os_version"] = [deviceInfo valueForKey:VERSION];
	[crash saveEventually];

}
#pragma mark #
@end

void CrashHandlerExceptionHandler(NSException *exception) {
	
	NSArray *arr = [exception callStackSymbols];
	NSString *report = [arr componentsJoinedByString:@"\n"];
	
	if (_shouldEnableCrashHandler) {
		
		[CrashHandler reportCrash:exception.name andReason:exception.reason andStackTrace:report];
	}
	// Looping for some time before crash
	NSDate *date = [[NSDate date] dateByAddingTimeInterval:WAIT_TIME];
	while ([date compare:[NSDate date]] == NSOrderedDescending) {
		
		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
	}
}

