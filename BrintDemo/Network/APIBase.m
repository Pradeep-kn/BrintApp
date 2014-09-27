//
//  APIBase.m
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import "APIBase.h"
#import "HelperMethods.h"

@implementation APIBase

@synthesize statusCode;
@synthesize message;
@synthesize errormessage;
@synthesize sessionId;
@synthesize errorCode;


- (id)init
{
    self = [super init];
    
    if (self) {
        self.statusCode = [NSNumber numberWithInt:-1];
        self.errorCode = [NSNumber numberWithInt:0];
        self.message = nil;
        self.errormessage = nil;
        self.sessionId = nil;
    }
    
    return self;
}


#pragma -
#pragma - mark super class method.


- (NSString *)apiName
{
    return KBaseURL;
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    return nil;
}


- (id)parseJsonObjectFromResponse:(id)response
{
    if ([response respondsToSelector:@selector(objectForKey:)]) {
        
        self.statusCode = [ParserUtility JSONObjectValue:response forKey:kStatusCode];
        self.message = [ParserUtility JSONObjectValue:response forKey:kStatusMessage];
        
        if (API_SUCESS != [statusCode integerValue]) {
            self.errormessage = [ParserUtility JSONObjectValue:response forKey:kErrorMessage];
            self.errorCode = [ParserUtility JSONObjectValue:response forKey:kErrorCode];
        }
    }
    
    return nil;
}


- (void)displayError
{
    NSString *errorMessage = self.errormessage;
    if (nil == errorMessage) {
        errorMessage = NSLocalizedString(@"serverError", @"some error in server.");
    }
    [[HelperMethods sharedInstance] showAlertWithTitle:@"" message:errorMessage];
}


- (void)checkForNilValues
{
    self.sessionId = [ParserUtility checkForNilObjectAssignEmptyValue:self.sessionId];
}


@end