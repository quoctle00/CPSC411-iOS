//
//  ViewController.h
//  instantEmail
//
//  Created by csuftitan on 2/1/23.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController
    <UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate> {
    
}

//@property (nonatomic, retain) IBOutlet UIPickerView *emailPicker;

- (IBAction) sendButtonTapped: (id) sender;

@end

