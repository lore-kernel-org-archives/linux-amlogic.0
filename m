Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7094C27C6E
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 08:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4ZN90ioYjfq02XhX4SFZk5wxAkJXQfpLwo2gSQxQNA=; b=OnzWuJ8AoGnoiBEJRckzL0X84X
	yM3h7SleF7LuWMo5HYLiUPrD4zMrIIiM1hFLBgNCgkoRWpYHtMrqBDS7Q1s87IsrjRUDmPVJfeyrO
	i7gGBCLh9YrYHITu+04gW0sHyZ0qd51j5qK98ur/ijnFl9AUffOu5p8ypRfs1oGRTjO/IZdqRyoWB
	0nX46ySkUs7Q1mFiL4vSzxXPFtBPUgSBi3aoRxZYagpZ8EUscMV9LigRMyxpGDsSRDYeiaF/2D6Lz
	A4Wl8nfUj/3/ue/UWith8zqCf1lFBvy4epK2OcZbm0YCSkRvF8udmGzIGEvIbWVbIGPwXM09lHCZk
	Pr96m9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7yf-00000009tmv-3zHG;
	Mon, 17 Jun 2024 08:44:37 +0000
Received: from mail-sgaapc01on20726.outbound.protection.outlook.com ([2a01:111:f400:feab::726] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7yc-00000009tlB-0IWD;
	Mon, 17 Jun 2024 08:44:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8KA05XkgcIIesWkIEPpIdaM04Ys6Yu5FCDz7fEj/B2Q9wLAgx5UVXDnQ7eVbfIbmrO1hRrNbMDUAkGkha9Wvt/CzCK+0zEO/CBSxXZZIHWEMmz/baWrMoKxbRL3IBoDlk7OIIIbsfq+HYy8yIDN7h5jl2j/r2veXhg6eo7zb1d1mflWNEsbH6ItjIIUNxfBALC41NnHjEYRdfwj13trpPV79Yk0EIXiV5SRTFITImrLa2wEbUl44RamXWTjrc2YW1hhaA2NrPDnt6oAov4rG+apN5CDVTSCN1UTZjq/G3lMbOtKbaOALwlZbvqjqxg4ZEEhtsbqDHR3EMaNy1kSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUCSHlrnUWsfc/Y+8jFqvqMJ+bBsg7AMSIerbX7b6Z8=;
 b=cD4LKDK7VL+4G5gJ4FuB4hP66+NANlZuYOf40dOnqkQpWii7jQbm+MNnvZT2on1YrhXez1F7GiZ0cqETGL2BMq6WlMxfEMMh503zRTYKjkDxv04CueVCKtku9rQ576WZ4kb+q9hlsGwX74D4FDW0MDhCJ3l6ejb5ihWWCO1yqq34s1H+C7MtxbraY46v2s7g0pWpPtI3sFoX8dcnIt9TRGiX46MV9qlnWaa7IqmHa/IhqRae551z4s67W6s/zRpS4B1WSIZW4cHFvIw9nPBLGojbBFoRVIiw1pEiiCII4d9ofZRRU1/xkbw91x9fo2/yT1PkzXq9OcYM+EnEC9N83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUCSHlrnUWsfc/Y+8jFqvqMJ+bBsg7AMSIerbX7b6Z8=;
 b=s7Or07utlK3MuyeUbdnFDzEW9sBOnXPXXPyohFkAHDe08fgFL/Y7L7IgVcdEtyKNYvkxgUERI6h7NlLRDjK1sbxSvLs8XYp0/F+Rhi+jnOZQO+6Yl0ML8KsB+5Ft2O1jSv/+oTw3Zjuk7FTtl5c+P6NMKOzPulZsrsnUOI8X7iWJUSZjq8qdC2QOauGOK7x136S/OFpw37UoREowL7/JWK7JLptj6mKBHCHFeaWm6zM/kBr5FvtQnS4IgwSZZSZUDP/tcPkAwm71m8zHvCnMphcqyixQ7zYDAV3Ku3KsIWkam/lMy2lXCkCUX9ThqeTwbpjjBSfGkiHqyq+EjjWeHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by SEYPR03MB8529.apcprd03.prod.outlook.com (2603:1096:101:1ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 08:44:18 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::d696:93ac:cd67:d515]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::d696:93ac:cd67:d515%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 08:44:18 +0000
Message-ID: <948ba34a-1e05-45c4-8ba7-66c72bdb6fa5@amlogic.com>
Date: Mon, 17 Jun 2024 16:44:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] pwm: meson: Add support for Amlogic S4 PWM
Content-Language: en-GB
To: Jerome Brunet <jbrunet@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kelvin.zhang@amlogic.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
 <20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
 <1jfrtgj0so.fsf@starbuckisacylon.baylibre.com>
 <tnwdnwiruoty5yd42bmkupgg6hjxib5lblhqcyouoyx5y3zvnq@2d7cnrei24m4>
 <1jbk44htqr.fsf@starbuckisacylon.baylibre.com>
