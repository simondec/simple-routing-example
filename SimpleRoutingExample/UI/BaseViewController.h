//
//  BaseViewController.h
//

#import <UIKit/UIKit.h>

@class ViewControllersFactory;
@class Router;

@interface BaseViewController : UIViewController
@property (nonatomic) ViewControllersFactory *viewControllersFactory;
- (void)navigateWithRouter:(Router *)router;
@end
