Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95DEEB8FA5
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Sep 2023 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggx94oQzA4SeS0JTpe5ZAOhchdgaBCNoQWibCJIm4i4=; b=Q5DY8ieGaVH3Xx/BayvhJBsunc
	W84eXwZjCJwImsQDTZmEO/LZHDQf5JvQuw8448K5dmSkYazkb8I6ZvSUyrAPvGfRaVkKYYnh/8JEv
	IAl6yVLeXd1npqjOpBf7VqRajnhEDnxMFzamU98m9wU39HcE5jBfiev6EfAvr+UgLQER2E24hueZA
	7X6ZSlYDfCVSEDIAYOMHJ7n7BXqZ/8jwFjLygyYzEUVC7hHL3hy3Zp3ul6tFh/oD0cIdmFWWfOiZo
	VZyRZLQee01HLBWmFcFq4I2aDXQyZA7Fey60M0hFJ7yY31prVAkT15Drvw36kyye38e0IAA0Xaaib
	9fpWYt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmi6-007SGa-1I;
	Wed, 06 Sep 2023 07:12:22 +0000
Received: from mail-tyzapc01on20704.outbound.protection.outlook.com ([2a01:111:f403:704b::704] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmi3-007SEf-1J;
	Wed, 06 Sep 2023 07:12:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz6zOix2QLo9ZeVqbU4uKOeMZ1lQwxqpVZbewYgk5YkoE4yZPGv1OTAA6icBg2ro6aJE7Vir9X3oqVRAURpI56LXlld9l3OH24025Sv7pe6uyu03THiz7aR8Np7mLVJ3X6p5pVo7A0ToVdIx2qMNfBVyRqs/VPMAeH/rNoLIF5r0q5rGHyg1hLI0mnk2A4yDYHLWxHBXNlu2KC0lcBRdZdUlcwUXuBqhOH6hjW/l72BOMhObrxnOO72OVQE2qoT4Tg/zhy2vi4z5qHuTvuD0p3rYdlsFTpNm+0H1DBqcN3Z/jsjKW402L+80WFGHjCBttmLKNeOUR5omOOaJ4jiOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oic67TH2Kv+h4kJDab7LgSDHig84lLq+B43RsjNVmE4=;
 b=Zb7iW9tOLiJBXKYaSVMqKzGnqEQWRBOb/ZtW9p4LkEWiaQqKmS0B8AtH3bj07mzcoiif0lhokiH+MJjIFdjBDyWJ6itey61WHKPov58jdUNFngxWCZHQMlvkK41byjQcpewCMU0JQ6OQgstjSyo2+3rzvNC8iM5nxRFqHvgcoZLes4jR7Oc7EF9x6c321WawHD7ivwTyjufFxYuAIcoP9LSJ2V0MuX/yy7xnSjpGHosU8O4GxETtAOmlQ07MnWoen2Eps0pN3quo3+keZoB2rtY8U+fORDdj//okKL+o0EqsbImVweCXNwhBSZblxZc91PM9tDHwrkVtkST2qdNu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oic67TH2Kv+h4kJDab7LgSDHig84lLq+B43RsjNVmE4=;
 b=ygfIdUgxZzQqzxeaB76NzX3t3swUV3S1IBEKRelrAzrbuoSzPhWSvf1CPaSYipSYCBfmsspp+o6hS/d5t73ef9JaOmFmT3xRWMJ5Ub3UK2PdT/zRhExIaCT1Udm9up9e/+FrVk6PQVzlJpbk+O5J1VKs/BJwdM4NZkN7xPHq2w5I6dVgJnalfiz6ilmWDzkWOSZtcfPfS2+kYeDtgixpreGTRlB037bXmBPE0GNzXQsBwk8Qryqc56c08Otsf+4kpuPdmoVmYV7WA/Zzmz0S6QvZ6Fle9ODqnsQOKwrQ2aKtGjJPOsSfLEF4waIMtruirEad/qw56tDxxlSojsEkpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
 by SI2PR03MB5738.apcprd03.prod.outlook.com (2603:1096:4:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 07:12:03 +0000
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d]) by TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d%7]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 07:12:03 +0000
Message-ID: <646b1955-c89f-a6f5-acd1-a3c68953b0c6@amlogic.com>
Date: Wed, 6 Sep 2023 15:11:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
To: neil.armstrong@linaro.org, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <fcdb1fb2-784d-4235-aa47-9e489395c028@linaro.org>
From: Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <fcdb1fb2-784d-4235-aa47-9e489395c028@linaro.org>
X-ClientProxiedBy: TYWPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::17) To TY0PR03MB7240.apcprd03.prod.outlook.com
 (2603:1096:400:276::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB7240:EE_|SI2PR03MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ed81b6-a246-472c-ff3f-08dbaea891d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrOuj/tLWlYTGgEI+dF028NnedM3MTsOx8iurmjgHJ8vkc7WSth+g8ZB6JJql2WubCQlEUxdEblyMzotAyw7GO0n5dkQa15Zn1C5ktrS3+4BEdytE5rv/me3NzDWFSgo9QjORgqBMZKj4Q/UXE2M54t8ulPxkIsyMObVtj2yXZVn9K6JDJa3vDWTY1+UqQzkEs/5Ry1SvntHtSK3J/tpxlKO55dhrnK+Xg8u9mdziSdG904FBQV4RRim9JvK+05Npk7+F+L4p4dsCsi+fM5VEg8t6L8lJJCYvsKFxfn/uoEihUiWy6OMXOlmnnZidBYw9A4t2x7yIY8z9Aq9l/658SL5BXZnI+0XyM5SK2N3zUWfNiPowiqeBLooCt+mF6TNOiE4QgFPFxajQijbb/fy0ubDTen0fWOibtHeRHyCQEz5VyN7+GSiea19sqPXc6wLmgnVKsVBw/DFuBmvv2K2xOcUobEnV/nSNeW3OZa2hvkhpaOajT/BrAwxE9V6q9bcUVcnirJONIz48lxWdan3L5QFumjak2yZBa4bsTQctoJklLoLfxSUyQOGNtS8gWR3HkHBXc4RgcX8VFcSVIljS6GdVrzQ4n93ccpEuW0XQwmA7we1MQTbscfCkOEeWjTp2dXFdQGL1newlMtrSR/aXnikco6Tadf4JDF4qdsAJJW9zbrrPL87H1Lte8dnyhrSVi5v5ZbtxslyIFjLORguLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB7240.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(366004)(346002)(376002)(451199024)(186009)(1800799009)(8676002)(66476007)(66556008)(110136005)(66946007)(4326008)(107886003)(316002)(8936002)(2616005)(6486002)(53546011)(6506007)(6512007)(41300700001)(7416002)(5660300002)(83380400001)(26005)(6666004)(478600001)(31686004)(2906002)(31696002)(86362001)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUs0dDlXRkphdVF6MGROM3hFdzNUWXNKYTdubjQ2TG9Uc2QwWi9xZEtKOUhh?=
 =?utf-8?B?ODVRZVRGWE1kcFNBRkQva2RJMWhCN1N2VkpoVEhvSE1MV21xUEZDTnp0Ym5K?=
 =?utf-8?B?RHBPRlRlV1MyMUcveVA3L0pPbXFCN3FvejdPSkVPY2h4VHZnSmhpTTI5WUsy?=
 =?utf-8?B?cERaSXZZOHZzOFJ6bDNYVE92NlE1ZmFneFpVblZDdjQ4UWJkNjhnSHp2NWFO?=
 =?utf-8?B?ZG1MVGlwSEVBL01hMXZYamxJOVlSVVM4OFR3aGlCQk9SWG0yUUs5QkVpVmFv?=
 =?utf-8?B?Q3hubk9mYTh0Z09wNzh4elpQTTR2ZjUwTHpibWZRT2pGV1BvZHB5b0p6cXhX?=
 =?utf-8?B?TEdVWGtvV3hRQjdSQllaUytmUjU1bUJQZXVHcGZCR2F0QnY4bE9wV3M5WHEx?=
 =?utf-8?B?bzBMMjBzc1VSa1Rzb2FWN0IzQjNwT3h0bzgxSkxWQnFrc29HV0xNMHBnaWJm?=
 =?utf-8?B?T2p6RXlLOHFEOUlVZnE2TVFnNzRMTzJHZ3NudjBVUXE2UnNvOW1kSS9qUlZn?=
 =?utf-8?B?MWtUNEpyRXVKSU9ncERtTGVMdkZIZks5UXg4b2FHdmU3Ti9nbms1V1o1amhT?=
 =?utf-8?B?TElibERNUVcxL3pOQjFDY0E3YXJMc3NrVityVTZkbnQvNVBUVUpFUzIremg1?=
 =?utf-8?B?UGFFVXlZNVorVnI4eWVITUZDR1d1QlVVazljTmdBeUJFUWNvOUwwSDRXV2Zo?=
 =?utf-8?B?TmR5b1dRT1lIWHBsbUJ6VkpNL0g2SUx5S3ZjNGpaM2VPQnZoNEJTUTU0anNF?=
 =?utf-8?B?QlZCaTlNTTlTV1hDSzcraFM4TUhmbzE5bWNnaTFEeVM1RmtQVDM5djlZazM1?=
 =?utf-8?B?UmhWbDZWY1ZFaDRYQ3BWNzZtbGVLUFFuVGdSOUtPVHV1b0Raa0hjRmxGYTlj?=
 =?utf-8?B?aS9sbHl3cDNEdXQzazVCUHNwcDQrWEZieXY1SVNQZ09JL0ljZVg4bkNEQURq?=
 =?utf-8?B?ajBONFhIZU5MK21ZWWE0OENpdFJRNUZCNlJsNnJXQzlxWlYzWUI4M2tEbTNI?=
 =?utf-8?B?RzUxcEV1MEtIcHhRZ1hUTCtRZm0yK1VadWpyYkRKdXY3VlRGVnBpdFk0NUpn?=
 =?utf-8?B?SnpXelg3dDBSK1NoVFdwclkrS1FJOXFYQzdWenovMis4WUlXcjBPWnRtU1pa?=
 =?utf-8?B?NkFuSk5wMXR6TGNuVXNURVZYdG9MZ05LSDNnU3lYTUFnRGFrMVhkQWZyWUYw?=
 =?utf-8?B?S0VuT0FwTm9NeFJtUTRCbXBZNUE5WGlPZ1RRQzVLeS9BOTFObG8zbk1tcGw0?=
 =?utf-8?B?ZFBNcUNMdjlxUHRZNDE3YUkxaUdDYTVZMVdvNm95SVJsL2I4blhHYjNwYmV1?=
 =?utf-8?B?Z0RJQXRuVFg3WHM3Um9iS0Zia3ZwMkd3WmlGdnJMa3BlR2ZlSmhxVXNBRnhJ?=
 =?utf-8?B?ZFZxQkczcDcvUlpvZFd6Y2pTeTVmbHdReXRCNXUrWUo0VGhwM2dWaHY0a0RH?=
 =?utf-8?B?ZHoyTWdOS2ptQTRKVTFyKzhrYm15SlZBUUJldUhXM3psRVQ2eEhMUzhYa2gx?=
 =?utf-8?B?bHRTdWRkam1WOXlYcFhuTkNZRkFaU1JqSnc3VFEzY0pNbkJtVjE2MFhwcEQ2?=
 =?utf-8?B?QXdSTDBqUXg1SjhrUHY3V3FNL3JzQ3ZYc3VDS3FyY1dDVnRLQlk0TC9ON3A2?=
 =?utf-8?B?OE9NNjBWNXFzMzBtVjBZa1RMcXFSa3Y4SjNnNjkybDRPSUhiNk8rY3A3NS9H?=
 =?utf-8?B?K2I3SklmSXUxZTFidytGSHNpTWFPbFViS2k3ZjI4d1k5MXJLM05SVFh5SHdS?=
 =?utf-8?B?NlNuTnJjNWpFY3BJcDd5Q2pGaFFQY1JkRkNIRW1iNEwxRU1yOXlsUnluZkl1?=
 =?utf-8?B?eDVESzNRN29GdjZoSlZBNnZ5eEhNMUFWNVlkK3FsUHdocWozemh5ZzVyOUs5?=
 =?utf-8?B?N1g2VEVZUXJuTm83Um44eFIxeGs5TXU3dEI0SzFRdFhneDducUhqU3pRRVZY?=
 =?utf-8?B?N0lwTDB0UVExSTcvUkRDU2NxaHpLczZFaEFrTlJ0R0txMzF0Tjc5Mk5yZHd0?=
 =?utf-8?B?NFd3L3BJN2JGbU1Pdm8yZXlZcHJIWCtGb0k4SUlHTUEyelNHZWJyMWJFVkZF?=
 =?utf-8?B?dmsxb3hCNFI0ZURLTlRRZnBXamNjYVZvQmJQRjhvQmhFRlMyak9pTzBUejBB?=
 =?utf-8?B?cEZkamp4SVc0T3M0alkzZEhmNVN5dlRHelpFY0Y0SjZYU2w3NjhwZTNxanFm?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ed81b6-a246-472c-ff3f-08dbaea891d7
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB7240.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:12:02.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmNJNW4kgRFCiKfm5cIqoFxA5WeAx3Y1JgggIbcUL+oZ5SluZJGafG+Fu+lEalB9mMqkOxrO5VZc7ItL2BlTfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_001219_447685_435309FA 
X-CRM114-Status: GOOD (  13.57  )
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

CgrlnKggMjAyMy84LzI1IDIwOjE5LCBOZWlsIEFybXN0cm9uZyDlhpnpgZM6Cj4gT24gMjUvMDgv
MjAyMyAxMzo1MywgemVsb25nIGRvbmcgd3JvdGU6Cj4+IEZyb206IFplbG9uZyBEb25nIDx6ZWxv
bmcuZG9uZ0BhbWxvZ2ljLmNvbT4KPj4KPj4gTWVzb24gSVIgQ29udHJvbGxlciBzdXBwb3J0cyBo
YXJkd2FyZSBkZWNvZGVyIGluIE1lc29uLVM0IGFuZCBsYXRlcgo+PiBTb0MuIFNvIGZhciwgcHJv
dG9jb2wgTkVDIGNvdWxkIGJlIGRlY29kZWQgYnkgaGFyZHdhcmUgZGVjb2Rlci4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogWmVsb25nIERvbmcgPHplbG9uZy5kb25nQGFtbG9naWMuY29tPgo+PiAtLS0K
Pj4gwqAgZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci5jIHwgNTIyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNDUxIGluc2VydGlvbnMo
KyksIDcxIGRlbGV0aW9ucygtKQo+Pgo+IAo+IDxzbmlwPgo+IAo+IEl0IGxvb2tzIHByZXR0eSBn
b29kIG5vdywgc28gZmFyIEknbSBvayB3aXRoIGl0Ogo+IAo+IFJldmlld2VkLWJ5OiBOZWlsIEFy
bXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiAKPiBJIHRoaW5rIHNvbWUgdGVz
dCByZXBvcnRzIHdvdWxkIGJlIG5lZWRlZCB0byBiZSBzdXJlIGl0IGRvZXNuJ3QgcmVncmVzcyAK
PiBleGlzdGluZyBIVy4KPiAKPiBUaGFua3MsCj4gTmVpbAoKU29ycnkgZm9yIG15IGxhdGUgcmVw
bHksIEkgc3BlbnQgYSBsb25nIHRpbWUgbG9va2luZyBmb3IgZGV2ZWxvcG1lbnQgYm9hcmRzLgpJ
IHNlYXJjaGVkIE1lc29uLUlSIERUIE5vZGUgZnJvbSBhbGwgdGhlIEFtbG9naWMgRFQsIG9ubHkg
NCBEVFNJIGFzIGZvbGxvdzoKYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1j
b21tb24uZHRzaQphcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLmR0c2kKYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LmR0c2kKYXJjaC9hcm0vYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi5kdHNpCgpTbyBJIHBsYW5uZWQgdG8gc2FtcGxlIHRoZSBib2FyZHMgdG8g
dGVzdDoKYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEtdTIwMC5kdHMKYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy1zNDAwLmR0cwphcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLXM5MDV4LXAyMTIuZHRzCmFyY2gvYXJtL2Jvb3QvZHRz
L2FtbG9naWMvbWVzb244Yi1vZHJvaWRjMS5kdHMKClVuZm9ydHVuYXRlbHksIG1lc29uLWd4bC1z
OTA1eC1wMjEyICYgbWVzb244Yi1vZHJvaWRjMSBhcmUgdG9vIG9sZCB0byBiZSAKZmluZC4KdGhl
cmUgYXJlIG9ubHkgMiBib2FyZHMgSSBnb3QsIG1lc29uLWcxMmEtdTIwMCAmIG1lc29uLWF4Zy1z
NDAwLCBhbmQgCnRoZXkgd29ya2VkLgoKWyAgICAwLjk0MzA5N10gSVIgTkVDIHByb3RvY29sIGhh
bmRsZXIgaW5pdGlhbGl6ZWQKWyAgICAwLjk0MzE0Nl0gSVIgUkM1KHgvc3opIHByb3RvY29sIGhh
bmRsZXIgaW5pdGlhbGl6ZWQKWyAgICAwLjk0NzAyOV0gSVIgUkM2IHByb3RvY29sIGhhbmRsZXIg
aW5pdGlhbGl6ZWQKWyAgICAwLjk1MTUwOF0gSVIgUkNNTSBwcm90b2NvbCBoYW5kbGVyIGluaXRp
YWxpemVkClsgICAgMC45NTYwODBdIElSIFhNUCBwcm90b2NvbCBoYW5kbGVyIGluaXRpYWxpemVk
ClsgICAgMC45NjEyNjZdIFJlZ2lzdGVyZWQgSVIga2V5bWFwIHJjLWVtcHR5ClsgICAgMC45NjQ2
NzRdIHJjIHJjMDogbWVzb24taXIgYXMgCi9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZjgwMDAwMC5i
dXMvZmY4MDgwMDAuaXIvcmMvcmMwClsgICAgMC45NzI0MzddIGlucHV0OiBtZXNvbi1pciBhcyAK
L2RldmljZXMvcGxhdGZvcm0vc29jL2ZmODAwMDAwLmJ1cy9mZjgwODAwMC5pci9yYy9yYzAvaW5w
dXQwClsgICAgMC45ODA5ODNdIHJjIHJjMDogc3cgZGVjb2RlciBpbml0ClsgICAgMC45ODQwODld
IG1lc29uLWlyIGZmODA4MDAwLmlyOiByZWNlaXZlciBpbml0aWFsaXplZAoKIyBjZCAvc3lzL2Rl
dmljZXMvcGxhdGZvcm0vc29jL2ZmODAwMDAwLmJ1cy9mZjgwODAwMC5pci9yYy9yYzAvCiMgY2F0
IHByb3RvY29scwpyYy01IG5lYyByYy02IHJjLTUtc3ogeG1wIHJjLW1tCiMgZWNobyBuZWMgPiBw
cm90b2NvbHMKIyBoZXhkdW1wIC9kZXYvaW5wdXQvZXZlbnQwCjAwMDAwMDAgMDA2OSAwMDAwIDMx
ODAgMDAwNSAwMDA0IDAwMDQgMDExYiAwMDAwCjAwMDAwMTAgMDA2OSAwMDAwIDMxODAgMDAwNSAw
MDAwIDAwMDAgMDAwMCAwMDAwCjAwMDAwMjAgMDA2OSAwMDAwIGZjODAgMDAwNSAwMDA0IDAwMDQg
MDExYiAwMDAwCjAwMDAwMzAgMDA2OSAwMDAwIGZjODAgMDAwNSAwMDAwIDAwMDAgMDAwMCAwMDAw
CjAwMDAwNDAgMDA2OSAwMDAwIDkyZGIgMDAwNyAwMDA0IDAwMDQgMDExYiAwMDAwCjAwMDAwNTAg
MDA2OSAwMDAwIDkyZGIgMDAwNyAwMDAwIDAwMDAgMDAwMCAwMDAwCjAwMDAwNjAgMDA2OSAwMDAw
IDM4OGIgMDAwOSAwMDA0IDAwMDQgMDExYiAwMDAwCjAwMDAwNzAgMDA2OSAwMDAwIDM4OGIgMDAw
OSAwMDAwIDAwMDAgMDAwMCAwMDAwCjAwMDAwODAgMDA2OSAwMDAwIGRlNzIgMDAwYSAwMDA0IDAw
MDQgMDExYiAwMDAwCjAwMDAwOTAgMDA2OSAwMDAwIGRlNzIgMDAwYSAwMDAwIDAwMDAgMDAwMCAw
MDAwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
