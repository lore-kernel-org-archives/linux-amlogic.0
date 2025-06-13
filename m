Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45780C61DB2
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jun 2025 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CUBiVioMx9zNBgfeid911MS6Davrd9pZm9WcyTq+3Q=; b=bhTTN9eFkOAUWztFZzmof/Oh3L
	1OrG+g+3kLKZEn8p64CJeIc8wKxFr2TQ6VhS9G+ypp7Yk2q1dKjRjaTd2o2fX6hCpkq65gJS2Ico5
	4jDoYjvuO/8edlY2ARtC5/YztD/SsZCC7ILbuH+0QBXaQSsD/cAqjmATDfiHwKThC8oxB9qUYuAWj
	S4hLAwlVYg8GHyT2ECubOIs/z9Op8TbsCHnhHi/0/qqNx0T4elnIBcBkzSnCMvLF9GBglYDOuFw0g
	LSrGUa2kNfB5tqCJC41guudScPMRCW7RQ2Wcini5//3G6IfniKR6jk9TmSv0GA53ybDQisgugNQH9
	1RzABcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0zn-0000000FxyC-3Odm;
	Fri, 13 Jun 2025 09:46:47 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0sY-0000000FvxE-2wC2;
	Fri, 13 Jun 2025 09:39:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPQw/0AQy+uF9Gki9qRFt0k3UY1ekbJ8HV1Gy2OPBAZXEX7DsYS2qVMl1Q1zYCO2fyB0V9rN516WVJuv/n3OrFCpReg7g4jfrusd+sII30hmllZAOFt9xqLgDrLvjNTduYLjN/H/z9ZX62TH2sL7jV3Oml7bIqC/QzmttghLw2UwAtu+9dcdp9RjO0JpsgJpjnuM0ojwYJFOiJ5Ho8Fru4YMCZiezwdMQVYbjiev4ShbYx2EUE6jkPLwbDTCWtIVjgs8Vma9JmmmeTSSOqnhNoIQ5LLvrLvYoDBw1JJEm9R5NSHKW2p7DeNHan3FFOG6064VH7S5mDfUJJ7aTQIhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PijZJiYHSmOkV1ew7Oz60T6GDs942y8HTyI1XDVHxVk=;
 b=Q8GcLBKUVuOiEBSeco3LihH7BfIoqvP5yyoHSe+VrkbFwvw3ayD8tQTWYB/VbrA6PyAFmbWz1HLUbjNp9Nh1sSZ/34NG8yuYP7aMfiG7IcFmd1T7mYRYvTM0+VzkbTIRVKB5zPiHuFwIF7SpmS2XMr/RdzrIUYa8NzeOD6utxoUDNwPUOz8+e6izFebOXJhQT70DEDHVX9O3v9p3aTucm+qJLDOZx0imc5gb9zTm4OuIgGz+yMfpp7TZD532TQszq8/i5DPoC7ouA73chh3JGnuFMv41mFrWkL8eEa2iDnwrR8tZfM+Razi5h5ALF/7+6galq5CRQlK7NYsolNxhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PijZJiYHSmOkV1ew7Oz60T6GDs942y8HTyI1XDVHxVk=;
 b=qapbt+xRnneVCU0jGRSpmFimShGWDMvOJgGxlkQbwsAm7hxUv7+Gx+LMeDychpHD4IwYic6Vw28bs8yBvF1DKe8XClc/N/5gKkro7qcoFSsPPU1kNC5bU2KwLRbOiyjBhv/jGjlfzCNG/xzJpqeJU/vfj2KTvHZy3vFXs1whBMXk2gTtmetwean3b4SU4pxX4pVfC3J5dSeDLjgRZ7t5/b6c7aegDwuoLWxUKuAzrIrKhY5tB64lG+Wlmryjww4+PZO4EvWy1TmWBwMx8P/a7zd+d3qdsbkgAZZoCvJRGPxB9TJVsO8bSqFlOT2ouDptTm2EAsWyEglYg3hnDqcBgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by OSQPR03MB8526.apcprd03.prod.outlook.com (2603:1096:604:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Fri, 13 Jun
 2025 09:39:07 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%3]) with mapi id 15.20.8813.036; Fri, 13 Jun 2025
 09:39:05 +0000
