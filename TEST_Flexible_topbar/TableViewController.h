//
//  TableViewController.h
//  TEST_Flexible_topbar
//
//  Created by vlaskos on 01.04.16.
//  Copyright © 2016 vlaskos. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeHeightDelegate;

@interface TableViewController : UITableViewController <UIScrollViewDelegate>

@property (weak, nonatomic) id<ChangeHeightDelegate>delegate;

@end

@protocol ChangeHeightDelegate <NSObject>

- (void)didSelectHeight:(NSInteger)height;

@end
