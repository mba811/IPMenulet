//
//  IPaddress.m
//  IPMenulet
//
//  Created by Craig Buchanan on 4/7/14.
//
//

#import "IPaddress.h"

@implementation IPaddress

- (id) init {
    
    self = [super init];
    
    if (self != nil) {
        // initializations go here.
    }
    
    return self;
}

-(id) initWithIP: (NSString*) anIP {
    
    self = [super init];
    
    if (self) {
        
        [self setIp: anIP];
        
    }
    
    return self;
    
}

-(id) initWithIPAndAddress: (NSString*) anIP :(Address*) anAddress {

    self = [super init];

    if (self) {

        [self setIp: anIP];
        [self setAddress: anAddress];

    }

    return self;

}

- (void)dealloc {

    [_ip release];
    [_address release];
    
//    [_city release];
//	[_regionCode release];
//    [_postalCode release];
//	[_countryCode release];
    
    [super dealloc];
}

@end
