Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB76C369D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 08:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyOusEhUe8gIZgC3H2lyFW4EQfkV4kE89LLHE3m9BBY=; b=jqM1XJqsSzK4sZpkgJj14IwT8S
	/vM9rAjLaDhclt0FVMn6FiU87TWtTdmnOycBGGyYKPoHvN78aKRpWFqIjcBArJlW3xmX2u7aDCRxG
	4P1OF0myZYy51Q4Ua+XJZ3o89bkq3WCqg2pQ6Hcb/o3gILdjfJyHH84kAjFK8HU31TbpBT97HmvR+
	WcomARD4LbdwguK5BJoE2Abl1maSZfWznPGFsogvwrmZq39ULWMkeV5rCikvHo6j1XOmpbn8epa2/
	SMdUWZQaO3pZvC1aRj1yvQqK1f5oBE5yagJsS4RL8cnNouGZCHmU6bahBHvHu0/lcC9zMwqgenmX1
	BA/np9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jai-00000005Mjh-0nNr;
	Mon, 28 Apr 2025 08:11:52 +0000
Received: from mail-eastasiaazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c400::3] helo=HK3PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JNQ-00000005KrJ-3xZI;
	Mon, 28 Apr 2025 07:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDZqhfw72Idlw5wf4Lz3rOSJsXlNBEry9l45z2MUz0fihbHTvoSkoWbfhke/M0z9C/SfZGUOC7AoVLeXXZiokDr1EEWPTNPvBUMjFOZqsiK0SmLdPoiCHKcATJ2sj1yWNI589AsVlrtC6gpqm0Psd9jfHbAC9XR4sg6N67FH7F0oGzgYJkzPfhoODLK/zH15pvmM66DUdjr7lx9d8igCFcFyNSMy0w0p3bHOQpcwMtE6QfD44C+Elo0hiS/45qfdGo98/X0ao2uZE1DEebAit1vPMt83OSzxMtphYpjFlRVRXbA2svef9+k8qUhcUuhELIV1JcK1MlO1uIvLA+gqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db4HFvC+5/fBpx94pvGNZj2ebrFcPRcQXVnIVayqJkc=;
 b=BN2P61rqONXB5tG6moyeMdr8vF5cpBW4Fe5Eo2JCG/S/acF/bT67WQp43BvG56As3xSEhoUcGyud1qZj0bxBOtOYZjIDnsZyWjzQPkn8eZIV5wZR4Y7Gzr+AsBXHsdDcHTMVjA/z+SBTLsaNGEIWFZ67OVAsLamU1mgB1aQnWKNT9/aUgUqCrP514roI8Nn/QCjLfzsOqqc7atl5nN2VYUBX9BLxKzEptmKSATfmNXKhhY2r3u3x5WzxBlvea07xysOk1FbYD5ELniCBAMeio3LHBBlhwywa+G/KSZxzSRsVpm05eqKQl+znEy7ddeBo8xS/kP+K0xRJiyZuKSgvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db4HFvC+5/fBpx94pvGNZj2ebrFcPRcQXVnIVayqJkc=;
 b=WQUe9VIz8FkOhy6wxQtF1WpEbKA7TczElxkQhLkfhCHIPoQhbXhl4N/1yNXNrXiHes1f75tEOgV+sdrWHJkVel8UBTqzfOl8p/W4be55sbOaKRYk8YRhW5hVQ7lsy3ElhgnnShGD1XX6r/a0bmrYi/C68Q4+B8e7hKFC9ZNdYg4+UlSnYNSUu9IVR0qk/D1yWck3DW8WYr20wvzTExv046VU9CeBcxYZTx0EzCOf1GVsL4cpfzawrJUFF3Su9ybB2UVEA5aGGVSfWTIMC2Csbbjcf6dqx4QO9hbh5NxWj7tGCqI3HNLSUki8Tju0WnZv5KFyU+Xx858djnOXeyaMHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7889.apcprd03.prod.outlook.com (2603:1096:101:165::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 07:57:52 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:57:49 +0000
Message-ID: <32473413-b2fb-471b-b2d5-b4fd7914b57f@amlogic.com>
Date: Mon, 28 Apr 2025 15:57:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Baisc devicetree support for Amlogic S6 S7 and S7D
Content-Language: en-US
To: neil.armstrong@linaro.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
 <a175ed1d-9e57-4150-af8f-7ca785203108@amlogic.com>
 <e3229c42-b322-447a-ad1e-86c6f20dd54e@linaro.org>
 <be8b7874-1251-4ba8-9243-a615517861ab@amlogic.com>
 <eb1c3442-6b86-42e9-a672-eaba7de8b375@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <eb1c3442-6b86-42e9-a672-eaba7de8b375@linaro.org>
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec6b3e1-00fb-4ee0-d59e-08dd862a5e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rlc2ODByNHMvdlNEMEV6UFZpWWJScCtKMnVUelV5Nm13NWVqNm5EdFY3b2tw?=
 =?utf-8?B?eSsvWHlEb0pEUnJXZ0VlVzlzR1R4REFaaVU3YmxuTEpNZ1dkbXZtTUhhTnNE?=
 =?utf-8?B?T1lUbG52L3ljSUlPNy9VcUpxN3JJcUpPbmd5UTN6alp5VUZtcy9TZXMzTmdw?=
 =?utf-8?B?OWdMUG5kK2pMQTU0UHgrWGJjekMzbHVMcVNyT29RWFFxK1oyZGwxb2cySnc3?=
 =?utf-8?B?enFNWU1pZnVsWllpelRTZ2VzMmJJSUVPSmE4eDZQTGZ3RG9pMWUydW1mL0FC?=
 =?utf-8?B?YXFtYmJMWi9WQmYxK2Q2TUhDTDFkaEY2L1gvRjBEUDFWZGZhUnlMUTRDeEZE?=
 =?utf-8?B?bmZUV0tPY0hjd1lpQStGTSt3MmZFeTBxTmdxSGNDVDl4VHFyR2VqN0x3cXg0?=
 =?utf-8?B?TUtNNzZtRW1UNUxaaThqcjJ0a00xTXJISlIxSFVhRUp0MTRrYlB6bDJVa1ox?=
 =?utf-8?B?RjVQZTFWTUlnRkFEVjc3UjF5Tk9MZ09BNmprNklTWmZsNUxJQnhyanlsYjRC?=
 =?utf-8?B?VUlqYXpWRzJETGpxTHJNdTU4QU1ZZWJ2TFlCOVFNRWlvRXZqbWZIYnNsWk5I?=
 =?utf-8?B?WmRxd1RCTkpRRkFjbC9uYTNoNGg1UjIrRUxRczYxVVB6NXBZQTFSWlVnYjZK?=
 =?utf-8?B?aHlYTGdPa3NBYzJLYml6U1A3WVFvMnU0UnZZbVF3bTZvaTlVWnN6VXRjV3RL?=
 =?utf-8?B?cThtL3NIaXdrQzNWU09iVkV4SFdXMDNrWUI5VUIxV0tmaHlreU4ybWFtTDQv?=
 =?utf-8?B?NGRqbHhEVEl2dDQ3d3BTVXVIN250M1U5WWliQnZ4VHlnZnpSbXJycjg4T0xj?=
 =?utf-8?B?QU1rSCtXbVIyRXd0bW5VMnJPY1gwdDNmNTBMYVpiWGY4L1BZR3ZtTjM4RUZj?=
 =?utf-8?B?UXFuWDEwZ3Frb21NT1hFRUNLQ2FmdlBZcW1FTGFxY2dnaThvVjQzZ2RzajdL?=
 =?utf-8?B?QU5ZL2NTRVBwWTk4eWpEaDR6MDcySzN1dFdKMzA3dmNVR2xGNzkrMitTMVFi?=
 =?utf-8?B?cXBIRkwvQ1FWbG4vVGdjUnVwbGZYeGZMakRER1NST1REbEpMSlo3d2JnMjln?=
 =?utf-8?B?Y3lQTjErYU5GTGUrdzYrdmhBbHo4cXlkenhkNzdDZ3N0VVlMU2hqeXRHVTQ1?=
 =?utf-8?B?NkRLSUxwazJVUEF3WFJKOGhvc1NyOC9iT2p3cFpWdTZlbnkwaHB1cEpOdFVR?=
 =?utf-8?B?QkRBVjYwdzhSaVVURk1GcG5CZzRKR2JncUJUemxsSFlkdkl0aFF1aDZzejd1?=
 =?utf-8?B?ZStyL3B0dHpxekNIdDFEOE1nUmlJc1lONTFZcWpxTHkvcWNnRXpvMnlXQnhr?=
 =?utf-8?B?dnhnWGZsOUYrM3djUEJ2bmE4bTlpb2dIYndKbDZWV0xldjhobU1EelRhbCtI?=
 =?utf-8?B?eis1SUFFNmNTUTR1bk9wSWc5NlFnYWxuWXFlb0drMnRyZ0ZoQnA4bHVBYVBO?=
 =?utf-8?B?ZXNEdUthMTdyMjljNXJlWWJ0MzZYSWhmdmJXcnN1R05XSWNURzZaRmxkR1RZ?=
 =?utf-8?B?L3AzbElqSDdFQTFlNjVkZmxnQVdBT1c1UjRSTGJXS1pPcit5WXplY3laOWRE?=
 =?utf-8?B?MlNYYWM0MnNyOUhkdWpPUHArWmxPZ0lYTFFPcmg1anlyMGwrelFiT1ZwMVhO?=
 =?utf-8?B?dVBBZDY3cmhVRHh4TmNOUW4xU1kraDJuOXhPOUYwRUJab0tyMjJKUzVjOERh?=
 =?utf-8?B?TStwTzVNRHRRcHBqQ1o0VHFGN0pQdG84VnpFL2NndHBaNVp0WnQxVzJSRUNE?=
 =?utf-8?B?ck81VDJCY3h5QW1EM1NHSWpIdUV6Qk1nKzZhbHlzNWlCdi9ybVFYdExPTzMr?=
 =?utf-8?B?MzhIUDZEeVFnazd6UmtLeU81dzAvSnhYZGZtbjVTRFhVNFBXR0Njc290VU9I?=
 =?utf-8?B?L1FVMDNGdnRxRURQWTJ0dDJhM2Q3M1Y2VG16bUJxTFBNQVFJL1gxQmJ1cXRL?=
 =?utf-8?Q?3K01A55mh6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0l5N3g1NVMySWJRM2hNM3NDV0dJaCtEZDZMUE52ZEswYkk3OFJsN0lNZTIv?=
 =?utf-8?B?RXh5R0cxSkQzQWswUWtJT3hjTWZOR3V0ZlhoRThGVHNZZFc2WWxCam10VWZC?=
 =?utf-8?B?S0xkNmlicXlSUmd6VExEbTRObHErcFpxSHlqMG5wZFFJVnNrRXlwMUlrTmR2?=
 =?utf-8?B?VFlWMDNDa3UxMGcxeFEvVExsOVRGcEd4VWJxYVpkcmIxL3Rab1RPYnZhbTVi?=
 =?utf-8?B?T1lHV0RuQzJod1lhNFVQZ2JOVUQ3dlpsSHIycjF6aGZEdDdkVnlSZ3BTck5u?=
 =?utf-8?B?Sk55Zkl1b0ptYWl6SVJHM2Naa3FiKzl3cFB2TGlYVGJ1alVlTDZTSHV1Nnhw?=
 =?utf-8?B?cTNjTVplalFyQngzNDRocCtwYWtMWGVjS1czUVIvK0xxdlg5L0xmNGtuZnJn?=
 =?utf-8?B?TjhUY3BWTm5mdlJHS01BeHZ6NWFDZ09QanQ4WXA1Y1Z5S1lQZVF0TTZtbkxR?=
 =?utf-8?B?UHFoWlBmcndxMXd2dFlkYnJrM1Rkc3kzWUdNTThiYXg3SWFUaXRCOHNyN0x4?=
 =?utf-8?B?bXdjazdOTmw2VHVuNEZ5SUhLaVpKY0lZb3BNUlkwZ1MrdTB6S3hWcnhzK2Yw?=
 =?utf-8?B?Mmp1NzV4RUN6ckM5VDVzYmRaUlQ2RThqTWozOTgwbTFNbjVNR2R3eHo4cnJh?=
 =?utf-8?B?V3l5WjNJU1owVFVyL3czKzZnb3kyNzJ5YkhIMmkrdndQQWxkQnFDdnlUNDRn?=
 =?utf-8?B?MFk1YSs4QUo4RFhSWkJSTk95Z2NSajJOOTZuN0xlZzMyWXl1NStWZHNZakor?=
 =?utf-8?B?c0VzQVZkaTIxQmFDdUQ1TWtQNUx3SnJydTJGeCsyT25KMXFRWXFId2FySldC?=
 =?utf-8?B?LzhUd0pZc3Jmd2IwWmhSZXpkMFVMbGxRWmlKOGhYMUhJeWUzcmlJZVpKRUp3?=
 =?utf-8?B?eGxkb3NDQVNtaWd3R2pScFJsem1KNHBsRER0d1ZBbWplQkNySWdJSm84ZnpV?=
 =?utf-8?B?TEt5MnY3cTFVa3JSSGQrdUd3ZTljY3pMY2VoR3ZWU2tuUmpWdTkveVR3alhU?=
 =?utf-8?B?RzIxZUpyd0NlTzc2dm5nS2pnSFhKeWMraTRTWmtJOUhJb25tbGxZRGVpeUQ5?=
 =?utf-8?B?WkVSUHd6Sm5PZklJMElQT0w3RXhFRXJSd0xidWFNemlqK1pGR2xtL09tdExv?=
 =?utf-8?B?dGYzS2syTkpSWlA0YmIzSXVNMk5CT3MwNHNLb2VWRGxrNkNzRUpmUy91LzJR?=
 =?utf-8?B?VE01UjY5a3pqalRiOENrMk0rNytLZjE0dFZJODRwV1E1a2VMcWNuS1BtN2xN?=
 =?utf-8?B?MXBnZmpIVXkrekR0M1l1aDJTd1VROEZaeHV2SUd5L3ErK3VHOXU4Yll2bWVL?=
 =?utf-8?B?L1YvWTVSWmtRWFlkREFmenF3dkUxbE1zN05hODlSV04xNXpXVU5PV3pKQUJj?=
 =?utf-8?B?Q1hmb0pKVzNza2U2WnVnYUFsUFlrUXhwTmpWaHIwMWtlbWd2ellud0NZWXNC?=
 =?utf-8?B?YkZ6OTVoL2VLWVcvVjRhR05QaHZjV3BzRE5YZzJZQ0cybnJnQkF4TExQc0Z3?=
 =?utf-8?B?YkxKNS9wVzJXVXFiQnZibUtncGl3VlU4NTBKRDZQcFp4djBETEg2Und2dGh5?=
 =?utf-8?B?U2dKa3l0b0MzTXR4em5kdHhyZDRkYUlGRHcvSGpWZ2g0ZW9sR1RicFpIODNt?=
 =?utf-8?B?ZUhzMHREVmIrNHBDZk9lRjJsVit6aFJ5a1VlWCtza0p2MHpmRXVHRnBsOVZT?=
 =?utf-8?B?bmlOVlR5aUpJcGQwSG5ZQzRSNFBOeDRGOWNhRUNvZThaWGlKUW1DS0FqV0Vp?=
 =?utf-8?B?MXgyenYwUlFLbnVUTC9oOFdsNkpxdjJPVDZuTFNFR1VRVTBmOEtHVlhrNjJq?=
 =?utf-8?B?ZGloU3l3SmhkUUxFS3dJaDhZVTIyUEZsbTZya3cxdndYL0JzeW9ST2l3Slg2?=
 =?utf-8?B?a3czVzRKRXErZnJZWkdKYWJjdGJBRVlkSUNSS0tpZGlOaHJCUlhTNlVLZ2w1?=
 =?utf-8?B?VWJmUHRtKy9UdVpzRW5kTytjYnM0bldwbml2RGtZSDdSUnMzaEJadDhWclZx?=
 =?utf-8?B?cHBMWjVQL2lGY1pZazNnV3I5VTBzYm84d2pmaEhoV2R2VTU4aWlMMWl0UDRn?=
 =?utf-8?B?NzQvb2hGMEFXaWcyZHFnbkk3UnVEWFZQaFhESGV4Y1U1dzVVYUFaK3JyN2tl?=
 =?utf-8?B?SmFRUVVaaVZzT2dDbEFPdlp1SXZQSTA3UUFtQWwyVENGWTMyUlY4a0tQMlFI?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec6b3e1-00fb-4ee0-d59e-08dd862a5e8f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 07:57:49.1307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: An8t/DnRxm25MjWFWe6w9wwrdtNDKwjd6oluYYlQjZFPNFbAgDTfyDO0PGhebP/IDR0I7XDLJbIOEqLYC8q7A7+EdSsUUfPAZrA4ncLh69Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_005808_987064_0E5B0DC2 
X-CRM114-Status: GOOD (  14.78  )
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

SGkgTmVpbCwKICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KCk9uIDIwMjUvNC8yMyAxNToyMywg
bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAK
PiBIaSwKPiAKPiBPbiAyMy8wNC8yMDI1IDA4OjE1LCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4+IEhp
IE5laWwsCj4+IMKgwqDCoCBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCj4+Cj4+IE9uIDIwMjUvNC8y
MiAyMTo0OSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+
Cj4+PiBIaSwKPj4+Cj4+PiBPbiAyMi8wNC8yMDI1IDEzOjQ1LCBYaWFud2VpIFpoYW8gd3JvdGU6
Cj4+Pj4gSGkgTmVpbCwKPj4+PiDCoMKgwqAgQSBnZW50bGUgcGluZywgdGhhbmtzLgo+Pj4KPj4+
IEknbGwgYXBwbHkgdGhlbSB0aGlzIHdlZWsgZXhjZXB0IHBhdGNoIDQsCj4+Pgo+Pj4gc28gY2Fu
IHlvdSBzZW5kIHBhdGNoIDQgc2VwYXJhdGVseSBzaW5jZSBpdCBnb2VzIHZpYSB0aGUgdHR5IHRy
ZWUgPwo+Pj4KPj4KPj4gSSB3aWxsIHNlbmQgcGF0Y2ggNCBzZXBhcmF0ZWx5Lgo+PiBUaGUgZm9s
bG93aW5nIHBhdGNoZXMoNSA2IDcpIGNhbiBiZSBub3QgaW5jbHVkZWQgZm9yIG5vdy4gV2l0aG91
dCB0aGUgCj4+IHBhdGNoIDQsIHRoZSBjb21tYW5kICJtYWtlIEFSQ0g9YXJtNjQgZHRic19jaGVj
ayBXPTEiIHdpbGwgZmFpbCB0byAKPj4gZXhlY3V0ZS4KPiAKPiBJIGtub3csIGJ1dCBzaW5jZSBp
dCdzIHJldmlld2VkLCBHcmVnIEtIIHdpbGwgcGljayBpdCBmb3IgdGhlIG5leHQgCj4gcmVsZWFz
ZSBzbyBpdCdzIGZpbmUuCj4gCgpJIGhhdmUgYWxyZWFkeSBzZW50IHBhdGNoIDQgc2VwYXJhdGVs
eS4gRnJvbSBSb2IncyByZXBseSwgZG8geW91IHRoaW5rIAppdCBjYW4gYmUgcGlja2VkIHVwIHRv
Z2V0aGVyPwoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBTF9Kc3FLRD15ZXNwZDBXTTkw
VkJyX1hXZHBwaW16RHplY213TmZHTVYraE5TSHVSQUBtYWlsLmdtYWlsLmNvbS8KCj4gTmVpbAo+
IAo+Pgo+Pj4gVGhhbmtzLAo+Pj4gTmVpbAo+Pj4KPj4+Pgo+Pj4+IE9uIDIwMjUvMy8xNyAxNTox
NiwgWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheSB3cm90ZToKPj4+Pj4gWyBFWFRFUk5BTCBFTUFJ
TCBdCj4+Pj4+Cj4+Pj4+IEFtbG9naWMgUzYgUzcgYW5kIFM3RCBhcmUgYXBwbGljYXRpb24gcHJv
Y2Vzc29ycyBkZXNpZ25lZCBmb3IKPj4+Pj4gaHlicmlkIE9UVC9JUCBTZXQgVG9wIEJveCBhbmQg
aGlnaC1lbmQgbWVkaWEgYm94IGFwcGxpY2F0aW9ucy4KPj4+Pj4KPj4+Pj4gQWRkIHRoZSBuZXcg
UzYgU29DL2JvYXJkIGRldmljZSB0cmVlIGJpbmRpbmdzLgo+Pj4+PiBBZGQgdGhlIG5ldyBTNyBT
b0MvYm9hcmQgZGV2aWNlIHRyZWUgYmluZGluZ3MuCj4+Pj4+IEFkZCB0aGUgbmV3IFM3RCBTb0Mv
Ym9hcmQgZGV2aWNlIHRyZWUgYmluZGluZ3MuCj4+Pj4+Cj4+Pj4+IEFkZCBiYXNpYyBzdXBwb3J0
IGZvciB0aGUgUzYgYmFzZWQgQW1sb2dpYyBCTDIwOSBib2FyZCwgd2hpY2ggCj4+Pj4+IGRlc2Ny
aWJlcwo+Pj4+PiB0aGUgZm9sbG93aW5nIGNvbXBvbmVudHM6IENQVSwgR0lDLCBJUlEsIFRpbWVy
IGFuZCBVQVJULiBUaGVzZSBhcmUgCj4+Pj4+IGNhcGFibGUgb2YKPj4+Pj4gYm9vdGluZyB1cCBp
bnRvIHRoZSBzZXJpYWwgY29uc29sZS4KPj4+Pj4KPj4+Pj4gQWRkIGJhc2ljIHN1cHBvcnQgZm9y
IHRoZSBTNyBiYXNlZCBBbWxvZ2ljIEJQMjAxIGJvYXJkLCB3aGljaCAKPj4+Pj4gZGVzY3JpYmVz
Cj4+Pj4+IHRoZSBmb2xsb3dpbmcgY29tcG9uZW50czogQ1BVLCBHSUMsIElSUSwgVGltZXIgYW5k
IFVBUlQuIFRoZXNlIGFyZSAKPj4+Pj4gY2FwYWJsZSBvZgo+Pj4+PiBib290aW5nIHVwIGludG8g
dGhlIHNlcmlhbCBjb25zb2xlLgo+Pj4+Pgo+Pj4+PiBBZGQgYmFzaWMgc3VwcG9ydCBmb3IgdGhl
IFM3RCBiYXNlZCBBbWxvZ2ljIEJNMjAyIGJvYXJkLCB3aGljaCAKPj4+Pj4gZGVzY3JpYmVzCj4+
Pj4+IHRoZSBmb2xsb3dpbmcgY29tcG9uZW50czogQ1BVLCBHSUMsIElSUSwgVGltZXIgYW5kIFVB
UlQuIFRoZXNlIGFyZSAKPj4+Pj4gY2FwYWJsZSBvZgo+Pj4+PiBib290aW5nIHVwIGludG8gdGhl
IHNlcmlhbCBjb25zb2xlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW8g
PHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IFhpYW53ZWkgWmhhbyAo
Nyk6Cj4+Pj4+IMKgwqDCoMKgwqDCoCBkdC1iaW5kaW5nczogYXJtOiBhbWxvZ2ljOiBhZGQgUzYg
c3VwcG9ydAo+Pj4+PiDCoMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IGFybTogYW1sb2dpYzogYWRk
IFM3IHN1cHBvcnQKPj4+Pj4gwqDCoMKgwqDCoMKgIGR0LWJpbmRpbmdzOiBhcm06IGFtbG9naWM6
IGFkZCBTN0Qgc3VwcG9ydAo+Pj4+PiDCoMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IHNlcmlhbDog
YW1sb2dpYyxtZXNvbi11YXJ0OiBBZGQgY29tcGF0aWJsZSAKPj4+Pj4gc3RyaW5nIGZvciBTNi9T
Ny9TN0QKPj4+Pj4gwqDCoMKgwqDCoMKgIGFybTY0OiBkdHM6IGFkZCBzdXBwb3J0IGZvciBTNiBi
YXNlZCBBbWxvZ2ljIEJMMjA5Cj4+Pj4+IMKgwqDCoMKgwqDCoCBhcm02NDogZHRzOiBhZGQgc3Vw
cG9ydCBmb3IgUzcgYmFzZWQgQW1sb2dpYyBCUDIwMQo+Pj4+PiDCoMKgwqDCoMKgwqAgYXJtNjQ6
IGR0czogYWRkIHN1cHBvcnQgZm9yIFM3RCBiYXNlZCBBbWxvZ2ljIEJNMjAyCj4+Pj4+Cj4+Pj4+
IMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIHwg
MTggKysrKwo+Pj4+PiDCoCAuLi4vYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55
YW1swqDCoMKgwqDCoMKgwqAgfMKgIDMgKwo+Pj4+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsKPj4+Pj4g
wqAgLi4uL2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1zNi1zOTA1eDUtYmwyMDkuZHRzwqDCoCB8
IDQyICsrKysrKysrKwo+Pj4+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dp
Yy1zNi5kdHNpwqDCoMKgwqDCoMKgwqAgfCA5NyAKPj4+Pj4gKysrKysrKysrKysrKysrKysrKysr
Cj4+Pj4+IMKgIC4uLi9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtczctczgwNXgzLWJwMjAxLmR0
c8KgwqAgfCA0MSArKysrKysrKysKPj4+Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L2FtbG9naWMtczcuZHRzacKgwqDCoMKgwqDCoMKgIHwgOTkgCj4+Pj4+ICsrKysrKysrKysrKysr
KysrKysrKysKPj4+Pj4gwqAgLi4uL2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1zN2QtczkwNXg1
bS1ibTIwMi5kdHMgfCA0MSArKysrKysrKysKPj4+Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL2FtbG9naWMtczdkLmR0c2nCoMKgwqDCoMKgwqAgfCA5OSAKPj4+Pj4gKysrKysrKysr
KysrKysrKysrKysrKwo+Pj4+PiDCoCA5IGZpbGVzIGNoYW5nZWQsIDQ0MyBpbnNlcnRpb25zKCsp
Cj4+Pj4+IC0tLQo+Pj4+PiBiYXNlLWNvbW1pdDogNzNlNGZmYjI3YmI4YTA5M2Q1NTdiYjJkYWMx
YTI3MTQ3NGNjYTk5Ywo+Pj4+PiBjaGFuZ2UtaWQ6IDIwMjUwMjIxLXM2LXM3LWJhc2ljLWYzMDBj
MzA4NzdlNgo+Pj4+Pgo+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+IC0tIAo+Pj4+PiBYaWFud2Vp
IFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+Pj4KPj4+Pj4KPj4+Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
