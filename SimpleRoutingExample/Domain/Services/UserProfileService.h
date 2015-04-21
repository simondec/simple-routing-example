//
//  UserProfileService.h
//

#import <Foundation/Foundation.h>

@class User;

@interface UserProfileService : NSObject
- (void)fetchUserWithUserID:(NSString *)userID completion:(void (^)(User *user, NSError *error))completion;
- (void)updateUser:(User *)user completion:(void (^)(NSError *error))completion;
@end
