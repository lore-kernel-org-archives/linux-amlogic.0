Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9795CA0EE4
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Aug 2025 09:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/xHJ5LCxqOmIH2ZdRmC3mpA8gkPw0jaw/inTHtw3JQ=; b=BzwJiJeFTXSgi4pXH8Q4Rjj0K+
	gWAz5vweJN79ZXm2ho+EAVdsHV8lL4DzWefhuCeVuqnkiklYaN4CV2CgJQ88tVFr9bX+S3FN3K5Ik
	++/xUKCTGtEIHjWenM6Wmt1EZd/4TKq7lQlpL6ZMQosa0dw4bBnKwZKybI4aUuDLZG7+QlFOsgNLu
	wQB04ViBhKjHOVffxRznWxOBUzBqms9zBYAUc6kA01UA5v5ECNSHF5taUyCPFSUPzDHV6xQGKOEZh
	KBAHnn09L68Lz1A5pjchfd6t6sDJQt+b95zfzYQ7uc2d/J14rTIcwbp/XLXJjgFPRSQEC/RgdywTw
	vXE1NYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um80n-0000000DFwi-0KEQ;
	Wed, 13 Aug 2025 09:43:13 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7sa-0000000DEtn-2OlT
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Aug 2025 09:34:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rej62D8J5W1wkiBEdZfbowGmjcVCs01EcsAH/q4mesdHhUT3e+dPygUFjurSSvcKq3heoRCZ2vxKOmQF5h5UWlECNvun8LW7g5+8O0P8OW8FWCCxfZJyPLV047SPCU5S/BNlZ+ylOrIcumpL0BLjgbi9WufPE+UmBibFuDs+FjtNK2PwIkiwCJYrHwJ0ZTJCpbVqdtvDiWEZ1f7PkbYhPl+ADmcR0880/c6/izhZOAW6HK+KIunnyqRNBwl487AnhCbSXNLUdlzk6Tow7DxtrUiwJY6y1ZPNBouIepQzwR4OYlRDgLcBmpgmxZynxMc6aL3H/b15gB8m/XaJnmB1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjVU0yiRpMz6kxrtZ4h1hkr/t2OzQZoFDKsKey65aqw=;
 b=wEiQItueKr3lcRBLEGH6kAXYBbeilR9FeNSrUYhSgx4qjI34zoBuQ4OYfv5+nNipNHJqoOc1YVwL72UQyOT4betq9ZhKaZhLkeezgjv4BDDkcjyH5OycoVErKa1Q/Nal2BHMEidSot0sXygm/y9SomPR+7JsI37AgCOScrHHnQHuRirht+RwXtXQlASu98Q2X3pIhSfpPsQI9uw/B6SkesX9kq8EgmHn+dlfSQ8wcqWEftFBRABWS+kkFUOs+yoyGk5BMDd0yAd4AUN0mb5pZS/fvhBXi8UsYhL4yoMsIfeLha9CYzRIn3LTd2EBxuMKGAyWIcAxyizCiwxvKTGcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjVU0yiRpMz6kxrtZ4h1hkr/t2OzQZoFDKsKey65aqw=;
 b=cCtGmAnaXOaQyxHNDQK0r8dBYi2oSs7UoaB/tSxGsvbGfGm4F6kTt/BUcpJ1ZxpYQ7N5c5Cc+lvL9bgk09t5onlpMDvEjaOfPPwyO9K8DI0AhICejpmPAIxMnEOZJ0ziYGXdWtyozChhX1TpLE5yta8UB7PjOJdgWuX3d8tOIvpu0vQHmNMkpo/Z+e/7poc46VsqykeI4QWHu2mdCpqP5xVpcTrBn3tE8jpuZWWqA+UlpZu2W1/Q+ruf9EXYSGESP7QW6/GSQOp6YImvGYGK2WeoeGeqYRBtvIsMultKXJRimdGeTz4HW8R+T4WMZ8sdEhj4DIu5ljWkfY9BXZOZmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB8272.apcprd03.prod.outlook.com (2603:1096:101:1a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 09:34:20 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.9009.021; Wed, 13 Aug 2025
 09:34:20 +0000
Message-ID: <d872a711-7442-4e2e-bc59-0d6f4f656fde@amlogic.com>
Date: Wed, 13 Aug 2025 17:34:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] spi: dt-bindings: add doc for Amlogic A113L2 SFC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>,
 Feng Chen <feng.chen@amlogic.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com>
 <20250808-spifc-v1-1-ff4e30e26a6b@amlogic.com>
 <20250808-adamant-fat-raven-38c8b3@kuoka>
 <7fab19de-8ed1-4fe5-b2a4-a7e9c13d8424@amlogic.com>
 <5cc336bc-f071-41d2-b59a-af0df23af00b@kernel.org>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <5cc336bc-f071-41d2-b59a-af0df23af00b@kernel.org>
