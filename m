Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0405CD4F21
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 03:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09lfDxr7dmzWS/4kGUjVYXaIWOxNzODFKVwyMoljegY=; b=Yo/ocZSY8NzR+OP5tSO7z65ljA
	Nt8+++5DsOaobPj8/dlSPbmtERYiJ8Dxm+rZywNaS5VDydTVUBwn9kT5RQOclhaqAMx1ZQSOe4Fei
	rjZNPSIlWP8cue0QpnFXib5vZ1+bY9ZLhd52ZHI/9/CP3GfQdUaWrYoMrf9jJf6PijGPXDV9+BDWM
	QX4RLlHy4MQSNz7a0fHvmyo+OGVva25Mt5h5fTFmCXC0TIF6+gnFtrL7CsUWyf3LrtuTH4otboteQ
	2V1GIquQ8zZsvl268xsgPDKAF/Iw4kNiLQF8oe/T0Su3qGrH70LJm95G8ILekMRqkbJEs8VFS/DCi
	NPoVdJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0fF-000000018wL-3QvL;
	Wed, 13 May 2026 03:53:41 +0000
Received: from mail-koreacentralazon11023099.outbound.protection.outlook.com ([40.107.44.99] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0fD-000000018vX-25EM;
	Wed, 13 May 2026 03:53:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1iIWI92IAEkhLob7acAxoAh/dPPUxKu4cfKT41N+jjHwppjhNHvgjCOwIjoqX205qULY8idNIW2PwkiUHR8WLYXpf7tyJYyvmzI7sENCyHZf958i56mKHfQaszhuzHkeGxIovyVLv61i2ct4FrA8w4I7m77Tg19HtYSa3b9Fy+r6Z9gtf2dZQQeUCj5grXfL/+BMP0JgI7V0EIuQ4IieDAnDyQyPVrG4a5F9Eh+FiSsPsn5lX5lFvLgjSIWZc5arN4w6oOOFo9d3qC4lsfNT7S4MBTfyccoeHpSw6NoiiM7uuPdD8SfSiE7+Y2tvJUusYHnfZmKNPHxkuAOT8NDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGhCh2OQkZFdnv4sRHIHoYbKGv1fjIyVUxMgrDgsNmM=;
 b=PEp/m9R+moBzezYIhgig21CAG8Yu/TCBBXihFlYVuCl7okBPnb42oMeOXTvjz+PZErohymEZTcnCt5lOZhEMwiOZF71obLeiku3Zvh0jYtS/G/C5nUCjrcFXMkD5XG0OsRyeeiPntw1qlLQyCxTUFCxaRk5t8Rhq+L/lXydueZXoCENWaZxrlSQggdKzZwm0fEgTVb78hFjIsdymkHE6CeNiuTpWiAJaokOtRilRJGyrd5hS2Lz04O4x+30nArz1zFHTjjcx3rZ4eAJhnBNINuwufCJNuyI3JgCPhDqe7w35J4L9laQ0T3+iXCfGFtTTaRv7CfL4fPMBMAZE+CnEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGhCh2OQkZFdnv4sRHIHoYbKGv1fjIyVUxMgrDgsNmM=;
 b=rUkd0Dk56Mqk3wuoBnSf4sYc1TRbZlciEo6sJepvw4ITBzW1dZMilKOufnviRIf65M73QRSJybb0vuIwdZQf+JVjp8v+09NDNuwcQh/uIb9ih8hV2ZK278HEpZjqHAbYE1PG1PWZXiKB3T5YUwwnvmRedBzqFd/w0CU2Vm8clgdsyH98s3Y4xcerGJyLOi7JFi6QcVaPBXMDR/X05z/Ws6y/UyADmVpXcKMXHDLjSOmKpukdAIF9C26ypSWUfilw24BCImPQaVDVwE50DgB5z6xpkYLiqHE4XCvPoCpB2ou+8mPI5NYU7DufNf6Np2oh2zUOHWJCxX1Fn/9mmk5tsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7837.apcprd03.prod.outlook.com (2603:1096:101:17e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 03:53:20 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 03:53:19 +0000
Message-ID: <f597307c-d1c0-4add-b3f9-34ee1bda0a24@amlogic.com>
Date: Wed, 13 May 2026 11:53:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] clk: amlogic: PLL reset signal supports active-low
 configuration
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
 <agH0FMzku3QRlB50@redhat.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <agH0FMzku3QRlB50@redhat.com>
X-ClientProxiedBy: SE2P216CA0007.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::9) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 305aaf65-63b9-4d3c-afa6-08deb0a32bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: R68Uj9LQI8rj5Dla3KklwfvX7dOQkhruxEpUVggFQw6AwQRLVbvNfz8RF0QnFx9XubmqkUs3OBHq6eyeRA18HUvIs08Tj1vzkTbANpUXkY+IrAEPBT+VE+6ttbAuSxDiQQp8xQvymYP9/aU3kaGbUSP0f2/pinsjeikysP2lgFRT6YqOOZpkbdyKZyBlxyzOkzemczLlx+BMvDDftee3doo184WZX51YoD/wlt0Se7dSG0q6yuJOdqc7AWS/D/oxMwFh9S6Vq1QNbTksqRTjztjqJBzRuyIV+Y32T8cZzRvei/K3vHfPIJnvpwtdtuJZneGie+P5yu+BbypjRoRYbZdh8Dq3Y9j7bvc+7vaU8gdfwRi7HjPNmr8bQV/UdJEaulopugOT2a1PRyDd+Jskgk2cOX6epW2M32JOsRm7ARex2+9iebVClpv6GkgcQFxJZjUQ+XVVSLjHXiVhwOUBLLJdM4WrLKdLlOyJfcyChTLcA7qg/mjW/s5VUSotzm7siKT4KS1xWToMXx7sOofsJWqNsXP8he1W6UxLqoo8CLXnuZSCcmgwb3U+24Yyv3o3AXRgY1VRRH6RolFtIOjP/+y8wn/4jbFo/GBdz44/Ny5dycM2brZUBTRLbdMjRuljQ+ArAphTXdY1VAwXiItL7JM6bl4GTIZMk3wYnK98lfxt+QQZCDyoUyfFZON8CYaf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGVja0dSZVZPbkVObWFpZzNkWlhlYWFoUWxlQmh6SG5UY3FtWWlBcGFrcWdy?=
 =?utf-8?B?WnZNa0Q4VVRKZU13RWl0WTVJMXl5a0xlZTNOV0JJbTFNL2NLS0FkRStpc3hE?=
 =?utf-8?B?OXpmUVk5TXM5aGxQd2NVVExBUG5YMGR1VExCcFFKZDBGd1d4Y09VUnpicXNu?=
 =?utf-8?B?Y21GSnJqYkZTUTZHM2IzandIZTlrVGY0c3gwUE1IOVJ6TFdOVks5TE4zLzZt?=
 =?utf-8?B?OEZ2enVqenliVTkxNDhqTUJyaXV0cHlLVHk3MXhoQ0w5ZzFQc003YXFpTktj?=
 =?utf-8?B?ZElyRHJYTTFUTU5qZFVXWWhmUjBEakxKUkgxVG9zLytZTjNzWDhIVlRxc2Ix?=
 =?utf-8?B?ajkydTUrUW5nNlJyR2dWanhldktNeC9mcDdZVTlKTWdCTVVra3FIeVZCeXNp?=
 =?utf-8?B?NEl3SWtzR0F4citnNGF5U0JGK3JTQUE5NnJVZVFUMnpTWHZ5OUpZZkZsbDlT?=
 =?utf-8?B?UlRuWTh1K1VPd2xMMVJ4T3FqR3VKTGZQY0x5ZC91NVpHclFNSWpwak9LSnhD?=
 =?utf-8?B?RG9Jbm1sRTVzNUV1VHhlbG1Ka3JWQmc2MmZQVUJSbERGSmptbnV3bzNHWWJE?=
 =?utf-8?B?THlHS0g4NkFmRDlrZk1NbEg1aU8va050VkdpeVV0ekw2K1hVN0lHVk9GQ1Zo?=
 =?utf-8?B?bzd1ZGZvZHpYR3puaDJDSStsV2tLY2l6VXdpT2lpb0JCUUNudzMwbG1KbUtz?=
 =?utf-8?B?ZVNVV2dtdlZ6dlRoTVEyQk9TTXJRdFdMWlNxR1lkckdkb3JjODgyM0g5OEov?=
 =?utf-8?B?ZlFCTU1PWlAvWEQ2RW1SdHZLWXV4Mlp4RTB0aC9SRUxMZUtiRkFodmxiZ281?=
 =?utf-8?B?Y21YOWNBbTF2dG1OSjcySWlPY3JvR3YxdlVOOXFwMmJ2UzFRcGJ6THVvTlNz?=
 =?utf-8?B?L2Voc3o1STMyb0xVR0RTSVMyZ0xyS2lWaHNJSWlYVDdHUGJPUWFPcmhKSDBs?=
 =?utf-8?B?THBES3pMYnlLckgranBNSXJRN0o3Q0VVS0NTeGhSYnpvdWtvZ2puR04wZ0Zr?=
 =?utf-8?B?TUxkMS9TWEozb250dEpKcU9WRnRMYlVWUC8xRWQ0c2ZBamdHM2lwdENEcmgw?=
 =?utf-8?B?L3JVNnBkVUJ1SHdYbzRTVk1JdVJlR2lHK0poYllQVGtCbytxR1EvV0ZwQWZD?=
 =?utf-8?B?UThHY2EwRHJuSTdFbmlwMVgzUTlpVXFGWW02bjZseDF6M0s4QkwzaFRCbGNk?=
 =?utf-8?B?cEIxWTRwMGNERWlPR3FxT1hWdmhzdDlvcThpbTJMSEp5NUNOQnJBeW9ncEFM?=
 =?utf-8?B?SUFZODhqeG1DUXFZakpYSnpZYlFsWGYxeXFaRmt2SEtJWnVzQjcrUTI0eCs1?=
 =?utf-8?B?RXQ2Z2xDQ1RUbllLYTRlVXRtdzJ4M2YzdjVNbUlCb21LamhaNFMzN3ZWYnY1?=
 =?utf-8?B?NkQxZkVHSlFmSGlFdFF3ejh0eHBoOGpNZWFUaGMwZG1iWm1Fek85RDN2Z3hF?=
 =?utf-8?B?czgvQUNJLzRSS0dLRWNCa0sraUlYNTNyTlRQeU5lOW9QbHV0VEFIN3FwZUFi?=
 =?utf-8?B?U1pTQXh6WXRISjJTSk83cloveTkvSGE1aE4vMjg0R1lTTklFN0laUGV3bm1a?=
 =?utf-8?B?cmxHUlRNa2xHNlNjMUZrcE5CS0ZUa00zbHJ4dU5vNHNDNzlOV3JOS2s3cjQr?=
 =?utf-8?B?bUVKK0ZoL2ozR1g4T0I2amd1R210NHl2T0NDMkNkUWJmUWVVTTNTM2ZOYkhv?=
 =?utf-8?B?ZWN0L0VTcFJDMHdsbEh1SkF3ekZjeEJXVFcxTng0VDh6VGZucTQ0cTYrTThG?=
 =?utf-8?B?VTZIYWVCZ0VmSUFuSzBHZFhrbEJnMUI1aUg3cTBqVGpwb1NZb1I2eGJTZDNx?=
 =?utf-8?B?OE91VjFEZS9mTEMvTkxxOUFNZndvOUtxYXMxK0RKTUNZY2wwSnBSa01hQlNU?=
 =?utf-8?B?elRRaUFJUUFzVEhZY2U2ZHZ0T3VlVGF4Q3FrdnFMY09lbnpEYURHZ0t5eHR6?=
 =?utf-8?B?cGw5d3N1UnVSTk5kM0dFNVhUd3QzckRqZGFSU2lFbEtFRFhQRFZBNmlJSU9o?=
 =?utf-8?B?cU1lTjZ5cEpPZUozTllKdU54d3Q3NXVSTmxqNUV6ZDJ6TEJZWHl4UGtETmxW?=
 =?utf-8?B?SHhhUk5lejNSSW0rKzVOUElaMHdjQzZhdlZRblFlWWUwZG1odWxVMzlMZjdN?=
 =?utf-8?B?MXMyc2xTS2RMbjJJWTk1OXc2a2VwdGZYelhYY1IxVXRiR1pvQlp5U0g5TUps?=
 =?utf-8?B?QlM4c1BoVVk1Smgwd29pbGxtUVJNQ3lWUXJLRDBURkdsQ2Z6ejRGaXM2eWd6?=
 =?utf-8?B?V0hPeVhjVUZSeGZZTWRJOVF0dG5NbjJpdUNJYXRsYk1qcGx3bGpLc3JZUW1m?=
 =?utf-8?B?anhQRm0wVlIxeGpiV2dFVGhGRzR1b2FVQVNudTRiUHFpMU8rOVBBUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305aaf65-63b9-4d3c-afa6-08deb0a32bee
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 03:53:19.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5GXOJP2k2mXLOUI6eibXRa4Qm29OcGM+aS12J30MTyveuOa1cugoXHVCos0k9J9nX3bEDxh/EQuZBfwlQRzBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7837
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_205339_543134_2D9F335D 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

