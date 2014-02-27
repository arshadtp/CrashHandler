CrashHandler
============

Introduction
---------
 
CrashHandler is a light weight class which will catch all un-handled exceptions. Also it will send catched exception to [Parse](http://parse.com) server.

### [Parse](http://parse.com) 

Parse.com is a hosted service, providing backend services to end-user applications. Parse.com supports a number of different platforms, including iOS, Android, and Windows, as well as web applications. SDKs are available for a number of these platforms.

 * Data persistence
 * Push notifications (iOS and Android)
 * Social integration
 * Analytics
 * Cloud code execution
 -----[Stack Overflow](http://stackoverflow.com/tags/parse.com/info)

If you haven't tried parse yet, must give it a try. Sure you will love it !!!

Steps to Integrate 
-------

 * Create an app in  [Parse](http://parse.com)
 * [Download and integrate Parse SDK to your project](https://parse.com/apps/quickstart#parse_data/mobile/ios/native/existing) 
 * DownloAdd [CrashHandler](https://codeload.github.com/arshadtp/CrashHandler/zip/master) and add CrashHandler-master-2 -> CrashHandlerClass to your project.
 * Import CrashHandler.h to your AppDelegate.m
 * Now add [CrashHandler setupLogging:YES] in your application:didFinishLaunchingWithOptions:
 
That's it. Now you will be able to see the crash reports in your App's [Parse](http://parse.com) dashboard.

 
