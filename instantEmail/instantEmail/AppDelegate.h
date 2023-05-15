//
//  AppDelegate.h
//  instantEmail
//
//  Created by csuftitan on 2/1/23.
//

#import <UIKit/UIKit.h>

@class InstaEmailViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
    InstaEmailViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet InstaEmailViewController *viewController;

@end

