Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823C1CCA46D
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2026 06:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCarzmValS9ivb1TulsSTat2RQRKr8kY626QnYQ6CUE=; b=Z4M/NQYQO9Cmaw8F9iqs6JyjXr
	Zv9DML+b2xLFVgpHqVKvNyMd25U6eg++ICiwDCezQxyjXA9Em+igSkFx28TPuWoD58IgPzy4ZnTzO
	VO4RCEmKy4SRshzHidpGMmxAQBmWnhVlkAlijeH3Mx4hvC+GjyHLsHD8WXhRhRweG1+aedI+xivm4
	2zyKGRRk6Q9WiSJnm6KFqceMjLUlg9GW0+vdLytth5WBikV1zvlSua3gny9F5MWRhejgpWLLIBehd
	hAo7YGw7osxGMtLgCOMcrdVenynLM65dOaAXVRQXa2zuEOldX+WYp06jwouEZzLWgPGWKZlSA2nCM
	08CBNGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbdH-000000028p9-3xm4;
	Fri, 16 Oct 2026 06:41:35 +0000
Received: from mail-japaneastazon11022106.outbound.protection.outlook.com ([52.101.126.106] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbdF-000000028np-0Rfc
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Oct 2026 06:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNrG4TYY+2IPXfAdlAXdgqSR5crtcCR4JYEqzp0bCJqqH7FsLsaMkNlY5toeZMuyL4bk61hEsoZ4Absij5fAeGPKrRUP5FWNPV/w4l0Pr8zsM1arO/xu7WhbHR5N3rbon/JFM2lcptz2BnZ5CehOvpcxuUZWsfpMuxtJPKby7bAuenlxehsnsdkRlQVQMHzgDPLPN8PLEN5B6Q7aCwr7qZmO6kL08lMiXcBjLZn8DS/EPhAQGSLHAApjszc4olGlXGcrsQnk9ue0GfbWfMaHUtsPSN350ax3pRq3133L/Nv2G8gdVqAFr+D5oTd93JyzfHLzBXKf//r4csAKKX6PBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5//BQlKx4zxcjK/Qbr37FJ4QCVNYPNyLJYb/G2JV+CY=;
 b=G/Kp72cZbYAVPgn12m45YmEtbyUksefKEkxlV1JUULltKSvKBvyYMucyCPe1fgb01uCyISoLZ5yCvofgpPCQMEsMADKXQrThK66HSE/y9kDnHymgM6NJj0Vh0QdX4tcSfJBwOB4M8lIpi69EcfcMiNyGTkdyUYEgriuB5mQxMG4Y6cLYAdrRyfi31lqjXKemAj82SA0ry3d6mjJY2sEZMuiEuKnx5y6QpgM/4shjFeYP6zTqp8xoO5NUAvr/2AiqxvmtUleSt206t0KkC2TaSq5aX3J8rjuG/vUzbMQv4RxpHpqntHnrZURc7xHdNAbFc2IRbGxwWgl/qvGUxDxhJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5//BQlKx4zxcjK/Qbr37FJ4QCVNYPNyLJYb/G2JV+CY=;
 b=yGHrGligDRRjCXQnaE75HayM799bGCLkgNpkZ7wHSS0E38mvR9k+ukZMYxVcqDBRx7MZpHrYm+zfFvITJ56mHu08uyTTiRqBtAfOixae/0dwNc4xC1X3hF7fKPCUZLuH3fm3zH9GnFLcVtIqqzK3AugDehN4TAndv9kUgKKNmSbf6dU2jUnZN4xdbStqVTMfQ5k1ADPt2vgJ/YSUu4Lb4cBmjL9/G/4Mj166cbJxwjhUdqRb8XI+9GSUfIU9GCsECiiwcG+2cH8b7OMDg4g62iIYoenzswjmQZ9tDPzIR+pmzalpAnHDCYT8a01Fh1JvnkPqFeQ1GWPiZ6PcIkuz8Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SE1PPFB8A17DC0E.apcprd03.prod.outlook.com (2603:1096:108:1::861) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 06:41:17 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 06:41:15 +0000
Message-ID: <a84be450-95ac-4878-b01a-8654fe7dd8b0@amlogic.com>
Date: Fri, 16 Oct 2026 14:41:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: amlogic: Fix regmap error check issue
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 vkoul@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
References: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
 <sashiko-outbox-173653@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <sashiko-outbox-173653@kernel.org>
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SE1PPFB8A17DC0E:EE_
X-MS-Office365-Filtering-Correlation-Id: 108d1485-ec62-446f-0a99-08df2b5079f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|10067099003|22082099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 8bDbLeOQNmpoqRV71K22YbEVQ9pYDs2tm7Wp2cBBes4XbyDZyMcDTbPWy9eN8hdxV6GXaxPIZtyYf1ld35blFkEsNsJ3951UbhF9kPpRz2Og6xFH4pVjC5TT3oHkswvmGCFKvzhomnztqiQyXvs4+y/EHD4bfwYJ47niib7nJXAUFjKsNvBtHGCeZ7NOElkPPJUhtjySxsdTugXcpgrOyA6aJEMPuVnsyCMJRDYoq4rZUy1PzfxhvseohOGtbJPrg4RAiXq4YWrTsHWPP1QSYF6xCCUIAvZsGIhpTrSDutxRwXk3uQuME/E3lC0MbhwwFDEQuX0iFv1etmh0fgNa/ARQY9+tFAhXNq74Ea09HyMazPB2qdUDOHg8DhmL/Zayz5SjcZZxEV0yGCkSjDpNlcjWwYd5GQVIzLgdFWtcalK8Io7DVT5uiunlCoej1x7p+nfz2w9XVBY+GX3sPFGaDiQllk42RwrD7QXn+0f8sA+Pt/6TSFvUBzGB6FaX++zZ2f+daZYyN+FZLsvJajT4LlWyZbdQu5UjWWO/ZZnr2lGbaWCn+nJweMN0zaJ+NftLSpmS/wnzonUW/z/bqpr3oPnN1JOPKPOp11I0UkRJuks=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(10067099003)(22082099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Njd6cy84QVR4NTdUOUZHcEFDTE1WVUZzYStuK0k2eks2em9lQndKbHgwNHhQ?=
 =?utf-8?B?bXBadlc5b2dTTmZIVEZDMEV6LzdCTzBUVnBvN2p2alZaNDR0Wnc3U1VWZHRZ?=
 =?utf-8?B?b3k1aElnR3VWUnkzMTJUcXcvY1d6T0h1NWhvN0FTemlGaDhPd21KeWZ5eDNr?=
 =?utf-8?B?QUtXVURyYjJ1YjNFRVpEMThZb1gvV2NyS1JLaU9hRFdBRmNGaURML253WXlG?=
 =?utf-8?B?alpUYXd1dlJRRzl4NGRpREVGSGMzaTIvTEE0a0pNSlQ4dW1USFB3UzltaFRp?=
 =?utf-8?B?VU53RUxJY3NLWGh2b2NVcE5xOTF4N0JDTmQvYTd4VStleEpqTFZZeXB2NFAw?=
 =?utf-8?B?ZjQzbFRzL28ycjByTnNyNng4OHphT1BMY0RXKzdPVnU1QXhMck1lQ3I4SlJ1?=
 =?utf-8?B?cVdVdHJJdmRkcTJ6WjAwc1d3Sk03dHhETFY2Y3JQWWUrQXRsQ29wL2ZDV0NH?=
 =?utf-8?B?Y3lKcFU4WUlEelVqYmpEM1FFQnpCS1ZqVzA5MG4vM0RJc3RtNlVVT0k3aXRp?=
 =?utf-8?B?NUVNQy81dGxuVzRHN0J3cnhNSWhUT0tJZlFEeEhzVHFORFMvaHV1WkJKU3Az?=
 =?utf-8?B?ZmlPd1p1Tjlkd0ZPdnpFeTE2MnIxbTdMMjBhQm1UVWdtWDdnWXp2Z1c4MUdU?=
 =?utf-8?B?SmtScW5LcW56QlM4eitINEdKUHpuN1EvUkk5THZtWlE1RGdSTGErZjAxcFZz?=
 =?utf-8?B?TkUycGQ4RzExYnl0MWZLa1QxUlBEaXJuUHZicWFIV0VsTUJ6VzliZ2pHWUVz?=
 =?utf-8?B?U2NYM1R5Ylp5d2ZMTFN0TmNqYldmN0FOUFNRejE1VHRHcytDeXBTRmp0WTdR?=
 =?utf-8?B?Yzl3bnF2ZTVpb2ZNaXdXNkU4Wk5zMFl2Y1pRR2pJM0lXdHlndnlGQmFzMHps?=
 =?utf-8?B?K2pqK3dSKzFpZzB1YTNsZzhFMk5aWjBVNjJ0V3l3Z2VTblFCQ0Q5MEhSMkZX?=
 =?utf-8?B?TUNXY21UclVhK2lpYk1XZjJjdWN2c0M4aGZRMHJTOWpxWDBqQ3hORUFSOFVC?=
 =?utf-8?B?N2thSHJoUU94REg5b3BQQjV3RUh3bEI4VnFRUkk0aUdSRzBpbWpuU001QjNC?=
 =?utf-8?B?OVRFbHlwaHA1cm1RTGFGTm1CcHRFUFZvY1ZDaVJvN2JVZCtob09GeTY2V3Jz?=
 =?utf-8?B?WkpLN05NMWJYUThmUkZTOEJnQWpvU1FwU3NmT3R3eVhCQ0s3TDYzMkxlaXVI?=
 =?utf-8?B?YXhRSHdUZk5HRndQNjVqOXRsYWhxTFFvV0xsWWJSa3cxODl3dGhJcDFuaEor?=
 =?utf-8?B?akxYNTlIRUtLZWRTR3VhMjBEQzczay9qNEErZWlJMEk4T28vM1dWMW91eEZv?=
 =?utf-8?B?SVNKN2thNXErY0JEOWpPSkZjU1BTbWJVR1BSUkJpZnpnT2dvSTU4VHlZa2FJ?=
 =?utf-8?B?TVI1MSs4bDF3UFNtczZRNGkvS28wYVJtWCtQTHpDMGl3NXNyeHVReCtWczFt?=
 =?utf-8?B?WVcwTmx6bEhSWHk0QWFsM3pBSFM1RTZEQ1dBanBzR1d0RnIyd0F1aEM3YzNo?=
 =?utf-8?B?RnpnM0phclhMemh6dk82Myt5UUtPb3lrSHd3end2Wjg2Rjh2eE9RMm92dUdK?=
 =?utf-8?B?aXZzcVJjTVpJaTc2Ulp3V2J6ejVpZ2ZNYlZMTzVwZXBUOWpXWDF1SEVPMndB?=
 =?utf-8?B?UDRXSUdhdXlIM3k1RkVtWG91OWppa1RFT3RPdEVwTHJJMExnbEhzbHpaVWsy?=
 =?utf-8?B?cEhKZjNMMis0b1JDejdidjBmaFdiTGl3ZHZQeEZjUHdudk1TQlB3Q20ya2RP?=
 =?utf-8?B?YlZBSmtpeGxqeWl0clRUbHFQWUUrVTNsYno0UU5uOTF6a01rYk9PUFdwb0ph?=
 =?utf-8?B?aUkxN09DN0UremZJY1N2YkNZbWRMYUlGL3lwTDFnaTRjejdrL0FGSHJaYXVu?=
 =?utf-8?B?NlFwd3B5RjhMNERrbmtVOFdNNEcwMTczZ3pKZlZ4Z1MvY3lPL3VLKzNWSGVZ?=
 =?utf-8?B?ZmNIT01jUnd0WGw3YWhrMTR0cVZpV1JsQzFlbzl6OWpjbk9WWSttTmdWNTE2?=
 =?utf-8?B?ZTUzeGZ6ZGwwZjc0SVNDSno1TW9hL2JNSk96OFlROEd0ZXpOTnNQemNhb3Vp?=
 =?utf-8?B?MnBOY2FvQVNFemI0WG1IdFhoQksranI0NW45eUNFZm1hcUtvNVpCL2RRL1hG?=
 =?utf-8?B?dEtUR0ZLa1NFdDR4MG00TVdLeEM1eWIrVTQwRysrV0h2dUd2NGFpY0s5V0Za?=
 =?utf-8?B?b21YVXFmaThHNnFLNEt2cjdnbjcyTlBFaDgwVDV3VUxxWm5rMGdnanRFaFk5?=
 =?utf-8?B?U3VkMGlsV0F2Snc5Z3I2RDMzVjhvdEtOeVVrNWlPS3gwN3hpSURPSWhWUnRj?=
 =?utf-8?B?SS9BTG03UklGTGM0dE4yWVcyQzRtdFJCRUVjVkg0NXpKaUJ2VlQrdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 108d1485-ec62-446f-0a99-08df2b5079f4
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 06:41:15.5078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjVA9xwMwV/CdTKzYYZvn/MfI0aPcKKcdqMhvmnzjL7//LWGbCIDOOvx+/V0NLDzpRJfwm8+fcFO+yxEZ5el2JxFVIr0XXuH7UUmi+44eds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFB8A17DC0E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_234133_162621_62EEF6AF 
X-CRM114-Status: GOOD (  15.87  )
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

SGksCgpPbiAyMDI2LzEwLzE2IDExOjA4LCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24h
IFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVy
Ogo+IC0gW01lZGl1bV0gZG1hZW5naW5lOiBhbWxvZ2ljOiBmcmVlX3dxIGxlYWtlZCBvbiBlcnJv
ciBwYXRocyBpbiBhbWxfZG1hX3Byb2JlKCkKPiAtLQo+IAo+IGNvbW1pdCA4NDI2MTE2M2M2ZjIw
OGFhMTI4MzRlYzI0MmRhMzRiM2Q4MDVlN2FkCj4gQXV0aG9yOiBYaWFud2VpIFpoYW8gPHhpYW53
ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPiAKPiBkbWFlbmdpbmU6IGFtbG9naWM6IEZpeCByZWdtYXAg
ZXJyb3IgY2hlY2sgaXNzdWUKPiAKPiBUaGlzIGNvbW1pdCBjaGFuZ2VzIHRoZSBlcnJvciBjaGVj
ayBmb3IgZGV2bV9yZWdtYXBfaW5pdF9tbWlvKCkgdG8gdXNlCj4gSVNfRVJSKCkgaW5zdGVhZCBv
ZiBJU19FUlJfT1JfTlVMTCgpLiBUaGlzIHJlc29sdmVzIGEgU21hdGNoIHdhcm5pbmcgYWJvdXQK
PiBwYXNzaW5nIHplcm8gdG8gUFRSX0VSUigpLgo+IAo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI2MTAwODA5NTMuQzVUWWxDYUEtbGtwQGludGVsLmNvbS8KPiAKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZG1hL2FtbG9naWMtZG1hLmMgYi9kcml2ZXJzL2RtYS9hbWxvZ2lj
LWRtYS5jCj4+IGluZGV4IDc4ZWUyMzM3YWU3MTIuLjY4NDEyMWQxM2ZjYWIgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZG1hL2FtbG9naWMtZG1hLmMKPj4gKysrIGIvZHJpdmVycy9kbWEvYW1sb2dp
Yy1kbWEuYwo+PiBAQCAtNjMyLDcgKzYzMiw3IEBAIHN0YXRpYyBpbnQgYW1sX2RtYV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pgo+PiAgICAgICAgYW1sX2RtYS0+cmVnbWFw
ID0gZGV2bV9yZWdtYXBfaW5pdF9tbWlvKCZwZGV2LT5kZXYsIGFtbF9kbWEtPmJhc2UsCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFtbF9yZWdtYXBf
Y29uZmlnKTsKPj4gLSAgICAgaWYgKElTX0VSUl9PUl9OVUxMKGFtbF9kbWEtPnJlZ21hcCkpCj4+
ICsgICAgIGlmIChJU19FUlIoYW1sX2RtYS0+cmVnbWFwKSkKPj4gICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIoYW1sX2RtYS0+cmVnbWFwKTsKPiAKPiBbU2V2ZXJpdHk6IE1lZGl1bV0KPiBE
b2VzIHRoaXMgY29kZSBsZWFrIHRoZSBmcmVlX3dxIHdvcmtxdWV1ZSBvbiB0aGlzIGVycm9yIHBh
dGg/Cj4gCj4gYW1sX2RtYS0+ZnJlZV93cSBpcyBhbGxvY2F0ZWQgZWFybGllciBpbiBhbWxfZG1h
X3Byb2JlKCkgdXNpbmcKPiBhbGxvY19vcmRlcmVkX3dvcmtxdWV1ZSgpLCB3aGljaCBpc24ndCBt
YW5hZ2VkIGJ5IGRldnJlczoKPiAKPiBkcml2ZXJzL2RtYS9hbWxvZ2ljLWRtYS5jOmFtbF9kbWFf
cHJvYmUoKSB7Cj4gICAgICAuLi4KPiAgICAgICAgICBhbWxfZG1hLT5mcmVlX3dxID0gYWxsb2Nf
b3JkZXJlZF93b3JrcXVldWUoImFtbF9kbWFfZnJlZSIsIDApOwo+ICAgICAgICAgIGlmICghYW1s
X2RtYS0+ZnJlZV93cSkKPiAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICAgICAg
Li4uCj4gfQo+IAo+IElmIGRldm1fcmVnbWFwX2luaXRfbW1pbygpIGZhaWxzIGFuZCB3ZSByZXR1
cm4gZGlyZWN0bHkgaGVyZSwgdGhlcmUgaXMKPiBubyBjbGVhbnVwIGZvciB0aGUgYWxsb2NhdGVk
IHdvcmtxdWV1ZS4KPiAKCkkgd2lsbCBzdWJtaXQgYSBwYXRjaCBzZXBhcmF0ZWx5IHRvIGZpeCBp
dC4KCj4+Cj4+ICAgICAgICBhbWxfZG1hLT5jbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgmcGRl
di0+ZGV2LCBOVUxMKTsKPiAKPiAtLQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAxNi1maXgtYTktZG1hLWNvbXBsaWVyLXYxLTEtMDI0
NDIxZDViM2M4QGFtbG9naWMuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
