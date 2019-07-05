//
//  User.m
//  twitter
//
//  Created by kchan23 on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profilePicture = dictionary[@"profile_image_url_https"];
        self.bio = dictionary[@"description"];
        //self.backgroundPicture = dictionary[@"profile_background_image_url_https"];
        self.backgroundPicture = dictionary[@"profile_banner_url"];
        
        self.tweetCount = [NSString stringWithFormat: @"%@", dictionary[@"statuses_count"]];
        self.followingCount = [NSString stringWithFormat: @"%@", dictionary[@"friends_count"]];
        self.followersCount = [NSString stringWithFormat: @"%@", dictionary[@"followers_count"]];
    }
    return self;
}

@end
