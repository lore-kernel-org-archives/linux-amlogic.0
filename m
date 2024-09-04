Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571D6CA0ED3
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2024 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oCgHwC2sYG4XhdGZnFzIQSF4oYuCkZhbp9jeOGgHn0=; b=AJ3qjZa2Zdynmqdi9SvgnJ4eYv
	64JRBBsLVBZJowuDjtmM0dd3ifSV3smcyEwo4mvxBaEer6kygPwutqZF1TgwtvZM6D5LayoO9tKM0
	/MhDZ/TdNs7oYNBWE4zpApJfNbp7Ub5wgapFq6NXdhbQGn6hcMCjUc2mCkwYID2fcUtlquqexTM+M
	POiAbBBLJLzTJJVVWJp8aPGgQFlJ6x3PjvlOLiWOyx8TK6stu+uaSAQrLiAdF+G9k36QLKZ0Lc2gq
	SUza6RPtU+E4OoY/YtbAmsWC4U+4IYSGyc+q8+yOfZYIr9ZDzySPWo1rroc5OU64V0bPYVMdFfOtn
	8JfVOAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmBW-00000003dwf-2sIA;
	Wed, 04 Sep 2024 09:20:18 +0000
Received: from mail-tyzapc01on2071a.outbound.protection.outlook.com ([2a01:111:f403:2011::71a] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllcj-00000003UNx-2E10
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Sep 2024 08:44:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUqsAr/DEpAqjCwCBE9MX+AGED6bk+c+XTgYsEntzac3d7wA2UE0uXLLQ0PcnPy4e/Igrr42M0WEef/csBXMxMHnHv+6XPOJwGre7Zqp23jdLN/6FtJbbzHANJ4RRB77J24JqPMBY2z/cf6SBfS+iHYjWafUDJe9oEla0i4H+cbJWromqn9zsQKVJ6W5YenLhtz68AsaIS+hNNm+P1PPQSKTSeJNigBnyoN1mDQwaVbzY3DqrO9UewkH3juY/59NoQ/3Wuml8olPYQ7YEF2sF+XVr43Hmkj1Cbe8D5q1TzGmz3RglviQhFxGav0fEgnw+an2fr8Ct4QYhB97RFDRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWTOznvqi15iovuw3OjVeG3enB9m8k1ysZKvvmCP9CM=;
 b=Gt3s5BNMShwyQn/2z5qbxfxNfV+nM8w2T/Nv07TD0Wqc1Eagld1VNkdY68RaiC2sio8xtMiocAtWhIcuFZTmCf426GO8s5ay8eZATvrovQlrTZHEsnaP7sUknMlKfBrciP3bJIPaCYQviKxB+sbUyRrjteW+an3cxXdHDiOMl24qXiXqc1zFEJsVjUJnxojTGmBK1v8QPUJsOnf9qSno1QLFXGmD4/m4mWqmlQvWth/H9hu8i+FdF922GDBMLFfJZYU/QwCwfa+bEfK7hVIWh6Q2093EyX6+BcjTzVPcR5RjOnxKDRqFKaWbg8A/sp5Rh+fxHiC9Q5PcPsEJofeiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWTOznvqi15iovuw3OjVeG3enB9m8k1ysZKvvmCP9CM=;
 b=OLvvD3FYTkb8IICV+Ce7X6eSFMC0mutSG+Zm0lmsmn3bRobAYj1IXsD2MP2uj9MTUX6kpKjxGi67/WxzGxVR5tNX/SoPZCRN7pmXqinqdKQnUmuhUWsWUciXTGSqH+CY7aTwSaH7ciIlEvdFMB9FW4qk/ygdirVjM9oqRKD2RNi4kvXnOMNRRNGvoax0d/ei6Wn76w+2pXLrd3TLKhK0ev54LNFwE6Hn+EH7JbVnBKcGMHyKzYA9vu1DX00bd4Ji7MxpybTN5snhz8lfc9haSG/7fSbOkUmuCI/lIvCwfcCzCbx7RKHvEXJBYQude43LEVRUJhRcdxt906tICdBWDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYSPR03MB7980.apcprd03.prod.outlook.com (2603:1096:400:472::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Wed, 4 Sep
 2024 08:44:14 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:44:14 +0000
Message-ID: <18cba830-cd08-42f6-9c42-92edb7e442e8@amlogic.com>
Date: Wed, 4 Sep 2024 16:44:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] rtc: support for the Amlogic on-chip RTC
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
 <20240903-rtc-v2-2-05da5755b8d9@amlogic.com>
 <7560bdd0-aafc-4c6a-b5a8-f50e9aa3124b@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <7560bdd0-aafc-4c6a-b5a8-f50e9aa3124b@kernel.org>
X-ClientProxiedBy: TYCP301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::12) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYSPR03MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: be736f75-c6b5-4f28-43a1-08dcccbdc131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUxxWWpkK2JFR3Q2Z3VLU2lzdFIxVUFBV3hPR0YwWmdMejFQSk93Q0JWaXA2?=
 =?utf-8?B?TkxJTGtMMGdMVTBMVWt1OTVSWFRjRktXeDVoZ29TL0ZuV2haajBUZmMxWStB?=
 =?utf-8?B?aGZmdjJJQ0dmZDBOTHRwQjVhMENTQ2F3WU1WN0FxUk02YUREWEV5dzJSRUdG?=
 =?utf-8?B?L1E0QUFUcU1ZeDJlcDJhZFc4d2xQaHM1N0l6dTMwRUh0aG1zSE5vejY5VzFi?=
 =?utf-8?B?STlVR24wVkQ2bWRjVTlGUXRrKzlNNFh6N1FzeGExU0Z2YXRES0xRUnhUWEo0?=
 =?utf-8?B?YmhORERJVEowUFpKT3N2bHgvNnhIWk1BL2dJMTg0Z1UxN01UVXVyalF5WWYx?=
 =?utf-8?B?bzNvMkxpczNVRVdzT0l3c2lsamJoeit5b05Rb3RWZEkyUXl4c0FRT0E3L1hu?=
 =?utf-8?B?R0N6K3RLK0ZrbnVpQ3F2eDhyc05Zd2RTVDBob0FFaDFxNkt0N1g5ZUgvS21J?=
 =?utf-8?B?MXZqK003dWYrS2x2dS9idFhUTGx4ZDBBMlBHRi9RNnJyZkhGWFd6U0pXUnhW?=
 =?utf-8?B?V2xDb1l2N2pJOFFubGUvOG9VcVBNS3JkeXdNS0IrZ0NCTjg2RVhDU1ZvdGZF?=
 =?utf-8?B?MGZhVi9jWlNjcDZoOVhIRjNqV1pZeU51ZmE4QlJnSjVoaGRKeDgxcVJKbmZw?=
 =?utf-8?B?cjNMMEdNSk1UUWcrZXl0eXlESjhjZUJIdXo4TkRZaWUrWUNQVzdPNFlxeXdQ?=
 =?utf-8?B?ei9RaFN6RHVpdys3cEVWT0RlZFNsWmtLQVZTZUtFZUFudTQvOXpzLzFpeVky?=
 =?utf-8?B?K2ltZVdTdkRkQWVhcmtOZWRlUTYxcngrbEM4WVJnN3I5VFdndktZdkV4VHBI?=
 =?utf-8?B?K1QrZ09FdGl6VGFBU1hld2p6OCtGREVaSEZOaXdlSXpHWFZ4NDlNWjJOcjZv?=
 =?utf-8?B?YzJHVXpzWWd6UlpadUlYd2d3NFUvSW9KSzZKc05COWcvTzBSV2lza2xYa0xQ?=
 =?utf-8?B?QXpkcGZlQjdFY2tnZ0pBZGp2ZmlsRTN1eCtHem1WZDFDTWhUb2tuaS9uQzZ0?=
 =?utf-8?B?aGZ1YXJVY2R6bkdDR0JVeVovYWoxY3ltUUJ3TWp6M3A1bllpS3RwUElDdFRR?=
 =?utf-8?B?SkZBeER5c21kRXYwZzVxZ1JMMk1QM1FGUDFzOXV3ejc2ZmEzYXp1T2xKQW5v?=
 =?utf-8?B?WWR6byt4OVh3NUtzYjJ1RDZMZVg0VGdnTVljVk5HRGdjZHJscTdpRmxCaGVS?=
 =?utf-8?B?UEh2a1I2K05xMGZJWWxuVi9EZnk4V1RXc3hUMkViMkR0Nk1Vc2VrQ1ZqWFNF?=
 =?utf-8?B?SktVdC8xSzNOd2piajk5ekFueSt1V1BwOUl3VXZSNVRDUWVpRnFMVXFtQmRL?=
 =?utf-8?B?S2xmblJwQmJOSlRNbzdQbVN1RVdUVWdNZyttNDZKZE80ZWVIeXdFY3J2amFW?=
 =?utf-8?B?Z3puTk5wN2tSOG92VW5qWkl3ZE96Mk53TzNhUHhwM2JOaVZhKytTYWlwcTlZ?=
 =?utf-8?B?OGhORFpxTE5iQVVPeDZMQ3ZvZlovQk0zd2k3bG5XR1AyMDlYNW96eXlWV0RH?=
 =?utf-8?B?UFd5a2JSenNObEpCc2pSRFp5enlqWllGRlhMMFZuMEZrTUxlUHZHK2c4YWFn?=
 =?utf-8?B?NWV1ZFNHOGw2VXh4ZUdFYjhZOHVyY1pTTWxWT29IcVdJaUlxbE9OcDdOVVk4?=
 =?utf-8?B?MUZ3QjFQMEl0cFoxb3Y4UVdDcmN6bkJDTVZOWENUZjFMTUdmUVFLUDFIUU1J?=
 =?utf-8?B?Z2E3eHpLbHFRK01TeFFJcGdyd1l6b3Z0eHNGTHd2YXQzdTJtQUQxbTFKV1V1?=
 =?utf-8?B?TmtmOGpTLzVPVmMyL0hDNmg0N3kveUZqKzh5QlU3V1hhRTFpaHpkWUhYUzkw?=
 =?utf-8?B?bFNzTS9FRVJoZXNJbTFnQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkYxM0p6d2ZhWC84SlpQQVdSR01uM21ZMlhSM1lIZWJWY3hkZksyVHJOaW0r?=
 =?utf-8?B?TFJtYnl2aTJFZFVaYk45RHFEWVhDWXVuOFVHTGZzbWluaG1ZU2RrMjVKcGVB?=
 =?utf-8?B?NkxPT1FTZjVZRTR4SXV2cGVRdHhwSzY1ZXhObUpWbGtXUzhydnpkampVc3Jy?=
 =?utf-8?B?UE9HdWErNXJXOEhxVWtGbXRzWURRUU5yWVJDa0pFZFhrNy9NSGVRMHBKL3JG?=
 =?utf-8?B?UnBlUlFkR2ZCMDcwR2xISjg1MkxFQ2pVc1Z1Z3k3Mm00V2RvbFZoOG45cnRr?=
 =?utf-8?B?UTdGSENBTlJVY0tpL3d0R1JlOVRId1ZBcmZCQjJLUmc2b1ZYN2tHSk92T0kx?=
 =?utf-8?B?MEg0RzMzNmtVZHMwVlhrMGY0MXB3SHp0eDlMQzRPSHBocTBUK01ZMnA2eDlm?=
 =?utf-8?B?eFBidm1MaWUrNHkwNWx4WXdNNC90bEkwS280WDl6NlF5Y3FBdW1tOW1wNFZi?=
 =?utf-8?B?WlNBaUkwNXMwZU9CM0hGNU9MWGNJcHZETk9TaWhOQlpwZHFUMldBdVhCUytD?=
 =?utf-8?B?L0w3TEtkbmJFdHpHWWd3aVdZSzlyY2JwbFZTQzkxWFpyV3pJUG1tZVpiRVdH?=
 =?utf-8?B?eVd1UTR5K2hBbm96MXdaVldHQTVlaGM3MHZMR1JnRUlQalhBWDUzKzdwL0VK?=
 =?utf-8?B?R2R6RVFFWmVMM0hxZWFsVjJtZ1llcGVUN1FSU1I0blZuTzZYL1N3L01mT3hv?=
 =?utf-8?B?L0grM2IyTEhWdzEwVm5JUnI1akNZamRnTnE1SUZ1S0t1ZHNYeklRV0w2UnZh?=
 =?utf-8?B?UUI5RnVhZ2IxZStrMWpDZlBKcDcyamM2UzRkSEdvZXFDT3VQaXFEaW93bWt0?=
 =?utf-8?B?eHl1Y0ZUQndRcGZPWmFBaUhheTlid3p6YzNDcHpCSzExQWxrVEl1bDVKQjJO?=
 =?utf-8?B?ZXJIMWxRbVF3cEE4WXFVQWU4U3o0QzI2dnhySWhvci8wc0VkRTVLTTRRRzZz?=
 =?utf-8?B?SDN5dmRKdHNSYmhxdTM5aDNjb1pmOXpYVWx0STZ2b29zWDk1OUlsc2xmYWF5?=
 =?utf-8?B?ZmpVWHFVM2ZHdGgwTXpKK0JRWTJrTnlrcS9XL0lRcHhydTFHUmVwL3p5R21S?=
 =?utf-8?B?Y1Y3UVRYajJsb2NSNHZCZFFJamVTTHJuaUtOQVJ6YmFHRmo2K2c1emxndHBI?=
 =?utf-8?B?MjhLOG1YMm9FSXhxM010Q0I5ZTkzbWp5Q1ZaWmlQazNuRDgwVFBpZW1iT3RP?=
 =?utf-8?B?b0s1TVg2eDNxU3RYNDZqbG5YTzFTUUZrQ2J0ZVgvQXJoOVZHQzdGM1Vtbks5?=
 =?utf-8?B?MzRTY2NxWTYxTVBnRjErY2tOSXM1QW9pMHdveHZMa1ZuR2UydHZTS29nN1VO?=
 =?utf-8?B?UlNGblIwdGJBamIveUMrbzBWbTIwanpXVUl3Q2NOV0VQL0s2TGx4WTJZMUJI?=
 =?utf-8?B?bSt5QW9udytERUtsZkNSbldxQjgvUlNpS1hpWWNwWHc3aEZ5dUUrTENUamFK?=
 =?utf-8?B?aEtxRTJiUlNiTE5paFp3S0lmQ0hNbHJvelRqM0N5c2dnSTJLaGpyYWF3WnNp?=
 =?utf-8?B?RXR0ald2NThlOFdOKzcyV1RHWGcrWXRlMXl3Uml0THI0cUVRclVvOXNQaU5G?=
 =?utf-8?B?eXlyVWh4NmhuSGZqSHpvblowQ0RqOVJJMzVPSlp5RTBDZy8yK0JmNDI4N2p4?=
 =?utf-8?B?TEE2dmV2b1g4a2NyQkVPcUhhUFppUEhHNDdHZG5YVEp6cmoyNVFmWTFrTkcz?=
 =?utf-8?B?eGoxSnFqQXpwNy9jNkxrUkRRSXc3UUdqR1piV0ZVRWFPZFExOU13STRPZXZI?=
 =?utf-8?B?bEx0dXFqWFl1V0dUMWpiakt1YUpOWUw1dDBEY0tOakdtYzRTTGdyR05EdHdB?=
 =?utf-8?B?OVZlL3BWVUhaeFVzNXgrWFJMeGR2Z1Vrd2lPTnE3bFBjNktSeCsrWEJrWnB0?=
 =?utf-8?B?VWRSZUFpdVB3K1RRdjZEdDhySGpWazU2cnBNSDJjVm1EY0MxT3FqbkxWeUhS?=
 =?utf-8?B?aFJzTmZ3L3Bza2tSVkFDd0NydFpkRVBMaXhaQnV3KzYwODltZUN0RTA4WkpR?=
 =?utf-8?B?ZVN3bi9JdFhUT3FlR2c2QktTUzlWTHRQQklWTGtvcitlTERQS21uZFJPTkYr?=
 =?utf-8?B?NThZNVJrT2Y0K3p5N21mK1YyUGczWVJaR09tZE1DYTVwS2FxRnVQSVRGNWxT?=
 =?utf-8?B?SzNWQ0JMSXc0Uk1RMEs5b2tzYVJISVRySlNWc3U2NDhWZVlKRE1xMjBqNXRl?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be736f75-c6b5-4f28-43a1-08dcccbdc131
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:44:14.2663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfKeki8e5IdrfzkxW1qgRhgWA8JxlB4ja609feB3z1pkdx+s+oElxW8UCLBVZcFvESAted0YbolFi9uUIpx0KJ60hHi7QPd95t9UHEueCDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_014421_607862_79A58B40 
X-CRM114-Status: GOOD (  18.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,
    Thanks for your reply.

On 2024/9/3 22:04, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 03/09/2024 09:00, Xianwei Zhao via B4 Relay wrote:
>> From: Yiting Deng <yiting.deng@amlogic.com>
>>
> 
> ...
> 
>> +     rtc->map = devm_regmap_init_mmio(&pdev->dev, base, &aml_rtc_regmap_config);
>> +     if (IS_ERR(rtc->map)) {
>> +             dev_err_probe(&pdev->dev, PTR_ERR(rtc->map), "regmap init failed\n");
>> +             return PTR_ERR(rtc->map);
> 
> Nothing improved. Read the comment. Use git grep to see how this is done
> if the comment is somehow unclear.
> 

Got it, Merge two statements into one.
"return dev_err_probe();"
Will fix it.

> <form letter>
> This is a friendly reminder during the review process.
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 

"So the third driver? What is wrong with existing ones? And why this one
  is named so differently?"
Are you saying these part were not fully addressed? If so, let me answer 
it here.

Yes, this is the third driver.The RTC hardware of A4 SoC is different 
from the previous one,  so need add new RTC driver to support it.

A4 RTC hardware includes a timing function and an alarm function.
But the existing has only timing function, alarm function is using the 
system clock to implement a virtual alarm.

The driver file name modfiy to rtc-amlogic-a4.c suggested by Alexandre 
Belloni.

> Thank you.
> </form letter>
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
