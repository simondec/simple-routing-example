//
//  Router.m
//

#import "Router.h"
#import "UserProfileController.h"

@interface Router()
@property (nonatomic) UserProfileController *userProfileController;
@property (nonatomic) NSMutableArray *navigationStack;
@end

@implementation Router
- (instancetype)initWithUserProfileController:(UserProfileController *)userProfileController
{
    if (self = [super init]) {
        self.userProfileController = userProfileController;
        self.navigationStack = [NSMutableArray new];
    }
    return self;
}

- (void)buildNavigationStack
{
    [self.navigationStack addObject:@"UserProfileViewController"];
    if ([self.userProfileController isNewUser]) {
        [self.navigationStack addObject:@"UserCredentialsViewController"];
    }
}

- (NSString *)dequeueNextViewController
{
    NSString *nextViewController = nil;
    if (self.navigationStack.count > 0) {
        nextViewController = [self.navigationStack firstObject];
        [self.navigationStack removeObjectAtIndex:0];
    }
    return nextViewController;
}
@end
