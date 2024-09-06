Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B137CE7AE9
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 08:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uJLq240nTKWWeHvwtuyiHlC681JQ9afjbgA/Jx4Ykw=; b=VpZRAm6zQTFupWGrRAeg2hP4P1
	U9kebFBaWFMw5Qke5G3ufywf8PYbVidTjwg5fFyY7JQsdWlH32/Qi/mEAq1COYJW9KxdrNKDaSIEA
	5ZU04EnkFMoy5B4ODE8pt259ma9ojH/mxRpRlRSrKz7Dox7dAq7WkRcJZOjEAHNcQl7dwa/foUP6z
	kcd4A+kr9bYX7KWRfWiRgcnk6NLv9tlcITUMtsa0S7oVP5pmVsTAWEELGw4TBlAfZqt5aBFCBJi6/
	krTmGEj8RoL7JB9rIQS4fPT2StLszx791XdwqCHNlSwwFji0YQJpUnpx+l9r+VrMamchBBE5xLnog
	C6rMRFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smU7I-0000000BFuP-137c;
	Fri, 06 Sep 2024 08:14:52 +0000
Received: from mail-sgaapc01on20714.outbound.protection.outlook.com ([2a01:111:f400:feab::714] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smU6H-0000000BFfd-1wki;
	Fri, 06 Sep 2024 08:13:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQFFMJefpbP2UWDtcQHfmNNbkmzHtWv0sLaiXwIt04nOy8UPUOjM88vuOjl+jza5Q4qkvComvowDm0n/9BhChGibhfvrBSqRH2mda6cIX+dFFACEztF3JNdw6Uif+Uzb6jkFqAaBdnMXVvX/yne+0pNaogzRJgHhz/U6SyQbEdTnRg2shehosXCqxhuQKmwUn9rwjKggWCe4mujpTrZTJnZBWK9YiyHeVpT3Er2JdgL7psXR7dFiHXXMKRFaaZQTaw3AKx4ngOkMwQIS0RRaoLuzXczxuBYvIglirOa4wGFMZxFHRFNra+EdkW/QzbzNfigyp8BUu5b9RfRgZ919gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGjAOgKpVinZ4T8BB1bLKFcKSKrnINQ6lGHGKzYA8Co=;
 b=rkiv4RhQUXsw3RAaNSEdbrdieO6BjUeMRxHcKPf+cYhRbQOHtf/0ipEmS0WzgBPPDIS/6QM5jda7ac6hjABS5oydMsFDsjMwS6rFvmSd8bHiVI+88iRlOUhswoe2ZKgqc85zBvwektDSxY8rRHokwmpSVhcNggEvWnEiVA2vtzHH99emJVdUM2ZQFuxob8wnWFrbQq84IvTALK+lGBdCBtcMs1x+IwiL/SGbTIz9mBGL5o7nC6xEWbc8JVcJ3Nyz4KQGZxDVhP7FV9YI778mJeITpZCHvKbwA0VGdXTh6wqDs07UBMc7wY0qD8Rkv+lO9BwgRXmdR6JjuO4hkKViXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGjAOgKpVinZ4T8BB1bLKFcKSKrnINQ6lGHGKzYA8Co=;
 b=ZyT52GoS3sWdXmJMKZIWgdx8yFV0BY7u/HHpApkYiu9Swub76V+ODSbovrvjDZHSYItOfsf0PAGwo5rFeCoVN/yCAH0Ip5w4Pi6qtjII6C4EWSnaKwm7Ogco17vaOp25AkoGm9sF/taa7dSRGe3qDAGcLc5N7vpsSQm0nNwZWfJNXI5A5dA1WGeg3Y4KOpteWzqemqFILygJVfCcxwcshQExIPMN/strNoqcYf/0QqjwBdfRM0pkNnMWTQL1cT933s6VEevrRqJfghevJaTRaaiq4wfN8V7lxBlfVn3YzEty8bENJQNNWZEkK3JOZJcbA8YYX/ngxpB4m5Lv+x5uig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB6470.apcprd03.prod.outlook.com (2603:1096:400:1ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 08:13:38 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 08:13:37 +0000
Message-ID: <ceb00323-7956-4259-9f12-08045396da89@amlogic.com>
Date: Fri, 6 Sep 2024 16:12:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: meson: Fix an issue with inaccurate hifi_pll
 frequency
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
 <1jo751qn4u.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jo751qn4u.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: c3df7a12-c356-4e6e-99fa-08dcce4bcf64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3lWd1cvdVVBZW15Z0RmQjdNU0VYM3hvNkErVjVibkh1N0Zwa2M3SHVmSTZD?=
 =?utf-8?B?UkwrMGxpbDZheDhRSDNrZ04yNzdreVZmVUVLbzJ2Mks0OGYwMmVOQkJxU1JH?=
 =?utf-8?B?YUVsSU9EUFcxWG5lVVQwanJBcXVnbk5nL0lqMHlOUTE5U1lRYXVZVzF5Y09t?=
 =?utf-8?B?enRoWVhXa1Q4TG1CZDZOVUtkMFdnTk42eGZyZWtWKzl3bFM5UmY0R0N3eWhG?=
 =?utf-8?B?TkVHTjhBRVpxUllYd01NNTU4SUVJSkIxMlN5d0VIdTF4cks4NG96aVRhVjNw?=
 =?utf-8?B?cnZmN2U2YmNFeVBGRkdld3hkQkJDNncxKy9YSlZjeldSL3V5YkhLM2V1VmIr?=
 =?utf-8?B?VXhLSzMwM3czazMvV1dsWlZsYS9JSUh3Y2ZVZUFGazlLb0pEODlJa21LeTlS?=
 =?utf-8?B?dHEzUGt2ZUJ1bEtOZFJGb2NvNnhYVkNTMEtFb1dZbEVOcEd3YjhYaTRNUVFt?=
 =?utf-8?B?MjNuM1JIbDNtZ1dpTXkvVWEvREo0cUtmQTI5Qkl6ajRBVWh2WlZEZlY4UVJU?=
 =?utf-8?B?RGRWUC9yZzVka2taNWw2Y1VZQ1htVTdNVDVtZ3BZL1JmSUhkS0N6MVhrWmRV?=
 =?utf-8?B?cWM0VlFFVDJRcWJyUzRKL0hnTmtDYS9JNXFuVU9wenZLUm5heGtaWDI2QmxH?=
 =?utf-8?B?NytkdFZZRWlzWVFBN1J0c2ZXaTBKMjg0VEh0RjVTejZvaWhHTWFwTFYzdk0v?=
 =?utf-8?B?WGlONFNYMUtWU0ZPbTY5cjBmTUgwbWFBR21JN3RMcThDUUxRbHo5dUo3WG84?=
 =?utf-8?B?OWVhbVgrV3hIUjlsL1krc2VDSjN2QjhvVWtIQmQ2LzZ5bldOb2pGbGJJN1RF?=
 =?utf-8?B?R1J2REMxb09BNmlsOHlFazZqdklSUlYrQmVWYmQ0T1lObTZQWTBObDhYcm9p?=
 =?utf-8?B?cHRjWThqeENjUlVWcUM4a2Y3aHV0N0xKcTJFcmx6TFYyWDBBQ3E4ai85K05q?=
 =?utf-8?B?Unh2WUVhejNoeWZUaHBiZWFmNEtCSVZkalp3S2w2NTBSM3o3dUs2NHlqc3lq?=
 =?utf-8?B?ZkhaN1M3bFV2QnBETldmMlJWbjgvSm5VUWNiV1VUQkhZc2pEUVFSMTVYVXA0?=
 =?utf-8?B?OS85SkJ1THlpdnBnVG1hY3ExbHhldUJHakVYQTR2U201QlAzTU9EekdpczZu?=
 =?utf-8?B?akc0VWU5Vk9obk9zVW5OM1BvNVNEem9VaWsvQ2JZU2tVWTlUNUFHS1dIQzNC?=
 =?utf-8?B?ZTU5dk93Mlcxc0huMEkrRlVhdUFOQ1pZSkZtUzE0UndZcjBxbUxKUTREZitS?=
 =?utf-8?B?eUVVbmlGeTd3UExwZFBoM251ZThVSGlPTHhIRlNXdmgyRlZUcmxmYTVNbDdI?=
 =?utf-8?B?NEwvL0hhcnJPVnV2T0J6c2ZoSCtJTXIrSytwQkIyUnlqZ2ZCWGsxc25ZV2ZC?=
 =?utf-8?B?bjU1RnpuU3BMYnhyNFY0eTdsU25IbS9aSGR2UURTTDV4Ky84V2pYS0pYdER6?=
 =?utf-8?B?SkJtSkY5WDhaajhUTWpEYks3bWkxNThPZkZ6TlNDSWZlZHhONDBJTmh4enpR?=
 =?utf-8?B?dlpHU1BKY0pGbTU0cVphdGZydTEreGFVVXloVmNMUUt1VWZiY2JVVnBLYzJi?=
 =?utf-8?B?U25EV3d0U1hyaUZJUlBQR1oyS3pNSHZXb0tKTGpIN3pVQkd4Wmgrb2ZuY2Y2?=
 =?utf-8?B?NnJrWDM0STJUNW1iL2JNMytwYXZzZzliUDZZOEZmaW1CS1Y1a3F6bTJtem5F?=
 =?utf-8?B?VXVlcVdOeXlKNEt4SjEvVG1pdVluOUkvdVZrOXVRVnJlU0ZsVkhtL2FITWI3?=
 =?utf-8?B?RjJsVldNcmVEdVIvYkRSdVVSZUF6N2tDUThMN0tJZHpGQzF5ZFhyTENDdTFa?=
 =?utf-8?B?ek01a3dDMXJFWGdsaTk4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEhDcHZiQWdHbVB0d2NXOENrUk9vUWgzeFI3UjBwVk56RVNybmxlaUEvVGZY?=
 =?utf-8?B?dktTOTBjWXJXY1JzOG9QQmpIRFBNY2hQTXBVd1ZkMGFRcUlQeWU2MThIL1o1?=
 =?utf-8?B?THBSckZlNUV6ZCtDMWVRRFhrcnlVMi9qTkJoWmZVWko3NEQreldtWkNhRnpG?=
 =?utf-8?B?L1FXdXIzK3pjQmhlVkhGMm5GSmlabkVBN0JSTmpweUhYNXFOTEtPWlQ5S0Y0?=
 =?utf-8?B?MEhSakovcmxLbEpTR0dzMEE0WFVsMUp2V1I0RU9hYnQ2TEdmMEo5TGVuS3ZM?=
 =?utf-8?B?Nk9rQTlJOTdCU3FxMkRhdGEzb2gwQkdqbnUwTENBY3hyYVFNMHl3MDV1dmhU?=
 =?utf-8?B?M2k5emYwU2tBd1hCYjB0c3pwZERsTDUyRGxoNFFxNW80TEZib1lQd3VlOElP?=
 =?utf-8?B?S0xQaFgvdlFvRFY4RW5xY0xIaWkrdnFPY2psa2dySWJSSUNsd2liSWdqTTFm?=
 =?utf-8?B?dEVaQ1I4VDFUblIrSVpoNkhVeXNVeFB2RERqNE51d3E3K3N2b2RPaS9aTTR6?=
 =?utf-8?B?VDBYamM4T1Y2dkxyVnhka2Rsb2h5cnk2UjZ2STRubGVuQXNtVG9kZzFtMWU3?=
 =?utf-8?B?Yys2TWJDSUFRV05yLzNqUEhoZ0MxUExRN0w0WHV6dzAyMVZkMHAwdWM4VTdD?=
 =?utf-8?B?NDk2czg5NDR6dnVURS93bFE5QnFoTFJJNGRDZmsvNzdzYTJFRVNiZ0dUVFAv?=
 =?utf-8?B?L2Nyd2tETjhCSlk1dCt0UE0vTk4vME50c1UyQWJyRG5CK0p3aTFKTUY0THNY?=
 =?utf-8?B?L0VwY1NCSWp6SmJBN0tkZVVFbjJLWTM2N1EzeEszZXEzM0IzMWRYU2YvemRN?=
 =?utf-8?B?VW0xRlg4NWdraUkzVGFMQ3AwTUUxS0lYUW5uVFcwbzVEMlY4QWwzeVdIVXZJ?=
 =?utf-8?B?bWNpQVdvVURoWi9FaTgzcTRpcXhSZE1DTEVMUi9WTGdSenZ4K01TckZ2R2tG?=
 =?utf-8?B?QnFaMmJFRTl6clhZSkMrdTgzbEtpaWxDR01LcWtxcXdVRC9NdnF6U2pDQU51?=
 =?utf-8?B?bVZ1NnM1a1BJcHRQMFBtV3o1enJxdWcxckVjdG5iTExxamtobEFDTDExY0tO?=
 =?utf-8?B?clpURzhnUVJIOGFZUjFvbXE0dGZxQ2dBeFJ1WjhNN1hTZE5xNTBZTTVSZldw?=
 =?utf-8?B?YzY4U21CeWtmNm8xcDJIa0E0dVVZc1FDei85eGUvaVB1OWZHYWZQYnJDc3cz?=
 =?utf-8?B?dEtJSHQ2V0pVRHZVYSs0QVFTSjdvRVJQd09hN1FIalpvbmEveFlQNW5nRVYx?=
 =?utf-8?B?Z2N3cUhqc3RPNk13dlFMM0M5M2QzSnRTeVdHTjBTNHRuV3lid25LSG9XbVRl?=
 =?utf-8?B?U1NmMkVrRmYvUmNZUG50SmRXMTNnUnZ0c1Z6YkRHYms3QmxWUlFZNmJqeVkr?=
 =?utf-8?B?TEIrQnE2V2QrcVQ2ckRKZlV0R1A4WUM4SWJtWVU1Tzlya1kvOW1mUzVteVRS?=
 =?utf-8?B?Z2p6ZmwyQUZNb3lxVXcyWWhGY29ZRTFtdXBObEVDY3hwMkFBM3VVOWphd1VY?=
 =?utf-8?B?SEg5eEliTVdocFhGeVAwN3JUYi9VN0VuQXNqamdYN3FkTXFZaEZzMlBxazA5?=
 =?utf-8?B?Z1A4MkZWVHJReERvOWpUdHM4c3RPWXRBUXNJajdpb0lvRE93VFM1R2Y0b1Ar?=
 =?utf-8?B?RlFhWlNKK09MVGJlUHJUK2Q3a1NZQlBSNjJvbjE2czFzaWdKb1k3amVPaVF6?=
 =?utf-8?B?amJjYm5NL0RxcXlWdHJ4Rm1idFZvZ3g5NzFNYVBlc3I2OHdocDYrZXBhalcr?=
 =?utf-8?B?Rm90YWhNY1dHWGJCWnN3US9uY1owREYzWmFhbFBCOVlBNmhsNlJhWkRqamZE?=
 =?utf-8?B?TEptanlWR2ZYLy9iQ2ZXU2xueEhMbFluVENWLzBzTlh3eHROVmNNZnNoQWU0?=
 =?utf-8?B?QW9jUnpqMExUNk1mTEg5cDVxa0U4eVlGNmdHWlZuSGNtQTQ5eGs5ZWNsbUlp?=
 =?utf-8?B?RklJOGpVTzFIKzQ2cEJ0L1I4MEdNbExTOGM4ZTNMUDNyWGIzeGIrVWdUUjlM?=
 =?utf-8?B?MFdUK2R3WFBMSWoxdmlHM2FxQ29DZkY2R1N0cnNFL1JKOU9LVzEyWlN3eEE4?=
 =?utf-8?B?SnVGNkVScmtueXJ6Z0pJMkVHL3prd2dNNVo5NTFhcnR3TFJ3cU56cmJ0T04v?=
 =?utf-8?Q?Mz2TlVjZHJvOSZ3IccSfVGhGQ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3df7a12-c356-4e6e-99fa-08dcce4bcf64
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:13:37.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORKEmruE3q2ytGBcowRvDW/zISJRatFxKAznzpTQZzupbGS7x0PK11WihqbdHEZj4FU9hQcZI4C/Kv64N3XL5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_011349_540521_BCE01796 
X-CRM114-Status: GOOD (  26.01  )
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

Ck9uIDIwMjQvOS82IDE1OjA0LCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFsgRVhURVJOQUwgRU1B
SUwgXQo+Cj4gT24gRnJpIDA2IFNlcCAyMDI0IGF0IDEzOjUyLCBDaHVhbiBMaXUgdmlhIEI0IFJl
bGF5IDxkZXZudWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+
PiBTb21lIFBMTHMgd2l0aCBmcmFjdGlvbmFsIG11bHRpcGxpZXJzIGhhdmUgZnJhY3Rpb25hbCBk
ZW5vbWluYXRvcnMgdGhhdAo+PiBhcmUgZml4ZWQgdG8gIjEwMDAwMCIgaW5zdGVhZCBvZiB0aGUg
cHJldmlvdXMgIigxIDw8IHBsbC0+ZnJhYy53aWR0aCkiLgo+Pgo+PiBUaGUgaGlmaV9wbGwgZm9y
IGJvdGggQzMgYW5kIFM0IHN1cHBvcnRzIGEgZnJhY3Rpb25hbCBtdWx0aXBsaWVyIGFuZCBoYXMK
Pj4gYSBmaXhlZCBmcmFjdGlvbmFsIGRlbm9taW5hdG9yIG9mICIxMDAwMDAiLgo+Pgo+PiBIZXJl
IGFyZSB0aGUgcmVzdWx0cyBvZiB0aGUgQzMtYmFzZWQgY29tbWFuZCB0ZXN0cyAoYWxyZWFkeSBk
ZWZpbmVkCj4+IENMT0NLX0FMTE9XX1dSSVRFX0RFQlVHRlMpOgo+PiAqIGVjaG8gNDkxNTIwMDAw
ID4gL3N5cy9rZXJuZWwvZGVidWcvY2xrL2hpZmlfcGxsL2Nsa19yYXRlCj4+ICogY2F0IC9zeXMv
a2VybmVsL2RlYnVnL2Nsay9oaWZpX3BsbC9jbGtfcmF0ZQo+PiA0OTE1MjAwMDAKPj4gKiBlY2hv
IDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9jbGsvaGlmaV9wbGwvY2xrX3ByZXBhcmVfZW5hYmxlCj4+
ICogY2F0IC9zeXMva2VybmVsL2RlYnVnL21lc29uLWNsay1tc3IvY2xrcy9oaWZpX3BsbF9jbGsK
Pj4gNDkxNTE1NjI1ICAgICAgICsvLTE1NjI1SHoKPj4gKiBkZXZtZW0gMHhmZTAwODEwMCAzMgo+
PiAweEQwMDMwNEEzCj4+ICogZGV2bWVtIDB4ZmUwMDgxMDQgMzIKPj4gMHgwMDAxNDgyMAo+Pgo+
PiBCYXNlZCBvbiB0aGUgcmVnaXN0ZXIgaW5mb3JtYXRpb24gcmVhZCBhYm92ZSwgaXQgY2FuIGJl
IG9idGFpbmVkOgo+PiBtID0gMHhBMyA9IDBkMTYzOwo+PiBuID0gMHgxID0gMGQxCj4+IGZyYWMg
PSAweDE0ODIwID0gMGQ4NDAwMAo+PiBvZCA9IDB4MyA9IDBkMwo+Pgo+PiBoaWZpX3BsbCBjYWxj
dWxhdGVzIHRoZSBvdXRwdXQgZnJlcXVlbmN5Ogo+PiBjYWxjX3JhdGUgPSB4dGFsX3JhdGUgLyBu
ICogKG0gKyAoZnJhYyAvIGZyYWNfbWF4KSkgPj4gb2Q7Cj4+IGNhbGNfcmF0ZSA9IDI0MDAwMDAw
IC8gMSAqICgxNjMgKyAoODQwMDAgLyAxMDAwMDApKSA+PiAzOwo+PiBjYWxjX3JhdGUgPSA0OTE1
MjAwMDAKPj4KPj4gY2xrX3JhdGUsIG1zcl9yYXRlLCBhbmQgY2FsY19yYXRlIGFsbCBtYXRjaC4K
PiBUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBkZXNjcmlwdGlvbi4KPgo+IElzIHRoZXJlIGEgcG9z
c2liaWxpdHkgdGhpcyBhcHBsaWVzIHRvIHRoZSBnMTIvc20xIGFzIHdlbGwgPyBIaUZpIFBMTAo+
IGhhcyBoYWQgdHJvdWJsZSBvbiB0aGVzZSBTb0NzIHNpbmNlIHN1cHBvcnQgaGFzIGJlZW4gYWRk
ZWQuIEl0IHNvbWV0aW1lcwo+IHRha2VzIGEgbG9uZyB0aW1lIHRvIHJlcG9ydCBhIGxvY2suIFNv
IGxvbmcgd2UgY29uc2lkZXIgaXQgYSBmYWlsdXJlLgo+Cj4gVGhlcmUgd2FzIG5vIHN1Y2ggaXNz
dWUgb24gQVhHLiBJZiB5b3UgY2hlY2sgRFQsIGl0IGlzIHRoZSByZWFzb24gd2h5Cj4gQVhHIHVz
ZSB0aGUgSGlGaSBQTEwgZm9yIHRoZSBzb3VuZCBjYXJkIGFuZCBHMTIvU00xIGRvZXMgbm90LgoK
CkkgaGF2ZSBjb25maXJtZWQgdGhhdCBvbmx5IHRoZSBoaWZpX3BsbCBvZiB0aGUgY2hpcCBpbiBy
ZWNlbnQgeWVhcnMgaGFzIAp0aGlzIGZlYXR1cmUsCgphbmQgZzEyYS9zbTEvYXhnIGlzIG5vdCBs
aWtlIHRoaXMuCgoKSSBjb25maXJtIHRoYXQgb3VyIHNtMSB1c2VzIGhpZmlfcGxsLCBhbmQgSSBo
YXZlIG5vdCBlbmNvdW50ZXJlZCB0aGUKc2l0dWF0aW9uIHlvdSBzYWlkLiBUaGVyZSB3YXMgYSBw
cm9iYWJpbGl0eSBvZiBsb2NrIGZhaWx1cmUgaW4gcGxsCmJlZm9yZSwgd2hpY2ggd2FzIHNvbHZl
ZCBieSBhZGRpbmcgNTB1cyBkZWxheSBpbiBtZXNvbl9jbGtfcGxsX2VuYWJsZToKQEAgLTM3OCw2
ICszNzgsOCBAQCBzdGF0aWMgaW50IG1lc29uX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcg
Kmh3KQogwqDCoMKgwqDCoMKgwqAgLyogRW5hYmxlIHRoZSBwbGwgKi8KIMKgwqDCoMKgwqDCoMKg
IG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmVuLCAxKTsKCivCoMKgwqDCoMKgwqAg
dWRlbGF5KDUwKTsKKwogwqDCoMKgwqDCoMKgwqAgLyogVGFrZSB0aGUgcGxsIG91dCByZXNldCAq
LwogwqDCoMKgwqDCoMKgwqAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQog
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAs
ICZwbGwtPnJzdCwgMCk7CgpUaGlzIHBhdGNoIGlzIGFsc28gcHJlcGFyZSB0byBwdXNoIHRvIHVw
c3RyZWFtIGxhdGVyLgoKCkFub3RoZXIgZGV0YWlsIGlzIHRoYXQgdGhlIGxhcmdlciB0aGUgZnJh
YyB2YWx1ZSwgdGhlIGxvbmdlciB0aGUgbG9jawp0aW1lLCBidXQgdGhlIHRpbWUgaXMgYXQgdGhl
IHVzIGxldmVsLCBzbyB0aGF0IHRoZSB0aW1lb3V0IGluIHRoZSBwbGwKZHJpdmVyIGlzIG5vdCB0
cmlnZ2VyZWQuCgoKPgo+PiBUaGUgdGVzdCBhbmQgY2FsY3VsYXRpb24gcmVzdWx0cyBvZiBTNCBh
cmUgY29uc2lzdGVudCB3aXRoIHRob3NlIG9mIEMzLAo+PiB3aGljaCB3aWxsIG5vdCBiZSByZXBl
YXRlZCBoZXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxv
Z2ljLmNvbT4KPj4gLS0tCj4+IENodWFuIExpdSAoNCk6Cj4+ICAgICAgICBjbGs6IG1lc29uOiBT
dXBwb3J0IFBMTCB3aXRoIGZpeGVkIGZyYWN0aW9uYWwgZGVub21pbmF0b3JzCj4+ICAgICAgICBj
bGs6IG1lc29uOiBjMzogcGxsOiBoaWZpX3BsbCBmcmVxdWVuY3kgaXMgbm90IGFjY3VyYXRlCj4+
ICAgICAgICBjbGs6IG1lc29uOiBzNDogcGxsOiBoaWZpX3BsbCBzdXBwb3J0IGZyYWN0aW9uYWwg
bXVsdGlwbGllcgo+PiAgICAgICAgY2xrOiBtZXNvbjogczQ6IHBsbDogaGlmaV9wbGwgZnJlcXVl
bmN5IGlzIG5vdCBhY2N1cmF0ZQo+Pgo+PiAgIGRyaXZlcnMvY2xrL21lc29uL2MzLXBsbC5jICB8
ICAxICsKPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMgfCAyMiArKysrKysrKysrKysr
KysrKysrLS0tCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5oIHwgIDEgKwo+PiAgIGRy
aXZlcnMvY2xrL21lc29uL3M0LXBsbC5jICB8ICA5ICsrKysrKystLQo+PiAgIDQgZmlsZXMgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4gLS0tCj4+IGJhc2UtY29t
bWl0OiBhZGFjMTQ3YzZhMzJlMjkxOWNiMDQ1NTUzODdlMTJlNzM4OTkxYTE5Cj4+IGNoYW5nZS1p
ZDogMjAyNDA5MDQtZml4X2Nsay02NjhmN2ExYTJiMTYKPj4KPj4gQmVzdCByZWdhcmRzLAo+IC0t
Cj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
