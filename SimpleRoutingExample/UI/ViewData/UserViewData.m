//
//  UserViewData.m
//

#import "UserViewData.h"
#import "User.h"

@interface UserViewData()
@property (nonatomic) User *user;
@end

@implementation UserViewData

- (instancetype)initWithUser:(User *)user
{
    if (self = [super init]) {
        self.user = user;
    }
    return self;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.user.firstName, self.user.lastName];
}

- (NSString *)email
{
    return self.user.email;
}

@end
