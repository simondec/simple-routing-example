//
//  ServicesFactory.h
//

#import <Foundation/Foundation.h>

@class UserProfileService;

@interface ServicesFactory : NSObject
- (UserProfileService *)userProfileService;
@end
