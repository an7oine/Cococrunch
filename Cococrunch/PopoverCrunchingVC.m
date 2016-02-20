//
//  2015 Magna cum laude. PD
//

#import "PopoverCrunchingVC.h"

#import "UIPopoverController+UniversalSupport.h"
#import "DispatchTableViewController.h"

@interface PopoverCrunchingVC () <UIPopoverControllerDelegate, UITextFieldDelegate>
@end

@implementation PopoverCrunchingVC
{
	UIPopoverController *_popoverController;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPad)
	{
		self.classSwitch.on = YES;
		self.classSwitch.enabled = NO;
	}
}

- (void)gotTapGesture:(UITapGestureRecognizer *)sender
{
	DispatchTableViewController *tableVC = [[DispatchTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    tableVC.cellStyle = UITableViewCellStyleValue1;
    [tableVC setHeader:@"Header" forSection:0];
    [tableVC addChoiceIntoSection:0 withTitle:@"First row" detail:@"detail" accessoryType:UITableViewCellAccessoryCheckmark backgroundColour:nil block:^(NSIndexPath *indexPath) {
        NSLog(@"1st: indexPath %@", indexPath);
    }];
    [tableVC addChoiceIntoSection:0 withTitle:@"Second row" detail:@"detail" accessoryType:UITableViewCellAccessoryCheckmark backgroundColour:nil block:^(NSIndexPath *indexPath) {
        NSLog(@"2nd: indexPath %@", indexPath);
    }];
    [tableVC setFooter:@"Footer" forSection:0];
  
	UIPopoverController *popoverC = [[self.classSwitch.on? NSClassFromString(@"PhonePopoverController") : UIPopoverController.class alloc] initWithContentViewController:tableVC];
	popoverC.delegate = self;

	CGRect frame = CGRectInset((CGRect){ [sender locationInView:self.view], CGSizeZero }, -1.0f, -1.0f);
	[popoverC presentPopoverFromRect:frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

	// we need to retain the popover controller for as long it's visible
	_popoverController = popoverC;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (void)popoverController:(UIPopoverController *)popoverController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView *__autoreleasing *)view
{
	NSLog(@"%@ %@ %@", NSStringFromSelector(_cmd), NSStringFromCGRect(*rect), *view);
}

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
