//
//  MBPerson.h
//  Hybrid-StarWarsSearch
//
//  Created by Mitchell Budge on 7/22/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBPerson : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *name;
@property (nonatomic, copy, readonly, nonnull) NSString *birthYear;
@property (nonatomic, readonly) double height;
@property (nonatomic, copy, readonly, nonnull) NSString *eyeColor;

- (nullable instancetype)initWithName:(NSString *_Nonnull)name
                   birthYear:(NSString *_Nonnull)birthYear
                      height:(double)height
                    eyeColor:(NSString *_Nonnull)eyeColor;

- (nullable instancetype)initWithDictionary:(NSDictionary *_Nullable)dictionary;

@end

