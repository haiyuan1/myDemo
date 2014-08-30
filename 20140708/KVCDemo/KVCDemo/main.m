//
//  main.m
//  KVCDemo
//
//  Created by qingyun on 14-7-8.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Tire.h"
#import "Engine.h"
#import "Garage.h"

Car *makeCar (NSString *name, NSString *make, int m, int numberOfDoors, float mileage, int horsePower);

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Garage *garage = [[Garage alloc] init];
        garage.name = @"Joe's Garage";
        
        Car *car; car = makeCar(@"Herbie", @"Honda", 0002, 2, 110000, 58);
        [garage addCar:car];
        
//        car.engine.horsePower = 60;
//        [car setValue:@60 forKeyPath:@"engine.horsePower"];
        int horsePower = [[car valueForKeyPath:@"engine.horsePower"] intValue];
        NSLog(@"%d", horsePower);
        
        
        car = makeCar(@"Badger", @"Acura", 0003, 5, 217036.7, 130);
        [garage addCar:car];
        
        car = makeCar(@"Elvis", @"Acura", 0004, 4, 281234.3, 151);
        [garage addCar:car];
        
        car = makeCar (@"Phoenix", @"Pontiac", 005,  2, 85128.3, 345);
        [garage addCar: car];
        
        car = makeCar (@"Streaker", @"Pontiac", 89, 2, 39100.0, 36);
        [garage addCar: car];
        
        car = makeCar (@"Judge", @"Pontiac", 0030, 2, 45132.2, 370);
        [garage addCar: car];
        
        car = makeCar (@"Paper Car", @"Plymouth",0040, 2, 76800, 105);
        [garage addCar: car];
        
        [garage showGarageInfo];
        
        int nCarsCount = [[garage valueForKeyPath:@"cars.@count"] intValue];
        NSLog(@"%@'s car's count is %d", garage.name, nCarsCount);
        
        float nMiles = [[garage valueForKeyPath:@"cars.@sum.numberOfDoors"] floatValue];
        NSLog(@"%@'s car's number of doors is %f", garage.name, nMiles);
        
        float nAvgMiles = [[garage valueForKeyPath:@"cars.@avg.numberOfDoors"] floatValue];
        NSLog(@"%@'s car's avg number of doors is %f", garage.name, nAvgMiles);
        
        float minMiles = [[garage valueForKeyPath:@"cars.@min.mileage"] floatValue];
        NSLog(@"%@'s car's min mileage is %f", garage.name, minMiles);
        
        float maxMiles = [[garage valueForKeyPath:@"cars.@max.mileage"] floatValue];
        NSLog(@"%@'s car's max mileage is %f", garage.name, maxMiles); 
        
    }
    return 0;
}

Car *makeCar (NSString *name, NSString *make, int m, int numberOfDoors,float mileage, int horsepower)
        {
            Car *car = [[Car alloc] init];
            car.name = name;
            car.make = make;
            car.model = m;
            car.numberOfDoors = numberOfDoors;
            car.mileage = mileage;
            
            
            Engine *engine = [[Engine alloc] init];
            //    KVC应用
            [engine setValue: [NSNumber numberWithInt: horsepower]
                      forKey: @"horsePower"];
            
            car.engine = engine;
            // Make some tires.
            for (int i = 0; i < 4; i++)
            {
                Tire * tire= [[Tire alloc] init];
                tire.pressure = 100+i;
                [car setTire: tire atIndex: i];
            }
            return (car);
        } 

                          
