//
//  SquadTableViewController.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/25/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComboBox.h"
#import "Tactic.h"

@interface SquadTableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate, UIPickerViewDataSource>
{
    Tactic * tactic;
    NSMutableArray * selectedCells;
    NSArray * formations;
    IBOutlet UIBarButtonItem * swapButton;
    IBOutlet UITableView * squadTable;
    IBOutlet UIPickerView * formationPicker;
    IBOutlet UIButton * useFormationButton;
}

-(IBAction)switchPlayers:(id)sender;
-(IBAction)saveSquad:(id)sender;
-(IBAction)formation:(id)sender;
-(IBAction)setFormation:(id)sender;

@property (nonatomic, strong) Tactic * tactic;
@property (nonatomic, strong) NSMutableArray * selectedCells;
@property (nonatomic, strong) NSArray * formations;
@property (nonatomic, strong) UIBarButtonItem * swapButton;
@property (nonatomic, strong) UITableView * squadTable;
@property (nonatomic, strong) UIPickerView * formationPicker;
@property (nonatomic, strong) UIButton * useFormationButton;
@end
