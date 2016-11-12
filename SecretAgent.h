//
//  NOC-List.h
//  NOC-List
//
//  Created by Kimberly Skipper on 11/10/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecretAgent : NSObject

@property (nonatomic) NSString *coverName;
@property (nonatomic) NSString *realName;
@property (assign) NSInteger accessLevel;

+ (SecretAgent *)nocWithDictionary:(NSDictionary *)nocDictionary;

@end
