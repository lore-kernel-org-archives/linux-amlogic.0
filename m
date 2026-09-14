Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15127C88E64
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 03:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/2HQu3j20z6WWmYIVP7aAyLZ8dH/oGIA0h/OCq6l8Y=; b=nHl+/IjPjZzfJdgj6ZoQbkSM8I
	VgRtvHNcRKzfzVrhAEJUNGFI5vxcCUjQ/soe+BFE8Nvs9dh1iTAbD4jxrm3x17xjn3i4LhUiIkEJd
	YxYHQVT3+ZZ4SX1fO9pzTQ/bDm7BopJNlDcpJ5wB2pUvxN1nfGD/wfC/6aRCR4CWVyyvDoOpj0NEX
	zpTs2Nn0UYNAPJksOL1PLbacMIumTRBpfCpgddcmv/1OyWzhhiopsKn4G85ndWZNzkZqc9Dm581ne
	+WD+V+1zxxuw22bc/vezolekZIq3u+j1rwPPf5sPhdL0Py7mCag1k2Y/6cRPo8B0gX4kAAvdGdQOY
	25xXx4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wvq-00000002CVQ-0i7n;
	Mon, 14 Sep 2026 03:00:34 +0000
Received: from mail-japaneastazon11022140.outbound.protection.outlook.com ([52.101.126.140] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wvn-00000002CUu-2VKE
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Sep 2026 03:00:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwE7IQv1lzBLApZbyJBHJ6x+cr/kVNXaIZt8XHwdqIDzqafo0gzkfpYbWwC07xMFWNiIv/0ZjWNayN2lFx/+9SsKaHYCN7DUvDzWUqX9P9BKtLKWDTRESsyiUPFU8xEBi/ZViVzKeA/Otq+gopOqwXHobw+jsV4nowseXwkQ8wHUf0np9U1ysbAixJ2BS/EWNmSDsheRRad9J64SaiJ28qO0ueVD6WOUQ9qGGDiiXzzX1rvNT33VCHp7R6oMqkp9K0BwL7DAjnyKV/C5cpYyIpsWRkYDR0g/kVaNAmv0Lz6mvlqTK5lnL7TuV7G+psywD1gT90unII4SOVf0TRZBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4PllXCQ+FmuK2JXPzop8Seem16MYlsrBaoKHpUxyvM=;
 b=s6bWECwa+QCFhpaInH83N7VKot2dY2TsS0qGqPDHE/dZRi5d3r/vJZJcFAgRpeHCZXnwQpwyVRXEkLweNCAKvn5L9Z8+nrQ/oDYV0hKQXgzLjrPXNSTOW0SoCDiKwuf8erbcozJQJEl0gKegGT7fn13jYHp2VWSh+y2n9Uqp8OwERcRP1heP5GC20myAHs9YRuvitdk7WSVRsNuxQ/DLabT1das7L2RXomkoQ7R8Ur1nBZfmQnzSim6uep1qKgnIpgW7IK9cteVskIgOC6O9WVRs1AZ2yivepC32VNxb1j6qjpvDNYK1piFnKOkvcnMG9gBnmIwEb1Efc3mrAlP+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4PllXCQ+FmuK2JXPzop8Seem16MYlsrBaoKHpUxyvM=;
 b=lQvJi7OaWw7di55d6JttDYNkzOXTMf4H2PsfPPxlg8arokrOWLLAuw2rON62npcsy3sJxDOVYOw/zyWhbuVj8y7mwIO25fGc0wHjSUP8p6+JBeIyjDEUWcqNGBHbthui0xBE5nMq55kHSzcr/fH2prE6ESfpBDNK6VpLk0/tVgNt6ml59Vd1nLotteqnEnE4LaO/buVmlVGXjBo3XrUvcUXY7qY5wyBMuHqHxKsfAv6wBIWdVwUlk1W+oFIO9ibOmwIhlqGG2WMfG0vPCb2pHeknWtrbinZB33kyHOJu2C53AdM/rsQlxiWH6e/4Bl2VS83M1AfAkUthFgERWfUlNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8636.apcprd03.prod.outlook.com (2603:1096:101:232::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 03:00:17 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 03:00:17 +0000
Message-ID: <86ae1163-1507-4b4f-8d21-87fd2492a833@amlogic.com>
Date: Mon, 14 Sep 2026 11:00:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] soc: amlogic: clk-measure: Add support for more
 SoCs
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org,
 conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
 <20260911-more-socs-to-support-clk_measure-v1-3-940e269aa52f@amlogic.com>
 <20260911083742.9C6621F000FF@smtp.kernel.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20260911083742.9C6621F000FF@smtp.kernel.org>
X-ClientProxiedBy: TY4P286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::8) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 636e3c3d-d848-4f1b-9c46-08df120c4e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: gHa5ZEL66/Iz0m4TDtkX7cKjfmbGdsiuFqcKS/JDwe+/L6SRshorPgWTIbJIO65tjcFoyWaXm/wV+IZvz4XGtgf4RgEQn/huN7N7N3N9DAYmfkGXQ/YiHpoCo8dx7YWhAXBWe/dn1Embc1RLnwRqY9bTcEhNWzY/c+AWwfuDB2ezhcozTTgja9RgD2Sy4ZqDeCye+/hPkYnkaeZTgw2jH6wgniLOcWZSxxOcLYZdftAwMxkb85/7va0bA/Mz5BLmZWzOHOr7OnPW3bWX0/cf7RiJDDyZAjISijN02maz6pIGyxVFMgwCdXrkLeQoJYEhWzBY6xBbJBs/hP3r7G8ggqomLUD8fpjbzDD4hRz/KppilPAeNFzn5XJh4bhixAO31XQhpwxDOoftB/i6wZ5ReY0wmwlKD/Tr3dqTDwVGi8jhPAGVOR2iJYOt2TKhYF1N7X8ZqifDzZep2Vzl8HPALsTkOP/sRrqMPQjEzQQoQdi+aXr+P4pLuGXzFCot3C46VPk6LAtNzF73xJFN/x3ON/UTC9u11DU3fUv/ktxNvaGMEQf46r065zlTVAze/UYhaKGyN3aW+KocsfVhMSiFiUqZVrXEGwgHGd0NDjTaiuo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWtEOEFwTWhzczc3aXNUcVFTSEpJK1pubktHc3hkakI4dkV6Rkt5bGliWE9Z?=
 =?utf-8?B?Slh1YlNWOEoxVmlVMlBJRURPQWRCdENIT0FjZDVmSVMzQURaeVM2VjFKeklu?=
 =?utf-8?B?cmIrcEQvWlFkdmlTVHRra2dvcVhtMUlNSFpULzZlZjdSWXFwUlNMUFBYa0Y1?=
 =?utf-8?B?dG4vaHRYZ2ZkNUpkWDVveGZLOGltMDV2QU44dHdRY0dFNU1MNVlNUithNm5k?=
 =?utf-8?B?MS9MOC9VTjBmdDZsWkg0QjB3K0Q0RXhZczNsS3pIVWR0a1VlbXI5NGhEQXVj?=
 =?utf-8?B?N3d1dEJOVzB6RXVrTHFWR3AwbmNCVnUyQjRLL251dE1lK3ZhclQwMnZ1OGdl?=
 =?utf-8?B?YkpBOENkbndFTXN6NHNVVXR5ajFYTkwwQzg5VnhFL01HTlpqTktrZ3lVWE1r?=
 =?utf-8?B?VXNtT0hBUTF0ZTZDaDdzMnZKai94bnNaM0JyaUhDQU13T244djNMK0JCMmlo?=
 =?utf-8?B?YnFtc0hpSlZrYWwxcHVlRkFBU0kwMWFwbVFWSXgyNWkxK2ZOMXF3bE9FV2hs?=
 =?utf-8?B?Q1pmaFNITGZySzR1cS94MkR1NE9SdmppVnp5L3BuWmpSS0d0d285cjZLUjdX?=
 =?utf-8?B?bEs1eTJ3WmIwM0lLZVljWDZpUy80UXY4aXEzU2NFd3pmd1o3T1dseUh4elhr?=
 =?utf-8?B?ZjQrYWNlM3FzK0JuZ2hYaVpaRDUzZnFuNkdPYWFXQTJJdUp1SjRhT3ZmZmFr?=
 =?utf-8?B?TGx3aG8xUHQ0aitzMFdkVGN0VzZQbmdJdTdIMllDTEdQUGp4UEJOSWFEYXRa?=
 =?utf-8?B?TkE0aDgzdXM4ZmtTdHlvdW5nMUdwZGFocEtHVGo5bWxHd013MWdvcXRYTHQ4?=
 =?utf-8?B?WEd1TDRnV2R1TCtpaWVlamhzdzQ4QmdaUlNMVmVnUXZ5eG81OW44SGlIRVZq?=
 =?utf-8?B?NmZPbjhacGZRZ1RVWVBqTS9acVY1ZXpDcVhZTC9RYndtZGNRQ3E0ZndkdHlX?=
 =?utf-8?B?NGFJc2U3WmFMWDNRSk1reGJlc0ZJYVgrUlBFdnN4U1lmUEVvckpNK1BCTFh4?=
 =?utf-8?B?Q1N4b1J2dytQL0VKTkJEN0xqL1lxVzNMWmRab1RRR2xEWlNSRjNqRHN5N2VH?=
 =?utf-8?B?OERSTlVtMzR6a1RMS05wbGp2TDVBSWcvR1QwTDYxMDdkZWI1NGVrenAyVmlI?=
 =?utf-8?B?d1RrYjR4WWo1cHA5bDhVWktJWVBwL0VwNDJ2cExBeVdSRnFpSTRLSWtRRWor?=
 =?utf-8?B?bFNDdVZCZjl6UmdwdzQ3RURORUwza0Ntc3NwdFJZZlhBeFVxaHVlVXZhMUJ6?=
 =?utf-8?B?QW5maDk4L0ZTTUQwd0gwQ1JORE9EekNrUUhXZEZtMG1nQkNSeTN3MFdkUVBr?=
 =?utf-8?B?RnNNZ2xWVCsySU1HcTF0MkhLcG40bTAvL1NJWEhhb2RlUHd5NFNLc2FHT0JP?=
 =?utf-8?B?TkZqd0lVc0ZqZmV6TjU2ZlQzckd2NHgrV1lyMWVRZmMzRkM3QmhJRXZuU3ZD?=
 =?utf-8?B?RTJKOVpDckxBb3lINkhFclQxUGxFWFVkTWlodi9tdXc5Yi9CZG8yQkdUZHRv?=
 =?utf-8?B?eDZqNDkva0QxeHQ4RHZ6TEtLWS9PWjNocXdCL0tQTFdlU2FwdVcwMEwxeUF1?=
 =?utf-8?B?SHpCc215V2JoNEpyM0NQSUJlcVIzaG5aV0lJWkpkcXFsZXVsOWZ3QnRUVS9o?=
 =?utf-8?B?OFRnai9HMEY1KzVZN01ZYnR2MHJRb2dqWll5Z1NUWCt3TXZjU3J2TVhhTTRp?=
 =?utf-8?B?cFNrQmFoTEU4VFRBOWFjY014MmN5dzRoeVpKdUFJYjNNb3dQSkViUUwrcUF5?=
 =?utf-8?B?U0JRUTkxbXJaQ2pITk9STm1QRk5oTTFSTkUrYlQ3SXBRbFR2NGhoNjFCWHlE?=
 =?utf-8?B?RXFBblFHWXVEd3k3VVBpdkI5QnZYRU8zSGFpS2loTTI4TzZHSDFETVEvTGxa?=
 =?utf-8?B?WkoxcENNWHBPNjBCRlFKUWpwbWlqUXRtT2RkTFFVUVR4UVdxLzFxRG1KUzlF?=
 =?utf-8?B?RUhtNVZ0b0RxdDFIcS9RZ0I5SjhhV2lBY1IrQ0l4dXIyQ2NTZ29lRmZnQ0hS?=
 =?utf-8?B?dlBxZFpyMkRTZnpGNmRpWk4yOWYvT2ZWT0pMTHBvUjNwWXB4a0wxQU5pa0ZG?=
 =?utf-8?B?dncrOXN6K2EzS0p0TmkvOGJuWG5qeHJDa1AzVkppSC9LUXZCYWFZUFM2aUpz?=
 =?utf-8?B?VkRvclhIaHZKYWxOQVMzWFY5UDQvdFBtcy9IN3JHV250elNlU0lwQmJmYjBW?=
 =?utf-8?B?ck5PTlVRZElWeXBMaDl6aU1mMHdXUExzWStBNTBpc2ZZSmJseHlsK1FzM1Zs?=
 =?utf-8?B?THNSOGRaWEtTcm5pOVVXYkkyNXJmTFM0ZDg1a3M3YVNnbTMzLzZrbWhjQmxP?=
 =?utf-8?B?djJ1WVJlS2NMeFE3SGE4WkNMUWR3QkRjOHB2UWorTXkvTUh3M0xDQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636e3c3d-d848-4f1b-9c46-08df120c4e0e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 03:00:17.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PI4UdZnBWhPyZ6SzCG/Z58bD5hLLV8C29pTmJxKKcWK9CSY0bvR8XppBnNd0EqHAz6NQ2wXA2GTmSHRJdZblRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200031_646687_036AD1BD 
