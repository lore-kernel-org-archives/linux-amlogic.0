Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324BBC43458
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 07:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/lZ3VkYH5QvDyjHD1B/srRfPUUr+NDSuwWRulfua+M=; b=VZcYUYZqEHVvQXCRHlT9FR2P29
	3qSv36WRZOt9IRoUq72lJselvEdmzurWb++kHa+AWqaqzffBXOpLvh21ydHjOjeC+RHipvDymVjlj
	lHZLf1Jgpmz91o4727RzSNZOtCMVg5C8unaMRfPYzSjWQTLcoz0bhNSi/d9rNR92LnVR+GuRi/2K0
	ZByoHtqKXf9nRtZ7N6uZCILc/0uPQLDiXxsv0kXVYJZV0NZCfxuKRGy5jXTiQ3Frep7V+ptBURNlF
	ej+KjPAgGgpzwPqzWqo0vHKjhfa7YpRdjrcxf/T6Yj/cSqDndVskWgAmqXVGWFD/rmRedD7ggLY6G
	/LGEph5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdP8-0000000Bgyw-0f00;
	Mon, 06 Jul 2026 07:06:10 +0000
Received: from mail-koreacentralazon11023086.outbound.protection.outlook.com ([40.107.44.86] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdP5-0000000Bgy2-2cAi
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jul 2026 07:06:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc2p8ltyDSkc1Ez1npT7I21IBzu00K1lf7mNFHXlBPTy56WUgfwn+ktTTj491Dt1GyPBrs1ivbQkfejWFRuSSpiQaNzlKLABdjFQUyv5se5iXeaomUOPoGZAyiGzuGI8KOfMNeCZE+Y6gXkdrongwvwgHQOSJVfYBpugprwiGL2IbuN5XQY/VRWr/KuUhNyiszkF+g/L4he7RUqW9tDfPv6ARPXZop7A+fPudkyVwnTFzD+OLIEJQqpA1lgo56c8QWidArNPXD8s7iPmndMaTue42OsLWjKDLE/4GT1Ja6yFD8Dv1RBlRA8ZwkuY1Vxh/KqkKrCjun8UjNV4upOX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FABaG6hS05jrItrgGnaNXCAC7ghSeK8Qg49T89BlTM=;
 b=PwogVv6jnn9BRJotrYroMudab8NyUnEyu8IHtHJxB+rzWITVAn2Qgq5HVkYf62t2gJ9gkvEyoszu2QhXewrVPrsGaYhyofwP8ZOp4M1WYSwltftJcIlOjfpgSCea7YXq8GY6oP+cdQ3nAgXHOp8ZBUZLZVLVdYbpi+yQlhi/ZS6sl0Er7xjkRbLNNf1EboG0iFAYKFt68ZLawWKW34D5R2iVCI/WDxi6ixXWSy17Jx8u+UuupiJs+CrtchRwu+2+0ofObcWJuMyueyn3h0jjN81fKME6Q8PnBFbNmZrvi4wOi/VvVeV4amTqs1O41/yA/NpAbx609o7eomp4fOTrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FABaG6hS05jrItrgGnaNXCAC7ghSeK8Qg49T89BlTM=;
 b=yukHelHKt1prENq+k9NnrqU9thb5sXPAbqqL6LHsEodc7SGBqB2WNGv3JsqShphmUW1S81OGYHJ4FyhdRfybTh7PLyAAia9+1X1p5v1xKS8w3lQufdWXjNcd00D+gB9R9W24/nZ7nXT3XgFitEy8nFKZIZ/6cuk7JpCyF3fV7xTxicx2OUI5nzZTCt3dLdYrGX+dixfkhzfWeZNgJyVGdoPC65A/6nKoy/d7dlXIPiVFSgCy6FNRrVKnAfORMuVHnuyuyE5jpZ/BiBnAcPYme1zhpEXunxDoI1hcBxuwU8jyg0hfILR290IXVVc7mCVpRGwHb4qeE1t/NSTIVOWPIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by PUZPR03MB7061.apcprd03.prod.outlook.com (2603:1096:301:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Mon, 6 Jul 2026
 07:05:49 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 07:05:49 +0000
Message-ID: <a28dbf0c-4692-4baf-9958-56bd4d78e669@amlogic.com>
Date: Mon, 6 Jul 2026 15:05:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: amlogic: clk-measure: Mark the clock measure table
 as __initconst
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
References: <20260706-clkmsr_optimization-v1-1-70f5aae6e60b@amlogic.com>
 <20260706054342.C738F1F000E9@smtp.kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260706054342.C738F1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|PUZPR03MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c297e8-b408-43a2-3004-08dedb2d022d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|56012099006|11063799006|4143699003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: +qmPXL95zMq2JQ0xqjL3uzVPbdhr9NXzhRf7jUWiE2k0fUCDCP66zvNaApuxaz6+pDuA/qV8Oyv1HhzmFzBk29XysoY0NFPxFEEo9AcSz+Zxl8T1Y2pgwRNNBkk2FOFKltBNVAaZtPljUwU8uAuhLCdouHiY2Ep4Cr92YG1SINJkZ9MiP0Gdd54O8hrQRN/TuPrnr2phKzz0H+/67M/Ab1k9HcnXdvC4E0XqdhrUxDmrbA0S9wDqLkkp8oq2OwV4n6p8mqu4JUnY9Q4OtZHHbQLxw747SZHLCWcEVMN9rbuyzBjHQ6MfWqPUp357Vbe171JW1iDO7E+X4iV/NvKr0fdgSsBOjdxCbvzQiOhtdXSYCrUQRWhcnN85inQLSuMIXM47+eHOSjNVC5XJjaBng9nc15KGB0PT9R3WmiRtmYpx5TQGM+FSmMkxb2MAHA22eLQn2p2WJUBXl/uXLof0SXkovMKPKFfQx58agbshfvTg/BQSdiEK+MtUz7SVwyoD18PimY4WxaYoIaKljoGkUq9XqPcKxW/k0JDmcOd6YmYoIc1oHcwnLkmCl4KcU1/iBn/FzLUhHPgyDDaivsWID6rAWAgXi+bPt8NwY/S0xn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW02cTBKczhoSnJJMy85akE5ekdnYTlac1kzVU40M2VKbEFUei9WTlJDWFJN?=
 =?utf-8?B?Q2FWTm5ndkIvTG5RUWw0T2d6NDUrK0RNMkp1OStrc01kb1AvQUhDR2FTU01l?=
 =?utf-8?B?eE5OQmowUU9VT0cwUlZaeVRQUzFnZ0FHVWdTWFZnc2ZHMGlLSisrNTAwUzFj?=
 =?utf-8?B?WWFYNGlSYXpqTVluM2EzYmFvMmtFRzdGZmF2TzhDZnZFTktJejlyQ0M3VDE0?=
 =?utf-8?B?VXorKytsMW9rVXRFWm5Fa3lycFFrOEdIUGM4TGJJZDlLc3crUlgzMXVmTElv?=
 =?utf-8?B?b3BkSGRianI2eXNXM1hFanJnTnFVRlBwRHgra3hFVkVoSWVsaURhK3l4MXcw?=
 =?utf-8?B?dEVIcWZFSllSYlV0ZkhLSUhvNlR2VU5RY2tadWx0b1UrUzZzRU14dGJRT2dx?=
 =?utf-8?B?NStzSWQrRXRYbDByRmNTT2lac1gzVmJQNEZmRFpOQTNVajdnRjhQSTNWdmVj?=
 =?utf-8?B?VE5nNUZ3cWNUVk15ZmYvUjVSYVFvcURHTmNnSDNGWWIwTjV1OWtuOWxiYmZQ?=
 =?utf-8?B?YVk3Yy91MlArTXVuTUdZWmcwUGhaR2h4TDZ0cXhoR1VPbnFNNmNOMFJGQUNa?=
 =?utf-8?B?cktnY1ZGdXlNeVJZbkR6QkJ2ZjFIVkZyY2VaYXNsVmdNcFFkRFZjVCtYNy9k?=
 =?utf-8?B?M0J6L2xjRVpoUjlPaVlNb3dRT2E4SW90Zy9ERFJaSXIzTGg3U2pwNzF1bnl4?=
 =?utf-8?B?N0tDVTNqc05sMjJrT3c0VWU5RmFXbTdtK0g3bXJSR3phOHMzdWNDRUU4ZCtp?=
 =?utf-8?B?OE5tVEkzVi8vVXBYUVdzZDlzM245cVJDSERhMFJXbG1RV3NVQlAvamdpVTVP?=
 =?utf-8?B?MXkvTmRBK1VYRVBNWndLekFCd2hqbDJCSXN3OVV3OU9mamdmRVVHclplb3pX?=
 =?utf-8?B?V1djQ0JqSm5QanM1N3YzcGtjcmVJTFRiMkIvU1kzdU9HL2pSQllhMHRGNG9h?=
 =?utf-8?B?MjJyUHBrL2t1cXR4VUw2dklLQzd0SFVxNGZodWo1VWdDZDQyN0loaGFVWGdU?=
 =?utf-8?B?MHRQUU9HYnpibzRHQ1BycG1KakZaUWxsZDFWeUViZVp3THN3VW4zb2RlL1Z6?=
 =?utf-8?B?SFF4aXpKdk4wZlR3VXoxenZNTzdPdWJDS1dDOXlFbmltN1NCZW1YUUlIcUZi?=
 =?utf-8?B?dUZWelFPVTVLVTFmakQ5QldNUS8yemNOTEEzczVFSkQ5ZXMrQ0hMTWZkSzg2?=
 =?utf-8?B?QlFZT3RQWmMyRml2TDd5NGJydm1kZm9ZQnMxbW9TVHhpcGJWQ3piYkhoMWty?=
 =?utf-8?B?clpmcEx6YkhwZ20xTzJTeS9kakpqdlEvcDV0Vms5TElheXRjbVdBWEl6RTVS?=
 =?utf-8?B?bGFGSzNlTGhjMVRqaUtZYjdVVS92eTVkdXlqUWgxZW56ZTAvZGxhalVoa3g3?=
 =?utf-8?B?MUZaSDJpV0M2N01QcGhMc2pBYStqekxiTkVpWEdCRFVGbUZseXB5bWdBQ09B?=
 =?utf-8?B?cGttMHpHU0t6emx6b1BOUzRTK05PVmZEU0EvOWRzQ3Q1dnFuU2dxZmpjRjM3?=
 =?utf-8?B?SVpqWkdMRzUyYTJGUlZyRWdteVVLUUZkRGdDcldWYldLNlEvQmdtSlpHN3F4?=
 =?utf-8?B?dHJmVk5LTlArdlptbU1tN251TGdzQ3Q2ZWl2YlJLSnkrL0trNDkvbDd4c1Nn?=
 =?utf-8?B?QmJ2UXdtdFhUdlpsT2xTckw0bHU4SDdTY0pwREJKbi8vOXFhc2JlNUx2aGEz?=
 =?utf-8?B?Ukp3SHkzcVU5REVkdG9Ed0FiaG1IUE1hZXFZOTBXUzRWcjAwa0xMMHFLK1BC?=
 =?utf-8?B?OGMwelNOUkk1NU9QbVRNYjUzWXV6WnVaeFRiRGJVS0UrUDdobEpVOE9rMW0v?=
 =?utf-8?B?aFVzamdlQ2FjQlVTR2dydUdURkxtV2xlU0EybHNmeU8zNU1ZaWxJMHdkQ3Rp?=
 =?utf-8?B?Ymo0U0hNTGVUbGtRbllwVGRvQ3diSURzNHF4cXpITCs2alVybk9ycmZxQXZP?=
 =?utf-8?B?YVpMb3QvQTZyL2YwTEp1V0NZY0w2cDF4c3RmdzhUY2VoVHZGMllFMTFwbEE3?=
 =?utf-8?B?b1JXcURkUmdsYmxLNElsZ2ZjSHc0MjMvcjdkNmFPSzhtNjg0OUNQQWJuZWVF?=
 =?utf-8?B?c3doY3p4SjZ5c09yR3NITzJPeXRac0FhWUswRmZPUlN3MlQ3MHdDRnZaRnJK?=
 =?utf-8?B?THFvelVYZk5KQ3MrQThTQ2FSb0toQWFIcXVrV1duUWNYQVBzSmVTdlhaVVJq?=
 =?utf-8?B?QlEwaEtyQzZmV2RYeTlXTzVFRUVKeUVLaHdaSFI1VWFqMVlpOTZwU3F0amRJ?=
 =?utf-8?B?ZWVtRXRuUEc5MDArcjJTbkdrVnhCVFVzMU5zY1JOUGdmMTkrTVptWFFNaEgz?=
 =?utf-8?B?Vkh0cFhSNHg0ajNIQkcrdjZKMS9wLzZHOEdlUGhhUlVqT1FZWGExdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c297e8-b408-43a2-3004-08dedb2d022d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 07:05:49.1214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDwuDLjZOGm1+fOItaE53ZPEoIgedo2JsvGUkGpqR776tsHHZDtqMpyXqIEXS2R9tkLexGYxEbQak5IG6qkWDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_000607_675896_D746D55F 
X-CRM114-Status: GOOD (  27.88  )
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

SGkgTmVpbCwKCgpPbiA3LzYvMjAyNiAxOjQzIFBNLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdy
b3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1
dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29u
c2lkZXI6Cj4KPiBOZXcgaXNzdWVzOgo+IC0gW0hpZ2hdIE1hcmtpbmcgYGNsa19tc3JfKmAgYXJy
YXlzIGFzIGBfX2luaXRjb25zdGAgaW50cm9kdWNlcyBhIHNlY3Rpb24gbWlzbWF0Y2ggYW5kIGEg
dXNlLWFmdGVyLWZyZWUgdnVsbmVyYWJpbGl0eS4KPgo+IFByZS1leGlzdGluZyBpc3N1ZXM6Cj4g
LSBbSGlnaF0gVGhlIGRyaXZlciBsYWNrcyBhIGAucmVtb3ZlYCBjYWxsYmFjayB0byBjbGVhbiB1
cCBkZWJ1Z2ZzIGZpbGVzLCBsZWFkaW5nIHRvIGEgdXNlLWFmdGVyLWZyZWUgd2hlbiB0aGUgZGV2
aWNlIGlzIHVuYm91bmQuCj4gLSBbTWVkaXVtXSBgY2xrX21zcl9zdW1tYXJ5X3Nob3dgIGJsaW5k
bHkgYXNzdW1lcyB0aGF0IHRoZSBmaXJzdCBlbnRyeSAoaW5kZXggMCkgaW4gdGhlIGNsb2NrIG1l
YXN1cmUgdGFibGUgaXMgcG9wdWxhdGVkLCB3aGljaCB3aWxsIGNhdXNlIGEgbnVsbCBwb2ludGVy
IGRlcmVmZXJlbmNlIGlmIGEgdGFibGUgbGFja3MgYW4gZW50cnkgZm9yIElEIDAuCj4gLS0KPgo+
IGNvbW1pdCBhODE3YTA0YWRlMjBhMDA1MTY4MDhjYTA4NGE2MGRmMTUxM2Q1YjIwCj4gQXV0aG9y
OiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+IHNvYzogYW1sb2dpYzogY2xrLW1lYXN1
cmU6IE1hcmsgdGhlIGNsb2NrIG1lYXN1cmUgdGFibGUgYXMgX19pbml0Y29uc3QKPgo+IFRoZSBj
bG9jayBtZWFzdXJlIHRhYmxlIGlzIG9ubHkgdXNlZCBkdXJpbmcgaW5pdGlhbGl6YXRpb24sIGFu
ZCB0aGUKPiB0YWJsZSBkYXRhIGlzIGNvcGllZCB0byB0aGUgbXNyX3RhYmxlIGZpZWxkIG9mIHN0
cnVjdCBtZXNvbl9tc3JfZGF0YS4KPiBNYXJrIGl0IGFzIF9faW5pdGNvbnN0IHNvIGl0IGNhbiBi
ZSBmcmVlZCBhZnRlciBrZXJuZWwgaW5pdGlhbGl6YXRpb24uCj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc29jL2FtbG9naWMvbWVzb24tY2xrLW1lYXN1cmUuYyBiL2RyaXZlcnMvc29jL2FtbG9n
aWMvbWVzb24tY2xrLW1lYXN1cmUuYwo+PiBpbmRleCA4YzRmM2NjOGM4YWJmLi5lMWNmNjdmYWQ4
M2NiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFzdXJl
LmMKPj4gKysrIGIvZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1jbGstbWVhc3VyZS5jCj4+IEBA
IC01NSw3ICs1NSw3IEBAIHN0cnVjdCBtZXNvbl9tc3Igewo+PiAgICNkZWZpbmUgQ0xLX01TUl9J
RChfX2lkLCBfX25hbWUpIFwKPj4gICAgICAgIFtfX2lkXSA9IHsuaWQgPSBfX2lkLCAubmFtZSA9
IF9fbmFtZSx9Cj4+Cj4+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX21zcl9pZCBjbGtfbXNy
X204W10gPSB7Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX21zcl9pZCBjbGtfbXNyX204
W10gX19pbml0Y29uc3QgPSB7Cj4gW1NldmVyaXR5OiBIaWdoXQo+IERvZXMgbWFya2luZyB0aGlz
IGFycmF5IGFzIF9faW5pdGNvbnN0IGNhdXNlIGEgdXNlLWFmdGVyLWZyZWUgYW5kIGEgc2VjdGlv
bgo+IG1pc21hdGNoPwo+Cj4gQmVjYXVzZSB0aGlzIGRyaXZlciBpcyBhIHJlZ3VsYXIgcGxhdGZv
cm1fZHJpdmVyLCBpdCBjYW4gYmUgcHJvYmVkIGFmdGVyIGJvb3QKPiBkdWUgdG8gZGVmZXJyZWQg
cHJvYmluZyBvciBtYW51YWwgc3lzZnMgYmluZC4gSWYgcHJvYmVkIGFmdGVyIGluaXRpYWxpemF0
aW9uLAo+IHRoZSBtZW1jcHkoKSBpbiBtZXNvbl9tc3JfcHJvYmUoKSB3aWxsIHJlYWQgZnJvbSBm
cmVlZCBpbml0IG1lbW9yeToKCgpQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guCgpBZnRlciB0YWtp
bmcgYW5vdGhlciBsb29rLCBJIHJlYWxpemVkIHRoYXQgbWFya2luZyB0aGUgZGF0YSB3aXRoIApf
X2luaXRjb25zdCBpcyBub3QgY29ycmVjdCwKc2luY2UgaXQgaXMgc3RpbGwgcmVmZXJlbmNlZCBh
ZnRlciB0aGUgaW5pdCBzZWN0aW9uIGlzIGRpc2NhcmRlZC4KCj4KPiAgICAgICAgICBtZW1jcHko
cHJpdi0+ZGF0YS5tc3JfdGFibGUsIG1hdGNoX2RhdGEtPm1zcl90YWJsZSwKPiAgICAgICAgICAg
ICAgICAgbWF0Y2hfZGF0YS0+bXNyX2NvdW50ICogc2l6ZW9mKHN0cnVjdCBtZXNvbl9tc3JfaWQp
KTsKPgo+IEFkZGl0aW9uYWxseSwgdGhpcyBhcnJheSBpcyByZWZlcmVuY2VkIGJ5IGNsa19tc3Jf
bThfZGF0YToKPgo+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fbXNyX2RhdGEgY2xrX21zcl9t
OF9kYXRhID0gewo+ICAgICAgICAgIC5tc3JfdGFibGUgPSAodm9pZCAqKWNsa19tc3JfbTgsCj4g
Li4uCj4KPiBTaW5jZSBjbGtfbXNyX204X2RhdGEgcmVzaWRlcyBpbiAucm9kYXRhLCB3b3VsZG4n
dCBwb2ludGluZyBpdCB0byBfX2luaXRjb25zdAo+IG1lbW9yeSBjYXVzZSBhIGxpbmtlciBzZWN0
aW9uIG1pc21hdGNoIHdhcm5pbmc/Cj4KPiBbIC4uLiBdCj4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4g
VGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhpcyBkcml2ZXIgbGFjayBh
IC5yZW1vdmUgY2FsbGJhY2sgdG8KPiBjbGVhbiB1cCBkZWJ1Z2ZzIGZpbGVzLCBsZWFkaW5nIHRv
IGEgdXNlLWFmdGVyLWZyZWUgb24gZGV2aWNlIHVuYmluZD8KPgo+IEluIG1lc29uX21zcl9wcm9i
ZSgpLCBkZWJ1Z2ZzIGZpbGVzIGFyZSBjcmVhdGVkIGFuZCBhc3NvY2lhdGVkIHdpdGggbWVtb3J5
Cj4gYWxsb2NhdGVkIHZpYSBkZXZtX2tjYWxsb2MoKToKPgo+ICAgICAgICAgIHJvb3QgPSBkZWJ1
Z2ZzX2NyZWF0ZV9kaXIoIm1lc29uLWNsay1tc3IiLCBOVUxMKTsKPiAgICAgICAgICBjbGtzID0g
ZGVidWdmc19jcmVhdGVfZGlyKCJjbGtzIiwgcm9vdCk7Cj4KPiAgICAgICAgICBkZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlKCJtZWFzdXJlX3N1bW1hcnkiLCAwNDQ0LCByb290LAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJpdi0+ZGF0YS5tc3JfdGFibGUsICZjbGtfbXNyX3N1bW1hcnlfZm9w
cyk7Cj4KPiBUaGUgZHJpdmVyIGxhY2tzIGEgLnJlbW92ZSBjYWxsYmFjayBhbmQgZG9lcyBub3Qg
dXNlCj4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgdG8gY2xlYW4gdXAgdGhlIGRlYnVnZnMg
ZGlyZWN0b3J5Ogo+Cj4gc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWVzb25fbXNyX2Ry
aXZlciA9IHsKPiAgICAgICAgICAucHJvYmUgID0gbWVzb25fbXNyX3Byb2JlLAo+ICAgICAgICAg
IC5kcml2ZXIgPSB7Cj4gLi4uCj4KPiBJZiB0aGUgZGV2aWNlIGlzIHVuYm91bmQgdmlhIHN5c2Zz
LCBkZXZyZXMgd2lsbCBhdXRvbWF0aWNhbGx5IGZyZWUKPiBwcml2LT5kYXRhLm1zcl90YWJsZS4g
QW55IHN1YnNlcXVlbnQgcmVhZCBmcm9tIHRoZSBwZXJzaXN0ZW50IGRlYnVnZnMgZmlsZXMKPiB3
aWxsIGRlcmVmZXJlbmNlIHRoZSBmcmVlZCBtZW1vcnkuIFNob3VsZCBhIGNsZWFudXAgbWVjaGFu
aXNtIGJlIGFkZGVkPwo+Cj4gW1NldmVyaXR5OiBNZWRpdW1dCj4gVGhpcyBpcyBhIHByZS1leGlz
dGluZyBpc3N1ZSwgYnV0IGRvZXMgY2xrX21zcl9zdW1tYXJ5X3Nob3coKSBibGluZGx5IGFzc3Vt
ZQo+IHRoZSBmaXJzdCBlbnRyeSBpbiB0aGUgY2xvY2sgbWVhc3VyZSB0YWJsZSBpcyBwb3B1bGF0
ZWQ/Cj4KPiBMb29raW5nIGF0IGNsa19tc3Jfc3VtbWFyeV9zaG93KCk6Cj4KPiAgICAgICAgICBz
dHJ1Y3QgbWVzb25fbXNyX2lkICptc3JfdGFibGUgPSBzLT5wcml2YXRlOwo+ICAgICAgICAgIHVu
c2lnbmVkIGludCBtc3JfY291bnQgPSBtc3JfdGFibGUtPnByaXYtPmRhdGEubXNyX2NvdW50Owo+
Cj4gVGhpcyBpbW1lZGlhdGVseSBkZXJlZmVyZW5jZXMgbXNyX3RhYmxlLT5wcml2LiBJbiBtZXNv
bl9tc3JfcHJvYmUoKSwgdGhlIHByaXYKPiBwb2ludGVyIGlzIG9ubHkgYXNzaWduZWQgaWYgdGhl
IGNsb2NrIElEIGlzIGRlZmluZWQgKGkuZS4sIG5hbWUgaXMgbm9uLU5VTEwpLgo+IElmIGEgZnV0
dXJlIFNvQyB0YWJsZSB3ZXJlIHRvIG9taXQgYW4gZW50cnkgZm9yIElEIDAsIG1zcl90YWJsZVsw
XS5wcml2IHdvdWxkCj4gYmUgTlVMTCwgY2F1c2luZyBhIGtlcm5lbCBwYW5pYyBoZXJlLiBDb3Vs
ZCB0aGlzIGJlIG1hZGUgbW9yZSByb2J1c3QgYWdhaW5zdAo+IGVtcHR5IGZpcnN0IGVudHJpZXM/
Cj4KPiAtLQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDcwNi1jbGttc3Jfb3B0aW1pemF0aW9uLXYxLTEtNzBmNWFhZTZlNjBiQGFtbG9n
aWMuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
