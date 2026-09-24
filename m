Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46637C9830E
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZFmMkKrJgVbS9l3gEpZPCze8QZtIXoNwjXZkz1pZ0Y=; b=kUxE8ZbzJ1j1rB3x3ns8XXQaNU
	cPLo7g+s/V8e8Pmld7c/D8r0cr8kpIwfE+88BFX1Qr0uam69AGNznKrcNDqMLa03Qi4WSYeQW3WqC
	sMjWRYhlM4EKi8/omwiPDk3ZVgbiBinSYaVDd9dI/n8hgQGLWL4Z/VQ+aQyXgjk7nsTm9e/s61iRs
	wqNLNBMEHx7s7wT5Owq/nVkNAvDCkamGtDwKfi4//LsVtsQf7t9W+b6BUDTlruSBrz8ed1cquy9r9
	6eU38qzEYkUImOaBfUJbYMxnBMRIKvDO4utDPpkLRZQX5LsKPCAbrHAALiRCgOe0g3mYwv5DTrVCJ
	4vykNiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gp4-0000000Akbk-329L;
	Thu, 24 Sep 2026 10:37:02 +0000
Received: from mail-japaneastazon11023098.outbound.protection.outlook.com ([52.101.127.98] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gp2-0000000Akb1-01WP
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 10:37:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TN/OAWEjqpz8RXlUG2XyQi2yxtDJQmhZVG+VpMzOW4+H0gwhsNF20luW7f4kYLfiL+3fflN2dgSRceMesBsaCF+Im7GaBJhkNsCWANaCGW5q+tXqGYm0Wm+Udy7uPk2ZXHtV11yNEj7SserpCGh5VAxW+1hBL7g0CLmtUDDX+aVJrl8PACKpkSOWVyp4swzhvTd4E9qDGecT6XmehZXkrw7QUvPfIOAJxW1B3GeT2t1FUci/o/ioVPrCc3Qu71Jk1pgicx0hJITyofdxq1xKyfXRCJb7gy+uste5QC4A4cKB5oviT8vdkvpr6yGz+oj3UnSAvbf7XZWmnJbRKxUyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcxUdSWXO0uo7qWCpzUXhO/KcSLWuya52Xj9nXMGXv4=;
 b=ZrC1IYTR6FPXjxz/xkME2/atQa2iYxCNULQkun5mSbvqyjOck5y/IB9Gpa3/+NCrpo7KSTdEgUs880NQyqsf6uxvGuEXwSutQ/s7NX/o40tb8oa9zshvFhEVdDx5+BZthf5aDSsqu7T61Af+B0ZiPiVCbNtJZCsP2+JmYqV3MMF3kCGlkOtXEJTeZwrVq3v/s3j5HhUxFd7tlOd5K6VgO9xD+U2t6alFSjzVulVN4tSBaFxSoGDe5CbV5BIrU4+WPLM7TywW884SjThKUmWSo1AIx8y7kkyvX6Cv4qbUzBdDHqyANMGKxJlx1TrfGkN1CjfcADDzys32aWLuKz+nzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcxUdSWXO0uo7qWCpzUXhO/KcSLWuya52Xj9nXMGXv4=;
 b=H407oEonkzNix46lWe7RybSOc9/I8TGsJ35NmQuApHl+0wGXx7K5kUxQF1l4OeY4dhLO4XkuGCL8/KXK9329///VDR1WzpkKQYsjCngAAmGyfUP4hm6fvN2NNVxhFh8muP++2rhinNG8X4OJMtwhkU+KFnS92bqiEr8BRz+331Ahe7uVIWRGA/2EoBufZfbvZ52HLoM3VOhfuoZue1nCen06djq9V2cgDmgMFlobTRGFCVEy9A1UZAvt5+XSVcaBHyKb1A173DMDw4BxWe4M8VzgdIBLSauVNSl36afV0XrnY1o1FdREWeWbq4nbfYssOTxej9f8Ga9iQdLyzYpX7g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB7902.apcprd03.prod.outlook.com (2603:1096:820:fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Thu, 24 Sep
 2026 10:36:44 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 10:36:44 +0000
Message-ID: <719ccdb9-82ed-456f-a222-3a0e6319e886@amlogic.com>
Date: Thu, 24 Sep 2026 18:36:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] clk: meson: pll: Remove the dedicated n parameter
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
 <20260923-meson_refactor_n-v1-1-3a8ce27121a2@amlogic.com>
 <20260923112431.925B71F00893@smtp.kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260923112431.925B71F00893@smtp.kernel.org>
