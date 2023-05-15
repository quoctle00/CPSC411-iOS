//
//  ViewController.m
//  drinkmixer
//
//  Created by csuftitan on 2/13/23.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *drinks;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController
@synthesize tableView=tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    drinks = [[NSArray alloc] initWithObjects:@"Martini", @"Firecracker", @"Lemon Drop", @"Mojito", @"Manhattan", nil];
}

- (NSInteger)tableView:numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection {
    return [self.drinks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath {
    static NSString *CellIdentifier = @"tableViewCell";
    
    UITableViewCell *tbc = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (tbc == nil) {
        cell = [[[UITableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    tbc.textLabel.text = [self.drinks objectAtIndex:indexPath.row];
    return tbc;
}
@end
