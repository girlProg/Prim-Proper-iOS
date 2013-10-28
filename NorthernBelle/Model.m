//
//  Model.m
//  NorthernBelle
//
//  Created by tyms on 26/09/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import "Model.h"

@implementation Model

- (NSString*)loginToServer:(NSString*) username
                password:(NSString*)password
{
    NSString *un = username;
    NSString *pw = password;
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:10080/login"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSDictionary *params = [[NSDictionary alloc]
                            initWithObjectsAndKeys:
                            un, @"username",
                            pw, @"password", nil];
    NSString *response = [self connection:request withParams:params callType:@"POST"];
    if ([response isEqual: @"login Success"]){NSLog(@"logged in");}
    return response;
}


-(NSArray*)getAllBookings
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:10080/getAllBookings"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSDictionary *params = [[NSDictionary alloc]
                            initWithObjectsAndKeys:nil];
    NSString *result = [self connection:request withParams:params callType:@"GET"];
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"]"];
    NSArray *indBooknigs = [result componentsSeparatedByCharactersInSet:set];
    NSMutableArray *newbookings = [[NSMutableArray alloc]init];
    for(int i =0; i < [indBooknigs count]; i++){
        newbookings[i] = [[[indBooknigs[i] stringByReplacingOccurrencesOfString:@"[" withString:@"" ] stringByReplacingOccurrencesOfString:@"]" withString:@""] stringByReplacingOccurrencesOfString:@"\"" withString:@""];//stringByReplacingOccurrencesOfString:@" " withString:@" "];
        
    }
    return newbookings;
}

-(NSString*)makeBooking :(NSString *)customerName
            service:(NSString *)serviceBarName
        dateAndTime:(NSDate*)bookingDate
      contactNumber:(NSString*)contactNumber;
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM hh:mm"];
    NSString *stringFromDate = [formatter stringFromDate:bookingDate];    // ---------------------------------------------
    // usage
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:10080/makeBooking"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSDictionary *params = [[NSDictionary alloc]
                            initWithObjectsAndKeys:
                            customerName, @"customerName",
                            stringFromDate, @"bookingTime",
                            serviceBarName, @"service",
                            contactNumber, @"contactNumber",  nil];
    
    NSString *serverResponse = [self connection:request withParams:params callType:@"POST"];
    params = nil;
    return serverResponse;
}

- (NSString*)connection:(NSURLRequest *)aRequest
             withParams:(NSDictionary *)aDictionary
               callType:(NSString *)httpCall
{
    @try {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[aRequest URL]];
        [request setHTTPMethod:httpCall];
        NSMutableString *postString = [[NSMutableString alloc] init];
        
        if ([aDictionary count] > 0 && aDictionary != nil)
        {
            NSArray *allKeys = [aDictionary allKeys];
            for (int i = 0; i < [allKeys count]; i++)
            {
                NSString *key = [allKeys objectAtIndex:i];
                NSString *value = [aDictionary objectForKey:key];
                [postString appendFormat:( (i == 0) ? @"%@=%@" : @"&%@=%@" ), key, value];
            }
        }
        
        [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
        //NSURLConnection *k =[NSURLConnection connectionWithRequest:request delegate:self];
        NSData *data =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *returnedData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        postString = nil;
        request = nil;
        //if ([returnedData length] > 100 ){NSLog(@"Error in parsing server data");}
        return returnedData;

    }
    @catch (NSException *exception) {
        NSLog(@"CONNECTION error");
         return @"ConnectionFailed";
    }
    
}

@end
