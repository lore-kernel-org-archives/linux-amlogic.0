Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96941CD37B6
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2024 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhojTG0pNbrG+ju9oMTBPImDpEfMUa04ulFZOpdr8c4=; b=HBUBfgnA/sCTmsKowC2wZo34I+
	67HZpp4gPqZV/+ImqXNRfzKAKMwT4QQBesH1kATiIK89r8/jAlzfc3T22sB2NUH+wvmzFP6KclHGM
	kC8hbMqU5xbzpWE+vxKxJ0+Rs/dsyuR1jrf+HevYf7iPB6qjHRXxzNX3d1EBVDwKQyxCb7VIg8+1d
	jy4hRNuzG2rarNv4lJdOhnlHOkf/fzwL+zB9y1pA2L05wAVVPPZjhn7oso1iZFWEeMeNLnSgmCxk8
	jWaicO/bbhzqCNjRgyZbtItweaq+PXp2n+Obs2eYW3yih5S9DF48Xs/roTeFtz+QOI07VKFG3tDBK
	M1bIAd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllSX-00000003QSC-1PoG;
	Wed, 04 Sep 2024 08:33:49 +0000
Received: from mail-tyzapc01on20704.outbound.protection.outlook.com ([2a01:111:f403:2011::704] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllER-00000003MXM-2mO6
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Sep 2024 08:19:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQWvY5l1MILSj2DJHBC1n5g1zmAV1c1ZmRrxQy3JGyVMUm9793z42P4UW2gnReOJT3VDyfRctXOCOUgnXXPcO3y5yr096wxVhyX1/HFB+M41NEpq99XxqdxV89PrHyE03GW5rorEhRdwrmgeihmrB6E0eUAZciycxaq8fm/uycfC/hs+9qEh1x51WkUGiui7UjjDwUu7+0ZB6E30s9N+Mm/GX7Y1KfW8TtLAjgNp4g2iu6nd6wGXd38uCvlNBxbJvJ8p16EzYICKNzOr/flDWro6SZLWofvqOoL6UfM0MXj/MtxH/d4xa9HzSs0p4pDyhUBiFoEhH7MT4G0rit1o2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc+47N4vJ1n1LPjfgLrriwNF2Wy2cvn3K4/b4cmkgf0=;
 b=tAiw3FoILCSqg6MdKKCte6vxcUMOJTja/wuiwniVQOIlHxnwk2/Sh25A9zZGdlJIIRjeeKI9wTIVSDFQr0GzoiJPSkOWIKXONGXRGl9PJlKS49iwIuClDr03jr86pDLAnlUBSuK5VE0khudRY/raWR8h3iP2k+U8UYE6pkTeJ5AwmxBmbI+3ewdeNxsUTkMdyAME75VInPZHaYENCPizSsrA5hl3xUi9b+LMXISxsPdFUNWV5URAPQwxcAzaAeUm4SJ9Zt33Ml0HQmqk/A6x5Beiuf/4b87ilEoo9vvWWL5nFTWLcjyhTrUVMx8QQLaNlJsAW+KLid6tZKXjSmLeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc+47N4vJ1n1LPjfgLrriwNF2Wy2cvn3K4/b4cmkgf0=;
 b=rrORtaMxdS75tK+uctdxjYXMNK004UeIvtsg4W781qwTCGnd4ZJSam8MwgAFPV3E0uwK3UdpqHUTDF3IX0l/V9SI29KgzSd1Ac8cyZSaRtb5UNhAeeX5oNgf/+tQ6CjCvigl2DcF+E5kHLXez3W6fqMDbNOcf7f7aoh2Nwi9Z9dfE9pNJas5FacMIllJbaJojTDusZc+c88PHdHyrURxpGSlezO4Ju53nefWQE+OVBmvG2b2ckomyV5sRefOts/a/7rFM/KL4nLh3Sb8nW2+6OSmAc6YxEwVLoy3ygpCAnEKnxJ39mXmxRAYXgqV15hwj9L0Sax0QXc+KFqwEFZkkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by OSQPR03MB8574.apcprd03.prod.outlook.com (2603:1096:604:27c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 08:19:00 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:19:00 +0000
Message-ID: <a886655a-f88d-4ffd-93c7-89819f54b0c7@amlogic.com>
Date: Wed, 4 Sep 2024 16:18:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 rtc
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
 <20240903-rtc-v2-1-05da5755b8d9@amlogic.com>
 <2528f40c-9d4d-45b0-b02e-af88e6f02a7f@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <2528f40c-9d4d-45b0-b02e-af88e6f02a7f@kernel.org>
X-ClientProxiedBy: SGBP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::24)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|OSQPR03MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: e56aa57c-3519-4959-bd64-08dcccba3ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alJDWGFEZlc2Yk10OEoyS3YrYW0wRElQUUpjQk9lSDJlNnpoMVJiMlhYamJ2?=
 =?utf-8?B?VE9sUnVMdmF5S1ljbE0wSjFUUitJT28zWFk2UG9KbHpRV0Z0ZmRUMUZaZjZT?=
 =?utf-8?B?dkxrZnZET2R1YXc5dVBONDJCZ25ZdDBva09PRjZwNGpSbVZENkVzNElnUWFs?=
 =?utf-8?B?ZG95cWZDaXZ0em5wVDR3KytxVzR0a25tSWhCWC9hMS9Lb29OVlBsUnd5Mm5C?=
 =?utf-8?B?NlRxUDU4aDVYUzEvMDY3aXh3UTBRSzUxc3lLVXM2bEJJSmhQNG1NZWdJNjJH?=
 =?utf-8?B?Q3g2RjIxeXozRmJNUE1ES2ZaSlRGVVBTT1NBemdFZ1BINXJsY3BjQis3d1hz?=
 =?utf-8?B?RHUzNnJDdHNNeHU3VjBsMGZCSXNYcmdjTkZMOVA5YzBzN3ZGNHZBTXZBR3gx?=
 =?utf-8?B?K3NzNjJYUTBsK1R2K3MrM0VIVDRDQkMyVm8wUHhiZDdxUHZOOExYUFp1Vm11?=
 =?utf-8?B?bEVSbDhhTElPbm5KTHFCMks2Ui9HNXVJckxWSnNUZkErTnplMnJFZTVuSU16?=
 =?utf-8?B?azFPc01NcUFlQlZhS1VLUWJleVlHeGViKzN3QzBwMWIwV1ptdEZvTkk5WFcw?=
 =?utf-8?B?T2xpZ2FHV1hqOGpBdGpiajExOUZJT0UwYTcyTkx0eDFxRWhyV0pYUzk3TmFz?=
 =?utf-8?B?M0hya3VoZ1g1QlZHMUducjB6RVpYcFhRTXFrWTdFQnJmb0RHM0JrOXM2MERH?=
 =?utf-8?B?RE5OS2F4OEg5d0VwWkhYYlo4QlI0aktRR3hoZ091anVTTUI3b3YzU1doMnpo?=
 =?utf-8?B?NjVhNFpDQVRvOVhFQy9NaHJLR2tNb3kyTjltdGFqY3hkR0ZXQ0xCRkM5bUhP?=
 =?utf-8?B?YWZIK216SE9nOEs5Y3VtV2RjbGRpNldJSkdMRXVwdi9QUFBWejJYaHcvVTFi?=
 =?utf-8?B?Z1M3elRVcmgwZFpzaEdYVFRJbU9WRG8xcld5bWgvWk5pR2xrRmVBeGd6Q0Ev?=
 =?utf-8?B?dDZqcEdVei96OHQ0YmpEQXBJbGhRUm44VWZncEtNNEtLK2NMQ0xiWVltWStG?=
 =?utf-8?B?UlpsR0ZVTk9QQ3h6SFdBbi9vQkcrTHVqWDc0QnZMQWp6Mm5QRTNTekcyQ0hV?=
 =?utf-8?B?NWdwRlBleXdYMVIxWUNmMnFncHdaRU1STGhKRFZVL1lINVVIcUsrQXB1T3N6?=
 =?utf-8?B?dVRjUEhEUmdqQ3VydTJGY3BpWllISitZTHUwU2Z6YXR4NWw2eWhGelNadkYw?=
 =?utf-8?B?QUJ3RWt3RHYyUXorZHZOU3k4VERhRWh1TnFVdE80Wm5zaW9la09vQWh4aElS?=
 =?utf-8?B?MzVsNllkM1NKQWV5MXdZbGRmeHlDSnJRTHk2SmNqUkJZdnBGUVdQazJmWkdk?=
 =?utf-8?B?REJnUSs2b2ZWUEhxU016WkRGVzNhd3NLeGlTYnFHbm5pckpiYytEc0lzZVlF?=
 =?utf-8?B?SVdndmlLT3E1eEhnMDFLL3drVXMyVExZcTNRL2syL21XaWU3RytZeE9GMWdW?=
 =?utf-8?B?VVUvWjIrSFJ2NWcwSnhNblZhcXltNGd3ZW5iY3RCVDJWd2U5TlBFeG13MHJp?=
 =?utf-8?B?TWQwaDZPaHhFeEt4WHlPRWlmY3c4MFFzci8vQXNjbVVSSjRrQ3BsaktzQkxy?=
 =?utf-8?B?ZUQvVXF1OUhuK2FvNUtKOUpzWDkrNkQ0KzlmVDZoWDJvQzJVd0NWbmpiLzZ6?=
 =?utf-8?B?UlVUTzNjYklreFF0ZmZ5ZmsvOWhmRlVOeHBidmw3Y0NuY1ZzcWtaSlBOU3Vp?=
 =?utf-8?B?NE0rTk82NE5FeWhzUGdGNDhnYitPWjlTV3pGdGlmT0dDUDRaVlo1aTlKWEZ3?=
 =?utf-8?Q?VrUmhUpASVXbFYOujw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXQ4K0JubXc2UVlzNkoyZlFieGVUWlZSQlpwTE11TzhFWmRGZFk2TGlnd2tE?=
 =?utf-8?B?UkM1SzMySVovdDFLakgxV0pjcFFXMUppd1RuVE83MWF0cjhIUWhGR3lqTUNG?=
 =?utf-8?B?dlNqV0ZYREdraUNHaEdHL2lWZkdYdTRESlVFaC82a3E0UkN1RlNzWkpHUE9t?=
 =?utf-8?B?VDVwUmNKQVRkNy9rWUNTc3BpYVhFWDY2S1JvZEpXV2hFQ3Z6SWZVcEx0ZUda?=
 =?utf-8?B?RnRMWXdxQkVabWhkMXJRSDB6ZTBaUVQ1ZjVUMlMwcDB3OUJOdDFibmQvS2tU?=
 =?utf-8?B?VkM2MGFxMDlNSGkrRU51MjFxeWF4bnVDTTlwUzFqVGoyUFJ3WnlNMTFsVEx5?=
 =?utf-8?B?ME5yWHFGQnRYeVdOWnRIV0Z3RXBtM3VmZ1FTRXdxdW5BL1BDTGJ4bUE3eERl?=
 =?utf-8?B?Z1BCc29WMVFBZDNZUllYcU1VS1VJQkxZeUFHMnp4YXR5N2ZodnVkclR3RWhG?=
 =?utf-8?B?NklUYkFyYXB3Sm8ydFZqbzNuMDR0V3pkRjJMZjR2UmFIWUZEL3RpbTVSVEYw?=
 =?utf-8?B?R1BYdmFGQkVvejlLMmV6a21wVFpKdFNwZHFDUTJJY1VzODF2cnhqVUdqK0ps?=
 =?utf-8?B?cXVOOUVQZ3dtYUtKRHBHTVB2QUhiWHA2WHczUU5SSXlOTW9jOWVvUlExaUVy?=
 =?utf-8?B?WFQ5aDN0YzVGUnV6dElsWEt0TFZZYk9mRW1TTldqYkJRWXZRWjI3TTV1aWYv?=
 =?utf-8?B?UFhEeG0zdHlmZ3BzRjBLUGl2ZC9pamtVZyt0andjaWNVWUM4bnRTN28xZFVE?=
 =?utf-8?B?dlMvYzFoV0lOMG85TFlMOWd6RWpQdHNyZk1MTE5ldVV0SHZiMmRwZ1ZFdi95?=
 =?utf-8?B?SWg5NzA3cWYwbytZSXhvS1BvWTYvRjlZeWtsc044Wm44aG8wR3BiV245OXE2?=
 =?utf-8?B?WUVwZDV3ejEzSkVKWThXaFB1ZUFITitEb0Y4OHZSUU56TDlYZWZxanRjcFlo?=
 =?utf-8?B?bytYWTZ3V0ExOGIrOU5ldlg3YjVXdERiRnhvdVZWWWw4OHovZmMrSE0wVFdl?=
 =?utf-8?B?WVBUdE5BQkhEVXVyWklDeDBaTFh2N1hjK3MyN2tFdnBRcndtS1FBL1JRWGZE?=
 =?utf-8?B?M3NORVFNUFl1Mld3RGdUalJ4OXpDMko0elEyaEFQQWNKTmMzWk9qOWczckQz?=
 =?utf-8?B?THhvM2ZxcWZ5NHlQcWRmTEJTcGdzazlzbFBiZG0yOEQ3V2UzWmwzSVFKb1d1?=
 =?utf-8?B?cTZPdXdGZ2lPK1QvM1hnbmt0eEN5Vy9pSFR4WExxYlRucjI1SytUTHVjNXZJ?=
 =?utf-8?B?blFJQ1F2TG4zUDFlMFFWZlRLNVpPVm9VK3ZOYWJoK1BGSGEwZ042aFMyN1Zl?=
 =?utf-8?B?MWlKZUxhamUxZzVRS01IS0tVQkcyVEhXcFRhUXdkaUtZK1BGUFhBN2RCSlg0?=
 =?utf-8?B?MFFuYnlpQlI0YUN3RzdaMWg0YmM2Q2FiWUFjVWhoOEpuRHA2ckFBNVBQRElK?=
 =?utf-8?B?Vk5QaXFRRzJGa0tNVUFsSlNEVWpjeWFYTHdKTjdhQ1FISnp6WDY3c0hDVmZ4?=
 =?utf-8?B?U2FGcVYrbUZ1Y2VrTUVveDFTL1JGY1JTSTZYY3VaWmE1RTFZSnZINkNwVnNO?=
 =?utf-8?B?R0NJOTRrZkZaQXpmdnJlVmFyWE5CUTdiclFUNEFNQ2pYUW1uTDUxZWFxNlAr?=
 =?utf-8?B?Q3g1QktBVXpReGxJTXhUSjQ2QU14cFBkaVBwQlBGQmgvblpQY0xyWHdZckgw?=
 =?utf-8?B?cHFlTnkrL3JoVHFSVWtXZGl2T3cxa2NWWE5mQmZHdzYvT2NnOTZlTnVPVUpH?=
 =?utf-8?B?eVp1THZKRmk1MDBjdldVTDB3WlVtc1FyYlc4T2dEMEpIak0vcjIxM3h3M2lV?=
 =?utf-8?B?WmVlQXRsOVc5SmNVajBSaGZvdzhYemxIS01JM2tabWg3R21SMkpLSXFMMjRy?=
 =?utf-8?B?eDVkUkI0YVhROE5CRWszOU9GYm1mZVZSTkFoaUp4RXFVUW93YTdmSEx0VnpX?=
 =?utf-8?B?dG1mZGluK2IzL3MwK3dsTmZZRkUrRDFxUHdOYWpRNWx6NktZRVhGeXNFNHRp?=
 =?utf-8?B?NjNvZzZvUXpPQTVzMmNSWFd4VDZWeDRBWVAwVjZMcTRaZytodXF6dE9udzBr?=
 =?utf-8?B?VlkyN3N1cjR2Szh0M0x0ZThTMWFtUXpyMzJ1UVBYNnVtdWpWRGpieUhvQ1hI?=
 =?utf-8?B?UEt5YW1NR2dRem1BTDA1WHljdmtheThlOVVHY3FlcTRYVVFZMGpGYXJKUlRo?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56aa57c-3519-4959-bd64-08dcccba3ac8
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:19:00.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fsCVN4I4zjGfQe2v+mDrJQJZqAWVtBro1tQ/uVdMR1xAOZJvRkIpF/zb85uy3fxLUYNc7mahN3zwCzdhIHY19o87qXsxI9pj/SuW3Y7Bks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_011915_744334_2F6FFDD2 
X-CRM114-Status: GOOD (  14.54  )
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
    Thanks for your reply.

On 2024/9/3 22:03, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 03/09/2024 09:00, Xianwei Zhao via B4 Relay wrote:
>> From: Yiting Deng <yiting.deng@amlogic.com>
>>
>> Add documentation describing the Amlogic A4(A113L2) and A5(A113X2)
>> rtc controller.
> 
> RTC. And no "controller".
> 

Will do, describe it as "Add documentation describing the Amlogic 
A4(A113L2) and A5(A113X2) RTC."


>>
>> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   .../bindings/rtc/amlogic,amlogic-rtc.yaml          | 66 ++++++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
>> new file mode 100644
>> index 000000000000..128c60b623e1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
> 
> That's odd filename. Use compatible as the filename.
> 

Will do, rename "amlogic,a4-rtc.yaml".

>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/amlogic,amlogic-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Real Time Clock controller include a4, a5
> 
> Sorry, that's unparseable. Either this is clock controller or RTC. What
> does it mean "include a4"?
> 

Will describe it to "title: Amlogic  A4 and A5 RTC".


> 
>> +
>> +maintainers:
>> +  - Yiting Deng <yiting.deng@amlogic.com>
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +description:
>> +  The Amlogic new chips used RTC module.
> 
> This tells me nothing. Please say something useful or drop this.
> 

Will drop description.

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
