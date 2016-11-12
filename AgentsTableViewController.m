//
//  NOC-ListTableViewController.m
//  NOC-List
//
//  Created by Kimberly Skipper on 11/10/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "AgentsTableViewController.h"
#import "SecretAgent.h"

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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
