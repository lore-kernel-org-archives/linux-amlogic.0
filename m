Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBEACCF9F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hb5ypMb0WS1aAbwTNGYLScM3bkXsBN4hxD0MdWkeCls=; b=isAmEP06z5294rjYaSonX1E18u
	ie852yT/wdfKjHb4wT/GIh8QPov8pbWXBd/MewRw0TqqNcTKlUIISok8lzEmW7lP4WkORootZXIAg
	/+op3e5r0JTcZ5p2nutTUclEAHVqnW70EJDROZKK3KLtJquIJfRtjv6NGABwk0WogZ9cS1XY3mQ0J
	4aQByEZfZmcXdxiP0jzcJ+HIoDTwP38mIT/QrZ2xSS3wMArwTcVqES9ltDNjgkSybLH0TozFmORTq
	Vgi+FyNB/8vcIW4T5FgZJYI02D0Yju6uHRzt6UFTgjS9wYLlvPjb9m1MODdNTe5zLV7cbe+iGHRqB
	3XjqZHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOx5-00000003rgF-2OII;
	Thu, 30 Oct 2025 09:28:15 +0000
Received: from mail-japaneastazon11022081.outbound.protection.outlook.com ([52.101.126.81] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOx3-00000003rfR-24Lu;
	Thu, 30 Oct 2025 09:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naA/e2/vgqzQGVcdZL59n7CQBVzkJzUuxoZIxWTaJ/98fte2nTGhe6uyrnEpgSWdX8jiarV3U2GOhvPha3wjup0Pt7HjLyJrMagztNsE+/l4riY6MIXb8obfQKWr3E+B6PhThpMD+qifXBDAURocyxQKLqTV+ILtWm+SZWejcI4C1PbU1UxU73KmRH+a6Bzd2VCqUsZwUGH0unUAVpVF4lAN9O2UakpA7sZJWBgx+UWFNhlpiISFwC4Omw7E6mNJmx4ZTozei+kDSv8T8TwO/tZjPd00nevhV0lt3zMMUWZRocA+gbmC9GjkMepiEQZW31MXSB8sEuWHDrI/E+l7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki+QqNF0G/FkEzCU35+YAKUyGzHz/X5qArb2X9sfW2E=;
 b=HlLTXgaRrw0V/R/ZAJJIxMrhtWFAwzRdVOU+zgvUZamBgkiLqx8oTKAhcYX2AEBEFXHiqSxeezoJylNhlU5ISvui9qtIfJU2VxRJM0vWVvM2qQcShjUg2WnzdIEUYSEAHcsugkTsiJvubLr6xfKmefoc2Gx7sW1arZUdn2Lr1jS7mKb5OIkBsRU2QPpsDwaEIOeIhDS9TJXKFprtKybg9DqNWji52ZkTFms9c2E2898e/qLyQ69Yp2OVhI/Gw2jcjn9Ba3CXvZXKPiIz6kG5t4oMfclZ8rhZ6HD2aL/FTJROD2RmQ0gkiN1sONpcGpW9LGQN3rEGyI6+jc9vDmA/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ki+QqNF0G/FkEzCU35+YAKUyGzHz/X5qArb2X9sfW2E=;
 b=QEEGR4ukqFYurykUYRgMtXs3GIFIAN300TObrtZ/f4goig5SijTwRiLaNXs5JbMWNg+/zCJ0phvCQN7Mn7Q/19B2r/0yNGzXLLr82kRjWAOUdbWlu7HYrwfTAACsrwwmEocDRmYyMQtJByWTOKNCLFTxB5s2ZY4fzKsaUWL+VqtTzPAfKfwONdzVkUl6sJaqHoky+bSHo33aq9i5RGGpozVQzuvLZOqa7HJCGVc8pK5dKeB9DKM/y8dZ6dxx+81jt8vw4Luu/LsFhEI8/+93385OBQ5KFI/z+J2e93c9YE2coIocPhHkRRyZaMchQ7BI6GfMbrc0jqMlojWzPEsYeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8830.apcprd03.prod.outlook.com (2603:1096:101:255::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 09:28:03 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 09:28:03 +0000
Message-ID: <7e95df48-8f27-47ab-a5e8-5bc0777d41b9@amlogic.com>
Date: Thu, 30 Oct 2025 17:27:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] clk: amlogic: Change the active level of l_detect
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 da@libre.computer
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
 <20251030-optimize_pll_driver-v2-5-37273f5b25ab@amlogic.com>
 <1j4irgzss4.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1j4irgzss4.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee806e4-0984-4217-817e-08de1796a04b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmIyZnZjRkY4SlNXaUlNT2RWS2tsZHF6K1NMbStPTTBlUzQzaUFnVlQrVTR3?=
 =?utf-8?B?SHVvc242Ui9jVlpSaWEzQjhqVmZ0dENFbHdjTnVrY1p4THFtanBkdmVrYXgx?=
 =?utf-8?B?SnNCcVhYcEh2cnlOMFBnZHY3UFlnZFBvTUoxTk44N0xhRlNNQmwvS1NWNGZR?=
 =?utf-8?B?MzZhRjltajE4RERLMFZXcTlRQWVOYnovRCtNWXlDa09RbS9lNkI3NXpXYWxO?=
 =?utf-8?B?dHk3Qnc4Ky9tUUFJS2txdlNCWG1YblpuVTdmdEdPaFgwQ2RHM1FrZGpFT2Nx?=
 =?utf-8?B?aVltV0h2RC9qc0Zla2pXcVI0MENqeXFXNGdWVE13SnFMd3V3OWUyZUk3WEVE?=
 =?utf-8?B?d3p1NDdUaWFQWFBlckFGZEZnd1ZYS0xMdTU3SnB4UytNS0MycnRvOC9rKzlY?=
 =?utf-8?B?dVVjRnhxeUwzT3pDamgzamNGeFRKeGU1Z3RBeTRyMjBaNDAxd0VCSkJzcnEv?=
 =?utf-8?B?b3pvOE5EVC9HRjd2SlMrcm1Vc013eE9ZemZNNWJSUFZTeDFtQk92ZUdWR2w5?=
 =?utf-8?B?eTF5c1JWblBUWjJpRW95dEJsVGlkQ2xnWnpYZTA2Zmlxbjd1OXVJTnN0ZGhW?=
 =?utf-8?B?SUQ2SnVNNllzb1RGZVZBR3F6TTRTYjJ5cGNnUlNUa1VIUnJIaVpxTTlwdENv?=
 =?utf-8?B?WEdIMkZHWVRRU210eTk0ektkU0tHdmFSYnlnRU1QOVJrdUVmL2FMaENpcVBr?=
 =?utf-8?B?K2dxSUNtRk9WUnQycVdRVVJnMmo2eHltbnd0S3h6TVRqclFxMnoveGRzZ1ZP?=
 =?utf-8?B?SlAwRk5GOUV1MDNwMlBuVnE4cFdiSFNmZ21sbVkrQmd3V3BYN2QvY3dkUjVG?=
 =?utf-8?B?ejlHdzZqS2k4a3FIc1E3Nk9WK1FXRkgwR1FpSkhkOFpQcDQ2dElDY21EMkZj?=
 =?utf-8?B?ekM0MDcwcDlKZGQrTndRTXpwVERHb2tJYUJ1V3p5MTBhcWFtZ0VXekJEdXpt?=
 =?utf-8?B?ZWthZ0o4SVpWQnlhMmVuMnJPTnhyYjdrdEcxYlJhRTluTmNHOE14TUFBOHVl?=
 =?utf-8?B?WlZZaFVuaEZ0YktTNHBUbFdsT1hWcjljRytqQS9XemZnNnNVWTNFNmFSdTcx?=
 =?utf-8?B?aUVoTC96R3lzNStYVFBlMDFyUTY1Q0FWa2ZFTkRMamFoWFVBYVh5N1FFU3h1?=
 =?utf-8?B?ZnlPMkpKcENpcXRBU0NnMERMaC94WlpySWluTUlWRkVtbkpuT1hjTGZHYWJC?=
 =?utf-8?B?My9ua1lkUTcxY003Zi93ZmFJMUd6S0wzWU0zRC85ekpzQ3NjSVZUam44QUYx?=
 =?utf-8?B?K25uVE1HM2lUcUNKUFJFKzVJa3hWMVFiTmVtZEpBU3A2alNFREYwWkdYVWVF?=
 =?utf-8?B?MHgwemdNTDBHSDJGaEQ1dncweFkraStvbFE1b2pObHp3SFZYUlNBOEduM2N5?=
 =?utf-8?B?UWQyaDlWK3AwdVQvUWhlRTVWbTF3ZHJqaFdSdGxmaUVaTW5oYXdJTTlKdVFl?=
 =?utf-8?B?YVY2YVNQcmkwYmp3SnhPaGsvTWkrLzNsdks3QnRXZCtyTU14L2V5akI4Szl0?=
 =?utf-8?B?NmdRazBtL1hKQWdnWnluNVFqYlBHRXZpY1czWGNOWXBYOG5YYzVTVlZaNWFQ?=
 =?utf-8?B?emgwWDY2bElRa3VuVTQ1VWhPZkZIVHhHaWdiS1EvSU91RUFlTldEdkpyRW44?=
 =?utf-8?B?cUVoU00zY0pBK3JocFBORld5MDd0NHJoeXM5Ymp4Nzc2VzlKYjZXTDF3WWpH?=
 =?utf-8?B?aXExY2Y4Q3RZWE9YMk9IWGU5NTRWNDhwaGRsaWYzQmwyc1hldHdhZ0tHM0ZY?=
 =?utf-8?B?aVF4UWtjL3RpSVRrQVEyQmN2S0RHVTVBemxXckx6MWZPSmVxR0M0V1pacHYr?=
 =?utf-8?B?Ym5YVklFa2NGOTdZNHhBNEp3aW01SjFBdUIwbEFaL1dWN3FXYVpPTHUzMjhE?=
 =?utf-8?B?TUttRUVJREUvelpwcXFUellqeWh3VCtEUWNsTGtKUzlCL2NrYUhXSjBleFBu?=
 =?utf-8?Q?5yEVK66usaensZh42Ip9JYXoWnyKLPho?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0hDdmRKb0h2ZHNKZ3pxcnlqMzJlaUZWMVdWa0Z0NGZxcHFGWVo2MlIrWDRp?=
 =?utf-8?B?YmRhMHMzaVkwd0Q0dWdyODZEeS9UYlEzVlBsOUhhMlE3bGIwRVVrRFAvblVX?=
 =?utf-8?B?cFQ2T1Z6N1o5Zi8xSVNDUmJSbm5RTVBKdC9TeDdJREk4alpONDhIQ2hteHZo?=
 =?utf-8?B?ZFZad1ZKTU1ZcG9Ma2dLWmVwbnhhZ3FJUFZtM001NzJsNzZmdjFaQ1VEZU5R?=
 =?utf-8?B?QkowQ1lFYUtKODZqb2UrN0JDK3M3VWpCcjcrb2JyNUZmZy9aUmMvczRUUGRm?=
 =?utf-8?B?bHBUS3dOQm9Lc1g4UzRQd01QZTZtdGtxOU9nejNhdDc1RkpRemV6ckFaZ1BS?=
 =?utf-8?B?anJiV1lveitZL1BralJwdHNNZlpDUDVOUW8yS1hGMDF4Vm9mS01oWEFFcEp4?=
 =?utf-8?B?N2JpWmxnUGNFaG8xWFU5Mnl6elRiZzRkRXU0RmNKalBTck5Jd1puU2EvOEUx?=
 =?utf-8?B?NG5GY2RycVQ3ZjJSY0t2WGVyRTJRMXhhYzRIQ0JDYXNUUXJBM0NtaFdpQlgv?=
 =?utf-8?B?NnkvZVNpMkxZdE4xeFVsZGx0TEhIdEUvWlhHNzRJTnBvQ1dTL1hLM1dtdXRD?=
 =?utf-8?B?eHpYQ2x0dXlUSEl4V3gxTVFLMFNNTGhweXk1WlN4MnpLbUlWSERpOW4zUFND?=
 =?utf-8?B?RzkrT2F4eTMwanVvT2VxWC9QWmM0WmlIY1VTVmh0UTNNc0swUytxZ29xVWlv?=
 =?utf-8?B?SGRVL1ptU09aMnlLcysxaXh0NS91bWlwV1RDWU9BUEJ0K0JJNGR5WUN2TEVz?=
 =?utf-8?B?SVpseGE1SFl0ZVUwTUJjN0lKMmVKRUR5SFVHZUhkWVZNUFhxUjU4Ny96Q3pZ?=
 =?utf-8?B?R0kyMUFsaWRJNmJ0YnRVSzVOK295ZDQ4SkZrVjZ3c1BDRnRRak5QUzVkTzNo?=
 =?utf-8?B?cnRDSEkzU0RhVjQ2bGttOGdQZTRSRUpKdkoxOFJzUGMvclhVTnlybjFqRFhn?=
 =?utf-8?B?cEtGcVpXSUZjOFRJLys4bWdqZjJmMzRpdlNaZ2R4d2d4ckZvZW01UkFlaEFu?=
 =?utf-8?B?ZjJra2poQ3RuYm5qMzNhTFpTQ3oyWTY2UmNsZStJVjY5bldJemtRRWtwYVht?=
 =?utf-8?B?VkVPNzRWcmJtLy9zSG1mMnFHdTB1T2lKNjFkVFBIaUlYM0tLSXNDSUVxRERa?=
 =?utf-8?B?QjBxaGRGZDdkY1Z6UTZDQnQxU3M3MVdlZy9DNWo0MW1ZSENia3J5QnZNSUJI?=
 =?utf-8?B?dittbU9DUEhTZWNGUmxrVllTY3I4YWhRWENMUUt6R3pUYVFXck1JYUF5Yjl0?=
 =?utf-8?B?MUtqK1BOUExBa3lXUHYxRFdEa2VGQXlGMjl3VlAvem5lKzA3SmU1eWVtWVZ1?=
 =?utf-8?B?U0Y5RXJTaGhnbmFHNmU0T0RJd2xYZWJVL0FaR015YmgzSVVsVEhSd01UZTV6?=
 =?utf-8?B?UHgzZzBOMHZ1TWhZK2QzL2QwQlRROVdwM0haKzl2SDhLck84Y09XSTZsa1BM?=
 =?utf-8?B?NG5wY3BhWjc4VFlRRnFrNWM2bys2aWVqazdKelRXbWlBU1piN3VOcDJ2WWNI?=
 =?utf-8?B?TzNsMTZWYmplbTJQbWljMVBJMXVYRWNtLyswdFZhaHdLa3cyQm5vcHJ0SXlq?=
 =?utf-8?B?SmI2Uno2TlFDTURVdG5VM0dmcXdYTTl3VzVmd09JcEFVck1sRVFGeVVDTGpr?=
 =?utf-8?B?bFh4U3lrZ1BRS0J2YTd4RXBIZFBKYVF2WlZnVWRBeFo1VHd1eEhqYmFmK2s2?=
 =?utf-8?B?WVhvbkRKK09PcDk0bXo3M2xaVW5QY2thL2N6Zi9yV3N2b1dScHVZRHNiTy9s?=
 =?utf-8?B?SWh0VGJobjRmNUlXdjVCUWFvck94UjV5bEdvenE0L3VLVVdKNmpJamdDTWdn?=
 =?utf-8?B?RmNvOU9pNXpoR1lmaDRIZzJJditDb3QvV25QbldnYlg2WkFhYmxuSnJsWHVL?=
 =?utf-8?B?TmhHVjJnU1p1emFOTURKamJzcmJzb1I0QzNCYzdpMDZPelZVN3ZhczNWUWlK?=
 =?utf-8?B?cEt4ZVZwUmdjc0FqbWNJSmpHOVlKUFVVN25OYUlHdTBkMG56d3M5WTNRelNT?=
 =?utf-8?B?dnZmREIrakFISXAzSzZERVRuTlR0bEFZVm45RTdoeTRnajdkM0J5R0FaNzBH?=
 =?utf-8?B?dUozbHg0NXZpK3p5b0hlajhrUlJINkxSMDJ6VGhZclNsUm5hUzUxVTlYWlFn?=
 =?utf-8?Q?hc+aPNDECYSa2NqE2ecRGIoIw?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee806e4-0984-4217-817e-08de1796a04b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 09:28:03.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YN+SbX8EoWZAWbf2BD2UjNcBAyDniYloNfRhEcpKXSHu7cBuqpx/4yH5JhhbIfUKyz5cUK3/5qviHiz9PM/xvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022813_536824_A7B35E23 
X-CRM114-Status: GOOD (  20.16  )
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

SGkgSmVyb21lLAoKT24gMTAvMzAvMjAyNSA0OjQwIFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIFRodSAzMCBPY3QgMjAyNSBhdCAxMzoyNCwgQ2h1
YW4gTGl1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gCj4+IEZyb206IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29t
Pgo+Pgo+PiBsX2RldGVjdCBjb250cm9scyB0aGUgZW5hYmxlL2Rpc2FibGUgb2YgdGhlIFBMTCBs
b2NrLWRldGVjdCBtb2R1bGUuCj4+Cj4+IFRoZSBlbmFibGUgc2lnbmFsIGlzIG5vcm1hbGx5IGFj
dGl2ZS1oaWdoLiBUaGlzIGRlc2lnbiBlbnN1cmVzIHRoYXQKPj4gdGhlIG1vZHVsZSByZW1haW5z
IGRpc2FibGVkIGR1cmluZyB0aGUgcG93ZXItb24gcHJvY2VzcywgcHJldmVudGluZwo+PiBwb3dl
ciBmbHVjdHVhdGlvbnMgZnJvbSBhZmZlY3RpbmcgaXRzIG9wZXJhdGluZyBzdGF0ZS4KPj4KPj4g
Rm9yIEExLCB0aGUgbF9kZXRlY3Qgc2lnbmFsIGlzIGFjdGl2ZS1sb3c6Cj4+IDAgLT4gRW5hYmxl
IGxvY2stZGV0ZWN0IG1vZHVsZTsKPj4gMSAtPiBEaXNhYmxlIGxvY2stZGV0ZWN0IG1vZHVsZS4K
Pj4KPj4gSGVyZSwgYSBmbGFnIENMS19NRVNPTl9QTExfTF9ERVRFQ1RfTiBpcyBhZGRlZCB0byBo
YW5kbGUgY2FzZXMgbGlrZQo+PiBBMSwgd2hlcmUgdGhlIHNpZ25hbCBpcyBhY3RpdmUtbG93Lgo+
IAo+IEdpdmVuIHRoYXQgQTEgaXMgdGhlIG9ubHkgc2hpcCBzdXBwb3J0aW5nIGxfZGV0ZWN0LCB0
aGlzIGNoYW5nZSBpcyBub3QKPiBuZWNlc3NhcnkuCj4gCj4gTm90IG5vdyBhdCBsZWFzdC4KPiAK
ClRoZSBTb0NzIHF1ZXVlZCBmb3IgdXBzdHJlYW1pbmcgbGF0ZXIgd2lsbCBkZXBlbmQgb24gdGhp
cyBwYXRjaCwgc28gSQppbmNsdWRlZCBpdCBpbiB0aGlzIHBhdGNoc2V0LgoKSWYgdGhhdOKAmXMg
bm90IGFwcHJvcHJpYXRlLCB3b3VsZCBpdCBiZSBhY2NlcHRhYmxlIGZvciBtZSB0byBpbmNsdWRl
Cml0IGluIHRoZSBBNCBzdWJtaXNzaW9uIGluc3RlYWQ/Cgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBD
aHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9jbGsv
bWVzb24vYTEtcGxsLmMgIHwgIDEgKwo+PiAgIGRyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYyB8
IDE2ICsrKysrKysrKysrKy0tLS0KPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmggfCAg
MiArKwo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2ExLXBsbC5jIGIvZHJpdmVy
cy9jbGsvbWVzb24vYTEtcGxsLmMKPj4gaW5kZXggMWY4MmU5YzdjMTRlLi5iZmU1NTljNzE0MDIg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvY2xrL21lc29uL2ExLXBsbC5jCj4+ICsrKyBiL2RyaXZl
cnMvY2xrL21lc29uL2ExLXBsbC5jCj4+IEBAIC0xMzcsNiArMTM3LDcgQEAgc3RhdGljIHN0cnVj
dCBjbGtfcmVnbWFwIGExX2hpZmlfcGxsID0gewo+PiAgICAgICAgICAgICAgICAucmFuZ2UgPSAm
YTFfaGlmaV9wbGxfcmFuZ2UsCj4+ICAgICAgICAgICAgICAgIC5pbml0X3JlZ3MgPSBhMV9oaWZp
X3BsbF9pbml0X3JlZ3MsCj4+ICAgICAgICAgICAgICAgIC5pbml0X2NvdW50ID0gQVJSQVlfU0la
RShhMV9oaWZpX3BsbF9pbml0X3JlZ3MpLAo+PiArICAgICAgICAgICAgIC5mbGFncyA9IENMS19N
RVNPTl9QTExfTF9ERVRFQ1RfTgo+PiAgICAgICAgfSwKPj4gICAgICAgIC5ody5pbml0ID0gJihz
dHJ1Y3QgY2xrX2luaXRfZGF0YSl7Cj4+ICAgICAgICAgICAgICAgIC5uYW1lID0gImhpZmlfcGxs
IiwKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYyBiL2RyaXZlcnMv
Y2xrL21lc29uL2Nsay1wbGwuYwo+PiBpbmRleCBjNmVlYmRlMWY1MTYuLmQ3MjllOTMzYWExYyAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jCj4+ICsrKyBiL2RyaXZl
cnMvY2xrL21lc29uL2Nsay1wbGwuYwo+PiBAQCAtMzg0LDggKzM4NCwxMiBAQCBzdGF0aWMgaW50
IG1lc29uX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+PiAgICAgICAgICAgICAg
ICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5yc3QsIDEpOwo+Pgo+PiAgICAgICAg
LyogRGlzYWJsZSB0aGUgUExMIGxvY2stZGV0ZWN0IG1vZHVsZSAqLwo+PiAtICAgICBpZiAoTUVT
T05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmxfZGV0ZWN0KSkKPj4gLSAgICAgICAgICAgICBtZXNv
bl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMSk7Cj4+ICsgICAgIGlmIChN
RVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKSB7Cj4+ICsgICAgICAgICAgICAg
aWYgKHBsbC0+ZmxhZ3MgJiBDTEtfTUVTT05fUExMX0xfREVURUNUX04pCj4+ICsgICAgICAgICAg
ICAgICAgICAgICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMSk7
Cj4+ICsgICAgICAgICAgICAgZWxzZQo+PiArICAgICAgICAgICAgICAgICAgICAgbWVzb25fcGFy
bV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDApOwo+PiArICAgICB9Cj4+Cj4+ICAg
ICAgICAvKiBFbmFibGUgdGhlIHBsbCAqLwo+PiAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGst
Pm1hcCwgJnBsbC0+ZW4sIDEpOwo+PiBAQCAtNDEzLDggKzQxNywxMiBAQCBzdGF0aWMgaW50IG1l
c29uX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+PiAgICAgICAgdWRlbGF5KDIw
KTsKPj4KPj4gICAgICAgIC8qIEVuYWJsZSB0aGUgbG9jay1kZXRlY3QgbW9kdWxlICovCj4+IC0g
ICAgIGlmIChNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKQo+PiAtICAgICAg
ICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmxfZGV0ZWN0LCAwKTsKPj4g
KyAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkpIHsKPj4gKyAg
ICAgICAgICAgICBpZiAocGxsLT5mbGFncyAmIENMS19NRVNPTl9QTExfTF9ERVRFQ1RfTikKPj4g
KyAgICAgICAgICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmxf
ZGV0ZWN0LCAwKTsKPj4gKyAgICAgICAgICAgICBlbHNlCj4+ICsgICAgICAgICAgICAgICAgICAg
ICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMSk7Cj4+ICsgICAg
IH0KPj4KPj4gICAgICAgIGlmIChtZXNvbl9jbGtfcGxsX3dhaXRfbG9jayhodykpIHsKPj4gICAg
ICAgICAgICAgICAgLyogZGlzYWJsZSBQTEwgd2hlbiBQTEwgbG9jayBmYWlsZWQuICovCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmggYi9kcml2ZXJzL2Nsay9tZXNv
bi9jbGstcGxsLmgKPj4gaW5kZXggOTQ5MTU3ZmI3YmY1Li44MzI5NWEyNDcyMWYgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuaAo+PiArKysgYi9kcml2ZXJzL2Nsay9t
ZXNvbi9jbGstcGxsLmgKPj4gQEAgLTI5LDYgKzI5LDggQEAgc3RydWN0IHBsbF9tdWx0X3Jhbmdl
IHsKPj4KPj4gICAjZGVmaW5lIENMS19NRVNPTl9QTExfUk9VTkRfQ0xPU0VTVCAgQklUKDApCj4+
ICAgI2RlZmluZSBDTEtfTUVTT05fUExMX05PSU5JVF9FTkFCTEVEIEJJVCgxKQo+PiArLyogbF9k
ZXRlY3Qgc2lnbmFsIGlzIGFjdGl2ZS1sb3cgKi8KPj4gKyNkZWZpbmUgQ0xLX01FU09OX1BMTF9M
X0RFVEVDVF9OICAgICBCSVQoMikKPj4KPj4gICBzdHJ1Y3QgbWVzb25fY2xrX3BsbF9kYXRhIHsK
Pj4gICAgICAgIHN0cnVjdCBwYXJtIGVuOwo+IAo+IC0tCj4gSmVyb21lCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
