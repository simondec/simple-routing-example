//
//  UserViewData.h
//

#import <Foundation/Foundation.h>

@class User;

@interface UserViewData : NSObject
- (instancetype)initWithUser:(User *)user;
@property (nonatomic, readonly) NSString *fullName;
@property (nonatomic, readonly) NSString *email;
@end
