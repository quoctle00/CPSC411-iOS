//
//  ViewController.m
//  instantEmail
//
//  Created by csuftitan on 2/1/23.
//

#import "ViewController.h"

@interface ViewController() {
    UIPickerView* emailPicker;
    NSArray* activities_;
    NSArray* feelings_;
}

@property (weak, nonatomic) IBOutlet UIPickerView *emailPicker;

@property (weak, nonatomic) IBOutlet UIButton *emailButton;

@property (weak, nonatomic) IBOutlet UITextField *notesField;

@end


@implementation ViewController

@synthesize emailPicker=emailPicker_;
@synthesize emailButton=emailButton_;
@synthesize notesField=notesField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    activities_ = [[NSArray alloc] initWithObjects:@"sleeping", @"eating", @"working", @"thinking", @"crying", @"begging", @"leaving", @"shopping", @"hello worlding", nil];
    feelings_ = [[NSArray alloc] initWithObjects:@"awesome", @"sad", @"happy", @"ambivalent", @"nauseous", @"psyched", @"confused", @"hopeful", @"anxious", nil];
    
    
}
/*
- (void)dealloc {
    [activities_ release];
    [feelings_ release];
    [super dealloc];
}
*/
#pragma mark -
#pragma mark Picker Datasource Protocol

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [activities_ count];
    }
    else {
        return [feelings_ count];
    }
}

#pragma mark -
#pragma mark Picker Delegate Protocol

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [activities_ objectAtIndex:row];
    }
    else {
        return [feelings_ objectAtIndex:row];
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark Button

- (IBAction)sendButtonTapped:(id)sender {
    NSLog(@"Email button tapped");
    
    NSString *activity = [activities_ objectAtIndex: [emailPicker selectedRowInComponent:0]];
    NSString* feeling = [feelings_ objectAtIndex: [emailPicker selectedRowInComponent:1]];
    NSString* notes = [notesField text];
    NSString* theMessage = [NSString stringWithFormat:@"I'm %@ and feeling %@ about it. %@", activity, feeling, notes];
    NSLog(@"%@", theMessage);
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"Hello Renee!"];
        [mailController setMessageBody:theMessage isHTML:NO];
        [self presentViewController:mailController animated:YES completion:nil];
    }
    else {
        NSLog(@"%@", @"Sorry, you need to setup mail first!");
    }
   
}

- (IBAction)doneEditing:(id)sender {
    [sender resignFirstResponder];
}


@end
