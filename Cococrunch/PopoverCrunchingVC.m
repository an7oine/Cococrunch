//
//  2015 Magna cum laude. PD
//

#import "PopoverCrunchingVC.h"

#import "UIPopoverController+UniversalSupport.h"

@interface PopoverCrunchingVC () <UIPopoverControllerDelegate, UITextFieldDelegate>
@end

@implementation PopoverCrunchingVC
{
	UIPopoverController *_popoverC;
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
	UITableViewController *tableVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
	_popoverC = [[self.classSwitch.on? NSClassFromString(@"PhonePopoverController") : UIPopoverController.class alloc] initWithContentViewController:tableVC];
	_popoverC.delegate = self;

	CGRect frame = CGRectInset((CGRect){ [sender locationInView:self.view], CGSizeZero }, -1.0f, -1.0f);
	[_popoverC presentPopoverFromRect:frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
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
