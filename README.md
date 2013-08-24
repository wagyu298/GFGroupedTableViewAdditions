GFGroupedTableViewAdditions
===========================

GFGroupedTableViewAdditions provides function to control the text alignment of the UITableView footer.
(This library only works with Grouped style table view, does not works with Plain style table view.)

Usage
-----

1. Add UITableView+GFGroupedTableViewAdditions.[hm] to your project.

2. Add footer view to your ViewController.

    @interface MyViewController <UITableViewDelegate>
    // ...
    @property (weak, nonatomic) IBOutlet UITableView *tableView;        // From NIB
    @property (strong, nonatomic) GFGroupedTableFooterView *footer1;    // Footer for first section
    @end

3. Initialize footer view and implement tableView:heightForFooterInSection: and tableView:viewForFooterInSection:. (If you already implemented tableView:titleForFooterInSection:, remove it first.)

    @implementation MyViewController
    // ...
    
    - (void)viewDidLoad
    {
        [super viewDidLoad];
        // ...
        // Initialize GFGroupedTableFooterView
        _footer1 = [_tableView groupedFooterViewWithText:@"FOOTER TEXT" textAlignment:UITextAlignmentLeft];
    }
    
    - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
    {
        // Returns valid height for first section
        if (section == 0)
            return [_footer1 height];
        return 0.0f;
    }
    
    - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
    {
        // Returns footer view for first section
        if (section == 0)
            return _footer1;
        return 0.0f;
    }
