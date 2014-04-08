//
//  IPaddress.m
//  IPMenulet
//
//  Created by Craig Buchanan on 4/7/14.
//
//

#import "IPaddress.h"

@implementation IPaddress

- (id) init {
    
    self = [super init];
    
    if (self != nil) {
        // initializations go here.
    }
    
    return self;
}

- (id) initWithAddress: (NSString*) anAddress {
    
    self = [super init];
    
    if (self) {
        address = anAddress;
    }
    
    return self;
}

- (void)dealloc {

    [address release];
//	[_region release];
//	[_region_code release];
//	[_country release];
	[country_code release];
//	[_latitude release];
//	[_longitude release];
    
    [super dealloc];
}

+(NSString *) geocode {

    NSURLResponse *response=nil;
	NSError *error=nil;

	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://freegeoip.net/json/"]];
    
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response data: %@", response);
    
	if (error) {
		return @"{}";
	}

    /*
     {
     "ip":"65.128.158.164",
     "country_code":"US", "country_name":"United States",
     "region_code":"MN", "region_name":"Minnesota",
     "city":"Saint Paul",
     "zipcode":"",
     "latitude":44.9444, "longitude":-93.0933,
     "metro_code":"613", "area_code":"651"
     }
     */
    
    // Parse the string into JSON
//    NSDictionary *json = [myString JSONValue];
    
    // Get the objects you want, e.g. output the second item's client id
//    NSArray *items = [json valueForKeyPath:@"data.array"];
//    country_code = [[items objectAtIndex:1] objectForKey:@"country_code"];
    
	return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];

}

@end
