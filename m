Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE64C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jul 2025 03:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiafLxCZloX2xhgONWDOYHQ3ElZjFOpYFtl7dgwTgFw=; b=OB4IAo5mN+XCMqvRbEdJMp967j
	FsR72S6Wb9lG9YzslqXWV1nEaKCt5bxp/pGRXrd2LdJSkWdbCPAo73O/fkNG6v7JS6iBZDOnyCu/O
	lTf99spD34gu10dIK8tmv9DpOnOPJHqBWbEupD/kyWLY1v/0GizV8xqkw5XA33RizyE5OhI8UrmKV
	/h/zHXt943UELkWWdEQfI9NgKmzNDoeyySGcDAQ3DItHz74TbUCcv44m2Ro6yypVEHFvb4UgYkLJV
	AmS3ORLe1PyXkkpmrEZ8sLsZLDerxwny9Z+VAocAGJ2O5/IZ3acJNZenHPQW5Ryewj26YLwGgRwsQ
	rb0ZaTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXAxE-0000000A9UJ-1aGK;
	Thu, 03 Jul 2025 03:49:44 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXAqI-0000000A8eN-275V;
	Thu, 03 Jul 2025 03:42:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRd0RZhvA+qEwR1VYI2098rBXjmvi/vG7Jxplr/Czaz2QOY/qGqHGcrgF9FLYVOaW0BUKXnTy3+HCsTg742OKkqWYJlnB69PxkkcAn4DC2qIXVr1J48O0HdIVlFQI/XcjIAkcKWV8jt3i+kXal+e3+XKXdL5QGOzeU0sZzhvjWyA19CqZ2292H/lDTyFLkmErsgIpKpRH+nGF1MwbjAKuxbP9Abv0hN3b7te+SCp4upZBiHZ7G4/Sy3pk2YZmVipRvXfJGETTvCJik6v5ljHg5/pWQybnUpvLYySfU9SugpG9rWPnmLve1D3qcHviAPmDsBuaUdA1ogekd/uSneHPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sByetnw4LR2FTA52xGZ97GxS+efL9v9o3UY2MDL0Bcw=;
 b=FQ5ovR+PACCGiNkN/4OZhMiK+H8Z9NuY34Mvd4L7KUAXOEXq9p3vZvKcio6pxbgU4mLIaxvgYM8oGJnOxv/Y+8Lc/hVz97Z52DH9FuiU5LFDTGhBcIss/3ybh3BZiS7x4V15aB8BZF8ez9CKRWE20uiyUJPWtqUROUaVRTceywLBlHdM8Q0XOCvCWHoQfkpgdGnUgPmfC3dN7k5n0ZBbwLiSNcnp+/lVvjc635IVox/s2NUcFacxY/YsHzswLms5eLrJfOS2SlZ91UdPOlYgycAA4vXC/JHBYSnaUtFvPkygApr6No8Y4zlLUvGssNK5SYGJNw7rGy7ATUt4g2ALIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sByetnw4LR2FTA52xGZ97GxS+efL9v9o3UY2MDL0Bcw=;
 b=zew83AznrACkJZDgQ70T2sJTcL1NFJVZSsfaZrpfhnY9XHVd9HUbJR6buFBezhH1dUmKd7vJTlLm1FCkpDjCm6HpgVgV14Q9M+0+mzUp8u6Uly6FKRqw6IcwB+zDPhY4gwaJBjR382tmMmcPi9Ni6hIJN1FLoPM9qN8QmZVfm0V4u3DL7sNGa7Oy7GUAZtuSwejHkF/5whnoKprDKnqBqtxRYaXEorabdqc+rtarBLwFu9MWnym/dgMrgshi9Ynx4T7NRwza2PHq9F9nQOghU6FTABMWWx2ISShYSieII6JiiXcknjMFlMIidhUyYlPrv2ILHWb7yak5Z8AdUZgzGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYZPR03MB8338.apcprd03.prod.outlook.com (2603:1096:405:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 03:42:22 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%3]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 03:42:21 +0000
