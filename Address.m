//
//  Address.m
//  IPMenulet
//
//  Created by Craig Buchanan on 4/10/14.
//
//

#import "Address.h"

@implementation Address

-(id) initWithData:(NSString*) aCity
                  :(NSString*) aRegionCode
                  :(NSString*) aPostalCode
                  :(NSString*) aCountryCode
                  :(double) aLatitude :(double) aLongitude {

    self = [super init];
    
    if (self) {
        
        [self setCity: aCity];
        [self setRegionCode: aRegionCode];
        [self setPostalCode: aPostalCode];
        [self setCountryCode: aCountryCode];
        
        [self setLatitude: aLatitude];
        [self setLongitude: aLongitude];
        
    }
    
    return self;
    
}

- (void)dealloc {
    
    [_city release];
	[_regionCode release];
    [_postalCode release];
	[_countryCode release];
    
    [super dealloc];
}

@end
