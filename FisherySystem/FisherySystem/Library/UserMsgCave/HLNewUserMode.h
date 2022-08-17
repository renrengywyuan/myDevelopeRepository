//
//  HLNewUserMode.h
//  mybigbrother
//
//  Created by on 2021/8/16.
//

#import <Foundation/Foundation.h>

@interface HLNewUserMode : NSObject
/**
 用户基本信息
 */
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *salt; // 角色：超级管理员
@property (nonatomic, strong) NSString *roleIdList;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *deptId;
@property (nonatomic, strong) NSString *roleId;
@property (nonatomic, strong) NSString *isDelete;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *status;

@end