From: Junyi Zhao <junyi.zhao@amlogic.com>
In-Reply-To: <1jbk44htqr.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|SEYPR03MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b45cf4a-973f-4646-4235-08dc8ea9acc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|7416011|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGoyRTBTellwZlJTUW5NMkRPOVZlaVI0MEdoUWxQY2o4TWo3U2hvRUxrUS9p?=
 =?utf-8?B?OXdTc1diRHlibGxVU1RtS2lLZnhLZkFLbk03Q0xMeGhwNlZxazZyOEwvS0Z5?=
 =?utf-8?B?V0VzVUEwUEJwaGdkSm1MaFhNTFJzOEU5RHZOcjliNE5VT2F2VG1uUXcrWDNX?=
 =?utf-8?B?UXJGN05obzBUYTFQR0lXRlNOMlFmZVBjS1g0cWtOMnBGY1B5c1grQWl0dmxH?=
 =?utf-8?B?clFsZG1IeXBpNEZvK2syUGpnSHlhQXdwT3VYYmRUK05XTHNjOWhrTTQ4WU1V?=
 =?utf-8?B?VStQdlJQZkNpTHpEeGhZdm1CbGxRZjUwTFlmckNJSXd5RnMrcXBFa0duYUFM?=
 =?utf-8?B?OURLdW9TVnJyeHVQRXc4Zk42cnBUZkNWZ1lMZzJxSHJ6cEdtMnUyaFVqVDJY?=
 =?utf-8?B?NnQ2MzE5L0lYOXY0eGdVY3l2UFVmQjBBZldsdVlyN2oxN3ZQaXNBU0xnNm9U?=
 =?utf-8?B?N1JYZUpSYTB6ZVRyM0xjay9vNzZWc1ZXZVpleXNTYUUrYk83WWp2eG02b2NS?=
 =?utf-8?B?NFJod3hhK21VUEU4RElxSUVrZXdtZklOTVhyZy9QM3ZDVWpubDVCUnE2bUFj?=
 =?utf-8?B?Vkx3cm5FNmhhN29IUkdycnhPRU5iamwzNXNsNGYyVWVxKytHUExlVnVSMytz?=
 =?utf-8?B?RGhueVlwS2QyN0VXTlp6TGpBODluZ3J0L2QyeGpjeGw4YWR1MEtacnozcHV3?=
 =?utf-8?B?T1V6UDhQcTVhMHFkdjIvVGxLQ2NZdTFyQVRlVFhSMWpGWnh4NmxGUjlWdkF6?=
 =?utf-8?B?UVNXeVZ2TEZBeXFJNXc5VXdpc3BSa2VLNjA2RmFjL3d3N0pTTkY5eVN0YzRY?=
 =?utf-8?B?TTM2cS9WRGI0ejFYU3hBcjdqMklTZXFBQWQvVVAzU1JMWlJNL0lwUFFBNVY5?=
 =?utf-8?B?ZVZ5QjlsYVFWbGVjUmc3NFM1alBNb0srNUkxYi9RT1dwRklZSmJreXA1T1FI?=
 =?utf-8?B?eVM2amlwcnUwOXVZRW5sMGtWb01EQmtWRkozb1FJZ254M0hONG81UURteGNG?=
 =?utf-8?B?a21sN0Y5VDlkUVlzbm9ZNG1abE1sdjIvZy93OXY1cWFDMXE5TGtJb0dPVzha?=
 =?utf-8?B?aXRWTm9WRTNkbUZnZDBETkw5Z0FYTmE1OVpmT0lOOWlMVS9RYXdlVG95TUdn?=
 =?utf-8?B?ZSttelJ6RVgwUHFQVTRzZFRVbWR3UDJOM2kzL1B0YVE0TVVIZ3ByTHJ5L2kz?=
 =?utf-8?B?TmxoTnlXWDJjaXBiMEZLN2h1SlM2dk5PczJZRjZzNzF1QTEvR01KL3pFZGRC?=
 =?utf-8?B?T2p6RVJkR3FiY3A0bmhuQWJacGhvNi9mV3FBbkh4ZFN1cFQ1N3Fva044RlBi?=
 =?utf-8?B?cU1IbjhDYmQ3bUV6eGdIUVN5OE91YUYwQ2JhdWFScjV0dlZDT0hNMUxVYSta?=
 =?utf-8?B?UkhhUjNmU05Ec3o1NnJ4MlpoOE1QclpBWXl6ZGw5MFlNQVBtaUsyamE4N3c3?=
 =?utf-8?B?M2pCK1pNMlNuK0VYQXpHTWR0dDdWSDErS3ozK2ZpWnI1QVJqcW5DbWlHNXF6?=
 =?utf-8?B?SVh1b3kvREJhdUxMNG00aldtYThjM1JEQ1BsOFJKQmNsL3VwVmhtbS83QlE1?=
 =?utf-8?B?bVlNV25VbDBHM0lvU2ZUcjZNUjRocXBtd0JaSHAycnFvRThFU0lUQXlQRW51?=
 =?utf-8?B?eFhSSDZZNDQzaDNZUVJWU2s2YWtWMjRWVFhVWUdmLzNtbEg4NGtaMHptdTJN?=
 =?utf-8?B?YS9kOGNEcGZxT3JtbVE3NHFiSE5YdXFhOE9qaGhLRmZEc1k1MmVOMDZNUlBS?=
 =?utf-8?Q?LWoX+gvZF/zTCf+YzdwsevNn1vfmpdHJiEjFFfd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(7416011)(376011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGg5ZFhiZDhBOE93ZFQ0Z003dXpTVDk5OUsvMFp4cVNmNk5IV3RJUlQxd0p1?=
 =?utf-8?B?S0dhbXZBRi9UZXBXWHpuVFNJc0Z6SUNsWkt3dktycG5NUnJIU0JtdC90QXY1?=
 =?utf-8?B?WGpmNHM1bmxuYktsbHphVTF0QWh1RmdYd1BjNjRwOER0YUg3azFFNW9QdTYr?=
 =?utf-8?B?cFlleUlvZGMwYlVocytnL2F6V3NlSGRLTmdCbTN4a3N0VDRXQWNZY3BlT3ZH?=
 =?utf-8?B?NjUrMWlQZWN0YmRXVmhYT2RIN0FBRE1oZjUzQ3hBK1A0Vys2d29LV2ZHVnRL?=
 =?utf-8?B?a2k0Ty9mcC9nU0tNSkFwZ09vT3BYQnFCTVVYY05FRUhweFZlSFkrRjZXSDdP?=
 =?utf-8?B?UUkzU1UvdjV4TndaaDBMSElZdlFRdU9GTCtSN1k0UjZnVFB5UzV2UWtUUURY?=
 =?utf-8?B?YWRuRXZpVVYyUldHRFFvTkNOdkhrMGNhejFjTXNWNzd3WXllaWxrVTh3U0Iz?=
 =?utf-8?B?R1BmQ0NhWnl4Z1BuS2JCTzQ1OFJCbWxJdlp6SDJjS0xDUEVQOHhKbDB1VytZ?=
 =?utf-8?B?VnFPazJtUEpQamtHdks4S2lXcWNUSE90S1VJajIvMUhieFQ0SmdqNXlPMWR1?=
 =?utf-8?B?UEduS2N1alRLbVZsMXUzK3IxNktJdHdnUkFqUU12a09xODkrYi9MU2orQmF4?=
 =?utf-8?B?YUwrSFJwSkg2dENkQmkxRmovK0M4VVVGTkhQQ3ROcDZxdm9NdjVhSStDeldp?=
 =?utf-8?B?MS82SFlPenNNZ2NNWjU3UVpBU1F2bmQ0YUZ4YUVxNWFZZjdiQVRPWUJDWnBs?=
 =?utf-8?B?RTlqMTRPOE1wSXBPYlROMDYyQkU5N1N2NHA2K1o4UDZvWDhKenhzSHgrcUtH?=
 =?utf-8?B?Rml4UjhhTlB3dWsvelVGZHZheUpCQmR0dS8wbGtBU2pFQTZrNnNiUzRvdnUy?=
 =?utf-8?B?QXhwYmtqRjhLS05pcXBERzBzNjlEQWpSQWFiWkxnUHU2QUxvNUJxaTFJdGsw?=
 =?utf-8?B?RDhUTUJMcTdRN3NiUGJxeEFlVEN4bXQ3Ym9DaUZZQlp2Y3g3R0ErU1NFYUJu?=
 =?utf-8?B?UGV4Nmx1K0d0T2YxRlNBeVdwc3FqVHMxWFBPNGYxRTZ1TEpqMCtLMW9qL2lN?=
 =?utf-8?B?a3M2cndOc1hTQlROREtEZU5haTNIVE0yaGNnY2w1NTBBblBDNHVxUURJQ3BC?=
 =?utf-8?B?aVZ3djRKaCtaMnAvUHd0bmNVd3ZWWFV6ZHl2T3hjdmJyeDVobnJER3NESmhl?=
 =?utf-8?B?T1M3RWpQZjB4RlZudU5QdlBacEM3aHd3SXZsb3kwSDdqcHNBZ2NJa1lYSUE1?=
 =?utf-8?B?UmJzK0plNndiQ0E2MVEvaGlXNDNxNERVZndlbjBHODhEY1BPb21XK3A4RFdL?=
 =?utf-8?B?ejJFUE4zV2lIeEpkOHpFR2wyODZHQStpUk9jbldVL09uUG9LL0U4b3FLSm5t?=
 =?utf-8?B?ZEN6QUpJOVlPRG42VldsZVlaTXh2SjF4dk9HSWFOUitaZUFnditsTG1QVHZx?=
 =?utf-8?B?VTJmVEJXV1BzRXNMdDNDSnN2LzAva0ZGeTZ6VXAvaW90c0dZczRuTitOcENX?=
 =?utf-8?B?azZNS3B0NHpENHlwY1lCKzl6U0dmVk8vN29FbXJFbnV5dXBoaWpKRUlYbWZN?=
 =?utf-8?B?YjBOK25mbjduSklzK1NtN0owUnhaQ3V4TjdFUUdKSHJzMWNjbFB2SVppUjUy?=
 =?utf-8?B?VXdoUnl5QWNkb1paaG1EeVhHWkt4cC84Tm1uS29PdTZxc2t3MmtHSklHUEhi?=
 =?utf-8?B?NTl4R0daMjdMTWtsTVhmaW9zQ09MaUpudkRDNVU0UFUzRE9pczFaSks1MUp6?=
 =?utf-8?B?aGpEM2tHQWk5Rm9rQXJjdkgyR016YWFGOTJzSGtVb3o5UXJKWnVVbGZwdGlF?=
 =?utf-8?B?M0ZEc1o0bHo2ZVdlVCtMSVVjL3FMbUhoRUE0akJFTTFnZytwWUhaa2tFSlFP?=
 =?utf-8?B?L1U2S0lPaFdiQlVVVDVYaWx2SFN6YnBhSktQNXBUWkh5UnhDa0NIazltWDVw?=
 =?utf-8?B?N2pqNTA4K0JnQ2JzYzFRcUZLZFJuRDFDSEMzdXEzMk5rdEp6RFpxY1ZXRGZz?=
 =?utf-8?B?RWoxVDZ2SVozQkdzcWJlM3lrNm1UcTE2RFcvUVFhVmFka2x3SWhOU09lTS9N?=
 =?utf-8?B?YzU4L2VSNkJ2RG1YcUdkUmRQa1VlOUF3d1pwMFVPT2xncVdtRTRwNXpIeGdx?=
 =?utf-8?Q?NgmhTeBc2djlWUTX67LlIPryo?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b45cf4a-973f-4646-4235-08dc8ea9acc8
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 08:44:18.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0ljgc+C/jiXaUC2rd8YsLdIV0BJxq7IgeJ204eLBVyMAPdLv/gwTYR61cWo3Sn2aNJUsrJyQnU9pp8E9EPfLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8529
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_014434_137100_E1774875 
X-CRM114-Status: GOOD (  15.61  )
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

CgpPbiAyMDI0LzYvMTQgMTU6MjQsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gT24gVGh1IDEzIEp1biAyMDI0IGF0IDIyOjQ2LCBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gCj4+IEhlbGxvLAo+Pgo+
PiBPbiBUaHUsIEp1biAxMywgMjAyNCBhdCAwNTo1NDozMVBNICswMjAwLCBKZXJvbWUgQnJ1bmV0
IHdyb3RlOgo+Pj4+ICsgIGZvciAoaSA9IDA7IGkgPCBNRVNPTl9OVU1fUFdNUzsgaSsrKSB7Cj4+
Pj4gKyAgICAgICAgICBtZXNvbi0+Y2hhbm5lbHNbaV0uY2xrID0gb2ZfY2xrX2dldChucCwgaSk7
Cj4+Pj4gKyAgICAgICAgICBpZiAoSVNfRVJSKG1lc29uLT5jaGFubmVsc1tpXS5jbGspKQo+Pj4+
ICsgICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBUUl9FUlIobWVzb24tPmNoYW5uZWxz
W2ldLmNsayksCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJG
YWlsZWQgdG8gZ2V0IGNsa1xuIik7Cj4+Pgo+Pj4gaGVyZSBpdCBpcyBvayBidXQgLi4KPj4+Cj4+
Pj4gKwo+Pj4+ICsgICAgICAgICAgcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwg
bWVzb25fcHdtX3M0X3B1dF9jbGssCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbWVzb24tPmNoYW5uZWxzW2ldLmNsayk7Cj4+Pj4gKyAgICAgICAgICBpZiAo
cmV0KQo+Pj4+ICsgICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJl
dCwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0
byBhZGQgY2xrX3B1dCBhY3Rpb25cbiIpOwo+Pj4KPj4+IC4uLiBoZXJlLCBkZXZtX2FkZF9hY3Rp
b25fb3JfcmVzZXQgY2Fubm90IGRlZmVyLCBzbyBkZXZfZXJyX3Byb2JlIGlzIG5vdCB1c2VmdWwu
Cj4+PiBkZXZfZXJyKCkgaWYgeW91IG11c3QgcHJpbnQgc29tZXRoaW5nLiBKdXN0ICJyZXR1cm4g
cmV0OyIgd291bGQgYmUgZmluZQo+Pj4gYnkgbWUKPj4KPj4gSSBkb24ndCBhZ3JlZS4gZGV2X2Vy
cl9wcm9iZSgpIGhhcyBzZXZlcmFsIHB1cnBvc2VzLiBPbmx5IG9uZSBvZiB0aGVtIGlzCj4+IGhh
bmRsaW5nIC1FUFJPQkVfREVGRVIuIFNlZSBhbHNvIGNvbW1pdAo+PiA1MzI4ODhhNTk1MDVkYTJh
M2ZiYjRhYmFjNmFkYWQzODFjZWRiMzc0Lgo+IAo+IEkgd2FzIHN0dWNrIG9uIHRoZSAtRVBST0JF
X0RFRkVSIHVzYWdlLiBUaGFua3MgZm9yIHRoZSBoZWFkcyB1cAo+IAo+Pgo+PiBTbyB5ZXMsIHBs
ZWFzZSB1c2UgZGV2X2Vycl9wcm9iZSgpIGFsc28gdG8gaGFuZGxlCj4+IGRldm1fYWRkX2FjdGlv
bl9vcl9yZXNldCgpLgo+IAo+IE15IHBvaW50IGhlcmUgaXMgYWxzbyB0aGF0IGRldm1fYWRkX2Fj
dGlvbl9vcl9yZXNldCgpIGNhbiBvbmx5IGZhaWwgb24KPiBtZW1vcnkgYWxsb2NhdGlvbiwgbGlr
ZSAoZGV2bV8pa3phbGxvYy4gTG9va2luZyBhcm91bmQgdGhlIGtlcm5lbCwgd2UKPiB0ZW5kIHRv
IG5vdCBhZGQgbWVzc2FnZXMgZm9yIHRoYXQgYW5kIGp1c3QgcmV0dXJuIHRoZSBlcnJvciBjb2Rl
LAo+IHByZXN1bWFibHkgYmVjYXVzZSB0aG9zZSBzYW1lICdvdXQgb2YgbWVtb3J5JyBtZXNzYWdl
cyB3b3VsZCBwcm9saWZlcmF0ZQo+IGV2ZXJ5d2hlcmUuCj4gCj4+Cj4+IEJlc3QgcmVnYXJkcwo+
PiBVd2UKPiAKPiAtLQo+IEplcm9tZQoKSGkgVXdlLCBJIGRpZG50IGdldCB0aGUgY2xlYXIgcG9p
bnQuClNvLCBpZiB3ZSBuZWVkICJyZXR1cm4gcmV0IiBkaXJlY3RseT8gb3Iga2VlcCAiZGV2X2Vy
cl9wcm9iZSgpIiB0byBwcmludD8KCi0tCkJlc3QgcmVnYXJkcwpKdW55aQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
