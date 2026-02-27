Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54079FD5323
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Feb 2026 09:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpkTRivlvNFdBCPhN4dTEGYtX6yqMz2HAj+c/an0at4=; b=0RLJNTK6tAx3KJAWHBVdXNmvYO
	AjSqTIm/5BqIlt+PCG09qKoO80Pynx4OrJpspuwXHILKB5qypG0yL7HH9jP+OGW5WOJCrcbW+bccK
	R9h9neNNpKtBIcEottOkEATlRsph45UiF0WZfN76FwnHs5lgJljyc+d7K2VicZPRQwgqMldD4dRxc
	LyEVXOLOs2p0yplDcHnVN+t64Mj9zjlSGt5F4++7LCoHWPvrVkV+f69IM3chxVYlpPH4KOtHjilfv
	rVqA1gcifDNcTy638VMBQ0+YHeltDYDkPMEu/ACHTVZfyVc7+Uf/HK7675U59HrSLVwdDaMMRf5Zk
	ORFupH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuNa-000000089ui-3xqE;
	Fri, 27 Feb 2026 09:43:26 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuNY-000000089ty-1Nvb
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Feb 2026 09:43:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxeDGUUNQR9yDdmaFTbQUGA0L638TqXmJp7JwHsrNijglY3I5VlKP7nficO9QQbxGUEBmchU/+rlwpiz17PB1Fdnw3rNYJa8TWxavlfy4AmwwKjCMFcoqMyiJ5KLtDWEG31HcTYoIVlDvPF/KejJEwFW8q0wVDP6zw1RJmxfQ/MibG/cO9CZVIjTPNaA7WdWqaBx6S4v0CbFEpgnEiIpm6UrA2OuARxWvG95kQT8cWLpyuGQVcNQe0i2PXOG0PGaOS2rxyJshOKWS9SpMRKTGj2AY7J36ZqKOsQG0qahWcTl5HFtHmMJywNzbIpOXDR199egb3P7tKwc0pqwR+LvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2IhjF1adrBOpitV3ujpp67wuen5qXICjqM+01VX/A0=;
 b=pbSTszNCQiKM67r7NyXnFJUaIJD80NQ36PGKutWslo1Wm6vOi5Oa8jgYLGQ6ySFHStSdOeu/YNOd84vzkrdmfizzlJFZNAY7Q8MQKdODMOc9dpD2x7k/uFj9EoB7ElNmZoj8Ew4jmRo2BTXpDRiFR+SjMW3wvDYH0UpEfXs1pERklUInb54+TUXpuiX/wgPDyfsKjJeKGJ/+/N8vuAK69V0DXyszFLbJSEBNjz971M1L3xqHVafiBHzmSEjQT1FXjwRp6PejPcQ9C3GWYBq5Qz9himHGdXu7eAfobhdtFsPFyhlINzW4RpYHQV9V4nM8sj+sIvgY7SzN8EWzsm1L/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2IhjF1adrBOpitV3ujpp67wuen5qXICjqM+01VX/A0=;
 b=jojYaKgnGBbkRuZ+sqhnbf6Poyjtp4CsjnD7GIkBMcuIkR8rECKQPH0Qt2g98TqCW3Lx+078X16ToxWNGjl0q2y9amhmE1M9nRomydd48i4q1h93MlC7X3oq9jZz3fzkcrPoCjO0RKKfbQD4Isfg+tuKn8BfFrPvxX5VviM+3Bj5vRhOCuuurQ8/naIbHb1Yz2AtX2mK/Le+S6Zzi/8Ns48girbiAolgNoebCkvaQFnqr0l1a6AxlbmcFzGdlLDVvXmFAFF/fcCypi8w6Mg07nAMPMSsbI7bYnsEM2PSpZdLt3dLPPgWaR87O5kk6emUAqArtwogqQfqf+jLU5G2Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB6497.apcprd03.prod.outlook.com (2603:1096:400:1be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 09:43:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%6]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 09:43:04 +0000
