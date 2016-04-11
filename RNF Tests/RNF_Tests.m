//
//  RNF_Tests.m
//  RNF Tests
//
//  Created by Michael Borgmann on 08/04/16.
//  Copyright © 2016 Michael Borgmann. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RomanNumber.h"

@interface RNF_Tests : XCTestCase {
    RomanNumber* romanNumber;
}

@end

@implementation RNF_Tests

- (void)setUp {
    [super setUp];
    romanNumber = [[RomanNumber alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatRomanNumberStringExists {
    romanNumber.numberString = @"MMXVI";
    XCTAssertTrue(romanNumber.numberString.length > 0, @"Instance should have a string to represent the roman number.");
}

- (void)testThatRomanNumberContainsNoInvalidCharacters {
    romanNumber.numberString = @"NO ROMAN NUMBER";
    XCTAssertFalse(romanNumber.isValid, @"The roman number string should detect invalid characters.");
}

- (void)testThatRomanNumberContainsOnlyValidCharacters {
    romanNumber.numberString = @"IVXLCDM";
    XCTAssertTrue(romanNumber.isValid, @"The roman number should accept all representational numbers.");
}

- (void)testThatEmptyRomanNumberStringConvertsToArabicNumberZero {
    romanNumber.numberString = @"";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 0, @"An empty roman number string should convert to arabic zero.");
}

- (void)testThatRomanOneRepresentArabicOne {
    romanNumber.numberString = @"I";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 1, @"Roman representation for one should convert to arabic one.");
}

- (void)testThatRomanFiveRepresentArabicFive {
    romanNumber.numberString = @"V";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 5, @"Roman representation for five should convert to arabic five.");
}

- (void)testThatRomanTenRepresentArabicTen {
    romanNumber.numberString = @"X";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 10, @"Roman representation for ten should converto to arabic ten.");
}

- (void)testThatRomanFiftyRepresentArabicFifty {
    romanNumber.numberString = @"L";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 50, @"Roman representation for fifty should converto to arabic fifty.");
}

- (void)testThatRomanHundredRepresentArabicHundred {
    romanNumber.numberString = @"C";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 100, @"Roman representation for hundred should converto to arabic hundred.");
}

- (void)testThatRomanFiveHundredRepresentArabicFiveHundred {
    romanNumber.numberString = @"D";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 500, @"Roman representation for five hundred should converto to arabic five hundred.");
}

- (void)testThatRomanThousandRepresentArabicThousand {
    romanNumber.numberString = @"M";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 1000, @"Roman representation for thousand should converto to arabic thousand.");
}

- (void)testThatMultipleRomanNumbersGetAdded {
    romanNumber.numberString = @"XX";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 20, @"Roman number hadd");
}

- (void)testCrazyNumbersGivenByMynigma {
    romanNumber.numberString = @"MMMMCXXXIII";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 4133, "MMMMCXXXIII should be 4133");
    
    romanNumber.numberString = @"CLXX";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 170, "CLXX should be 170");
    
    romanNumber.numberString = @"DCCCXVIII";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 818, "DCCCXVIII should be 818");
    
    romanNumber.numberString = @"MLXVII";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 1067, "MLXVII should be 1067");
    
    romanNumber.numberString = @"DLXXXX";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 590, "DLXXXX should be 590 (DXC)");
    
    romanNumber.numberString = @"MMDXXI";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 2521, "MMDXXI should be 2521");
    
    romanNumber.numberString = @"MMMMDLXXXXVIII";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 4598, "MMMMDLXXXXVIII should be 4598 (MMMMDXCVIII)");
    
    romanNumber.numberString = @"MXXII";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 1022, "MXXII should be 1022");
}

- (void)testThatInvalidRomanStringEqualsArabicZero {
    romanNumber.numberString = @"INVALID ROMAN NUMBER";
    XCTAssertEqual(romanNumber.convertToArabicNumber, 0, "Empty roman number should equal zero");
}

