//
//  AppDelegate.m
//

#import "AppDelegate.h"
#import "Router.h"
#import "ServicesFactory.h"
#import "ControllersFactory.h"
#import "ViewControllersFactory.h"
#import "MainViewController.h"

@interface AppDelegate()
@property (nonatomic) ServicesFactory *servicesFactory;
@property (nonatomic) ControllersFactory *controllersFactory;
@property (nonatomic) ViewControllersFactory *viewControllersFactory;
@property (nonatomic) MainViewController *mainViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.servicesFactory = [ServicesFactory new];
    self.controllersFactory = [[ControllersFactory alloc] initWithServicesFactory:self.servicesFactory];
    self.viewControllersFactory = [[ViewControllersFactory alloc] initWithControllersFactory:self.controllersFactory];
    
    self.mainViewController = [self.viewControllersFactory mainViewController];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:self.mainViewController];
    [self.window makeKeyAndVisible];
    
    // Test the router object
    [self buildNavigationStack];
    
    return YES;
}


- (void)buildNavigationStack
{
    UserProfileController *userProfileController = [self.controllersFactory userProfileController];
    Router *router = [[Router alloc] initWithUserProfileController:userProfileController];
    [router buildNavigationStack];
    
    [self.mainViewController navigateWithRouter:router];
}
@end
