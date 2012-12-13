//
//  GetIP.m
//  IPMenulet
//
//  Created by Andrew Pennebaker on 23 Jan 2008.
//  Copyright 2008 YelloSoft. All rights reserved.
//

#import "GetIP.h"

@implementation GetIP

+(NSString *) getIP {
	NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://highearthorbit.com/service/myip.php"]];

	NSURLResponse *response=nil;
	NSError *error=nil;
	NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

	if (error) {
		return @"?.?.?.?";
	}

	return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}

@end