- (void)testThatArabicNumberExists {
    romanNumber.arabicNumber = 5;
    XCTAssertEqual(romanNumber.arabicNumber, 5, "Arabic number number should coexist beside roman number");
}

- (void)testThatArabicOneRepresentsRomanOne {
    romanNumber.arabicNumber = 1;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"I", "Arabic one should be represented as roman one.");
}

- (void)testThatArabicFiveRepresentsRomanFive {
    romanNumber.arabicNumber = 5;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"V", "Arabic five should be represented as roman five.");
}

- (void)testThatArabicTenRepresentsRomanTen {
    romanNumber.arabicNumber = 10;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"X", "Arabic ten should be represented as roman ten.");
}

- (void)testThatArabicFiftyRepresentsRomanFifty {
    romanNumber.arabicNumber = 50;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"L", "Arabic fifty should be represented as roman fifty.");
}

- (void)testThatArabicHundredRepresentsRomanHundred {
    romanNumber.arabicNumber = 100;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"C", "Arabic hundred should be represented as roman hundred.");
}

- (void)testThatArabicFivehundredRepresentsRomanFivehundred {
    romanNumber.arabicNumber = 500;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"D", "Arabic fivehundred should be represented as roman fivehundred.");
}

- (void)testThatArabicThousandRepresentsRomanThousand {
    romanNumber.arabicNumber = 1000;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"M", "Arabic thousand should be represented as roman thousand.");
}

- (void)testThatOnlyNumbersLess5000CanBeConvertedToRomanNumber {
    romanNumber.arabicNumber = 5000;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"NUMBER TOO BIG");
}

- (void)testThatArabicOnesRespondToRomanOnes {
    romanNumber.arabicNumber = 4;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"IV", "Conversion of arabic numbers should have correct roman ones");
}

- (void)testThatArabicTensRespondToRomanTens {
    romanNumber.arabicNumber = 40;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"XL", "Conversion of arabic number should have correct roman tens");
}

- (void)testThatArabicHundredsRespondToRomanHundreds {
    romanNumber.arabicNumber = 400;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"CD", "Conversion of arabic number should have correct roman hundreds");
}

- (void)testThatArabicThousandsRespondToRomanThousands {
    romanNumber.arabicNumber = 4000;
    XCTAssertEqual(romanNumber.convertToRomanNumber, @"MMMM", "Conversion of arabic number should have correct roman thousands");
}

- (void)testThatSettingRomanNumberAlsoSetsArabicNumber {
    romanNumber.numberString = @"CLXX";
    XCTAssertEqual(romanNumber.arabicNumber, 170, "Setting roman number should also set arabic number");
}

- (void)testThatSettingArabicNumberAlsoSetsRomanNumber {
    romanNumber.arabicNumber = 818;
    XCTAssertTrue([[romanNumber numberString] isEqualToString:@"DCCCXVIII"], "Setting arabic number should also set roman number.");
}

- (void)testThatCrazyNumbersConvertToCorrectFormat {
    romanNumber.numberString = @"DLXXXX";
    XCTAssertTrue([[romanNumber numberString] isEqualToString:@"DXC"], "DLXXXX (590) should be formatted as DXC.");
    XCTAssertEqual(romanNumber.arabicNumber, 590);

    romanNumber.numberString = @"MMMMDLXXXXVIII";
    XCTAssertTrue([[romanNumber numberString] isEqualToString:@"MMMMDXCVIII"], "MMMMDLXXXXVIII (4598) should be formatted as MMMMDXCVIII.");
    XCTAssertEqual(romanNumber.arabicNumber, 4598);
}

- (void)testDoubleSubtractionInRomanNumber {
    romanNumber.numberString = @"IIX";
    XCTAssertEqual(romanNumber.arabicNumber, 8, "Double subtraction should be possible.");
    
    romanNumber.numberString = @"XIIX";
    XCTAssertEqual(romanNumber.arabicNumber, 18, "Double subtraction should be possible.");
}

@end
