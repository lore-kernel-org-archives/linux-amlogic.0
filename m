Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AB2CAC5BC
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Sep 2025 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91S1N9XywQ6VfuHDNWpUsFHR80Pn+9H1rg0mGzX36Ag=; b=mDVg+db1URfzIsh6oiQ/MB44FD
	nCkFpjuUitYY6DnjOsz8PtAujmlJHVt0ijP22WRcLhx8gV+0Ku9+NPkVsI60hiGUwLh1fmtHUvERC
	7TM3ArPUAInwN32QBzafVNdF8rejcZK4q8NSYPgGe4C+7y6gkFpHKsRgRr9RA67b9WTDUWStKl5U4
	IIkjAIjeUXa3X9loHgk9zlDDRIBcJxvHBJGsjc72oRELPUxIP758YORRkrRRkoqHers5XeeDCk9Du
	wOY0ij5JbF9eLB2T9WvUb7Tsa5PAbc1hpU2gkvYb+bHHn4dWb1CcOGTP50/Ni7D0I+FEi2ofiD7K/
	0cWtGHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2l6F-0000000E0jH-0riu;
	Sun, 28 Sep 2025 06:41:35 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2l6D-0000000E0io-1QzO;
	Sun, 28 Sep 2025 06:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXwtZh05s9afX27Z9S6J9C7AQRxKxNgQiWKdHZpPi5l0ENwZsL2weqBNIrxYPS3VE6JohSSr49qnynqFvormk3PvJn4ppLJLJCFGGgm5/M7Lyp9lUN3V4cuiVuuWsidf/oc2J8NWE7ed+kZK0Fa+5KjBW3aq/ryf8thOgWJNkl2UUn+QTZFebjP3u8azigApRF2XePvuvyEYLUKVxGvhjV4pXghwNGs+bx1WevhCNqEOxiwp0FDrP2FW3G1ZB0KZh3TaCVt6DSrsM3YXHK1/FpzsOsFQPsbXgr0DZGgt5aM3VSPmOOhpZCUtpjAs1drK1DhKn0OR8Y3/xpVZj5vtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBf4HMpCfkhlWPW13vqIyVW818GwvAjfWE2LtaewXTo=;
 b=KBv/Bh3OO6YSbZM2B/HnJJpQSJnhQQQBSAFcpHAvwSPsEZGcEz20zG6/WYPwHYtc5lVtIKaVTk7iQypx83EqYyvLVSpY9ChOxixocgAeyDLcvuPuR3U6Hn71koT+LA9O5BZjZ6jBZXqMuD4lKWyVhqlpJn0vG1Lnmf9qFxOfGxMoMwatbxcpdbuSHvNELHh/O1TdlDNaWppEtvSKy+yV2pNi/i+qqgriCmrkY2rMmil8daoM4Dc9vGSAjiTc70joTInz/Wq7Ef3nRgiqUuQ8i2zsfxf6SjjNc2WCOStL6mWGnbIowUqR+eI1OK902X4NShxruuotXGRV3Qz4zftTJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBf4HMpCfkhlWPW13vqIyVW818GwvAjfWE2LtaewXTo=;
 b=oJ+IvJLUhMyMXgqXbV2xGGmnk/DZmeyxuxmV1HT6qouyNZ7Z8XbJs9RFaGrmQyTXsbWbwA7HwjTrlLRABvfFFI72EM1tBWVA8WNbSts0HNMGWbpgrK2qpbXi9QUJd4CCGCZZ7ZeL09nEuNfJK0+K8s0MbmGcWV6t0pm/bDnKz0FJPY8CUDEQzrs+GTfdgAnN7/0Y3k8dXwh9jvgpG4kWEXDl0utyVEQ96bY1ITxbqhtzZFArQ7YQMBCzzasP94vURdIaM8OJMSXc9yr7Zxh3pPMwxg15gNEicR7nsJJw7KH5yDOEouihZAemEMUOq3POg0TDlTvArPVv/TtnDLjyTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB7775.apcprd03.prod.outlook.com (2603:1096:101:126::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 06:41:21 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9160.013; Sun, 28 Sep 2025
 06:41:21 +0000
Message-ID: <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
Date: Sun, 28 Sep 2025 14:40:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
From: Chuan Liu <chuan.liu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
 <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
 <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
 <20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
 <1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
 <e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
In-Reply-To: <e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: e0062479-6def-49a9-5f56-08ddfe5a096f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVpiT3lxMnBxTnhoRWFRam5oTVorWUlNZzhDWk5LZWV0aXBYMWplLyt2c2Y4?=
 =?utf-8?B?cGhSb0wvL2Joa3crWFJkQVpSWWdGRXNaOUNQL1NwL1NkVXB6cHVSaFhNODNX?=
 =?utf-8?B?b3AvajRTR2tqUTBrc211SDlpZEU1WXJxWEVTM0FDWjVHOE1EU0p3VWVmeGtH?=
 =?utf-8?B?NkhHQ0tJdWVJZm1lMlgxR1dOcmJBeFBNQTdjWnVIdk8wV2wxSkdkRHUrNTNB?=
 =?utf-8?B?YkwzOUdtV05ubjNHNlkybU5BZ0pQdlpSZGNrcG1UTjFnb2ZhdGQxbllrRG5m?=
 =?utf-8?B?Qk9ZY2RsMkNxQzA0S09semR1SGl0TUUvU0JINmlxS0VyaHRwYjdyQXRRZllj?=
 =?utf-8?B?UklSdy9GcFNWcXVFdHlTVzhnY0NUZzh0b01tVWVKNkZDQjA4L2drOFppWmY0?=
 =?utf-8?B?cGY5N1ZFUVFYNEVNUUpxTk5UK0REbVlySnAzY3oxejJ1dG5PTnluWVJkbzhj?=
 =?utf-8?B?alhwbTExaTNzVVk4T3h6MmVxbkprWEEyTjd1NnBKNzlRMzh4NEw5QjA4V0hW?=
 =?utf-8?B?NU91OHpIaVNRTHBXYmRGR0xjcHo5MkhITmZzUlBtalNpTTBVQzZuVGxGTERX?=
 =?utf-8?B?QmpnZ1pVQUlGRHRISEZ2NXFLc09sd2l0NmZreTlBNFFmeDlPcFFQWTE4TGRY?=
 =?utf-8?B?WU5uQ0FUK2F3MjhkMGMxZlZxdTh4dXRzM0E4U2JQWXhUSG41L3kxU01PUEo1?=
 =?utf-8?B?R0NldVJOcXNLVjFTcU9laVZhVksyd2dJK1dKcngrdjhOVVA4TG1wSGN3N0lx?=
 =?utf-8?B?Q0VMWHJBZ1FnelpUczlOeFE1TDZnKzY2MmcwekFNdHV4SHZhM2l2UnlwRnJu?=
 =?utf-8?B?WlU5K2N4TWZQdmtjWlVzWVRtcDcrem95bDdCTjF3QkxmWVVFSmc5SDVtOXUr?=
 =?utf-8?B?Rit6U1J2SWxLQXdham9tM3hpQk1ad1ZOb3BYTjI2TklHQkRMa0EzdWNicloz?=
 =?utf-8?B?OWNYUTMrNDVFbjRxV1NkUkdsWEpuWlJCWmtKMVJLdG5IYTk2czJVNmQwUFNJ?=
 =?utf-8?B?WWpLUVgwYUtMdS9DajBqVHN4YS8zS3VCTk0rcVdzTTlJVjUxNmdCYnJwNGJo?=
 =?utf-8?B?OTlKMUtmc1pJM2M0Wk9wU2ZnM3E4eHhJOVEzTXVvcXV6ZUtjMHB0QXZMNlU2?=
 =?utf-8?B?bUgzZHoxRXhCWkpIU3RJclRyVFpISGhiek11Z1FROXBHdTFSNlIyNzZIeGpG?=
 =?utf-8?B?L3ZOd3JndERsU01wMU5KdVl0elBraGp6Ni9xZDAyRmdPQVIwbFFndUptTjhu?=
 =?utf-8?B?VGVObWpoZVBpRXBvZWNaNWxMQnVseU90LzIwUi9BZlpYUHJSZ1czMm1ERWI5?=
 =?utf-8?B?UTBiR2JiQTNSV21udDJOZ2RVR3REbmFpQTRGTG1MTW80WXk1MVJ2aUgxSnhM?=
 =?utf-8?B?bDhGYTRHeWpCeG9rVE9QVnYrV2FSQ2ljZFlXQ3h0cHBqUlZ1RERkaG1qdFFR?=
 =?utf-8?B?bk00VjRhU0N2YVhJZ3Z3aHNlNXA1VzRpSjU4eDZ2RjZ0YXpXeHNtbFhUSzMv?=
 =?utf-8?B?aFlHbHJod1o1bjAyNzVsL2F6MHRiUEdncGNabUFKcEkzeWxGSmo3WE5YaVFX?=
 =?utf-8?B?YUhReHhqSWZkN0lQcElCZGREYkVNOFIreWlobHhJNVJpUHFNTlh3bXROdVdV?=
 =?utf-8?B?bHZYMGwyV2tBVEttYVhCWEdhYkhVakErUTl5UFFiMmlKTDJ2MXVUMmhaM3Ba?=
 =?utf-8?B?bWNxYVRtZ0NaakFZWTUydWY0c1ZNaUZCWkx4b0hmVldKcWZMUXVBWThjYTIv?=
 =?utf-8?B?b2xCRUQxT05FdGVQdWtlNDFsaGRKb1krK2NKQkhHdkpGbWZHSXlzWlRxZEZ2?=
 =?utf-8?B?LzZpbjZHNWNyQ3M4OEMzcy93MXlNejdtN3BvWlpiMCs0Vnh6d1ZpZFIzYnRI?=
 =?utf-8?B?cHNZS095MFgzTTJqVkE3YWdqb2l6aTZUN3JOWjNIVDZVRlpMOGIrMVdmVStm?=
 =?utf-8?Q?IyElpppnR++F7yjRZNj+QEshr33+k/6f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlRoY01Mc3lLRDdXNzRPQ2NSMkdUaitmdFpIRzdvTXVvaWFhVzJsZlU3STQ2?=
 =?utf-8?B?M0p4c3lQeHpzNXZ2ZnNEb2E1b0ZKbWV5cWZmVjdLbTFNeFVLM2RDNFJGNWxF?=
 =?utf-8?B?MmQxNXllQlg1RDhCS3o0VHRlMVUrbGdKUkY3Q0U5MW5qVmpxYW5Zd2tQcmpz?=
 =?utf-8?B?Wkt5QlhxQUF5MzZBOFFWYlpIRlFuYXpoeVIrNDIzWWNvZXJMWTBYVmxvY2Zw?=
 =?utf-8?B?a0V2NmZMckw4aUVOclJaVmpEWGZ2SFBkWHU0ejVuUEJQNGVDYmZxV29xWHZM?=
 =?utf-8?B?QmI4N0k3dnRORlFvS29JRlIwdURYR1Jsdk14WUVwQk9jbmtOZHBrcW81N0Y2?=
 =?utf-8?B?K1pYKzRkMmk1OFJGZXFiOUcrZDgyajRhb0hFbzdvcy8zbEQ4REc2bzFuQzQ3?=
 =?utf-8?B?UDUyQkZ5bUw1MkkvNTlubXZVemF3VzdHQXB0YjVZQ25SSE0yNDJsNjYzd2pQ?=
 =?utf-8?B?cDlaUEFBNWxNeFJKait6QXhwT0hLY2FEOEpWNGYyTWRXRjM5eWV2ZnYvbGRO?=
 =?utf-8?B?U0RZM3ErNG51NGtSNWF5NjFvOFJESVNsVmQ2cjVtQWR3S1ovU21qZzkvTUc0?=
 =?utf-8?B?UVFvcUlZclVwYWpUekJWL2ZLU1VEZFcxL3BUUm1Jd3ZZb3dwM2x1a3B3aFJ6?=
 =?utf-8?B?TUp6UmtUa1AwN3EzOUUrRlRhMnN3NmU0VTRxTCtKcnk1ZmtiVXF6NnBLMkVR?=
 =?utf-8?B?djJ5NVVMeHROcTVHdGZYdjA0cERjKzBoQm45Ykp0NWhKNm1kVU9BOXVEbjRB?=
 =?utf-8?B?aEN2Z3hYL0hacWxhZmFDdjlKcHdiUUNHSndxaHFRZldrSmV2YlJ2eU1GdUFw?=
 =?utf-8?B?MnVXc1ZYUk05M1pXeFcvRXlsQStJNG12U09YMlkvNGRIa1Zpd3M2T0lzS080?=
 =?utf-8?B?STRMMmhONHhLRTNKbGQ4ajdiWjVmWlM1YThLc3grTmRUQk9aYU5oNDdGMFoz?=
 =?utf-8?B?TWdlVG4wMXV6OEttTlVxQStsV05ab0JoTmlvWlQwbE03M05WbFJ3QlRublFL?=
 =?utf-8?B?QVdLVFM0dUJVY2tGZ2F5M0FBNWdMMmtRVUFFdi9CVTZLSjdYalpXWUdiNyt1?=
 =?utf-8?B?L3FuMXdBbXJmNVdlRHhMTHN0cGNZSnZPZnJuM0YrdkxuWVRqUExvTG5oaWpq?=
 =?utf-8?B?d2lhWnhWYzVrQW5BdlZxRTBUdjdrYTJLeXFrWWhMMVptckpjWDVGcmw0ZjJv?=
 =?utf-8?B?MlZUcGE2Z1pnQnZJU3QzQktFeThUcmpFaDNBZFNMbUZKa25FSVNMeGhsRStK?=
 =?utf-8?B?K3V3NjB1M1JqN0RiYWdXaUxOc2dyVWJLdDVMaGxnMjRZakplUThhMVlwRytt?=
 =?utf-8?B?d1V3eXZkbUVrRUtXU2IzaUcyd1JOSEEwQ1FxMEg5blVrMVlFd3Q3NHZRTWNh?=
 =?utf-8?B?czdaRFdxQXdTZTMvcmtWVEpTVVV0V1ZGdk9zWDlNWktwV1M3alJxaUM3T3NE?=
 =?utf-8?B?TlBGek90VWZwM3NtV0dmVnI0aXRyN1JDZWRRZXBGYnIyZXpzdk5BRCtRd0dv?=
 =?utf-8?B?OVBFQWZqZ3RxN2ZSU1E3eXpjRUE5Z1FKM1pyNGNBT3NISGFXZGE0b0JPZmNw?=
 =?utf-8?B?aUQ5UFRCbmdVTWNHRzFYZm4rck5pR3pvekJQZjNWc1NnaWFjZjZiSGxDL3kz?=
 =?utf-8?B?dHR0SDFCMWEvVTU2Z3lrb05VWkI4WU4yVk5aREpYMkZaS1haaDZqeFI3b0hP?=
 =?utf-8?B?SUtxTWN1THZidjZ3OXBUZm5mTUFsSEIrTm5XZDhkM1QvQllzNys0bTdyV1pM?=
 =?utf-8?B?RzBpZWJvNzNYbEdJSmpMYk56Vm1IY29oaEtOSHJ4K1BFVVFtMjY5anFhZWpx?=
 =?utf-8?B?RGk5ZlAzK2FpbmY4ZDZuMnZkc0VPKzdUU2RjZTNCRjB1VDVJNGw2VWtad0RT?=
 =?utf-8?B?UldJNHRqbGZnSjNKZld1YStSd2FxWVVOV0pDSFptdDdTWXZpbU05NWdsQnFz?=
 =?utf-8?B?a0xlSUNHMXh0ZkVrcHR5VXdIUVRKWXBXSWZ5dlNzS2h3YkcyblhZN0w5SFBP?=
 =?utf-8?B?Z3lJT05Pd0o1K0g5MGUvVXVnUFRKWXFRUUxadGU1T1VWWTFvdXNROFZ1V3pl?=
 =?utf-8?B?Rkg1aUxMWXJmNWh2QzdxZjF4VC83SGRXakxyUTlhTXJvWnBweWJCQ2JYaFYx?=
 =?utf-8?Q?Qn591aPIL6sG34JEhQBHzW0zb?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0062479-6def-49a9-5f56-08ddfe5a096f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 06:41:21.6352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOeYIf1xJhFVzQMuIJogaZhUmuymK2vmB1pmDZSCnCUsjAMS56WFc2+c/mLUpIm/xAo2Kbl1vLCwFB8XZR6tNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7775
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_234133_513165_CB5A1F91 
X-CRM114-Status: GOOD (  24.21  )
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

Ck9uIDkvMjgvMjAyNSAyOjA1IFBNLCBDaHVhbiBMaXUgd3JvdGU6Cj4gSGkgSmVyb21lICYgTWFy
dGluOgo+Cj4gU29ycnkgZm9yIHRoZSBpbXByZWNpc2UgZGVzY3JpcHRpb24gb2YgdGhlIGdsaXRj
aC1mcmVlIG11eCBlYXJsaWVyLgo+Cj4gUmVjZW50bHksIHdoaWxlIHRyb3VibGVzaG9vdGluZyBh
IENQVSBoYW5nIGlzc3VlIGNhdXNlZCBieSBnbGl0Y2hlcywKPiBJIHJlYWxpemVkIHRoZXJlIHdh
cyBhIGRpc2NyZXBhbmN5IGZyb20gb3VyIHByZXZpb3VzIHVuZGVyc3RhbmRpbmcsCj4gc28gSSdk
IGxpa2UgdG8gY2xhcmlmeSBpdCBoZXJlLgo+Cj4gT24gMTAvOC8yMDI0IDI6MDIgUE0sIEplcm9t
ZSBCcnVuZXQgd3JvdGU6Cj4KPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IE9uIFR1ZSAwOCBP
Y3QgMjAyNCBhdCAxMzo0NCwgQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+IHdyb3Rl
Ogo+Pgo+Pj4gSGkgTWFydGluLAo+Pj4KPj4+Cj4+PiBPbiAyMDI0LzEwLzEgNDowOCwgTWFydGlu
IEJsdW1lbnN0aW5nbCB3cm90ZToKPj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pgo+Pj4+IEhl
bGxvLAo+Pj4+Cj4+Pj4gT24gU3VuLCBTZXAgMjksIDIwMjQgYXQgODoxMOKAr0FNIENodWFuIExp
dSB2aWEgQjQgUmVsYXkKPj4+PiA8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4+Pj4+IEZyb206IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29t
Pgo+Pj4+Pgo+Pj4+PiBnbGl0Y2ggZnJlZSBtdXggaGFzIHR3byBjbG9jayBjaGFubmVscyAoY2hh
bm5lbCAwIGFuZCBjaGFubmVsIDEpIHdpdGgKPj4+Pj4gdGhlIHNhbWUgY29uZmlndXJhdGlvbi4g
V2hlbiB0aGUgZnJlcXVlbmN5IG5lZWRzIHRvIGJlIGNoYW5nZWQsIAo+Pj4+PiB0aGUgdHdvCj4+
Pj4+IGNoYW5uZWxzIHBpbmctcG9uZyB0byBlbnN1cmUgY2xvY2sgY29udGludWl0eSBhbmQgc3Vw
cHJlc3MgZ2xpdGNoLgo+Pj4+IFlvdSBkZXNjcmliZSB0aGUgc29sdXRpb24gdG8gdGhpcyBiZWxv
dzoKPj4+Pj4gQWRkIGZsYWcgQ0xLX1NFVF9SQVRFX0dBVEUgdG8gY2hhbm5lbHMgMCBhbmQgMSB0
byBpbXBsZW1lbnQgUGluZy1Qb25nCj4+Pj4+IHN3aXRjaG92ZXIgdG8gc3VwcHJlc3MgZ2xpdGNo
Lgo+Pj4+IEl0IHdvdWxkIGJlIGdyZWF0IHRvIGhhdmUgdGhpcyBjaGFuZ2UgaW4gYSBzZXBhcmF0
ZSBwYXRjaC4KPj4+PiBUaGUgY2xvY2tzIHRvIHdoaWNoIHlvdSdyZSBhZGRpbmcgQ0xLX1NFVF9S
QVRFX0dBVEUgYXJlbid0IHN3aXRjaGVkIGF0Cj4+Pj4gcnVudGltZSBpbiBtYWlubGluZSBrZXJu
ZWxzIChhdCBsZWFzdCBJIHRoaW5rIHNvKS4KPj4+Cj4+PiBPa2F5LCBJIHdpbGwgc2VwYXJhdGUg
aXQgaW50byB0d28gcGF0Y2hlcyBhbmQgc3VibWl0IGl0IGluIHRoZSBuZXh0IAo+Pj4gdmVyc2lv
bi4KPj4+Cj4+Pgo+Pj4+PiBDaGFubmVsIDAgb2YgZ2xpdGNoIGZyZWUgbXV4IGlzIG5vdCBvbmx5
IHRoZSBjbG9jayBzb3VyY2UgZm9yIHRoZSAKPj4+Pj4gbXV4LAo+Pj4+PiBidXQgYWxzbyB0aGUg
d29ya2luZyBjbG9jayBmb3IgZ2xpdGNoIGZyZWUgbXV4LiBUaGVyZWZvcmUsIHdoZW4gCj4+Pj4+
IGdsaXRjaAo+Pj4+PiBmcmVlIG11eCBzd2l0Y2hlcywgaXQgaXMgbmVjZXNzYXJ5IHRvIGVuc3Vy
ZSB0aGF0IGNoYW5uZWwgMCBoYXMgYSAKPj4+Pj4gY2xvY2sKPj4+Pj4gaW5wdXQsIG90aGVyd2lz
ZSBnbGl0Y2ggZnJlZSBtdXggd2lsbCBub3Qgd29yayBhbmQgY2Fubm90IHN3aXRjaCAKPj4+Pj4g
dG8gdGhlCj4+Pj4+IHRhcmdldCBjaGFubmVsLgo+Pj4+IFsuLi5dCj4+Pj4+IGdsaXRjaCBmcmVl
IG11eCBBZGQgZmxhZyBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgdG8gZW5zdXJlIHRoYXQgCj4+Pj4+
IGNoYW5uZWwgMAo+Pj4+PiBoYXMgY2xvY2sgaW5wdXQgd2hlbiBzd2l0Y2hpbmcgY2hhbm5lbHMu
Cj4+Pj4gVGhpcyBkZXNjcmliZXMgYSBzZWNvbmQgcHJvYmxlbS4gSSB0aGluayBpdCdzIGJlc3Qg
dG8gaGF2ZSB0aGlzIGluIGEKPj4+PiBzZXBhcmF0ZSBjb21taXQvcGF0Y2guCj4+Pj4gQWxzbyB5
b3UncmUgdXBkYXRpbmcgc29tZSBtYWxpIGNsb2NrcyAoZS5nLiBvbiBHMTIgYW5kIEdYKSBidXQg
bm90IGFsbAo+Pj4+IG9mIHRoZW0gKE1lc29uOGIgZm9yIGV4YW1wbGUgaXMgbWlzc2luZykuCj4+
Pgo+Pj4gWWVzLCBNOCBtaXNzZWQgaXQsIEkgd2lsbCBjb21wbGV0ZSBpdCBpbiB0aGUgbmV4dCB2
ZXJzaW9uLgo+Pj4KPj4+Cj4+Pj4gSSBzdGlsbCBoYXZlIHNvbWUgcXVlc3Rpb25zIHRvIHRoZSBD
TEtfT1BTX1BBUkVOVF9FTkFCTEUgYXBwcm9hY2ggLQo+Pj4+IHBsZWFzZSBzaGFyZSB5b3VyIGZp
bmRpbmdzIG9uIHRoaXMuCj4+Pj4KPj4+PiBUaGVyZSdzIG11bHRpcGxlIGNsb2NrcyBpbnZvbHZl
ZCBpbiBhIGdsaXRjaC1mcmVlIG11eCBoaWVyYXJjaHk6Cj4+Pj4gLSBhIG51bWJlciBvZiBjbG9j
ayBpbnB1dHMgKGUuZy4gZmNsaywgeHRhbCwgLi4uKQo+Pj4+IC0gdHdvIG11eGVzIChvbmUgZm9y
IGV2ZXJ5IGNoYW5uZWwgb2YgdGhlIGdsaXRjaC1mcmVlIG11eCkKPj4+PiAtIHR3byBkaXZpZGVy
cyAob25lIGZvciBldmVyeSBjaGFubmVsIG9mIHRoZSBnbGl0Y2gtZnJlZSBtdXgpCj4+Pj4gLSB0
d28gZ2F0ZXMgKG9uZSBmb3IgZXZlcnkgY2hhbm5lbCBvZiB0aGUgZ2xpdGNoLWZyZWUgbXV4KQo+
Pj4+IC0gdGhlIGdsaXRjaC1mcmVlIG11eAo+Pj4+Cj4+Pj4gV2hlbiBzd2l0Y2hpbmcgZnJvbSBj
aGFubmVsIDAgKHdoaWNoIGlzIGFjdGl2ZSBhbmQgZW5hYmxlZCkgQ0NGCj4+Pj4gKGNvbW1vbiBj
bG9jayBmcmFtZXdvcmspIHdpbGw6Cj4+Pj4gYSkgb24gY2hhbm5lbCAxOgo+Pj4+IC0gZmluZCB0
aGUgYmVzdCBpbnB1dCBjbG9jawo+Pj4+IC0gY2hvb3NlIHRoZSBiZXN0IGlucHV0IGNsb2NrIGlu
IHRoZSBtdXgKPj4+PiAtIHNldCB0aGUgZGl2aWRlcgo+Pj4+IC0gZW5hYmxlIHRoZSBnYXRlCj4+
Pj4gYikgc3dpdGNoIHRoZSBnbGl0Y2gtZnJlZSBtdXgKPj4+PiBjKSBvbiBjaGFubmVsIDI6Cj4+
Pj4gLSBkaXNhYmxlIHRoZSBnYXRlCj4+Pj4KPj4+PiBUbyBtZSBpdCdzIG5vdCBjbGVhciBhdCB3
aGljaCBsZXZlbCB0aGUgcHJvYmxlbSBvY2N1cnMgKGdsaXRjaC1mcmVlCj4+Pj4gbXV4LCBnYXRl
LCBkaXZpZGVyLCBtdXgsIGlucHV0IGNsb2NrKS4KPj4+PiBBbHNvIEkgZG9uJ3QgdW5kZXJzdGFu
ZCB3aHkgZW5hYmxpbmcgdGhlIGNsb2NrcyB3aXRoCj4+Pj4gQ0xLX09QU19QQVJFTlRfRU5BQkxF
IHNvbHZlcyBhbnkgcHJvYmxlbSBzaW5jZSBDQ0YgaXMgZG9pbmcgdGhpbmdzCj4+Pj4gYXV0b21h
dGljYWxseSBmb3IgdXMuCj4+Pj4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiAocHJlZmVyYWJseSB3
aXRoIGFuIGV4YW1wbGUpIHdoYXQgcHJvYmxlbSBpcwo+Pj4+IHNvbHZlZCB3aXRoIHRoaXMgYXBw
cm9hY2g/Cj4+Pgo+Pj4gSWYgQ0xLX09QU19QQVJFTlRfRU5BQkxFIGlzIGNvbmZpZ3VyZWQgaW4g
bXV4LCAnbmV3X3BhcmVudCcgYW5kCj4+PiAnb2xkX3BhcmVudCcgd2lsbCBiZSBlbmFibGVkIGZp
cnN0IHdoZW4gX19jbGtfc2V0X3BhcmVudF9iZWZvcmUoKSBpcwo+Pj4gY2FsbGVkLiBBbmQgZGlz
YWJsZSB0aGVtIGF0IF9fY2xrX3NldF9wYXJlbnRfYWZ0ZXIoKS4gT3VyIGdsaXRjaCBmcmVlCj4+
PiBvbmx5IGhhcyB0d28gY2xvY2sgc291cmNlcywgc28gYWRkaW5nIHRoaXMgZmxhZyBlbnN1cmVz
IHRoYXQgYm90aAo+Pj4gY2hhbm5lbHMgMCBhbmQgMSBhcmUgZW5hYmxlZCB3aGVuIG11eCBzd2l0
Y2hlcy4KPj4+Cj4+PiBJbiBmYWN0LCB3ZSBqdXN0IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgY2hh
bm5lbCAwIGlzIGVuYWJsZWQuIFRoZQo+Cj4gSXQgaXMgaW5kZWVkIG5lY2Vzc2FyeSB0byBlbmFi
bGUgdGhlIGdsaXRjaC1mcmVlIG11eCBvbiAqYm90aCogY2hhbm5lbCAKPiAwIGFuZCBjaGFubmVs
IDEgdG8gYWxsb3cgcHJvcGVyIHN3aXRjaGluZy4gbXVsdGlwbGUgb3JpZ2luYWwgY2hhbm5lbCAK
PiBjbG9jayBjeWNsZXMgYW5kIG5ldyBjaGFubmVsIGNsb2NrIGN5Y2xlcyB3aWxsIGJlIGZpbHRl
cmVkIGR1cmluZyBtdXggCj4gc3dpdGNoaW5nLiBBbiBleGFtcGxlIG9mIHRoZSBjbG9jayB3YXZl
Zm9ybSBpcyBzaG93biBiZWxvdzogX18gX18gX18gCj4gX18gX18gX18gX18gX18gb3JpOiDihpEg
fF9f4oaRIHxfX+KGkSB8X1/ihpEgfF9f4oaRIHxfX+KGkSB8X1/ihpEgfF9f4oaRIHxfX+KGkSBe
IDEgKiAKPiBjeWNsZSBvcmlnaW5hbCBjaGFubmVsLiBfIF8gXyBfIF8gXyBfIF8gXyBfIF8gXyBu
ZXc6IOKGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSAKPiB8X+KGkSB8X+KGkSB8X+KGkSB8X+KG
kSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSBeIDUgKiBjeWNsZXMgbmV3IGNoYW5uZWwuIF9fIF9f
IF8gXyBfIAo+IF8gb3V0OiDihpEgfF9f4oaRIHxfX19fX19fX19fX19fX19fX19fX19f4oaRIHxf
4oaRIHxf4oaRIHxf4oaRIHxf4oaRIF4gXiBzdGFydCAKPiBzd2l0Y2hpbmcgbXV4LiBzd2l0Y2gg
dG8gbmV3IGNoYW5uZWwuCj4KClNvcnJ5LCB0aGVyZSBzZWVtcyB0byBiZSBzb21ldGhpbmcgd3Jv
bmcgd2l0aCB0aGUgZm9sbG93aW5nIGZvcm1hdCBwYXJzaW5nLgoKCkFuIGV4YW1wbGUgb2YgdGhl
IGNsb2NrIHdhdmVmb3JtIGlzIHNob3duIGJlbG93OgoKCiDCoCDCoCDCoCDCoF9fwqAgwqAgX1/C
oCDCoCBfX8KgIMKgIF9fwqAgwqAgX1/CoCDCoCBfX8KgIMKgIF9fwqAgwqAgX18Kb3JpOsKgIOKG
kcKgIHxfX+KGkcKgIHxfX+KGkcKgIHxfX+KGkcKgIHxfX+KGkcKgIHxfX+KGkcKgIHxfX+KGkcKg
IHxfX+KGkcKgIHxfX+KGkQogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXgogwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgMSAqIGN5Y2xlIG9yaWdpbmFsIGNoYW5uZWwuCiDCoCDCoCDCoCDC
oF/CoCDCoF/CoCDCoF/CoCDCoF/CoCDCoF/CoCDCoF/CoCDCoF/CoCDCoF/CoCDCoF/CoCDCoF/C
oCDCoF/CoCDCoF8KbmV3OsKgIOKGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KG
kSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkQogwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXgogwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgNSAqIGN5Y2xlcyBuZXcg
Y2hhbm5lbC4KIMKgIMKgIMKgIMKgX1/CoCDCoCBfX8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIF/CoCDCoF/CoCDCoF/CoCDCoF8Kb3V0OsKgIOKGkcKgIHxfX+KGkcKgIHxfX19f
X19fX19fX19fX19fX19fX19f4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRCiDCoCDCoCDCoCDC
oCDCoCDCoCDCoF7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBeCiDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0YXJ0IHN3aXRjaGluZyBtdXguwqAgwqAgwqBzd2l0Y2ggdG8gbmV3IGNo
YW5uZWwuCgoKPj4+IHB1cnBvc2Ugb2YgQ0xLX09QU19QQVJFTlRfRU5BQkxFIG1heSBub3QgYmUg
dG8gc29sdmUgb3VyIHNpdHVhdGlvbiwKPj4+IGJ1dCBhZGRpbmcgdGhpcyBmbGFnIGRvZXMgc29s
dmUgb3VyIGN1cnJlbnQgcHJvYmxlbS4KPj4gVGhpcyBpcyBsYXN0IHBvaW50IGlzIGltcG9ydGFu
dC4KPj4KPj4gSXQgaXMgT0sgdG8gdXNlIGEgc2lkZSBlZmZlY3Qgb2YgQ0xLX09QU19QQVJFTlRf
RU5BQkxFIGJ1dCBpdCBuZWVkcyB0bwo+PiBiZSBkb2N1bWVudGVkIHNvbWVob3csIHNvIHdoYXQg
cmVhbGx5IG1hdHRlcnMgaXMgc3RpbGwga25vd24gMnkgZnJvbSAKPj4gbm93Lgo+Pgo+PiBNYWtl
IHN1cmUgdGhlIGluZm9ybWF0aW9uIGFwcGVhcnMgaW4gdGhlIGNvZGUgY29tbWVudHMgYXQgbGVh
c3Qgb25jZS4KPj4KPj4+Cj4+Pj4gTGFzdCBidXQgbm90IGxlYXN0OiBpZiB3ZSdyZSBydW5uaW5n
IGludG8gYnVncyB3aGVuCj4+Pj4gQ0xLX09QU19QQVJFTlRfRU5BQkxFIGlzIG1pc3NpbmcgdGhl
biB0aGF0IHBhdGNoIHNob3VsZCBjYXJyeSBhIEZpeGVzCj4+Pj4gdGFnLgo+Pj4KPj4+IFRoYW5r
cyBmb3IgdGhlIGhlYWRzLXVwLiBJJ2xsIGtlZXAgYW4gZXllIG9uIGl0IGluIHRoZSBuZXh0IHZl
cnNpb24uCj4+Pgo+Pj4KPj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4gTWFydGluCj4+IC0tIAo+PiBK
ZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
