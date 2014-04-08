//
//  IPaddress.h
//  IPMenulet
//
//  Created by Craig Buchanan on 4/7/14.
//
//

#import <Foundation/Foundation.h>

@interface IPaddress : NSObject {}

@property (copy) NSString *ip;
@property (copy) NSString *city;
@property (copy) NSString *regionCode;
@property (copy) NSString *postalCode;
@property (copy) NSString *countryCode;

@property double latitude;
@property double longitude;

-(id) initWithData: (NSString*) anIP :(NSString*) aCountryCode :(double) aLatitude :(double) aLongitude;

@end
