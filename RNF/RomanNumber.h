//
//  RomanNumber.h
//  RNF
//
//  Created by Michael Borgmann on 08/04/16.
//  Copyright © 2016 Michael Borgmann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RomanNumber : NSObject {
    NSString* _numberString;
    unsigned int _arabicNumber;
}

- (void)setNumberString:(NSString *)str;
- (NSString *)numberString;
- (void)setArabicNumber:(unsigned int)value;
- (unsigned int)arabicNumber;

- (Boolean)isValid;
- (int)convertToArabicNumber;
- (int)valueOfRomanRepresentation:(char)number;
- (NSString*)convertToRomanNumber;

@end
