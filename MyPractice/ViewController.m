//
//  ViewController.m
//  MyPractice
//
//  Created by Ishani on 7/30/15.
//  Copyright (c) 2015 Ishani. All rights reserved.
//

#import "ViewController.h"
#import "Candy.h"

@interface ViewController ()
{
    NSTimer *userInteractionTimer;
    NSInteger *sum;
}

@end

@implementation ViewController

@synthesize candyArray;
@synthesize candyFilterArray;
@synthesize searchController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    candyArray = [[NSArray alloc]initWithObjects:[Candy setCandyWith:@"jelly" and:@"yellow"],[Candy setCandyWith:@"pineapple" and:@"green"],[Candy setCandyWith:@"toffees" and:@"red"],[Candy setCandyWith:@"jems" and:@"blue"], nil];
    
    [self.candyTable setDelegate:self];
    
    searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchBar.scopeButtonTitles = [NSArray arrayWithObjects:@"scope1",@"scope2", nil];
    searchController.searchResultsUpdater = self;
    searchController.searchBar.delegate = self;
    
    
    self.candyTable.tableHeaderView = searchController.searchBar;
    [searchController.searchBar sizeToFit];
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.definesPresentationContext = YES;

    self.candyTable.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.candyTable reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//tableview delegate methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Candy *candy ;
    
    if (searchController.active) {//for searchbarcontroller
        candy = [candyFilterArray objectAtIndex:indexPath.row];
        NSMutableAttributedString *stringWithAttr = [[NSMutableAttributedString alloc]initWithString:candy.cName];
        [stringWithAttr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, searchController.searchBar.text.length)];
        
        cell.textLabel.attributedText = stringWithAttr;//[NSString stringWithFormat:@"%@",stringWithAttr];
        
    } else {//commented text is for implementing search functionalty
        candy = [candyArray objectAtIndex:indexPath.row];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = candy.cName;
        
        //[cell setBackgroundView:cc];
        [cell.contentView setUserInteractionEnabled:NO];
    }
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (searchController.active) {
        return [candyFilterArray count];
    } else {
        return [candyArray count];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)filterContentForSearchText:(NSString*)searchText{// scope:(NSInteger)scope {
    [self.candyFilterArray removeAllObjects];
    
    if(searchText.length == 0)
    {
        candyFilterArray = [candyArray mutableCopy];
    }
    else
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.cName contains[c] %@",searchText];
        candyFilterArray = [NSMutableArray arrayWithArray:[candyArray filteredArrayUsingPredicate:predicate]];
    }
}

-(void)updateSearchResultsForSearchController:(UISearchController *)mySearchController
{
    NSString *searchStr = [NSString stringWithFormat:@"%@",mySearchController.searchBar.text];
    [self filterContentForSearchText:searchStr];
    [self.candyTable reloadData];
}





@end
