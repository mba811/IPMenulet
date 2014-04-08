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
    
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:service_url]];
    
	NSURLResponse *response=nil;
	NSError *error=nil;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    if (error) {
		return nil;
	}

    NSError *jsonParsingError = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
    
//    for (id key in [dict allKeys]) {
//        NSLog(@"%@ - %@",key,[dict objectForKey:key]);
//    }

	if (jsonParsingError) {
		return nil;
	}
    
//    IPaddress *ipAddress = [[IPaddress alloc] initWithData:[dict objectForKey:@"ip"] :[dict objectForKey:@"country_code"] :[[dict objectForKey:@"latitude"] doubleValue] :[[dict objectForKey:@"longitude"] doubleValue] ];
    
    IPaddress *ipAddress = [[IPaddress alloc] init];
    [ipAddress setIp: [dict objectForKey:@"ip"]];
    [ipAddress setCity: [dict objectForKey:@"city"]];
    [ipAddress setRegionCode: [dict objectForKey:@"region_code"]];
    [ipAddress setPostalCode: [dict objectForKey:@"zipcode"]];
    [ipAddress setCountryCode: [dict objectForKey:@"country_code"]];
    [ipAddress setLatitude: [[dict objectForKey:@"latitude"] doubleValue]];
    [ipAddress setLongitude: [[dict objectForKey:@"longitude"] doubleValue]];
    
    return [ipAddress autorelease];

}

@end