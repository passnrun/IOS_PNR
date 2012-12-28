//
//  DatePicker.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 8/17/12.
//
//

#import <UIKit/UIKit.h>

@interface DatePicker : UIViewController
{
    UIDatePicker* datePicker;
    IBOutlet UITextField* textField;
    NSDate* data;
    NSString* format;
}

-(void) setFormat:(NSString*) format; //set the picker view items
-(NSString *) selectedDateText;
-(NSString *) dateTextInFormat: (NSString *) format;
@property (nonatomic, strong) NSDate* data;

@end
