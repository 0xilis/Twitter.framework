#import "TWTweetComposeViewController.h"

@implementation TWTweetComposeViewController
+(BOOL)canSendTweet {
 return [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
}
-(instancetype)init {
 return [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
}
-(BOOL)setInitialText:(id)text {
 return NO;
}
-(BOOL)addImage:(id)image {
 return NO;
}
-(BOOL)addURL:(id)url {
 return NO;
}
-(BOOL)removeAllImages {
 return NO;
}
-(BOOL)removeAllURLs {
 return NO;
}
-(id)completionHandler {
 return 0;
}
-(void)setCompletionHandler:(id)handler {
 return;
}
-(void)setLongitude:(CGFloat)long latitude:(CGFloat)lat name:(id)name {
 return;
}
-(id)addURLWithProxyPreviewImage:(SEL)image {
 return 0;
}
-(id)addDownSampledImageDataByProxyWithPreviewImage:(id)image {
 return 0;
}
@end
