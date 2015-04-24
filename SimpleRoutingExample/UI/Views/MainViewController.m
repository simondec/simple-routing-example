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
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Test Routing" style:UIBarButtonItemStylePlain target:self action:@selector(testRoutingButtonTapped:)];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Let's suppose that the MainViewController's view has a UIButton called 'profileButton'
    // [self.view.profileButton addTarget:self action:@selector(userProfileButtonTapped:)];
}

- (void)userProfileButtonTapped:(UIButton *)userProfileButton
{
    [self navigateToUserProfileWithRouter:nil];
}

- (void)testRoutingButtonTapped:(UIBarButtonItem *)testRoutingButton
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"simple-routing-example://test"]];
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
    // UserProfileViewController is pushed to the navigation controller stack.
    [self.navigationController pushViewController:nextVC animated:(!router)];
    if (router) {
        [nextVC navigateWithRouter:router];
    }
}
@end
