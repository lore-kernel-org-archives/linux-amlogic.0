Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA96606A31B
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cJdylNYk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Acb0NIjk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jrvFmnv8m7Pa50W/hcfRDIBTjS/qjQSl9DB9RfI87pY=; b=cJdylNYkmplopCoYQ93ywnTwWc
	lwAxGbMXQ2xu52FjciF8ujy3+UrNpGSqh19QROUpAFJlpe6y1YrMcC8AI9FrOCAtDHMsljZB41Bhl
	xUVWgz7YmjovyHs+5EV63YHLhq+D5ivnIXgc3QdI/x9sJXYlpeeyMfcF7LXkQpnwXG9n+6TFOYzpG
	JLCijnrBtpuXz0sdX06RnHTBMc+yrXx6Qd9aceW39oxCL7xngZzVrSuqZ+4UroGZPWV9nTHGhVEfq
	zCy1CsdkisXCeoPgiV0JbDJKI3fg6ks/DAKqyfLmEiO/+yaF3PLZyVLXxsS0fk1a4A0fWmEeC+ejr
	rgppnMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWxo-00000004pjB-3jn2;
	Wed, 04 Nov 2026 09:07:24 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWxm-00000004phy-0eSC
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Nov 2026 09:07:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+B6y9g/nkO2Xk+HLxxhTdgFohFz4RMdN9Q3/ScC1C+LAyek1LuLBh2eKj6dVgEkT5OBu7uNwFQgPLlmX9kpUoX60KPA1NIhqj5n16BeOLTQHN4Pj6bTd07NwUU+IDxPxA2SxCBd76bsMbKkZZf/DAMyoEtFmW0IcJBrzB8WrTHtbZoBACeL+L1Xg2gPPLHy9vkl4D2yQNAFG3noIb+DH63MEimV20OzaH/vmK+RmN0F2qQddFYzBgkLUXoAsFG0NLRviqC2bWhZzTliGW4WJCRSFtdXC6PUhzyVc966VHRFoPpsoEiqU8BX5leqny3AaPrHy5d7hF5F+2ES6IVo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HICuV7lH3pDXmPd6wqQKVkamtD0Plu+bx3wEdAw08no=;
 b=D4lwVnS6Gnq114u499QtReYwAtiPkepAXlrzkwzWbiVgfwRyflV/4nPOWwE85xDMSyjdY5ZChjv1Xa4FUvHVrrWO0Fhgx/fnlTX4vyxL1aXWpWKkTPiJDErZXw+mtCzuHSu1PHc87+Wfb6+y9Xn0S9IrBQYX+L3lJdHrZLMLrekq09PnOHvEvehAlXGzdkRAffBz+mU0iOmAew09ZyDkZH59k4aolgGlq5VH20JwJZCGptPDXWjT/8yqxXeqa7BqaXHmNCSV8+VCVYhcSfm8Bc/BUIzzWn8ucIfB6l5O9wNVPq4NTxcXi/W1cXFSqkPsGIXza7rFuSraLv5CQWsShQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HICuV7lH3pDXmPd6wqQKVkamtD0Plu+bx3wEdAw08no=;
 b=Acb0NIjkxGNU3AYaBsg1ZMgcuJRrpPdDhz7VGGrPj5NXgr+sJqt+epuBpGRCJ+UbnXhSaI7hx1wHH5e5jgB0MWVNxiivZlj6VBTzA+08b3OxALVCiW1kbxhBykDJAAwzaBM+1UO603xuXWdsgwgAM5er2W8dwzRYPZle7usLIxuN1AZVjNMUsqbh6757toOvizA4123ae3lzItOO6kRtqMtoBfOwFUhrgeoyOjgTnAX9e23YqiwWFfgW1fGB/G/UXbJI4+ahQ+7JNUKJmQoyEZBbpbHlKYoEM1N8FMTtIaDTB+xVOk4TEUmlCHq/ZbWbVI0qdnLls32XLQwxJInxgw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB7507.apcprd03.prod.outlook.com (2603:1096:101:143::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 09:07:14 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 09:07:13 +0000
Message-ID: <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
Date: Wed, 4 Nov 2026 17:07:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add CLK_DIVIDER_INVALID_ZERO
 flag
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
 <sashiko-outbox-189068@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <sashiko-outbox-189068@kernel.org>
X-ClientProxiedBy: SEWP216CA0131.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::9) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 67941dd2-c96d-41fc-c893-08df3a530407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|4143699003|261022105027099003|5023799004|56012099006|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261021121427099003|261022075727099003|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: CWSL1/0g73kJjyEEQdKsGaeciR9bHLbs5YVynNmumT6sc674vkYoMYwCHhTwl7ejR6MvgQqpMVLtRexv9sqQtHj4i13rqRnfFl15QNL6XUwN3rvndOHSLixLUD4ijL89EFpRB7vuF8Ve7+DQWPzHttCaMQ2KGsRw6aCEHDFa6B/aZrKA0lJIdhzhhoK83chr+qOq+RAC9MJbuDV5NzM9xSgyjt1J80ZQusFew+CXR5h34lsyX5LwyLQsHT8hBQl1ZR61b3AT7zuYURSg/2n6CwVL/qx0xYbOp44m3LSItuERxycRGo/uZRyZuv6+/ALzH1m33p7Nsh6bIi4/eniuhXpc+VVbTYQrcTeOWPAZC+S2VPw1ZoYHJ+tUDafKNB+MbCdSDu+YEoC5aRO2wTKWFvjpn+/aw65QqoZHgoN7wpPQ2DT52oOoFGOWL9C3Z4AF7dJTWY3wKOt+P3XCtS1KCon+F3BhEldRb01Z6Qg16neCgs14YN4Ls6gwKK5byQBchZI3Znjw+ei6fYU86C1r0Nl3ky0uSgtzhXWdomk+SChvoaZXZEpR+O1DA8L1j+Puzyj9auEPfAFWKR0CKyPhuix/m9o+jSWJcoOaGpfkBns=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(261022105027099003)(5023799004)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261021121427099003)(261022075727099003)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjZnZ2pVYnNSMnFvaTZweHhsQVFJM3ZqL2pXZ3hLaW80dWx4b1JSV3ZFU3E2?=
 =?utf-8?B?aXd3OUo1QXg4UCtBT3FNRlpUbEpFc1lSaHZpT2l0ajZpaFNaNUlaenYyVlNY?=
 =?utf-8?B?VTNPK3NlM1pmOWkwOXBwNS9wdFhUMzgwWlo2SDZ3THdaekRHMHNkSkIza3R1?=
 =?utf-8?B?NEp1RTdTUlN2UlAycThhV2R2elFHRit4dmtZdmdrYUpMNnc3MzE4eGhlOEZq?=
 =?utf-8?B?bjdud0J3WHRGRmtGTXVacGJUYitoV3RTOWtRKzNzcDhubnhHZW1RdXdyRXds?=
 =?utf-8?B?SWRsUzRvM29EcTlpVXM2ajdldnFIbkZpajQxbkF1eDVuL29EUFhsUG1BMWRF?=
 =?utf-8?B?K0NVREpuK2piSWpNbTNvZDErSHJOQkdMTzVkZHFxOTJWRVRmdmdSa1pRR0NT?=
 =?utf-8?B?TW9EMHRHTXFlamZSMXRBSGNJZ3p1MkIxRkRwUU9kUEdYQ210RGl2dUVnZ3Vs?=
 =?utf-8?B?TG15UW9WMjJzSHB0RnBRL0JXVXJ2azB3d0JHbGpoTXUra0MycUgwRHBIaWhn?=
 =?utf-8?B?ekNKK0pucit0aFBJenBoSGxRTDl2bnZFZUpEbzJiWnpFMktYUCs3M1daeTR1?=
 =?utf-8?B?NHFTWVhQKzJUNWFSQW5YQzk3TGdONFRqa2pYY3hoQk9qYktueXpJbmswcktm?=
 =?utf-8?B?cGlKMCtYMjFVR1o1VDhLSXNsZ285WWs0N1gzc3RqV2dHVXJ0aTA4dmJPRUdL?=
 =?utf-8?B?ejA3K2orTlRwemRaSUtmLzBneWdnd1RKRHpVNDlScW9hNFpSdlVlSkxhUDFr?=
 =?utf-8?B?VDJYODMwUlRHaXRNaFZjejNGS25oRkpKVU9pZmFvRVBYbXo5NVJ4dzRraVVR?=
 =?utf-8?B?b0RSYzV3T2d3WVAwTEhUQmJ1V0Y5ZFFZekluakl5czNLS05xN21DZnVJemYy?=
 =?utf-8?B?RXFTZWdydk1XZG94S2xwZ3luSGlkUWk1U1YzNGZGZUxnUEs2dXNTL2ZFUkE2?=
 =?utf-8?B?TlU1cWhPOUM0SmJhN0VzQWdMb2l6VkJUaXJtcnhOQlNDdmdEZTBUTGJhNmJx?=
 =?utf-8?B?b2lIU0dhOTJNVnFYTExSdi9VVmw3YXhBVnlEdW5Hd3MyZE9DUFo3NlZ5L3V4?=
 =?utf-8?B?ZnNIY3ZJL0tTNTUyd1ZrT0JPWHIzV2taM2F6Y2s3aDhtNXdyZGhDcHRtZm1Z?=
 =?utf-8?B?bHQ2VE5MVjVxbDMvcktscjVtZUhzQm81UnR3NHcvRjlwR1VxbXAxdys4ajFK?=
 =?utf-8?B?blptNUh5SFR3MXNpRDhBaG9IYVY3SnV2S0prY0VVVGMwVyt4V0hNMC8rQ1pu?=
 =?utf-8?B?M2lRN0t0NXMva25QR0NUMG9GWXI1cFZIZ0o4SnBNQnM1eEQyTnE2YjlwZC94?=
 =?utf-8?B?VkZySHZ3bWZGYk9TeDNScFhseDc1aEtDUVROWWhjRytjQXNOSkt6THZvdzB6?=
 =?utf-8?B?dkdVNjgxSGt2U3QzUk01UVU5NW8xRHJNaVA5TXJGRi9IYmVwOWlvTWdJMFo4?=
 =?utf-8?B?SGN1REcwU2laRnNyNEJSY1NtcDNrOGNCTndyTzdDZEl0Ri9rUlk3OFJyMnlY?=
 =?utf-8?B?Qm4xN09tUkMwRGJPSkxaTDFYYUorSVFSdFh3aTdIVEI5U2V6Y0xxOEpSbXdj?=
 =?utf-8?B?S2xWYnJTRVJmUXhJajIxeUEvYTNENWFQeS9GQm9HRFYvL1hJOFhJKzdWekxF?=
 =?utf-8?B?anFJYWRQazJHbnhOOUVrMnBCVGgvV0VxMXEzMDZXaDB6WXNvMURId1lQcnZu?=
 =?utf-8?B?UDdXTGRmWGtKSCt0RXpodlJVVjgxZWJtbnRGR2RoVmhLZnFjRUt6elB0MHZS?=
 =?utf-8?B?SDZrTXJTQnh0TlRnbmJPOXcwWS8vT1NhOXFDWWNoMVJsVG1oZ1lpRytUa2lO?=
 =?utf-8?B?YzBnQktIWlN6Tk90ODRsOU1TTXErSWdMYklJMWdEY0x0OFJXY0VCczZtZ2Fm?=
 =?utf-8?B?NlVoNFd4MGZmSVJkYUwwTWkzbXcyN2Zkem9ySXRZWjlSbFRUWDVudFdaMHA4?=
 =?utf-8?B?endoampUazlZNmRBUzNFd3dEekJSQktuTTR5QUdvTUtMNUVad2RHRWR0VldE?=
 =?utf-8?B?U0NsM21iM1E0ejk1TTN4MUdNMklxNmtiOVl3L2JpbEY3V1VyRzN6cklYZ0VE?=
 =?utf-8?B?ZUVVNi9PL2NsSVlpRnduQXBxL0xsaFUrdmFsL0FQYnpqQWpaUWJVZDlDbW5o?=
 =?utf-8?B?bjg1ME01Z3lyMmNPd3NKMDc5MEIwTkxwM1pNUzBONFVzdWI5U25qOFhiWmZ2?=
 =?utf-8?B?OE9kbnlXUys4TkxnTzR4QTFvb2J5bHROUW5GTU1tWFo1NHFYN1pDOEVieGpk?=
 =?utf-8?B?dTJ2a3hseHVkbHZuR1pQK3dvdVBpZHZ4MkFXRFBUcW9CdGk2SEJnRFN3NTBh?=
 =?utf-8?B?aDlwd2RxQXJnT011NzBiS1pMK1JMeWNPNVI1WG95dHlXWlFpU0NVUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67941dd2-c96d-41fc-c893-08df3a530407
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:07:13.5734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQK2hsa35b9oKTbKt5tlXiiCqhNZmAMGowXVEIH5GJIOZtAOAhZtbep9252xjkMOebT7x2GNx7g6XHjRdHAZhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_010722_210958_05A96E65 
X-CRM114-Status: GOOD (  18.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ck9uIDEwLzI5LzIwMjYgNTo0NyBQTSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToKPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAx
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoKPiAtIFtIaWdoXSBjbGs6IGRpdmlkZXI6
IHVuaGFuZGxlZCB6ZXJvIGRpdmlzb3IgaW4gZGl2aWRlcl9yb19kZXRlcm1pbmVfcmF0ZSgpCj4g
LS0KPgo+IGNvbW1pdCA1ZWMzMTE4YWVlMmYwMzg1NTU1MmM1OGE0YTg1MzNlMDM1YjU2NWJjCj4g
QXV0aG9yOiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+Cj4gY2xrOiBkaXZpZGVyOiBh
ZGQgQ0xLX0RJVklERVJfSU5WQUxJRF9aRVJPIGZsYWcKPgo+IFRoaXMgY29tbWl0IGludHJvZHVj
ZXMgdGhlIENMS19ESVZJREVSX0lOVkFMSURfWkVSTyBmbGFnIGZvciBkaXZpZGVycyB3aGVyZQo+
IGEgemVybyBkaXZpc29yIHZhbHVlIHJlcHJlc2VudHMgYW4gaW52YWxpZCBoYXJkd2FyZSBzdGF0
ZSByYXRoZXIgdGhhbiBhCj4gcGFzcy10aHJvdWdoLiBXaGVuIHRoaXMgZmxhZyBpcyBzZXQgYW5k
IHRoZSBkaXZpc29yIGV2YWx1YXRlcyB0byB6ZXJvLAo+IGRpdmlkZXJfcmVjYWxjX3JhdGUoKSBy
ZXR1cm5zIDAgd2l0aG91dCBlbWl0dGluZyBhIHdhcm5pbmcuCj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL2Nsay1kaXZpZGVyLmMgYi9kcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jCj4+IGlu
ZGV4IGY2ODIxNmM2NWQzZGYuLjZjMTUyM2QyMjQ3N2MgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Y2xrL2Nsay1kaXZpZGVyLmMKPj4gKysrIGIvZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYwo+PiBA
QCAtMTQzLDYgKzE0Myw5IEBAIHVuc2lnbmVkIGxvbmcgZGl2aWRlcl9yZWNhbGNfcmF0ZShzdHJ1
Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyBwYXJlbnRfcmF0ZSwKPj4KPj4gICAgICAgIGRp
diA9IF9nZXRfZGl2KHRhYmxlLCB2YWwsIGZsYWdzLCB3aWR0aCk7Cj4+ICAgICAgICBpZiAoIWRp
dikgewo+PiArICAgICAgICAgICAgIGlmIChmbGFncyAmIENMS19ESVZJREVSX0lOVkFMSURfWkVS
TykKPj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+IFtTZXZlcml0eTogSGlnaF0K
PiBTaG91bGQgZGl2aWRlcl9yb19kZXRlcm1pbmVfcmF0ZSgpIGluIGRyaXZlcnMvY2xrL2Nsay1k
aXZpZGVyLmMgYWxzbyBoYW5kbGUKPiBhIHplcm8gZGl2aXNvciB3aGVuIENMS19ESVZJREVSX0lO
VkFMSURfWkVSTyBvciBDTEtfRElWSURFUl9BTExPV19aRVJPIGlzCj4gc2V0Pwo+Cj4gV2hlbiBh
IHJlYWQtb25seSBkaXZpZGVyIGhhcyBhIHJlZ2lzdGVyIHZhbHVlIHZhbCB0aGF0IG1hcHMgdG8g
ZGl2ID09IDAgdmlhCj4gX2dldF9kaXYoKSAoZm9yIGV4YW1wbGUsIHdoZW4gQ0xLX0RJVklERVJf
SU5WQUxJRF9aRVJPIGlzIGNvbWJpbmVkIHdpdGgKPiBDTEtfRElWSURFUl9PTkVfQkFTRUQgb3Ig
YW4gdW5tYXBwZWQgdGFibGUgZW50cnkgYWxvbmdzaWRlCj4gQ0xLX0RJVklERVJfUkVBRF9PTkxZ
KSwgY2FsbGluZyBjbGtfcm91bmRfcmF0ZSgpIG9yIGNsa19zZXRfcmF0ZSgpIGludm9rZXMKPiBj
bGtfZGl2aWRlcl9kZXRlcm1pbmVfcmF0ZSgpLT5kaXZpZGVyX3JvX2RldGVybWluZV9yYXRlKCk6
Cj4KPiBkcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jOmRpdmlkZXJfcm9fZGV0ZXJtaW5lX3JhdGUo
KSB7Cj4gICAgICAgICAgaW50IGRpdjsKPgo+ICAgICAgICAgIGRpdiA9IF9nZXRfZGl2KHRhYmxl
LCB2YWwsIGZsYWdzLCB3aWR0aCk7Cj4KPiAgICAgICAgICAvKiBFdmVuIGEgcmVhZC1vbmx5IGNs
b2NrIGNhbiBwcm9wYWdhdGUgYSByYXRlIGNoYW5nZSAqLwo+ICAgICAgICAgIGlmIChjbGtfaHdf
Z2V0X2ZsYWdzKGh3KSAmIENMS19TRVRfUkFURV9QQVJFTlQpIHsKPiAgICAgICAgICAgICAgICAg
IGlmICghcmVxLT5iZXN0X3BhcmVudF9odykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4KPiAgICAgICAgICAgICAgICAgIHJlcS0+YmVzdF9wYXJlbnRfcmF0ZSA9
IGNsa19od19yb3VuZF9yYXRlKHJlcS0+YmVzdF9wYXJlbnRfaHcsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXEtPnJhdGUgKiBk
aXYpOwo+ICAgICAgICAgIH0KPgo+ICAgICAgICAgIHJlcS0+cmF0ZSA9IERJVl9ST1VORF9VUF9V
TEwoKHU2NClyZXEtPmJlc3RfcGFyZW50X3JhdGUsIGRpdik7Cj4KPiAgICAgICAgICByZXR1cm4g
MDsKPiB9Cj4KPiBVbmxpa2UgZGl2aWRlcl9yZWNhbGNfcmF0ZSgpLCBkaXZpZGVyX3JvX2RldGVy
bWluZV9yYXRlKCkgZG9lcyBub3QgY2hlY2sgZm9yCj4gIWRpdiBiZWZvcmUgY2FsbGluZyBESVZf
Uk9VTkRfVVBfVUxMKCksIHdoaWNoIHdpbGwgdHJpZ2dlciBhIGRpdmlzaW9uIGJ5IHplcm8KPiBp
biB0aGUga2VybmVsIHdoZW4gZGl2IGlzIDAuCgoKSW4gdGhpcyBwYXRjaCwgdGhlIGRpdmlkZXJz
IHdoaWNoIHNldCBDTEtfRElWSURFUl9JTlZBTElEX1pFUk8gdXNlIApkaXZpZGVyX2RldGVybWlu
ZV9yYXRlKCksCgpub3QgZGl2aWRlcl9yb19kZXRlcm1pbmVfcmF0ZSgpLgoKCmRpdmlkZXJfcm9f
ZGV0ZXJtaW5lX3JhdGUoKSBpcyB1c2VkIGZvciByZWFkLW9ubHkgZGl2aWRlcnMsIHdoaWNoIGRv
IG5vdCAKaGF2ZSBDTEtfRElWSURFUl9JTlZBTElEX1pFUk8KCnNldCBpbiB0aGUgY3VycmVudCBp
bXBsZW1lbnRhdGlvbi4KCgoKVGhlcmVmb3JlLCBhIHplcm8gZGl2aXNvciBjYXVzZWQgYnkgQ0xL
X0RJVklERVJfSU5WQUxJRF9aRVJPIGNhbm5vdCBvY2N1ciBpbgoKZGl2aWRlcl9yb19kZXRlcm1p
bmVfcmF0ZSgpLCBhbmQgbm8gYWRkaXRpb25hbCBjaGVjayBpcyBuZWVkZWQgaGVyZS4KCj4gLS0K
PiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjEwMjktbWVzb25fcmVmYWN0b3Jfbi12Mi0wLWZmNGFjNzRlNTI3YkBhbWxvZ2ljLmNvbT9wYXJ0
PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
