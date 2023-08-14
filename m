Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F48C001DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Aug 2023 07:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JEt0Ph4R3C2twYAi8vui4YuBAFOeT/yvzINivRlw1X4=; b=cw6Oj/qyqGRGtkiyGfHEHbIcyX
	bNF3G+rwMbnAfPyooNZNPOMbFCKKZn9J9Uxu5DYAjlCaD+H02Vt/uoNAhSzNi4Rh65n38gWwNKILE
	6usaIacc+Wv69M6BrkEKrs0IFAnsVLuJDXoI18wcB4Sp0zJSC7EYHEfmBr9sd9DtDJ/7k8eLyBZg1
	88zcN0CL5yrKB/BmzBQ1J4ZarpE2aRqn2s52L5BGegOs75x5w0Iv+g3DDSKNnqVhvK2rAAfOrMBaQ
	UsoaKoc4o8Bh8NZCKydhJNOQBaYn9N2k94J11GtSEiWR/Rf64w3v482y2Ncl5kUZo1YY/o9LtnFsR
	FI5G521Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVRi6-00GKpK-1M;
	Mon, 14 Aug 2023 07:09:54 +0000
Received: from mail-tyzapc01on2071f.outbound.protection.outlook.com ([2a01:111:f403:704b::71f] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVRi3-00GKoG-0H;
	Mon, 14 Aug 2023 07:09:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4B7RXMvBtkkRsr+3Lr7r+lRbVEhxhU+nehfTMFaaoJG0BFYzX9J0iMw5naaI+qLyjMhZPSs8Ngd0V1HPrrHEd+aSk2Li3enXuzA3GCEpxqGI1jys11FAFa7PwLhUsFv8LMzIlEjvCkqxPbSfZRTOaav6XsqOedbZHHqRPr52OXcjREBro9Zj0rujkMKLC6AzTnoFgzjYP8PiuUq/QjUDHohk9K0dt9FRFBHQj2tikq4cuBYkAqQRFhO5qR8LyOMOVrePOC2JLOk4HQs2a7kZ/iqtwxJGpXqN9OKrmkUnh7ki26uybF4H9NT9+FKeyT0dGZJgj8fOerf3Zo8Bb8yLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2Yqn3vGjPozz4r7fLPHSq1y6/O6RjGNe/4F0V7ddcc=;
 b=gcErlT9RKo1Tvf29sxv8KpWYW8IqLfHtNevKmRJ/gHc7aOhkLJDKcYVjIFBA3OaPR7RUyvDy8V1X1aaBaqurRlhNddXffk1Q1TH6UNkaIOl+C53D50ADORWYQb6ifHd9WgiUQNj3MzDzqN2vKnjDxRuCvCNpY7ba+RN8YtyS2onnvrIZ8FHdjdwRkRNxpfu3rhj8TB+0GXm5pxk8bpUmTcu8XY6bwN3k4IFPkbPfOxqmU5HKtpycycoPLLTrD9TfmZ6YKmI5sTfJ18EM/PFvzppyH77RNfvqDIEIhFaS9xOJKMPqyFm4hKHbogsdr++G8XFHcVkn8DQlYhd+k6cGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2Yqn3vGjPozz4r7fLPHSq1y6/O6RjGNe/4F0V7ddcc=;
 b=j5vyd1Ea3SaUUR0M5u0ZG5oXegaXBeDNZNwomN7MMo/3uujRoy5NHMFEL+Dq2EqVCJ86p22ZBbTcmz9RePNhgl0rVEEEiIkEe5HukTVUVeeoFfYbELzTS82aO1getjePMyO+CtcGQDohXnPfd3ym2ioiiZoXnGUn9sCK3+UtW+TOrGjV3S3XmDZebKLe+A66aBCeSbLSICEnjg7LDAUn8DT8WGW9oZoNgvXJjeYuA3cX94V4FvrCXOnAke1HSoD6WE/ixUcvCuGdGuHlIPFBmmmuANHwlvsIVNSOd7MGfxY3NZmUecTz9Wj0kxUtLlcDXiH5IlB5nEpw0yc/WCM8qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7221.apcprd03.prod.outlook.com (2603:1096:820:cb::11)
 by TYZPR03MB5312.apcprd03.prod.outlook.com (2603:1096:405:7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:09:37 +0000
Received: from KL1PR03MB7221.apcprd03.prod.outlook.com
 ([fe80::15ea:573f:2ff2:f723]) by KL1PR03MB7221.apcprd03.prod.outlook.com
 ([fe80::15ea:573f:2ff2:f723%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:09:37 +0000
Message-ID: <d5e1e07a-fd3d-7f7f-6c73-f4334727887e@amlogic.com>
Date: Mon, 14 Aug 2023 15:09:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V2 0/2] Add GPIO interrupt support for Amlogic-C3 SoCs
Content-Language: en-US
To: tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, hkallweit1@gmail.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230628091533.3884385-1-huqiang.qin@amlogic.com>
From: Huqiang Qin <huqiang.qin@amlogic.com>
In-Reply-To: <20230628091533.3884385-1-huqiang.qin@amlogic.com>
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To KL1PR03MB7221.apcprd03.prod.outlook.com
 (2603:1096:820:cb::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7221:EE_|TYZPR03MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de7c1c4-6cb8-4b14-8403-08db9c956b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q75FJ48Rzg/3xPMJ1hoGCtSqQZzs2lzPYiC6ZKsD1Wp0WWI/66RvMaCWkkwhESZiwtQ3PTRvk/A8BIWUQhr1eTv0r3Lf5rNk/WcXaVS41x0QmaKX1lh1zFTzo108fpHcnomhpsQVeGSipv4r+rCg7oOOLH01UbJ72QeQLx1M6x+UG7zBWbGxo9MPN5f8EOWfYpv2xr8KCq+izUguBmNL9gllvU+DeX8J4wJW7P12/lbdmDkOzgiWF6qqUkjekJnOEOQkfklDdBND8aIPNvWPpVPUstFiUYE2DmM1++r5AvQvnXxt0cIT+e+6dzxMNIMZXoivuPL3f+ywYfmq/i1a1VVkwmKDuYRIhHU6HtWqfTuHnUmhh21uMmGkNo0TDygM50A3fZ0mtbeHgGSUBESBOxKWn6OD4OPVM2K/1pSbjiFIp9SyYFJF76da1Mo7rFiFqgLJ7k6TRKNThwBDDYYs+hbBlDAJAoaF3c6vzejrUKC0qWrqpwi0SKMnRHAbPshIYORpMDQo5xna3riIx+5ZREkA4yhqTUK9SvzgWT5xBz3GzT4HvF1++vq9lIQlhJZPScAB4sz+TQD3oQGjLRRXwZkVWnTThpXH59NoP/aAUlpxjCCCD6ka3rQQg5TK9ysFrScmMS+rQXzwneBwsGGyuCdjMuxr7z7pTEbGxCMcKLF0wLAj/tWPcscSLuFIq5gv2qBW92tv16cIbmr+/LGgD5vlHzSunYiWMumyltjGC3CyFKHdJ2msy6XDkI96crBf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7221.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(6029001)(366004)(376002)(396003)(39840400004)(136003)(346002)(186006)(1800799006)(451199021)(31686004)(52116002)(6486002)(6512007)(6666004)(86362001)(36756003)(31696002)(38100700002)(38350700002)(921005)(26005)(6506007)(2906002)(4744005)(44832011)(2616005)(478600001)(8676002)(8936002)(53546011)(41300700001)(7416002)(5660300002)(66946007)(66556008)(66476007)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTVxa3JiVXdoSUR4Q01GcjdHUTJuNnhKSHVyTkZ1UmJQcjkyM25ERW9JQ3N4?=
 =?utf-8?B?cWVGQzVMdVpwN0xLZE52Qk82RXRCdWtZZUlPUU1rdXZrODdBdUNHQkJzcmJt?=
 =?utf-8?B?bWJ6enprb3k5dkJRMldlUGtJQW1pOE9rNE9UQXJpWXFGdDJldXlSVEdrMkdk?=
 =?utf-8?B?VG95eENFMG1pa0wyUHhqalhzUzZwUDA5TWYwcW56aHpCZjExTWFJVklMYWJZ?=
 =?utf-8?B?ZDJJM0kwUEprZnBmV1c0NVVHR09YZXJTVnV1RjZxNnFwcjNTUk4ybnlaZXBF?=
 =?utf-8?B?T3JkOTB6VVI3US9UMHF1bm8zb0hBL00xdGVMbVJqRFRLN3RMSXVaZjhYSUFi?=
 =?utf-8?B?ZW52aVVxeWQxV2RnR0pYM05IMFZLZ2FISkhESklGMTFSalNMQ3ovbDhJY2li?=
 =?utf-8?B?aGJlNGNON1VBcHU2MjlMSGZsTVZOVjVmN2xWWUwxWEVpbk9UVzluVzJJVVhN?=
 =?utf-8?B?bHpWZFRqUGtnLzZMYnBZZWRzc0tzVWtZYWZzQjRqR2hiaS83ZHhLM0VyaU1r?=
 =?utf-8?B?Q050aHVRR3dHWkVZV2RmK2hEZnRIRVc0emFzNFZ4andSOW45eUFXZVhaR0sy?=
 =?utf-8?B?eXpncEQxUkd6UEtuQ2M1UjNJMjQ2VDkxYm1qcjJndnQ0SkJhdGZHOWErMTRP?=
 =?utf-8?B?Q3dQbnh3RnB1RThxWnFpZmlRZjZiTXBaS1ByM2R2RmJuaDhId1BzUmFyV0k1?=
 =?utf-8?B?eXIwMzNKY1BuL01WMVFTSlpkQmN5anc4YkJmRU1RSUFZUWFYUkd4YVJsMU5z?=
 =?utf-8?B?U0pTR0NYc1MveDJKMG82RjhQNFlkL3IxMEdJWk8reVVzYVdTYzUvZFRpemZ4?=
 =?utf-8?B?cWlqVzVLTmd1cDhuaWRZTUwrYzBjMWJsRXdKQjBEdS9QR1FPdUZJckRMZ0Ny?=
 =?utf-8?B?RE9NU3lOUXJzcGJGb0xqYlliM3ZBWWNzRVY3emFZSzVtbTdkQjg3VUlzU3Rx?=
 =?utf-8?B?Q2JLM3hQL1BLTVJoeDhBRVJRcjNXRjFRbDhpNkpnSmZwNzM4NWY3Q1djZjVB?=
 =?utf-8?B?KzF1OE56SUx4WTdCZlVHOWI5TVgrZysyUjRSU0xtVmlIS1FCYmRUNjJYWmRK?=
 =?utf-8?B?NHF2WWF5RmVOK2xUOEZDVFF4VEd4aytVWmdtL1BxU2RoaFA2dE0yZGk1bFB4?=
 =?utf-8?B?YTkweUprdjJrSFFLdG4xa1BER0FRM2UxYmh2dENuMkptYURka29QRUxML25W?=
 =?utf-8?B?K1dCU2hwR1BzUU5ZaDVsUjFSdlowaGJMUzJLdkFvc09pZUlvbHZwVDVqem4y?=
 =?utf-8?B?bTA0UGk0Wm9QcDZ5eDU0ZmtNT0lacTAzOW1WUnV5dmJzYXVrSjdaa0doNmVS?=
 =?utf-8?B?elorVGtyRFFBNXNBWUxqU1krdFZIWWo5dXgySXVaNDM5M3AvRkNLWWwwZHNR?=
 =?utf-8?B?TFZQc3NzSGtYZ3p2RGJsZWxEVlJBRnA1cXRQZWQwRHoyWEdGRk92U2p4MWtv?=
 =?utf-8?B?ek1pd0hlbG5MRHZtbElUV2M3amt3QTErK2dyd1dKc252bzl2MU9GVm9QaXB5?=
 =?utf-8?B?V2Y3QmV6SlpiWFZaUUlGWnQ4TzlIQUIwNUY4RnJsdnp3L1gza0lQb0FKRi9M?=
 =?utf-8?B?a2duQi80QXE2c1JHa2ZHU1B4OEdtclZpZ08wZHdzM0E2L3o1d21DUDhxbEE4?=
 =?utf-8?B?bFd1QXRxK1NidzBrcUY4UzduRnlLQTFtZWdEK1laL3NXMEtNRkVXUEVrSlFG?=
 =?utf-8?B?NEQ5YktWQWt6S3IyM0FLUjNybzZoOExCWGRRLzZ5Y1VGa2tFZHhCUWhlQkZx?=
 =?utf-8?B?NUtEUFo1WTZWV0E5UXBZdUpOTHNGZzhrbjJPVGt6S25jREFucGhNaUZkT1V1?=
 =?utf-8?B?aEtFei91VnNyMGxURkNlR0VyME5QYW1taTM3SWMwc1FwZFFQZVBJcjMyZ3Bz?=
 =?utf-8?B?bkRkMW45MEVEN1M5c0VOTHRGMm1Fdmo1eC85OVFvWDlyZDN6V0MwL1Z6anoy?=
 =?utf-8?B?Z1pXaWRhVzRkU292cWhjRFNhTFlkNm9ZUkx1M3dDSlBDNCsya1ZQQTRHeDVR?=
 =?utf-8?B?SVgzVmRhYXlxbHpGbkpQUEM5UU80S1NzcEZVT1BCN3VwZUszM0ZVUVRtbWdK?=
 =?utf-8?B?QzhWNU5qd3lrV2Izb1JsV1MwTUszSkpjYUhCWEcybS96UFRqS1AzaWxZL3Nl?=
 =?utf-8?B?V3NNM1FBK2VCalZEK2xSRExYcFZOOHRqb3JEZkkwcWZOWW41UUJXMzl0TmRP?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de7c1c4-6cb8-4b14-8403-08db9c956b20
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:09:36.9046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCQ07ZgMN14gomBeIQW4kkguxaFOU4KQjo7ATAtDAy41HZpMNw603Z5gwbnqnedFQ8StcYtNrJvjqiMmxE2cJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_000951_197807_29AD745D 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Thomas, Marc

Friendly ping.

On 2023/6/28 17:15, Huqiang Qin wrote:
> This patch adds GPIO interrupt support for Amloigc-C3 SoC (C308L and C302X)
> 
> V1 -> V2: Added driver changes
> 
> Huqiang Qin (2):
>   dt-bindings: interrupt-controller: Add support for Amlogic-C3 SoCs
>   irqchip: Add support for Amlogic-C3 SoCs
> 
>  .../interrupt-controller/amlogic,meson-gpio-intc.yaml        | 1 +
>  drivers/irqchip/irq-meson-gpio.c                             | 5 +++++
>  2 files changed, 6 insertions(+)
> 

Best Regards,
Huqiang Qin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
