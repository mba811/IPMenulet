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

-(id) initWithData: (NSString*) anIP :(NSString*) aCountryCode :(double) aLatitude :(double) aLongitude {

    self = [super init];
    
    if (self) {
        
        [self setIp: anIP];
        [self setCountryCode: aCountryCode];
        [self setLatitude: aLatitude];
        [self setLongitude: aLongitude];
        
    }
    
    return self;

}

- (void)dealloc {

    [_ip release];
    [_city release];
	[_regionCode release];
    [_postalCode release];
	[_countryCode release];
    
    [super dealloc];
}

@end
