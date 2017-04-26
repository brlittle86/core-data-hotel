//
//  ViewController.m
//  CoreDataHotel
//
//  Created by Brandon Little on 4/24/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "ViewController.h"
#import "AutoLayout.h"
#import "HotelsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupLayout];
    
}

- (void)setupLayout{
    
    float navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    UIButton *browseButton = [self createButtonWithTitle:@"Browse"];
    UIButton *bookButton = [self createButtonWithTitle:@"Book"];
    UIButton *lookupButton = [self createButtonWithTitle:@"Look Up"];
    
    browseButton.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.75 alpha:1.0];
    
    [AutoLayout leadingConstraintFrom:browseButton toView:self.view];
    [AutoLayout trailingConstraintFrom:browseButton toView:self.view];
    
    [AutoLayout equalHeightConstraintFromView:browseButton
                                       toView:self.view
                               withMultiplier:0.2];
    
    [browseButton addTarget:self action:@selector(browseButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)browseButtonSelected{
    HotelsViewController *newHotelsView = [[HotelsViewController alloc]init];
    
    [self.navigationController pushViewController:newHotelsView animated:YES];
}

- (UIButton *)createButtonWithTitle:(NSString *)title{
    
    UIButton *button = [[UIButton alloc]init];
    
    [button setTitle:title forState:normal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:button];
    
    return button;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
