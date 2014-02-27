//
//  CrashHandler.h
//  CrashHandler
//
//  Created by Arshad on 10/11/11.
//  Copyright 2011 Ab'initio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrashHandler : NSObject 
	
+ (void) setupLogging:(BOOL)shouldEnableCrashHandler;
@end

void CrashHandlerExceptionHandler(NSException *exception);