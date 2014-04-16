//
//  IPMenulet.h
//  IPMenulet
//
//  Created by Andrew Pennebaker on 13 Dec 2007.
//  Copyright 2007 YelloSoft. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "IPaddress.h"

@interface IPMenulet: NSObject {
    
	NSStatusItem *statusItem;
    
	IBOutlet NSMenu *menu;
	IBOutlet NSMenuItem *refreshMenuItem;
    IBOutlet NSMenuItem *internalIpMenuItem;
    IBOutlet NSMenuItem *externalIpMenuItem;
    IBOutlet NSMenuItem *externalIpMenuItem2;
	IBOutlet NSMenuItem *preferencesMenuItem;
	IBOutlet NSMenuItem *quitMenuItem;
	IBOutlet NSMenuItem *aboutMenuItem;
    
	NSTimer *timer;

}

/*! Gets the workstation's internal IPaddress
 \returns IPaddress
 */
-(IPaddress*) getLocalIP;

/*! Retrieves the IP addresses and updates the UI
 \returns void
 */
-(void) update;

-(IBAction) refresh: (id) sender;
-(IBAction) about: (id) sender;
-(IBAction) preferences: (id) sender;

@end