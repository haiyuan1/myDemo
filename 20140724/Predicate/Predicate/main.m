//
//  main.m
//  Predicate
//
//  Created by qingyun on 14-8-4.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Engine.h"
#import "Tire.h"
#import "Garage.h"

NSPredicate* showWithHorsePower(float horsePower);

Car *makeCar (NSString *name, NSString *make, NSString *model, int modelYear, int numberOfDoors,float mileage, int horsepower)
{
    Car *car = [[[Car alloc] init] autorelease];
    car.name = name;
    car.make = make;
    car.model = model;
    car.modelYear = modelYear;
    car.numberOfDoors = numberOfDoors;
    car.mileage = mileage;
    Engine *engine = [[[Engine alloc] init] autorelease];
    [engine setValue: [NSNumber numberWithInt: horsepower]
              forKey: @"horsepower"];
    car.engine = engine;
    // Make some tires.
    for (int i = 0; i < 4; i++)
    {
        Tire * tire= [[[Tire alloc] init] autorelease];
        [car setTire: tire atIndex: i];
    }
    return (car);
} // makeCar


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Garage *garage = [[Garage alloc] init];
        garage.name = @"Joe’s Garage";
        
        Car *car;
        car = makeCar (@"Herbie", @"Honda", @"CRX", 1984, 2, 110000, 58);
        [garage addCar: car];
        
//        [garage print];
        
//       目的：要判断一辆车的名字是否是：Herbie
//        常规的做法是什么：
        /*
        if ([car.name isEqualToString:@"Herbie"]) {
            NSLog(@"YES");
        }else
        {
            NSLog(@"NO");
        }
        */
//      如果用谓词来表达，实际只需要创建一个谓词对象， 然后进行演算就可以
//        谓词的基本用法
//        这里的单引号表示的是字符串， 在谓词的语法， 如果没有单引号， 谓词演算的时候，会把它当成keyPath.
//        谓词不管多么复杂，最终结果只有YES或者NO两种
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=='Herbie'"];
//        这里实际就是来判断， 指定的这辆车的名字是不是叫做Herbie
        BOOL result = [predicate evaluateWithObject:car];
        if (result) {
            NSLog(@"YES");
        }else
        {
            NSLog(@"NO");
        }
        
        predicate = [NSPredicate predicateWithFormat:@"engine.horsepower > 150"];
        result = [predicate evaluateWithObject:car];
        if (result) {
            NSLog(@"car's engine'horse power > 100");
        }else
        {
            NSLog(@"car's engine'horsepower <= 100");
        }
        
        car = makeCar (@"Badger", @"Acura", @"Integra", 1987, 5, 217036.7, 130);
        [garage addCar: car];
        
        car = makeCar (@"ElvIs", @"Acura", @"Legend", 1989, 4, 28123.4, 151);
        [garage addCar: car];
        
        car = makeCar (@"Phoenix", @"Pontiac", @"Firebird", 1969, 2, 85128.3, 345);
        [garage addCar: car];
        
        car = makeCar (@"Streaker", @"Pontiac", @"Silver Streak", 1950, 2, 39100.0, 36);
        [garage addCar: car];
        
        car = makeCar (@"Judge", @"Pontiac", @"GTO", 1969, 2, 45132.2, 370);
        [garage addCar: car];
        
        car = makeCar (@"Paper Car", @"Plymouth", @"Valiant", 1965, 2, 76800, 105);
        [garage addCar: car];
        
        car = makeCar (@"Herbie", @"Honda", @"CRX", 1984, 2, 34000, 58);
        [garage addCar: car];
        
        [garage print];
        
        
//        取出车库里发动机马力大于150的所有的汽车
        NSArray *cars = garage.cars;
        for (Car *car in cars) {
            if ([predicate evaluateWithObject:car]) {
                NSLog(@"%@", car);
            }
        }
        
//        如果没有谓词的话
        for (Car *car in cars) {
            if (car.engine.horsepower > 150) {
                NSLog(@"%@", car);
            }
        }
//        同样实现上面的两个功能,根据谓词过滤所以满足horsepower大于150的汽车的信息
        NSArray *matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", matchCars);
        
        predicate = showWithHorsePower(150.0f);
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"111%@", matchCars);
        
        NSString *carName = @"Herbie";
        predicate = [NSPredicate predicateWithFormat:@"name == %@", carName];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"-----%@", matchCars);
        
        NSString *keyPath = @"name";
        NSString *name = @"Herbie";
        predicate = [NSPredicate predicateWithFormat:@"%K == %@", keyPath, name];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"######%@", matchCars);
        
        NSPredicate *predicateTemplate = [NSPredicate predicateWithFormat:@"name = $NAME"];
        NSDictionary *varDict = @{@"NAME":@"Herbie"};
        predicate = [predicateTemplate predicateWithSubstitutionVariables:varDict];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"$$$$$%@", matchCars);
        
        predicateTemplate = [NSPredicate predicateWithFormat:@"engine.horsepower > $POWER"];
        varDict = @{@"POWER": @150};
        predicate = [predicateTemplate predicateWithSubstitutionVariables:varDict];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"!!!!!!!!%@", matchCars);
        
        //使用比较运算符 == > < >= <= <> !=
//        还可以使用逻辑运算符 与 或 非(AND OR !)
        predicate = [NSPredicate predicateWithFormat:@"engine.horsepower < 59 OR engine.horsepower > 200"];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"----+++++++%@", matchCars);
        
        //使用字符串比较大小
        predicate = [NSPredicate predicateWithFormat:@"name < 'Newton'"];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"@@@@@@@@@@@@@@@@@@@@@:%@", matchCars);
        
        predicate = [NSPredicate predicateWithFormat:@"engine.horsepower BETWEEN {59, 200}"];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"_________%@", matchCars);
        
        //使用变量值确定区间的值
        NSArray *betweens = @[@59,@200];
        predicate = [NSPredicate predicateWithFormat:@"engine.horsepower between %@", betweens];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"-----------%@", matchCars);
        
        //使用占位符确定区间的条件
        predicateTemplate = [NSPredicate predicateWithFormat:@"engine.horsepower between $powers"];
        varDict = @{@"powers": @[@59,@200]};
        predicate = [predicateTemplate predicateWithSubstitutionVariables:varDict];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"@@@@@@@%@", matchCars);
        
        for (Car *car in cars) {
            if ([car.name isEqualToString:@"Herbie"] || [car.name isEqualToString:@"Snugs"] || [car.name isEqualToString:@"Badger"] || [car.name isEqualToString:@"Flag"]) {
                NSLog(@"%@", car);
            }
        }
        predicate = [NSPredicate predicateWithFormat:@"name in {'Herbie','Snugs','Badger','Flag'}"];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", matchCars);
        
        predicate = [NSPredicate predicateWithFormat:@"self.name in {'Herbie','Snugs','Badger','Flag'}"];
        matchCars = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", matchCars);
        
        NSArray *name1 = @[@"Herbie", @"Snugs", @"Badger", @"Flag"];
        NSArray *name2 = @[@"Judge", @"Flag", @"Badger", @"Phoenix"];
        predicate = [NSPredicate predicateWithFormat:@"self in %@", name1];
        matchCars = [name2 filteredArrayUsingPredicate:predicate];
        NSLog(@"&&&&&&%@", matchCars);
        
    }
    return 0;
}

NSPredicate* showWithHorsePower(float horsePower)
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"engine.horsepower > %f", horsePower];
    return predicate;
}

