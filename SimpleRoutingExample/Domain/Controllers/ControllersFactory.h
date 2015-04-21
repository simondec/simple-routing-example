//
//  ControllersFactory.h
//

#import <Foundation/Foundation.h>

@class ServicesFactory;
@class UserProfileController;

@interface ControllersFactory : NSObject
- (instancetype)initWithServicesFactory:(ServicesFactory *)servicesFactory;
- (UserProfileController *)userProfileController;
@end
