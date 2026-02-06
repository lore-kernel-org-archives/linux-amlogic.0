Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC6AEE6B4C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Feb 2026 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HaV0jqlkMdUuRq36rhtx8iebJOWBTfm1TtVL739Q0k=; b=Q0ZEcXF3gvNwAH
	HNOgmF6Fi1D6zynIrmiSAG4MrgHg8Q7hzh48J8Yr84kCiKvIAAP5tcqqepf5znoJq7A2ixDLb6bNV
	JGxaRYrEfv4gTHvNJ2+8rfq+TNTi6SafRp6zj6IjWMIm8feVYn+X7qiCIsxcGi2eq9YvtYjTliPgv
	WDzXgWt1KY3KubCB2J4U50dCUfX5+vixZaTz2fdv5e7Clr/tHTXNYYFcHsR27S2yPTvKLwGCR+5r/
	ZG3Y+0da+Znz9evW7Pog+EzWdVa+CUiPE9R3QtpJcbg+9p+jAqmGVcIS8npgMrHqnWBXgfQ0yn43y
	tqIU42AYpLOPKQU/K2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRaW-0000000Bkfy-46v4;
	Fri, 06 Feb 2026 19:33:56 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRaU-0000000BkfR-2JcY
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Feb 2026 19:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBk3wiZBdiK32wBm+6xLiRu2zxio0FwlafUAnRu2OCyGh+nh8TF6x3HuunSAOsWRZi1bXOBomOXQYKtFm6RG2DYKbP/ri8/rEfiqhWhJ6HAGLI2qP3Corh2os25i0T/lxJX7YxmYAZ/d7I1Mrw06h820vYPppHuGnrb74oO1LvYdkEXGNGNEPdJwhIk2ob3EZwgk5LRzluWEWThnARszpJTR415vKebC2whnpRqwGZN3gnlBbmHr6/LhISI+Q0TF7J93vRb1emz23khjWgkbImu/ckIn5GZiTTrtaZdX3KKW68a1wZs6uhuTuWp5GE9zwjXJpnbS074f6fAiNR8UdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PudXe6rihN3gvmtagqexciBMxRyb7Ovtz94K2Ik7Igw=;
 b=MGBwRUclY6HujQdXJpp0dPgMF4aoqeMO7SMRyjxmvvhCBVxvR1P19lJcGzVAn4F2r2M2RFUW4lzzdam7HREtNdRgQtxAMMA/SQtPOgJlOOE8ih3prJ6jc72kS3PhRfq8S+8jxgOjVO3fWasLnBwLOJ12Bp76JcEoDoJZO9D+TCXKxXuxRN2iyhpXZEzNl1YLpikMb2Ghvt/fIesjiVQMw9/gSgpfuaSGdPy+P6LdFIWbVCqpukW7v2321xjSNLEee6Ac74FRmRlWJzYtWsDXlP3EW9VyogxslfKceCR8W0OeasINuQ7CEpFNljFhPtvW420FoDLv7dkB/v/4JBJS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PudXe6rihN3gvmtagqexciBMxRyb7Ovtz94K2Ik7Igw=;
 b=Uc4XQWRdew0P4yt/d9fOqEORp4p7W2AHLDDMgxRNEzzU2yqH2s6DSnrlc461WHTRDZHu4ASkQvYXu4jxD2o4Q0j8UhFdzFBqOB+kUWtbjAns3VUDCYUDY1Bi/8YthHN7CUBBYcbj1JnbMs9nmY7vobNU5YOrj1Jhz88sn7kgxnEe1MSf1tpBhsIZGaQFcyM7sd4Scr9g8OBq7C8jR4kC+y8aaXgs9W+iRo2VbV4Okg0/yq95as3Q5tzkvaDEiO39DqotOdlMO4l701xuTeJmgtnpBtzlm7sGru/FB9v57l3GVEro3EglQoApZISBCfRPxYyMH4UKtjCo/+nLmSFa4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6971.eurprd04.prod.outlook.com (2603:10a6:10:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 19:33:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 19:33:50 +0000
Date: Fri, 6 Feb 2026 14:33:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Message-ID: <aYZCFiI0PbAhabj8@lizhi-Precision-Tower-5810>
References: <20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com>
 <20260206-amlogic-dma-v3-1-56fb9f59ed22@amlogic.com>
Content-Disposition: inline
In-Reply-To: <20260206-amlogic-dma-v3-1-56fb9f59ed22@amlogic.com>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: b3262186-948c-4892-4aca-08de65b6a771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|19092799006|7416014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dndrRnhTWkJXdG1VbjlJNklqWnVRZTJzOTBESFZiOHMzUTN4YTc1M3BsTjd1?=
 =?utf-8?B?ZVBUcjR4dEVLQVd3eVk5bE9yaE4yYmsxak1relk3SEd5dXhLL2pPM2twcGRz?=
 =?utf-8?B?a3p2RHhyVTU4L3RNQVVQV0JRS3lqTmgvR1JnQWJYZDQ0K3JsL0xsa3doUWZt?=
 =?utf-8?B?MmtFNG1vdGpRUWZVcW9FRUgwV2xtQTJqZVduamFodWlkOUExMytjZmt1bjhB?=
 =?utf-8?B?S2tyQ2U0bk5CRDk4SW1Sc0VoTkE3UXFrWSt5N2ZySWxyb3NwTHJlcTNhRE5R?=
 =?utf-8?B?Y1B2bk5yVjFrSXlxMEozQzgvWDJaTmJQb3ZId3ZpbklkVkV4ZVRpQVZTdGdO?=
 =?utf-8?B?eFZGdjlLQWZrUWtTWUc3UTFzMEJHb3hQUDk0Q0RGdzdXQ3NlaitvT3NCYm56?=
 =?utf-8?B?eGVCWGl1alErSFhPU1VuTlZiQjM3QUJZYlcwY0NBZHRYRDFLTU9MTk5uQ2R1?=
 =?utf-8?B?UFd6Skx2U1MxSEFlb3RhWkZCaTJiU2lBOG9rQ0h0MWZIT21OaEFzdC9pZUlT?=
 =?utf-8?B?UDlxQ2pRa0RSR0pCKzEwem5mODNDWGZRd1lyWEFPOUtoN0ZLZE1jdU9IYTNm?=
 =?utf-8?B?YWM5VnFpTGthS2NHaHdydU53OStkNHkvU2tiT2lkY1dab1lkK1BGellibXJO?=
 =?utf-8?B?WEZRZWpOZHBNdFE4V0VzcVFOZlNHWlRYTmpCRzhSTzdjK1RsRHkwd2lCRXBq?=
 =?utf-8?B?T0NFRmZlQWd0d2Z6NTJ1Qng4WkxDV1R5Y1NPbzAyaDFzd01RcDBzUkRucXhU?=
 =?utf-8?B?MWVFTjQ3THduL0kvU1Z0RVVwQi9BdGluKzJzYUo2R29NOStOQTZWeWgzdUhs?=
 =?utf-8?B?S1BpbnNUTGV6dTcwS3hWRDZnN2g4TmptSnZQcWsyNGpPL0UzdEpNYjZjemt4?=
 =?utf-8?B?UXczUHMxb1c4SkZDRXY3K25OYkRqZ0V4S2xpLzRSSG1CUkM0dU1SOC82ZjUw?=
 =?utf-8?B?Y3hFWWdxTU40bUdNSVBJQThRdXdQYThNR2ZwZ1FFZ1BCVjBEMVN2L0poUHhp?=
 =?utf-8?B?eWF2akFFb2ZsRU9PZTRKclBYNkIzUjVLVzZSM29nZlBTWWdnRFROcmlPS0ti?=
 =?utf-8?B?L1N6YjM0WnVhSDY0OHFOVlVOS2F2M2pWMVA0ck9XWmRCeUQ2L3I4c2M5MjZq?=
 =?utf-8?B?dmJ0eTVaYTE1YTRLN1B6aDdaaGQ2My96ZWpZU2VSbTRLaU00NGUwUTNsZVdU?=
 =?utf-8?B?TzVZaWU4bi8xNWNQUm51OXpHdE5LbUx3emNZT3FMa1hJOWgvbDRTTjAxYzVZ?=
 =?utf-8?B?MGFUdFZyS1JzeWVSVkJyMHdpOXFHelhKeVJWS09BRmRhWldSWlR6d2p3V1da?=
 =?utf-8?B?TWJvL3ZvRHFMcEk4dDZSanhoNWV5SXFjVXpQcVNTUTBqbU1TNHZqeU5qMHZS?=
 =?utf-8?B?cmRzYTgwalVEbWhxekZqVXliaVpPY1VGZkRvQk9ha0YyNGRSalRCVDN2UVZi?=
 =?utf-8?B?MURlQWRSaEM0TldncWpTYXFnWjBtbmQwNnRsR1l5NHZuRUtvbFptYk9YTVNv?=
 =?utf-8?B?MTVoNElzT2V6UG9YbmxlUW9oN29vRUp6R3pxck0vM1c2eis4eS9oa2xmTUNl?=
 =?utf-8?B?U2hwVGc3a1l2RHRpNkJCYjFVWGtuai9aVDdaVGQrbzBDeWY3bnE4a0lISnJS?=
 =?utf-8?B?OXFQaXJaU1ZRL2dYWFR0S3cwUjQrQ2I5QklLNmpabFJhR1d2c21KTktZeGVm?=
 =?utf-8?B?ZUNrVTZlSGEzakRDeU5rSkNaNFFaWUxyN3BJTnJjdDVTRHpQVlNCRzVRVGh3?=
 =?utf-8?B?eFJTbFpMd3c2Y3YvU1I4WGYveWdjbWcvV1YxSzd0QW5OUCt4Lzc1RWh0MVZq?=
 =?utf-8?B?bUF2VlhqcTZVNWxzS0VsSWYzUUdud3VpNi94UjNtbWNSanpIZjIzZUFlazJE?=
 =?utf-8?B?cnkycXlpcnVUcXRqTUUxdVpveUJpdm1IUHI0R01Va1EyUHdRRHk4UGUydmkx?=
 =?utf-8?B?OFY5RmZjTFBaWGI2RlVzUTZlRlQwcnFjcmVwZTlhUlF1cWdMSE00M3dwaS9k?=
 =?utf-8?B?b3UyNGVSMmV3bUpCcGNTektXbW8yMGQzTWdnanZBK1ZzUFhpQStlRlN2RVRN?=
 =?utf-8?B?VlV2enpWMGlIL1pteS95TzVvcVQyaGZwSFBPU0JORTdLVk1ZUXFwK3JrWUtK?=
 =?utf-8?B?V0tNMmNQOVI1RkJ3R01QaVgxWVFBOVJwOGdGSkM1aWtLd2R0bGs2bGNOcXNY?=
 =?utf-8?Q?tP8mQoKFuEPSmIqVIePKFX708SPHvEfg7GltQQXp5UFH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(19092799006)(7416014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG4yMnJobUJjd0RPUXc1a2dJckNESkJTVDFmcWdGVUFLc1RYUnBTTW51alA5?=
 =?utf-8?B?aEVaVkFOcVBpbWpFVUx2bjhacHVRV2RyS3ZPZ1VPdEJVWWFJSjN6bHl4ZzBs?=
 =?utf-8?B?S1JMckx1V1NaVjlhSmtxMjBPWmxXNktjZEp0SmI5Q3hNYk5jeFhFTTA3eldX?=
 =?utf-8?B?cmltN0k4M1YxVnBlUkNQc1gzRklvSGNUQnY3TXRlQVNDS3M2WjZDWS9iTWdJ?=
 =?utf-8?B?TW5QbnFLVUtWNnUwNSswcHFGVm1hNk9Sdi8zNUIrRWFJWXVhbmcxblQ5WWJj?=
 =?utf-8?B?a1pscTVpZ0xqK0V2enVvY0N2TklvcFJoa1VBb1VTNEVkT2NVVTNCSm9Denlm?=
 =?utf-8?B?bEpFY3V3bitMM3EwcmFvajJCelRYVFZVV3BlVVB6cUQ4RGhCVUhPRk1jTmtu?=
 =?utf-8?B?WDlmcUk3OFJSNzdBNDdvSkNhWnpkOGdFSWpDRHJrZHdUaHZFNXBIR3J0WXZi?=
 =?utf-8?B?SnF0L1pEcG00MFQ2SDloVml1bVVXaDN1ZG9nMXB0czQ0NVZIZmkvYlQ3Q0Na?=
 =?utf-8?B?SXBHTzZtSjJEZHJHM3FsUWdMOGtlMzlnaldSOVRNbUxqM3ZVc0NzT1QxOTc4?=
 =?utf-8?B?bm5TTUQ3akFQYUZlL0liV2huZmV2Z3FDc1RZWkZnRTUxK0xQY3RtVVQrTXl2?=
 =?utf-8?B?aHo3OUVBTktPZGZqMVBRcFRVYTJTZUQ3c0FQM3ZVbVV6aEViZ2Y0ZjVHZG04?=
 =?utf-8?B?dnpyVEdra3NlMW5MTTNZNGtTckpzNm5WTDRHc1VzNENoY2s0MXRjK0ZWOVVM?=
 =?utf-8?B?Z3pjMDF3R01hTUNNREYvOTduZEp1N2R1bHJsaHFnY1FadGlSejNFYUcwejMr?=
 =?utf-8?B?TE1ZbFRuNURJTGQyNUVtKzNXZEtpaHM4MnQ3eWkvVkR2aTZKS2YydmQ4blNQ?=
 =?utf-8?B?MEJnMEpoc0dMU1NIVzl4WHVIYXdzUmQ3b1lnNGp3b0x2QlhHZ1JYOVVwU3ha?=
 =?utf-8?B?TC9xMGFhUlZyak9WdEExMTZWNmVVVzE0MERZcFVZOU5iKzRRc0oyUVFQM1dP?=
 =?utf-8?B?Z3VvbUN6emNLeWM5U0NZSjBZTkhKREVIWUVnK0JMcW5SZXoxMDZndzVya2dH?=
 =?utf-8?B?UGh1cEJHbHhuSDZvMHNsWXI2NlBYVFVNV2tLeG1iRm16UnJnSjFNSlUxWkh0?=
 =?utf-8?B?bkFoelBiTTNGbnBDRVdON2JZak1ocVJzZEtIZEowY3BJZFQwUThDV3QwTXIy?=
 =?utf-8?B?cFo0MjdTbXJ0cFh0YkJFNUpIWGpnYWFZdGRSSlpSUWI5SWlkY3VpQzdLNjIy?=
 =?utf-8?B?clUwemJjSEJ5cnRHa2VBU2tTOHZtZ21udytJYVhtejJOM2E1TzAydi94cWJJ?=
 =?utf-8?B?NGM0eHdBZkQvT0hwRzdJS2VEaXRCdTZGUVd1aDU4T2xCYmc0YzBqSVNEL2Nu?=
 =?utf-8?B?bzY3Zzl1MWJ0djJBMHE0RG1oL0pCZ2IzRURYRUNjNzhpV0d1QkpFRmZqZktX?=
 =?utf-8?B?Z3BXZXhYOGhRMDNMT0YyOWN5cXZjelhtWmpiWEl1ZUZqZHoxYmFaT3VGQ1J3?=
 =?utf-8?B?WHI3aEkyQnoyNWlnbHY0bzVvYW42YmoybDR1TmFaRUZRbjJlNEF2b0FXTUVY?=
 =?utf-8?B?c0FGWGFQZlpEMWNZSFFiV2Q2RnhJOEVvY3Y3U0Y2N2hmaFdvN296bnZTVkJI?=
 =?utf-8?B?NFpoYnE2enlkWWg1RDJ3cDgvQzlmSDV0ZWdIZEFIZUJwOGhoTUpnSXAvK1RS?=
 =?utf-8?B?VmxoM0c0Z0xOeTFyRGZhOEl0Y1J5U0lNRGxUek1LcDZ5akdjOVRiK3VzNU5m?=
 =?utf-8?B?RU1qTmNCM2hTSTE5ZGsxaU9PNXlSU3JpRFBwdHdiajdwNE1HS1hMamdPZXFt?=
 =?utf-8?B?ZUs1L0c5akNEUXBmMmF3NU1OaUFDcWRhd3U1NEVXeEM0b1hQRmo3RFJQZUpn?=
 =?utf-8?B?Um9xVnc0cjRVUjdwdW9UQTJSY1FVNnJXTGpjUjdiMkYyZld4RXlaVnpBT2l5?=
 =?utf-8?B?R2cwcFV1MllFcTNNZGlEcVRKYXM5MExhdTF3TTF4STFBUExhYkl3ektvTGJR?=
 =?utf-8?B?a2d2WGttc3VvQ2MvY0x0SDgwMTM3VTR1K0xKVi8vVDNBTXFodXZNL0NaNWlw?=
 =?utf-8?B?V0thSjc2d20wdWNSUGRJYmR6bTd6T01FV0R6UkEyeHQxZW9FZUR4WktWMVB2?=
 =?utf-8?B?RTdobHNjbXlTdkNjZmlDNUUwYVN3SjMrS0RKVjVSS3IxSHkvQXlhM0dUbmUr?=
 =?utf-8?B?dFFlRUp5Y0NCQnRLNGNlQkhSeU1ia094Sk51RzdhNkJUcDZXM3dJZzFJVXpE?=
 =?utf-8?B?N2RibjRzbjBuMFRseGF5UU5FMkdPWjJJc08vb1oxbmlWdUhFWGhxWHJicDZZ?=
 =?utf-8?Q?xmahQabTi5cqQIbSSn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3262186-948c-4892-4aca-08de65b6a771
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:33:50.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: We2tTZpTO19CGdaTmZB1A8aD5Nf0KFB9ZLeMvV0m1g8+6bBmTX2y4Ops+h9ZavBYVx1VtTCIhsJy+yD5gFOHcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_113354_596294_00EE3BCA 
X-CRM114-Status: GOOD (  16.23  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMDYsIDIwMjYgYXQgMDk6MDI6MzJBTSArMDAwMCwgWGlhbndlaSBaaGFvIHdy
b3RlOgo+IEFkZCBkb2N1bWVudGF0aW9uIGRlc2NyaWJpbmcgdGhlIEFtbG9naWMgQTkgU29DIERN
QS4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMu
Y29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEu
eWFtbCAgICB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDY2
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzE1OGQ5OWEzMTk1Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEu
eWFtbAo+IEBAIC0wLDAgKzEsNjYgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwjCj4gKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsK
PiArdGl0bGU6IEFtbG9naWMgZ2VuZXJhbCBETUEgY29udHJvbGxlcgo+ICsKPiArZGVzY3JpcHRp
b246Cj4gKyAgVGhpcyBpcyBhIGdlbmVyYWwtcHVycG9zZSBwZXJpcGhlcmFsIERNQSBjb250cm9s
bGVyLiBJdCBjdXJyZW50bHkgc3VwcG9ydHMKPiArICBtYWpvciBwZXJpcGhlcmFscyBpbmNsdWRp
bmcgSTJDLCBJM0MsIFBJTywgYW5kIENBTi1CVVMuIFRyYW5zbWl0IGFuZCByZWNlaXZlCj4gKyAg
Zm9yIHRoZSBzYW1lIHBlcmlwaGVyYWwgdXNlIHR3byBzZXBhcmF0ZSBjaGFubmVscywgY29udHJv
bGxlZCBieSBkaWZmZXJlbnQKPiArICByZWdpc3RlciBzZXRzLiBJMkMgYW5kIEkzQyB0cmFuc2Zl
ciBkYXRhIGluIDEtYnl0ZSB1bml0cywgd2hpbGUgUElPIGFuZAo+ICsgIENBTi1CVVMgdHJhbnNm
ZXIgZGF0YSBpbiA0LWJ5dGUgdW5pdHMuIEZyb20gdGhlIGNvbnRyb2xsZXLigJlzIHBlcnNwZWN0
aXZlLAo+ICsgIHRoZXJlIGlzIG5vIHNpZ25pZmljYW50IGRpZmZlcmVuY2UuCj4gKwo+ICttYWlu
dGFpbmVyczoKPiArICAtIFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+
ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IGFtbG9naWMs
YTktZG1hCj4gKwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGludGVycnVw
dHM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9ja3M6Cj4gKyAgICBtYXhJdGVtczog
MQo+ICsKPiArICBjbG9jay1uYW1lczoKPiArICAgIGNvbnN0OiBzeXMKPiArCj4gKyAgJyNkbWEt
Y2VsbHMnOgo+ICsgICAgY29uc3Q6IDIKPiArCj4gKyAgZG1hLWNoYW5uZWxzOgo+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCgpOZWVkbid0IGl0LCB3
aGljaCBpcyBzdGFuZGFyZCBwcm9wdGVyeS4KCkZyYW5rCj4gKyAgICBtYXhpbXVtOiA2NAo+ICsK
PiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGludGVycnVw
dHMKPiArICAtIGNsb2Nrcwo+ICsgIC0gJyNkbWEtY2VsbHMnCj4gKyAgLSBkbWEtY2hhbm5lbHMK
PiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogZG1hLWNvbnRyb2xsZXIueWFtbCMKPiArCj4gK3Vu
ZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4K
PiArICAgIGRtYS1jb250cm9sbGVyQGZlNDAwMDAwewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAi
YW1sb2dpYyxhOS1kbWEiOwo+ICsgICAgICAgIHJlZyA9IDwweGZlNDAwMDAwIDB4NDAwMD47Cj4g
KyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM1IElSUV9UWVBFX0VER0VfUklTSU5HPjsK
PiArICAgICAgICBjbG9ja3MgPSA8JmNsa2MgNDU+Owo+ICsgICAgICAgICNkbWEtY2VsbHMgPSA8
Mj47Cj4gKyAgICAgICAgZG1hLWNoYW5uZWxzID0gPDI4PjsKPiArICAgIH07Cj4KPiAtLQo+IDIu
NTIuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
