//
//  AddressService.h
//  IPMenulet
//
//  Created by Craig Buchanan on 4/7/14.
//
//

#import <Cocoa/Cocoa.h>
#import "IPaddress.h"
#import "Address.h"

@interface AddressService : NSObject

/*! Gets the workstation's external IPaddress
 \returns IPaddress
 */
+(IPaddress *) getIPaddress;

@end
