Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43176FD5304
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Feb 2026 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94vLNA8v7Z8piSRTFL63i8UMxDypDURxW2ELnZtBdcI=; b=wPBNir8yo/VOnuU8Z0YmxwsQTx
	LaeoF4lnPqBTwzobBzPxFElWe+IAushIzwh+b4srCAbJgk8BW0VQKp5p+102Oax78yleYlhyIOnzS
	apqP9ZVijAroA2MO/wAqK6zyEGjmvbspXAoepK7tSQnZLElxNYmQjmQl+Ps+9nE1BygR8semk2Bjw
	7tjEHZGSNCFelJEo2QJQM/WWmUJcK2IIDgB42pwKeAvXoiTIlHrtb3U4tetv++o38auWbPMRACFqS
	kvziTO4+XmS3Q2cZnisoSPlWZ9175oU7200CP6ASUHpPHR5+iRKKn6/x81i0dJi2SPW84lHWa5wkQ
	TZ8XwDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs7x-00000007rMl-14C6;
	Fri, 27 Feb 2026 07:19:09 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs7u-00000007rMN-3rC4
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Feb 2026 07:19:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xw8jJT/T+dnKCa1FDWrL4fM1l98Tug3paEiVgCH0YEWdU1mRHM8m7DBVCRJtFqtxCDzM1xIBVdWIlORjXedk151R89nm0jP5Rq5f2jFP8NOiGwwiOhiqiPyoVk2erYhapH5HPInmBHWOAu/ESzA6MZyYj7V33Kepq55mqbgKgkWE0PmC33IcGxbvUw75dyLiJxdre3hWGAeExa1/SEqwgZWsqy2e/jf/nIhU7E4WMNwjew/eUQL1wyOn8eRPf+hoV93ZsC3AIhBGeaLdDWAwrM2SO3cnQUMDgPhhoYM4Rv+L/po/BAzdEc6UqjaLSM6fFDdW9UczDX2ATNaU6RyWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL/XiYEInBLhP62m8YuBFsVJYlS46+C4ZmAK2X6ARJI=;
 b=DR9TT5Nfdl+1a0fsh+9szG384W4rUA5v6rLjxM2kmdjVAKO7udzLrYVWyLi/fNzA1CMMO3GGS+mysQbfZ0ROwUubj5/zQky4LLn/SQmd6QhjShZkcLQz/NQVmsKkFdHFJnt7Sl5CtE69/vjDcMY/rAhCrX79OanyXCWtrDwpYQ3x99a2RjLOoAc4Xy+EJLXiZMHv5aOt01QAMXDePwl8EMufpn5ERbCCrEa0zHL4vUe/M+cUczwfxmNi2YtRBNmxXRObofvDQQ8+hTltj37wsHnFTIOtuSRr4elpKL05ohUqo+yKrwkjKHgt7MLrDfe59uQ6tFQo1adsL5/MbkiVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL/XiYEInBLhP62m8YuBFsVJYlS46+C4ZmAK2X6ARJI=;
 b=ps7GWHwClwbJdRtKF99a2bNYbwTajDD4aVbM2Tokk5R1IXX/fEYnysZ8RTxP8mt0owr769Ea08QGcrdMdwR1ZKkLRrUtYx4cp+cteI8La6fCByqBQTRKdMJXH/zmwgiXXO9ddb+Np3VnJcXJN2a3zO8z8Xop4VLGTOUpFfniLlh3FOY8xtAoj+ov768hvGkPKH/ZD3E5aK9uFUXWmIVXbL1QFGktWzv3ii+uPpRlgtquBsOqCU+JffHEx6uJexNHgnW9bcHPIVEb6YyEOsXnej9zd0QPzsjnTyH61xNG+vhpkob7bOTk1pkKfa6Exx4GX5KycHYz6Md1gCSUkuWUwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KU2PPFE09DED81A.apcprd03.prod.outlook.com (2603:1096:d18::42e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 27 Feb
 2026 07:18:34 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%6]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 07:18:34 +0000
