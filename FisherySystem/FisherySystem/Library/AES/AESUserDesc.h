//
//  AESUserDesc.h
//  CommonCrypto
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 Harry_L. All rights reserved.
//

#ifndef AESUserDesc_h
#define AESUserDesc_h

//for example
// 使用方法如下

NSString *key = @"dcmsdcmsdcmsdcms";
NSString *iv = @"dcmsdcmsdcmsdcms";
NSString *source = @"123456";

//String -> Data
NSData *sourceData = [source dataUsingEncoding:NSUTF8StringEncoding];
// Data -> AESEncrypt
NSData *ansix923Data = [sourceData cc_encryptUsingAlgorithm:CcCryptoAlgorithmAES key:key InitializationVector:iv Mode:CcCryptorCBCMode Padding:CcCryptorZeroPadding];
NSString *ansix923String = [ansix923Data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
NSLog(@"%@",ansix923String);

 // Data -> AESDecrypt
NSData *decryptAnsix923Data = [ansix923Data cc_decryptUsingAlgorithm:CcCryptoAlgorithmAES key:key InitializationVector:iv Mode:CcCryptorCBCMode Padding:CcCryptorZeroPadding];
NSString *decryptString = [[NSString alloc] initWithData:decryptAnsix923Data  encoding:NSUTF8StringEncoding];
NSLog(@"%@",decryptString);

/**
 ------AES加密------
 
 加密KEY(密码)：dcmsdcmsdcmsdcms
 偏移量：dcmsdcmsdcmsdcms
 数据块：128位
 加密模式：CBC
 填充：ZeroPadding
 字符集：utf8
 输出方式：base64
 
 要加密字符：123456
 输出结果：r3U/1JucgiK3Kh9x0kWrHA==
*/


#endif /* AESUserDesc_h */
