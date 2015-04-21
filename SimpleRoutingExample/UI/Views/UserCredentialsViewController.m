//
//  UserCredentialsViewController.m
//

#import "UserCredentialsViewController.h"
#import "Router.h"

@implementation UserCredentialsViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.navigationItem.title = @"Credentials";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonTapped:)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)navigateWithRouter:(Router *)router
{
    // We know we can't go any further in the navigation stack
}

- (void)cancelButtonTapped:(UIBarButtonItem *)cancelButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
