//
//  MainViewController.m
//

#import "MainViewController.h"
#import "Router.h"
#import "UserProfileViewController.h"
#import "ViewControllersFactory.h"

@implementation MainViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.navigationItem.title = @"Main";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)userProfileButtonTapped:(UIButton *)userProfileButton
{
    [self navigateToUserProfileWithRouter:nil];
}

- (void)navigateWithRouter:(Router *)router
{
    NSString *nextVCKey = [router dequeueNextViewController];
    if ([nextVCKey isEqualToString:@"UserProfileViewController"]) {
        [self navigateToUserProfileWithRouter:router];
    }
}

- (void)navigateToUserProfileWithRouter:(Router *)router
{
    UserProfileViewController *nextVC = [self.viewControllersFactory userProfileViewController];
    [self.navigationController pushViewController:nextVC animated:(!router)];
    if (router) {
        [nextVC navigateWithRouter:router];
    }
}
@end
