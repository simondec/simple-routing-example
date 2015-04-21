//
//  UserProfileController.m
//

#import "UserProfileController.h"
#import "User.h"
#import "UserProfileService.h"

@interface UserProfileController()
@property (nonatomic) UserProfileService *userProfileService;
@property (nonatomic) User *currentUser;
@end

@implementation UserProfileController
- (instancetype)initWithUserProfileService:(UserProfileService *)userProfileService
{
    if (self = [super init]) {
        self.userProfileService = userProfileService;
    }
    return self;
}

- (BOOL)isNewUser
{
    return self.currentUser.email.length == 0 || self.currentUser.password.length == 0;
}

- (void)fetchCurrentUserWithCompletion:(void (^)(BOOL success))completion
{
    NSString *currentUserID = @"MyUserID"; // Grab this from the keychain or user defaults
    [self.userProfileService fetchUserWithUserID:currentUserID completion:^(User *user, NSError *error) {
        self.currentUser = user;
        if (completion) completion(!error);
    }];
}

- (void)updateUserWithEmail:(NSString *)email password:(NSString *)password completion:(void (^)(BOOL success))completion
{
    self.currentUser.email = email;
    self.currentUser.password = password;
    [self.userProfileService updateUser:self.currentUser completion:^(NSError *error) {
        if (completion) completion(!error);
    }];
}

@end
