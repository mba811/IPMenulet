//
//  AddressService.m
//  IPMenulet
//
//  Created by Craig Buchanan on 4/7/14.
//
//

#import "AddressService.h"

@implementation AddressService

NSString *const service_url = @"http://freegeoip.net/json/";

+(IPaddress *) getIPaddress {
    
//    IPaddress *ipAddress;
    
//    @try {
    
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:service_url]];
    
	NSURLResponse *response=nil;
	NSError *responseError=nil;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&responseError];

//    NSLog(@"response: %@", response);
    
    if (responseError) {
        NSLog(@"error: %@", [responseError localizedFailureReason]);
		return nil;
	}

    NSError *parsingError = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parsingError];
    
    if (parsingError) {
        NSLog(@"JSON-parsing error: %@", [parsingError localizedFailureReason]);
        return nil;
    }

//    for (id key in [dict allKeys]) {
//        NSLog(@"%@ - %@",key,[dict objectForKey:key]);
//    }

//    IPaddress *ipAddress = [[IPaddress alloc] initWithData:[dict objectForKey:@"ip"] :[dict objectForKey:@"country_code"] :[[dict objectForKey:@"latitude"] doubleValue] :[[dict objectForKey:@"longitude"] doubleValue] ];
    
    IPaddress *ipAddress = [[IPaddress alloc] init];
//    ipAddress = [[IPaddress alloc] init];
    [ipAddress setIp: [dict objectForKey:@"ip"]];

//    [ipAddress setCity: [dict objectForKey:@"city"]];
//    [ipAddress setRegionCode: [dict objectForKey:@"region_code"]];
//    [ipAddress setPostalCode: [dict objectForKey:@"zipcode"]];
//    [ipAddress setCountryCode: [dict objectForKey:@"country_code"]];
//    [ipAddress setLatitude: [[dict objectForKey:@"latitude"] doubleValue]];
//    [ipAddress setLongitude: [[dict objectForKey:@"longitude"] doubleValue]];
    
    Address *address = [[Address alloc] init];
    [address setCity: [dict objectForKey:@"city"]];
    [address setRegionCode: [dict objectForKey:@"region_code"]];
    [address setPostalCode: [dict objectForKey:@"zipcode"]];
    [address setCountryCode: [dict objectForKey:@"country_code"]];
    [address setLatitude: [dict objectForKey:@"latitude"]];
    [address setLongitude: [dict objectForKey:@"longitude"]];
//    [address setLatitude: [[dict objectForKey:@"latitude"] doubleValue]];
//    [address setLongitude: [[dict objectForKey:@"longitude"] doubleValue]];

    [ipAddress setAddress: address];
    [address release];

    return [ipAddress autorelease];
        
//    }
//    @catch (NSException *exception) {
//        @throw exception;
//
//    }
//    @finally {
//        //    return [ipAddress autorelease];
//        return [ipAddress autorelease];
//    }

}

@end