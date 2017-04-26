//
//  BookViewController.h
//  CoreDataHotel
//
//  Created by Brandon Little on 4/25/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room+CoreDataClass.h"

@interface BookViewController : UIViewController

@property(strong, nonatomic)NSDate *startDate;
@property(strong, nonatomic)NSDate *endDate;
@property(strong, nonatomic)Room *selectedRoom;

@end
