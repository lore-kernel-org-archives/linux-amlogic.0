Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2FAC77B75
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HENqyP+BmyAi1bc60UiANGQZWIaqEZq7F08VUvMQR1k=; b=pzuk/MUZ5TJFPyAEu938PTzTYT
	J6HlpND8vTXBxRoEHsYuZI5PtLEGP3mRx2yhbF8I5P/dsRTEc+sqX6YaFa2RV5zWWwBx07xpXfK8D
	8mxuh2g0xC9TVV5TO2lgtC0P7LEmcRZ1QJL5UxcfiAOCpUp6Rx7/JCAtBuoqV/0XQt5O1sSI8TAxI
	4BTxMZilu5fZxp75xNDYwgf1Xm1KeLiitWsnj5zNRmTZb8amjR/Hjbv0vtK2J17q14jz4w4bygV/0
	RYVKJiWhX0UqOIYyPxKMH7FGo0U6kHMSTXfPjG80F7A3hSjpoXqlKcjtxsc0UU+jZR/Cgk1o8v8A6
	z/CnnZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyT63-001Kk9-1Y;
	Mon, 15 May 2023 07:58:19 +0000
Received: from mail-psaapc01on2070c.outbound.protection.outlook.com ([2a01:111:f400:feae::70c] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyT5z-001KjH-2u;
	Mon, 15 May 2023 07:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+gWho9tVWV1XFaDQDkHmCJ5C8NRYyxWhjeCgzH2OWQaUsV94s34JwPx1g7f0OQKW+tk/c9a/bFmlcsjHXAXetK7axh/B5Vp9wJ0NgByJi0HmFuKVChiPfFdX+sziIfFk/XSDOIVEUu89PVI905AHG6pJp3+gTfCcTE7EK8qG2EhdR60HZ5+fg9bAlfoLOq1g4LWHluG45vq06hqCQlnEglZZVYHOC42BGyXjFpEZhFK1Zyi87+xRnhgU5bIhQy9pnSsmyKTgcuMlLp/ckStoZ3esv7U79WO9uTYEaNn3Y9otX6hOtK5JeAw8l6w0LbQpfZzlPCGXWkOt5d8RSl7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8fXjhgqM6L0HAKjUwrAyfy7ZuTSadPp4PAc4iUvn8g=;
 b=dzfELt3EfnnshJFZDgc/DdMSO6Fr0Rs7ahGLDhtZPsuVv2olLG9l4vyxE1QWASWFoavQUg08IN8cM4cqWKt0MfjRZ6hD9wokNnQ+oOA3q12De9RBTVjUK2ydJ0OSXKwadeNLQJGgC9Ne7AAeDuHF1c5c7OYZ+QvjHqrAi2hQPBCV9Yh629QwzDAh8ZOskQi7CUXqICezXByM0gpC230p/pYO/7Cg2O1GihE4lOU7DtXk8qQRtMlOT8yNMKJ7p0JKxCmxokoNmOHXBJCOi6NbxuQNjxUZx7HYRtRQpyg2DQr2QfVxUWH9dcCK6intAyBkvxAe20dhJBYw2Q83vrqHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8fXjhgqM6L0HAKjUwrAyfy7ZuTSadPp4PAc4iUvn8g=;
 b=zTkk5+WD8AjjG1OTk2iIn1BbgH/GN8FdR9YTWVN7GfeLV6i3/lGrwkxwpCmK+s6rlDlckGi61YWTwd54anOkqc8jv/Q7hQOCNgG5Wef8sI5be5LA3rUzRT4SFlXtu7Ixuc6qGMVFKtPWN7rQVCYrQFo0ZtqyvTMUGn2aHSzGF8hRnWEt4BTUkSGwVcHRo28pyWFMd6uB5iDLvBZ9eHbiy1vD8hH/CVRs10fWZ6eGPwgCEEjnllYkKbi1IdC5GD8MrD2WmjgIGiBLJd6lpZpanR8vuX5QeNQoVyDleEAR+wIHo72Uu+L/Gi5azZAfyNSKwB3VNpDUyTq9gsp1qcKO/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB6730.apcprd03.prod.outlook.com (2603:1096:4:1d5::9) by
 SEYPR03MB6901.apcprd03.prod.outlook.com (2603:1096:101:b4::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.30; Mon, 15 May 2023 07:58:04 +0000
Received: from SG2PR03MB6730.apcprd03.prod.outlook.com
 ([fe80::e116:7d2a:af78:fcf1]) by SG2PR03MB6730.apcprd03.prod.outlook.com
 ([fe80::e116:7d2a:af78:fcf1%5]) with mapi id 15.20.6387.023; Mon, 15 May 2023
 07:58:04 +0000
Message-ID: <33f5ff59-db7b-7576-64cb-972c0dfb0f7b@amlogic.com>
Date: Mon, 15 May 2023 15:57:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V8 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
Content-Language: en-US
From: Yu Tu <yu.tu@amlogic.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230515031557.31143-1-yu.tu@amlogic.com>
 <20230515031557.31143-2-yu.tu@amlogic.com>
 <590560c9-4da6-bbd4-6aac-de57ab5403ba@linaro.org>
 <8c6ad0a9-7820-c7a2-bd3b-1eee87d96728@amlogic.com>
In-Reply-To: <8c6ad0a9-7820-c7a2-bd3b-1eee87d96728@amlogic.com>
X-ClientProxiedBy: SG2PR06CA0236.apcprd06.prod.outlook.com
 (2603:1096:4:ac::20) To SG2PR03MB6730.apcprd03.prod.outlook.com
 (2603:1096:4:1d5::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6730:EE_|SEYPR03MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 7523bf29-dce9-4638-f41e-08db551a1c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PAuvxfKPDZqnH/YqZS1KugmKM4bQOsI0vhnN7QJ5Bi/NeyOBgt6NHTvpJ2OV5trE2Fp3C89pp9XSVyFYtt3dkdJ/PC9VjDAhDi6oCWgprEAUgE0Kq5oDJX6u3w0UMEAsCze05hl1RZBXEV3LOOOwmXFu7hiWjzGTcarLHhREy46OtChFm5UpQ6JxCBdb+pJuIF+89++USwLUYTLwkhjYltjwUtZ2vS5W9WvpMW/tSgKSdnGRl3TvYabgoH8LKESOjYr+FiIXf2HCNtqUQXODqE2ZkI6dr7Ya0maPA1UvL48EPyDryHVWhJdxAX2Fj/Cga9i2wrz6bUvzIdWx8kZFY3J7ZKp3/dGOcmlkTcVvGEtYEDpqqpZrfF6l0ldRrqpAou0PwDmjvdUI3MIePriXJDikD3EmsBPM8CKsDMCeeMK57lpFpKHviFPYK8fDnw4hus8NKrlY31YNVslTuxNhoH6ZLbOKat0oprUgxl5SrTBDB/sUjFmuKbsa8wAXjGSva64JHuDBYMMG3feAQDjjxl44mOYqSn5POIEEG0dLhYRVTTIJkuBfU4o6gaGwSbyrckE2crJU3c3i9xxJ99BJwaO5ln7dsVsd5D18RiUzWAHA6FbNftZPpShRlASuYEfS532e+kyh9C9KuxcXDS4lUpFlPYjXljlnmh8iCXEzsd0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6730.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(451199021)(316002)(4326008)(66946007)(2906002)(31686004)(5660300002)(44832011)(8936002)(8676002)(7416002)(66556008)(66476007)(41300700001)(86362001)(2616005)(110136005)(478600001)(966005)(36756003)(6666004)(6486002)(6512007)(26005)(186003)(6506007)(53546011)(31696002)(83380400001)(107886003)(921005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?amZCSWN0QUsvTVlVT3JMUDBlNHVKMVJUNmRkc1gzdkpwVFAyQno0WllXZjlO?=
 =?utf-8?B?azRFSVVYVkR6NWtSUGRMdWpmSVNXMUpoZE9vSXJzRklNVTBwUmlZb0xLZlBh?=
 =?utf-8?B?RnF2SHJXVHQvcDNvTzVwc0xDRnZJdkdPUys0cXRNVGtERVF1YXdRUG90ajRR?=
 =?utf-8?B?NXN1RG8zMGVEeE1sYmNSVmNaNGFJZ2ozMVp6dHhnSXZrb0JHVVRyQjdXMnYv?=
 =?utf-8?B?OE5oNmxQemlYLy9ranoydi9ZS3VPZWorRjduMXBDdXJrellWMi82MjlNcmVD?=
 =?utf-8?B?bHJ0dDVsWGNSazR6Z25GK3RrMVJMNUlzQlVEeUsza084TUJmOXp5VFA5Umwr?=
 =?utf-8?B?d21lVHVVUXlQTXRDSS9VOTMrUmpUWjBhanBoUGNKNkNxbVk4bHVReldwcHkv?=
 =?utf-8?B?cExkTjZoRnNMd0h3ZWc5Q3FOdkdSdDVhQlhGcWRidGppajFqMUVxcHpOejBL?=
 =?utf-8?B?UitOT1YwSVZkSGloTWE2RmxMRi80YmJrbXN6c1F4Zm1RN2o1UVV5RWdKaEx2?=
 =?utf-8?B?QUtDUzA4MkJxNTVHQmlwTHY1U2NNamc1dDFpRHBUZlAzMEtKS0MxdTh1d29J?=
 =?utf-8?B?bjVWOE5ZMGpSWVNIYWh4NkRwTkdvZEFmU05NZWRvTU5EcHF4ZUk2dXBsQi9D?=
 =?utf-8?B?bGYvYW9TNW5JZk43SjlnTlN1QzgzcEx2UG1Qb2dTNHRxd3ZxM0RHcEd2M1R4?=
 =?utf-8?B?Zm1uWS80L3A2Y25oUjl0T3BKM2w5UFZSTUNiZGhSVEhiZ1lENEZVUUZZcFZS?=
 =?utf-8?B?OSs2NUhwTkc1WnVCdm8wMmZpQ0hzS0U1QVh4UDBSRFpid29EMGRwcURvWkZI?=
 =?utf-8?B?S3NxeS8wQ1lCd29qUDFjbVhGQm1oSWF3ZzFKU1l4UTJwZ3A2ZmpFZ3hwa29q?=
 =?utf-8?B?emFJMVc5REdvcEI0MDcyOXFmOHdhZjRzaW44U25pV2tPSThJRzUvRnhOQ3ly?=
 =?utf-8?B?OE9iZlhOcW5QSm5WKzNFMXBrUS9KTHJMN2hINlBZMDQxc0hSa1JuelhpTlp0?=
 =?utf-8?B?aEVYUzQwNm1oMHdCUjdzaXJiT0dGT21NaDFKYmxZM2s2STVEVWxXSGxXZFBi?=
 =?utf-8?B?Ui82UWdnUUNLYTZybFlDRWlMU3JQMTZobVhyUzJSY1g0aXlzam5MelBBaFNx?=
 =?utf-8?B?RGl2SmpqWTJIUms5dkpPRmx3NHcrZ0ZlL2tweHR5MStYSW9MSVQ0SWtPYXRn?=
 =?utf-8?B?Yk1vU1ZTWFdPcVdQb21LTXJ3ajNNbjhPQnZBQ3pVcURWZ0pQWHdCdDRQNlYx?=
 =?utf-8?B?dWZZb2JnRjh6Witlam5IT2g5K2loRjhzRkErSnA0cCtZV1FocENtTFpjMWNC?=
 =?utf-8?B?NjhiT1kraEozQjFZWkxaYUdtQjJPb3RkRTNRRVQ2b2hRams2a0lVaGF6dDQ2?=
 =?utf-8?B?clloV1NRVFQ3ZXdMbFFHVHowWmo0clpXcUpSMDhYTnQ0ZHlCV1B0bGo4RUlG?=
 =?utf-8?B?NnFHRisrWis1R3B3NVJkU3I2YldMUDE0T2x6L095YW9VZm1IaGNKbGFsMURh?=
 =?utf-8?B?SlBEckNodk1CY1JVTkpBR3h6dVJ3c1k4ZlgxdloxcXREc0hpU2RzY1l5QURi?=
 =?utf-8?B?aUJxYlRIQStTRXdrN2t2d1lQcnRYa3JJTk1xUFlkSnYxd0UvU0x0WUFVcUJi?=
 =?utf-8?B?dDNkczBqaC9aR2JqdFBMc1ZhOEZPcmlJZHBIcjBDYnJ5ZHVXd21KeEwrNkE4?=
 =?utf-8?B?ZE1qWTRvVDRuY1Vlb0lVeG1jZWtZcHhqTTU1cUhjZTRRaFN4dzVzYVJzcERa?=
 =?utf-8?B?YlB5WUh0bGVESXR1T2ZPT0FvTFFsek95bXlqT2hvWCtYUWNpQUtKWDlOSWJN?=
 =?utf-8?B?Q0d3Z1llQ2puVVRiRnJBTzNsc3dFOS9rNUxNRUJnd0tnMmRzNjluQnhsOHkw?=
 =?utf-8?B?bXNnL2FsQVVXazhydUlhRmZzdlNJQmYySjBYcXZvaWFCTXI3cmpDYlIxZjMw?=
 =?utf-8?B?Q012K1BmNUZVYWpmOUhwKzdOMWtGTmFnT0R2TktPVjJXU0VId0xnTGp5RGVW?=
 =?utf-8?B?Q3ZqTEhiaThpcU03ZW9DMlRxV2xGZ0REUElqb0tXb0xVUjFrZ25QRkNBcWNm?=
 =?utf-8?B?dFJrV0hOQlpJM29lOU5rUkJ2R01mU2d0RHZZYTl6ekdyanFMd04vSVNLOE1l?=
 =?utf-8?Q?essIyqUQ1Eq2sw9sqIWGCPpKI?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7523bf29-dce9-4638-f41e-08db551a1c50
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6730.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 07:58:03.9271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoVJKoHl+fXuZ0nW33MhsszKOHoeDjRDGl2W6xKefwxtXGRBLKqATxlBh3VwV7wJLXJX0qQgCY81Z1br9A6vKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_005815_963709_FBC1CFAA 
X-CRM114-Status: GOOD (  15.65  )
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

CgpPbiAyMDIzLzUvMTUgMTU6MzUsIFl1IFR1IHdyb3RlOgo+IEhpIEtyenlzenRvZiwKPiAgwqDC
oMKgwqBUaGFuayB5b3UgZm9yIHlvdXIgcHJvbXB0IHJlcGx5Lgo+IAo+IE9uIDIwMjMvNS8xNSAx
NDozMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMTUvMDUvMjAyMyAwNToxNSwg
WXUgVHUgd3JvdGU6Cj4+PiBBZGQgdGhlIFM0IFBMTCBjbG9jayBjb250cm9sbGVyIGR0LWJpbmRp
bmdzIGluIHRoZSBzNCBTb0MgZmFtaWx5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5
dS50dUBhbWxvZ2ljLmNvbT4KPj4KPj4gVGhpcyBpcyBhIGZyaWVuZGx5IHJlbWluZGVyIGR1cmlu
ZyB0aGUgcmV2aWV3IHByb2Nlc3MuCj4+Cj4+IEl0IGxvb2tzIGxpa2UgeW91IHJlY2VpdmVkIGEg
dGFnIGFuZCBmb3Jnb3QgdG8gYWRkIGl0Lgo+Pgo+PiBJZiB5b3UgZG8gbm90IGtub3cgdGhlIHBy
b2Nlc3MsIGhlcmUgaXMgYSBzaG9ydCBleHBsYW5hdGlvbjoKPj4gUGxlYXNlIGFkZCBBY2tlZC1i
eS9SZXZpZXdlZC1ieS9UZXN0ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3Cj4+IHZlcnNpb25z
LiBIb3dldmVyLCB0aGVyZSdzIG5vIG5lZWQgdG8gcmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRvIGFk
ZCB0aGUKPj4gdGFncy4gVGhlIHVwc3RyZWFtIG1haW50YWluZXIgd2lsbCBkbyB0aGF0IGZvciBh
Y2tzIHJlY2VpdmVkIG9uIHRoZQo+PiB2ZXJzaW9uIHRoZXkgYXBwbHkuCj4+Cj4+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE3L3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nl
c3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNMNTQwCj4+Cj4+IElmIGEgdGFnIHdhcyBub3QgYWRk
ZWQgb24gcHVycG9zZSwgcGxlYXNlIHN0YXRlIHdoeSBhbmQgd2hhdCBjaGFuZ2VkLgo+IAo+IFll
cy4gSSBkb24ndCBrbm93IHRoZSBwcm9jZXNzLiBTbyBJIG5lZWQgdG8gYWRkIFJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyAKPiA8cm9iaEBrZXJuZWwub3JnPi4gQW5kIHJlc2VuZCBWOD8KPiAKCkkg
d291bGQgbGlrZSB0byBhc2sgeW91IGFnYWluIGJ5IHRoZSB3YXkuIEknbSBub3Qgc3VyZSBpZiBJ
IGNhbiBqdXN0IGFkZCAKdGhlIFRBRy4gQmVjYXVzZSBJIGFjdHVhbGx5IGNoYW5nZWQgdGhlIFY4
LgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzRmNzNmZGU2LWJjNjctYWMzMS0wOGQyLTNl
ODRiMDY0NmU3M0BsaW5hcm8ub3JnLwoKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBLcnp5c3p0b2YK
Pj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
