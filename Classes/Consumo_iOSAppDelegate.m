//
//  Consumo_iOSAppDelegate.m
//  Consumo-iOS
//
//  Created by Felipe Kellermann on 1/4/11.
//  Copyright 2011 Nyvra Software. All rights reserved.
//

#import "Consumo_iOSAppDelegate.h"
#import "AccountsViewController.h"
#import "Accounts.h"
#import "Reachability.h"

@implementation Consumo_iOSAppDelegate

@synthesize window;

#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions { 
	[window setBackgroundColor:[UIColor blackColor]];
    AccountsViewController *accountsView = [[[AccountsViewController alloc] init] autorelease];
	navigation = [[UINavigationController alloc] initWithRootViewController:accountsView];
	[navigation.navigationBar setTintColor:[UIColor colorWithRed:0.10 green:0.25 blue:0.70 alpha:1.0]];
	[self.window addSubview:navigation.view];
	
    [self.window makeKeyAndVisible];
	
	if ([[Reachability sharedReachability] internetConnectionStatus] == NotReachable) {
		UIAlertView *alertReachability = [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Internet Access", @"")
																	 message:NSLocalizedString(@"This application requires Internet access to work properly. Please check your Internet access.", @"")
																	delegate:nil
														   cancelButtonTitle:NSLocalizedString(@"Dismiss", @"")
															otherButtonTitles:nil] autorelease];
		[alertReachability show];
	}
    
    return YES;
}

#pragma mark Memory management

- (void)dealloc
{
	[navigation release];
    [window release];
    [super dealloc];
}

@end