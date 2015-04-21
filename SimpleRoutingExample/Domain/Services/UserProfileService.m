//
//  UserProfileService.m
//

#import "UserProfileService.h"
#import "User.h"

@implementation UserProfileService
- (void)fetchUserWithUserID:(NSString *)userID completion:(void (^)(User *user, NSError *error))completion
{
    // Do some networking call and execute completion block
    User *user = [User new];
    if (completion) completion(user, nil);
}

- (void)updateUser:(User *)user completion:(void (^)(NSError *error))completion
{
    // Do some networking call and execute completion block
    if (completion) completion(nil);
}
@end
