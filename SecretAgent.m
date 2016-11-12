//
//  NOC-List.m
//  NOC-List
//
//  Created by Kimberly Skipper on 11/10/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "SecretAgent.h"

@implementation SecretAgent

+ (SecretAgent *)nocWithDictionary:(NSDictionary *)nocDictionary
{
    SecretAgent *anAgent = nil;
    if (nocDictionary)
    {
        anAgent = [[SecretAgent alloc] init];
        anAgent.coverName = nocDictionary[@"coverName"];
        anAgent.realName = nocDictionary[@"realName"];
        anAgent.accessLevel = [nocDictionary[@"accessLevel"] integerValue];
    }
    
    return anAgent;
}



@end
