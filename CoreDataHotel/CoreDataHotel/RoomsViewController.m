//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by Brandon Little on 4/24/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "RoomsViewController.h"

#import "AppDelegate.h"

#import "AutoLayout.h"

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface RoomsViewController () <UITableViewDataSource>

@property(strong, nonatomic)NSArray *allRooms;

@property(strong, nonatomic)UITableView *tableView;

@end

@implementation RoomsViewController

- (void)loadView{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] init];
    
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];
    
    [self setupLayout];
    
    //add tableView as subview and apply constraints
}

- (void)setupLayout{
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
}

- (NSArray *)allRooms{
    
    if (!_allRooms) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
        
        NSError *fetchError;
        
        NSArray *rooms = [context executeFetchRequest:request error:&fetchError];
        
        if (fetchError) {
            NSLog(@"There was an error fetching rooms from the Core Data!");
        }
        
        _allRooms = rooms;
    }
    
    return _allRooms;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    Room *room = self.allRooms[indexPath.row];
    NSNumber *roomNumber = [[NSNumber alloc]initWithInt:room.number];
    cell.textLabel.text = [[NSString alloc]initWithFormat:@"%@", roomNumber];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _allRooms.count;
}

@end
