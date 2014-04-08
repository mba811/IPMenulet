//
//  IPaddress.h
//  IPMenulet
//
//  Created by Craig Buchanan on 4/7/14.
//
//

#import <Foundation/Foundation.h>

@interface IPaddress : NSObject {
    
    NSString *address;
    
//    NSString _region;
//    NSString _region_code;

//    NSString _country;
    NSString *country_code;
    
//    NSString _latitude;
//    NSString _longitude;
    
}

-(id) initWithAddress:(NSString *)address;

+(NSString *) geocode;

@end
