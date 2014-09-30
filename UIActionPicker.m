//
//  UIActionPicker.m
//  dressbook
//
//  Created by Hydra on 2014/9/30.
//  Copyright (c) 2014年 TSD-Ethan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIActionPicker.h"

@interface UIActionPicker()
{

}
@end



@implementation UIActionPicker

@synthesize delegate,myPickerView;

#define pickerHeight 288
#define buttonHeight 44

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame: [self getStandFrame:frame]];
    if (self) {
        self.myPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,buttonHeight,frame.size.width , frame.size.height)];
        self.myDoneButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-44, 0, 44, 44)];
        [self.myPickerView setDelegate:self];
        [self.myPickerView setDataSource:self];
        [self.myPickerView setBackgroundColor:[UIColor whiteColor]];
        

        [self.myDoneButton setBackgroundColor:[UIColor clearColor]];
        [self.myDoneButton addTarget:self action:@selector(myDoneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.myDoneButton setTitle:@"Done" forState:UIControlStateNormal];
        self.myDoneButton.titleLabel.textColor = [UIColor blueColor];
        [self addSubview:self.myPickerView];
        [self addSubview:self.myDoneButton];
        [self setBackgroundColor:[UIColor grayColor]];
    }
    
    return self;
}

- (void) myDoneButtonPressed:(id)sender
{
    [self removeFromSuperview];
}


- (CGRect) getStandFrame:(CGRect)frame
{
    return CGRectMake(0, frame.size.height+frame.origin.y-pickerHeight-buttonHeight, frame.size.width, pickerHeight+buttonHeight);
}

#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if( [delegate respondsToSelector:@selector(numberOfComponentsInPickerView:)] )
    {
        return [delegate numberOfComponentsInPickerView:pickerView];
    }
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if( [delegate respondsToSelector:@selector(pickerView:numberOfRowsInComponent:)] )
    {
        return [delegate pickerView:pickerView numberOfRowsInComponent:component];
    }
    return 0;
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if( [delegate respondsToSelector:@selector(pickerView:titleForRow:forComponent:)] )
    {
        return [delegate pickerView:pickerView titleForRow:row forComponent:component];
    }
    return 0;
}

// hydrated : TODO show up, close animation.

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if( [delegate respondsToSelector:@selector(pickerView:didSelectRow:inComponent:)] )
    {
        [delegate pickerView:pickerView didSelectRow:row inComponent:component];
    }
}




@end