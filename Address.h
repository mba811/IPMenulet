//
//  Address.h
//  IPMenulet
//
//  Created by Craig Buchanan on 4/10/14.
//
//

#import <Foundation/Foundation.h>

@interface Address : NSObject {}

@property (copy) NSString *city;
@property (copy) NSString *regionCode;
@property (copy) NSString *postalCode;
@property (copy) NSString *countryCode;

@property double latitude;
@property double longitude;

-(id) initWithData:(NSString*) aCity
                  :(NSString*) aRegionCode
                  :(NSString*) aPostalCode
                  :(NSString*) aCountryCode
                  :(double) aLatitude
                  :(double) aLongitude;

@end
