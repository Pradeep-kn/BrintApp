//
//  OffersDetails.h
//  BrintDemo
//
//  Created by Tabrez on 27/09/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OffersDetails : NSObject

@property (strong, nonatomic) NSString *jewellery_type;
@property (strong, nonatomic) NSString *offer_type;
@property (strong, nonatomic) NSString *offer_discount;
@property (strong, nonatomic) NSString *making_charge_discount;
@property (strong, nonatomic) NSString *wastage_charge;
@property (strong, nonatomic) NSString *offer_on_purity;
@property (strong, nonatomic) NSString *offer_validity;
@property (strong, nonatomic) NSString *offer_image;

/*
 
{
"jewellery_type":"gold",
"offer_type":"festival",
"offer_discount":"5%",
"making_charge_discount":"3%",
"wastage_charge":"1%",
"offer_on_purity":"24k",
"offer_validity":"till 23rd ",
"offer_image":"http://brinvents.com/bin/jewels/sites/default/files/3.jpg"
}
 
 */

@end


/*
 
 [
 
 {
 "Result":{
 "errorCode":"0",
 "Result Message":"success",
 "status Code":"200",
 "offers":[
 {
 "jewellery_type":"gold",
 "offer_type":"festival",
 "offer_discount":"5%",
 "making_charge_discount":"3%",
 "wastage_charge":"1%",
 "offer_on_purity":"24k",
 "offer_validity":"till 23rd ",
 "offer_image":"http://brinvents.com/bin/jewels/sites/default/files/3.jpg"
 },
 {
 "jewellery_type":"diamond",
 "offer_type":"festival",
 "offer_discount":"5%",
 "making_charge_discount":"3%",
 "wastage_charge":"1%",
 "offer_on_purity":"10 pc",
 "offer_validity":"till 25 se",
 "offer_image":"http://brinvents.com/bin/jewels/sites/default/files/12.jpg"
 },
 {
 "jewellery_type":"silver",
 "offer_type":"festival",
 "offer_discount":"5%",
 "making_charge_discount":"3%",
 "wastage_charge":"1%",
 "offer_on_purity":"22k",
 "offer_validity":"20th aug",
 "offer_image":"http://brinvents.com/bin/jewels/sites/default/files/11.jpg"
 },
 {
 "jewellery_type":"platinum",
 "offer_type":"festival",
 "offer_discount":"5%",
 "making_charge_discount":"3%",
 "wastage_charge":"1%",
 "offer_on_purity":"20",
 "offer_validity":"20th aug",
 "offer_image":"http://brinvents.com/bin/jewels/sites/default/files/16.jpg"
 }
 ]
 }
 }
 
 ]
 
 */
