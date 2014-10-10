//
//  SignUpApi.m
//  BrintDemo
//
//  Created by Pradeep on 09/10/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "SignUpApi.h"

@implementation SignUpApi

- (id)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}


#pragma mark -
#pragma mark - super class method.


- (NSString *)apiName
{
    return [NSString stringWithFormat:@"%@%@",[super apiName],kSignupApiUrl];
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    [super createJsonObjectForRequest];
    
    // Create request json object here..
    NSMutableDictionary *jsonObject = nil;
    
    return jsonObject;
}


- (void)checkForNilValues
{
    [super checkForNilValues];
}


- (id)parseJsonObjectFromResponse:(id)response
{
    [super parseJsonObjectFromResponse:response];
    
    if (response == [NSNull null]) {
        return nil;
    }
    
    if (nil != self.errormessage || self.errorCode) {
        return nil;
    }
    
    NSDictionary *responseDict = [ParserUtility JSONObjectValue:response forKey:kResult];
    
    self.statusCode = [ParserUtility JSONObjectValue:responseDict forKey:kStatusCode];
    self.errormessage = [ParserUtility JSONObjectValue:responseDict forKey:kStatusMessage];
    self.errorCode = [ParserUtility JSONObjectValue:responseDict forKey:kErrorCode];
    
    if ([response respondsToSelector:@selector(objectForKey:)]) {
    }
    
    return nil;
}


- (SignUpDetails *)parsedOffersDetails:(NSDictionary *)offersDict
{
    SignUpDetails *details = [[SignUpDetails alloc] init];
    
    return details;
}

@end
