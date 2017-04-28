//
//  LookupReservationViewControllerTests.m
//  CoreDataHotel
//
//  Created by Brandon Little on 4/27/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LookupReservationViewController.h"

@interface LookupReservationViewControllerTests : XCTestCase

@property(strong, nonatomic)NSDate *testDate;

@end

@implementation LookupReservationViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.testDate = [[NSDate alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.testDate = nil;
    
    [super tearDown];
}

- (void)testGetDateString{
    id otherTestDate = [LookupReservationViewController getDateString:self.testDate];
    
    XCTAssert([otherTestDate isKindOfClass:[NSString class]], @"Is not NSString class type.");
    XCTAssertNoThrow(otherTestDate, @"Did throw an exception.");
    XCTAssertThrows([LookupReservationViewController getDateString:nil], @"Failed to throw exception when expected.");
}

@end
