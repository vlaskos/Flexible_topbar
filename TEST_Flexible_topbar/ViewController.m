//
//  ViewController.m
//  TEST_Flexible_topbar
//
//  Created by vlaskos on 01.04.16.
//  Copyright © 2016 vlaskos. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"


NSInteger const MaxHeight = 200;
NSInteger const MinHeight = 60;

@interface ViewController () <ChangeHeightDelegate>

@property (strong, nonatomic) IBOutlet UIView *topBar;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImage;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightConstr;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widthAvatar;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightAvatar;
@property (assign, nonatomic)  NSInteger height;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    TableViewController *vc = [TableViewController new];
    TableViewController *vc = self.childViewControllers[0];
    vc.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    
}

- (void)didSelectHeight:(NSInteger)height{
    self.height = height;
    
    self.heightConstr.constant = self.heightConstr.constant - self.height;
    
    if (self.heightConstr.constant < MinHeight) {
        self.heightConstr.constant = MinHeight;
    }
    
    if (self.heightConstr.constant > MaxHeight) {
        self.heightConstr.constant = MaxHeight;
    }
    
    if (self.heightAvatar.constant == self.heightConstr.constant/2) {
        self.avatarImage.hidden = YES;
    } else{
        self.avatarImage.hidden = NO;
    }
    
    if (self.heightConstr.constant > MinHeight) {
        self.avatarImage.hidden = NO;
    } else{
        self.avatarImage.hidden = YES;
    }
    
    self.heightAvatar.constant = self.heightConstr.constant/2;
    self.widthAvatar.constant = self.heightAvatar.constant;
    
//    NSLog(@"height %li", (long)height);
}


@end
