//
//  ViewController.h
//  First
//
//  Created by Gavroche Thenardier on 04.08.13.
//  Copyright (c) 2013 Grantaire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewCell.h"


@interface ViewController : UIViewController <UITableViewDataSource, UITabBarDelegate>

- (void) methodFor: (int) page;


@property (strong, nonatomic) NSMutableArray *loginsArray;
@property (strong, nonatomic) NSMutableArray *idArray;

// @property(nonatomic, strong) IBOutlet UILabel *loginLabel;
// @property(nonatomic, strong) IBOutlet UILabel *idLabel;

@end
