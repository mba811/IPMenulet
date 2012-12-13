//
//  IPMenulet.h
//  IPMenulet
//
//  Created by Andrew Pennebaker on 13 Dec 2007.
//  Copyright 2007 YelloSoft. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface IPMenulet: NSObject {
	NSStatusItem *statusItem;
	IBOutlet NSMenu *menu;
	IBOutlet NSMenuItem *refreshMenuItem;
	IBOutlet NSMenuItem *aboutMenuItem;
	IBOutlet NSMenuItem *quitMenuItem;
	NSTimer *timer;
}

-(void) update;

-(IBAction) refresh: (id) sender;
-(IBAction) about: (id) sender;

@end