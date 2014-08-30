//
//  QYViewController.m
//  DomXMLDemo
//
//  Created by qingyun on 14-7-14.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "GDataXMLNode.h"
#import "QYBook.h"

static  NSString * const kElementNameBook = @"book";
static  NSString * const kElementNameTitle = @"title";
static  NSString * const kElementNameAutor = @"author";
static  NSString * const kElementNameYear = @"year";
static  NSString * const kElementNamePrice = @"price";
static  NSString * const kAttributesNameBook = @"category";
static  NSString * const kAttributesTitle = @"lang";

@interface QYViewController ()

@property (nonatomic, retain) NSMutableArray *bookStore;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.bookStore = [[NSMutableArray alloc] initWithCapacity:3];
    NSURL *xmlURL = [[NSBundle mainBundle] URLForResource:@"bookstore" withExtension:@"xml"];
    NSData *dataXML = [NSData dataWithContentsOfURL:xmlURL];
    NSError *error = nil;
    GDataXMLDocument *xmlDocument = [[GDataXMLDocument alloc] initWithData:dataXML options:0 error:&error];
    if (error != nil) {
        NSLog(@"Error:%@", error);
    }
    
    GDataXMLElement *rootElement = [xmlDocument rootElement];
    NSLog(@"%@", rootElement);
    
    NSArray *elements = [rootElement elementsForName:kElementNameBook];
    NSLog(@"elements is %@", elements);

    for (GDataXMLElement *element in elements) {
        QYBook *book = [[QYBook alloc] init];
        book.category = [[element attributeForName:kAttributesNameBook] stringValue];
        GDataXMLElement *titleElement = [element elementsForName:kElementNameTitle][0];
        book.bookName = [titleElement stringValue];
        book.language = [[titleElement attributeForName:kAttributesTitle] stringValue];
        
        GDataXMLElement *authorElement = [element elementsForName:kElementNameAutor][0];
        book.author = [authorElement stringValue];
        
        GDataXMLElement *yearElement = [element elementsForName:kElementNameYear][0];
        book.year = [yearElement stringValue];
        
        GDataXMLElement *priceElement = [element elementsForName:kElementNamePrice][0];
        book.price = [[priceElement stringValue] floatValue];
        
        [self.bookStore addObject:book];
        [book release],book = nil;
    }
    NSLog(@"%@", self.bookStore);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_bookStore release],_bookStore = nil;
    [super dealloc];
}

@end
