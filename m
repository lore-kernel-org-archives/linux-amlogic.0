Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FB6CCF9E3
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Nov 2025 05:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TekzQMB/7ymfhnX5aleag2zVo7KV2as05VIR3uolHlc=; b=jnV7TfS6yW+ZCfjHB3MqABy7oY
	OUSnJYM6+cMUKmSa4ej3+IOFNYHmAo18TeWAin/fj/U0WMFH6rIBmivy/v3JcUbT47QOq6V/HiZug
	xSDxVjbjE5B3KWpsJO8RaK6wpCdLrP6CSu/oCjwZCM0kd4KxoUbZJb2nSDPKcpFWz6iYKSBKUxXCf
	RrAn/QnJvvME4T0cwvzpGsuvedEgL3keWUJ/ZKQK/lnr8R6ocY21Bjtt1SHK8qkv1QJXhFQuds+/t
	mg9queTVHjVpbU60M29jBeleCA5tsfcwop++284L41/zWi9ZwBPIfa20QKP/82HkVHQ3AnYCvDTdT
	bHksU1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG9bI-0000000BBgD-196I;
	Tue, 04 Nov 2025 05:29:00 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG9bE-0000000BBfM-4AA8;
	Tue, 04 Nov 2025 05:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAOVrcZb8NM7Hes8gJHlx9/TWaAsI5f9J2pQnBk1nnrkTdIGMSd7ko+QBSLPRUHZrDFHgunjxiYETXji2JUqPahcCmFPd59YGc3fL6BRBg5q5zyozn1w9GyumrNcmQqm/oYxAiAwWzEUIRgXaO4u9wH6ztryLPlDN9U8FpUOigGpKjB/VdhOhmGl+8atMjcRI73jC5aUu3Ut6swAuXPzpacKHsXNRnKv2boq3/GWiLPm+8CW8NbjhjcBEPoDz3TibS8rd18aX4WfGJc//ncWSNMiIx0mf+JcThc3R7kPRw3sKbCowRGYBeGjuZu2JiLSq3qtIQT0E744l7kdPH+lxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1i+PNdAcUEsp0BMwfot0bE3vOIU0AfEh/HHg9XLLYBI=;
 b=xQiQE75Jv0RkEzS2rCAhQxiLLce9rw78KwHYpPWRYsjuHeDg3gSZxcVV00vzJCeCZXjqckGxhRMZbR0s8n8e3ofEaGw8ojHiKIoZD2CZa/RoPzJzkRg1TZAHtv3ODklXDbo2puYaSD1QDt1IugsCQNebks2TkUtiqS/Bd/YGN+bIgPcliJEQU2eA/cQNsDxgFwZKHUndG09AN0vZNBfCuuKWuOnL57XRGrmlazn8vXR29iyyGnamZHOPfSy2O1ku1s5IokKfj0tiu1FBrD4QMr0JSZpn5IrsT7o8JdBZjZld5P0W2govsSCSeunbegBSe8uQYdWDjCT3lP6wSBM/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i+PNdAcUEsp0BMwfot0bE3vOIU0AfEh/HHg9XLLYBI=;
 b=XaZk3B4UB7mJ8QZhOBHKqqu+v1q8IlKsK0+AKBlFx45HTXwPq59emdOaoxwsT4iLlkq0kXQqbrarGleXAUCemHjcjtnaiDPFks6gnNelCYp0Znd+lqpabOwGpDHCXfmhKK50K+Z1PgOUb8eH7XypySrFuZfAvZgh/iK7bQ9a+3uVTW+6vgkICGDBhD0JiOZkidhMFms8zkikMItYoUEOWTdQb0Kcn8BUQFoBT05nQE2nkCieV99RTthqaWORJqhK/hfu5Adq96PiaP4xxPFnewgvYytGhSbfUQz7xKP8Nd41+djsOOVz0W4LpIggaE+olqQlrlD+H4//YmbMNbNZZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB8585.apcprd03.prod.outlook.com (2603:1096:405:ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 05:28:46 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 05:28:45 +0000
