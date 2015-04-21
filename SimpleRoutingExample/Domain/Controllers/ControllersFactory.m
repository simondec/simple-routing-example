//
//  ControllersFactory.m
//

#import "ControllersFactory.h"
#import "ServicesFactory.h"
#import "UserProfileController.h"

@interface ControllersFactory()
@property (nonatomic) ServicesFactory *servicesFactory;
@property (nonatomic) UserProfileController *userProfileController;
@end

@implementation ControllersFactory
- (instancetype)initWithServicesFactory:(ServicesFactory *)servicesFactory
{
    if (self = [super init]) {
        self.servicesFactory = servicesFactory;
    }
    return self;
}

- (UserProfileController *)userProfileController
{
    if (!_userProfileController) {
        _userProfileController = [[UserProfileController alloc] initWithUserProfileService:[self.servicesFactory userProfileService]];
    }
    return _userProfileController;
}
@end
