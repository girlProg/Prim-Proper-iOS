//
//  SingleBooking.h
//  Prim&Proper
//
//  Created by tyms on 23/11/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleBooking : NSObject

@property (nonatomic, weak) NSString *customerName;
@property (nonatomic, weak) NSString *bookingTime;
@property (nonatomic, weak) NSString *service;
@property (nonatomic, weak) NSString *contactNumber;

-(NSMutableArray*)convertToBookings: (NSString*)jsonString;

@end
