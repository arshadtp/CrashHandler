//
//  ViewController.m
//  SampleCrashHandler
//
//  Created by Arshad T P on 2/27/14.
//  Copyright (c) 2014 Ab'initio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)crashAppAction:(id)sender {
	
	NSArray *array = [[NSArray alloc]initWithObjects:@"A", nil];
	[array objectAtIndex:5];
}
@end