Message-ID: <de05570b-cf26-46b0-85f6-72deb0c62494@amlogic.com>
Date: Fri, 27 Feb 2026 15:18:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com>
 <20260206-amlogic-dma-v3-1-56fb9f59ed22@amlogic.com>
 <aYZCFiI0PbAhabj8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <aYZCFiI0PbAhabj8@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KU2PPFE09DED81A:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c54e0b-4cb2-4071-f7c8-08de75d06a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: adtLBJlvzs/+85QSDruGYbE0tA8LJcdfkTo+GdI8zZCFicS0pABRHogPhiAxWHprcXxzOHsBrnA1gNksLWIqKf3Ilz2fsjz9DUERDVpY35gvQT5FPh+KcNoo4arRKo5gBNVEJ0lc/szpHwB5ZLSJI0Ybw5MKWALEI5jQvincYEiGYYuCgxQV1B+65uru/EwVejVpQKuA6eMyf0d4pcuPKC8yVLk3hRHPTopidq/7w76NxlcakT5HCXwveMcR5pifO9crMQSE1oo6Pggwp8hV1ikLQdWh/NGMzFvEfIHMCJOeA6fTQUZy5dCT+mGXVrKx0he4FVcfWdTEeLFEoWedwLF7Rw0p6iJvaq6gfmKr9GP69hccvLOLgcL/MQEViAE0RGIGJklLsDBYEocPJMXKr1yPhcOwkrdBWkQvZCEK4Ev2TMOtr7tGnrB8Pg82fWM7Z3rBz8ndgU2T66k0BoEitEitFcnpWoutsRHWdHSwo+HHqpyeOZ3CAxrXNK5B0UYBOi1gspmwe4Oa/Q1LZGcjMwGsMW66ieUIoKFsRK68DJT5TSpCoR8tjQ35kbhuGH7rDavWHFAIoQBK7ofvH821RmmcA9en+U2ilso0kw0EsZaRJt7AZLV9uPO5Sqh1OSUK9L+C8oNMCWvUkQmSWcpH+2/QzaUVNSwIHKsUHWanJnUBbmh80TEmJ47nlMBNxfNw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U21YbE93UmdBNWdaV1NPcFFsS2RuOVNiMHVPbHVVSkg0WWJrZmVmMEhsbmIx?=
 =?utf-8?B?azIzanMxbjNkOE1VOG1KZ3Fqb2ZvN1Q1VWd1NksvYjNsRDRqOWMyK01EQlRI?=
 =?utf-8?B?eno2a0pzVVRYZFQvODZ4TXJVUEJJMXNKMWhuL0I3ZEM5TlhMejVQVGdJT05i?=
 =?utf-8?B?U3A0d3AyRm9aYlJKVDVSdDVWQS83WFhVcEF3NXJMYlJkeHZLRU9xNDNwbjZD?=
 =?utf-8?B?VERPZmpCaDlXeThTQkluUmRjdjJVMUJWVE5nVkoveHJ0U2tpVEM1VzM3dzl5?=
 =?utf-8?B?Y0tGTmtqMkc5R1M1R0lMZ2lrUmJWTU9SbURQZXhxQkRnaW1FODRxL3VtcWtO?=
 =?utf-8?B?TDRrcGlBcmFBME5ZNlNJUW1EdE9WRDQ0dEt1OEJMQmJxUEcydENvbHNOMWww?=
 =?utf-8?B?TEhHclo3RUc1ZXNxVlNocXpIWU55blkxTU9MdjJ2UzRhcS9ZdjBDNUJDZE40?=
 =?utf-8?B?dGE5bEh2eitHUU12aFFQTFZ5VzVaNVBPckNIenptQ0JldnZPd2l4bXN5cWxC?=
 =?utf-8?B?ZHovWmM5NWFoV2Q1NVRqbk14MFNUL0MrUjdLVURFMFplSkU3MHY1Um5Xei8v?=
 =?utf-8?B?UStrS0dRM0hMQ0ZCN1p6bDB0V3BuWDRCek5kU3c5NDZVWkRTR2pOMVRINUUy?=
 =?utf-8?B?cXFoMnFMazR6cFVZdUN4RnFDcmNaL3Fsd0RqeFNQNEwxK3VNVXFORlE4Z0Ja?=
 =?utf-8?B?MStVeWltakw2NUNnU2xob2hydmdhaE11UERkdWFYejF4cHJlOFVMNm5Scnh1?=
 =?utf-8?B?aVdwem4zTTlYenZhSmNrN3FoSnZEQnMvcEgrbTF2bUN0MHRoUXJnYm9QYlJ3?=
 =?utf-8?B?bTFnUzVkNVZ6a2FhRWxFS3FDVWZCT2RPcFFMR09wVXBrdzlNRnRqN0ZiUkVx?=
 =?utf-8?B?QTkxZXcwa1dyUUI4UzJ0ZG52RGpxaVlaQ2cvYjFoQmhHNjF6Ym1kN05vVmM5?=
 =?utf-8?B?Qm5YTHdqZHBic0d0cUpIZ1Bkem9xYzkzRGZkcWNKemxqcUY5THN2MDlxQUZr?=
 =?utf-8?B?NEFtVDIyTVorcDFTZmNoU1lBQ09udklDckNFQWNoVk44cE1MRjh5Rm56SHRM?=
 =?utf-8?B?WTZmdGpxK1NQOE1GM2MwdjBpWG1zWWIvbVFxSC8zUXFvNUR3SFNiS2FCZnFK?=
 =?utf-8?B?VUV2SVQ3M1hLY1RwT2VOL20rS1Fud3ZXcE1FMnRlRnFXQ1hOeVFESG9rZ1Mz?=
 =?utf-8?B?Y2EreUxGU0FFZ0N4QmwyNGxzRmpjL1g5K2FJNVc0ZThsRjRRdVVobWNsV0Nw?=
 =?utf-8?B?NFN2dGNWdzE3SHZXL2cwc1RkTFJyR3QzTWNrbFdrRWpzQ3J6OHBNc21WeTVN?=
 =?utf-8?B?UGJPNUdoOHdBR2JDSXMxYWtFT1AwOXpMRWpPcTh0TkhOMUZCMFZaVjlkK1FZ?=
 =?utf-8?B?WEZQcGoyQnd3dkFWQTlmalUrYXdMdDN2Vmt2K3BJbHlxRTRlSGNKa2hjcXBC?=
 =?utf-8?B?SkhXTzY4UUtxSzFVaHZXWGVyaWQ5V25qVzl6RjJUZXJvWHA5ejJWbFo3QkI0?=
 =?utf-8?B?bkRFVWdjRlJIWkp0clhpSzI1SWNwdGY1YkxjVDd0a0VITkN2MmpWd04wSXpz?=
 =?utf-8?B?UWRxaHE1SjN4VGVBQzlhY0FwdkVmVnpJTm5JeHc0UzJPV3UxV3RLbGJkWFEv?=
 =?utf-8?B?YXF6Q01sbFNJQ2ZNSEVrbXlKYUlqOVRIR0E3UDhlbkZpeTMwWm9KR25WT1Zs?=
 =?utf-8?B?bFRjcDVydmVaMVV1d2tnNTJJSjdZOTVQRVVGV2RQZlZ0b1pzUENCcUdNVUZm?=
 =?utf-8?B?NlJPYVRESlNHRVJ3ZVZpbEVwbEhjQllwZFd1eXFnREJCREpFd1ByZm1MMmsv?=
 =?utf-8?B?QjZmNW4ySWlTOFhlN05TQ0NvYTQya0FKVUExT2c5c25aaE41UkFxOUxqNTY4?=
 =?utf-8?B?R2hjQlkrdytvQWlPQTJFKzgyeExsZnFOeWl1UDhkVGpISUJTNzA3Mm1DZ01m?=
 =?utf-8?B?K2U2MzV6ODU5eG1tVHAvUnF5VHRxMTM1S2ZERU9mTFdUVkRuTnVCSXVsZmRU?=
 =?utf-8?B?ZlNDVGFZT3pObWJvUmJFemhCZFVUYnBlTlg4dzdxOGVKVTBHbFhOam5Wakdx?=
 =?utf-8?B?am9UR0xZSmRadHdYZ3lYTmNvK2lxWTlRU1RzS3k4bzZRUTZxZHUyNkdWd1Y1?=
 =?utf-8?B?Y1ZBNlJvYldtQ1dHdWJpVlliUG01TVIvMlZvMlRNS1ZxYnJZby94YUhnTDhv?=
 =?utf-8?B?VkpOTWJiTjRJeU0xcEdOOEE4VUlGS2lBb1hXQmhpSDMwS1FlVDhjVE1lTmZo?=
 =?utf-8?B?aElWV0FuMHJ4UElXUWlPSnpPSHE2UGdYbnA3UE5Gb3lmTzNiWDVXU3pYNDlF?=
 =?utf-8?B?S2lTWkpNYzFCUmp0WVIvRFExOE1JS2dwcU54SUdWK2Z1aFkxUlRsZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c54e0b-4cb2-4071-f7c8-08de75d06a92
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:18:33.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bls+HgYkUwNCccwSoVxRye80cfYy8YwiIm7yL7vGGPj81Qmn5KSSPLVObTmqHxLJ0fokvc85istNVpSQpfPXw/PcypFhIlb8btOvj3G5eQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFE09DED81A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_231906_993995_C968E347 
X-CRM114-Status: GOOD (  12.43  )
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

