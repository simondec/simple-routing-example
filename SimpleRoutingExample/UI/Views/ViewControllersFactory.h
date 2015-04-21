//
//  ViewControllersFactory.h
//

#import <UIKit/UIKit.h>

@class ControllersFactory;
@class MainViewController;
@class UserProfileViewController;
@class UserCredentialsViewController;

@interface ViewControllersFactory : NSObject
- (instancetype)initWithControllersFactory:(ControllersFactory *)controllersFactory;
- (MainViewController *)mainViewController;
- (UserProfileViewController *)userProfileViewController;
- (UserCredentialsViewController *)userCredentialsViewController;
@end
