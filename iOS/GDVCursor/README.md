# README

## USAGE

### Initialization & Setup
-(instancetype)init;<br />
Initialize the view with a size of 48x48

-(instancetype)initWithSize:(CGSize)size;<br />
Initialize the view with a specific size

-(void)setSize:(CGSize)size;<br />
-(void)setOutlineColor:(UIColor*)c;<br />
-(void)setColor:(UIColor*)c;<br />
-(void)setClickedColor:(UIColor*)c;<br />

### Move
-(void)moveTo:(CGFloat)x andY:(CGFloat)y withDuration:(NSTimeInterval)duration;

### Tap
-(void)tap;<br />
-(void)longTap;<br />
-(void)longTapFor:(NSTimeInterval)duration;