Message-ID: <faf7d7bd-489a-4cc2-bb00-7df5980161cf@amlogic.com>
Date: Fri, 13 Jun 2025 17:39:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] clk: meson: t7: add t7 clock peripherals
 controller driver
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
 <20250509074825.1933254-7-jian.hu@amlogic.com>
 <1jo6vvy63e.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jo6vvy63e.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|OSQPR03MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6287ad-b159-4be9-3b28-08ddaa5e238d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXRva25YSEZQcTRoK0JNYWpDcVVVeTk5WU9qUWtPaEhkNlkrbXRsK3BYRWpz?=
 =?utf-8?B?ektTaEZaOEo2a2FOeVFIYVkrZ1RBaFh3WTR5dUR1eklSKzkwdlFuOENoN0x4?=
 =?utf-8?B?cUw5R3dHTzYwK0lnRDI0bVZzeEIxempySGI3VkxlYjA2SzFzektCSkZad2xM?=
 =?utf-8?B?VkZIT2drZk1IOXBrRkdVNU5JUm5VWDRXeHRMampLOGJIMHNtNTVIaTk1aEF0?=
 =?utf-8?B?dFRsTStkYWJhZisySmxyblRtMXZLUjgyanorOUlFTjRIblp0d0ZtSGJVSVIr?=
 =?utf-8?B?a00xOTNjRzFYQ2ZHWVF4Qkt1MEFkd1VxNkEzczZBSGpBUWs2Q2NWa3lPZjBi?=
 =?utf-8?B?Vm1IUlZjRGJBQlVLR1h6K09iSVMrMHovVHYyUDlqOTd5eHBYTnZObEg3WFJ0?=
 =?utf-8?B?elF4cFdDVkJzYXAxUUdTbjJmMTJsdjdVdmYwamtBMHhrZVlHNjBMc2lvU0R4?=
 =?utf-8?B?TFFuZkNrZHRWMXZ2YVBpVUVadTZKNDZIbHgvT3V0TnhLOURTQVdXVFJKSHJp?=
 =?utf-8?B?OXhpbnhvcW55ZEwxczF2anlYQ1JEa3drODcya21oc21hSFJBUmFiaC9IRTVR?=
 =?utf-8?B?S09NOFR3VFhhZ1RsU29NNnhoSGlIU1o1ZEM0ZjNIUkZvbHpoTWZXL3FRZFh1?=
 =?utf-8?B?VktSTUVvdU1SV09EVWxJc2RSZVZNY1phZU5hREJJNURha2p0Y1JuM3F0K0s1?=
 =?utf-8?B?bDgzcDBlSmNBT1hKN0F4cXF6ZzB5bXBFLzBreHYyYnFDV0xlcEFlUHliTjB1?=
 =?utf-8?B?aXFGdVc1OGJxajlmWWR0WnJkWkIyQm5XRDF4QmdIWkM0ZUpmSFc1eFJjQ1FR?=
 =?utf-8?B?R2J4eG43VFFlSVVtaC94VGpYSDYzR3pBMFlXajJKT201MUF4M0F2Rk55dHEv?=
 =?utf-8?B?MkROQ2ppRVpLTWFHOGJ0WDQwM28xb0NvSGV0UHI4NUxHOHpwOXhuM3BLRHBy?=
 =?utf-8?B?dG54NTZUa2NRbC96aWpEVVpGZ0RPd1JlYy8vekFvUGNJVzJrV08vbEQ4OWhp?=
 =?utf-8?B?SWlFcGwvODEvVFVNWmRWT0JmWWNrZy91RkNRYlZBNWpKUXYxdlJ6VkJ1aDhz?=
 =?utf-8?B?ZkorMXdSaTY2L2ZYaDZSN0J5VEt0ayt6MHVxS2VURlo2MGx5a29ITE5pUEVY?=
 =?utf-8?B?TjlOdHh2dUlwblZ1U1hPSkpERE5mdE9sQ0NtZTBGa1NudjBRbmZKSmtHZXp5?=
 =?utf-8?B?Wm01bkVqUy9DeEo5YjJzZDlIS2hzTUo4cW9IczZ2dU9qcG5RODZ0MXk4elRj?=
 =?utf-8?B?c0p0QmJxVGN1RGxjSitVbnJqVUQ0d0txaXJjSENkYmYxbW5ORCtuRlJWd05R?=
 =?utf-8?B?dHZGeFg3ZTZvNm1SSjk0K2plcmFrc2tYU3hFSktTa2dDd2d2Q0Vxd0dxWXBC?=
 =?utf-8?B?Q1M0UHp4Z290RUt1SkRybGlUY2JwUndxdGpZcG10K3NKdnRBTTU3VWFheWtW?=
 =?utf-8?B?eU5wZkx6SVpNb0lQeWRCRVlhWXdpQ3V1UlpjZ1gwOERESC9ob2tQd0tLUFF0?=
 =?utf-8?B?VW4yM05CVmJXRHp0ZnhySU02SGxsZ3hlZ1Y1SEttOGZuU0VmcWJBUUVGSWJ1?=
 =?utf-8?B?U1Z1Rkx2Rjd5aE95RXR6djZRS282dURwcFNpSWtkdXRsVnNoL0RmMm01NXlZ?=
 =?utf-8?B?YWcwMDBrK1hya3IzYVRuTDZNYzBrUnlHZnppdkhzMGdGcEpEQVNaRUJaallB?=
 =?utf-8?B?N213SzF3eXVXTGt1NkpZdE5yN1RUdFVHS3Ftd05YRG1rMmM3d2xYTUp1NWht?=
 =?utf-8?B?b0gvZWU2TU9CZGJPRjVxdTNjNWJodXZudDJqV1RNUnN4bkRkV2J2dlpWZlc1?=
 =?utf-8?B?QS94RXppN1kzZWVNb2hCdlhQMDNXbkZsR0g2aVFKN3krT0x3dkN1NzBqRDVn?=
 =?utf-8?B?S3hRUHp0VW4xOGllNng1WmNISzl4Mm5XcVhpRnlQK0RQbDFPQTNLY29QcnBr?=
 =?utf-8?Q?nsmuOAdeTCY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDNUaDUvRnZoTHg4ZksrTWZmTmM0eFE4YU8xZCtFSHlZcTJmK0RKZXgvYjhY?=
 =?utf-8?B?V1NCZWtsTjlmUStmTGRnZWJ6dHZuV2FYNEdFNUtwenhGNWRZK0dZVk9PL0lM?=
 =?utf-8?B?VXo3MTF4L21sazB6d0dSTkJ6MllqQWVqcGEvc0lMZUZDSnMxUDVBbWFqdjRn?=
 =?utf-8?B?MlFLYVJWd015OGxvd2l6OFMxRlBjS1pZeTFidDhOMjNNcnJZbHdyTnZ5S3E0?=
 =?utf-8?B?UGd2U0h0NitTU2RZakd5RmdzVzg1M09Ydjd6eWR4bk0vUEt5Nkx0ODFicUpX?=
 =?utf-8?B?emJ5WFF4OG53QVhqb01ZK2g5L0tJTThkdHF0V25NTkRpZkthZFh5NkZnTHpl?=
 =?utf-8?B?ZERMN2ovZDY5UzRCSXdpVWZUZzhjL3oxZWNOUEtmZnNyY28yU2c1TWg3WkY3?=
 =?utf-8?B?aXhrMk85TUwwNEFweVl4WnhwWU1ZU2ViYWFYcjF3TzkrUEdaOHNJNExDT2dI?=
 =?utf-8?B?UWVLbVFGa3h0SDRsL2RaaGNHbnRPa29kYW1NcEhMb0dGaEFOUXlQUXhjd1Na?=
 =?utf-8?B?RGMvZ0Mrc2FPVzVRcDN0ZjBCZFBqSHVtS0xLeDhQVzAzUVFNN2xuWnpVaVJI?=
 =?utf-8?B?Q0pjQStVRldOclZUdFZ0Z3JaWDdqejc5N0FpaHYzeDlDMUE2YTlRZ1hHaS9U?=
 =?utf-8?B?VGRSbGh5OXpHc3RiZjlkQmtwazdMbjBLUXRwOU1UMTBrREFGb0FyYlFVNWV1?=
 =?utf-8?B?S2ZzbHc2MytjY3FSYTZEMkpTNFdsTmpNZWtkRzRuZUdBN0sydTZUMXJFOXRL?=
 =?utf-8?B?TDRhamFKYnpPTThlQys3N0Jpc0xQRm0veHNLaUVBT0ZwemE2KzRPQTNCVkNj?=
 =?utf-8?B?MXpBUHA5VGRUMTZad3M3TzRvTVIvS1dic1ppekFWaCtMeUl1eHJXaGJXdWVC?=
 =?utf-8?B?Q295Z0NRRTZ4SXhPL1UvUG1SZ2ZQQ2Q4a3ZOcitvZjgzZkxNWmNzdCtUbHRX?=
 =?utf-8?B?bS94ZjRpT20xc1NpcktpRjNQTThqbkpjN0kyZFBVeWkrL0t4VnhieTJId3g1?=
 =?utf-8?B?SE42ZXllK2lsdXk2dWxPeC9INVJ3ditSYTB4cVZjZHhIeDAxcGg1cmRVcGZR?=
 =?utf-8?B?SS9MS29GZldhdjIxTVlJVHYrN2RuSDNpU29Rb1dOVGt6amRsZ3ZMZ2x6R0FU?=
 =?utf-8?B?TDNLc1VkK1BFR3pQRlByM3VXay8wU3BPY0FqVTRPNjdUOU11dFViLzgvRnJa?=
 =?utf-8?B?WVVjUnF4S01lcjMxMlVyczBiR3Y5a1B6eW5jdHcwdWlDS3N6M1VOL1JmK08r?=
 =?utf-8?B?eE5FUzFHZk1sM3RKVlhlS3diYTdhakxiWWI5Zk96N0dYREVGQytTODc1MENU?=
 =?utf-8?B?UEVOeElRbUxMTHRld3ppNGlKYzFYaSt5R0VBUnhQVDRvbFJZU1NnQjNyUDMr?=
 =?utf-8?B?TEVvZE9ncExyazhjUWc4aERhTnVvK3RvaWNiSGJrSU52dXdRSmxsaXo5Qncz?=
 =?utf-8?B?Nm1LdVp1eUo4Y2NIV1l5U3pUdjhpUXhCbjZRb2ZnUDdWM2dQRmVCK2RNbUlZ?=
 =?utf-8?B?Z0FHZGttSDVJWFROd3psZUZwZDlIa0pDbmlmSytPVExMZmlwc0dhTENFc1RP?=
 =?utf-8?B?MENwNEg0M3dvT29Obnc4dzFGMmI1LzFob1QxM21tK3ZOemx2TUU0ZU40Nmtm?=
 =?utf-8?B?YWRxTHdXV2J1WWtqdENtM3dZdTdyY2lndDR3N0R5aUVKRW1vZjdwRTlyaW5i?=
 =?utf-8?B?RXdmWU1COTBxMTFEbkExUEJlSzBsb0MvdHNaamlmby9NUWE5ZkNwVDk4WDNZ?=
 =?utf-8?B?eGFEak1VMm9YeTJWaUsxOVUwNjluYjg3WDA2MEQ1SklMWnMzSWhEUy9GQTBU?=
 =?utf-8?B?VnFaNi8xS1RQYXVIaVR4V1NjeFFVWjc3c25WQU5MZi9jbllmdklNc2pIVHhF?=
 =?utf-8?B?K0lXb2hISXRFcE9QdXJOcDFnUXhNQVhPbk9BM1A5MVE4Ull1YWJSZDU2eC9x?=
 =?utf-8?B?bERWQTRHek5OVHRyNTNBRlF0RXNPeUYvSjZoUkEvN0l2U1VueGlFd251cFR5?=
 =?utf-8?B?cXFBTi9KVjFpVnF2SkxSMDVpUHVjeWpqL2pJT3BKV2JCUEZtSER4Q0tFcVZv?=
 =?utf-8?B?c0lVWXgxT0NoZEJSek05em5lVUx0ZDBzSXFDbWFFVkt5dVE1YVhSd3lIak1G?=
 =?utf-8?Q?RFhSYDIXg4D64VIFKpgx6WvDh?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6287ad-b159-4be9-3b28-08ddaa5e238d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 09:39:05.8142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9jhUEpmGEIoZJGENaIFKW+HSgso5gPCMJdm+JcCgiozRDbRCUHNkZA1HD1vWAfq4WrPfVVi+qqY+d6EoaWS6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_023918_858537_911679BC 