X-CRM114-Status: GOOD (  18.63  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiA5LzExLzIwMjYgNDozNyBQTSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToKPiBb
5L2g6YCa5bi45LiN5Lya5pS25Yiw5p2l6IeqIHNhc2hpa28tYm90QGtlcm5lbC5vcmcg55qE55S1
5a2Q6YKu5Lu244CC6K+36K6/6ZeuIGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVu
dGlmaWNhdGlvbu+8jOS7peS6huino+i/meS4gOeCueS4uuS7gOS5iOW+iOmHjeimgV0KPiAKPiBb
IEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBT
YXNoaWtvIEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoK
PiAtIFtMb3ddIFRoZSBgY2xrX21zcl9hOWAgYXJyYXkgaXMgbWlzc2luZyB0aGUgYGNvbnN0YCBx
dWFsaWZpZXIsIGNhdXNpbmcgaXQgdG8gYmUgcGxhY2VkIGluIHRoZSBtb2RpZmlhYmxlIGAuZGF0
YWAgc2VjdGlvbiBpbnN0ZWFkIG9mIHRoZSByZWFkLW9ubHkgYC5yb2RhdGFgIHNlY3Rpb24uCj4g
LSBbTG93XSBQb3NzaWJsZSB0eXBvIGluIHRoZSBjbG9jayBuYW1lICJleGl0X1RzaW5fQl9DTEtf
SU4iIGZvciBJRCAyNiBpbiB0aGUgYGNsa19tc3JfYTlgIGFycmF5Lgo+IC0tCj4gCj4gY29tbWl0
IGYwM2VjNDJjYTBkNzA5MmY4OGQyM2JhMDZkNGJmYjM4ZmMzM2VkZTEKPiBBdXRob3I6IENodWFu
IExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPgo+IAo+IHNvYzogYW1sb2dpYzogY2xrLW1lYXN1
cmU6IEFkZCBzdXBwb3J0IGZvciBtb3JlIFNvQ3MKPiAKPiBUaGlzIGNvbW1pdCBhZGRzIGNsay1t
ZWFzdXJlIGRyaXZlciBzdXBwb3J0IGZvciBzZXZlcmFsIEFtbG9naWMgU29Dcwo+IGluY2x1ZGlu
ZyBBNSwgQTQsIFM3LCBTN0QsIFM2LCBhbmQgQTkuCj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFzdXJlLmMgYi9kcml2ZXJzL3NvYy9hbWxvZ2ljL21l
c29uLWNsay1tZWFzdXJlLmMKPj4gaW5kZXggMGQ0YmEyNTU1ZDE3NS4uNjcxZTBjMzc1M2RlYyAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1jbGstbWVhc3VyZS5jCj4+
ICsrKyBiL2RyaXZlcnMvc29jL2FtbG9naWMvbWVzb24tY2xrLW1lYXN1cmUuYwo+IFsgLi4uIF0K
Pj4gQEAgLTEwNDEsNiArMTA0MSw4NDMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9tc3Jf
aWQgY2xrX21zcl90N1tdID0gewo+IFsgLi4uIF0KPj4gK3N0YXRpYyBzdHJ1Y3QgbWVzb25fbXNy
X2lkIGNsa19tc3JfYTlbXSA9IHsKPiAKPiBbU2V2ZXJpdHk6IExvd10KPiBJcyB0aGUgbWlzc2lu
ZyBjb25zdCBxdWFsaWZpZXIgaGVyZSBpbnRlbnRpb25hbD8gV2l0aG91dCBjb25zdCwgdGhpcyBh
cnJheSBpcwo+IHBsYWNlZCBpbiB0aGUgbW9kaWZpYWJsZSBkYXRhIHNlY3Rpb24gaW5zdGVhZCBv
ZiB0aGUgcmVhZC1vbmx5IHJvZGF0YSBzZWN0aW9uLAo+IGluY3JlYXNpbmcgdGhlIG11dGFibGUg
bWVtb3J5IGZvb3RwcmludC4KPiAKPiBPdGhlciBjbG9jayBJRCB0YWJsZXMgaW50cm9kdWNlZCBp
biB0aGlzIHBhdGNoLCBzdWNoIGFzIGNsa19tc3JfYTUgYW5kCj4gY2xrX21zcl9zNywgYXJlIHBy
b3Blcmx5IGRlZmluZWQgYXMgc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9tc3JfaWQuIEJlY2F1
c2UKPiB0aGUgZHJpdmVyIG9ubHkgY29waWVzIHRoZSBlbGVtZW50cyBmcm9tIHRoZXNlIGFycmF5
cyBkdXJpbmcgZGV2aWNlIHByb2JlLAo+IHRoZSBvcmlnaW5hbCB0ZW1wbGF0ZSBhcnJheSBkb2Vz
IG5vdCBuZWVkIHRvIGJlIG11dGFibGUuCj4gCgpJJ2xsIGFkZCAiY29uc3QiIGluIFYyLgoKPj4g
KyAgICAgQ0xLX01TUl9JRCgwLCAgInN5c19jbGsiKSwKPj4gKyAgICAgQ0xLX01TUl9JRCgxLCAg
ImF4aV9jbGsiKSwKPiBbIC4uLiBdCj4+ICsgICAgIENMS19NU1JfSUQoMjQsICJkZHJfZHBsbF9w
dF9jbGsiKSwKPj4gKyAgICAgQ0xLX01TUl9JRCgyNSwgIm1vZF9Uc2luX0FfQ0xLX0lOIiksCj4+
ICsgICAgIENMS19NU1JfSUQoMjYsICJleGl0X1RzaW5fQl9DTEtfSU4iKSwKPiAKPiBbU2V2ZXJp
dHk6IExvd10KPiBEb2VzIHRoaXMgc3RyaW5nIGNvbnRhaW4gYSB0eXBvPyBUaGUgbmFtZSAiZXhp
dF9Uc2luX0JfQ0xLX0lOIiBpcyBleHBvcnRlZCB0bwo+IHVzZXJzcGFjZSB2aWEgZGVidWdmcy4K
PiAKPiBJbiBzaW1pbGFyIFNvQyBkZWZpbml0aW9ucyBsaWtlIGNsa19tc3JfczYsIHRoZSBjb3Jy
ZXNwb25kaW5nIElEIDI2IGlzIG5hbWVkCj4gImV4dF9Uc2luX0JfQ0xLX0lOIiwgbGlrZWx5IHN0
YW5kaW5nIGZvciBleHRlcm5hbC4gVXNpbmcgImV4aXQiIGhlcmUgaW5zdGVhZAo+IG9mICJleHQi
IGNvdWxkIGNvbmZ1c2UgdXNlcnMgb3IgYnJlYWsgdXNlcnNwYWNlIHNjcmlwdHMgZXhwZWN0aW5n
IGNvbnNpc3RlbnQKPiBuYW1pbmcgYWNyb3NzIFNvQ3MuCj4gCgphbmQgcmVuYW1lICJleGl0X1Rz
aW5fQl9DTEtfSU4iIHRvICJleHRfVHNpbl9CX0NMS19JTiIuCgo+PiArICAgICBDTEtfTVNSX0lE
KDI3LCAidTNwMnBsbDFfMF9jbGtfZGl2MTYiKSwKPiBbIC4uLiBdCj4gCj4gLS0KPiBTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTEtbW9y
ZS1zb2NzLXRvLXN1cHBvcnQtY2xrX21lYXN1cmUtdjEtMC05NDBlMjY5YWE1MmZAYW1sb2dpYy5j
b20/cGFydD0zCgotLSAKQmVzdCByZWdhcmRzLApDaHVhbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