Message-ID: <4fa16352-5f74-473c-a568-406e3ca24395@amlogic.com>
Date: Fri, 27 Feb 2026 17:43:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260227-amlogic-dma-v4-0-f25e4614e9b7@amlogic.com>
 <20260227-amlogic-dma-v4-1-f25e4614e9b7@amlogic.com>
 <20260227-crafty-just-cheetah-7ef8a2@quoll>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260227-crafty-just-cheetah-7ef8a2@quoll>
X-ClientProxiedBy: TPYP295CA0041.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::19) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: f31b1690-4753-4d66-ff11-08de75e49ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: ksSXoEJ0BLk1SqnOKTLS+hituEoGGGqyr1bMXSc7KWJtbhcJS+bJezsHfJ3jC6DaW0Q7U5JJQydlTdRIaj+11RSMQP7wATXUFsvDG4ugsXd77O5prHPRY0d0sFS7bQf2i8ybn0zeKTp48j26oojx9SH1PNdJILdDRokcwfIHNgHmqsnCppIIbRvUVEhhy8TnGyr4dRu/6VKvZaBZMYhR9aSn+J295vtEnoHVs+YPbl+osFjOrTlOAwkff/toAH89nE7iamVEzHG48E0kMBDHb0uqIEO8DYOeCVrCnd6DY6W/klbHKkm15SodwaFhOOxuATouEWw5rtmo5TSOQ06w4LAjRhpOKCNrDpIzCh+BhQ6JuvZUsTd6CpwlRJFGmI+zibWWmJWmT7iN9WoayEg+8cgliKn0dMY2UeLePVgCBcqokCmChSC+PgKuIe9/H7Kr1OKpuACFPmShkoDFQnmPZJND8LG+v21PrVTXL1pKrNlDs8qRl/4ZBDGQFjjQnFms7lo5ZZUaJQKjycXlMKjXrMf1cGQm//vSu5jE9XI4eSl75VOyhZxE6UOUnK5EmAnfjVnCnEsk2mViojo0axot5Lum9lab7rVI2bI/CXdAZhi/kp+2p6Niy3jF5fUYwwRQzkkFIHC6h17vRyaQpcHikq8lSJZRJAmiIyN99sLdUPDnR3BjVIoWcIwwfcSQTr4Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnA2ZGptTzgzbjc3ODJlVnFZNTdaMkprbFBVTytGbWs3R0Qxc2ZvSGZUM3JN?=
 =?utf-8?B?dkdrRjRaNXRBYkFWK0l6WTRoSzhobWNsenJERlU5ZGFyN2pMZFZYb3pZd3k0?=
 =?utf-8?B?RjFHeWNhdkk0b3dJNkhhaktiay9OQ1BTVkNQTWt2RlZObXJGUFFEcmNaWCtq?=
 =?utf-8?B?T3hiSk9tQVpibldLeTIwUWN5SnZWV2R1NUIxSXhRalFUYTByVExaRmhkVUNp?=
 =?utf-8?B?Qmc5MlN0bDFUeXVtaGRBU2pmeWNoSVZoSk41TnR3cS9mVnN6UDM2QU1CRmVV?=
 =?utf-8?B?emkzTDJ6VmRGUmpRcXg0VDkyNE1YWmx0c01NaWZONDNScnhHMVJsNWtIYmcw?=
 =?utf-8?B?RFdQNURBTHdHdmRaUHZZblozRjdjS25mam8wTTVjbjRONDNETTM2Mnh0bkxY?=
 =?utf-8?B?MlRHeDg0a2tiNVNwZ1VWZ1pKSk5MektTVUhTbmsreVd6cFMyeWVjcVJuUEFB?=
 =?utf-8?B?SnZOY0RuaWZOUk1PcEMzSEtNNjU3ZVhtaDBERWdLbDR0TVBpRXlpSWVXdVNw?=
 =?utf-8?B?UVovZGVySk8vbkxaNy9lcDZVRUZLS0J1N3c2T3pzN3doZHNJR2Z0WVBsaG5I?=
 =?utf-8?B?aklsYlExWmFSZkZpbGJyd1JIbWdOdVpRQUdscktCREFydXhRMW8wOHF3a0JY?=
 =?utf-8?B?cDZObFpvTjhSY3B4dTVYQ3ZqT0I3eFVjRnZYTDFQSW1LQkg0V2lmcDdSVWpl?=
 =?utf-8?B?Z095UHFYbERuaG02NFg3WXExT08ydkJySzFDZ0RrcWQvOTJGaGVsdkFGZ3Ux?=
 =?utf-8?B?dG5vV0lsLzhadjZjRDVydXh1UWFIcnlxZWJRbHRCR2k3Rk8zd0xkZTZMRjF6?=
 =?utf-8?B?S1lwNGlUb21QK1VyUGNhNk41L2ZiR1hYUlQzMTlhWk5SRW5STE9IWnM5VHpQ?=
 =?utf-8?B?UnpQVkNWTlMyMUN1Q2ZESTBUSm0vbHZJYzBTbVBOcGNSbkxUb3BRa1JwbjRG?=
 =?utf-8?B?RzlqanRTU2tJVWY1ZTUxbzJIZk9kNWtUdlhHSmdmSUhIdUhucXE2cW13ZFV2?=
 =?utf-8?B?YXRZc0d5N2M0anhBMTV3RUtzOVViVjFNN2NyaGIyVjYrVXFQRXJuditqTkFL?=
 =?utf-8?B?RDFWM21tQ2lDYlNveVpaZW94YktsYVZicUNWeEhhcTg2aURnZ2g3OG0xRDM0?=
 =?utf-8?B?MWRrcWdVM1lZOWI3a2dRc3V3VTJWLzJYOEQyRER6SjdZUk5lV2FJVG9BMlRI?=
 =?utf-8?B?OW9YZlZHR016V2VGNzVDYWprajZ1VW5peTRiclFvelFkMDNXd1NKQVVtMzdm?=
 =?utf-8?B?dytzRFdYVmNnVnc5TG5ZeWVTZDdZcjYybXNodkRZejZjTE1wY280QnFlVVN1?=
 =?utf-8?B?d2ZDRDNOOU1uazQvUzdxOFpFeW5mSzNITmJ3Y1lJK2hQTkVvRVovb1FoQWlG?=
 =?utf-8?B?QXU1N3FjdEgwY1JjZ0kxd3BsdE9qRThuNkhuMmlnVVRLOERWTVpCcU9lc3dh?=
 =?utf-8?B?d3Q2dnBON2lQNmxnMmZCK085TjBqZGptNW9RZW5iN2h5OERsMzQ0QTZUWTd6?=
 =?utf-8?B?MWprZjBXQ3cvbEtMbmVrK25LeVYvb1FXeWhDVlU0TVpVWXM3UGNVWXV0cElM?=
 =?utf-8?B?L2t3TEhKREU4OUtiOEx4emZTU2lNTzh1TVhFNUpBNEVVaXpGaTR4RUpJTmgv?=
 =?utf-8?B?OVZoVVVmNDVKNTRaU2k2V3ZLSE5qSFEvMEhmSWo1cWdtNGdXWllvK1daQnRo?=
 =?utf-8?B?TWY5d29TZTltMDIvbGQxWXlXK29yR0dMNW9xcEphYmhmcUxlSjhPaGNZRjJB?=
 =?utf-8?B?VnVISG5xOWI4c3lkb0Q2QVNNK3o5NkpuQXhiRDRqRDAyS0dOY2x3YlpzVXJn?=
 =?utf-8?B?MmxGWE5uKys0MnJmV3pLMlBaa0VUQmplZ0dFU0cwRUwrckM1ZmlKd0krK3BL?=
 =?utf-8?B?cFhJdXl4ejJvaloyTm8rRnN6dFBaelFuNDJ4Nmx4MDdvRGkvd0xkcGdXUmdI?=
 =?utf-8?B?aERDZlBrM3RaakVrM1dzZmt4Y1lrdnF2UTZ2QVdmanVjRm5ObEpvakc2dzlx?=
 =?utf-8?B?U1RhK0lSTHhuakM2dE9zQTRvVGVRbTFmSUlSYnlGZ3BITEZIdDFBMDdxV0Rw?=
 =?utf-8?B?ZGRxa053aGNheEpuL3hQNlI3Y3llVDFaUmtBelVtb2dsYk9iL0tsQy92KzFj?=
 =?utf-8?B?K1pUcjBPSUlQbHY1VzlCWFBMWDFRUFVvb24vS29ISk8yeGhpMWEzNnFoTm9V?=
 =?utf-8?B?SlVkYzFtZC9GeWZHNjh5WTJQQ09rR1pzNDNBRmxFcHROeDBJT3R2V3JoTWxB?=
 =?utf-8?B?RlV0eWpDZVBnL3lGOXROSnlPbFZUeUZ1OHY2cy8wdE5UVzNMcHp6MEp5ZDhr?=
 =?utf-8?B?UFhXRWpOM1hFQ0xhQkNiRzg2bEJ2cGRpRGJmYm9tYURJSVowSmJxUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31b1690-4753-4d66-ff11-08de75e49ae5
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:43:04.7338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S36PZJx01Uqqdy88KPcPQQxjAx/ojnTrp8Ked05qo1Q4K0dONpAM9RO2Zbslsbk1j0h60lCqE+SgPkJYxWoi6omG4SuvUH1BIguwSUShT6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_014324_383576_E1AF4113 
X-CRM114-Status: GOOD (  16.20  )
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

