//
//  Router.h
//

#import <Foundation/Foundation.h>

@class UserProfileController;

@interface Router : NSObject
- (instancetype)initWithUserProfileController:(UserProfileController *)userProfileController;
- (void)buildNavigationStack;
- (NSString *)dequeueNextViewController;
@end
