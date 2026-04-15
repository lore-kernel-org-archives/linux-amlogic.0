Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C95F41992
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnTrUx2aZiP5cfuemGaPbsP6PWJDftuDkdfW0Scleq4=; b=scShpVCBf8+UX3au0fKEy5tC+P
	w0rLd+YnQxK38w8Hu9FBMLuF0lPn3A7BzNYhMspGj/nBae+qYXEGtuj53sKG61efJvqQ0DqrW1xww
	USbJ5u97ryiPnrjTIWWPB9Tz3NyVLs/szvyVzLczB6JCAUu04zllzoSB78B7uJEuXGFaGIuvu85aR
	XxRxGNZSyzQcGEqa59kgduPIGIZc4Sw8TR/mgDA0qsY8l7hDF8AlWw5iC30HP1a5p8nDtV1iapJ61
	UbIroIg4AKWHkyuWdcJhMYfr2kYUahQRYmFYTydR8V1EncypLRvXEZqrFgO/q3Qerw+P1t6QhdCgH
	bssMZ9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCybp-000000013Rt-0Sn5;
	Wed, 15 Apr 2026 11:40:41 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCybn-000000013RT-0lN6
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Apr 2026 11:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnKJsXwuADyuXfCmJw4C38iYqL8ixU3DenRZ8y8OPfgaRh8MHdSEXkjnk2am5vdaUbpnnOREK4X7thhdODdMhNOt9QEwVCQlyz4PiwB/L51eG/LwWDPCdflruWnxLZgdb078FafKtbsxizOznZULzJmXK4J2YjgW8AVAw8YgkMLI723BtjNqiM9qEYG7DxOcrapovalRss6EAYx7oy0rnF/0LHOAKo4iCuG6EHjTUDsJSCPW4RZ5Bbh3YBTEKI02nrSS0BK6dHMXtRU+6B/rhzLnsdq4jQ81jwUoYZMwsd0qIhn/czh+DeohdAs0YLlUjJ7cpSbMe5WQMkQwmzy4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDUifxSMMAtVElIaZBIlMCpL497OktTuF+xgv+R8ce0=;
 b=YNwM86ZRFgW6MG/WnELjcNYd28Ch8jlGrwzFct/VHX4jWwAjPIZp+osbWhG+2VGm3uIZDbFHY8aNgeB/8r/cu8zGqaZ78heif4kyUwvu89fujOO+R5klZLYd4Ep6b8kJIBlWWALns98c8O3++yQJy5ObZmxr0jC9eIHw5TQtVKRUGHV4mTUeoqUvmrJ2cs6e2jpaenN7OzGyvXejZZ0ySauyTXDUUuTy3Ic3h+q5w6zfGNUTzd5tADDR0Rin/smzrDpwMVGIJKgqZFCHn50U67PlGJV5QVl9ZAXLtV9RGoQ9BG7hr2nX+yHL7YywfxgfWrJKMXC1613dYCDlH4aFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDUifxSMMAtVElIaZBIlMCpL497OktTuF+xgv+R8ce0=;
 b=aOXUMcdlNwFG91FuFhR4+Al9LtUjXijS1eIaJilMigjit7L8eoWDb6tf7LDtlwoH6iq+fRAMwdbFbqH1P/sr8Sl7S3dOaNTc0C6aVdp2Pb4xu/mBRCLuaUTkOZ6OOoLGSTEin7HzHta8ylaXUqvtoqFPFIYrR2xeHSMo722hM4saBXBxD0UasCPgm8db1kRLWuHt9yy/2fSp9NjBtWk+yBHzcHXtuC17TCOHpFb9EXutGzeqHbtQPN0Psp969KK8vgsXKixV0oQmR9JKb+WLeUubQt0YzJv456vp9s7svzgXHRJDeUTMnkFQgtzhTAepzEiN3JshtVp8AebgIuwiAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SI2PR03MB6437.apcprd03.prod.outlook.com (2603:1096:4:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 11:40:24 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 11:40:23 +0000
Message-ID: <366ea762-b228-4d6e-872d-2a7f9dc8b1d9@amlogic.com>
Date: Wed, 15 Apr 2026 19:40:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] clk: amlogic: Add basic clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
 <20260209-a9_clock_driver-v1-4-a9198dc03d2a@amlogic.com>
 <89cc0724-32a8-4da5-8070-c128cafcfc82@kernel.org>
 <76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com>
 <b97c2e64-8a43-498b-a447-6a5b67c525e5@kernel.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <b97c2e64-8a43-498b-a447-6a5b67c525e5@kernel.org>
