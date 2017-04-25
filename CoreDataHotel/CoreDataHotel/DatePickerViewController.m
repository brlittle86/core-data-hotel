//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Brandon Little on 4/25/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "DatePickerViewController.h"
#import "AvailabilityViewController.h"

@interface DatePickerViewController ()

@property(strong, nonatomic)UIDatePicker *startDate;
@property(strong, nonatomic)UIDatePicker *endDate;

@end

@implementation DatePickerViewController

- (void)loadView{
    [super loadView];
    
    [self setupDatePickers];
    [self setupDoneButton];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)setupDoneButton{
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    
    [self.navigationItem setRightBarButtonItem:doneButton];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupDatePickers{
    self.startDate = [[UIDatePicker alloc]init];
    self.startDate.datePickerMode = UIDatePickerModeDate;
    
    self.endDate = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDate;
    
    self.startDate.frame = CGRectMake(0, 84.0, self.view.frame.size.width, 200.0);
    self.endDate.frame = CGRectMake(0, 284.0, self.view.frame.size.width, 200.0);
    
    [self.view addSubview:self.startDate];
    [self.view addSubview:self.endDate];
}

- (void)doneButtonPressed{
    
    NSDate *startDate = self.startDate.date;
    NSDate *endDate = self.endDate.date;
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
        self.endDate.date = [NSDate date];
        return;
    }
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [startDate timeIntervalSinceReferenceDate]) {
        self.startDate.date = [NSDate date];
        return;
    }
    
    AvailabilityViewController *availabilityController = [[AvailabilityViewController alloc]init];
    availabilityController.startDate = startDate;
    availabilityController.endDate = endDate;
    
    [self.navigationController pushViewController:availabilityController animated:YES];
    
}

@end
