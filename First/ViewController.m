//
//  ViewController.m
//  First
//
//  Created by Gavroche Thenardier on 04.08.13.
//  Copyright (c) 2013 Grantaire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *loginsArray;
    NSMutableArray *idArray;
}


@synthesize loginsArray = loginsArray;
@synthesize idArray = idArray;

// @synthesize loginLabel = loginLabel;
// @synthesize idLabel = idLabel;




// Метод, що корнвертує дані з JSON

- (void) methodFor: (int) page
{
    NSString *gitPage = [NSString stringWithFormat:@"https://api.github.com/gists?page=%d", page];
    
    NSData *repData = [NSData dataWithContentsOfURL: [NSURL URLWithString: gitPage]];
    
    //
    NSError *error = nil;
    
    // Converting JSON to Foundation object
    NSArray *convertedObject = [NSJSONSerialization
                                JSONObjectWithData: repData options: 0 error: &error];
    
    // Цикл, щоб зчитувались усі дані
    for (NSDictionary *user in convertedObject)
    {
        NSDictionary *userDict = [user objectForKey:@"user"];
        NSString *userID = [NSString stringWithFormat:@"%@", [userDict objectForKey:@"id"]];
        NSString *userLogin = [userDict objectForKey:@"login"];
        [idArray addObject:userID];
        [loginsArray addObject:userLogin];
    }
    
    
    
    if(error)
    {
        NSLog(@"Get error %@", error);
    }
    
    NSLog(@"%@", loginsArray);
    NSLog(@"%@", idArray);
}



// Метод, що повинен викликати methodFor для відображення даних

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Це треба, щоб зчитувалсь дані, інакше масив пустий.
    loginsArray = [NSMutableArray array];
    idArray = [NSMutableArray array];
    
    
    
    [self methodFor: 0];
}









// This method is provided by UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [loginsArray count];
}


// This method is provided by UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *firstTableIdentifier = @"Cell";
    
    NewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"Cell"];
    
    
    
    /*
    UILabel *theLoginLabel;
    UILabel *theIDLabel;
    
    theLoginLabel = (UILabel *)[cell viewWithTag:10];
    theLoginLabel.text = [loginsArray objectAtIndex:indexPath.row];
    
    theIDLabel = (UILabel *)[cell viewWithTag:11];
    theIDLabel.text = [idArray objectAtIndex:indexPath.row];
    */
    
    cell.loginLabel.text = [loginsArray objectAtIndex:indexPath.row];

    return cell;
}






// Метод, що підвантажує сторінки

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == loginsArray.count - 1)
    {
        int plus1 = loginsArray.count/30;
        
        NSLog(@"row - %d, count - %d", indexPath.row, loginsArray.count);
        
        [self methodFor: plus1];
        
        [tableView reloadData];
    }
    NSLog(@"row - %d, count - %d", indexPath.row, loginsArray.count);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