SGkgRnJhbmssCiAgICBUaGFua3MgZm9yIHlvdXIgcmV2aWV3LCBhbGwgd2lsbCBkby4KCk9uIDIw
MjYvMi83IDAzOjMzLCBGcmFuayBMaSB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBP
biBGcmksIEZlYiAwNiwgMjAyNiBhdCAwOTowMjozMkFNICswMDAwLCBYaWFud2VpIFpoYW8gd3Jv
dGU6Cj4+IEFkZCBkb2N1bWVudGF0aW9uIGRlc2NyaWJpbmcgdGhlIEFtbG9naWMgQTkgU29DIERN
QS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dp
Yy5jb20+Cj4+IC0tLQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5
LWRtYS55YW1sICAgIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA2NiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zMTU4ZDk5YTMxOTUKPj4gLS0tIC9k
ZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2Ft
bG9naWMsYTktZG1hLnlhbWwKPj4gQEAgLTAsMCArMSw2NiBAQAo+PiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+PiArJVlBTUwgMS4yCj4+
ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZG1hL2FtbG9naWMs
YTktZG1hLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IEFtbG9naWMgZ2VuZXJhbCBETUEgY29udHJv
bGxlcgo+PiArCj4+ICtkZXNjcmlwdGlvbjoKPj4gKyAgVGhpcyBpcyBhIGdlbmVyYWwtcHVycG9z
ZSBwZXJpcGhlcmFsIERNQSBjb250cm9sbGVyLiBJdCBjdXJyZW50bHkgc3VwcG9ydHMKPj4gKyAg
bWFqb3IgcGVyaXBoZXJhbHMgaW5jbHVkaW5nIEkyQywgSTNDLCBQSU8sIGFuZCBDQU4tQlVTLiBU
cmFuc21pdCBhbmQgcmVjZWl2ZQo+PiArICBmb3IgdGhlIHNhbWUgcGVyaXBoZXJhbCB1c2UgdHdv
IHNlcGFyYXRlIGNoYW5uZWxzLCBjb250cm9sbGVkIGJ5IGRpZmZlcmVudAo+PiArICByZWdpc3Rl
ciBzZXRzLiBJMkMgYW5kIEkzQyB0cmFuc2ZlciBkYXRhIGluIDEtYnl0ZSB1bml0cywgd2hpbGUg
UElPIGFuZAo+PiArICBDQU4tQlVTIHRyYW5zZmVyIGRhdGEgaW4gNC1ieXRlIHVuaXRzLiBGcm9t
IHRoZSBjb250cm9sbGVy4oCZcyBwZXJzcGVjdGl2ZSwKPj4gKyAgdGhlcmUgaXMgbm8gc2lnbmlm
aWNhbnQgZGlmZmVyZW5jZS4KPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0gWGlhbndlaSBa
aGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsg
IGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IGFtbG9naWMsYTktZG1hCj4+ICsKPj4gKyAgcmVn
Ogo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgaW50ZXJydXB0czoKPj4gKyAgICBtYXhJ
dGVtczogMQo+PiArCj4+ICsgIGNsb2NrczoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsg
IGNsb2NrLW5hbWVzOgo+PiArICAgIGNvbnN0OiBzeXMKPj4gKwo+PiArICAnI2RtYS1jZWxscyc6
Cj4+ICsgICAgY29uc3Q6IDIKPj4gKwo+PiArICBkbWEtY2hhbm5lbHM6Cj4+ICsgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gCj4gTmVlZG4ndCBpdCwg
d2hpY2ggaXMgc3RhbmRhcmQgcHJvcHRlcnkuCj4gCj4gRnJhbmsKPj4gKyAgICBtYXhpbXVtOiA2
NAo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0gcmVnCj4+ICsg
IC0gaW50ZXJydXB0cwo+PiArICAtIGNsb2Nrcwo+PiArICAtICcjZG1hLWNlbGxzJwo+PiArICAt
IGRtYS1jaGFubmVscwo+PiArCj4+ICthbGxPZjoKPj4gKyAgLSAkcmVmOiBkbWEtY29udHJvbGxl
ci55YW1sIwo+PiArCj4+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4gK2V4
YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+PiArICAgIGRtYS1jb250cm9sbGVyQGZlNDAwMDAwewo+
PiArICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYTktZG1hIjsKPj4gKyAgICAgICAgcmVn
ID0gPDB4ZmU0MDAwMDAgMHg0MDAwPjsKPj4gKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDM1IElSUV9UWVBFX0VER0VfUklTSU5HPjsKPj4gKyAgICAgICAgY2xvY2tzID0gPCZjbGtjIDQ1
PjsKPj4gKyAgICAgICAgI2RtYS1jZWxscyA9IDwyPjsKPj4gKyAgICAgICAgZG1hLWNoYW5uZWxz
ID0gPDI4PjsKPj4gKyAgICB9Owo+Pgo+PiAtLQo+PiAyLjUyLjAKPj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
