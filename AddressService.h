//
//  AddressService.h
//  IPMenulet
//
//  Created by Craig Buchanan on 4/7/14.
//
//

#import <Cocoa/Cocoa.h>
#import "IPaddress.h"

@interface AddressService : NSObject

+(IPaddress *) getIPaddress;

@end
