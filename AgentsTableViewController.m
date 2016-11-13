//
//  NOC-ListTableViewController.m
//  NOC-List
//
//  Created by Kimberly Skipper on 11/10/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "AgentsTableViewController.h"
#import "SecretAgent.h"
#import "SecretAgentDetailViewController.h"

@interface AgentsTableViewController ()

@property (nonatomic, strong) NSMutableArray *agents;

@end

@implementation AgentsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [self loadAgentDetails];

}
-(void)loadAgentDetails;

{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"NOC" ofType:@"json"];
    NSArray *nocJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    self.agents = [[NSMutableArray alloc] init];
    for (NSDictionary *nocDictionary in nocJSON)
    {
        SecretAgent *anAgent = [SecretAgent nocWithDictionary:nocDictionary];
        [self.agents addObject:anAgent];
    }
}
                    
                    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete implementation, return the number of rows

    return self.agents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AgentCell" forIndexPath:indexPath];
    
    // Configure the cell...
    SecretAgent *anAgent = self.agents[indexPath.row];
    cell.textLabel.text = anAgent.coverName;
    cell.detailTextLabel.text = anAgent.realName;
    
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"SecretAgentDetailSegue"])
    {
        SecretAgentDetailViewController *detailVC = [segue destinationViewController];
        
        UITableViewCell *selectedCell = (UITableViewCell *)sender;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell: selectedCell];
        SecretAgent *selectedSecretAgent = self.agents [indexPath.row];
        
        detailVC.secretAgent = selectedSecretAgent;
        
        
    }
    // Get the new view controller using .
    // Pass the selected object to the new view controller.
}







@end