Message-ID: <7a3c9205-8fb8-440c-bebe-090f1c49689e@amlogic.com>
Date: Tue, 4 Nov 2025 13:28:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clk: amlogic: optimize the PLL driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
 <1jms57xx05.fsf@starbuckisacylon.baylibre.com>
 <9751014d-926e-4d42-b8e1-5a4d3e734457@amlogic.com>
 <1j5xbvxchd.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1j5xbvxchd.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8729ca-e3ca-4c13-1a62-08de1b630631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU1Qb2xYZ0cvUXBzcnJETzdZV0RLRGsxbzh5cW1hRXlUOFNIOXNNREpWT3dV?=
 =?utf-8?B?ZHg5TEIwWFI2NU4rak1VYkI0bER1Z3VjdCtEYUNabXQzQm1LQVRDa0ZqeXpM?=
 =?utf-8?B?Q0NYZ1JFQ0QvSDVaeFljZTlYN3p3a0NOdndlT2pYVGVCcGxpbVgrSnBRcXhP?=
 =?utf-8?B?Nkpic2RSMnM0bWxlQU1IckdGNWwxaXFLaDhseFA3Z2dXeVNIVEFmWVlPN1ZG?=
 =?utf-8?B?eTJSUzNucjVvTUJFZ3owV0dGVEl2SEJBaktXUkV4T2x5S1VGMFZRUUtZV0xU?=
 =?utf-8?B?YWIwSWhTUW5RKy84emd2Tjl0cm44Unc5aEk1SWV0YnNTczkvOTV1Q3AvTER3?=
 =?utf-8?B?VWt1aGJURnU2bjdjL0ZNdTlLR2pneW1RS0NPTGo1bUZRQUtTOXZNanV3Zlo1?=
 =?utf-8?B?QXlsVTBuTXFTNFJPWjhEdjF0cm0wQ2NWc3hYWFJsc056TzlMZmpRK3RIK1A2?=
 =?utf-8?B?TVFRdUJHVmVsM0U4cW5FMkpRZzUwM25lVDNOQ0UxK1VUTGVuTEpaWmlnZnpY?=
 =?utf-8?B?YjNBL0NuREQrdzV0R2s3MGVYb05HLzB0K0pPSk9sOTVPWG41eVBBTVZDcVY4?=
 =?utf-8?B?TWxCUyt6OUNYOWxqVURiQ0VhM1VSZGRCQmRxQzNrTndjTlFMbVhKK2tieHkr?=
 =?utf-8?B?amwweTRRVkZXNjdsZmpJNEUvS1YxbndjdGt5bmVaQTNnM21FZi9lVUIvMTRy?=
 =?utf-8?B?RHJkTXd1dHZXS1BDRktpQXlPRWVieUxWMXRlaUljQ1VqVHltYzdSTHZDV0hs?=
 =?utf-8?B?Zm9XM0NPbnZuVXpqWUdxdWhvcG1oMDV6Z09RbUpoY05BS0pBSDZqdFBEMm1W?=
 =?utf-8?B?anF5bVZ6NzRqVGw5Y1JiRUljalk1aWhneThUcnJQR3V6ZDZOS21qYi8rWm9J?=
 =?utf-8?B?YloxSDNhMEc3ZW9KSW8xZnVpZWdONkIzcGtsMTI5cmRWWXNzV0V0bDRQQ2Rn?=
 =?utf-8?B?alkwZmttU0hnQk5oSVZxWFU4djVTVnhIL1ZseWZYWS9YbVRHR1NMVFVLTGt2?=
 =?utf-8?B?cUVKUTBCQXM1aGFkb3R3Y2syUkQzMkE5bGE4b3hBV1VXQW4xT25KTEd3RWpW?=
 =?utf-8?B?NGh3bmdwR29VOTJ2NEp1Q3l1N0h6YTByclM3b1pMUGQ2bU1LTHh3eUJ6Znly?=
 =?utf-8?B?b09RNDBVdU9ibFdPTnR6U3ZvamdIUTZwN1pwUjEwZTZER2VFQjFiVDVSSkVv?=
 =?utf-8?B?N2xvMlFCZTMxeThlVnFvdE1WL1k4QUJXcElyQkdrNW4ydXczWXdHT3hEVktt?=
 =?utf-8?B?bnQyU3YvcGJ2a0ppRE5yY1U0d2JZeERRYVliSll5cHB5UGlUZ0N0NThIeVVK?=
 =?utf-8?B?cFA1cm45alVaTjZTNzNZSkk2QkVaY3p3a0lqVEZOUXhZRDBDTGZlZkxjUG9C?=
 =?utf-8?B?RUx2dlR5TWI1UllvZWVJeDNvY09tWUw0TlhtZU5TNkh0NGV3VnY2ektKTHRW?=
 =?utf-8?B?N2xzY3ZZQkhtZmxBZEo0blJsQjNEVUsrenpRTU1qcmwvSlpRd0h4VFk1Q0FI?=
 =?utf-8?B?b005Z2NZdTF4ZHRpQXRYUUk3VkxWOWwwRzg5Mjl2dVVPaW5UTk82WkZrN2Zt?=
 =?utf-8?B?cmMwYUxTcWlLdEQ4eUt1NUpOT2FpQ1ZlWlJWS1dNYzZqTVFRZ1BDRnBrbnRR?=
 =?utf-8?B?eEI0YjFIR3JhMHpjbktOWDBUc1RTYmZaNTBQNkFDY0twNmQ2L1pYbUhZR29i?=
 =?utf-8?B?VVdjbUVzbjhLZE9uMk5YdFArYXNQTVZ5YTI5UUtpN294dm41MDdtRmg1SUVs?=
 =?utf-8?B?NXlMRmRYd0UrdTVoczRrcEFLemhxVXltTnFYdGtxbTViQS9qVGdlSnAvOVpp?=
 =?utf-8?B?ZVNiaCtZMEhmK2pjSHg1SXlMRlRwdlk0R2lrVXdSVE96YlV1NTZnT0w2a29s?=
 =?utf-8?B?ZHBkK2hjVmJIb3RXdW1uc0Z6d1F1ZS93RG14dW53bTRSQmZBZ3NvWjlGTHZi?=
 =?utf-8?Q?tj6K/fCf/MgvyaBwXgKvZJLdcFL0N3T3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzBzUDJGVHBSSS9kNGhLaXMyOUoxbFBIUEd0bGpEY3kzOHA1bjZlZ3d2cGlN?=
 =?utf-8?B?aVBhNU92Qm1UUi9vOGwwaUhxVGQvZUcvWW1JY0dZdit2Nk9udkdaTTl3M2Fm?=
 =?utf-8?B?NkVPa2FsbDhZc1dIcFIySDh6UE4wOWRBQzlxblQ4MThyYVV3QlFITGRVWGZv?=
 =?utf-8?B?dlAxRHBjK21Wd2ExZWU1aUdsc1YrRUpoTzljdDZWMjcwQTdHRmVJckI4RE42?=
 =?utf-8?B?L1QzUENxZ3k4UldzT3c3c0t3bEpGdFVNUERIcTAzZE4rU0tuaXRwZWFYQTQv?=
 =?utf-8?B?ZlZqNXJ0aitqUk4zQWt1eUc4bEFid0pxN04vOWRNMTlKQ1RvQUxXdmFkc0NO?=
 =?utf-8?B?Q1J3WXptSlltUEh0bmJ2YkVzUHMwYlVxK24rME1uMmh0ZEtTSjZUVTZOTnEy?=
 =?utf-8?B?ZDU1TEJXdUptcDFEeGtwK3ljVWI4Wk1VZnFUcnNyNU9IWnBGS2NhSDBMRkVP?=
 =?utf-8?B?RnlkZkY4Q25JTHIyNk13dGRyYjBVc256YzFvVi9hSHFjdUdoTXhKWU8xZ25s?=
 =?utf-8?B?eUpTWjh2bHB5MlF3Q0ZiMm94WGp1TVRYeEh6d3UvOFBxSEticTh4RFN4MXVo?=
 =?utf-8?B?cDdwci9md0xaNlNENHhoQi90VTc2Nm1OcDg5NUFheTNIQnF4bytSbFJ6eERm?=
 =?utf-8?B?L25VaEhuOTRGRytjeG0wMmIwZkdCWXdtb1I2UTlsRmE3eDkweW9zeDhnMVk5?=
 =?utf-8?B?bDRNd3lQVkVBdFRleC9GellvN20rWStoUnphNFRoZzVIdWNoZzNnSzhEWHVR?=
 =?utf-8?B?YXdjWVlUZFNvOVhRU0J4ZTkrRmNTVHM5UU5GTko3WWg3VnltUWMxU2lZZU50?=
 =?utf-8?B?Qlh2Y1NsVXJnWG83ekJVNmlSOE93UitPM09pNlJVMCt2c3lxaE9td2lJVUJD?=
 =?utf-8?B?ZVZ1WDBVdVRsOWIwTUpqWUVyV1E0RmhMOWdHWDNtNFg1YnhYaHpYdktqanRX?=
 =?utf-8?B?Vk9oZXBpbDN1NTFJNXlIZ2J6aGVrUkxrdFk3RnVPai9IMnpHcTQvR01kb2Fk?=
 =?utf-8?B?WE9WTzQ5eHRhWHRzV1BOb3RjSEw2aDRFZmFEOFJJUEZRTGpjWmxCMkFxM2pJ?=
 =?utf-8?B?NjNXWm9zVnJyQ2FWSDBZdmo2WmJyN1lncU1vc3I1NjBIcldEVUt1UnY2a3FD?=
 =?utf-8?B?THBsUnlXVXRCN0o4QkRQTW5pZnkrMzBkc0Z0SXFrVW8rYmJBOEo3b2wrZUJU?=
 =?utf-8?B?Ly9JSXIrZjhaWVFjaGF6Zy9KUnZxZWNZaWcyRlhNVXFKUkg4ZEpyRXBqalZ0?=
 =?utf-8?B?MGxqUGVlelRJTGpuTTNZZnJRWExnYUUzdXdsSDdUb1pOM2RCZkxlNU55WDhE?=
 =?utf-8?B?b2pyVmhGYWsvemV1ZWNtSFU5blp1Rm9aZEpxTGs0SEVDMUNuZVV5L3pvVzc3?=
 =?utf-8?B?ek00RVdjcHdENy9WcHRiaTQ3ZUVDYWpOcjZaNDZDOEZVZjFOUE8vRXlwZ0Z6?=
 =?utf-8?B?ZWZ5YXZlcFdUZC9RVDFTTlBQeHNhYlpBeDZIOVFuK3pCb1V2M2NkcGJjSkZw?=
 =?utf-8?B?cUZHd050OUpYZE1oOVJWSkdKSWhHeWhHelZiNXBNeFV4N1pra1JkbUNNTUln?=
 =?utf-8?B?K0lqQVBxVE82aTRvOHNLd2lNSnp3ejhKeDVFUDVPTW96TVp2OHQzYjJlQ2pC?=
 =?utf-8?B?cXdCUGZLZ0laZUV1cTY0aUxITmhYeEt0WW52S0lNUTk3TGUya1Y1K3QwMjQ2?=
 =?utf-8?B?YTVQSjhYWGZwNGs1cGFIZE9BZ1JvbFgyeUlTOWRmRmFteGFMTEFvVm96eDBq?=
 =?utf-8?B?MURmYXhBbkFhdzR2QW95Ym02WjlaNDhzY2U4NmpxWmNSaGFkZTZUUlpnTGlK?=
 =?utf-8?B?WXpNQTh5NXh0OU5Gd2dKUUJmMk5YQlBlRzNyUmZSQ1AzeEhoQjhZR0ZKQnVB?=
 =?utf-8?B?aUt4M1lBc2ppK1J4YzhRQy85TzVOeityU0U3L3ErbzVVV1NZdDM4SkFwUlY1?=
 =?utf-8?B?d05kQklBTVcyVngwNWNRb05qRHdqSlpPUnFZSC9WczVjWFNxSHRhZWFpQ3ow?=
 =?utf-8?B?YTYvRDR0M3JIeFEvdFUvVnJ6QmdndXAydUJOMlZSZ1hHZWEwRUZyR1hvOG5K?=
 =?utf-8?B?b1VtRUFrZ1NVcVI1ZkRlUy93dUs2ZEp6UHJPckFmVXl2QWs4NzdQRW5wN21l?=
 =?utf-8?Q?GfriSl628xnQZLOqZK+2F9OxF?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8729ca-e3ca-4c13-1a62-08de1b630631
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 05:28:45.7132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kh2zuqNZ+28MvhTdsrblBPTvM4rg7e1cd0kgBRyti94fZFzOoXKq097DasAVZ1GjAeszj4h2/EiYYnOxQ1B0HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8585
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_212857_088669_7B71B959 
X-CRM114-Status: GOOD (  19.57  )
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

