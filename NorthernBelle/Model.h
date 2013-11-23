//
//  Model.h
//  NorthernBelle
//
//  Created by tyms on 26/09/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

- (NSString*)loginToServer:(NSString*) username
                password:(NSString*)password;

-(NSArray*)getAllBookings;

-(NSString*)makeBooking :(NSString *)customerName
                   service:(NSString *)serviceBarName
                   dateAndTime:(NSDate*)bookingDate
                   contactNumber:(NSString*)contactNumber;

- (NSString*)connection:(NSURLRequest *)aRequest  withParams:(NSDictionary *)aDictionary callType:(NSString *)httpCall;

@end
