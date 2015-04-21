//
//  ServicesFactory.m
//

#import "ServicesFactory.h"
#import "UserProfileService.h"

@interface ServicesFactory()
@property (nonatomic) UserProfileService *userProfileService;
@end

@implementation ServicesFactory

- (instancetype)init
{
    // This class should be initialized with a HTTP client to be given to each services.
    return [super init];
}

- (UserProfileService *)userProfileService
{
    if (!_userProfileService) {
        _userProfileService = [UserProfileService new];
    }
    return _userProfileService;
}
@end
