//
//  2015 Magna cum laude. PD
//

#import "GestureTabsCrunchingVC.h"


@implementation GestureTabsCrunchingVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[ @"0", @"1", @"2", @"3", @"4", @"5" ]];
	segmentedControl.selectedSegmentIndex = 0;
	[segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}
- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)sender
{
	self.transitionStyle = (gestureDrivenTabTransitionStyle_t)sender.selectedSegmentIndex;
}

@end