SGkgQnJhaW4sCgoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIDUvMTEvMjAyNiAxMToyMSBQ
TSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gT24gTW9uLCBN
YXkgMTEsIDIwMjYgYXQgMDg6NDc6MjhQTSArMDgwMCwgSmlhbiBIdSB2aWEgQjQgUmVsYXkgd3Jv
dGU6Cj4+IEZyb206IEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+Cj4+IEluIHRoZSBB
OSBkZXNpZ24sIHRoZSBQTEwgcmVzZXQgc2lnbmFsIGlzIGNvbmZpZ3VyZWQgYXMgYWN0aXZlLWxv
dy4KPj4KPj4gQWRkIHRoZSBmbGFnICdDTEtfTUVTT05fUExMX1JTVF9OJyB0byBpbmRpY2F0ZSB0
aGF0IHRoZSBQTEwgcmVzZXQgc2lnbmFsCj4+IGlzIGFjdGl2ZS1sb3cuCj4gVGhpcyBmbGFnIGlz
bid0IGluIHRoZSBwYXRjaC4gSSBhc3N1bWUgdGhhdCB5b3UgbWVhbgo+IENMS19NRVNPTl9QTExf
UlNUX0FDVElWRV9MT1c/Cj4KPiBCcmlhbgoKClllcyzCoCBZb3UgYXJlIHJpZ2h0LCB0aGUgZmxh
ZyBzaG91bGQgaW5kZWVkIGJlIENMS19NRVNPTl9QTExfUlNUX0FDVElWRV9MT1cuCgpJIHdpbGwg
Zml4IHRoZSBkZXNjcmlwdGlvbiBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmsgeW91IGZvciBw
b2ludGluZyBpdCBvdXQuCgoKWy4uLi4uLl0KCgpCZXN0IHJlZ2FyZHMsCgpKaWFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