X-ClientProxiedBy: TP0P295CA0015.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::13) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SI2PR03MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 882dca0c-ecd5-47c3-5a30-08de9ae3c7d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: +XRxZj54jIamq3+v7cHYHASU968Xuidu+mZaPUbl125mLbAaPReogHuA8mF4GgGjzQ1UJKI9oDFVFo6QzH92B+lFYjhQzcNayOy1YHY+uapnKTKozpPLCQghOLUoKKEBstWmf8y/2eKVBIhxsmCk0neJ/NCcwSz8OGqAOhCwhtkopgsfcN2hcfsk25cgivDFIEi7x0wcGm4qyx7RfUagC+KO9Zwt3Oo0W8T1fUdJmM1+UAq7y9F9az1tXVKv77tTZY18Jj6KkotQZiY+GDDIK1TAbAeTbRwF5dB558qZK9T0T7TxmNuAbofIa5VQ4XHYr1LStt0SFx4LnP77w+QkbPG4yTr4CxfWDQYLvOmLHTVkStcvv2+bSvDW5/fkB1qWLXekDxgWXpZ99vxWnj7ihpZ8LRX1fhKmX7v3TwBaKE8HjlWEDpID+uw14wRgVmz3220TD+OH9h5Rnha+EztTb5fCsOmeY2j3Cg0WQEqWhyAf8/0DBht0snEG61XNZebrK8iwsFCnD4uKP/N9gQ/m+2JgGHeYjAyY7B8LdcPYoibYSBW7M49v3dR3oVxqSjjsCrNIzSaTl2IfM0VMQInacNLhnggdjduWRzaR1ieEbOTwm+vhxeDSw+pSN2XrfEns6A9DnksZMGO7Y3296Wb5lbBdx/YbX/zZdj/4cg+4B4BNuFQR28q+moZ3nWKpd945rH4mNGiqJtmVCFciF00nmq+2hikB34hwjSMj/XGykYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjdNbWhCakVrZUpEd2xtalgyb1RNR0lEMjF0Q0laTnh1YkhVMnlWbjBaU3RT?=
 =?utf-8?B?dlBKcDZ0QmxDaDNkYTRRMW1YNysvVTJCaU1qcjY4UFljcGN1UnpLNHZTVE9Z?=
 =?utf-8?B?MFEyR204UG5XejgxeHB4TGczV3JwaTdPc1FLL3RSWjRvaTBNdmpyRkZCTytK?=
 =?utf-8?B?bWlxaG1obG5nZVdnMzZ4Q2pWUDEzazdITzdBUTBYeFNQTExCUmlkMmtvNFpB?=
 =?utf-8?B?dGxNazVRTjE0R2JpbXkvQWZoYllPQWNqd3dCeHFNMlUzMnRrWE1wd0tuSnk0?=
 =?utf-8?B?R2ZIQ2Y2Tm1kSDhVdDNJUFFqWWh1Y2ExYi96VHRNK1U5ZWVPMTBDWGNPU2dk?=
 =?utf-8?B?OXRvbnVkTTl4NkQ4S1Y2UlNEY2xyOUtzQVpXWWtDcnpldDZXUzVVbzViTCtG?=
 =?utf-8?B?VktLQWcyT2ltMWh5cU5mdW5Objc3RjI0SlZQR2NjV0YvZ1JDZ2JGeVluM2gr?=
 =?utf-8?B?dnhrakIzUnJBT21TM21IMm1YSXhBdGFobUhKcjVqNUMyZHc0cHB2THlRcXk3?=
 =?utf-8?B?bncwMUVmZmo5T3k4VzAxdXVvblFLT211SWVjUWRrN1p3VXl0aVJ4cURvbnhR?=
 =?utf-8?B?ako0MEFLaXdudW5lNmh6dURLcUlRVy9DeGZQUElSY0o0U01TWkkyZjRqQmJ4?=
 =?utf-8?B?OFdwRGl1cE4rZHdPTHFsUXBtMXM2dXpqeVNXNGRkL3RZTXhIVkxxUXlRdEZI?=
 =?utf-8?B?TTVRaS9YMlFpUjVPYVl2U2R4NnBIR0QwYnJseVZpenI5SUJSby90Y0dCZnEx?=
 =?utf-8?B?MXJucVlqMTZJendvMDZsWktXcU8veDBEUFJOb25FU2gyRlZWK25ZRTEvdGs3?=
 =?utf-8?B?aHRRRm94eUZOcWk3U2xJWCtZWEVsTFlIT1JtSGZQMjlsL0hxWUNLdENDYnVr?=
 =?utf-8?B?QndIeStnOFlnR2FzK3ByZENHa3BSMDZrZU83MXBENW4xRjZDNERUTlFvUHdq?=
 =?utf-8?B?VlU2L2pOY3ZxR3Q2WGJlalVyRkhJVFpZSkY2TnR6eExEV2R5czcvV2xqMmJH?=
 =?utf-8?B?b1g4MVBaN0hwdk9mTGhtWUVUZ2p0M3JiNHkxbnUyQ2MwbUh1aEROb3N5WVZM?=
 =?utf-8?B?OHo0cTh6c0JuY212UW83TzNReVQ5ZllNc0k5OXZpSU45MjdWZ2cwSEdyYXNG?=
 =?utf-8?B?N054ZW1jTkxENU1xUjRzeXZBaUIva0FDL3B5bXZLVXl4S3hleko2cWs0cnV2?=
 =?utf-8?B?dGZqZVRncjNLRjl0R2hPWWNOOHJXcksxL3BKbWlKT25sQ2NTNGY0S1JtRVYz?=
 =?utf-8?B?bjRxVERGN2VjSkdFWGJYb1FZUzFuUXBURjlXakZRb0huOStuZERUaXNTZGx1?=
 =?utf-8?B?UXpOTTJ6Mlo4djNob0UzZVBicy9JbTRsN3I4NElab2lqTXQ1cHdtS0ozMEZ2?=
 =?utf-8?B?M3JaK0ZmV2ZkOHhiUzlKWG9YSDkwNGFkcjRvd0pYK0JRcE5qek9pc0ZOUVJw?=
 =?utf-8?B?MzNDTVJydndmMjNDZjRPd2NDTjlGMUxyby9WSmVJbjc3dk9vSDhoOGxST0J4?=
 =?utf-8?B?OGJXVm8yNUhHMEcwMmFRRnlKbXB4d3FGWm1IK0NaRTE4UUcrMU5uVWcyc21C?=
 =?utf-8?B?V2FoQlIzc3lLbTlndkJrMHNFdUVFbHN6UmRhTkt0S2xjVENTUEJ0L0VSckVY?=
 =?utf-8?B?aWRJdEUxM3h4RDdVWWxzbjFibU83a3g5Zlp4VjJINmkyb2xrdTh3eVN2WXZD?=
 =?utf-8?B?QXZsRENBTEtoNGhvS2w5SFIxVXlrT0Zicmx1Q3NMTEozcUdxdHArNUdQeGtL?=
 =?utf-8?B?QS9DVEZrdjJwRmhrZXpvNStKQXZGZmVpeFMrd1J1YmVGdzZ1L0UzZUd6b2xa?=
 =?utf-8?B?dkxnTlhCQ1NqZFJsTXRPMit0M0RNSEZBOVJjU1RwdzcwaGZ5MlBMMER2ZjlI?=
 =?utf-8?B?eWhmQjI2SW1SUC9VUmhVa24wb21JckFuZWc4VWtjOGpYZGxXdVpaL0NaTE04?=
 =?utf-8?B?enM2WkZnQ1haaE4zY3FESmpYN0p0UmVaZ3FYT3VzQ3BYQUsrQmRtQmVvcThU?=
 =?utf-8?B?K244RXZSc1lHNDl0N3F6bDNKaU9nZE9TTERZNjBPVG1PRVUvZE9Ybkk3RGZW?=
 =?utf-8?B?QUg4bWwzM0NTNzNGSUlDQmpvVFlTeUR5K0Q3THVjaUVkaE1rajBYdWdhNHo1?=
 =?utf-8?B?UzhtOXVOK2lLalBzNnMwWEJoeWkxQnQzNVVtWnIwSnFCK1RsOVhnNFJrdWxG?=
 =?utf-8?B?dy9TY3dZcnNSYVIzMUdFM0V2R1BDQnNQcmhZNURrU3B0enFPMUkxUlRmcmZr?=
 =?utf-8?B?Q21BL21LQytvQ2ZzUlA4enFobnZuUy9lbHZoU0plcEtwZGdpOUpxTDRTN01p?=
 =?utf-8?B?bm1LQ1NnV2UvNXdvMnQzUVIxU2JEL2RmelA0NGFybzcwL3FoSi9ldz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882dca0c-ecd5-47c3-5a30-08de9ae3c7d9
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:40:23.8404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reUmgcUKJdtYOtOhyhOoiccF4iiV+k5CGytC66qNaVoWqMfb6buKRA9FxBcpA9/a6roaCh9sL+RcZTrlL1C+lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_044039_253928_935AC437 
X-CRM114-Status: GOOD (  17.94  )
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


