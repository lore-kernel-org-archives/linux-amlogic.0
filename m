Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670C0CAC5B5
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Sep 2025 03:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wEzSTMHSDreNDeaRQxE0BJhYn6gWgMWU2CYl4sgp9o=; b=KIjIscjoQIhGQIWkP5GhVa5lUJ
	ZRFA+DL9w48VJcuhuQVYqiVA4Hn/oKe52NvZW3N//oiJ2kNTUM+plVq18TxkBJsvwh8gG7lNcHMYA
	cIRNTpKWTB0DyQdQhUXd3zh391IqxSki8n5u1iGuHnh+lS+Stp5rnAppnuiOcxiWOmttPhzhzXEAd
	xbIcACTiDf+gvXl22umb9eXwkaOm8NxAAEkh5bzy9kyVzguUvbNQBaSCF+9i3amV5SJhZpNqGyfgO
	KZvnd6g0vmrSHZJbdNb1UQqJ3AoHJ+iPULMyxerq6jRyi+/2Am0MTJkk9gRVE4VJLRIu8z2Nmpjmk
	cLMAaUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v34Nw-00000001DPl-2LEl;
	Mon, 29 Sep 2025 03:17:08 +0000
Received: from mail-japanwestazon11022136.outbound.protection.outlook.com ([40.107.75.136] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v34Nt-00000001DOa-2e2X;
	Mon, 29 Sep 2025 03:17:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAGVgYzPkZMJJ7Ybgnm+1yINWvSGP9qPkY8oLvqdsmzYI+WUiMjJpxN2qHzeebclCyhIOZ0BmOlIDc6ORqfV3y2zGBawftYEPinRjrNMRE+usycVF2W54oWVl1S8PAh8aWQp4EqiftttfU2Jb1iqVOR7uHGRGBA4BN3ZUpDiuOrV7j+42/5yB6iwhpnp1tiQ6GyLGUjpM687OhjFGLzKg8E1veTvi2ffDPA9rc5lCrI6pm5yorW8zBO3D5yD09SFyiqqxfrpgCmGnQqZ5FQo7dqZtLE6uHOgoxd8PfYGiB0zYEp8z22mJE3kp9KPvB1jKXXN2RHt77I/xQ0ztCfQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt1QSmgRejrd+NrfTWSKN0EhNtY26T0rV8lKeG4yNQg=;
 b=Ot+rdoWDerZIXBrTjCGzBRiK1Wepta7DPcBX/y7DwWacjadAxGg6MK+hdodZkE+gF8u/PHOzmIr9v4WUtu70NTx4WbYjcdBi6LvFRIwOxhaRbkyA6LZz5Ly3DveURbO7/RUK+GyZEOtcDHAbVnSFzvVFs2JCMYGFtZTDuHalAsw0aZexlYfMU3iWY4TsTZixaFPDaORV+vhw7mlemUMeUjAPhBcXgYehZOT4QuZsgxSwYTXCXS+wQvVOHRD/lrlw8Aw7Za87V48hhIJaJd5QXz+jMJveBT87PpeLEfuwShD/P2GVGqaqQYYnwonQY5KBnVn0Vezruj3ns8ivwifZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt1QSmgRejrd+NrfTWSKN0EhNtY26T0rV8lKeG4yNQg=;
 b=nCWlB4NUjKZ9BY93+w6EWzc9Y7ZzxyqSRjuAcfOKklndfRQwRVwr3KOFcxIrY/s42SLz5acQvfltyNWyrflXwHqmfuJETb7L/9Qp9bLGHngmq2n26/55sRODnJ/0JloM3JSbWyDS3qvmbEewHjC9SI8if6/OE6YOUAUHtbFWBEN/VAvwX2JaAOrje1UNjqhr8q5vC+2s39cDOT6gIkfnGisJVuC9Ai6DJMjva8S8BaFRhV8gVpigJSoPOVP2xDJ8djccMjmKqzVBjXlWw82H3qguA0U0XPLrIVdYkYfotKI/IwSmKtDq36eXLa2TY9K7BJwNKLZgbIRSPuJmuN0/fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB6816.apcprd03.prod.outlook.com (2603:1096:101:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Mon, 29 Sep
 2025 03:16:21 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 03:16:21 +0000
Message-ID: <eee93d9d-2977-449d-8792-b2416f0c09ad@amlogic.com>
Date: Mon, 29 Sep 2025 11:15:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
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
 <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
 <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fa7adf-5e81-464b-f392-08ddff069039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R281d2REOUxTKytnMWFtdkEyQ1A5bWxJeTJjT3hQNDA4d0ZzbVJ6RTVyREZa?=
 =?utf-8?B?NFBnMGJmQmxTaTFsQ29pSS9ibUZSMHBmV0NsbjZXUmdQblVLa1BVYWREYmN1?=
 =?utf-8?B?cUVtZWZobzhVYndmNjNrZ1FjclpTZFhySksxc1hRZ0VrTjhqa2owMFRWOHVK?=
 =?utf-8?B?M052OXB5elI4Nm5PRHRBdXd3Q05aMklMQS80ZkNzOS9xbytDdklGYzhFYk1R?=
 =?utf-8?B?MElXcG5JVzZPY0xnSURyS0ZRU0x6UkM4cWRzVm9jak9QSE04bWF0eEdvYlVB?=
 =?utf-8?B?NFQrSTBoRUdHaStEbmVZME1BVUlucTdXUWIrek0vUmVKZThNajV6cHpSMy9M?=
 =?utf-8?B?WnQvM0ZsZHgxandXL2tzRGl6VW9CL2tOQ2tOU29YUmIvMFNqcFVQclZOVEdk?=
 =?utf-8?B?U2ZiWEl2UEVpUnRlc2FaYmpPMHpDeFdhdmxqeVowSGZONnlMU2xTZXBDVXNL?=
 =?utf-8?B?MmxHaG9NY0xxVnNjRmZ6WElMRzVINEFTSW52SE9sZi9XdWNJTzZiOXdFTU94?=
 =?utf-8?B?TW11UVB5dXJFeURqUlE1c1pGckQ4U09IUXhkRldGSWoyUTVZQW84bVpNOWZ1?=
 =?utf-8?B?cjNPa24rbVBnbUdzbVR2TFhvbkFNWmFyVkhoT09CVWl4OGx1K3RreW1qeW9F?=
 =?utf-8?B?ejlzUVpyY0x1YmRHc3hGV1IrZlA2MWFhT0RBSklSZE5sRzd3K3QyQ0oyaUdy?=
 =?utf-8?B?UlFtc2tOV2lIMUNKWFh2MlpKb0lSM1dkcEphRTJVL0JBdld2RDNkV1BHK1BX?=
 =?utf-8?B?TDQ5QU1TUnI4L3dJSFJoUk5JNlpabjBydXFNSWZZS1ZPc2hXdXVzaUxRbmoz?=
 =?utf-8?B?d1JYT04xOHdSQVMzSzF2NTY2T1RIcStJbEVDRU9pM24rTlNpNHU3NjFCaExK?=
 =?utf-8?B?S0NHVExCdjhQT0lkTEpKK3pTQnBjUWJuYUdIMzVUVkhGNmRlRmZxcUlMZHdp?=
 =?utf-8?B?WXJXNERBVTNENUF6TFFKbXNtQ1VnR2hLSkRwUk1mNkRYcmE5VTVwUEVzaTRI?=
 =?utf-8?B?a0pycEJwcUljcm51MkdrSTlCekM3NzdUeTc4OUZaRXgyQlNYamJZNTEwZEV5?=
 =?utf-8?B?SlRobzdQWlRSYzNVY1FqbysvN2ZNODFWS1lqY2ZnK0ZkVmR5ZHpJUkd3RUNZ?=
 =?utf-8?B?dzFVZTU0UHl5ektoNFhPeVVzeGUzWjBPbjRnR1pUSVBRNEtiYmdKMHdQUjdJ?=
 =?utf-8?B?eU1iTG5TUDRLVGpHZTJKaFRUUUF6ZkIrMEw2dG52QlIycUFFOExVOVhwY2pD?=
 =?utf-8?B?SkxzbzFCWW41UjRZZU5mMHRWeGlhU0o4TjJJMEVzQytDOFBEcDlJb1NDVTlO?=
 =?utf-8?B?cXVYMUp6Ky9aSm16ZENzWlVVUTI4Z0pvZk9DZTNKWFMxekptb2QwNVdXcXRO?=
 =?utf-8?B?ODUrN2Y0Y3NQYnJJWk9IZ3BETDNkMlptYm1iK0tjL1JnblU2QU9ZcWh4eCs5?=
 =?utf-8?B?blh5U3NjRklTMEVseDF5dVFLbHpKdWFnSGFzM0VWRzBhbGRnUEFNby9ac1ZT?=
 =?utf-8?B?OGIvbnc5NlRNb3BTNWtVQzI3SS9XMENTK2tsVC9VZ2hmMUF1N2xYejlaeE1Z?=
 =?utf-8?B?aUd0eEdrQ3BzdnMxUS9tcEh5SGdhcWIrcUNpY25mbnZybkM4RkRXaktTM1lZ?=
 =?utf-8?B?cEdSRnZkcVpmV29OYWxnT1JpOHkyWUFVdnkzUWpNNDBsUTdIaWRnTmwvK1B5?=
 =?utf-8?B?MWdsZnhwelhpbTh6ZVZNQWltUWdvdU9UY2NOZllnZVBVQVpVNnRjOXg5NVFw?=
 =?utf-8?B?ZGVkNWtXeWxzZlVrZzN2RGRMbW1mV1FJMWNhSXhhRVZuMjFmQ0NpSkxYNzJq?=
 =?utf-8?B?NUhBdjlGV3VxOTJFdXNMcCtKQm5BaWJyeVRuTjcxd2JVc3h0SWFzeHIyZnVI?=
 =?utf-8?B?OEMxeThXOHhNZlpyQThqSGJmU3RCU3hkS1JOM1JXWnFaNEY3alppelNDRGt0?=
 =?utf-8?B?TzlVOVJxTVFyVlcvSE5BalpvYzR2SXRPWXo5d1VMc1p2NTRydEw3OGI5TnRX?=
 =?utf-8?B?NVRjbmZ3QTJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNRYkxXNytjZmtqS2U5MkM4VUpEZHE2enBpMHBqWXVzd0pPaVpEMGtISVRu?=
 =?utf-8?B?SFI1VjEwalB1OUgzRmdscmNlV1I3S1FoUXA3eTlQcHpzZTlzdHhJdlg3UlUv?=
 =?utf-8?B?dG0vb2E1ODBYNmV0Qll5eDd3NHp0My9jTE1PWHd6YmNmLzBsU1B2T3ZGemRj?=
 =?utf-8?B?SGRnelFqckZycFluMnJPbTA4VHg2TEdBamtlVXROeGh4Vno1ZmlzcXpLMGRt?=
 =?utf-8?B?enIxYzlBU3g3QzdtbFlMY0p1SGxNYmNvRWpLNHZxdUlpU0ltQjNyNGhodDdo?=
 =?utf-8?B?Q3ZhSEk0akhQWXplZEUwQkVyZ3MrTVE4RGdXcnNtd3VSaE53Z1ZSNlRZdlNW?=
 =?utf-8?B?cmMzWnh2dXJSdjRnaG8vUnNUNFZjdU5wRVQ4c2ZlVXVtQzJaUmJyd1AvVFpo?=
 =?utf-8?B?MVVQZEtNeXR4Sk01NGFKWGtDM1BodjlDOEUxZmllQ2JRSHVEVFlHZWhsU0VI?=
 =?utf-8?B?TGtZWW9TV2t4bDV5eWh0c1dxQ0tQc2Y2ZkQ1NzFlZG10a2k5TXU5ZGhTc1FK?=
 =?utf-8?B?Z0pXMXp6L05ubEZGRnFpRW95MVFsMXVSSzFJTE5FVTRFZ0hKV3FUOVdLcElI?=
 =?utf-8?B?N1VlajZuZll4UTJPL1lYN2svdVRKR2NWSzl5bzZGZEx4NXg1WVBYL0VLcnha?=
 =?utf-8?B?R0JHeGxVRXRabTIyc2swVDgzditWNk84cEdtVmtWcWxyUmlFYzZ2SlhobUE1?=
 =?utf-8?B?WllLY1VCTzVISVNJOWR4S1lLLzVobXZ1ZzhHTTZwZmR5eUFuUHpnRERnSmVL?=
 =?utf-8?B?ZnBkRjRCV1RHRDVRZXVtMitmeUFTdDh4UDJvaWhpdzU4TkEwOEhqeXc1Q05I?=
 =?utf-8?B?VTI5QUR0S3dwMXBUOG93aEtvTDB0ekR2Rk8zeVJoL2g5RFVzbzhLTzdFM1dq?=
 =?utf-8?B?WmE3c0E2REtEaGxGLzIzcmQrYTVzdlNSV05hYlBDUGRXMjZ2aTAwZEZqTFVL?=
 =?utf-8?B?VEVZM3NqTzd1Q1hQUXg5Q085OWRRQXMzeWFmOUxTWTlvcjdjbEFnTE5sS05F?=
 =?utf-8?B?Q00xdEtnK29wdHFRVEkrbjZzb3VwakZ0VXNzS3NINkxGREQrN0xzYmZObG5q?=
 =?utf-8?B?Um5aWHp2S3Z2cmUybU5ZWVRnR1M4NmY4a2c1M3YxM0c5NzQwMzEvK0duU0FM?=
 =?utf-8?B?N0hoYm9SWTVUaWFyL1l3d0M5ZzloTW5TUHZ2eEZaVmNoMndQa0tyemJlUzFr?=
 =?utf-8?B?OGdNV1pSMmN2YjJXSVlVRWUzclp2bS9raTQvc1RWU1pLRTIwNmlhREo1NGM2?=
 =?utf-8?B?VFRvdnZKUlArVDdpVXVmK2Rhc3Ewc1IycmtockZaN09KN1JlWUY2WUtheHRL?=
 =?utf-8?B?T0lUMmQ3VXhYR1NQWXQ4WUxBYUVzc3FEVUs2Z0hqNXVlZW0yRWF3VTQ0RDNZ?=
 =?utf-8?B?dG9EeWRPbVZ1bWJINGcyaHlGSSsrM0FkSTVsRTcwMEZYNDUybTJZdjFUOGsr?=
 =?utf-8?B?ZE9XZkRVZCsxRzhTV0lxRWhqQTFZT3dFODIwWVJIbkk4d01XTGFMeVN0NldK?=
 =?utf-8?B?YkNvOVJVS2R4cTVsUjFpS3k0MG5WbUlGUndjcDQvcHJnSmxkNHNPYUtJWWVy?=
 =?utf-8?B?Vmw0VE9BMTVyWC9PbUxwWE93ZE9ZdUUycTZOVnVCTGNpRlZZVXR3dUZucHMy?=
 =?utf-8?B?Z3RheXluR2M0a1pxeEhmN3E2dnJOUUJKVTFCdVFhYVNBNUxiQmY2WmVtS0sz?=
 =?utf-8?B?UVFTcW93NFV1dDREMy8yYkwyeTdHUDlhM3FiYlpYWDR0UHlZSXM1VVYzZWpK?=
 =?utf-8?B?bDBhcjUyUlNtc3N5TEc4aTArdURTNWNlWG5KTlpPN1J4QlRYckRScm9oMTRa?=
 =?utf-8?B?Qk1MTGoyVnpmamZ3cGVrU0dhYTNqSGpZQmNxNjdLWllVUHZGQ1FNN21rQmpy?=
 =?utf-8?B?UWZzanFSNGR2QkpOd3MvajZFVEhCMlovTGNZVTRDZmJCT0RNY1VFTDhhVFVv?=
 =?utf-8?B?YTFSOEVpTE5sTVZOeE5jN2NadWgycThKbU5jVFYzUjJOVCt4VWZQME1jQzVF?=
 =?utf-8?B?cXZMbUVSQm12U0Rub3YzNjk5bGRvYkdQUjVkZTZiYWFDdnZoT3QyYXZ1VHRa?=
 =?utf-8?B?QjY3YUFIOC9JV1pFb3hGWGZhNkphakZrWExGUjBZVU9PZHBYaWRURjBCOXh3?=
 =?utf-8?Q?8u3QDtdNSVfdt8+eTvXI+uc4a?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fa7adf-5e81-464b-f392-08ddff069039
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 03:16:21.3535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOc+GVth4lAjGqXsMRBTDc4nR0aMm1Qb0I/rgS9tpuL+PPbOU4C99q/cVlYPdYYtlHCWDE/04TM1hcHmXnRTYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_201705_675633_5A2CC86F 
X-CRM114-Status: GOOD (  26.25  )
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

SGkgTWFydGluOgoKVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZXhwbGFuYXRpb24uCgoKT24gOS8y
OS8yMDI1IDQ6NTUgQU0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4KPiBIZWxsbywKPgo+IE9uIFN1biwgU2VwIDI4LCAyMDI1IGF0IDg6NDHigK9BTSBD
aHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDkvMjgvMjAy
NSAyOjA1IFBNLCBDaHVhbiBMaXUgd3JvdGU6Cj4+PiBIaSBKZXJvbWUgJiBNYXJ0aW46Cj4+Pgo+
Pj4gU29ycnkgZm9yIHRoZSBpbXByZWNpc2UgZGVzY3JpcHRpb24gb2YgdGhlIGdsaXRjaC1mcmVl
IG11eCBlYXJsaWVyLgo+Pj4KPj4+IFJlY2VudGx5LCB3aGlsZSB0cm91Ymxlc2hvb3RpbmcgYSBD
UFUgaGFuZyBpc3N1ZSBjYXVzZWQgYnkgZ2xpdGNoZXMsCj4+PiBJIHJlYWxpemVkIHRoZXJlIHdh
cyBhIGRpc2NyZXBhbmN5IGZyb20gb3VyIHByZXZpb3VzIHVuZGVyc3RhbmRpbmcsCj4+PiBzbyBJ
J2QgbGlrZSB0byBjbGFyaWZ5IGl0IGhlcmUuCj4gWy4uLl0KPj4gQW4gZXhhbXBsZSBvZiB0aGUg
Y2xvY2sgd2F2ZWZvcm0gaXMgc2hvd24gYmVsb3c6Cj4+Cj4+Cj4+ICAgICAgICAgIF9fICAgIF9f
ICAgIF9fICAgIF9fICAgIF9fICAgIF9fICAgIF9fICAgIF9fCj4+IG9yaTogIOKGkSAgfF9f4oaR
ICB8X1/ihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/ihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/ihpEK
Pj4gICAgICAgICAgICAgICAgICAgICBeCj4+ICAgICAgICAgICAgICAgICAgICAgMSAqIGN5Y2xl
IG9yaWdpbmFsIGNoYW5uZWwuCj4+ICAgICAgICAgIF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8g
ICBfICAgXyAgIF8gICBfICAgXwo+PiBuZXc6ICDihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEg
fF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDUgKiBjeWNsZXMgbmV3IGNoYW5uZWwuCj4+ICAgICAgICAg
IF9fICAgIF9fICAgICAgICAgICAgICAgICAgICAgICAgXyAgIF8gICBfICAgXwo+PiBvdXQ6ICDi
hpEgIHxfX+KGkSAgfF9fX19fX19fX19fX19fX19fX19fX1/ihpEgfF/ihpEgfF/ihpEgfF/ihpEg
fF/ihpEKPj4gICAgICAgICAgICAgICAgXiAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4gICAg
ICAgICAgICAgICAgc3RhcnQgc3dpdGNoaW5nIG11eC4gICAgIHN3aXRjaCB0byBuZXcgY2hhbm5l
bC4KPiBUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxlZCByZXBvcnQhCj4gVGhpcyBpcyBpbmRlZWQg
cHJvYmxlbWF0aWMgYmVoYXZpb3IuIEkgZ3Vlc3MgdGhlIHJlc3VsdCBpcyBzb21ld2hhdAo+IHJh
bmRvbTogZGVwZW5kaW5nIG9uIGxvYWQgKHBvd2VyIGRyYXcpLCBzaWxpY29uIGxvdHRlcnkgKHF1
YWxpdHkpLAo+IHRlbXBlcmF0dXJlLCB2b2x0YWdlIHN1cHBseSwgLi4uIC0gb25lIG1heSBvciBt
YXkgbm90IHNlZSBjcmFzaGVzCj4gY2F1c2VkIGJ5IHRoaXMuCgoKWWVzLCBvdXIgZ2xpdGNoLWZy
ZWUgbXV4IGlzIGRlc2lnbmVkIHRvIHByZXZlbnQgZ2xpdGNoZXMgY2F1c2VkIGJ5CmV4Y2Vzc2l2
ZWx5IHNob3J0IGhpZ2ggb3IgbG93IGxldmVscyBpbiB0aGUgY2xvY2sgb3V0cHV0LgoKCj4KPiBC
YXNlZCBvbiB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBvbiB0aGlzIHRvcGljLCBteSBzdWdnZXN0
aW9uIGlzIHRvCj4gc3BsaXQgdGhlIG9yaWdpbmFsIHBhdGNoOgo+IC0gb25lIHRvIGFkZCBDTEtf
U0VUX1JBVEVfR0FURSB3aGVyZSBuZWVkZWQgKEkgdGhpbmsgdGhlIG1lc29uOGIuYwo+IGRyaXZl
ciBhbHJlYWR5IGhhcyB0aGlzIHdoZXJlIG5lZWRlZCkgdG8gYWN0dWFsbHkgZW5hYmxlIHRoZQo+
IGdsaXRjaC1mcmVlIG11eCBiZWhhdmlvcgo+IC0gYW5vdGhlciBvbmUgd2l0aCB0aGUgQ0xLX09Q
U19QQVJFTlRfRU5BQkxFIGNoYW5nZSAobWVzb244Yi5jIHdvdWxkCj4gYWxzbyBuZWVkIHRvIGJl
IHVwZGF0ZWQpIHRvIHByZXZlbnQgdGhlIGdsaXRjaC1mcmVlIG11eCBmcm9tCj4gdGVtcG9yYXJp
bHkgb3V0cHV0dGluZyBhbiBlbGVjdHJpY2FsIGxvdyBzaWduYWwuIEplcm9tZSBhbHNvIGFza2Vk
IHRvCj4gZG9jdW1lbnQgdGhlIGJlaGF2aW9yIHNvIHdlIGRvbid0IGZvcmdldCB3aHkgd2Ugc2V0
IHRoaXMgZmxhZwo+Cj4gQm90aCBwYXRjaGVzIHNob3VsZCBnZXQgdGhlIHByb3BlciAiRml4ZXMi
IHRhZ3MuCj4gSSB0aGluayBpdCB3b3VsZCBhbHNvIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBpbmNs
dWRlIHRoZSB3YXZlZm9ybQo+IGV4YW1wbGUgaW4gYXQgbGVhc3QgdGhlIGNvbW1pdCBtZXNzYWdl
IGFzIGl0IGhlbHBzIHVuZGVyc3RhbmQgdGhlCj4gcHJvYmxlbS4KPgo+IExldCdzIGFsc28gZ2l2
ZSBKZXJvbWUgc29tZSB0aW1lIHRvIGNvbW1lbnQgYmVmb3JlIHlvdSBzZW5kIHBhdGNoZXMuCgoK
QSBWMiB2ZXJzaW9uIHdhcyBzdWJtaXR0ZWQgbGF0ZXIgd2l0aCBjaGFuZ2VzIGJhc2VkIG9uIHlv
dXIgc3VnZ2VzdGlvbnMuClJlZ2FyZGluZyB0aGUgIkZpeGVzIiB0YWcsIEplcm9tZSBoYWQgcHJv
cG9zZWQgc29tZSBtb2RpZmljYXRpb25zLgoKW1BBVENIIHYyIDAvM10gY2xrOiBGaXggaXNzdWVz
IHJlbGF0ZWQgdG8gQ0xLX0lHTk9SRV9VTlVTRUQgZmFpbHVyZXMgYW5kIAphbWxvZ2ljIGdsaXRj
aCBmcmVlIG11eCAtIENodWFuIExpdSB2aWEgQjQgUmVsYXkgCjxodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNDExMTEtZml4X2dsaXRjaF9mcmVlLXYyLTAtMDA5OWZkOWFkM2U1QGFtbG9n
aWMuY29tLz4KCgpBZGRpbmcgQ0xLX09QU19QQVJFTlRfRU5BQkxFIGNhdXNlcyB0aGUgQ0xLX0lH
Tk9SRV9VTlVTRUQgY29uZmlndXJhdGlvbgpvZiBpdCdzIHBhcmVudCBjbG9ja3Mgb24gdGhlIGNo
YWluIHRvIGJlY29tZSBpbmVmZmVjdGl2ZSwgc28gdGhpcyBwYXRjaApkZXBlbmRzIG9uIGZpeGlu
ZyB0aGF0IGlzc3VlIGJlZm9yZSBpdCBjYW4gcHJvY2VlZC4KCgpKZXJvbWUgYW5kIEkgaGF2ZSBz
dWJtaXR0ZWQgcGF0Y2hlcyB0byBhZGRyZXNzIHRoZSBpc3N1ZSBvZgpDTEtfSUdOT1JFX1VOVVNF
RCBiZWNvbWluZyBpbmVmZmVjdGl2ZS4gSSBvcmlnaW5hbGx5IHBsYW5uZWQgdG8gd2FpdApmb3Ig
cHJvZ3Jlc3Mgb24gdGhpcyBwYXRjaCBhbmQgdGhlbiBpbmNvcnBvcmF0ZSBKZXJvbWUncyBmZWVk
YmFjayBiZWZvcmUKc2VuZGluZyB0aGUgVjMgdmVyc2lvbi4KCkhpIEplcm9tZSwgc29ycnkgaWYg
dGhpcyBjYXVzZWQgYW55IG1pc3VuZGVyc3RhbmRpbmcgb24geW91ciBwYXJ0OyBJCndpbGwgcHJv
dmlkZSB0aW1lbHkgZmVlZGJhY2sgbW92aW5nIGZvcndhcmQuCgoKPgo+Cj4gQmVzdCByZWdhcmRz
LAo+IE1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