Message-ID: <bd68352f-7f8c-4cbc-9f4f-f83645cc1f70@amlogic.com>
Date: Thu, 3 Jul 2025 11:42:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] clk: meson: t7: add support for the T7 SoC PLL
 clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
 <20250509074825.1933254-5-jian.hu@amlogic.com>
 <1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
 <4dd25114-212d-44d6-938a-63871750c292@amlogic.com>
 <1jh60fd52u.fsf@starbuckisacylon.baylibre.com>
 <22a24fe6-9e62-4aba-825e-aee214f683ee@amlogic.com>
 <1j7c10jmbp.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j7c10jmbp.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYZPR03MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e308440-9f06-405f-d560-08ddb9e39ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVZPYUhoeTJwRVFQUUVaWklzZXY1UjFFWVNFLy9rU0FSQ3YrNFZLaE10TXB4?=
 =?utf-8?B?ZW5KbkpxRTJYeWJNWEVtWmRuNWVzdFZ6aEV2Y240UXYwdC80cjRVUUg2ZUFG?=
 =?utf-8?B?eU9FL2FDV3dLem9YeDQ1UENLbGkwaGd4TzVUenBMeEdmOEhuWU4rT0N4ZVlW?=
 =?utf-8?B?Sk9EZ2RwZ0Mwb0xiRTdaUUVhZS9wMGxST1A2Z3g5VEVwM1dzU3krb2NOMUc4?=
 =?utf-8?B?WFU4emFPZEY4N1hCM3A5eVZUZnpZak5yVVZ3K1A2WDdMUnRSUGgwRWRSdVBK?=
 =?utf-8?B?cDBYZ0xCTXdXRCt5TjBRaDdMQXVvczA4L1E5KzM4aFJ3aTNwTnlwK3VCM3hQ?=
 =?utf-8?B?WGp2eWpvSmo1WDk2TzZkRjBTODlYQVVlVlNkSVFsTHAwZnZZRVJHS2VpcVJt?=
 =?utf-8?B?MXAwblNrc2dHMHJ6eTZNOHBCcytEdkZmVSt0STFZc3Facmx3dmxkdHRtUVlH?=
 =?utf-8?B?amdadDdTczBvWEZhd09sUGp5VXNDZU5GRHMxYU1RSUNtZWpHN3JjLzJtUWxB?=
 =?utf-8?B?SjBBb1Y4VklXMURwQVFMNTBRYmw0bmpaVmdFSG5ZV2hQWXg0MG0zb2c0TGJr?=
 =?utf-8?B?NkFPT01FVm40NUVhUlIwZDYvVEdTK21TUjlrOVBtL0FXOVdpUVFTN0RrcXA4?=
 =?utf-8?B?cHV3NVNXbW43ZFphUnB3UGo5YkxTMHR1eHZMeFdVSVNBYkpuOUJLWGNPZkEv?=
 =?utf-8?B?OWRxRXdsQ3BjSUkreXE1VWh6SlVXQzRUMExpcGR0VERnNFdFRjdJYnQvQlZU?=
 =?utf-8?B?QzRhd3RFbDZTUEYvTERmeEhYNHVIVnkvZnpQQldBSytFRGRuVFNFcFlRbmho?=
 =?utf-8?B?aW9Va1lUNXBOSTQvQU9TaDFLNFh4V0ZjSVVDLytnanBRMVBhSzhyTG4vYUdo?=
 =?utf-8?B?eUQxeEFJekFRQkNnU1ZRTjQxanNjMGUyK3Q3SmF3dm9JSnZPaHhxbDhKSVR0?=
 =?utf-8?B?elh5SFN1R2pmaFhyWEZWeEZaL0dhZFdvMmluV2NYWmNtamJuQUdKRFM4dk9K?=
 =?utf-8?B?RloyenZVazlNNjlSR3dvaitsOTZIYmZtOWVuVHRreHZlaWYxZjRxeXRhOTRG?=
 =?utf-8?B?Tlo5V1dJd3lnbEhhMzJORlBHLzBLZlN4ZTZkVUU5eXBMWUQ3VTIrOTFHUVMr?=
 =?utf-8?B?bXRKM0g4Vi9VN3RVdk5mMDJrVFcyanJDc2xvbVBaN1RDbzVla01scExGYU50?=
 =?utf-8?B?dkt5Q3pwajQvYXVQUVAxZ1Zldm0xd29FNXVWdjAzUU4xMC9GSTMrTU5LMUpj?=
 =?utf-8?B?V0pIZUttdksvbTRQYm1KTGpLZFN3TEEwYTBaVFRsQklaSlRlYUFwbURYRXYx?=
 =?utf-8?B?a0lWaUNtYy9wVTlVb21BYVIzUVdNbU1VY2hnUTg4ZDNoOXJSd0Y0YXVKR3Fi?=
 =?utf-8?B?N1liRE1XOStVVjYyZlZocGJtNmpDYkdxTmpqSkNnNTQzb2E1ZHBjR1NCalhK?=
 =?utf-8?B?TEZvemY2L0R2bUpiTXlUMmhMaTlvZ3FESTFKWkpTVnpQbWZDeDNrdkdnbXdx?=
 =?utf-8?B?VzJCR25BclRUZEM0RlpJSzRYZ0FTY2RBTVBjTmVwamF6Y1JEbEZlV2E3MDR6?=
 =?utf-8?B?T2NNcTlmUTQyQitKeVVDMmJ3amlDRDVQSmFkVHhwczdXcCtWVG4zZE96QVE5?=
 =?utf-8?B?dldwVmlsL1gwaG1zN2RkdWt3N1NWaDRnSzcxSWRoSlM2U2FmUGUveWpCS0FK?=
 =?utf-8?B?MUxoMmJHYS9wd1lreEVwaWFNTnlMZ3NHNWNMZEpvUzNERUhxWUtUeXZGQ21P?=
 =?utf-8?B?ZGVBZ1lJdkJhcHlQNlhTSU9OSGhEU0NXeHhLWVNINkJtaDE5QUZuYXNBeng1?=
 =?utf-8?B?dEYzVnRSblRITUtJUlNPVmU1UVBzUmFvdWtHRko2dTVIUTZjRHE2dW8zWjVt?=
 =?utf-8?B?L1gvNFhoWTZyUlZsQTlLREwrOVNpRUJnWDBEU0lnSlU3SGQ0NlVtTTQ3Qmth?=
 =?utf-8?Q?YsMhmoinQJk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVcxdjhHaXN4ZUxtK25mMGo5a0E1NEo1SFpDSHpuSml6aDBxQ01uQzZveXJN?=
 =?utf-8?B?bHo0ZnVZVnBiMmZJeHJlZXh2dkxiVE92Rk1RdlRoS1F3RHR6dXRWblJvMEVi?=
 =?utf-8?B?ZzFBWndUMVFUTGVDb0RISlo2dkpKYTEzZ0RGUllYdk1MUGVLTFZ5M2VqMlll?=
 =?utf-8?B?Wm1OR2EvNjZESm5ocHF1bnB5NDM0Z01UbGVQbTlYYitISUtrWlk2Zm1kdm1E?=
 =?utf-8?B?eUs2U2FTWTcxam5jWTJjWjEzL0ljdS8vaW9aY3pNc0gxUHptcXY4Uk5YV1hi?=
 =?utf-8?B?YjZRdVZDQlNzWHQrTEpLcWFWQm1WSGJ3M0piTm9vVTVxVjlvS3NtYjVraXlI?=
 =?utf-8?B?dFRhcFlCUDhuWFMya2gyL3VrT2RMM3RCTTB3Qk1BOCtneEFvWnR5M1J1cjBD?=
 =?utf-8?B?UnpFbTBKbXpUVzJ4YU8vbWpjM0V2WC9nWlNMcWEzenVzRFNLNnFMb2hDTWIr?=
 =?utf-8?B?VGtjTzk5bFA0Q05tb1NObmtkRXBqTFpCUnJDemdkZnNZYmZnYUlNS1hlbW12?=
 =?utf-8?B?dzhMckprUmlTMGdVendLTm1EaHdsL0Y3Y2d5YzF5OGIxSGo5eUI0ejIremZP?=
 =?utf-8?B?WGJieG1rUzNXdUdBZlV0aVNvVFFOUmVFaG55eDZuRVRJM21kdSs4cngrQ2RK?=
 =?utf-8?B?ZkdKUjBKSFcvcWVkQytaSmVlQm11RUNsTkJMa0lnZ3h3dm40WVI3dHQzbzdo?=
 =?utf-8?B?RjJLMnBSbXhqcFBXaTFxQnIyWnV5Zmxyb2Z5NndZRzZzWVRvTkdxVC9JTGxB?=
 =?utf-8?B?WlNlc25kOGZzRnM3Qm1HZVJlYW1EMTJwZmJyelFEU0FRaDhQeXZ5Z1QyRUd0?=
 =?utf-8?B?MW5IMmlJWXVxU2RhYVRncDZjVlNMMVN2R1VLa3lFay91S3pCUEx3amhrM2J3?=
 =?utf-8?B?SjkwQkJCYWlTTU9rMWFuNjZia2w5WFk0R0FaRGY5NUE3N2xMSGRPUk5Qcnln?=
 =?utf-8?B?ZDZVT0pYMWlRUzN6UFNhS0hNeGxQRU9UZGdWNWNmL25WWHhYZjNzVGFPN013?=
 =?utf-8?B?anFyY1UwWmdGVXREZjhZd3V3MzdRQ2Fvc3hwSk0zK05sUlFNU2NSYnpXY0to?=
 =?utf-8?B?Q1FTVlVmdjdzak4xSjZTbjAvYmVhUXNGSlBYVGdkcXBzaVZDek9Sd0FqVTk4?=
 =?utf-8?B?bFpPVVBENENxeWNsNlhrTDZwS29aZWNWSTllUWI3Z3ZkNzA3eFFBYUpGZUZT?=
 =?utf-8?B?NHBvRnZMQlMxZXRjUTVtdDFYZ2N0N0xIOVVEY2NWbGVzcm04dXQveU8vYzVD?=
 =?utf-8?B?b081Nk9sMVU1WFlFT2k3SElsVXQ5N0lWZjltT0wrWEFxZ0hxejlRY0JYUnBV?=
 =?utf-8?B?WmJGSjB5aGtpbndnTXM4UlBGU3EvaldJaUxobGsyOWpiaHVrd2V2cnQvcE9X?=
 =?utf-8?B?b2tpM2g3M0JxT054OExueG9qWHR4eUo2NENZQ2FoZ2Z2aEdaSTk0RHV5elNW?=
 =?utf-8?B?MVVIb04rTmFsc2cyMXlxaDkvNlRhNHJZamRxWlNMaTdrcmRBbURvT3BEbkZs?=
 =?utf-8?B?TjZxNmdNWDhoV3BIaTdmbEwrMGtLVkdkeGVKb08yaUNWVktUSkJ3b2JGTnAr?=
 =?utf-8?B?TDBZT01NRG9qRjBicjNKcmxWVndhVFFwUTFBa3o3ZlUzRW5TTUxaUXZma1I2?=
 =?utf-8?B?dEZmOXR3MnY5Ry93ZXNqeTdmM3JuNkk3N3orZ3dnMVo1QmJFVUdhbHRwQTlE?=
 =?utf-8?B?UXk0OVREWGVUWWJuWDlDV2tsYVhaQkhnVHNJMlFzeWFVZldTcVdUZThnUVdD?=
 =?utf-8?B?cVpnZ0Q0alphRGlMODJzZ0JYcTltbGk3bjQrWnFHUUROVVlWenkydGZ4cnE5?=
 =?utf-8?B?b1daVTFOcGE1TCt0SURwY0VwNm9GR3dMNGtkK3lPaWZmT0h2OTRtZVFQUXRh?=
 =?utf-8?B?RjE0MC9FenNTZXF1V2FFL0E2V1lOdEttdE5VUTd2bGUwQXF2c3hBa1JIMHFY?=
 =?utf-8?B?TG43VGV6ZnhkR2lWOUUwTkI4WUhSbjV4UncvN3VSNkh1K1Q4WW8zQ0ZOdTBj?=
 =?utf-8?B?TCt5U3FBcTU5R0VVaWtEeDVXVG5LcGJhTTRrQXMzYWR4OWIzVFhteGpnN2c5?=
 =?utf-8?B?N2g2NEdFaXpycnVsS2trRDNRZnNUbmF2a0VyV3FJTkdUU1E5RjZHSEF5Wm5J?=
 =?utf-8?Q?noXtW1PknT7HW1zPkAoscNzJ6?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e308440-9f06-405f-d560-08ddb9e39ddd
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:42:21.5477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlHG1NaggJauRNULGJQUYW4ztKRXKdXmd6Bg7QLRflteI9MfRaLzkQBTZBk7yZ711RgjQWfiO3VW7VoDHFRvEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_204234_547890_93BACE15 
X-CRM114-Status: GOOD (  14.28  )
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

