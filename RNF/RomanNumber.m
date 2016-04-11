//
//  RomanNumber.m
//  RNF
//
//  Created by Michael Borgmann on 08/04/16.
//  Copyright © 2016 Michael Borgmann. All rights reserved.
//

#import "RomanNumber.h"

@implementation RomanNumber

- (void)setNumberString:(NSString *)str {
    _numberString = str;
    if ([self isValid]) {
        _arabicNumber = [self convertToArabicNumber];
        _numberString = [self convertToRomanNumber];
    }
}

- (NSString *)numberString {
    return _numberString;
}

- (void)setArabicNumber:(unsigned int)value {
    _arabicNumber = value;
    _numberString = [self convertToRomanNumber];
}

- (unsigned int)arabicNumber {
    return _arabicNumber;
}

- (Boolean)isValid {
    NSCharacterSet * set = [[NSCharacterSet characterSetWithCharactersInString:@"IVXLCDM"] invertedSet];
    if ([_numberString rangeOfCharacterFromSet:set].location != NSNotFound) {
        return false;
    } else {
        return true;
    }
}

- (int)convertToArabicNumber {
    int sum = 0;
    int previous = 0;
    bool doubleSub = false;
    
    for (int i = 0; i < _numberString.length; i++) {
        char ascii = [_numberString characterAtIndex:i];
        int number = [self valueOfRomanRepresentation:ascii];
        if (number == 0) {
            sum = 0;
            break;
        }
        sum += number;
        
        if (number == previous) {
            doubleSub = true;
        } else if (number < previous) {
            doubleSub = false;
        }
        
        if (number > previous) {
            if (doubleSub) {
                sum -= 4 * previous;
            } else {
                sum -= 2 * previous;
            }
        }
        previous = number;
    }
    return sum;
}

- (int)valueOfRomanRepresentation:(char)ascii {
    switch (ascii) {
        case 'I': return 1; break;
        case 'V': return 5; break;
        case 'X': return 10; break;
        case 'L': return 50; break;
        case 'C': return 100; break;
        case 'D': return 500; break;
        case 'M': return 1000; break;
        default: return 0;
    }
}

- (NSString*)convertToRomanNumber {
    if (_arabicNumber >= 5000) {
        return @"NUMBER TOO BIG";
    }
    
    int thousands = _arabicNumber / 1000;
    int hundreds = (_arabicNumber - thousands * 1000) / 100;
    int tens = (_arabicNumber - thousands * 1000 - hundreds * 100) / 10;
    int ones = (_arabicNumber - thousands * 1000 - hundreds * 100 - tens * 10);
    
    NSArray *romanOnes = @[@"", @"I", @"II", @"III", @"IV", @"V", @"VI", @"VII", @"VIII", @"IX"];
    NSArray *romanTens = @[@"", @"X", @"XX", @"XXX", @"XL", @"L", @"LX", @"LXX", @"LXXX", @"XC"];
    NSArray *romanHundreds = @[@"", @"C", @"CC", @"CCC", @"CD", @"D", @"DC", @"DCC", @"DCCC", @"CM"];
    NSArray *romanThousands = @[@"", @"M", @"MM", @"MMM", @"MMMM", @"", @"", @"", @"", @""];

    NSString *romanNumber = @"";
    romanNumber = [romanNumber stringByAppendingString:[romanThousands objectAtIndex:thousands]];
    romanNumber = [romanNumber stringByAppendingString:[romanHundreds objectAtIndex:hundreds]];
    romanNumber = [romanNumber stringByAppendingString:[romanTens objectAtIndex:tens]];
    romanNumber = [romanNumber stringByAppendingString:[romanOnes objectAtIndex:ones]];
    
    return romanNumber;
}

@end