CgpPbiAxMS8xLzIwMjUgMTI6MjcgQU0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5B
TCBFTUFJTCBdCj4gCj4gT24gRnJpIDMxIE9jdCAyMDI1IGF0IDIzOjA5LCBDaHVhbiBMaXUgPGNo
dWFuLmxpdUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4gCj4+IEhpIEplcm9tZSwKPj4KPj4gT24gMTAv
MzEvMjAyNSA1OjA0IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBFTUFJ
TCBdCj4+PiBPbiBGcmkgMzEgT2N0IDIwMjUgYXQgMTY6MTAsIENodWFuIExpdSB2aWEgQjQgUmVs
YXkKPj4+IDxkZXZudWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Pj4+Cj4+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgY29uc2lzdHMgb2YgZm91ciB0b3BpY3MgaW52b2x2
aW5nIHRoZSBhbWxvZ2ljIFBMTAo+Pj4+IGRyaXZlcjoKPj4+PiAtIEZpeCBvdXQtb2YtcmFuZ2Ug
UExMIGZyZXF1ZW5jeSBzZXR0aW5nLgo+Pj4+IC0gSW1wcm92ZSB0aGUgaXNzdWUgb2YgUExMIGxv
Y2sgZmFpbHVyZXMuCj4+Pj4gLSBBZGQgaGFuZGxpbmcgZm9yIFBMTCBsb2NrIGZhaWx1cmUuCj4+
Pj4gLSBPcHRpbWl6ZSBQTEwgZW5hYmxlIHRpbWluZy4KPj4+Pgo+Pj4+IEZvciBlYXNpZXIgcmV2
aWV3IGFuZCBtYW5hZ2VtZW50LCB0aGVzZSBhcmUgc3VibWl0dGVkIGFzIGEgc2luZ2xlCj4+Pj4g
cGF0Y2ggc2VyaWVzLgo+Pj4+Cj4+Pj4gVGhlIFBMTCB0aW1pbmcgb3B0aW1pemF0aW9uIGNoYW5n
ZXMgd2VyZSBtZXJnZWQgaW50byBvdXIgaW50ZXJuYWwKPj4+PiByZXBvc2l0b3J5IHF1aXRlIHNv
bWUgdGltZSBhZ28gYW5kIGhhdmUgYmVlbiB2ZXJpZmllZCBvbiBhIGxhcmdlCj4+Pj4gbnVtYmVy
IG9mIFNvQ3M6Cj4+Pj4gLSBBbHJlYWR5IHN1cHBvcnRlZCB1cHN0cmVhbTogRzEyQSwgRzEyQiwg
U00xLCBTNCwgQTEsIEMzLgo+Pj4+IC0gUGxhbm5lZCBmb3IgdXBzdHJlYW0gc3VwcG9ydDogVDcs
IEE1LCBBNCwgUzcsIFM3RCwgUzYsIGV0Yy4KPj4+Pgo+Pj4+IEJhc2VkIG9uIHRoZSB1cHN0cmVh
bSBjb2RlIGJhc2UsIEkgaGF2ZSBwZXJmb3JtZWQgZnVuY3Rpb25hbCB0ZXN0aW5nCj4+Pj4gb24g
RzEyQSwgQTEsIEE1LCBBNCwgVDcsIFM3LCBTN0QsIGFuZCBTNiwgYWxsIG9mIHdoaWNoIHBhc3Nl
ZC4KPj4+Pgo+Pj4+IEFkZGl0aW9uYWxseSwgc3RyZXNzIHRlc3RpbmcgdXNpbmcgc2NyaXB0cyB3
YXMgY29uZHVjdGVkIG9uIEE1IGFuZAo+Pj4+IEExLCB3aXRoIG92ZXIgNDAsMDAwIGFuZCA1MCww
MDAgaXRlcmF0aW9ucyByZXNwZWN0aXZlbHksIGFuZCBubwo+Pj4+IGFibm9ybWFsaXRpZXMgd2Vy
ZSBvYnNlcnZlZC4gQmVsb3cgaXMgYSBwb3J0aW9uIG9mIHRoZSBzdHJlc3MgdGVzdAo+Pj4+IGxv
ZyAoQ0xPQ0tfQUxMT1dfV1JJVEVfREVCVUdGUyBoYXMgYmVlbiBtYW51YWxseSBlbmFibGVkKToK
Pj4+IE9rYXksIHRoaXMgbGl0dGxlIGdhbWUgaGFzIGJlZW4gZ29pbmcgb24gbG9uZyBlbm91Z2gu
Cj4+PiBZb3UndmUgcG9zdGVkIHYyIDI0aCBob3VycyBhZ28KPj4+IFlvdSd2ZSBnb3QgZmVlZGJh
Y2sgd2l0aGluIGhvdXJzCj4+PiBUaGVyZSB3YXMgc3RpbGwgYSAxIHF1ZXN0aW9uIHBlbmRpbmcK
Pj4+IFRoZSByZXN0IG9mIGNvbW11bml0eSBoYWQgbm8gY2hhbmNlIHRvIHJldmlldy4KPj4+Cj4+
Cj4+IFRoZXJlIG1pZ2h0IGJlIGEgc2VyaW91cyBtaXN1bmRlcnN0YW5kaW5nIGhlcmUuCj4+Cj4+
IEluIHJlY2VudCB5ZWFycywgd2UndmUgbWFpbmx5IGJlZW4gbWFpbnRhaW5pbmcgb3VyIGNvZGUg
aW4gb3VyCj4+IGludGVybmFsIHJlcG9zaXRvcnksIHdoaWNoIGhhcyBsZWQgdG8gc29tZSBkaWZm
ZXJlbmNlcyBiZXR3ZWVuIG91cgo+PiBpbnRlcm5hbCBjb2RlYmFzZSBhbmQgdGhlIHVwc3RyZWFt
IHZlcnNpb24uIFRoZSBwYXRjaGVzIHRoYXQgYWNjb3VudAo+PiBmb3IgdGhlc2UgZGlmZmVyZW5j
ZXMgYXJlIGFscmVhZHkgcXVldWVkIGZvciBzdWJtaXNzaW9uLCBhbmQgc2V2ZXJhbAo+PiBTb0Nz
IGFyZSBhbHNvIHdhaXRpbmcgaW4gbGluZSB0byBiZSBzdWJtaXR0ZWQuIEFzIGEgcmVzdWx0LCBx
dWl0ZSBhCj4+IGZldyBwYXRjaGVzIGhhdmUgcGlsZWQgdXAsIHdhaXRpbmcgdG8gZ28gdXBzdHJl
YW0uCj4+Cj4+IFByZXZpb3VzbHksIEkgaGFkIGJlZW4gd2FpdGluZyBmb3IgeW91ciBjbG9jayBk
cml2ZXIgcmVzdHJ1Y3R1cmluZwo+PiBwYXRjaGVzIHRvIGJlIHJlYWR5ICh3aGljaCBoYXZlIHJl
Y2VudGx5IGJlZW4gbWVyZ2VkKSwgc28gZm9yIGFsbW9zdAo+PiBhIHllYXIsIHdlIGhhdmVuJ3Qg
bWFkZSBtdWNoIHByb2dyZXNzIG9uIGNsb2NrIGRyaXZlcuKAk3JlbGF0ZWQKPj4gdXBzdHJlYW1p
bmcuCj4gCj4gT2hvaCBub3cgeW91IGFyZSBqdXN0IHRlYXNpbmcgbWUgIQoKSSBtdXN0IGNsYXJp
ZnkgdGhhdCB0aGVyZSBzZWVtcyB0byBoYXZlIGJlZW4gYSBtaXN1bmRlcnN0YW5kaW5nLiBXZQph
cmUgaW5jcmVhc2luZ2x5IGZvY3VzaW5nIG9uIHRoZSBkZXZlbG9wbWVudCBvZiB1cHN0cmVhbSBl
Y29zeXN0ZW0KYW5kIGFjdGl2ZWx5IHdvcmtpbmcgdG8gbWFrZSBpdCBtb3JlIGNvbXByZWhlbnNp
dmUuCgo+IAo+IFRoYXQgd29yayB3YXMgbWFkZSBuZWNlc3NhcnkgYmVjYXVzZSBvZiBhbGwgdGhl
IGNvcHkvcGFzdGUgQW1sb2dpYyB3YXMKPiBzdWJtaXR0aW5nLiBEZXNwaXRlIG1hbnkgcmVxdWVz
dHMsIHRoaXMgd2FzIG5ldmVyIGFkZHJlc3NlZCBzbyBJIGhhZAo+IHRvIHN0ZXAgaW4uCgpJIGZ1
bGx5IHVuZGVyc3RhbmQgeW91ciBwZXJzcGVjdGl2ZSwgZXNwZWNpYWxseSBnaXZlbiB0aGUgY2hh
bGxlbmdpbmcKcHJvY2VzcyBvZiB1cHN0cmVhbWluZyBvdXIgY2xvY2sgZHJpdmVyIGR1ZSB0byBo
aXN0b3JpY2FsIHJlYXNvbnMuIEkKaGF2ZSBhbHdheXMgbWFpbnRhaW5lZCBhIGZyaWVuZGx5IGF0
dGl0dWRlIGFuZCBrZXB0IGNvbW11bmljYXRpb24Kb3BlbiB3aXRoIHlvdS4gTXkgaW50ZW50aW9u
IGhlcmUgaXMgc29sZWx5IHRvIHByb3ZpZGUgY29udGV4dCBhbmQKYXZvaWQgYW55IGZ1cnRoZXIg
bWlzdW5kZXJzdGFuZGluZ3MuCgpGaXJzdCwgSSBhY2tub3dsZWRnZSB5b3VyIGFwcHJvYWNoOiB0
aGVzZSBvcHRpbWl6YXRpb25zIGFyZQpiZW5lZmljaWFsLgoKT3ZlciB0aGUgeWVhcnMsIHdlIGhh
dmUgYWxzbyByZWNvZ25pemVkIHRoZXNlIGlzc3VlcyBhbmQgaGF2ZQppbXBsZW1lbnRlZCBhIHNl
cmllcyBvZiBpbXByb3ZlbWVudHMgaW4gb3VyIGludGVybmFsIHJlcG9zaXRvcnksIHN1Y2gKYXM6
CiAgIC0gUmVkdWNpbmcgZHJpdmVyIGNvZGUgdm9sdW1lIGFuZCBpbXByb3ZpbmcgcmV1c2FiaWxp
dHksCiAgIC0gU3RhbmRhcmRpemluZyBuYW1pbmcgY29udmVudGlvbnMgKGUuZy4sIGNsb2NrIG5h
bWVzLCBjbG9jayBJRHMpCiAgIC0gT3B0aW1pemluZyBpbWFnZSBzaXplCiAgIC0gRW5oYW5jaW5n
IGRyaXZlciBleGVjdXRpb24gZWZmaWNpZW5jeQogICAtIEVuc3VyaW5nIGNvbXBhdGliaWxpdHkg
YmV0d2VlbiBBUk0gYW5kIEFSTTY0IGFyY2hpdGVjdHVyZXMKClRvIGFkZHJlc3MgdGhlIGNoYWxs
ZW5nZXMgZW5jb3VudGVyZWQsIHdlIGhhdmUgYWxzbyBjb250cmlidXRlZCB0bwpvcHRpbWl6aW5n
IFNvQyBoYXJkd2FyZSBkZXNpZ24uIEltcHJvdmVtZW50cyBoYXZlIGFscmVhZHkgYmVlbgpvYnNl
cnZlZCBpbiBuZXdlciBTb0NzLCBhbmQgd2UgcGxhbiB0byBncmFkdWFsbHkgc3VibWl0IHRoZSBy
ZWxhdGVkCmRyaXZlcnMgdG8gdGhlIGNvbW11bml0eSBpbiB0aGUgZnV0dXJlLgoKPiAKPiBJZiB5
b3Ugd2FudCB0aGluZ3MgdG8gZ28gZmFzdGVyLCB0aGVuICpyZWFsbHkqIHBheSBhdHRlbnRpb24g
dG8gdGhlIHJldmlldwo+IHlvdSBhcmUgZ2V0dGluZywgZG8gbm90IGFzayBxdWVzdGlvbiB0byBp
Z25vcmUgdGhlIGFuc3dlcnMgYW5kIHN0b3AKPiBtYWtpbmcgcGVvcGxlIHJlcGVhdCB0aGVtc2Vs
dmVzIG92ZXIgYW5kIG92ZXIuCj4gCgpUaGFuayB5b3UgYW5kIHRoZSBvdGhlciByZXZpZXdlcnMg
Zm9yIHRha2luZyB0aGUgdGltZSB0byByZXZpZXcgbXkKcGF0Y2guCgpUaGVyZSBtYXkgaGF2ZSBi
ZWVuIGluc3RhbmNlcyB3aGVyZSBJIG1pc3VuZGVyc3Rvb2QgeW91ciBjb21tZW50cywKYnV0IEkg
bmV2ZXIgaW50ZW50aW9uYWxseSBpZ25vcmVkIHlvdXIgZmVlZGJhY2suIE1vdmluZyBmb3J3YXJk
LCBJCndpbGwgYWN0aXZlbHkgc3VibWl0IG91ciBjb21wYW55J3MgZHJpdmVycyB0byB0aGUgdXBz
dHJlYW0sIGFuZCBJCmNlcnRhaW5seSBob3BlIG5vdCB0byBiZSBwZXJjZWl2ZWQgYXMgdW5jb29w
ZXJhdGl2ZSBmcm9tIHRoZSBzdGFydC4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
