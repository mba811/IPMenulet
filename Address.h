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
@property (copy) NSString *latitude;
@property (copy) NSString *longitude;

//@property double latitude;
//@property double longitude;

/*! Creates a new Address instances given the supplied values.
 \param aCity - a city
 \param aRegionCode - an ISO 3166-2 country subdivision codes
 \param aPostalCode - a postal code
 \param aCountryCode - an ISO 3166-1 alpha-2 county code
 \param aLatitude - the corresponding latitude
 \param aLatitude - the corresponding longitude
 \returns id
 */
-(id) initWithData:(NSString*) aCity
                  :(NSString*) aRegionCode
                  :(NSString*) aPostalCode
                  :(NSString*) aCountryCode
                  :(NSString*) aLatitude
                  :(NSString*) aLongitude;

//-(id) initWithData:(NSString*) aCity
//                  :(NSString*) aRegionCode
//                  :(NSString*) aPostalCode
//                  :(NSString*) aCountryCode
//                  :(double) aLatitude
//                  :(double) aLongitude;

/*! The string representation of the Address instance's combined latitude and longitude
 \returns NSString
 */
-(NSString*) ll;

@end
