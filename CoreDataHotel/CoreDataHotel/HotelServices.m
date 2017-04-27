//
//  HotelServices.m
//  CoreDataHotel
//
//  Created by Brandon Little on 4/27/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "HotelServices.h"
#import "AppDelegate.h"

#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"

@implementation HotelServices

+ (NSFetchedResultsController *)availableRoomsWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate{
    NSFetchedResultsController *rooms;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    request.predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate >= %@", endDate, startDate];
    
    NSError *roomError;
    NSArray *results = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&roomError];
    
    if (roomError) {
        NSLog(@"Error happened while retrieving all rooms from Core Date");
    }
    
    NSMutableArray *unavailableRooms = [[NSMutableArray alloc]init];
    
    for (Reservation *reservation in results) {
        [unavailableRooms addObject:reservation.room];
    }
    
    NSFetchRequest *roomRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
    roomRequest.predicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", unavailableRooms];
    
    NSSortDescriptor *roomSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"hotel.name" ascending:YES];
    NSSortDescriptor *roomNumberSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];
    
    roomRequest.sortDescriptors = @[roomSortDescriptor, roomNumberSortDescriptor];
    
    NSError *availableRoomError;
    
    rooms = [[NSFetchedResultsController alloc]initWithFetchRequest:roomRequest managedObjectContext:appDelegate.persistentContainer.viewContext sectionNameKeyPath:@"hotel.name" cacheName:nil];
    
    [rooms performFetch:&availableRoomError];
    
    return rooms;
}

@end
