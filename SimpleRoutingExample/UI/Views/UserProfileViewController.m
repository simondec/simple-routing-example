//
//  UserProfileViewController.m
//

#import "UserProfileViewController.h"
#import "UserProfileController.h"
#import "UserViewData.h"
#import "Router.h"
#import "UserCredentialsViewController.h"
#import "ViewControllersFactory.h"

@interface UserProfileViewController()
@property (nonatomic) UserProfileController *userProfileController;
@end

@implementation UserProfileViewController

- (instancetype)initWithUserProfileController:(UserProfileController *)userProfileController
{
    if (self = [super init]) {
        self.userProfileController = userProfileController;
        self.navigationItem.title = @"Profile";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Let's suppose that the userProfileViewController's view has a UIButton called 'credentialsButton'
    // [self.view.credentialsButton addTarget:self action:@selector(changeCredentialsButtonTapped:)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.userProfileController fetchCurrentUserWithCompletion:^(BOOL success) {
        NSLog(@"Current User Name: %@", self.userProfileController.currentUser.fullName);
    }];
}

- (void)changeCredentialsButtonTapped:(UIButton *)changeCredentialsButton
{
    [self navigateToCredentialsWithRouter:nil];
}

- (void)navigateWithRouter:(Router *)router
{
    NSString *nextVCKey = [router dequeueNextViewController];
    if ([nextVCKey isEqualToString:@"UserCredentialsViewController"]) {
        [self navigateToCredentialsWithRouter:router];
    }
}

- (void)navigateToCredentialsWithRouter:(Router *)router
{
    UserCredentialsViewController *nextVC = [self.viewControllersFactory userCredentialsViewController];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:nextVC];
    // UserCredentialsViewController is presented as a modal view.
    [self.navigationController presentViewController:navCtrl animated:(!router) completion:nil];
    if (router) {
        [nextVC navigateWithRouter:router];
    }
}
@end
