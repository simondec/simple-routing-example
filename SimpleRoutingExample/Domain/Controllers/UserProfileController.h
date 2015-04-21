//
//  UserProfileController.h
//

#import <Foundation/Foundation.h>

@class UserProfileService;

@interface UserProfileController : NSObject
@property (nonatomic, readonly, getter=isNewUser) BOOL newUser;
- (instancetype)initWithUserProfileService:(UserProfileService *)userProfileService;
- (void)fetchCurrentUserWithCompletion:(void (^)(BOOL success))completion;
- (void)updateUserWithEmail:(NSString *)email password:(NSString *)password completion:(void (^)(BOOL success))completion;
@end
