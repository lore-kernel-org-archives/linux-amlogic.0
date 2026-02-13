Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF025EDF023
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Feb 2026 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODoE060IXVaBBYX18lSzCk6NvpiSDnBulexhlUX+qdI=; b=Wv5QdKtaWA58CNkq6jXyLao8qj
	IXO6pmRb1YYVsarw8OECrr42OME6EvJpYv6iwxJ/W0xMKxbLEMmddSTiLQY2pxi62mlOJOn3HpEFu
	G3XMTaT81aPIbp5PwFc9byNYblnGiccIxh1nSeyBwuoCTxyaFiETf46gdKxzAmeOmwb3N6eXaRyXF
	apCTxQ2KBLxbPIMnxVOGyvnTFMMT3mBVOG0OrnRRxIpUFdDBq6159VrFNtoQslKcsTECd57vvgIH7
	OsylYe39uTIQpT1CekDeHbzfAlm58cX5aT+1N301slRjLXVxAJBRSn6D/K7v6bNL17lAkxVAgVrt0
	x3Xti2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpFo-00000003DQm-26uC;
	Fri, 13 Feb 2026 09:14:24 +0000
Received: from mail-koreacentralazon11023115.outbound.protection.outlook.com ([40.107.44.115] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpFm-00000003DQA-0evo;
	Fri, 13 Feb 2026 09:14:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6ivDsjzx6+YXH349Ycc6mQ64TOfTL1GGzBvZFULwp3W74C8w08dm3oYQ18khdxQ0oo4PslA7f3Fymk+hVeNZqhxuXMThyjrdEK+TnL3QnAZV9hQEuMPqPrSW/PP2CsJV8l0IEnvTAMqD5efZ5bs7abI3T+jwBd/b2hdtaAvUSXoxeGSDfPKfsylOz7oj8A0cRJXQmc4qKbH50pN2eHlLXhhYecfV2Mfw5qUJImrNMjZX+XdJiE8K3C2KKeUXwuiGIXBDfXFIlN/6j24PKNh01cjauDGiG+HsZdElPXpnpLh5fY+Xt8FvPz3e9oMPhj3caBn1asEVL7JHRzNcgFrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkXY1HpTGxO9YiCJjAPDB/+iSBHoU1L2vq/I1U8gs0c=;
 b=Z8xPL0fJwyuHtv0WrB/ZRESDxUe8SHvUCwMN+UrcR5tFiQn7oAqFRqVU02RVmogKWNcnUuyGCzP9V+wiZR2hov5OWML6QyjFiTM6/AJpyq8OImiHP2r82aukLJm5vP6TYqkRUofX8M83CXxkBiicjFEff+hV0hNR/HEXdG+ObmdbxKYQdZD3SlVUf1S6U1kRVSbYKX4ZjDALDlb+Yu1PUl7kbxuW3Llm40rQJDAkSSrFm1WvmYgs9hI0KwPwbPBZfGaKlyy6/YeG99BpHIwQq5+dN7aLEJRqcSpAoxZ1IqKqtRcE/harp8VWHL6tPOGTYfnyDBBbKAxhnmI0gfRXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkXY1HpTGxO9YiCJjAPDB/+iSBHoU1L2vq/I1U8gs0c=;
 b=qEfUQq7rk+/THzA2Bzv1d4Jj8QRWogilU+LGQUVOQQ7G784P1VEj8ozdxCWPrEwsVDmhmOlIhfeb0f7B2A1nLi7i7fmfs5YHVHHwbPVdl5fOcyNSXKOerh0zGAe7NBjAogAbarl3EWPqUWEmouiVJIRAuxfZcVtvKesGAfeERGqKhiw4xlwZ3woz0dIylHxAaDN6lGh4Vp4PEiIgMyc9Yp7EVbjX+LTVj5SaygPfxYMIpMXPjcRmUxJ6RfKN3mtisWLoj8qLj+/Scv5PfRL65RiXcwACykgaEXC34L42oD+XsD34iY85/QEfSB/W9r2Knzz/lSR/48puknBjJXxQMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KL1PR03MB8403.apcprd03.prod.outlook.com (2603:1096:820:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 09:14:14 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 09:14:14 +0000
Message-ID: <df5ec40a-8674-4983-a912-8aa2bbfd2da7@amlogic.com>
Date: Fri, 13 Feb 2026 17:14:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
 <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
 <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KL1PR03MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 692cffeb-9afc-492e-2b70-08de6ae041b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0QxR0orNWlLeVcvSys3ZHlRbWRzR05uSWdKRmdPd3hmRkFIVUJxTnJBT0cz?=
 =?utf-8?B?Y0ZvUCs4cjg4ZWVmNTFEMUwyTFRLMFUzMU9pVnZIRDdjZUJJeEluNndUQ3R1?=
 =?utf-8?B?YTU2ODZ4YzZBRDJmM29DWFNuVitvOFJxRnpCYmN1L2NOZ2JqNERUVk5STVVY?=
 =?utf-8?B?Z1dKVkI1R3p3K2JTcGphdXpRdkxsVHRmK0I4MGc2TVFIMlZ5SUkxdzBWSytt?=
 =?utf-8?B?TXl5c29idnpaeFI2UWd0NnkyNW13VHUzeFJ2cGRYVHpLS2V4NHdrSVZ1djBq?=
 =?utf-8?B?SjVkQW9qbDJuRFdsR3JoY3JGY0RiV0R4QkJiVFBEOWIyWXZySG1CYjV5ZU9J?=
 =?utf-8?B?SVNWZG90bTk5MWFGVmkvWk40bm1LQytodDdueDY4dFVyQnJURjRYYWVidFF3?=
 =?utf-8?B?TW1tbFd1RUVYRHJ2Rm9qVzVkV3RrdkpXblE4SHYzRVpJczdKa2FKMUhEQnJ3?=
 =?utf-8?B?dkIrUnBoSzVGVnAzaGtMdHBRTGRiU2pib1RESlB4OUpEYlhvYWVoY2JtdzBW?=
 =?utf-8?B?SkUxeGU2a2REcVYzaVg2aytrTUV3L3ZqUWlVM0V0M2drQlMzR1hrWGFsRVE2?=
 =?utf-8?B?U2RjK0tnSFVqTmZ0eFRFcStnN3FkWjB1TEhnZ0lyVzIxU2xKN1BEVStBdlVm?=
 =?utf-8?B?bTY2bFhqVW5IRnFzdGNpRHRwY3VLS25rTktGd29zYkpVMHFCRHV3UVd2bGVm?=
 =?utf-8?B?MzJLM3FzVkEvbWxpdTNKalh6azUwN1JwdmcxVkpUV255NThQNTRzOHNOWkZq?=
 =?utf-8?B?TU5lV3RhTndmRE1IVDZxV2trRDJpS2tKdDYycWdidHVwZVYvR011L1R3WGlT?=
 =?utf-8?B?ZzhmZ0Y4eU9xbVRaYUVUdjZ3aGJQVkJJZ0ZJVFFVSWt3OWFNMWdnaHpwYXpM?=
 =?utf-8?B?UzVJZlVlQ0VzNklaYk9yU0sxemg5TTFHQzByN0ZlWThVSk96K0dONVl0OGpp?=
 =?utf-8?B?cW1KbXBhV2tFY3lBRHNTZnFPL2tyd3RlMXV5T2VjdVJQdmM5WEFXSTZxL3RX?=
 =?utf-8?B?UFpHWXBnYkxEbXl4WTJ4VW5XM0IvL3JpWWZvVHhvTUNNZCszQm5XWjNEWGhy?=
 =?utf-8?B?ZGdXTDJKeDR5ZzBSVWlPMW9PYUxLMHNyTnF5T3pnV1Jjb2lLcm1GQm1ydU9I?=
 =?utf-8?B?MEw0WnFVTTJ0MFpKaEVidjhxSUI5MlNzOFdXcldlUkhNK2V0TWd4cEJVNk5y?=
 =?utf-8?B?cUllSWV2bGJsK0JQY2VsWHVCVHc0Nkpjc1ZHQmMzbmFKMlI3bGxDNEF6TUxs?=
 =?utf-8?B?QmN5bWUzbXFNRC8xSlNTYVM3bExmNlZ2OWVyNFRxa0pZVEZBNzJzbW5ESG5p?=
 =?utf-8?B?cGNJZFFzc3dhZVhHN25lMjFJYjF0WmV6MW1RbWVuNS9iVjliV1czUGdpRmd2?=
 =?utf-8?B?N3V3L3hKVmRwdnNsR3RxTTR0ZFBHNFBUSVlKTndtUm5vaFhnN0VIVTNyQzQw?=
 =?utf-8?B?eDFkZE5oL0QraE1OOHZudE0yeVVWbTQ5bTVmbm5BaHVlQ3NrOUViM2dBd2xW?=
 =?utf-8?B?Zk14a0hOU01OdjQrZTNVeVBJbU5UWGZwWDlOWEdRaXU4U3NsbE1zRm5JeWkv?=
 =?utf-8?B?RlNtcDkzS3d4R1pxT2JhMjR1R0FTZndkc1Flank1RnBoODg0QS83K2lOSTQv?=
 =?utf-8?B?SkhKai82UThWYWhHS01IRVZiMTBpUys0UC9IZmkvTEVkbDNNa28wRy8vU2pJ?=
 =?utf-8?B?MVBhUllEa2dlZGxEL1JZWlBTVWppWG1iVll3OWppc010WmZoU25ycTFUaVlp?=
 =?utf-8?B?NGNTWjNBRS9PRisrYjlzaElEZnM1c1Jkc1RPT3hiT3ZCS3pNMnB5Y2RpREtr?=
 =?utf-8?B?V2xyYUZ6V3JqYVorWXd2VXBHbnJWc0ZCSnM4OGhoa1FRSnozd3Y1V0RsV2hh?=
 =?utf-8?B?M0JEZ3FIb0g0Z3o1Ly9yODA3Z2c1czdwNHp3aU1uQjE0MkZJMTc4WWJDajNv?=
 =?utf-8?B?L2kyL2ZJcVJ3Q0hlU21rTWdvUmxsZFJvQ2xaNjZwbnp2Qkx1ZFlqb2xJQjNW?=
 =?utf-8?B?RjBrNnFSU1RZKzgzN1M4UEQ3UW1CNzJpVldrdHNsbURubzlKTHU5bzhVS2Zh?=
 =?utf-8?B?QWRDdHlyc3JOYXg2RWVjR0UwdEorQjF4Z3pHWkMwb1hTSzRUdzV2WHhnMlNG?=
 =?utf-8?Q?jVEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBNL29QZS9CaTRqeUdXYTZNLzFIdEdBOUpkbEFVOU9sS3dpQTk0czhJc0tM?=
 =?utf-8?B?VkVkWTFOUFd1T0JiTFRFSjJkUmhieEc2THJRWU5lcDc2RzFSazR4U0pUV0dK?=
 =?utf-8?B?WGV1aExqTDZUQkRvblA2UTdFbm1KYjJEOFBZcVYwUUR4dmR0dzN6bDV3cWJq?=
 =?utf-8?B?bzFxLzNOTnpIbHR5WFZWUUoxNjY5ZWQzcjFHb1R0RlVsRmJOQVgyQThDUUlU?=
 =?utf-8?B?bG83K3FxY0NKVE5DU2k4KzQ5dG5wa1pTaTRvK1pwbEh2cElwblk2T0ZDclJ1?=
 =?utf-8?B?MDBJZGpzOXI2bGh6L0YwZWZKc3U4UjdVb016SGpEczRRWEpUOUFybFJPaytU?=
 =?utf-8?B?WFd1T290bUJpK2MrZDcrRk43ZVR1UFIybmJkSXpBL2ErZUN0OVZsaTcyWGR6?=
 =?utf-8?B?TlN2Y0JWbWZGdXBMYW9kVTlqTW52cEVXWVNPMmtPTVBiWHdDVG5Ta2lOUUY2?=
 =?utf-8?B?a0ZGdWJwYTlyVDZHVGtwREk3M1dqd1VkdnF1UkFXcXc1N0RGSDFoaVMwL3lJ?=
 =?utf-8?B?Y0dNaE5uZ2ZTNWFTRTlqcWZWRC9jMlRUT2pPbkNXS2YrRTdKUHdBQURoWSsv?=
 =?utf-8?B?NUFla2NhYjQ3NXVsR2k5UlJDdEJJY3RQaXJkTXZ1cmtxbWhpTlZPVjhyME5Y?=
 =?utf-8?B?MEdEZTJQR1BiWXY4RmZUS2JjbzM1cHlNbnd5SjUrRWYxUk1YOXA0L2FDbko5?=
 =?utf-8?B?M2ZpQnVNNHZSYU9GbWdJK3dBVzkzaDBxaGhCM0J2TzNOenlwVzFnR2I3NHE1?=
 =?utf-8?B?YWcrMkdHaTlGcitNdnhUVnM1ekFyWmVJdHZ5eEd1T1puUWFsWDhNckpIZnhQ?=
 =?utf-8?B?MWMxZFN2TnF1MEtkRHFjVmdXaEZJaXZmdjFBNzliOWdoVmc3aXBOSG9CUi9J?=
 =?utf-8?B?NFhKM1ZuaDZPYnZZRXFHSk0zN1JGcmVvS3lndXZoeFZQdm4yRUxHWEpQMld6?=
 =?utf-8?B?bm15NHFQNit1ekM2WVl1VTM1L0hvS0pXVVEweEhwVkx2LzFyTS9idnhkb0xv?=
 =?utf-8?B?UUt5enpRVThxa3VNcmZFMmM2dFIwS0hiMElxYmIzZjc0UGJTNFIyY2RSR3JE?=
 =?utf-8?B?cGFISE5hZ0hFQnppNDdyejQxTVhZQUF2TjRLdzcxWno1SjAzalI3dDhNTG5P?=
 =?utf-8?B?UDZRR0hQazliMElDQXBDSkFwZzlNeXJxcmwvRU8zcFdWR1czMXNvOFZlNTc5?=
 =?utf-8?B?QlZWcWEvZ2VxYnpVdHhkaitDeWxLSmFXb0ZOclIwVS80L3BHdFJNTUlzdXo4?=
 =?utf-8?B?TnV6bmp6V29yREhDNmVvWW5QWVVmSmtoVFIzbTA4KzArd2hiUlpLWlp5aERI?=
 =?utf-8?B?ZVNuNkNOWW0wdEJ4QzJXeWlnZ1hMZXdRbG1JRTRKUkFlK1RvVTBzandTbXhw?=
 =?utf-8?B?K2p2NCtEMnNxdXFFQTNJOXRLeitFYVR1Y3I1anU2cVJzelFWQS9SSFNxUnhj?=
 =?utf-8?B?aTZja0hqM3YycjdpT0tDczRjMWgvc3gxVkFxNWVpMW84Q05peFYydkZvK2Nn?=
 =?utf-8?B?bTdFUXl2Q2xRanZMamg1eUFrQVA1L1lWRyticC9Fb3Y1V043MXlqNGNtWTBP?=
 =?utf-8?B?TjJWSUZoL0ZkYjZsTE5XUVl5a003TUM0M1NTOVNrckpFdXRjOTc0aitTTDk5?=
 =?utf-8?B?Mk9JdWQ5YUZqSVBXeEhVTkRGWmNsSHd6UHlTdzQzZTMwd09md0V1VGNxQWRr?=
 =?utf-8?B?TFdmY2tMZy8weGZhK3MyaXNURFZlRkJjb05ZQWVOMG9lNnhHZ2trdENzYS9Z?=
 =?utf-8?B?dUNnbklOTXFCdTBXam9PcEQ2OGxCaGMrVlhtZ3NERzN4VkpBQW5JQ0lzOFhr?=
 =?utf-8?B?WWxIangwZ1J3Vkw0QXd1aFFTV0VzMzFMLzk0Wmg4SVBJb284TTRjbE9PNHFP?=
 =?utf-8?B?Y3czQ2RvcjBiNm1oQ0hwaFRhbG1ML1B1VTY1MkY3RlNjSGN0cm1UR1drRXh3?=
 =?utf-8?B?N0o3NkxCTG4xd3pUbVl2MGxpQnlnYlVWZzlvYlVuSlVTVFI4YnFZNGU1endx?=
 =?utf-8?B?VGxESXA1UnIwa1lJWERKZzlQVTROdVUzNU1pWHE0Rm9vTzRzRnNYcGFCTlBV?=
 =?utf-8?B?cjZJN0hRbjdoSituMkxsRk1RYjVVS0ovaDdSUWgzK0k0SzRrUEo4M1gyZWhC?=
 =?utf-8?B?b2RVVmVXRDh2VXNiNklxTFZISlpGOUpIM3YvOVpMTHhaRmh5SERYNU1RcVd6?=
 =?utf-8?B?MVE5alRJOXJ5NWhoRnBJVUVzTFlaTDAxclpndjFYbWtnNkdEbklzOUduOW4w?=
 =?utf-8?B?Y3RnSVYwdWNlUzlTYUw1THZJSHpXb09RV0R1UnRtakdlWDF3QW8zaFNiNEY1?=
 =?utf-8?B?cUJwWmVsWDFyQmR0b3hkSTVCK1NaWlA5Nzc2V0c5RzhJMWxhSFI2Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692cffeb-9afc-492e-2b70-08de6ae041b4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:14:14.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r90TBg5WGFgzUZ3wPrWSvkOxzCkt6+GXCTRBubf7kH+0lj9T/SX0QZSKGTEkIG6OQsbuuXd0hfKD/E8FgGLzfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_011422_213216_671CCD1B 
X-CRM114-Status: GOOD (  14.57  )
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

SGkKCuWcqCAyMDI2LzIvMTMgMTY6NTUsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+IE9u
IDEzLzAyLzIwMjYgMDk6MzEsIFpoZW50YW8gR3VvIHdyb3RlOgo+Pj4+Pj4gKyAgcG93ZXItZG9t
YWluczoKPj4+Pj4+ICsgICAgbWF4SXRlbXM6IDIKPj4+Pj4+ICsKPj4+Pj4+ICsgIHBvd2VyLWRv
bWFpbi1uYW1lczoKPj4+Pj4+ICsgICAgaXRlbXM6Cj4+Pj4+PiArICAgICAgLSBjb25zdDogdmRl
Ywo+Pj4+Pj4gKyAgICAgIC0gY29uc3Q6IGhldmMKPj4+Pj4+ICsKPj4+Pj4+ICsgIHJlc2V0czoK
Pj4+Pj4+ICsgICAgbWF4SXRlbXM6IDEKPj4+Pj4+ICsKPj4+Pj4+ICsgIGFtbG9naWMsY2FudmFz
Ogo+Pj4+Pj4gKyAgICBkZXNjcmlwdGlvbjogc2hvdWxkIHBvaW50IHRvIGEgY2FudmFzIHByb3Zp
ZGVyIG5vZGUKPj4+Pj4gV2h5PyBXaGF0IGZvcj8KPj4+Pj4KPj4+Pj4gV2hhdCBpcyBjYW52YXMg
cHJvdmlkZXI/Cj4+Pj4gVGhlIGNhbnZhcyBwcm92aWRlciBpczogZHJpdmVycy9zb2MvYW1sb2dp
Yy9tZXNvbi1jYW52YXMuYwo+Pj4gV2hhdCBpcyB0aGlzICJjYW52YXMiIGRldmljZS4KPj4gWW91
IGNhbiB0aGluayBvZiBjYW52YXMgYXMgdGhlIGFnZW50IHRocm91Z2ggd2hpY2ggdGhlIGRlY29k
ZXIgaGFyZHdhcmUKPj4gYWNjZXNzZXMgRERSLgo+IEFHQUlOOgo+Cj4gV2hhdCBpcyB0aGUgY2Fu
dmFzIGRldmljZS4gRGVzY3JpYmUgb3IgcG9pbnQgbWUgdG8gYmluZGluZ3MgZGVzY3JpYmluZwo+
IGl0LiBZb3VyIGN1cnJlbnQgYmluZGluZ3Mgc2F5IHRoYXQgY2FudmFzIGlzICJhIGNvbGxlY3Rp
b24gb2YgbWV0YWRhdGEKPiB0aGF0IGRlc2NyaWJlcyBhIHBpeGVsIGJ1ZmZlciIgc28gdGhlcmUg
aXMgbm8gd2F5IGl0IGhhbmRsZXMgRERSIGFjY2Vzcy4KPgo+IE5BSwpJIHdpbGwgcmV3cml0ZSB0
aGlzIGRlc2NyaXB0aW9uIGJhc2VkIG9uIHlvdXIgZmVlZGJhY2sgYWZ0ZXIgSSAKdGhvcm91Z2hs
eSB1bmRlcnN0YW5kIHRoZSByb2xlIG9mIHRoZSBjYW52YXMgZGV2aWNlLgo+Pj4+IEluIHNob3J0
LCBjYW52YXMgaXMgYSBoYXJkd2FyZSBJUCBpbnNpZGUgdGhlIEFtbG9naWMgU29DLiBUaGUgZGVj
b2RlciBJUAo+Pj4+IG5lZWRzIHRvIGFjY2VzcyBERFIgdGhyb3VnaCBjYW52YXMgSVAsIHNvIHdl
IG5lZWQgdG8gcmVmZXJlbmNlIHRoZQo+Pj4gV2h5IGRlY29kZXIgY2Fubm90IGFjY2VzcyBERFIg
ZGlyZWN0bHk/Cj4+IFRoZSBpbnRlcm5hbCB0b3BvbG9neSBvZiB0aGUgUzQgY2hpcCBpcyBkZXNp
Z25lZCB0aGlzIHdheSwgd2UgZG9uJ3Qga25vdwo+PiB3aHkgb3VyIFZMU0kgY29sbGVhdWdlcyBk
ZXNpZ25lZCBsaWtlIHRoaXMuIEJ1dCBzaW1pbGFyIGRlc2lnbnMgaGF2ZQo+PiBiZWVuIHJlbW92
ZWQgaW4gc3Vic2VxdWVudCBjaGlwcywgZWxpbWluYXRpbmcgdGhlIG5lZWQgdG8gcmVseSBvbiBh
Cj4+IGNvbW1vbiBoYXJkd2FyZSBJUC4KPiBRdWl0ZSBwb29yIGV4cGxhbmF0aW9uLiBCYXNlZCBv
biB0aGlzLCB0aGlzIGFzIHdlbGwgY291bGQgYmUgZW50cnkgaW4KPiBkZXZpY2UgcmVnIGxpc3Rz
Lgo+Cj4gQW55d2F5LCBJIGFtIGRvbmUgZ3Vlc3NpbmcsIGV4cGxhaW4gcHJvcGVybHkgdGhlIGhh
cmR3YXJlIGluc3RlYWQgb2YKPiBhbnN3ZXJpbmcgd2l0aCBoYWxmLWJha2VkIHJlc3BvbnNlcyBq
dXN0IHNvIEkgd2lsbCBnbyBhd2F5LgpPa2F5LCBwbGVhc2UgZ2l2ZSBtZSBzb21lIHRpbWUgYW5k
IEknbGwgYXNrIG91ciBjb2xsZWFndWVzIGFib3V0IHRoaXMuwqAgCkkgeW91IHJlcGx5IHlvdSBi
YXNlZG9uIHRoaXMgbWVzc2FnZSB0aGVuLgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCkJS
cwoKWmhlbnRhbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