X-ClientProxiedBy: SE2P216CA0018.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::17) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 4961a209-e6e7-4c2d-713e-08df1a27ba48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nUY6MUOLN/oHnbZRVsRPvJUXayOqz79WH+0Y+mZtgvkl5A7O6kQ0hZHEQbjFdyHZgaB/OBqYdhDhxSJbJPN8M5FliKZk+wjQyHhweLCx3WUCIUt+8j5axrhSYYatzIppg6rsQbjaNHrlT+lUc+lfH73KR1LuY5IZIK81oA7wQ9cmtvLBsqsUkReRGM/sX0O5N4UavinRwWU/vWOEx2UZvTdxDHEWjlX6UGMGxIRzWI5urX2i9zyaTHawmZlg+l0RxUHofbPSudQL3zOyQcXmZ44hIshQpKB7IY6PJtqQl5XUCAvqaT5Cm386u/EwxpVoZGU0JwfhgM2jBcJqctmJZphCxyLHA6ctb2TNkQSM+/nVrtcw5EZARIf7r4NrbtSTI3KLWMPP9sFUKqbHjD7Mh9qhyBv1f2O6ArllaL1UsXRqBwCF+xEKKdLMSqR8j0M1MBS5ZZ3h6pvvKGTq4W6hwMzkh5teTUYCpbZr+3F1m1S06iq/TSfnfou4TeA0oVZShVUvzwn9Xw7bB7glxi0P1JFw1BjPJXvNnAGQRzgxxY4QqX/yZJxGBj6pntv1StBSK/fbhzX7lv3TT2P+fe1AcS8KnK2V/qnZt9N7euaz/wY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUxjaGdZeW5LT1B5bXJpVTNHS0hISXR1MTdsOEkyc0ZMN1FrSFVFalJaajF3?=
 =?utf-8?B?K1pyZEIrRjFhVzlOMDYrc2Znc01MRDhMaW9GMEFzb1BYV2VVOFFubkdtMWdo?=
 =?utf-8?B?bHFYVHpEWXBSTUY4KzgzT0Y3eWIyUHM3ZUxXa1J2TVV4eFpnMWxzOFcvZzhz?=
 =?utf-8?B?TFEzUVZBcExjY21nNGtwVlErdGpGcms3YVdxUi8xU1pVNlUyUDBsQzZlUWEy?=
 =?utf-8?B?aktlUHZCMURwbjBZSER3RDNjc0w4d2JmS1hMaGlmc3hGeUJCako4MUM3UFVz?=
 =?utf-8?B?ZzF6elg2VXhXcEUrMEJPcllyV2lCN0FoZXhnTDc3VnBRU3ArbjhYT0RUQTNJ?=
 =?utf-8?B?dmdJdXpON0NSYVhEZXBmdXUyc0g1WGtqWTFxenNPUTBoNjhCU0lVZ2ljSnNp?=
 =?utf-8?B?dDl3TllMdkNGYlE1a1RaMk1NRUJiM1lOdEpKaEk5cDFrTzZSZThnUWh4aGJ4?=
 =?utf-8?B?VVpwTWFOZ1RKNTVUZUMwc2Q5OEFpQTVmRVU3ZCtpZFY1Vlk1ZVJzMlFidnhC?=
 =?utf-8?B?Nyt6aC9CRDVDaDVkOHpsRHcwaXR2ZHVVaTJRMU5DL1lBb1NENmovV21BUE45?=
 =?utf-8?B?cVRsMS9rc0F3L2lWVU0xSmZDVmNPWC9YK2pXN0JBRktrdk9YbGF1RG5oMGd4?=
 =?utf-8?B?QktJcHVsNkFudGR6cHR5dG1TU1ZSbC83UGNUdUx3a0drSUJveTRpb3p5dGZG?=
 =?utf-8?B?WHkzUTBqSXd3a1I0MDRQbERlVDRHRDVEMFhac3FzQk41OE1tZ0pJdmZSL21s?=
 =?utf-8?B?MDNyMVJqMFgrU0ZtbkRyaWlaemU3em51QXhmMkdMMmpGbmsraHZsZkdQbzZi?=
 =?utf-8?B?NE8zSU1GR3RyV1Uya21uUE9oak5RWjRvSm5FaTZ4ZnN5THFUTzhkcHJlaEM3?=
 =?utf-8?B?ZnZRakd6QVRKazJZNElFZEFuRXIrMVpUS09kZHF4aFlyMmJEVUJMdnRPMjVS?=
 =?utf-8?B?dm9IYURLY0FHY2t2MU5XN0Y5MFJUa2ZCMU8wYTJ3amRncXhTZkZ1bmQ3VGc3?=
 =?utf-8?B?L3JpcWhRTlhEV21yMEVnVG9qTWpmdjUrbHlmdWdNQTNlMjAwSkM4dWszb1pk?=
 =?utf-8?B?cStMNWpPTDhtbVpUUzFCNEpUdmJEWmp6ckFDUnRPMFkyc0w5WlNRbFd0dlpP?=
 =?utf-8?B?c0o1Y2FZZytWaUtzNmRTS3hRd21Cbm55c2gxTlF6NXc4UzRMeFdLNXZ4WlYr?=
 =?utf-8?B?R0pGNVN4RnlyS2hpek1NU1NEbW1wZUVHYWVybi9Sc1E3L3Y1bXpoSlZLMTVP?=
 =?utf-8?B?NjVJWUhPdzU3TGgxakl2SDZpdCtZTCs0djkzRTJPY3R3WmtHVHM0U2dyaTNp?=
 =?utf-8?B?NXAweXE2eCtDVk5BdnJPQUpmZlF3alZNell3K1d5TmU1ZjBxS0t4ajk2SGlG?=
 =?utf-8?B?Y1U0SllNWmtHdHVtZnhnL2JHU0wydjBQeVIvWisxdmlPbXlSR0owUmhWSzk0?=
 =?utf-8?B?M3p2Y0ozNkhzNEdseFRocml1U0hUcXc5OUxHRkUzdy9PSjFoV0lwUXBkam41?=
 =?utf-8?B?aVlkbTY1R1RZcEdPTHYwMFlrdXl5NzlFL2FpYXVNVTgxeldFNVF2WjBlb1Fx?=
 =?utf-8?B?WGtKU2ZXNEFaZUZqdmhiQTQycUViM2NBTE5zajkraWZ2QmUyTjYvUGk5THNu?=
 =?utf-8?B?VE9MUTZvTitNc2pqYlVHWG1CTnNNRUkxRHI1anJQaTFNMjFRRDkvUnJhUDN2?=
 =?utf-8?B?SzdGMXV2NklMMzNvK01ON0cyTnpyVENtbndQZ055YXJMakxWaXFFZUVwcVlX?=
 =?utf-8?B?SzZqRWNYWGxvWVYyNEdkNUZTc1plN0VmOUY3c2k1TE5acGpydGpRU3J2R005?=
 =?utf-8?B?ZTBsVjJuK01jRVk5LzBMZVdWTVByMDJRc3pOcmFXM1ZNR3hPbVdtbzVNQUo2?=
 =?utf-8?B?YXlZdytBOEdLanZ4ZUhTRkFMeEg2REZ5R3c4N1FqaUZYVGRMV2Ivam51ZytC?=
 =?utf-8?B?SjU0Vk16UWRPR24rMUNhbGdmM1FzS201dWM0aWZSK0JoUFIyRnNzcGVpTjRP?=
 =?utf-8?B?TWxaYlpScnJjdCtNdVRKc1NqL2pjRTEyZlA3WkU4MnBvd3U4M2dXK1Z0bzFr?=
 =?utf-8?B?RXFVdlM2a1ZvRkduaFphcitOMlRLY1JieHhGVStZNjZhbS85cWZPSjIyL1I0?=
 =?utf-8?B?MjUwLzRmRml3SThhT0UvRGg0OEdJK2V0cmdreTFyT2ZVQWZKeUtvZWc3M3dj?=
 =?utf-8?B?N1pOdWF1MldpSis1Mmt2MXQ5OXRKaGh4RTJmVUlud2R5WjNDUUpvY1ZETVVa?=
 =?utf-8?B?ODRWMG1zMUFPM0pIcUd2N2dJZU85Q2pBeGs4dnoxYlYzZk1VWHE3UXRGWFN2?=
 =?utf-8?B?OUlzbUQwT2NYdE01YUJDUUcxMW9DaURJMUJseGY4d2hwNVFjMHVoUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4961a209-e6e7-4c2d-713e-08df1a27ba48
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:36:44.2576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7j7kE3Kps4O2400iI22YFh1qJbZaX9YKzubyRuZMXpzrcUv8JCAdqFVKTd/gB5aaRzBq9z7jWcJ9hrQeJ8yT9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_033700_082372_6DC9E12C 
X-CRM114-Status: GOOD (  23.33  )
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

