//
//  DatePickerViewControllerTests.m
//  CoreDataHotel
//
//  Created by Brandon Little on 4/27/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DatePickerViewController.h"

@interface DatePickerViewControllerTests : XCTestCase

@end

@implementation DatePickerViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDatePickersExist{
    DatePickerViewController *testDatePickerVC = [[DatePickerViewController alloc]init];
    
    XCTAssert(testDatePickerVC);
    XCTAssertNotNil(testDatePickerVC.view);
    
}

@end
