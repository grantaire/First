//
//  NewCell.m
//  First
//
//  Created by Gavroche Thenardier on 04.08.13.
//  Copyright (c) 2013 Grantaire. All rights reserved.
//

#import "NewCell.h"

@implementation NewCell


// Automatically generate code for accessing the properties in .h

@synthesize loginLabel = loginLabel;
@synthesize idLabel = idLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
