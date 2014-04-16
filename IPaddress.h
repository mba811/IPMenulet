//
//  IPaddress.h
//  IPMenulet
//
//  Created by Craig Buchanan on 4/7/14.
//
//

#import <Foundation/Foundation.h>
#import "Address.h"

@interface IPaddress : NSObject {}

@property (copy) NSString *ip;
@property (retain) Address *address;

//@property (copy) NSString *city;
//@property (copy) NSString *regionCode;
//@property (copy) NSString *postalCode;
//@property (copy) NSString *countryCode;

//@property double latitude;
//@property double longitude;

/*! Creates a new IPaddress instances given the octets.
 \param anIP - 4 octects in format of XXX.XXX.XXX.XXX
 \returns id
 */
-(id) initWithIP: (NSString*) anIP;

/*! Creates a new IPaddress instances given the octets and Address instance.
 \param anIP - 4 octects in format of XXX.XXX.XXX.XXX
 \param anAddress - an Address instance
 \returns id
 */
-(id) initWithIPAndAddress: (NSString*) anIP :(Address*) anAddress;

@end