X-CRM114-Status: GOOD (  16.96  )
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

Ck9uIDIwMjUvNS8xNCAxNjowMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFMIEVN
QUlMIF0KPgo+IE9uIEZyaSAwOSBNYXkgMjAyNSBhdCAwNzo0OCwgSmlhbiBIdSA8amlhbi5odUBh
bWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPj4gQWRkIFBlcmlwaGVyYWwgY2xvY2sgY29udHJvbGxlciBk
cml2ZXIgZm9yIHRoZSBBbWxvZ2ljIFQ3IFNvQyBmYW1pbHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvY2xrL21l
c29uL0tjb25maWcgICAgICAgICAgfCAgIDEzICsKPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9NYWtl
ZmlsZSAgICAgICAgIHwgICAgMSArCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vdDctcGVyaXBoZXJh
bHMuYyB8IDIzNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDMgZmlsZXMgY2hh
bmdlZCwgMjM3MyBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Y2xrL21lc29uL3Q3LXBlcmlwaGVyYWxzLmMKPj4KPj4gLi4uLi4uCj4+Cj4+ICsKPj4gK3N0YXRp
YyB1MzIgdDdfZXRoX3JtaWlfdGFibGVbXSA9IHsgMCwgNyB9Owo+PiArCj4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSB0N19ldGhfcm1paV9wYXJlbnRzW10gPSB7Cj4+ICsg
ICAgIHsgLmZ3X25hbWUgPSAiZmRpdjIiLCB9LAo+PiArICAgICB7IC5md19uYW1lID0gInJtaWlf
cGFkIiwgfSwKPiBBcmUgeW91IHN1cmUgYWJvdXQgdGhhdCA/IGNoZWNrIHRoZSBiaW5kaW5ncwoK
Ck9rLCBybWlpX3BhZCBpcyBvcHRpb25hbCBwYXJlbnQsIEkgd2lsbCB1cGRhdGUgaXQgaW4gRFQg
YmluZGluZ3MuCgo+PiArCj4+ICsjZGVmaW5lIFNQSV9QV01fQ0xLX01VWChfbmFtZSwgX3JlZywg
X21hc2ssIF9zaGlmdCwgX3BhcmVudF9kYXRhKSB7ICBcCj4+ICsgICAgIC5kYXRhID0gJihzdHJ1
Y3QgY2xrX3JlZ21hcF9tdXhfZGF0YSkgeyAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAg
ICAgIC5vZmZzZXQgPSBfcmVnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4g
KyAgICAgICAgICAgICAubWFzayA9IF9tYXNrLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4+ICsgICAgICAgICAgICAgLnNoaWZ0ID0gX3NoaWZ0LCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+PiArICAgICB9LCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBj
bGtfaW5pdF9kYXRhKSB7ICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgICAgICAgICAgLm5h
bWUgPSAjX25hbWUgIl9zZWwiLCAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAg
ICAgICAgIC5vcHMgPSAmY2xrX3JlZ21hcF9tdXhfb3BzLCAgICAgICAgICAgICAgICAgICAgIFwK
Pj4gKyAgICAgICAgICAgICAucGFyZW50X2RhdGEgPSBfcGFyZW50X2RhdGEsICAgICAgICAgICAg
ICAgICAgICBcCj4+ICsgICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gQVJSQVlfU0laRShfcGFy
ZW50X2RhdGEpLCAgICAgICAgXAo+PiArICAgICB9LCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gK30KPj4gKwo+PiArI2RlZmluZSBTUElf
UFdNX0NMS19ESVYoX25hbWUsIF9yZWcsIF9zaGlmdCwgX3dpZHRoLCBfcGFyZW50KSB7ICAgICAg
XAo+PiArICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfZGl2X2RhdGEpIHsgICAgICAg
ICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAub2Zmc2V0ID0gX3JlZywgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgICAgICAgICAgLnNoaWZ0ID0gX3NoaWZ0LCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICAgIC53aWR0aCA9
IF93aWR0aCwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgfSwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsg
ICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkgeyAgICAgICAgICAgICAgICAg
ICAgXAo+PiArICAgICAgICAgICAgIC5uYW1lID0gI19uYW1lICJfZGl2IiwgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAub3BzID0gJmNsa19yZWdtYXBfZGl2aWRl
cl9vcHMsICAgICAgICAgICAgICAgICBcCj4+ICsgICAgICAgICAgICAgLnBhcmVudF9od3MgPSAo
Y29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsgICAgICAgXAo+PiArICAgICAgICAgICAgICAgICAg
ICAgJl9wYXJlbnQuaHcgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAg
ICAgICB9LCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+
ICsgICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gMSwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+PiArICAgICAgICAgICAgIC5mbGFncyA9IENMS19TRVRfUkFURV9QQVJFTlQsICAg
ICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgfSwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICt9Cj4+ICsKPj4gKyNkZWZpbmUgU1BJX1BX
TV9DTEtfR0FURShfbmFtZSwgX3JlZywgX2JpdCwgX3BhcmVudCkgeyAgICAgICAgICAgICAgIFwK
Pj4gKyAgICAgLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX2dhdGVfZGF0YSkgeyAgICAgICAg
ICAgICAgICBcCj4+ICsgICAgICAgICAgICAgLm9mZnNldCA9IF9yZWcsICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICAgIC5iaXRfaWR4ID0gX2JpdCwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgfSwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgIC5ody5pbml0
ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkgeyAgICAgICAgICAgICAgICAgICAgXAo+PiArICAg
ICAgICAgICAgIC5uYW1lID0gI19uYW1lLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPj4gKyAgICAgICAgICAgICAub3BzID0gJmNsa19yZWdtYXBfZ2F0ZV9vcHMsICAgICAgICAg
ICAgICAgICAgICBcCj4+ICsgICAgICAgICAgICAgLnBhcmVudF9od3MgPSAoY29uc3Qgc3RydWN0
IGNsa19odyAqW10pIHsgICAgICAgXAo+PiArICAgICAgICAgICAgICAgICAgICAgJl9wYXJlbnQu
aHcgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICB9LCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgICAgICAg
ICAgLm51bV9wYXJlbnRzID0gMSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAr
ICAgICAgICAgICAgIC5mbGFncyA9IENMS19TRVRfUkFURV9QQVJFTlQsICAgICAgICAgICAgICAg
ICAgIFwKPj4gKyAgICAgfSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4+ICt9Cj4KPiBBZ2FpbiB0aGF0IHNvbWV0aGluZyB0aGF0IGhhcyBi
ZWVuIHJlcGVhdGVkIGZvciB3YXkgdG9vIGxvbmcuCj4gWW91J2xsIHdhaXQgZm9yIHRoZSBjbGVh
bi11cCB0byBiZSBkb25lLiBJZiB5b3Ugd2FudCB0byBoZWxwLCB5b3UgY2FuCj4gcmV2aWV3IGFu
ZCB0ZXN0IHRoZSBwYXRjaCBiZWluZyBzZW50LiBJdCBtYXkgc3BlZWQgdGhpbmdzIHVwLgoKCkkg
d2FudCB0byBjb25maXJtIGhlcmUgLgoKeW91IHNhaWQgdGhlIGNsZWFuLXVwIHBhdGNoIGlzIG5v
dCByZWxhdGVkIHRvIHNwaSBhbmQgcHdtIGNsb2NrcywgUmlnaHQgPwoKCkkgY2FuIHNlZSB0aGUg
cmVnbWFwIGRyb3AgdGFibGUgcGF0Y2ggWzBdLCBpcyBpdCB0aGUgc2VuZGluZyBwYXRjaD8KCgpb
MF06IApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYW1sb2dpYy9w
YXRjaC8yMDI1MDEyMC1hbWxvZ2ljLWNsay1kcm9wLWNsay1yZWdtYXAtdGFibGVzLXYzLTAtMTI2
MjQ0MTQ2OTQ3QGJheWxpYnJlLmNvbS8KCgpJIHdpbGwgYXBwbHkgdGhlIHJlZ21hcCBjbGVhbi11
cCBwYXRjaCBzZXJpYWwgYW5kIHZlcmlmaWVkIGl0IG9uIFQ3LgoKCklmIG5vdO+8jCBQbGVhc2Ug
Y29ycmVjdCBtZS4KCj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRh
IHQ3X3NwaWNjX3BhcmVudHNbXSA9IHsKPj4gKyAgICAgeyAuZndfbmFtZSA9ICJ4dGFsIiwgfSwK
Pj4gKyAgICAgeyAuZndfbmFtZSA9ICJzeXMiLCB9LAo+PiArICAgICB7IC5md19uYW1lID0gImZk
aXY0IiwgfSwKPj4gKyAgICAgeyAuZndfbmFtZSA9ICJmZGl2MyIsIH0sCj4+ICsgICAgIHsgLmZ3
X25hbWUgPSAiZmRpdjIiLCB9LAo+PiArICAgICB7IC5md19uYW1lID0gImZkaXY1IiwgfSwKPj4g
KyAgICAgeyAuZndfbmFtZSA9ICJmZGl2NyIsIH0sCj4+ICsgICAgIHsgLmZ3X25hbWUgPSAiZ3Ax
IiwgfSwKPj4gK307Cj4+ICsKPj4gLi4uLi4uCj4+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAg
dDdfc3lzX2dpYyA9IHsKPj4gKyAgICAgLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX2dhdGVf
ZGF0YSkgewo+PiArICAgICAgICAgICAgIC5vZmZzZXQgPSBDTEtDVFJMX1NZU19DTEtfRU4wX1JF
RzIsCj4+ICsgICAgICAgICAgICAgLmJpdF9pZHggPSAzMCwKPj4gKyAgICAgfSwKPj4gKyAgICAg
Lmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKXsKPj4gKyAgICAgICAgICAgICAubmFt
ZSA9ICJ0N19zeXNfZ2ljIiwKPj4gKyAgICAgICAgICAgICAub3BzID0gJmNsa19yZWdtYXBfZ2F0
ZV9vcHMsCj4+ICsgICAgICAgICAgICAgLnBhcmVudF9kYXRhID0gJihjb25zdCBzdHJ1Y3QgY2xr
X3BhcmVudF9kYXRhKSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAuZndfbmFtZSA9ICJzeXMi
LAo+PiArICAgICAgICAgICAgIH0sCj4+ICsgICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gMSwK
Pj4gKyAgICAgICAgICAgICAuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5UIHwgQ0xLX0lTX0NS
SVRJQ0FMLAo+IERvIHlvdSByZWFsbHkgaW50ZW5kIHRvIGZvciB0aGUgcmF0ZSBvZiB0aGUgc3lz
IHBsbCB0byBiZSBzZXQgdGhyb3VnaAo+IHRoaXMgY2xvY2sgPwoKCk9rLCBDTEtfU0VUX1JBVEVf
UEFSRU5UIGlzIG5vdCBuZWNlc3NhcnkgaGVyZSwgSSB3aWxsIHJlbW92ZSBpdC4KCj4+IC4uLi4u
Lgo+IC0tCj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
