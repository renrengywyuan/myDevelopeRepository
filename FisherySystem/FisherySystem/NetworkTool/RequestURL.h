//
//  RequestURL.h
//
//  Created by LWY on 2019/6/26.
//  Copyright © 2019 LeiMingTech. All rights reserved.
//

#ifndef RequestURL_h

/* Product - 服务器 */
//#define API_Interface   @"http://"

/* Development - 服务器 */
#define API_Interface   @"http://27.128.162.216:1707"

// Bundle ID
#define ukuoffer_App_BundleId @"com.ukuoffer.youluwangtest"


/*************************************************************************************************API_Interface********************************************************************************************************************/

// 减员反馈 - POST
#define hr_socialSecurityDecrease  @"/socialSecurityDecrease-po/selectFeedbackOperationById"
// 通过客户id修改法人身份证和营业执照 POST
#define hr_customer_po_upCustomerFj   @"/hr-customer-po/upCustomerFj"

// 登录 POST
#define sys_login   @"/sys/login"
// 登录人信息 GET
#define sys_appLogin_loginUser   @"/appLogin/app/loginUser"

// 客户中心 - 客户信息 - 合同下载【合同中心 - 文件预览也用此接口】 GET
#define hr_record_po_downLoad   @"/hr-record-po/downLoad"


#endif /* RequestURL_h */