On 4/9/2026 2:12 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 08/04/2026 16:32, Chuan Liu wrote:
>> Hi Krzysztof (& ALL),
>> Thanks for review.
>>
>> On 2/9/2026 9:17 PM, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 09/02/2026 06:48, Chuan Liu via B4 Relay wrote:
>>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>>
>>>> Implement core clock driver for Amlogic SoC platforms, supporting
>>>
>>> So how did all existing Amlogic SoC platforms work so far without basic
>>> clock driver? Really, how?
>>>
>>> You are suppose to grow existing code, not add your completely new
>>> "basic" driver just because you have it that way in downstream.
>>>
>>
>> Firstly, apologies for the delayed response. I had intended to
>> consolidate the V1 review feedback and come back with a clearer plan for
>> V2 changes. In the meantime, Martin has provided many detailed and
>> valuable suggestions - much appreciated.
>>
>> The original goal of optimizing the HW based on A9 and introducing a new
>> clock driver is to reduce unnecessary complexity in the driver. On A9,
> 
> Nah, you just don't care about upstream and it is easier for you to
> duplicate new code.

Regarding the "duplicate new code": the ops implemented in clk-basic.c 
are indeed based on the CCF components (clk-mux, clk-divider, clk-gate), 
with the following enhancements:
   - Register access via regmap (meson clock driver looks like this)
   - Additional debug nodes to support Amlogic clock automated test 
