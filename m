Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49139C25B78
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQPauNaCr2jG3zUvNCfe42F1QVtv2HwCJvDlbtRz06Y=; b=Q5j8RtF6G4Qr+OkzaaN6Zz3DHQ
	f0siWO+VVhLyRm/0KF/+77WjEDkyeUNZwaP9l1IZBIKVTSHsXg7KLK5UG8KlEg91t3IBSSZtC9csq
	5wRSiJcje+GuFlY2M4FmTQmoMsJizuxyB98g6xQqVbqXxkur+m/8kk0M3WkKHRzjZjSKdfbFdM5B2
	IsFQRWG/UHwIgDkIvQTyDj8wJayh2GylU4DNpOPXn+zGvgc1p6amx8AZOUHJW66DHrqs6PGQ5EpXj
	c+2G8tNJizZYaLmDPB2hEhe3RCaliVmkCYeY7P+hmWFf6uwdgAua3Dusv+ef8lPI6ooGQytFLcl38
	NWJ2ZTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsyF-000000001nm-0WS8;
	Tue, 28 May 2024 09:18:15 +0000
Received: from mail-sgaapc01on20729.outbound.protection.outlook.com ([2a01:111:f400:feab::729] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsyB-000000001l9-2fep;
	Tue, 28 May 2024 09:18:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmwZzN48JRlp0knlHNEJ3g62cIp6MzVj9e6ufrNd3+UmUgtbH/mQP5lMUMJQw4w2SfeBYKJQgKoSz6jp1CPoEpVwbrGtbZGz5ZwG07yxIs4cAIj8/+lF2aj7YGjjiasXqTnmIbbrr01Oa5Vve494wYTywxR1snJPubpgs2+ukBKf+yn+ARaGUP32WQenTN82zIUca+EfyDGiodCm/PNUI/Ko8+teXcM/KYeVRNNRsKVNIxaM0WmuauvjSzMaIwUNP6vJ0jASmJImWZBvDAgbjRTdaMLPaCDewpxMOiUyFAyJrclw6knAoWC0+5zrxRvokyqI+zCReOy2UTYYrIcA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQTPc07KScn4cD9SmT+lZDZ+gJ8IjGy1b+DrDeluYnY=;
 b=QmwbLjv0er8eLNIs4rhTwyFpRB3SX/jIaO6VSO0WhMW1c7r4+RJ0Sg2OJYF9XtE5PYhh5vinQnI6/iDE4RXZ4oS0p4PX7kEWH01RKTN67vqr3uQNt0Gh3XM3MY08OF+9eOoY6nDNyeDeGvwNou3oJ8bPmYbvs5kltmc+myuo5H3QXhMTLzltKPT6nKzG0HqCkN8tJCgBBKtxQzMWWZF8Kkd6mOsVViBM0qZOs6CqCpgDIgBS64qdA5Bo9b5eDU8fUBiVl5gtSDWSlvz+wwgyUHSP16oJUEJAlpVKTVhrrdrJgq5lWM9KX9iXxwZcQh/T9VpxB+9WENUb0KYGl3EWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQTPc07KScn4cD9SmT+lZDZ+gJ8IjGy1b+DrDeluYnY=;
 b=pQwB1NDGNGNHFFto/29vwWY3O95RXw/2RdelZgccgbk+7u9VjoDaHeLiviDPWprUJ4abwZgnC1bAtUgEd8klLz6uUXgrBnXDYWHXQe4RFz2KpNOZxsljPG5YEEir+e64rWcFNbVc/FFYe3LdtARMYAzeZ267YG0M69vMKlmmauGCA3Zr7JPyHkegyhKs3IXymESjJLzJ9lypCZEPy627CClmmk30eD7jvkFl0m9LVfU2Gt4hhQ1gFFwc6QKx06V51arIp2UNE8FEecRXGoxh8+UB9IAGUbqZfKyXiXGdIvaW1FBQ5HD6GAYrF8nshDcmIyS+M0fpGyPFxstG5pw5ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB7382.apcprd03.prod.outlook.com (2603:1096:990:12::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.13; Tue, 28 May
 2024 09:17:58 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.7633.001; Tue, 28 May 2024
 09:17:58 +0000
Message-ID: <9489c21f-d397-4d19-a1bc-81dd6078ea24@amlogic.com>
Date: Tue, 28 May 2024 17:17:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a4: add power domain controller
 node
Content-Language: en-US
To: neil.armstrong@linaro.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
 <20240528-a4_secpowerdomain-v1-3-2a9d7df9b128@amlogic.com>
 <c97b12bb-8b56-4129-a292-588226a0ec42@linaro.org>
 <70083d10-483e-4daf-a408-020f0147c5cf@amlogic.com>
 <fbafc16d-d6fa-4c57-8fc8-a1db09d03e05@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <fbafc16d-d6fa-4c57-8fc8-a1db09d03e05@linaro.org>
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 7add3a97-bb49-462c-b2d8-08dc7ef710b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007|7416005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjAreDVXc3Zvc1l2T3FWeFk2Q3lCNEwyRFZKSDl5clZYQWZQRmFROWVpRU5x?=
 =?utf-8?B?ZHVtNnRzbUFCeE5NRVIxS0xBM2RxRFloajFlUXBXZzA0U3NmenFHQ2lXenlr?=
 =?utf-8?B?MkowMzdWUmRmMTI1cFR3Tm03bEJrQnBYa1E2NFFndzhqZ0lsdW10UVJGMHdw?=
 =?utf-8?B?Qy9FWmFiMGVhV3FwMmRwK1ZVMVpHZjNZNFJXYnZWTG1haU9nWEplazFla2xT?=
 =?utf-8?B?RHpQOUpJa3ZGbEc5UEV2NVpFR0VTbEpKbTBOT1dmOWpCMTRpTVM4aHI1M2x0?=
 =?utf-8?B?WWdMdThBTjJSQnl5NVhkUkRpNFNiZVRMYm5hSktxSjE1WHdwRyt6NHlhbkN0?=
 =?utf-8?B?WkRNWFMxaWlzVXhhd0RNcHlVdFpWTitqNC9CN3Qzek5mMTlhZyt0cEVvcmZ0?=
 =?utf-8?B?Sm1ZMEhZcXpPQ1hjTjRxM1R6bmZSWUtSdGVhZjl2Q0dCbDhJNjJoWit5akln?=
 =?utf-8?B?YzVJM1hXRzFiUWVHamdRbUI5b1NJVU1MdWhBQ0hLaGFEemoxZDZlWkRNVzYx?=
 =?utf-8?B?eTdqQitoMnN3aE16WXI2eWJObzFzZFc2QmxsWGI0OUJDZ2FLdWEvSjJzaW91?=
 =?utf-8?B?R2hBeW95eXRIQmN3TVZMWUM0eHkzbWMwTTFVU3Jmc25LcUpGQjVJYXhSTmM3?=
 =?utf-8?B?Vlp1bk9sbjNheWczWkdHUWUxK1VFUzdneExKZi9KcWpZekpIY0JxcHppY1B1?=
 =?utf-8?B?enpRUWs5U2ZGMXZXTTMwZlphV0E3elpXQ0hqRHBLYkk4MGo1amlESUM2NzhW?=
 =?utf-8?B?ZlFPT2tkZDNlQ1lSU2dkNHZybkN3Mi9UbTA2Szl1MkRhUjZ0LzEzUlJhL2Qv?=
 =?utf-8?B?VHRvTUo3aENXSWZaNitYak8vb0k3OTVwRTA3Nk1VTURFYmhpbThlMjN4SHVL?=
 =?utf-8?B?QjhzZmpXVTV5ZFNYMVBBcXdJMTI4WGdpa2d0dEdOOVBSYWJyUlRKK0RNbkFQ?=
 =?utf-8?B?MHZjaXFCN1dpQ0hUVzRKN3ArVHlYV3hrS1Z5cWcrR29JbGpueWFVbDY1QmZj?=
 =?utf-8?B?QWQ3ZDI3bFVzcDN2M01wZFVjSkpPTWNzbW1uZk0yN1BEdWJyZFBnbmVNTkhz?=
 =?utf-8?B?T0RTbDZXR1NTdHlaaTk1MXh6d0NSalVtSGhsczZEY2J2T1lJYkVaZGxHUnRM?=
 =?utf-8?B?T3pQWkVLY1pzTC9BM2JzZWgyTVJ4ay9URk4xNTdjWGlnd1kxeUhHd2IvbmI5?=
 =?utf-8?B?dEVRbXc0ZVR5R2NLTkxNUzhwc2t5ek92ZWVVTkd1OVFEU1QwRFZiZ0R5QkRr?=
 =?utf-8?B?QzFrZW52MjNLSWR3Kys1RTJuMGpGSDhjYmZuK0FRcG4vSFpxZUszYnFpOVl0?=
 =?utf-8?B?alg4dmI2amowYnlIUGRjaGlGWmRsd3NGMDhCNktMTTVXcGxRRDNEOTcvMWo5?=
 =?utf-8?B?RHRhMGVGMFRCMkJkcmYxSE1wZEFaelUyZDVKcEZDWDFUbXFwMEhTNktCU2o1?=
 =?utf-8?B?bHVmdDVEbEVieHlJNW91cXZkQmxHTkw1MDk3QldrOG1UaFhpWWw1d1pVMnBS?=
 =?utf-8?B?Y2VFV0p3MkZSM0xVSXdPMDVKSTcwZWVOM3QzOXdxbnpuYW5HZWFRTTlmNFJn?=
 =?utf-8?B?cmEvV3BhVFhmaXVrTkV2REhXTnptaUVCS3NPV0tUQ0N6WlBva1ZNZ1NoRFVX?=
 =?utf-8?B?QWhWZm1KZFV1N3BscVZDdEYraEc2ajdxTWRucW5sVFp1UnFMS0hXcnJUT2VJ?=
 =?utf-8?B?alpMRjJnak9VeUtXdk5XcTdWOVJ3TTR6WDZvVWdpMnY2aTYvS3FEdDh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEUreHhpZzVMaW5MaHQ1dEJPYTkxRHplZDJJeUh1eTZaeCtCdFMwMHZpMmhX?=
 =?utf-8?B?b2hJMCtWRXZiTm1COHE3emRMdklOcmFVUDhFcm1wT2c4NVRkZmVMZCtpejB2?=
 =?utf-8?B?NmVtWmYwVnJSVU8xZW5oWE5pQ3dZZHp0L1pTdlFGNHFOQ1lwN3VleHBLNXRJ?=
 =?utf-8?B?R2tJUG9ETjhlZytPMXdPa2xBN05SSXdaN2dkeXE1anJVNW82VWlyNndqMThw?=
 =?utf-8?B?TlhkNDVvaFRPQWEzZllkS1ZKVGxTbTNHMFY1SGJ3RnM5QjRNTC95alFYMnoz?=
 =?utf-8?B?a0Y0ZG9UNDVwVTNHSG9QRDJQTThHRzVYdHZsaFo2bU9BZEd6WmtReGt5S0ZJ?=
 =?utf-8?B?WlMxVEFzZGlsZ0RnTnBES0U4RVVicWo0SGJVdThOcmNSNE42Zk5LajdkUFJq?=
 =?utf-8?B?Q2JtU3RkaDkySFk1V0JQb1U4MGRUUnFPMnJtQ1h0bmdWaEQyY0xEdFl4Zzd3?=
 =?utf-8?B?TzY4aUxrdTBvNUFvK1NSRzFIRGp3c1F1R25WV244WjBjTjFDc0ZIc0k4VVM2?=
 =?utf-8?B?elExTldHRysxb3NIc0tLVWdqMGpEN3BYY3gvZ3ZPOHA4cHRIWG1KeGhoYmc2?=
 =?utf-8?B?RzlNS3V2R2JpaENWWHhOdWluZVFUSXdCeHN0ZWora2VMbldZVFQ0RThoWlll?=
 =?utf-8?B?eVlNNjhRdmY2YUJiU0RWbThkaGwzWEcrOTc4ZVA4Ukd6WmdBZml5WlRuRTRP?=
 =?utf-8?B?YlZuS0hyTXNFMkgwWGpoZ0tEQmFEVDFWQkd2M2dnYXc1NldEVlZqWTU0WmNl?=
 =?utf-8?B?YkhUQzE0MURmYWhDakI4MWdnK3F1cVFDS1JtQTdNcWV0U0hpWnlEeVZGdDJB?=
 =?utf-8?B?bWRLVEZHYms1NFBXUVdMNEhnd0lsK1VXOTZ0NnYzeDJzWTZYcE02RWlWRUx5?=
 =?utf-8?B?d0JRMFU4d1p1c3RtdW9UOU9KZWxwbmJKV25jWlg0eEtsOCs2VXVpNmcwMmVE?=
 =?utf-8?B?Sjc5SkpVazRoRWxLUTREK3FGbFI4WXNIcm1jd0w2VkYzSm9GVmNwY3pUc0RB?=
 =?utf-8?B?bXVhSE1MejBDaHJvUFB3U2ZFYUhMYkZ4bHFCZjBsbFByUUJZOTd6WUg4RWE3?=
 =?utf-8?B?bzA2WFltT09Oam9mTHB2aWRZRmtNb2dGNHBHczdCMDZ6NlBmeFRrR1BlZU84?=
 =?utf-8?B?dG54UWNwbzhpWkhsUi9zVjUvY1gyMzFyN2EzL2lyMGJLMjF3UWFkUlExUzVF?=
 =?utf-8?B?YUFaZU41UHZlZU5qMStQY0lnNytmUjllOWZrY2RpRHZ1WE9nbXhRQkFPNmc1?=
 =?utf-8?B?djVoYmpTdmVCM2VVbUh5M21kUkQvRVZHMDlOOFZmMjlnUkFhWUVPNzhIY3dE?=
 =?utf-8?B?d3R3Z3M4ZlV5TmZmOUtzM3lIU0szZ3UrVEVqTVk0WkNiRHlYaHZ2N1pEaVEz?=
 =?utf-8?B?OVI5VEs4R1JiNU5NS1dRMGFXRmVDYzZBU2E3eGZwR1Bzd3dIN2dZRzUvUmtN?=
 =?utf-8?B?UVlxYU8rS2V4MnZoWXozK2tPNlh2eHpmMXFmVFJ0L0EramdXRXBwWWZJeE9x?=
 =?utf-8?B?bllTVVliWExHQ29DQnhLYWhnSjRFS2RxOHZhbVBaa2w3L3hCNlRQNURQbzRy?=
 =?utf-8?B?amJuR0s1Y2tkaUttV21SV1hlbm1qMmswYUJHVlhvREZWanBaemFLSGhvVkZZ?=
 =?utf-8?B?TVNpUXRkNWxLckxkZ0FsbkRDVWgwTmE0dFByTkVzTEtDQllWSXZpL2tTNkJH?=
 =?utf-8?B?M0VQUlVlVU45cjg5d1Y5YXZWYjAybkFVam0xZEZlSHRGd3JrQllsMU0wWXRI?=
 =?utf-8?B?NWlreEpOc29KZWt4RzBxMTBRUE9tWHQ5RFphaWJYZGtzZm5vWFZrVFZseTdw?=
 =?utf-8?B?VStXM0FkYUthSWJ4c3NxSnVxNURaeHoyYzUrNGhJc1ExSER2YVQ0cmlabzlp?=
 =?utf-8?B?bVZMb0paR2Y2aXJqclEyUWtGTlh0Uy9KK0svNUF3RGpWRmhKSlVDNXBNcTJx?=
 =?utf-8?B?dVI3eGgyY0lBRFpzRE0vMGJVazdaRWUzTmM3U2xyV3JDRVJDb3RwTm1LbzEv?=
 =?utf-8?B?T1djNVJ4YUxueTJuN2QveU5DenRoZXNSbDZUTkhCWE9zNXFGVURISC9zTkY2?=
 =?utf-8?B?UDJ1cEx5MFMrQlU1aVVQNXgwV3Z1enY2clR6Q2lIWlpRTGU4bVdhcjF4Tklo?=
 =?utf-8?B?VXVYN09tWEpDaDlVckdZYXhZV3BwdGJNNjlPSldWSUlFeUR6N0dBdjVNdHdY?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7add3a97-bb49-462c-b2d8-08dc7ef710b2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 09:17:58.2677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i06XNdKrm/FzARZ7CCdg9gdoZvn6GoAx0bmamgzGviwoBSkiSNol0Kv1Vbk+QXLIZT16lk/1xPIQ0PmSQkOAYvirvPih935+QoK+RNJwARc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_021811_710672_DA1E8B8F 
X-CRM114-Status: GOOD (  13.24  )
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

SGkgTmVpbCwKICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KCk9uIDIwMjQvNS8yOCAxNzowOCwg
bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAK
PiBPbiAyOC8wNS8yMDI0IDExOjAwLCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4+IEhpIE5laWwsCj4+
IMKgwqDCoCBUaGFua3MgZm9yIHlvdXIgcXVpY2tseSByZXBseS4KPj4KPj4gT24gMjAyNC81LzI4
IDE2OjQ2LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4K
Pj4+IE9uIDI4LzA1LzIwMjQgMTA6MzksIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkgd3JvdGU6
Cj4+Pj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+Pj4K
Pj4+PiBBZGQgcG93ZXIgZG9tYWluIGNvbnRyb2xsZXIgbm9kZSBmb3IgQW1sb2dpYyBBNCBTb0MK
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9n
aWMuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxv
Z2ljLWE0LWNvbW1vbi5kdHNpIHwgNCArKysrCj4+Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL2FtbG9naWMtYTQuZHRzacKgwqDCoMKgwqDCoMKgIHwgNSArKysrKwo+Pj4+IMKgIDIg
ZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTQtY29tbW9uLmR0c2kgCj4+Pj4gYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1hNC1jb21tb24uZHRzaQo+Pj4+IGlu
ZGV4IGI2MTA2YWQ0YTA3Mi4uZWViZGU3N2FlNWI0IDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWE0LWNvbW1vbi5kdHNpCj4+Pj4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTQtY29tbW9uLmR0c2kKPj4+PiBAQCAt
MjcsNiArMjcsMTAgQEAgeHRhbDogeHRhbC1jbGsgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICNjbG9jay1jZWxscyA9IDwwPjsKPj4+PiDCoMKgwqDCoMKgIH07Cj4+Pj4KPj4+PiAr
wqDCoMKgwqAgc206IHNlY3VyZS1tb25pdG9yIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neGJiLXNtIjsKPj4+PiArwqDCoMKgwqAg
fTsKPj4+PiArCj4+Pj4gwqDCoMKgwqDCoCBzb2Mgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWE0LmR0c2kgCj4+Pj4gYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvYW1sb2dpYy1hNC5kdHNpCj4+Pj4gaW5kZXggNzNjYTFkN2VlZDgxLi45
MTdjMDUyMTliOWMgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L2FtbG9naWMtYTQuZHRzaQo+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9h
bWxvZ2ljLWE0LmR0c2kKPj4+PiBAQCAtMzcsNCArMzcsOSBAQCBjcHUzOiBjcHVAMyB7Cj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVuYWJsZS1tZXRob2Qg
PSAicHNjaSI7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+PiDCoMKgwqDC
oMKgIH07Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoCBwd3JjOiBwb3dlci1jb250cm9sbGVyIHsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhNC1wd3Jj
IjsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNwb3dlci1kb21haW4tY2VsbHMgPSA8
MT47Cj4+Pj4gK8KgwqDCoMKgIH07Cj4+Pgo+Pj4gcHdyYyBpcyBzdXBwb3NlZCB0byBiZSBhIGNo
aWxkIG9mIHNlY3VyZS1tb25pdG9yLgo+Pj4KPj4gQ29uc2lkZXJlZCB3cml0aW5nIGl0IGxpa2Ug
dGhpcyB3aGVuIEkgd3JvdGUgdGhpcy4KPj4KPj4gSGVyZSBhcmUgdHdvIGFwcHJvYWNoZXM6IG9u
ZSBpcyB0byBpbmNsdWRlIHNlY3VyZS1tb25pdG9yIGluIHRoZSBjb21tIAo+PiBkdHNpIGFuZCBm
aWxsIHBvd2VyLWNvbnRyb2xsZXIgYnkgYWxpYXNlcyBpbiBkdHNpIG9mIGVhY2ggY2hpcCwgd2hp
bGUgCj4+IHRoZSBvdGhlciBpcyB0byBkaXJlY3RseSBpbmNsdWRlIHNlY3VyZS1tb25pdG9yIGlu
IHRoZSBkdHNpIG9mIGVhY2ggCj4+IGNoaXAuIFdoaWNoIG9uZSBkbyB5b3Ugc3VnZ2VzdD8KPiAK
PiBUaGUgYmluZGluZ3MgbWFuZGF0ZXMgaXQgdG8gYmUgYSBjaGlsZCBvZiB0aGUgc2VjdXJlIG1v
bml0b3IuCj4gCldpbGwgZml4IGl0Lgo+IE5laWwKPiAKPj4KPj4+IE5laWwKPj4+Cj4+Pj4gwqAg
fTsKPj4+Pgo+Pj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
