#import <UIKit/UIKit.h>

@interface GFGroupedTableFooterView : UIView

@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) UILabel *label;

- (id)initWithText:(NSString *)text textAlignment:(UITextAlignment)textAlignment lineBreakMode:(UILineBreakMode)lineBreakMode tableView:(UITableView *)tableView;
- (CGFloat)height;

@end

@interface UITableView (GFGroupedTableViewAdditions)

- (id)groupedFooterViewWithText:(NSString *)text textAlignment:(UITextAlignment)textAlignment lineBreakMode:(UILineBreakMode)lineBreakMode;
- (id)groupedFooterViewWithText:(NSString *)text textAlignment:(UITextAlignment)textAlignment;

@end
