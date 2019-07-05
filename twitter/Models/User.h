//
//  User.h
//  twitter
//
//  Created by kchan23 on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

// MARK: Properties
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSString *profilePicture;
@property (strong, nonatomic) NSString *bio;
@property (strong, nonatomic) NSString *backgroundPicture;
@property (strong, nonatomic) NSString *tweetCount;
@property (strong, nonatomic) NSString *followingCount;
@property (strong, nonatomic) NSString *followersCount;

// Create initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
