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
                  :(NSString*) aLatitude :(NSString*) aLongitude {

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

/*! The string representation of the Address instance
 \returns NSString
 */
- (NSString *) description {
    
    // autorelease
//    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    
    if ([[self city] length] != 0)
        [array addObject: [self city]];
    
    if ([[self regionCode] length] !=0)
        [array addObject: [self regionCode]];
    
    if ([[self countryCode] length] !=0)
        [array addObject: [self countryCode]];

    return [array componentsJoinedByString:@", "];
    
//    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:0];
//    if ([[self city] length] != 0) {
//        [string appendFormat:@"%@, ", [self city]];
//    }
//    if ([[self regionCode] length] !=0) {
//        [string appendFormat:@"%@, ", [self regionCode]];
//    }
//    if ([[self countryCode] length] !=0) {
//        [string appendFormat:@"%@", [self countryCode]];
//    }
//    return [string autorelease];
    
//    return [NSString stringWithFormat:@"%@, %@, %@", [self city], [self regionCode], [self countryCode]];
    
}

-(NSString*) ll {
    return [NSString stringWithFormat:@"%@,%@", [self latitude], [self longitude]];
}

- (void)dealloc {
    
    [_city release];
	[_regionCode release];
    [_postalCode release];
	[_countryCode release];
	[_latitude release];
	[_longitude release];
    
    [super dealloc];
}

@end