Ck9uIDIwMjUvNi8yNSAxNTo0NiwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFMIEVN
QUlMIF0KPgo+IE9uIFdlZCAyNSBKdW4gMjAyNSBhdCAxMDo1MiwgSmlhbiBIdSA8amlhbi5odUBh
bWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPj4gT24gMjAyNS82LzE3IDA6MjcsIEplcm9tZSBCcnVuZXQg
d3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiBUaHUgMTIgSnVuIDIwMjUg
YXQgMjE6MDIsIEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4KPj4+Pj4+
ICsKPj4+Pj4+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgdDdfcGNpZV9wbGxfb2QgPSB7Cj4+
Pj4+PiArICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfZGl2X2RhdGEpewo+Pj4+Pj4g
KyAgICAgICAgICAgICAub2Zmc2V0ID0gQU5BQ1RSTF9QQ0lFUExMX0NUUkwwLAo+Pj4+Pj4gKyAg
ICAgICAgICAgICAuc2hpZnQgPSAxNiwKPj4+Pj4+ICsgICAgICAgICAgICAgLndpZHRoID0gNSwK
Pj4+Pj4+ICsgICAgICAgICAgICAgLmZsYWdzID0gQ0xLX0RJVklERVJfT05FX0JBU0VEIHwKPj4+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgQ0xLX0RJVklERVJfQUxMT1dfWkVSTywKPj4+Pj4g
V2hhdCdzIHRoZSBiZWhhdmlvdXIgb2YgdGhlIGRpdmlkZXIgb24gemVybyB0aGVuID8KPj4+PiBJ
ZiB0aGVyZSBpcyBubyBDTEtfRElWREVSX0FMTE9XX1pFUk8sIHRoZXJlIGlzIGEgd2FybmluZyB3
aGVuIHJlZ2lzdGVyaW5nCj4+Pj4gdDdfcGNpZV9wbGxfb2QuCj4+Pj4KPj4+PiBsaWtlIHRoaXM6
Cj4+Pj4KPj4+PiAgICAgLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4+Pj4g
ICAgIFdBUk5JTkc6IENQVTogMSBQSUQ6IDEgYXQgZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYzox
NDAKPj4+PiBkaXZpZGVyX3JlY2FsY19yYXRlKzB4ZmMvMHgxMDAKPj4+PiAgICAgcGNpZV9wbGxf
b2Q6IFplcm8gZGl2aXNvciBhbmQgQ0xLX0RJVklERVJfQUxMT1dfWkVSTyBub3Qgc2V0Cj4+Pj4g
ICAgIE1vZHVsZXMgbGlua2VkIGluOgo+Pj4+ICAgIENQVTogMSBQSUQ6IDEgQ29tbTogc3dhcHBl
ci8wIE5vdCB0YWludGVkCj4+Pj4gNS40LjI4My0wOTk3Ni1nYTgwM2U5NGVlZDg4LWRpcnR5ICM5
MQo+Pj4+ICAgICBIYXJkd2FyZSBuYW1lOiB0bTJfdDk2MmUyX2FiMzExIChEVCkKPj4+PiAgICBD
YWxsIHRyYWNlOgo+Pj4+ICAgICBbZmZmZmZmYzAyMDAwMzc1MCsgIDY0XVs8ZmZmZmZmYzAxMDBl
M2UzYz5dIGR1bXBfYmFja3RyYWNlKzB4MC8weDFlNAo+Pj4+ICAgICBbZmZmZmZmYzAyMDAwMzc5
MCsgIDMyXVs8ZmZmZmZmYzAxMDBlNDA0ND5dIHNob3dfc3RhY2srMHgyNC8weDM0Cj4+Pj4gICAg
IFtmZmZmZmZjMDIwMDAzN2IwKyAgOTZdWzxmZmZmZmZjMDExMzBhMmU4Pl0gZHVtcF9zdGFjaysw
eGJjLzB4MTA4Cj4+Pj4gICAgW2ZmZmZmZmMwMjAwMDM4MTArIDE0NF1bPGZmZmZmZmMwMTAxMGM0
ODQ+XSBfX3dhcm4rMHhmNC8weDFiOAo+Pj4+ICAgICBbZmZmZmZmYzAyMDAwMzhhMCsgIDY0XVs8
ZmZmZmZmYzAxMDEwYzVmND5dIHdhcm5fc2xvd3BhdGhfZm10KzB4YWMvMHhjOAo+Pj4+ICAgIFtm
ZmZmZmZjMDIwMDAzOGUwKyAgNjRdWzxmZmZmZmZjMDEwNjFkMzY0Pl0gZGl2aWRlcl9yZWNhbGNf
cmF0ZSsweGZjLzB4MTAwCj4+Pj4gICAgW2ZmZmZmZmMwMjAwMDM5MjArICA4MF1bPGZmZmZmZmMw
MTA2MjRlODQ+XQo+Pj4+IGNsa19yZWdtYXBfZGl2X3JlY2FsY19yYXRlKzB4NzQvMHg4OAo+Pj4+
ICAgICBbZmZmZmZmYzAyMDAwMzk3MCsgIDk2XVs8ZmZmZmZmYzAxMDYxNmE1ND5dIF9fY2xrX3Jl
Z2lzdGVyKzB4NjJjLzB4Yjc4Cj4+Pj4KPj4+PiBzbyBhZGQgaXQgdG8gYXZvaWQgdGhlIHdhcm5p
bmcuCj4+PiBUaGF0IGRvZXMgbm90IHJlYWxseSBhbnN3ZXIgbXkgcXVlc3Rpb24KPj4KPj4gU29y
cnksIEkgZGlkIG5vdCBnZXQgeW91IGJlZm9yZS4KPj4KPj4gSSBoYXZlIHNldCBPRCB0byAwLiAg
QW5kIG1lYXN1cmUgcGNpZSBmcmVxdWVuY3ksICBJdCBpcyAzNy41TWh6Lgo+Pgo+PiA0ODAwTWh6
LzIvMzIvMj0zNy41TWh6LCBhbmQgdGhlIE9EIGVxdWFsIHplcm8gbWVhbnMgZGl2aWRlZCBieSAz
MiBpbiBmYWN0Lgo+Pgo+IENMS19ESVZJREVSX01BWF9BVF9aRVJPIG1heWJlID8KCgpZb3UgYXJl
IHJpZ2h0LCBDTEtfRElWSURFUl9NQVhfQVRfWkVSTyBtYWtlcyBzZW5zZSBoZXJlLgoKCml0cyB3
aWR0aCBpcyA1LCBhbmQgdGhlIGRpdmlzb3IgaXMgMl41ID0gMzIuCgoKSSB3aWxsIGFkZMKgQ0xL
X0RJVklERVJfTUFYX0FUX1pFUk/CoCBhbmQgcmVtb3ZlIENMS19ESVZJREVSX0FMTE9XX1pFUk8g
aW4gCnRoZSBuZXh0IHZlcnNpb24uCgo+PiBIZXJlIGlzIHRoZSB0ZXN0IHJlc3VsdDoKPj4KPj4g
ZGV2bSAweGZlMDA4MTQwIDMyCj4+Cj4+IDB4RDQwQzA0QzgKPj4KPj4gY2F0IC9zeXMva2VybmVs
L2RlYnVnL21lc29uLWNsay1tc3IvbWVhc3VyZV9zdW1tYXJ5IHwgZ3JlcCBwY2llCj4+Cj4+IFsx
Nl0gcGNpZV9jbGtfaW5wICAgICAgMzc1MDAwMDAgICsvMSAzMTI1SFoKPj4KPj4KPj4gdGhlIE9E
IGRpdmlkZXIgaXMgTiBjcm9zc292ZXIuIGl0IGlzIG9uZSBiYXNlZC4KPj4KPj4gYW5kIEl0J3Mg
cG9zc2libGUgdG8gZ28gZnJvbSAxIHRvIDMxIGNyb3Nzb3ZlcnMuCj4gLS0KPiBKZXJvbWUKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