Ck9uIDkvMjMvMjAyNiA3OjI0IFBNLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOgo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDMg
cG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0NyaXRpY2FsXSBjbGs6IG1lc29u
OiBzdHJ1Y3QgbWVzb25fY2xrX3BsbF9kYXRhIHJlbW92YWwgb2YgJ24nIGJyZWFrcyBjb21waWxh
dGlvbgo+IC0gW0hpZ2hdIGNsazogbWVzb246IHBsbCB1bmNvbmRpdGlvbmFsbHkgcmVxdWlyZXMg
cmFuZ2UsIGJyZWFraW5nIHRhYmxlLWJhc2VkIFBMTHMKPiAtIFtIaWdoXSBjbGs6IG1lc29uOiBl
eHRlcm5hbCBwcmUtZGl2aWRlciB2aW9sYXRlcyBQTEwgZGlzYWJsZS9yZXNldCBzZXF1ZW5jaW5n
Cj4gLS0KPgo+IGNvbW1pdCA5YTBkOWViMDc1NTc2ZDI0NGMxNjFmNjIxMzQxMDlhZDIzNTNhOGI3
Cj4gQXV0aG9yOiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+Cj4gY2xrOiBtZXNvbjog
cGxsOiBSZW1vdmUgdGhlIGRlZGljYXRlZCBuIHBhcmFtZXRlcgo+Cj4gVGhlIE1lc29uIFBMTCBm
cmFtZXdvcmsgbW9kZWxzIHRoZSBQTEwgcHJlLWRpdmlkZXIgKE4pIHVzaW5nIGEgZGVkaWNhdGVk
Cj4gZmllbGQgaW4gc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YS4gU2luY2UgdGhlIGNvbW1vbiBj
bG9jayBmcmFtZXdvcmsgYWxyZWFkeQo+IHByb3ZpZGVzIGEgZ2VuZXJpYyBkaXZpZGVyIGltcGxl
bWVudGF0aW9uLCB0aGlzIHBhdGNoIHJlbW92ZXMgdGhlIGRlZGljYXRlZAo+IG4gcGFyYW1ldGVy
IGZyb20gdGhlIGZyYW1ld29yayBhbmQgc2ltcGxpZmllcyB0aGUgUExMIHJhdGUgY2FsY3VsYXRp
b24uCj4KPj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jCj4+ICsrKyBiL2RyaXZl
cnMvY2xrL21lc29uL2Nsay1wbGwuYwo+IFsgLi4uIF0KPj4gQEAgLTExOSwxNDUgKzEwNyw0OCBA
QCBzdGF0aWMgdW5zaWduZWQgaW50IF9fcGxsX3BhcmFtc193aXRoX2ZyYWModW5zaWduZWQgbG9u
ZyByYXRlLAo+IFsgLi4uIF0KPj4gLXN0YXRpYyBpbnQgbWVzb25fY2xrX2dldF9wbGxfdGFibGVf
aW5kZXgodW5zaWduZWQgaW50IGluZGV4LAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm0sCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqbiwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSAqcGxsKQo+PiArc3RhdGlj
IGludCBtZXNvbl9jbGtfZ2V0X3BsbF9tdWx0aXBsaWVyKHVuc2lnbmVkIGxvbmcgcmF0ZSwKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBhcmVu
dF9yYXRlLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCAqbSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
bWVzb25fY2xrX3BsbF9kYXRhICpwbGwpCj4+ICAgewo+PiAtICAgICBpZiAoIXBsbC0+dGFibGVb
aW5kZXhdLm4pCj4+ICsgICAgIGlmICghcGxsLT5yYW5nZSkKPj4gICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gW1NldmVyaXR5OiBIaWdoXQo+IERvZXMgdGhpcyB1bmNvbmRpdGlvbmFs
bHkgcmVqZWN0IGFueSBQTEwgdGhhdCBsYWNrcyBhIC5yYW5nZSBkZWZpbml0aW9uPwo+Cj4gTWFu
eSB0YWJsZS1iYXNlZCBQTExzIGluIE1lc29uIFNvQyBkcml2ZXJzIChsaWtlIGF4Z19ncDBfcGxs
X2RjbykgbGVhdmUKPiAucmFuZ2UgYXMgTlVMTCBhbmQgcmVseSBzdHJpY3RseSBvbiAudGFibGUu
IFdpdGhvdXQgLnJhbmdlLCByYXRlIGNhbGN1bGF0aW9ucwo+IGZvciB0aGVzZSBQTExzIHdpbGwg
ZGV0ZXJtaW5pc3RpY2FsbHkgZmFpbCBhdCBydW50aW1lLgoKClllcywgdGhlIHRhYmxlIGNvbnNp
c3RzIG9mIG0gYW5kIG4sIGFuZCBuIGhhcyBub3cgYmVlbiBkZWxldGVkLgoKVGhlcmVmb3JlLCB0
aGUgdGFibGUgbWV0aG9kIHdpbGwgYmUgY29udmVydGVkIHRvIHRoZSByYW5nZSBtZXRob2QuCgo+
IFsgLi4uIF0KPj4gQEAgLTQyMCw3ICszMTEsNyBAQCBzdGF0aWMgaW50IG1lc29uX2Nsa19wbGxf
c2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiBbIC4uLiBd
Cj4+ICAgICAgICBlbmFibGVkID0gbWVzb25fcGFybV9yZWFkKGNsay0+bWFwLCAmcGxsLT5lbik7
Cj4+ICAgICAgICBpZiAoZW5hYmxlZCkKPj4gICAgICAgICAgICAgICAgbWVzb25fY2xrX3BsbF9k
aXNhYmxlKGh3KTsKPj4KPj4gLSAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+
biwgbik7Cj4gW1NldmVyaXR5OiBIaWdoXQo+IERvZXMgc3RyaXBwaW5nIHRoZSB3cml0ZSB0byB0
aGUgTiBwcmUtZGl2aWRlciBmcm9tIHRoaXMgcHJvdGVjdGVkIGF0b21pYwo+IHNlY3Rpb24gdmlv
bGF0ZSB0aGUgaGFyZHdhcmUgcmVxdWlyZW1lbnQgdG8gcGxhY2UgdGhlIFBMTCBpbiBhIGRpc2Fi
bGVkIGFuZAo+IHJlc2V0IHN0YXRlIGJlZm9yZSBpdHMgaW5wdXQgZnJlcXVlbmN5IGNoYW5nZXM/
Cj4KPiBCeSBtb2RlbGxpbmcgdGhlIHByZS1kaXZpZGVyIGFzIGFuIGV4dGVybmFsIGdlbmVyaWMg
Q0NGIGNsa19kaXZpZGVyLAo+IGl0cyAuc2V0X3JhdGUgd2lsbCBtb2RpZnkgdGhlIGhhcmR3YXJl
IHJlZ2lzdGVyIGltbWVkaWF0ZWx5IHdpdGhvdXQKPiBub3RpZnlpbmcgdGhlIHJ1bm5pbmcgZG93
bnN0cmVhbSBQTEwuIENhbiB0aGlzIGNhdXNlIHRoZSBhY3RpdmUgUExMIHRvCj4gbG9zZSBsb2Nr
IGFuZCBwcm9kdWNlIGFuIHVuc3RhYmxlIGNsb2NrLCBwb3RlbnRpYWxseSBsb2NraW5nIHVwIHRo
ZSBzeXN0ZW0/CgoKU2VwYXJhdGluZyBOIGZyb20gdGhlIFBMTCB3aWxsIG5vdCBhZmZlY3QgUExM
IGxvY2tpbmcuCgpUaGUgUExMIGxvY2tpbmcgb3BlcmF0aW9uIGlzIGluaXRpYXRlZCBieSB0aGUg
ZW5hYmxlIHNpZ25hbC4KCj4+ICAgICAgICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxs
LT5tLCBtKTsKPj4KPj4gICAgICAgIGlmIChNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+ZnJh
YykpIHsKPj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5oCj4+ICsrKyBiL2RyaXZl
cnMvY2xrL21lc29uL2Nsay1wbGwuaAo+PiBAQCAtMTEsMjkgKzExLDE3IEBACj4+ICAgI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPgo+PiAgICNpbmNsdWRlICJwYXJtLmgiCj4+Cj4+IC1zdHJ1Y3Qg
cGxsX3BhcmFtc190YWJsZSB7Cj4+IC0gICAgIHVuc2lnbmVkIGludCAgICBtOwo+PiAtICAgICB1
bnNpZ25lZCBpbnQgICAgbjsKPj4gLX07Cj4+IC0KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gRG9lcyBy
ZW1vdmluZyBwbGxfcGFyYW1zX3RhYmxlIGFsc28gcmVtb3ZlIHRoZSBmcmFtZXdvcmsncyBjYXBh
YmlsaXR5IHRvCj4gZW5mb3JjZSBub24tY29udGlndW91cyBQTEwgbXVsdGlwbGllciBydWxlcz8K
CgpZZXMsIGl0IGxvc3RzwqAgbm9uLWNvbnRpZ3VvdXMgUExMIG11bHRpcGxpZXIgcnVsZXMKClRo
ZSAicmFuZ2UiIG1ldGhvZCBjYW4gY292ZXIgdGhlIGZyZXF1ZW5jeSBwb2ludHMgb2YgdGhlICJ0
YWJsZSIgbWV0aG9kLgoKSW4gdGhlIHByZS1kaXZpZGVyLCBOIGlzIHR5cGljYWxseSBmaXhlZCBh
dCAxLgoKPj4gICBzdHJ1Y3QgcGxsX211bHRfcmFuZ2Ugewo+PiAgICAgICAgdW5zaWduZWQgaW50
ICAgIG1pbjsKPj4gICAgICAgIHVuc2lnbmVkIGludCAgICBtYXg7Cj4+ICAgfTsKPiBbIC4uLiBd
Cj4+ICAgc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSB7Cj4+ICAgICAgICBzdHJ1Y3QgcGFybSBl
bjsKPj4gICAgICAgIHN0cnVjdCBwYXJtIG07Cj4+IC0gICAgIHN0cnVjdCBwYXJtIG47Cj4gW1Nl
dmVyaXR5OiBDcml0aWNhbF0KPiBEb2VzIHJlbW92aW5nIHRoZSBuIGFuZCB0YWJsZSBmaWVsZHMg
ZnJvbSBzdHJ1Y3QgbWVzb25fY2xrX3BsbF9kYXRhIGJyZWFrCj4gdGhlIGJ1aWxkIGZvciB1bnRv
dWNoZWQgU29DIHBsYXRmb3JtIGRyaXZlcnM/Cj4KPiBEcml2ZXJzIHN1Y2ggYXMgYXhnLmMgY29u
dGludWUgdG8gaW5pdGlhbGl6ZSB0aGVzZSBmaWVsZHMgaW4gdGhlaXIgc3RhdGljIFBMTAo+IGRl
ZmluaXRpb25zIChsaWtlIGF4Z19zeXNfcGxsX2Rjbyk6Cj4KPiBzdGF0aWMgc3RydWN0IGNsa19y
ZWdtYXAgYXhnX3N5c19wbGxfZGNvID0gewo+ICAgICAgICAgIC5kYXRhID0gJihzdHJ1Y3QgbWVz
b25fY2xrX3BsbF9kYXRhKXsKPiAgICAgICAgICAgICAgICAgIC4uLgo+ICAgICAgICAgICAgICAg
ICAgLm4gPSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIC5yZWdfb2ZmID0gSEhJX1NZU19Q
TExfQ05UTCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgLnNoaWZ0ICAgPSA5LAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAud2lkdGggICA9IDUsCj4gICAgICAgICAgICAgICAgICB9LAo+
Cj4gVGhpcyB3aWxsIGNhdXNlIGFuIGltbWVkaWF0ZSBjb21waWxlciBlcnJvciBiZWNhdXNlIHRo
ZSB0eXBlcyBoYXZlIGJlZW4KPiByZW1vdmVkLiBXaWxsIHRoaXMgYnJlYWthZ2UgcGVyc2lzdCBh
bmQgYnJlYWsgZ2l0IGJpc2VjdD8KCgpUaGF0IGlzIGluZGVlZCB0aGUgY2FzZSzCoCBJIHdpbGwg
aW5jbHVkZSBjbGstcGxsLmMgYW5kIGFsbCB0aGUgUExMcyBpbiBhIApzaW5nbGUgcGF0Y2guCgo+
PiAgICAgICAgc3RydWN0IHBhcm0gZnJhYzsKPj4gICAgICAgIHN0cnVjdCBwYXJtIGw7Cj4+ICAg
ICAgICBzdHJ1Y3QgcGFybSByc3Q7Cj4gWyAuLi4gXQo+PiBAQCAtNDEsNyArMjksNiBAQCBzdHJ1
Y3QgbWVzb25fY2xrX3BsbF9kYXRhIHsKPj4gICAgICAgIHN0cnVjdCBwYXJtIGxfZGV0ZWN0Owo+
PiAgICAgICAgY29uc3Qgc3RydWN0IHJlZ19zZXF1ZW5jZSAqaW5pdF9yZWdzOwo+PiAgICAgICAg
dW5zaWduZWQgaW50IGluaXRfY291bnQ7Cj4+IC0gICAgIGNvbnN0IHN0cnVjdCBwbGxfcGFyYW1z
X3RhYmxlICp0YWJsZTsKPj4gICAgICAgIGNvbnN0IHN0cnVjdCBwbGxfbXVsdF9yYW5nZSAqcmFu
Z2U7Cj4+ICAgICAgICB1bnNpZ25lZCBpbnQgZnJhY19tYXg7Cj4+ICAgICAgICB1OCBmbGFnczsK
PiAtLQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDkyMy1tZXNvbl9yZWZhY3Rvcl9uLXYxLTAtM2E4Y2UyNzEyMWEyQGFtbG9naWMuY29t
P3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
