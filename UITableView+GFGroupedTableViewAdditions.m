#import "UITableView+GFGroupedTableViewAdditions.h"

@interface GFGroupedTableFooterView ()

@property (nonatomic) CGFloat topMargin;
@property (nonatomic) CGFloat bottomMargin;
@property (nonatomic) CGFloat leftMargin;
@property (nonatomic) CGFloat rightMargin;

@end

@implementation GFGroupedTableFooterView

- (id)initWithText:(NSString *)text textAlignment:(UITextAlignment)textAlignment lineBreakMode:(UILineBreakMode)lineBreakMode tableView:(UITableView *)tableView
{
    const CGFloat leftMargin = 20.0f, rightMargin = 20.0f;
    const CGFloat topMargin = 10.0f, bottomMargin = 10.0f;
    
    UIFont *font = [UIFont systemFontOfSize:15.0f];
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(tableView.frame.size.width - leftMargin - rightMargin, 99999.0f) lineBreakMode:lineBreakMode];
    
    self = [super initWithFrame:CGRectMake(0, 0, 320, size.height + topMargin + bottomMargin)];
    if (!self) {
        return  nil;
    }
    _leftMargin = leftMargin;
    _rightMargin = rightMargin;
    _topMargin = topMargin;
    _bottomMargin = bottomMargin;
    _tableView = tableView;
    
    CGRect labelFrame = CGRectMake(leftMargin, topMargin, size.width, size.height);
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    
    // I grabed tableview footer text attributes from
    // http://stackoverflow.com/questions/5869344/uitableview-header-footer-font-color
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    label.font = font;
    label.shadowColor = [UIColor colorWithWhite:1.0f alpha:1.0f];
    label.shadowOffset = CGSizeMake(0.0f, 1.0f);
    label.textColor = [UIColor colorWithRed:76.0f/255.0f green:86.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
    label.lineBreakMode = lineBreakMode;
    label.textAlignment = textAlignment;
    label.numberOfLines = 0;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:label];
    _label = label;
    return self;
}

- (CGFloat)height
{
    CGSize size = [_label.text sizeWithFont:_label.font constrainedToSize:CGSizeMake(_tableView.frame.size.width - _leftMargin - _rightMargin, 99999.0f) lineBreakMode:_label.lineBreakMode];
    return size.height + _topMargin + _bottomMargin;
}

@end

@implementation UITableView (GFGroupedTableViewAdditions)

- (id)groupedFooterViewWithText:(NSString *)text textAlignment:(UITextAlignment)textAlignment lineBreakMode:(UILineBreakMode)lineBreakMode
{
    GFGroupedTableFooterView *view = [[GFGroupedTableFooterView alloc] initWithText:text textAlignment:textAlignment lineBreakMode:lineBreakMode tableView:self];
    return view;
}

- (id)groupedFooterViewWithText:(NSString *)text textAlignment:(UITextAlignment)textAlignment
{
    return [self groupedFooterViewWithText:text textAlignment:textAlignment lineBreakMode:NSLineBreakByWordWrapping];
}

@end
