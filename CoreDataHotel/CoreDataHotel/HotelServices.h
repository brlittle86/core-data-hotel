//
//  HotelServices.h
//  CoreDataHotel
//
//  Created by Brandon Little on 4/27/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface HotelServices : NSObject

+ (NSFetchedResultsController *)availableRoomsWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

@end
