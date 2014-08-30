//
//  QYViewController.m
//  HYXMLParserDemo
//
//  Created by qingyun on 14-7-14.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYBook.h"

static NSString * const kElementNameBook = @"book";
static NSString * const kElementNameTitle = @"title";
static NSString * const kElementNameAuthor = @"author";
static NSString * const kElementNameYear = @"year";
static NSString * const kElementNamePrice = @"price";
static NSString * const kAttributesNameBook = @"category";
static NSString * const kAttributesTitle = @"lang";

@interface QYViewController () <NSXMLParserDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *bookStore;
@property (nonatomic, retain) QYBook *currentBook;
@property (nonatomic, retain) NSString *currentValue;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSURL *xmlFileUrl = [[NSBundle mainBundle] URLForResource:@"bookstore" withExtension:@"xml"];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlFileUrl];
    xmlParser.delegate = self;
    [xmlParser parse];
}

#pragma mark - NSXMLParserDelegate

//当开始解析XML文档时调用这个方法
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.bookStore = [[NSMutableArray alloc] initWithCapacity:3];
    NSLog(@"%s", __func__);
}

//当解析器遇到xml元素时调用此方法
//第一个参数: 表示我们创建的xml解析器
//第二个参数: 表示解析时遇到的元素值
//第三个参数: 表示遇到的元素的命名空间,主要作用是区别在同一文档中,同名的标签
//第四个参数: 表示根命名空间配合使用参数
//第五个参数: 表示遇到的元素如果有属性的是属性的名字和值
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"%s", __func__);
    NSLog(@"start ElementName:%@", elementName);
    NSLog(@"attributes:%@", attributeDict);
    if ([elementName isEqualToString:kElementNameBook]) {
        self.currentBook = [[QYBook alloc] init];
        self.currentBook.category = [attributeDict objectForKey:kAttributesNameBook];
    } else if ([elementName isEqualToString:kElementNameTitle]) {
        self.currentBook.language = [attributeDict objectForKey:kAttributesTitle];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"%s", __func__);
    NSLog(@"element value is %@", string);
    self.currentValue = string;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"%@", NSStringFromSelector(@selector(parser:didEndElement:namespaceURI:qualifiedName:)));
    NSLog(@"start elementName:%@", elementName);
    if ([elementName isEqualToString:kElementNameAuthor]) {
        self.currentBook.author = self.currentValue;
    } else if ([elementName isEqualToString:kElementNamePrice]) {
        self.currentBook.price = [self.currentValue floatValue];
    } else if ([elementName isEqualToString:kElementNameYear]) {
        self.currentBook.year = self.currentValue;
    } else if ([elementName isEqualToString:kElementNameAuthor]) {
        self.currentBook.author = self.currentValue;
    } else if ([elementName isEqualToString:kElementNameTitle]) {
        self.currentBook.bookName = self.currentValue;
    } else if ([elementName isEqualToString:kElementNameBook]) {
        [self.bookStore addObject:self.currentBook];
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"%s", __func__);
    NSLog(@"%@", parseError);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"%s", __func__);
    NSLog(@"bookstore info is %@", self.bookStore);
    [self.tableView reloadData];
}

#pragma mark - tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bookStore.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify];
    }
    QYBook *book = self.bookStore[indexPath.row];
    cell.textLabel.text = book.bookName;
    cell.detailTextLabel.text = book.author;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
