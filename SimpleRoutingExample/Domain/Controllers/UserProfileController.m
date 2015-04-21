//
//  UserProfileController.m
//

#import "UserProfileController.h"
#import "User.h"
#import "UserViewData.h"
#import "UserProfileService.h"

@interface UserProfileController()
@property (nonatomic) UserProfileService *userProfileService;
@property (nonatomic) User *user;
@end

@implementation UserProfileController
- (instancetype)initWithUserProfileService:(UserProfileService *)userProfileService
{
    if (self = [super init]) {
        self.userProfileService = userProfileService;
    }
    return self;
}

- (UserViewData *)currentUser
{
    return [[UserViewData alloc] initWithUser:self.user];
}

- (BOOL)isNewUser
{
    return self.user.email.length == 0 || self.user.password.length == 0;
}

- (void)fetchCurrentUserWithCompletion:(void (^)(BOOL success))completion
{
    NSString *currentUserID = @"MyUserID"; // Grab this from the keychain or user defaults
    [self.userProfileService fetchUserWithUserID:currentUserID completion:^(User *user, NSError *error) {
        self.user = user;
        if (completion) completion(!error);
    }];
}

- (void)updateUserWithEmail:(NSString *)email password:(NSString *)password completion:(void (^)(BOOL success))completion
{
    self.user.email = email;
    self.user.password = password;
    [self.userProfileService updateUser:self.currentUser completion:^(NSError *error) {
        if (completion) completion(!error);
    }];
}

@end
