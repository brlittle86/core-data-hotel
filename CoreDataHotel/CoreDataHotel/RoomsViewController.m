//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by Brandon Little on 4/24/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "RoomsViewController.h"

#import "AppDelegate.h"

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface RoomsViewController () <UITableViewDataSource>

@property(strong, nonatomic)NSArray *allRooms;

@property(strong, nonatomic)UITableView *tableView;

@end

@implementation RoomsViewController

- (void)loadView{
    
    [super loadView];
    
    
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _allRooms.count;
}

@end