X-ClientProxiedBy: SG2PR06CA0207.apcprd06.prod.outlook.com
 (2603:1096:4:68::15) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 373453b1-1c78-49b4-e15e-08ddda4c94b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm9POHBuakRLZndreDJOTXk4dDhPOXcwaFlpcStKRmpIQjBKSGpUNjVzbnZu?=
 =?utf-8?B?ZzJmUWpOUWVUNGZxaGNYdVdveW5QTWR4aGllMGttcGwyVEFYMXhyanR3NG1H?=
 =?utf-8?B?TmxjRVIxQnRseE9WZFNYcmZ4UmN2UGEvdnFRRnNzYlEwWloxY2NuaHZmZmIv?=
 =?utf-8?B?Ny8rLzBBaXdxdnJqbnVEcHZNTm0zVTNLMjNJYUE1QkozemFBYWVYSVZuWjZQ?=
 =?utf-8?B?YW1LQmVTZzg5b3h0dFZFQmE2SllvZ3lJcHdTL1AyVVVuV0l0T0JZZjh1Q2ZT?=
 =?utf-8?B?aGFLTVlHUTJRN01sazk3WTIyT2dIdjlucE5veEVTU1Q4Mnhqc2dIUmpYR3Z5?=
 =?utf-8?B?c2NzMnRvSG41Yk9jNng0ZkNnR3hNWEpxOVMrS0cvd2N2NkdWU1BMbXFCVC9m?=
 =?utf-8?B?R0RRQXdQS01WT1dkWkpiSEpQVTE1MFBldmNHdkhYSW1tNndJMzZudmxYbEF4?=
 =?utf-8?B?TCtjNUFpNVQ1ZXpjME03OUtxRVYzTFI0R3VsVGEyYXc1R3h1RTd3SGpjT1lK?=
 =?utf-8?B?bGhySENUVEhyZGZPOUg5SUhla21rQ1llWVlvdURxK1JWZDBiaWFFLzFLRHBl?=
 =?utf-8?B?NlZHRmtsbHJNZFUzcXp4K2QzTkoyYVR3V29xQjcyd1FEMFRsMTA5WVpkNDdB?=
 =?utf-8?B?S0s1eVZGbW5sMmtEb25mbWtmSU1IOHY3U0hxeE4xUURQbHVoTnlLck1ERTVj?=
 =?utf-8?B?NGUxL2tDaldiMU1EZXZFYmFPc003MVhLWVdGM0NCYU02V2NiMTBSOERESXMr?=
 =?utf-8?B?TFEyS29oNlBETHRFUllQeDNjYjk3MTM2TE1JRXdKMk8yRDZ3WTYxL2F1czhH?=
 =?utf-8?B?bWVEZWtKVHNCeWd3bVFWTUozZ3FWNFlkWmlNVGp1SHo3Zy8zTWtKNS9ROTNX?=
 =?utf-8?B?RE9lUzE3VExCd3BXNDJPQmFSWHZPbis0V0h3N3Vsb2kyU0FnMXBTMUZNZVpa?=
 =?utf-8?B?WTIrZFhXVjNGaGxIc1UxeVB3NnV3eTN0ZEJaQ1BxUHFDcDRUa0NJQ241S1pv?=
 =?utf-8?B?SE9kMnh0Mm9OdGplVjNwWVBOcHlpVk83Qkd0eU9SRkN6aVVtLzd0UFBVZkd6?=
 =?utf-8?B?NXpGUEk5Y2s0dFNlQUQzbWcyRWo0bVBjSFhxbnN1dWIzN240S1ZyOVowcDdU?=
 =?utf-8?B?Zjc2cDlGNklOQ1kxWFZTakVNUlIwaXhjSTlhdXk4NkpKYTRRa3BpaGc5RUxS?=
 =?utf-8?B?Mk9jcnZwemcrZVB6UDlHR09UMEMydEZ4Wjh3Q3VPdnpLQ0diSUxLeWxYdCtj?=
 =?utf-8?B?WXVuYUFQaVpxVUlkaDhjWVhUNmQydUhsbmIvdVh5Y2sxdjZhaTR4eXRzUHBt?=
 =?utf-8?B?QWF4RFRRSXAxdE55Y0hJdmd4RCtaVkFhd01MOVMyNW9yTFJ4Z09tU2pDTjdw?=
 =?utf-8?B?dW95VU5ZV0k5L2dQbGR0M2VLMTU1OVNGUHlSSjJOQ0ZLN0t1SGVvVXo1d2VY?=
 =?utf-8?B?MHNBVUtlNWFlY0FDT1o1bXllbHNnTFpsYjJ1bENuZFdLZ1VCMVZvb2c0b1Mw?=
 =?utf-8?B?Yzk5YUNVWW9oZEpHa1huUnc5TUkxZW5PdXBJYVhTaXhUckZSTU5zL0swVkxv?=
 =?utf-8?B?NklLaERqQlMzVWh5ZEtSTjBDdlIwbzlNeDF0TDBpeFpUZVZua01lWnBkNzlS?=
 =?utf-8?B?cGxjYU1tcE1sRG1abVJjUk9NVVZ2UWVkQWZ3TTZsd1RucDNvM3I4akY0Unln?=
 =?utf-8?B?THZHZlladU5zeFdubWp3WUFiYUlES1lWemJKOCs5LzRwTDFXd3JkU1RoUGRy?=
 =?utf-8?B?WlJ5dS9nVnVxWWNWRURBVmRGNlcyNEdWLzN2cThBZ21xVEErVzBFYkVjLy85?=
 =?utf-8?B?cnNhVUw5cnFPeTZrQ25iNk5JbmYvSmE1TjNpWU41QkFSTUxXdVV6MUZlcHN2?=
 =?utf-8?B?RzgvVVl4M3dXOWdYbTZSQnlRbzJlNStlRVM3bmZMZ0dVUTRGNHZEY3R1aU1u?=
 =?utf-8?Q?CEGsy5du+r4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1ZUV05tT29vNzZlUUdwY1IydDJOOXpPdkJCdmZsNmhWSmR4cnV3WWlDYnRK?=
 =?utf-8?B?TTFNS1JYdVEwdjlUd0FFYkthR2g2RFluTUp0UjRYSysydmgxdm9LNktuWlYz?=
 =?utf-8?B?dms2YmRUdC9GcWE3S3BHMVd4dGtiN2RtQmJ3enpQYS82ejAyNmtSTk1TdGtv?=
 =?utf-8?B?aWR2YXFUejZkNGd1U041YTJkQmJGcFZNZFRIMkRYa2RqNDB6bW8xZEpSMUE4?=
 =?utf-8?B?ZnZGVkEyT1pLZWljY0hzSW5neG9XaWtpQngvRDNKZmVocmxOS09sYXIzWlhV?=
 =?utf-8?B?aXFmU2ZxTkd3RmRFMmpMeGF0Y3lHQzUvSUFJMFRaSkpoS1ZoQkx5eFpRTkN5?=
 =?utf-8?B?eHJwcGpHWnI0VnN4MWxoZVpVcHlYZG5sWjNqM2RBTHBZcjc2Q3RPMFNSYzRT?=
 =?utf-8?B?TUY2V1Y2eXRUSmVVNHdXeVFJb2JvN1JpMis2MU5waE1oMGJreERpbUllQ2JD?=
 =?utf-8?B?RDNXTzQwTFI1Q0k4SUhTcXVJS2dhcEQ4NXZWdjAxNHUyRXRHc2Fza0lQbW4w?=
 =?utf-8?B?KzJHM0pLdWg2RVRmUW9BZTdXdzMyeWJYbEk0RWJQbGJ5OXRRcmJ5Q2FRS0ZQ?=
 =?utf-8?B?aWd1cU5kM2g1THJEWlNoUG9oZk4vbjdRTlZIM0pPanJObmRHTEdCd3NsOEFC?=
 =?utf-8?B?SVNXNDQ5S1NrOTg1Sk5vSXJLblVTS1lNSDNaaGdTLzhPMWJZZWJQRTBVeVlJ?=
 =?utf-8?B?OTYyQnNDVTkzRWh6NVNxaGl0dUQyWEVLMjlVL0ZNVHliNkM1MmNITzMwU2hs?=
 =?utf-8?B?eGJqSldQRzM2bWYxRnZYVFE0c1MrOERKaXo1ZG9SZjcyQzdJMjNQaE9UVU1J?=
 =?utf-8?B?RGF6SGd2VloxS1ZwNjlnWjU4NHJNa0xZbHFQaUxrRWpERGZNbTNUcm1uUTNp?=
 =?utf-8?B?MkxoaDhOZTlETDN2NVFJaHJVN01SNDkrclY0Wk1MRTFvRnpBWUhneHNnczNn?=
 =?utf-8?B?RmtYamNJcU9rRjdxbGdEVTllVnhLNGNZeE15L0gvNHRGeENiQ3ByMVdBU1JW?=
 =?utf-8?B?SUxXQjZjZEVqUTFiNzl4Y1NOMWRUNGVSKzVDOThuNjAwSjhXMTcwcDZBaytz?=
 =?utf-8?B?anRpR3RPVEIrTkxESkZJN3hHd3FLREN6eVRzVHU3TCtDSFpiOGxxaisvLytV?=
 =?utf-8?B?eVZvaG5zcmErYWZveE9uZGk4QXdLWERBQk80RExGQmZTM1JFdHBBMTk2T2Vo?=
 =?utf-8?B?OUZBajEzSkFYOVpQYWM0N2tEaTdzU1lWSHpneWNLaGtabUpmVFRPRnlqb0Vr?=
 =?utf-8?B?N3FiYVpsRTladDBPZW1reDBYV202dHFiMmNNeFpjZ3o3dDhnODdYVUpwd0Ns?=
 =?utf-8?B?ZmtaTlZ5dDFoQW1GaDBFNGxkV2JRSnpoOFJBbWFrUzl1VWsvaW1ETnNJYkFo?=
 =?utf-8?B?RjhvR0VFZjVScXg2bzB5U1I0UUxrSGhHQkx3S1hzcGNnREI2d2U2eDBtY3RI?=
 =?utf-8?B?azdYR0pVVUNIMDY3bEE1UE5YWGhrOENGeXFZUmhLREpsc2RUUi9KcytrV1ZT?=
 =?utf-8?B?TGh6WVIxbEtjZUQyS1NpL1FWQVRnSS81alYzVkFkN2tMR1dWdWo2Mi80eFhW?=
 =?utf-8?B?OWJVM3hOb0pJbFZKaDJQcmVNdjRXSm9XdGdtSTg5TVF4TzZWV1VzNjZXSkJY?=
 =?utf-8?B?ZmxWZ2NrVWpsZmtUdFgxWUxJaVRlMld1cmp0QmJ3ekJDMllkUVV5dEFxeC9t?=
 =?utf-8?B?T0ZaY3QyMjdkZE1ZZHpTYkJ0MEx0c09vVXBJd2luWWtRL0FQRWxRU29GUzN4?=
 =?utf-8?B?WWIyZy9HU0tjem9ocTRuWEdRd21FemMvcmppNDBCdkN1b2VVUjFITFJaTTZV?=
 =?utf-8?B?M1ZoL1drMEVWeTlZZGR0ZU1DS1BqajZMNHAzTS9MZ0V0N2FYdldMUU9PZXhN?=
 =?utf-8?B?MTlySEZpeHRwMmpodU9qZ3BUK0k1WExSMVRWT0pVMFZOanJFaDVFbmthVDdk?=
 =?utf-8?B?V042bURVSzhUcDE0N0l2OXBGTGVtckF5MWZsNjR2QjRCZUhXUk1yMmU1VnRv?=
 =?utf-8?B?R1J5aUxOMW1xWnd3V3B5ZG9JUlJWR3Rzbzd4aG9HTFV5QjJSZmJTSVhuRjhz?=
 =?utf-8?B?Tlo1TE9FQmdxakp5WEtTcEhtWkorZHpvTUNtc1l5VGJ6SDFtS1hsbisxUlFx?=
 =?utf-8?B?cGFSQ1N3WmFiR0h3eFNZZE5OTEllNHBnM3JGSkhVRVhVSldONGgvV29uNUJ4?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373453b1-1c78-49b4-e15e-08ddda4c94b1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 09:34:20.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T31KU7tJHpZJA2k+aBrQMtbyeCakCSiS/3LzSf9IMY/ZWJ3Zfr47XP9dFjA/kdEmbSjNG7HXRE3zIp0EAOS2tKXb1tYSBBAGIWETEgqDsPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_023444_610665_74C1B66C 
