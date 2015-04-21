//
//  ViewControllersFactory.m
//

#import "ViewControllersFactory.h"
#import "BaseViewController.h"
#import "ControllersFactory.h"
#import "MainViewController.h"
#import "UserProfileViewController.h"
#import "UserCredentialsViewController.h"

@interface ViewControllersFactory()
@property (nonatomic) ControllersFactory *controllersFactory;
@end

@implementation ViewControllersFactory
- (instancetype)initWithControllersFactory:(ControllersFactory *)controllersFactory
{
    if (self = [super init]) {
        self.controllersFactory = controllersFactory;
    }
    return self;
}

- (MainViewController *)mainViewController
{
    BaseViewController *vc = [MainViewController new];
    return (MainViewController *)[self assignFactoryToViewController:vc];
}

- (UserProfileViewController *)userProfileViewController
{
    BaseViewController *vc = [[UserProfileViewController alloc] initWithUserProfileController:[self.controllersFactory userProfileController]];
    return (UserProfileViewController *)[self assignFactoryToViewController:vc];
}

- (UserCredentialsViewController *)userCredentialsViewController
{
    BaseViewController *vc = [UserCredentialsViewController new];
    return (UserCredentialsViewController *)[self assignFactoryToViewController:vc];
}

- (BaseViewController *)assignFactoryToViewController:(BaseViewController *)viewController
{
    viewController.viewControllersFactory = self;
    return viewController;
}
@end
