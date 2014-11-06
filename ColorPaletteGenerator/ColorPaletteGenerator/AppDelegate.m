//
//  AppDelegate.m
//  ColorPaletteGenerator
//
//  Created by Ben Dalziel on 11/5/14.
//  Copyright (c) 2014 bdalziel. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    // Inspired by: http://www.midwinter-dg.com/permalink-how-I-created-a-set-of-pantone-swatches-for-the-mac-osx-color-picker_2014-08-09.html
    
    //create list
    NSColorList *list = [NSColorList.alloc initWithName:@"MyCustomPalette"];
    
    //add colors
    [list setColor:[self colorWithHexColorString:@"000000"] forKey:@"#151515"];
    [list setColor:[self colorWithHexColorString:@"151515"] forKey:@"#151515"];
    [list setColor:[self colorWithHexColorString:@"212121"] forKey:@"#212121"];
    [list setColor:[self colorWithHexColorString:@"FFFFFF"] forKey:@"#FFFFFF"];
    [list setColor:[self colorWithHexColorString:@"FDFDFD"] forKey:@"#FDFDFD"];
    [list setColor:[self colorWithHexColorString:@"FCFCFC"] forKey:@"#FCFCFC"];
    [list setColor:[self colorWithHexColorString:@"F7F7F7"] forKey:@"#F7F7F7"];
    [list setColor:[self colorWithHexColorString:@"EBEBEB"] forKey:@"#EBEBEB"];
    [list setColor:[self colorWithHexColorString:@"D8D8D8"] forKey:@"#D8D8D8"];
    [list setColor:[self colorWithHexColorString:@"CCCCCC"] forKey:@"#CCCCCC"];
    [list setColor:[self colorWithHexColorString:@"B1B1B1"] forKey:@"#B1B1B1"];
    [list setColor:[self colorWithHexColorString:@"686868"] forKey:@"#686868"];
    [list setColor:[self colorWithHexColorString:@"626262"] forKey:@"#626262"];
    [list setColor:[self colorWithHexColorString:@"505050"] forKey:@"#505050"];
    
    for (NSString *colorKey in [list allKeys]) {
        NSColor *color = [list colorWithKey:colorKey];
        NSLog(@"Color space %@: %@ r:%f g:%f b:%f", colorKey, color.colorSpaceName, color.redComponent, color.greenComponent, color.blueComponent);
    }
    
    //save file to ~/Library/Colors/
    [list writeToFile: [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Colors/"]];

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


// Pulled from: http://stackoverflow.com/a/8697241
- (NSColor*)colorWithHexColorString:(NSString*)inColorString
{
    NSColor* result = nil;
    unsigned colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner* scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode); // masks off high bits
    
    result = [NSColor
              colorWithCalibratedRed:(CGFloat)redByte / 0xff
              green:(CGFloat)greenByte / 0xff
              blue:(CGFloat)blueByte / 0xff
              alpha:1.0];
    return result;
}

@end
