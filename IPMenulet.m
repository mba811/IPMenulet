//
//  IPMenulet.m
//  IPMenulet
//
//  Created by Andrew Pennebaker on 13 Dec 2007.
//  Copyright 2007 YelloSoft. All rights reserved.
//

#import "IPMenulet.h"
#import "GetIP.h"
#import "AddressService.h"

@implementation IPMenulet

-(void) dealloc {
	[timer release];
	[refreshMenuItem release];
	[aboutMenuItem release];
	[quitMenuItem release];
	[statusItem release];
	[menu release];

	[super dealloc];
}

-(void) awakeFromNib {
    
	statusItem=[[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setMenu:menu];
	[statusItem setHighlightMode:YES];
	[statusItem setTitle:@"?.?.?.?"];
	[statusItem setEnabled:YES];

	timer=[NSTimer scheduledTimerWithTimeInterval:300 target:self selector:@selector(update) userInfo:nil repeats:YES];
	[timer fire];

}

-(void) update {
    
    IPaddress *ip = [AddressService getIPaddress];
    [statusItem setTitle: [NSString stringWithFormat:@"%@ (%@)", [ip ip], [ip countryCode]]];
    
//    [statusItem setTitle: [GetIP getIP]];
    
}

-(IBAction) refresh: (id) sender {
	[self update];
}

-(IBAction) about: (id) sender {
	NSApplication *app=[NSApplication sharedApplication];
	[app activateIgnoringOtherApps:YES];
	[app orderFrontStandardAboutPanel:NULL];
}

@end