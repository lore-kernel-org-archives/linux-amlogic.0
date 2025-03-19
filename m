Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F10C35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 08:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tFb/5ySzcK3hWhXP2Q6LBbIarSkdmbJe6mQIZILrjU=; b=FYvHRiBEDk1CNUUBThrgsA94Yy
	Rnui7xqN8B+vLbrCjexyGgkQEmCoPo2RAo0rITUy920Rp4w+TjNJNKcGYfvxXyyKpGGrkjwSr/h0H
	AmdxdRwmHrkUtgKxGH9k+NqgotD+F+JLyYnjFKFVko6OT54Ujt3rBrc4nsHKXcZw3/6jXHqaAjy70
	uZtAED+hlanYNsfLzczZ30O4SpvF+CbR3LiB4qmpd6ZQ84zyrjR/JSvCr5SWxHU7BCMMloF/Oew22
	uI3UK9863QAnceV2LO0muQD3/GQ0q4TJfxeoNqqeUmTn20XZPJzP/cN2havQDS4w2QCc6xG/pGRBD
	6DK2Ff5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tup6f-00000008OJs-0AGL;
	Wed, 19 Mar 2025 08:48:57 +0000
Received: from mail-psaapc01on20706.outbound.protection.outlook.com ([2a01:111:f403:200e::706] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tup4x-00000008O9A-24nV;
	Wed, 19 Mar 2025 08:47:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnIHq3ikBCARhw5QuI4U4yGe3yewM2bhEdFajls5t9+vfINhddkrL+DPHoF3DOnDTzztiEhLO3xjefSQq/O6OebFxuzGZIn+a0cu0dfqSijhkoD/mrWBRtnaDbg3SsamSYn+89j9fqZmiesMJ2IGDrrbLrNJYqjGlfgbuoz1MdHVz44+ccomL0xQJtG7jhP9cXnBh+Zae9CFqY+UrAn95t/AjK0iO5X7lseNhM5AfJbY+be6xGEdTMlxm0KHpIm79Cbt367/daeZxELhLqMi2fHDnm3YGTrmrS/w9+uulQuOejkaHwIrWCCUHu4820VkuttO9EoNRbwH4t2fRnGn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib+3v0DsSjyp0ngUbIrBJjY47A3I7XSXLz/rIKT0B/s=;
 b=cl3AMl7Hm2ubIP64xVPlgeNbdAGviOYWL4GqFfCmZ/wE9xZRhwDnjbFGa6JZ1FqIvhbBDXXEV/0Xjc8iVtESb3Yxo8auOdxIR4aMKyzIYWDnyuWjImWmbR7ons34se72hlQ0MG9BfyqpfDYGqoHTpQ+GIiOP5rVNp1C7a8GtOvP3F8QDz4tleWi9HppvdDI+k+GoqPuHCbG0OLTd58jQVQBQ8XOmbx1GY/MDdQQFh2ACdqnXsO9iMWARYkYNwr+nJdJpu6uOaJ/H0iV1/1kxmENloRLQP2ir5JKeOjiLvFyB7rNlmMddUY8gqMwk4RZBZIpN0EZifuuXbzuQ0GcXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib+3v0DsSjyp0ngUbIrBJjY47A3I7XSXLz/rIKT0B/s=;
 b=Wr4yzxWVnYwAcifla6OTTfJxR5puBJr+Tjn2+4JVm7kywK7LT4nlHYsGrUcw1d2sR22hexfjYnX2oN5WLvIRxQq3dVFUuiV1e2ndpum0XRQeOw/yQhGH9zvqdJX2tJDVlhpIqXTtIdLm15nhNsEKjoZAeycQX0W9BDrrboJtY0VnnRZKwcFy5nnZxU92ptysGM3199E1MfYp2ob7cHikWN8YL84Rl95iEbtwdGkbK1Dt9sAt/mAcP4HyXs/6vFa2tMNKGYNrLQbNdjV4R2lJT86r396ULXpeJz7f5imz8hlcJN0h8XSGGFBh4T8ssI5DYj2aYj1YokpmrIlS4SobKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEYPR03MB6698.apcprd03.prod.outlook.com (2603:1096:101:6b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 08:47:00 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%7]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 08:47:00 +0000
Message-ID: <6c1ca29e-37e4-488c-b3a3-f61aad7f8dcf@amlogic.com>
Date: Wed, 19 Mar 2025 16:46:53 +0800
User-Agent: Mozilla Thunderbird
From: Jiebing Chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: amlogic: Add Amlogic S4 Audio
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-6-686867fad719@amlogic.com>
 <20250319-quizzical-coyote-of-assurance-d4c91d@krzk-bin>
In-Reply-To: <20250319-quizzical-coyote-of-assurance-d4c91d@krzk-bin>
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEYPR03MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d468ac8-f142-44f2-42c0-08dd66c29cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUpiQnVpVHRFTDFUbUJmQnF3Q3ErWUI5NTcrenNjeldmTk5ucFAyU2NWZFRP?=
 =?utf-8?B?SGw5eWFtU1U2Z3R3Q0RJR2pDMUJ2eklOdkVRcGV0ODQyKzV6SzBQSmxGakZO?=
 =?utf-8?B?dTBDdlpESUM3cEUrVnFuTXUvY0ZzTGVhdCtHUmpzQU9yaDhjRnBtalVCUkNi?=
 =?utf-8?B?WTRtcE9jclk0clFpSS9jUWZwdlA5dnhyUWZ4TVIrUERXUmE3RVovRDlLZUhP?=
 =?utf-8?B?TEpEVlV3NmJmRGZhSzVaZ0VpVWthbDc2amJnQU9ZenJkbmRXMndUVVNqYTBo?=
 =?utf-8?B?dWFuSFUrM21EK2l3ejlGRUFDZDlDWGdaanBURlBDcWFDZXNuNDFTcEdxNUhp?=
 =?utf-8?B?SjBscGltY3RDWEhZRnZsUHlmWCtvK2RkZUFCUFFWV2VNT2RIOXRsQ082aDFF?=
 =?utf-8?B?U1pBWjY1RTRpT3hwbWhDRUl2S0NNVU5QQ0phcUxIaWxIdkt0Zm9qMTNKelF4?=
 =?utf-8?B?M0VUQTQwU1h6bEV3ekxJR04yYmJ4ZFMzNmhFZXI1OFE5cnJDV3pPRDRiSnJZ?=
 =?utf-8?B?c1RNVVNzUWxIeTN1VTRzZEpBamw4eTMyL2N4My9LR293NlVnemRPd2ZxaTVt?=
 =?utf-8?B?amVoYzV2YUN0Nnc3RXJCU291S3V3ZWE4TnNQN24vQ0d6MUdLUFh2ZWFPbmkv?=
 =?utf-8?B?d25hOHBteGZ4dUpSMitiREhXdnhpQ0EzakZIQTl2ZTNnN25WRm43Z3BVYjVr?=
 =?utf-8?B?ZE1xQU83aXE2SWYzV2tRK21adFZQVm1CWTREbnZocm9GcGZpQWZlMndDdmNX?=
 =?utf-8?B?eStQYVlQZ0FhUmxOVmgrcmg2cDZSUkZBTHVITVBTQWxxRHhjbVZzVDkxelpB?=
 =?utf-8?B?OVpjLy9rS3RwbXNCOTZDdXRCcllGaHF1V09MdEFMSW5PVlYxbC9rQ1lNZDlu?=
 =?utf-8?B?MTBYcXNUYnlQVzhaWXlUU0lRWjhVNHV3L1NCc21JbjJjSjRpN3pCaEZPeTFk?=
 =?utf-8?B?d24yVnFFeVBGYXk5aCsvUzZEdEdQVk9PZDZjUktNVzRMMFIwWjNGWUx1U1Jl?=
 =?utf-8?B?NmRzNFZKMHl3NVlXRW5rRmR4cUx1a0hXYlVYYmlIbTBucC9qbUNMRXkvcWlU?=
 =?utf-8?B?R1ZWMEpJNHh4MVBQa2ZZRUtvdUFMdVBteGlQS2Q4eG9nWWVCN3RvMVM3bkEx?=
 =?utf-8?B?cmtlL1pvTGNOT3VTcEVGdC94V3pBbkpzdTRnSTNUZkJnSmxXWGVoY0kvMVpS?=
 =?utf-8?B?SkhrSkV3K0RZcStoMXE3S1RyY2JWVUUvdUxhenJSVDlxQWtxVUlzbExLVUp6?=
 =?utf-8?B?ajlyV1JBSDY2dGgxczNoNWFxYWxqZ0gwdG5JUE5OK3JRMjkxQUVBU3BteU9n?=
 =?utf-8?B?bDNlT01WL2RyNXpaQW95TFhHaUkxWjJMenpkSktEUnBuOE9OUW40N3M4RE4r?=
 =?utf-8?B?NllGY1NQblRSd1hwdC9KY3pyL0hvRkRQcjkwUGdGdTJmQkN1WGtDU0R2Nm1Z?=
 =?utf-8?B?dHhZMHhKWHovSkFkU3pPRm1FS0ZUUk4rUGZ5UEt6YldaWFFDN1g5cjZQb2Zn?=
 =?utf-8?B?dVJCZWw1SVZ5bUFPTThjZmxLSHdrZm9BYy9PZXRhKzlGaEhWTHBNYmxneXdt?=
 =?utf-8?B?bytnTVhRcUlJWlljd0pxdnl5SWNMWmJpRjRvdWNrZlZWbktmSXo2ZHh3V0FZ?=
 =?utf-8?B?aERZcE5MT1QxaSt5SHBXbTI5R0E3S29UVHJLVWlFeVNaN0tCL0ZKK3p3UlVS?=
 =?utf-8?B?eVcxeTdsaUlOa3hxeGV1bkV3M25vWGg2aDZyeE5FWlBKOGR2cUlWbHVYOFN2?=
 =?utf-8?B?bUtveDNWMjlFc2ZSYzNMRHJpQTVENElCTDhsWDdCYmd4T3F5VVZWT1VzMzY2?=
 =?utf-8?B?TlJIUGtZWjJhNDc5WElLUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2FuMmpqbC9WL0oyV2tEVW1LYWhMdzJsdU0vZ2FIRkd1T1JqMmEvYnVMd083?=
 =?utf-8?B?UWdQOGs3NzhZWnVHMHpxUVp1THRFVnlFSVErbVBNYkhvSTdRUDlqV0ZGRXRJ?=
 =?utf-8?B?a3NqaDk1bGRiNC9HMEYvelN4SXdyL01POU9NeW9CZms2dDNOd25uRll3TnZu?=
 =?utf-8?B?TzFpSXFNcGdrbjh1R1VWNVRjOFF3M0ExeEVjLzBDR0lhUzV4aFdzbUpPckVa?=
 =?utf-8?B?cjFndlhRaHkya25hT1RzcWt4ZzJ3cW0wZlhIb0c5anB1TmdHcHZ5aEhkZzhV?=
 =?utf-8?B?OHBOU0xkMll5ckpyaDN4S0NpaHl6QTVTaG5NdTJld2RCa25hQlhGSFBWTWZ2?=
 =?utf-8?B?bC9VWUxDZWlWeWdrcm5BUWlKQWN3enJpc2pRUlhIL1RMSWdWYWZkOWdoMG8r?=
 =?utf-8?B?b2tWcGdnS0JKUUsxSVR1OUs4YmM0RURDZ3VTcThwTG9UZmRxWFJwSXNTWk9j?=
 =?utf-8?B?eXA4Z3REQkJ6SjNRQ1NvZFNaTlI4ZkFUb0pSaEVPaWI0ZmRuSTZuS1FvcTN4?=
 =?utf-8?B?SzYvS0d0YUVMRlN6TWRCL3lWWGU3cmc3YVVkRy8wdVQ2ZlFwTVovbVlCUmkr?=
 =?utf-8?B?QzNzaGdKQkxPMXc0RHR0NDRBZ0ZITzdLTUNLZ0IwQWN6SDZTQ2ZyZGwvZmRQ?=
 =?utf-8?B?dFRxUGI2M0xTNkVRMDFWRzlralBPMEtNeEhPQVZML3RLNUh6ZU9ZS2U2eFph?=
 =?utf-8?B?eStkSUtXeEdHSWo5V3BkQ2gwR29FSHpmdk0vdjYvZ1J4Z2FVTUdpTU5oTzFx?=
 =?utf-8?B?OFJHcEpGenoySndiS2pxNklPK1EzY3psRDRBeTVKM3ZVeW00U0xWWnE0WGN5?=
 =?utf-8?B?R1lsY2RIZklVZ2pFdFFOWlI3MmVta0VGY2lyQy9GdDlUOXhwdWlpbytRbHhH?=
 =?utf-8?B?UnpkVDZEcm1RWFlaeE5XVnJXN1VsdVluYmNUUkpmcXhXSEJjYXcyWUxSck5X?=
 =?utf-8?B?YUhoa0lLYlFHdlo4WW1XYVRqVTVNQ2llRkF5VHN2SE4veTU5K01tVGgvYm56?=
 =?utf-8?B?Snl0UXIrbmZTK2NKSmxXU042aUZ3T2ZianFGM2I3dG5iQ0FyRWNLSGJIanQr?=
 =?utf-8?B?ZzFBOHA4WVpMNGJaTFZWRHkxT3l1ZC9kbnhraEFSSlJ4dURJUmxUZ0V2MXdr?=
 =?utf-8?B?aDF3Q05JKzlMY2JhL2ZnNmNyUEhjVWd2RS84RmkvckdESnRKMjQ0TG92cGZU?=
 =?utf-8?B?YkhXb09nTjAxSmFCTHl3Rks3YkVjT1hFem51NVVhY3dreDBIMUF3VWxHSW9M?=
 =?utf-8?B?SEpmakFGaGRHeWxWZkNpSFlseTYzZnFPN2NEcytIczV0OGhZOS94WjAwWXhq?=
 =?utf-8?B?RUQ3WC82V2xFYStZbFBYQlY2RTFtS0o4ekowMlcwWFp1NUJhSEtQblpacGZR?=
 =?utf-8?B?WGpnWDRHbWxEcXI5cEV3RkREbzRZOXhPT3ZSN3dac3kwcGlqbFVzRDZ6blBt?=
 =?utf-8?B?V1pJTmhQVDBNdHhkUEErYTh0MCtDL3dIbk5YbjZzNDJWcDJtRlZJZG5Lbndy?=
 =?utf-8?B?ZW56SUV3TjB4OFVpNWh6MGxkU3R6UlFlY1c4d1hxcmFLVG1YUUhzVmpUVWox?=
 =?utf-8?B?a1pORzhMeHR4Y1BjcWtSaEYwNTZFd1hGR1ZCU01kdUdENnRPY3duenpKSWcr?=
 =?utf-8?B?RzVURWdhaExGeDVXOHBMSUR6S1VjUFVCVUlrZEoxVU5XYUU0ZE5jQ3hBWTVn?=
 =?utf-8?B?UEhHUVZ3UEFTNVZuN2w5SFNtQmtNZ3I3c2p2Tzh3MEtDMUI1QkllejVjVnB4?=
 =?utf-8?B?cFBrcVR4VkhveEN6anJnK1U0cE1taDNReUw4UzdFK2VVanRLbUh2U1VVUGJq?=
 =?utf-8?B?L045MmhhdjNtR3ZhbGZrUkd2WTlZZGlRNCtveGljT3VpdVpuSlNUVE5qWk9p?=
 =?utf-8?B?dFBROVR1TE1BQmlTbGppTy92UnVsTm82Z0RFUXd3MG5DS1BBUEFITlVUVFpM?=
 =?utf-8?B?QUxNcXVrd25iUlpVK3BvYVpleHRmUGtkMm5qS2NvNGZZTkR4T0pKU1RLZFlT?=
 =?utf-8?B?SUt3MmY3d09hejE1R2Y4YmhidGJXdlplUE1XMFdmZ3k1cWJ1YUtVek4yb2Nt?=
 =?utf-8?B?R2Y5Zmg2K2NndFQvWXRUN2Joc1NlR0ZDVlI1d3NjSndLYno0ZVY2NVF3bVhp?=
 =?utf-8?B?Wm43ZlExU3JkT09VR3FsSFYzUE0wRXpaMzZERENoZnZpUENmTnc5NHROS0ZM?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d468ac8-f142-44f2-42c0-08dd66c29cbc
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 08:46:59.8806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RSjAJT/U/cjycWChDUWGdRL4zf++fhFF0s4QcAmMWblXY9kdyYwXLDGxzy2NOac97pDZIeB25t4WBlmIPWBVD81h3ywn62Uo5burJQFBNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_014711_679845_376F6983 
X-CRM114-Status: GOOD (  18.04  )
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

CuWcqCAyMDI1LzMvMTkgMTY6MjYsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+IFtZb3Ug
ZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb21rcnprQGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0aGlz
IGlzIGltcG9ydGFudCBhdGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNh
dGlvbiBdCj4KPiBbIEVYVEVSTkFMIEVNQUlMIF0KPgo+IE9uIFdlZCwgTWFyIDE5LCAyMDI1IGF0
IDAzOjA0OjQ5UE0gKzA4MDAsIGppZWJpbmcgY2hlbiB3cm90ZToKPj4gQWRkIGJhc2ljIGF1ZGlv
IGRyaXZlciBzdXBwb3J0IGZvciB0aGUgQW1sb2dpYyBTNCBiYXNlZAo+PiBBbWxvZ2ljIEFRMjIy
IGJvYXJkLiB1c2UgaGlmaXBsbCBwbGwgKDExNzk2NDgwMDApIHRvCj4+IHN1cHBvcnQgNzY4ayBz
YW1wbGUgcmF0ZSBhbmQgMjQgYml0IChzMjRfbGUpLCAyNGJpdCBzY2xrCj4+IGlzIDQ4ZnMsIHVz
ZSBtcGxsMCAoMjcwOTUwNDAwKSB0byBzdXBwb3J0IDcwNS42ayBzYW1wbGUKPj4gcmF0ZSBhbmQg
MzJiaXQsIHVzZSBtcGxsMSAoMzM4Njg4MDAwKSB0byBzdXBwb3J0IDcwNS42awo+PiBhbmQgMjRi
aXQuCj4gUGxlYXNlIHdyYXAgY29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nIHRvIExpbnV4IGNvZGlu
ZyBzdHlsZSAvIHN1Ym1pc3Npb24KPiBwcm9jZXNzIChuZWl0aGVyIHRvbyBlYXJseSBub3Igb3Zl
ciB0aGUgbGltaXQpOgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjQtcmMx
L3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNMNTk3
Cj4KPj4gU2lnbmVkLW9mZi1ieTogamllYmluZyBjaGVuPGppZWJpbmcuY2hlbkBhbWxvZ2ljLmNv
bT4KPiAuLi4KPgo+PiArCj4+ICsgICAgICAgICAgICAgZGFpLWxpbmstMTIgewo+PiArICAgICAg
ICAgICAgICAgICAgICAgc291bmQtZGFpID0gPCZ0b2Fjb2RlYyBUT0FDT0RFQ19PVVQ+Owo+PiAr
Cj4+ICsgICAgICAgICAgICAgICAgICAgICBjb2RlYyB7Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNvdW5kLWRhaSA9IDwmYWNvZGVjPjsKPj4gKyAgICAgICAgICAgICAgICAgICAg
IH07Cj4+ICsgICAgICAgICAgICAgfTsKPj4gKyAgICAgfTsKPj4gKwo+IERvIG5vdCBhZGQgc3Ry
YXkgYmxhbmsgbGluZXMuCj4KPj4gICB9Owo+Pgo+PiAgICZwd21fZWYgewo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+PiBpbmRleCA5NTc1NzdkOTg2YzA2NzVh
NTAzMTE1ZTFjY2JjNDM4N2MyMDUxNjIwLi44M2VkYWZjMjY0NjQzOGUzZTZiMTk0NWZhMWM0YjMy
NzI1NGE0MTMxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVz
b24tczQuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQu
ZHRzaQo+PiBAQCAtMTEsNyArMTEsMTEgQEAKPj4gICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xv
Y2svYW1sb2dpYyxzNC1wZXJpcGhlcmFscy1jbGtjLmg+Cj4+ICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3Bvd2VyL21lc29uLXM0LXBvd2VyLmg+Cj4+ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jl
c2V0L2FtbG9naWMsbWVzb24tczQtcmVzZXQuaD4KPj4gLQo+IFdoeT8KPgo+PiArI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2Nsb2NrL2F4Zy1hdWRpby1jbGtjLmg+Cj4+ICsjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1heGctYXVkaW8tYXJiLmg+Cj4+ICsjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1nMTJhLWF1ZGlvLXJlc2V0Lmg+Cj4+ICsj
aW5jbHVkZSA8ZHQtYmluZGluZ3Mvc291bmQvbWVzb24tZzEyYS10b2Fjb2RlYy5oPgo+PiArI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL3NvdW5kL21lc29uLWcxMmEtdG9oZG1pdHguaD4KPiBPbGQgc3R5
bGUgd2FzIGNvcnJlY3QuCj4KPj4gICAvIHsKPj4gICAgICAgIGNwdXMgewo+PiAgICAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4gQEAgLTQ2LDYgKzUwLDM2IEBAIGNwdTM6IGNw
dUAzIHsKPj4gICAgICAgICAgICAgICAgfTsKPj4gICAgICAgIH07Cj4+Cj4+ICsgICAgIHRkbWlm
X2E6IGF1ZGlvLWNvbnRyb2xsZXItMCB7Cj4+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
bWxvZ2ljLGF4Zy10ZG0taWZhY2UiOwo+PiArICAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMg
PSA8MD47Cj4+ICsgICAgICAgICAgICAgc291bmQtbmFtZS1wcmVmaXggPSAiVERNX0EiOwo+PiAr
ICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrY19hdWRpbyBBVURfQ0xLSURfTVNUX0FfU0NMSz4s
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgPCZjbGtjX2F1ZGlvIEFVRF9DTEtJRF9NU1RfQV9M
UkNMSz4sCj4+ICsgICAgICAgICAgICAgICAgICAgICAgPCZjbGtjX2F1ZGlvIEFVRF9DTEtJRF9N
U1RfQV9NQ0xLPjsKPj4gKyAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJzY2xrIiwgImxyY2xr
IiwibWNsayI7Cj4+ICsgICAgIH07Cj4+ICsKPj4gKyAgICAgdGRtaWZfYjogYXVkaW8tY29udHJv
bGxlci0xIHsKPj4gKyAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYXhnLXRkbS1p
ZmFjZSI7Cj4+ICsgICAgICAgICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsKPj4gKyAgICAg
ICAgICAgICBzb3VuZC1uYW1lLXByZWZpeCA9ICJURE1fQiI7Cj4+ICsgICAgICAgICAgICAgY2xv
Y2tzID0gPCZjbGtjX2F1ZGlvIEFVRF9DTEtJRF9NU1RfQV9TQ0xLPiwKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICA8JmNsa2NfYXVkaW8gQVVEX0NMS0lEX01TVF9CX0xSQ0xLPiwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICA8JmNsa2NfYXVkaW8gQVVEX0NMS0lEX01TVF9CX01DTEs+Owo+PiAr
ICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInNjbGsiLCAibHJjbGsiLCJtY2xrIjsKPj4gKyAg
ICAgfTsKPj4gKwo+PiArICAgICB0ZG1pZl9jOiBhdWRpby1jb250cm9sbGVyLTIgewo+PiArICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxheGctdGRtLWlmYWNlIjsKPj4gKyAgICAg
ICAgICAgICAjc291bmQtZGFpLWNlbGxzID0gPDA+Owo+PiArICAgICAgICAgICAgIHNvdW5kLW5h
bWUtcHJlZml4ID0gIlRETV9DIjsKPj4gKyAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsa2NfYXVk
aW8gQVVEX0NMS0lEX01TVF9DX1NDTEs+LAo+PiArICAgICAgICAgICAgICAgICAgICAgIDwmY2xr
Y19hdWRpbyBBVURfQ0xLSURfTVNUX0NfTFJDTEs+LAo+PiArICAgICAgICAgICAgICAgICAgICAg
IDwmY2xrY19hdWRpbyBBVURfQ0xLSURfTVNUX0NfTUNMSz47Cj4+ICsgICAgICAgICAgICAgY2xv
Y2stbmFtZXMgPSAic2NsayIsICJscmNsayIsIm1jbGsiOwo+PiArICAgICB9Owo+PiArCj4+ICAg
ICAgICB0aW1lciB7Cj4+ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLGFybXY4LXRp
bWVyIjsKPj4gICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfUFBJIDEzIChHSUNfQ1BV
X01BU0tfU0lNUExFKDQpIHwgSVJRX1RZUEVfTEVWRUxfTE9XKT4sCj4+IEBAIC0xMDEsNyArMTM1
LDYgQEAgYXBiNDogYnVzQGZlMDAwMDAwIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwyPjsKPj4gICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9
IDwyPjsKPj4gICAgICAgICAgICAgICAgICAgICAgICByYW5nZXMgPSA8MHgwIDB4MCAweDAgMHhm
ZTAwMDAwMCAweDAgMHg0ODAwMDA+Owo+PiAtCj4gV2h5PyBXaGF0IGlzIGhhcHBlbmluZyBpbiB0
aGlzIHBhdGNoIC0gd2h5IGFyZSB5b3UgY2hhbmdpbmcgc28gbWFueQo+IG90aGVyIHBpZWNlcz8K
CkhpLCBLcnp5c3p0b2YKCmZvciBsYXN0IHZlcnNpb25zICxpdCBpdCBub3QgbWF0Y2ggdGhlIGFt
bG9naWMsYXhnLXRkbS1pZmFjZS55YW1sCgpzbyB3ZSBtdXN0IGJlIGNoYW5nZSB0aGUgb3JkZXIs
IG90aGVyd2lzZSBhIHdhcm5pbmcgd2lsbCBiZSB0aHJvd27vvIx3ZSAKY29weSB0aGUgZHRzIGNv
bmZpZyBmcm9tIG1lcmdlZCBkdHMKCnRoZSBvbGQgb3JkZXIgbm90IG1lZXQgdGhlIGR0LWJpbmRp
bmcgcnVsZSwgQW5vdGhlciBjaGFuZ2UsIHdlIG9ubHkgYWRkIAp0aGUgYXVkaW8gY2xvY2sgcmVn
CgorIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxzNC1hdWRpby1jbGtjIjsgKyByZWcgPSA8MHgwIDB4
MCAweDAgMHhkOD4sCgphZGQgPDB4MCAweEU4MCAweDAgMHgxMD47CgpXZSBoYXZlIG5vdCBtYWRl
IGFueSBjaGFuZ2VzIHRvIHRoZSByZXN0CgoKYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLXM0LXM4MDV4Mi1hcTIyMi5kdGI6IGF1ZGlvLWNvbnRyb2xsZXItMDogY2xvY2stbmFtZXM6
MDogJ3NjbGsnIHdhcyBleHBlY3RlZAogICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6aHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQvYW1sb2dpYyxheGctdGRtLWlmYWNlLnlhbWwjCmFy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC1zODA1eDItYXEyMjIuZHRiOiBhdWRp
by1jb250cm9sbGVyLTA6IGNsb2NrLW5hbWVzOjE6ICdscmNsaycgd2FzIGV4cGVjdGVkCiAgICAg
ICAgIGZyb20gc2NoZW1hICRpZDpodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb3VuZC9h
bWxvZ2ljLGF4Zy10ZG0taWZhY2UueWFtbCMKYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLXM0LXM4MDV4Mi1hcTIyMi5kdGI6IGF1ZGlvLWNvbnRyb2xsZXItMDogY2xvY2stbmFtZXM6
MjogJ21jbGsnIHdhcyBleHBlY3RlZAoKCj4+ICAgICAgICAgICAgICAgICAgICAgICAgY2xrY19w
ZXJpcGhzOiBjbG9jay1jb250cm9sbGVyQDAgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHM0LXBlcmlwaGVyYWxzLWNsa2MiOwo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDAgMHgwIDB4NDljPjsKPj4g
QEAgLTEzNCw2ICsxNjcsMTcgQEAgY2xrY19wbGw6IGNsb2NrLWNvbnRyb2xsZXJAODAwMCB7Cj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgfTsKPj4KPj4gKyAgICAgICAgICAgICAgICAgICAgIGFjb2Rl
YzogYXVkaW8tY29udHJvbGxlckAxYTAwMCB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyx0OTAxNSI7Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDAgMHgxQTAwMCAweDAgMHgxND47Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNvdW5kLW5hbWUtcHJlZml4ID0gIkFDT0RFQyI7Cj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrY19wZXJpcGhzIENMS0lEX0FDT0RF
Qz47Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInBjbGsi
Owo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JnJlc2V0IFJFU0VU
X0FDT0RFQz47Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFWREQtc3VwcGx5ID0g
PCZ2ZGRpb19hbzF2OD47Cj4+ICsgICAgICAgICAgICAgICAgICAgICB9Owo+PiArCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgd2F0Y2hkb2dAMjEwMCB7Cj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsczQtd2R0IiwgImFtbG9naWMsdDctd2R0
IjsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgyMTAwIDB4
MCAweDEwPjsKPj4gQEAgLTg1MCwzICs4OTQsMzI3IEBAIGVtbWM6IG1tY0BmZTA4YzAwMCB7Cj4+
ICAgICAgICAgICAgICAgIH07Cj4+ICAgICAgICB9Owo+PiAgIH07Cj4+ICsKPj4gKyZhcGI0IHsK
Pj4gKyAgICAgYXVkaW86IGJ1c0AzMzAwMDAgewo+PiArICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAic2ltcGxlLWJ1cyI7Cj4+ICsgICAgICAgICAgICAgcmVnID0gPDB4MCAweDMzMDAwMCAweDAg
MHgxMDAwPjsKPiBUaGF0J3Mgbm90IGEgc2ltcGxlIGJ1cyBpbiBzdWNoIGNhc2UuCj4KPiBOQUsK
Pgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
