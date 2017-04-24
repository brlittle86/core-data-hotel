//
//  HotelsViewController.m
//  CoreDataHotel
//
//  Created by Brandon Little on 4/24/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "HotelsViewController.h"
#import "AutoLayout.h"

#import "AppDelegate.h"

#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

#import "ViewController.h"

@interface HotelsViewController () <UITableViewDataSource>

@property(strong, nonatomic)NSArray *allHotels;

@property(strong, nonatomic)UITableView *tableView;

@end

@implementation HotelsViewController

- (void)loadView{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_tableView];
    
    [self setupLayout];
    
    //add tableView as subview and apply constraints
}

- (void)setupLayout{
    UIButton *cancelButton = [self createButtonWithTitle:@"Cancel"];
    
    cancelButton.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.75 alpha:1.0];
    
    [AutoLayout leadingConstraintFrom:cancelButton toView:self.view];
    [AutoLayout trailingConstraintFrom:cancelButton toView:self.view];
    
    [AutoLayout equalHeightConstraintFromView:cancelButton
                                       toView:self.view
                               withMultiplier:0.33];
    
    
    [cancelButton addTarget:self action:@selector(cancelButtonSelected) forControlEvents:UIControlEventTouchUpInside];
}

- (void)cancelButtonSelected{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSArray *)allHotels{
    
    if (!_allHotels) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotels"];
        
        NSError *fetchError;
        
        NSArray *hotels = [context executeFetchRequest:request error:&fetchError];
        
        if (fetchError) {
            NSLog(@"There was an error fetching hotels from the Core Data!");
        }
        
        _allHotels = hotels;
        
    }
    
    return _allHotels;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _allHotels.count;
}

@end
