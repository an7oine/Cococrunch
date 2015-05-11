//
//  DetailViewController.h
//  Cococrunch
//
//  Created by Antti Hautaniemi on 11.5.2015.
//  Copyright (c) 2015 mcl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

