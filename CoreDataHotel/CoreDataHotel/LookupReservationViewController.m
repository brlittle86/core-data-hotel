//
//  LookupReservationViewController.m
//  CoreDataHotel
//
//  Created by Brandon Little on 4/26/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "LookupReservationViewController.h"
#import "AppDelegate.h"
#import "AutoLayout.h"

#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"

#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"

#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface LookupReservationViewController () <UITableViewDataSource>

@property(strong, nonatomic)NSArray *allReservations;
@property(strong, nonatomic)UITableView *tableView;

@end

@implementation LookupReservationViewController

- (void)loadView{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]init];
    
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)allReservations{
    if (!_allReservations) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
        
        NSError *fetchError;
        
        NSArray *reservations = [context executeFetchRequest:request error:&fetchError];
        
        if (fetchError) {
            NSLog(@"There was an error fetching reservations from the Core Data!");
        }
        
        _allReservations = reservations;
    }
    
    return _allReservations;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    Reservation *reservation = self.allReservations[indexPath.row];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    
    NSString *formattedStartDateString = [dateFormatter stringFromDate:reservation.startDate];
    
    NSString *formattedEndDateString = [dateFormatter stringFromDate:reservation.endDate];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@: %@ in room: %i from %@ to %@", reservation.guest.firstName, reservation.guest.lastName, reservation.room.hotel.name, reservation.room.number, formattedStartDateString, formattedEndDateString];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allReservations count];
}

@end
