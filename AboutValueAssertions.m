//
//  AboutAssertions.m
//  ObjectiveCKoans
//
//  Created by Joe Cannatti on 12/23/10.
//  Copyright 2010 Puppy Sound Software. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(AboutValueAssertions)

describe(@"Value Assertions", ^{
  
  it(@"can assert truth", ^{
    [[theValue(YES) should] beTrue];
  });
  
  it(@"can assert lies", ^{
    [[theValue(NO) should] beFalse];
  });
  
  context(@"can assert equality", ^{
    
    __block int actualValue;
    
    beforeEach(^{
      actualValue = 1 + 1;
    });
    
    it(@"in an ugly way", ^{
      [[theValue(actualValue == 2) should] beTrue];    
    });
    
    it(@"in a pretty way", ^{
      [[theValue(actualValue) should] equal:theValue(2)];
    });
    
  });
  
  it(@"can assert that a variable contains nil", ^{
    NSObject *object = nil;
    [object shouldBeNil];
  });
  
  it(@"can assert that a variable does not contains nil", ^{
    NSObject *object = [NSObject new];
    [object shouldNotBeNil];
  });
  
  it(@"can assert that two objects are equal", ^{
    [[@"Panda" should] equal:@"Panda"];
  });
  
  it(@"can assert that two objects are not equal", ^{
    [[@"Panda" shouldNot] equal:@"Panda1"];
  });
  
  it(@"can assert that floating point values are equal within a delta", ^{
    //NOTE: float vs double precsion is what makes this fail
    [[theValue(22.0f/7.0f) should] equal:(22.0/7.0) withDelta:0.001f];
  });
  
  it(@"can assert that a value is within a range", ^{
    [[theValue(4) should] beWithin:theValue(5) of:theValue(9)];
  });
  
  it(@"can assert that a value is less than another value", ^{
    [[theValue(4) should] beLessThan:theValue(5)];
  });
  
  it(@"can assert that a value is greater than another value", ^{
    [[theValue(4) should] beGreaterThan:theValue(3)];
  });
  
  it(@"can assert that a value is less than or equal to another value", ^{
    [[theValue(4) should] beLessThanOrEqualTo:theValue(4)];
    [[theValue(4) should] beLessThanOrEqualTo:theValue(5)];
  });
  
  it(@"can assert that a value is greater than or equal to another value", ^{
    [[theValue(4) should] beGreaterThanOrEqualTo:theValue(4)];
    [[theValue(4) should] beGreaterThanOrEqualTo:theValue(3)];
  });
  
  it(@"can assert that a value is between to values", ^{
    [[theValue(4) should] beBetween:theValue(3) and:theValue(5)];
  });  
  
  it(@"can assert two variable contain the same pointer", ^{
    //IdenticalTo checks for identical pointers
    //but the compiler is smart about this and will use the same object if you do:
    //NSString *panda = @"panda";
    //NSString *samePanda = @"panda";
    //mutableCopy is called to force a new instance and fail the test

    NSString *panda = @"panda";
    NSString *samePanda = [panda mutableCopy];
    [[panda should] beIdenticalTo:panda];
    [[panda shouldNot] beIdenticalTo:samePanda];
  });

});

SPEC_END
