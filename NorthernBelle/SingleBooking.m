//
//  SingleBooking.m
//  Prim&Proper
//
//  Created by tyms on 23/11/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import "SingleBooking.h"

@implementation SingleBooking

@synthesize customerName, bookingTime, service, contactNumber;

-(NSMutableArray*)convertToBookings: (NSString*)jsonString{
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"}"];
    NSArray *indBooknigs = [jsonString componentsSeparatedByCharactersInSet:set];
    NSMutableArray *newbookings = [[NSMutableArray alloc]init];
    
    for(int i =0; i < [indBooknigs count]; i++){
        newbookings[i] = [[[indBooknigs[i] stringByReplacingOccurrencesOfString:@"[" withString:@"" ] stringByReplacingOccurrencesOfString:@"]" withString:@""] stringByReplacingOccurrencesOfString:@"\"" withString:@""];//stringByReplacingOccurrencesOfString:@" " withString:@" "];
        
    }
    return newbookings;

}



@end
