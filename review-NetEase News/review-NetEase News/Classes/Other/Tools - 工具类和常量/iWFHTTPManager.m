#import "iWFHTTPManager.h"

@implementation iWFHTTPManager

+ (instancetype)manager {
    iWFHTTPManager *mgr = [super manager];

    NSMutableSet *newSet = [NSMutableSet set];
    newSet.set = mgr.responseSerializer.acceptableContentTypes;
    [newSet addObject:@"text/html"];
    
    mgr.responseSerializer.acceptableContentTypes = newSet;
    
    return mgr;
}





@end