tools (in conjunction with clk-measure to verify hardware functionality 
of each clock)
   - Clock context save/restore support for STD/STR

Other drivers mainly focus on adapting to A9-specific hardware 
optimizations, as well as improving and refactoring the existing meson 
drivers.

> 
>> we optimized the Clock/PLL controller HW to simplify driver performance,
>> complexity, memory footprint, and reusability. Improvements on the HW
>> side can also help drive corresponding enhancements in the driver:
>>      - Performance: Encapsulates sub-clock functions, reducing call paths
>>      - Complexity: Standardized register bits eliminate a large number of
>> bit definitions (~1/3 of original code is defined register bit [1])
>>      - Memory: Object-oriented design avoids copy/paste for repeated clocks
> 
> Object oriented design? Sorry, what?

In the new driver, clocks are modeled as the SoC CCU itself. For 
example, pwm_a/b/c... and emmc_a/b/c use the same CCU, represented as a 
"composite-ccu". We instantiate the CCU once, rather than redefining 
clocks for each module.

> 
>>      - Reusability: Same controller works across SoCs without driver
>> changes (or with minimal changes)
>>
>> The old meson driver required compromises to unify legacy controller
>> characteristics and driver styles. On A9, we want a fresh start.
> 
> And maintainers don't want that. We expressed this many times already.
> Not only in this thread - that's one of the most known feedbacks.

Thanks for the clarification.

> 
> Best regards,
> Krzysztof

-- 
Best regards,
Chuan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