SGkgS3J6eXN6dG9mLAogICAgVGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKT24gMjAyNi8yLzI3IDE3
OjE4LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIEZyaSwgRmViIDI3LCAyMDI2IGF0
IDA3OjIwOjUzQU0gKzAwMDAsIFhpYW53ZWkgWmhhbyB3cm90ZToKPj4gQWRkIGRvY3VtZW50YXRp
b24gZGVzY3JpYmluZyB0aGUgQW1sb2dpYyBBOSBTb0MgRE1BLiBBbmQgYWRkCj4+IHRoZSBwcm9w
ZXJ0aWVzIHNwZWNpZmljIHZhbHVlcyBkZWZpbmVzIGludG8gYSBuZXcgaW5jbHVkZSBmaWxlLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW88eGlhbndlaS56aGFvQGFtbG9naWMuY29t
Pgo+PiAtLS0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEu
eWFtbCAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysKPj4gICBpbmNsdWRlL2R0LWJpbmRp
bmdzL2RtYS9hbWxvZ2ljLWRtYS5oICAgICAgICAgICAgICB8ICA4ICsrKwo+PiAgIDIgZmlsZXMg
Y2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sCj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWZkN2IyNjAyYzMzCj4+IC0t
LSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rt
YS9hbWxvZ2ljLGE5LWRtYS55YW1sCj4+IEBAIC0wLDAgKzEsNjUgQEAKPj4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPj4gKyVZQU1MIDEu
Mgo+PiArLS0tCj4+ICskaWQ6aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZG1hL2FtbG9n
aWMsYTktZG1hLnlhbWwjCj4+ICskc2NoZW1hOmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogQW1sb2dpYyBnZW5lcmFsIERNQSBjb250
cm9sbGVyCj4+ICsKPj4gK2Rlc2NyaXB0aW9uOgo+PiArICBUaGlzIGlzIGEgZ2VuZXJhbC1wdXJw
b3NlIHBlcmlwaGVyYWwgRE1BIGNvbnRyb2xsZXIuIEl0IGN1cnJlbnRseSBzdXBwb3J0cwo+PiAr
ICBtYWpvciBwZXJpcGhlcmFscyBpbmNsdWRpbmcgSTJDLCBJM0MsIFBJTywgYW5kIENBTi1CVVMu
IFRyYW5zbWl0IGFuZCByZWNlaXZlCj4+ICsgIGZvciB0aGUgc2FtZSBwZXJpcGhlcmFsIHVzZSB0
d28gc2VwYXJhdGUgY2hhbm5lbHMsIGNvbnRyb2xsZWQgYnkgZGlmZmVyZW50Cj4+ICsgIHJlZ2lz
dGVyIHNldHMuIEkyQyBhbmQgSTNDIHRyYW5zZmVyIGRhdGEgaW4gMS1ieXRlIHVuaXRzLCB3aGls
ZSBQSU8gYW5kCj4+ICsgIENBTi1CVVMgdHJhbnNmZXIgZGF0YSBpbiA0LWJ5dGUgdW5pdHMuIEZy
b20gdGhlIGNvbnRyb2xsZXLigJlzIHBlcnNwZWN0aXZlLAo+PiArICB0aGVyZSBpcyBubyBzaWdu
aWZpY2FudCBkaWZmZXJlbmNlLgo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBYaWFud2Vp
IFpoYW88eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+PiAr
ICBjb21wYXRpYmxlOgo+PiArICAgIGNvbnN0OiBhbWxvZ2ljLGE5LWRtYQo+PiArCj4+ICsgIHJl
ZzoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgIGludGVycnVwdHM6Cj4+ICsgICAgbWF4
SXRlbXM6IDEKPj4gKwo+PiArICBjbG9ja3M6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiAr
ICBjbG9jay1uYW1lczoKPj4gKyAgICBjb25zdDogc3lzCj4+ICsKPj4gKyAgJyNkbWEtY2VsbHMn
Ogo+PiArICAgIGNvbnN0OiAyCj4+ICsKPj4gKyAgZG1hLWNoYW5uZWxzOgo+PiArICAgIG1heGlt
dW06IDY0Cj4+ICsKPj4gK3JlcXVpcmVkOgo+PiArICAtIGNvbXBhdGlibGUKPj4gKyAgLSByZWcK
Pj4gKyAgLSBpbnRlcnJ1cHRzCj4+ICsgIC0gY2xvY2tzCj4+ICsgIC0gJyNkbWEtY2VsbHMnCj4+
ICsgIC0gZG1hLWNoYW5uZWxzCj4+ICsKPj4gK2FsbE9mOgo+PiArICAtICRyZWY6IGRtYS1jb250
cm9sbGVyLnlhbWwjCj4+ICsKPj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPj4gKwo+
PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRl
cnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+Cj4+ICsgICAgZG1hLWNvbnRyb2xsZXJAZmU0MDAw
MDB7Cj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhOS1kbWEiOwo+PiArICAgICAg
ICByZWcgPSA8MHhmZTQwMDAwMCAweDQwMDA+Owo+PiArICAgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMzUgSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+PiArICAgICAgICBjbG9ja3MgPSA8JmNs
a2MgNDU+Owo+PiArICAgICAgICAjZG1hLWNlbGxzID0gPDI+Owo+PiArICAgICAgICBkbWEtY2hh
bm5lbHMgPSA8Mjg+Owo+PiArICAgIH07Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRp
bmdzL2RtYS9hbWxvZ2ljLWRtYS5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9kbWEvYW1sb2dpYy1k
bWEuaAo+IEZpbGVuYW1lIG11c3QgYmUgdGhlIHNhbWUgYXMgYmluZGluZyBmaWxlLgo+CgpXaWxs
IGRvLgoKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMjVl
Y2M0MmUzOTUKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Rt
YS9hbWxvZ2ljLWRtYS5oCj4+IEBAIC0wLDAgKzEsOCBAQAo+PiArLyogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkgKi8KPj4gKwo+PiArI2lmbmRlZiBfX0RUX0JJTkRJ
TkdTX0RNQV9BTUxPR0lDX0RNQV9IX18KPj4gKyNkZWZpbmUgX19EVF9CSU5ESU5HU19ETUFfQU1M
T0dJQ19ETUFfSF9fCj4+ICsKPj4gKyNkZWZpbmUgQU1MX0RNQV9UWVBFX1RYICAgICAgICAgICAg
ICAwCj4+ICsjZGVmaW5lIEFNTF9ETUFfVFlQRV9SWCAgICAgICAgICAgICAgMQo+IFlvdSBzdXJl
IHlvdSBuZWVkIEFNTCBwcmVmaXg/IFlvdXIgY2xvY2sgY29uc3RhbnRzIGRvIG5vdCBoYXZlIEFN
TAo+IHByZWZpeGVzLiBXaGF0IG90aGVyIGNvbnN0YW50cyBkbyB5b3UgZXhwZWN0IGhlcmU/Cj4g
CgpJIHdpbGwgZGVsZXRlIEFNTCBwcmVmaXggaW4gbmV4dCB2ZXJzaW9uLgoKPiBCZXN0IHJlZ2Fy
ZHMsCj4gS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