X-CRM114-Status: GOOD (  12.79  )
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
    Thanks  for your reply.

On 2025/8/13 15:36, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 13/08/2025 08:13, Xianwei Zhao wrote:
>>>> +allOf:
>>>> +  - $ref: /schemas/spi/spi-controller.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: amlogic,a4-spifc
>>>> +
>>>> +  reg:
>>>> +    items:
>>>> +      - description: core registers
>>>> +      - description: parent clk control registers
>>>
>>> Why are you poking to parent node or to clock registers? This looks like
>>> mixing up device address spaces.
>>>
>>
>> The SPIFC bus clock multiplexes EMMC modules, so the corresponding
>> frequency division register is also in EMMC module. The SPIFC and the
>> EMMC modules cannot be used simultaneously.
> 
> Then obviously you cannot put here EMMC or parent registers.
> 
> It looks really like you miss proper hardware representation.
> 

It does seem a bit unusual. However, in our hardware design, EMMC and 
SFC modules are integrated, and they share common resources such as the 
clock and I/O pins .They are mutually exclusive.

Here, I'll modify the register description. Do you think it's feasible

description: EMMC clock divider control

>>
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: core
>>>> +      - const: pclk
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: clock gate
>>>
>>> Are you sure this is separate clock input to this device?
>>>
>>
>> This clock is used by the APB interface to access the SPIFC registers.
> 
> So APB clock?
> 

Yes. The APB clock serves as the source clock, but each device receives 
it through an individual clock gating circuit.

I will modify the description of this clock

description: apb gate

> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
