//
//  Model.m
//  NorthernBelle
//
//  Created by tyms on 26/09/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import "Model.h"
#import "SingleBooking.h"


@implementation Model

-(NSString*)getImages
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/getImages"];
    //NSURL *url = [NSURL URLWithString:@"http://figtrie.appspot.com/getAllBookings"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSDictionary *params = [[NSDictionary alloc]
                            initWithObjectsAndKeys:nil];
    NSString *serverResponse = [self connection:request withParams:params callType:@"GET"];
    return serverResponse;
}


- (NSString*)loginToServer:(NSString*) username
                password:(NSString*)password
{
    NSString *un = username;
    NSString *pw = password;
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/login"];
    //NSURL *url = [NSURL URLWithString:@"http://figtrie.appspot.com/newuser"];
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
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/getAllBookings"];
    //NSURL *url = [NSURL URLWithString:@"http://figtrie.appspot.com/getAllBookings"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSDictionary *params = [[NSDictionary alloc]
                            initWithObjectsAndKeys:nil];
    NSString *result = [self connection:request withParams:params callType:@"GET"];
    SingleBooking *s = [[SingleBooking alloc]init];
    NSArray *allBookings = [s convertToBookings:result];
    return allBookings;
}

-(NSString*)makeBooking :(NSString *)customerName
            service:(NSString *)serviceBarName
        dateAndTime:(NSDate*)bookingDate
      contactNumber:(NSString*)contactNumber
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM hh:mm"];
    NSString *stringFromDate = [formatter stringFromDate:bookingDate];    // ---------------------------------------------
    // usage
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/makeBooking"];
    //NSURL *url = [NSURL URLWithString:@"http://figtrie.appspot.com/makeBooking"];

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

- (NSString*) uploadImage:(UIImage*) image
{
    UIImage *scaledImage = [self scaleImage:image toSize:CGSizeMake(320.0,480.0)];
    NSString *imageBytes = [self encodeToBase64String:scaledImage];
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/uploadphoto"];
    //NSURL *url = [NSURL URLWithString:@"http://figtrie.appspot.com/uploadphoto"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSDictionary *params = [[NSDictionary alloc]
                            initWithObjectsAndKeys:
                            imageBytes, @"photo",nil];
    
    NSString *serverResponse = [self connection:request withParams:params callType:@"POST"];
    params = nil;
    return serverResponse;

    NSLog(@"%@", imageBytes);

    return serverResponse;
}

- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
}

- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}


-(UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
