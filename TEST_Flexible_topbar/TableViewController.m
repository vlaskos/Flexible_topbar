//
//  TableViewController.m
//  TEST_Flexible_topbar
//
//  Created by vlaskos on 01.04.16.
//  Copyright © 2016 vlaskos. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *tempArray;

@property (nonatomic) CGFloat currentHeight;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.tempArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tempArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *text = [self.tempArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = text;
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//     NSLog(@"scrollViewDidScroll : %f", scrollView.contentOffset.y);
    if ([self.delegate respondsToSelector:@selector(didSelectHeight:)]) {
        [self.delegate didSelectHeight:scrollView.contentOffset.y];
            }
    
}

@end