//
//  HotelServices.h
//  CoreDataHotel
//
//  Created by Brandon Little on 4/27/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface HotelServices : NSObject

+ (NSFetchedResultsController *)availableRoomsWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

+ (void)saveNewReservationInRoom:(Room *)room
                       startDate:(NSDate *)startDate
                         endDate:(NSDate *)endDate
                       firstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                           email:(NSString *)email
         andNavigationController:(UINavigationController *)navigation;

@end
