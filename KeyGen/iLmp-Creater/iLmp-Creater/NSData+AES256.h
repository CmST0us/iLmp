//
//  NSData.h
//  iLp-KeyCreater
//
//  Created by CmST0us on 15/6/11.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData(AES256)
-(NSData *) aes256_encrypt:(NSString *)key;
-(NSData *) aes256_decrypt:(NSString *)key;
@end

