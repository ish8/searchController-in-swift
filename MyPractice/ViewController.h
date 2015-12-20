//
//  ViewController.h
//  MyPractice
//
//  Created by Ishani on 7/30/15.
//  Copyright (c) 2015 Ishani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating>

@property (strong,nonatomic) NSArray *candyArray;
@property (strong,nonatomic) NSMutableArray *candyFilterArray;


@property (weak, nonatomic) IBOutlet UITableView *candyTable;
@property (strong, nonatomic) UISearchController *searchController;


@end

