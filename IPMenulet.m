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
    [internalIpMenuItem release];
    [externalIpMenuItem release];
    [externalIpMenuItem2 release];
	[preferencesMenuItem release];
	[quitMenuItem release];
	[aboutMenuItem release];
    
	[statusItem release];
	[menu release];

	[super dealloc];

}

-(void) awakeFromNib {
    
	statusItem=[[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setMenu:menu];
	[statusItem setHighlightMode:YES];
//	[statusItem setTitle:@"?.?.?.?"];
	[statusItem setEnabled:YES];
    
    NSImage *statusImage = [NSImage imageNamed:@"icon-19x19-black.png"]; // must be 19x19 max
    [statusItem setImage:statusImage];
    NSImage *altStatusImage = [NSImage imageNamed:@"icon-19x19-white.png"];
    [statusItem setAlternateImage:altStatusImage];
    
	timer=[NSTimer scheduledTimerWithTimeInterval:300 target:self selector:@selector(update) userInfo:nil repeats:YES];
	[timer fire];

}

-(void) update {

    @autoreleasepool {

        dispatch_queue_t queue = dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        dispatch_queue_t queue = dispatch_queue_create("us.yellosoft", 0);
        
//        dispatch_sync(queue,  ^(){
//            NSLog(@"1");
//        });

        // inpternal address
        dispatch_async(queue,^(){

            [internalIpMenuItem setTitle: @"Updating..."];
            
//            NSString *localIP = [self getLocalIP];
//            [internalIpMenuItem setTitle: localIP];

            IPaddress *localIP = [self getLocalIP];
            
            [internalIpMenuItem setTitle: [NSString stringWithFormat:@"%@", [localIP ip]]];

        });
        
        // external address
        dispatch_async(queue, ^(){

            [externalIpMenuItem setTitle: @"Updating..."];
            [externalIpMenuItem2 setTitle: @"Updating..."];

            IPaddress *externalIP = [AddressService getIPaddress];
            Address *address = [externalIP address];
            
            [externalIpMenuItem setTitle: [NSString stringWithFormat:@"%@", [externalIP ip] ] ];
//            [externalIpMenuItem2 setTitle: [NSString stringWithFormat:@"%@, %@, %@", [address city], [address regionCode], [address countryCode]]];
            [externalIpMenuItem2 setTitle: [address description]];
//            [externalIpMenuItem2 setToolTip: [NSString stringWithFormat:@"%f,%f", [address latitude], [address longitude]]];
            [externalIpMenuItem2 setToolTip: [address ll]];
            
            // flag
//            NSImage *tempImage = [NSImage imageNamed: [NSString stringWithFormat:@"%@.png", [[address countryCode]lowercaseString] ] ];
            NSLog(@"icon: %@",[NSString stringWithFormat:@"%@.png", [address countryCode]]);
            
            NSImage *tempImage = [NSImage imageNamed: [NSString stringWithFormat:@"%@.png", [address countryCode] ] ];
            
            if (!tempImage) {
                tempImage = [NSImage imageNamed:@"none.png"];
            }
            
            [externalIpMenuItem2 setImage:tempImage];

        });
        
//        dispatch_barrier_sync(queue, ^(){
//            NSLog(@"done");
//        });

    }
    
}

-(IBAction) refresh: (id) sender {
	[self update];
}

-(IBAction) about: (id) sender {
    
	NSApplication *app=[NSApplication sharedApplication];
	[app activateIgnoringOtherApps:YES];
	[app orderFrontStandardAboutPanel:NULL];

}

-(IBAction) preferences: (id) sender {
    
	NSApplication *app=[NSApplication sharedApplication];
	[app activateIgnoringOtherApps:YES];
    
    //TODO: add preferences Panel
//	[app orderFrontStandardAboutPanel:NULL];
    
}

-(IBAction) map: (id) sender {

    NSMenuItem *menuItem = (NSMenuItem*)sender;
//    NSArray *ll = [[menuItem toolTip] componentsSeparatedByString:@","];
//    NSString *lat = [ll objectAtIndex: 0];
//    NSString *lng = [ll objectAtIndex: 1];
//    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://maps.apple.com/?ll=%f,%f", lat, lng]];

    // toolTip=lat,lng
    NSString *ll = [menuItem toolTip];
    
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://maps.apple.com/?ll=%@", ll]];
    
    if( ![[NSWorkspace sharedWorkspace] openURL:url] )
        NSLog(@"Failed to open url: %@",[url description]);
    
}

-(IPaddress *) getLocalIP {
    
    NSArray *addresses = [[NSHost currentHost] addresses];
    
    for (NSString *anAddress in addresses) {
        
        if (![anAddress hasPrefix:@"127"] && [[anAddress componentsSeparatedByString:@"."] count] == 4) {
            
            return[[[IPaddress alloc] initWithIP: anAddress] autorelease];
//            return anAddress;
            
            break;
            
        }
        
    }

    // no matching address
    return nil;

}

@end