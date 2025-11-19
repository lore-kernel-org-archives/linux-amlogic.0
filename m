Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B13CF256A
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Nov 2025 02:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JON/FMX7t2yKhEESoCaqFJQ+SwHgMfmfxyEHRZ4Oi4A=; b=R/s7VXo2or6502iSn/CTJUmN9n
	uWxnDuD4AwmeJ+R2dWsFkYRzNTyNFdFoYhxvvE/vI0TrK8XBXMxXxD5OQkes6DVg1nHDBqfIIGYrk
	RN0RKHmj1TVWujwAKkzegwFgILwfRvB7Svpq80VHCHYffU89rO76JyGaSgIVxlSC2QkellWy5oHTc
	oL6e31Hf99EMfROG3WiKLvjDCZIjoquAjRCO2mmWLOb/hdn5R9RYnvnYHdyuiVJgJdGPz8x0oD/UW
	qF0FSgqIPDG4bHqLUcejeb2HED6PH1IWAFcjVTkBsT0eGTCggPVAKCJDvsLJX2ERQ0yU+NOZu5g+h
	CNugemLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYOg-00000001Qqh-0nwx;
	Wed, 19 Nov 2025 02:58:18 +0000
Received: from mail-koreacentralazon11023081.outbound.protection.outlook.com ([40.107.44.81] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYOe-00000001QpL-0ZKj;
	Wed, 19 Nov 2025 02:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez8vLCUEbMHBBCZUBD2Mllnhu0MaKenNRUx8fapeQoIt8yxFXxxE5muiJJo8lTgv2pR5dd6vnzZIfhEPt1Qft/mVVQjanyqFQpqBwJygR/b60eU9izYit+P3pZpfOxJkZPPTLO6iUyg8W4DWQzJ2aSKSGcM1GrHt8KUj8Bz958ub3aOXt3kEVOH+EGbxaS6FgbVOMtvMVyTgDK0ckiD0MHJE2PiW2iAG3Y1IoyfJCV1Fhxp1DS3XptsRN0K7HB5jgjK40F+jNprebYyQ9HBuWNMBEaiDqH9RQxstUyUPn3GgPvOv1gwKg++b9w1ouMdPShHM6//KXl2HwiSXyePc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPyKUQ6UwAxeXmFHE90N/mHH3xHxp9lXO94nmn8YwQg=;
 b=lBo+XDuuvA3fY+V95BhLi29QaBIXjjVJlvy7sKfSBqevtFTBIgVyYlfDiOGNxIBY/7ZsKQXHdA4BSWU2yWX7RYJkh/LEcl1mnNguYOn+B6HIAYejxMzq5ePRPHQo8BqqxXf+s8isjP7oYpZydr5qdHywW8N7ZLt1dlvEXL5uYd2aZV7KXFcnieZISbyzW8YUIdZezWvznLUW1RwfFaQAmDsjsrin55ZGo62FHK+bhkWBjNQwfz6v2b615acersbIVJJSaFrOVr+Fx3OGEAF5ZYuEg/ytzii9SO7by+Msoq6m2GiSqn6dt6f4cg9eumhMyatCeELIhbgiYQnTF4RoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPyKUQ6UwAxeXmFHE90N/mHH3xHxp9lXO94nmn8YwQg=;
 b=HXJ3ERNMRU6hlws9ffkRUJ5W9Ms48dkwOh5APyWCxp08WrDYwO0jLj6F5r8egwUzSOH5AFugN1fpeOP9Xl7KqhjnEX5qGfag5QCQXW8XQiriQ8Hs18tvscHXjR/LZvLrWddaGtv6VRUBzi7E4AG+ibNFTCow4/ElW+MiP23IdB35u31ZFrqJHjfPGBTi+l3fc7eDza8a/Eaqu/S1ElmAY2LDXAKKc631A5EThbj2rzMKwz3p+OfsjiQ5fnLE6j0j8eTM9FopSLza4aQffe5wWLpIVjDoAkpiHmPeXLN8AhfoWPqBHrwlaiz8OosSpaMNgVS5seZcGXJuJmTfeY4zhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KL1PR03MB7311.apcprd03.prod.outlook.com (2603:1096:820:cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.23; Wed, 19 Nov
 2025 02:57:59 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 02:57:59 +0000
Message-ID: <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
Date: Wed, 19 Nov 2025 10:57:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, ao.xu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KL1PR03MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 141fd3d6-d1be-45fd-a31a-08de27177249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGtlNG9YWTZvM3k0cGgybGxCU1dlMjMzSEtXckFOQUhIL3V2NVdEZVNyYXJH?=
 =?utf-8?B?cTAyL01tOHZJdmVLM21vU2VqSEhLN3BFbVBsaW82cXdZeWpZbGtqOXByQ3Ar?=
 =?utf-8?B?QWhCRTNGMXNBUWlPVHlYb2EzS0lOa2tZMDBQNDZEaHJYd3ZVSTRDeG9qVE1Z?=
 =?utf-8?B?RWxObHluTUw2UFhaRmV1aDZJMTFnUytKbDZzakUyWDRzazVxckozNVRsOWpT?=
 =?utf-8?B?STVOQ2p2cXg5RVMveUFwOHZUVEtRQVFteEpkZ1A2RmtSeFpudjRYbFczb2ps?=
 =?utf-8?B?R05uakE1bmZuQTc1eVUrRG9peU9tL2NZVUZ2RC9xYzBiSjVLYWYrUkhPL1dI?=
 =?utf-8?B?QXN5bFVYN3N5ZjZnRUNHeFdqMjRTbGdwcGJxNEhxQ09OUEpQS1U0bEVmZ0lC?=
 =?utf-8?B?aGR0V3A2R1VzV2c1M1I1Y2VmNWVMV016OGgvemtxMm5iamtudDBIaU8xN1FX?=
 =?utf-8?B?NHdmYnQ2Wk1iQ2FEeTN3TmFoWnExcWtIeHhRN09ZUGxreU8wNWtPM2owcEU2?=
 =?utf-8?B?Zm1nVDJYc1ppSXJsUnRZNjFIc0ZzUmpVTWFoZUo3SU0wb09kVFhqY2U2emxC?=
 =?utf-8?B?MDNITm9oQkZJdWl2eVdCT1dXM0dCN1B0TUdoNlFBTjBVQUpCWnM4L0h5MWNu?=
 =?utf-8?B?TStjak9CdUJVMTRIMUxIUm9yUmlhYnhUdklNTitOdUozMGFXd3pCZGwza3Z1?=
 =?utf-8?B?WEVzNmQ1OTNoK1RZdnRUaHVrMWZJcTRKMnJqalNxSUtCWHN5OUFlS0pOMFpz?=
 =?utf-8?B?eVJVTGNjaEs1MTdmVnB1TTdQNkNVQlFpVzRpb2lRSURRYlJSYWlQbEY5RUZy?=
 =?utf-8?B?WkNjM3BMbkNuamtQTzlsTm0rVmpTcURJdGxmVDVvNXhXekRjelpIdmQvcVJT?=
 =?utf-8?B?QXN0WG5xWnExTTRpejV2S1JwNHNyMGpvZmI5QmdiNUdmektXMWcxdkNKL1RO?=
 =?utf-8?B?YStHOWpabGQrREM1OERhVlN1UkVnS3l5SUVTcXBQcHBWMFZOemErL0tzUks1?=
 =?utf-8?B?cWxYSEN6L2lCb2dDekkyTTU2Rzg0TUhBSFpUNllhN2ZiS3NSeTArcWdsM3RL?=
 =?utf-8?B?Wk5tOVI0bGMrcEVaalhKZ2VPQTNWaXZtbU1ZWXFkenVHMUkxYVVNVWtHZGZq?=
 =?utf-8?B?eGZjaUxITk5hbEVDTUU2OXFoT1VxSVpPZ2RrUWJNRGdSSEdrZ2dhbUpvYVV0?=
 =?utf-8?B?RkhUWjRHUm9udWpkMVRKMUhqTEZob0RLYmhVL0VCT21RMFdaTUlGYmYxeW9Z?=
 =?utf-8?B?b2xxczgzRkhPWmNsUHl4WW5yRC9NTDZObUhoU0gwcDQrL2FPdnB2dW91UVV1?=
 =?utf-8?B?eHUvVXp4N2xEK0V2RWNZbWZYdXNpUW5CMklNU0lUeTNuV1J3L2xFRGRXOUZO?=
 =?utf-8?B?ZG5NTFVsS2FOeXYyR1hXbmNjZ1pLOUR1U2dVUmJsUmxJM1BEYXhDZE8xVC82?=
 =?utf-8?B?NDhla3pSVjZpbVd3U2hKQzYwek5pWWtiWEZUMit2NjJOK0ZKb05oWEJBeG1U?=
 =?utf-8?B?aFIwUCt6NmdkU0E1aUJDQ01TRGlvRjgzcTRCQ2VRcmFGM2hDQllud0hxTVo1?=
 =?utf-8?B?UFVoNWJCSkMvczNYbW1vRkdSNUhHQlZpNDJyMFViK2ltR3l3NXpJYk90N05p?=
 =?utf-8?B?Q2pqbFdPNzBDMDNyOXVLaXVla2ZPZk8yeVZUUFhZaXRuTWdtcDNDek8vV0E5?=
 =?utf-8?B?bENOc0poeEF6QmY4V3E3RE1kYjYzTmNmeXlvbHd0NW83bnNROWw2VWdzN3RY?=
 =?utf-8?B?UkNYZ3lhSThPbXhDNVc3Z1FrQmdQTUdYZkU2TTVBcTA1K015RlA4Wk5NNkVa?=
 =?utf-8?B?RkJzdFhSN3FCMmhKL2pvV1h2YWN3TjFVSTFrS1lRUjh3SkRvSkVCUCtkaE1M?=
 =?utf-8?B?U1I3ZURQWjk1OGJpdkNaMmpac3NqcmVjTHhiakMxb0FjdDlhL1JhY3ZET3lT?=
 =?utf-8?B?ZklNZEtUc2MwbWRuS1kyaTFzT3RTeTVORnE3aDlWdDRnb0FSanRSU2JhM1Mx?=
 =?utf-8?B?bDZVNTFnMEpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXYrcStaZlRmMWJrSFBadExFdUN3dHpNVXBZaEN4NFhIT1JIOWFSYVZhQmhM?=
 =?utf-8?B?SGE3V0Z0bEhLQ0ZKUlZSRThXR29wUkVCa1dycUdLMDY4cHhtN1dWWTNuSW8y?=
 =?utf-8?B?aXJLM1B6bkcvRVcxMmsvaHFwSU05R3o4OXZNbXdiS2JHMzdVWjRyTDVXb2VV?=
 =?utf-8?B?Y0VxTjhQRmh1b2V2d1cvNnFqR2txVGVwaU1nWVFDNWlvR09Db1dIZjh6ZURu?=
 =?utf-8?B?WWk4YnJ6bCsreS9XUDBsMzlDVCtDVUsrd29hVWpDWDdSam40dVNwUEJ4bjdR?=
 =?utf-8?B?QXNaMEpLNU55ZEVremJpYUZuM0hDcnJoZjNheGpYSHpsYzRaNzgrOGZLMlE3?=
 =?utf-8?B?WWhrYVUrVVV0ZEM3RlJUSWpZb2VvQ3BpVERKV1J3UCtJL21PeWZQRHNPS0o3?=
 =?utf-8?B?cGJzVWFodnpRaE9Fc1lPN25xeGVCeVdLMVMrOGtLblJnT1FCc1F3MzQ3UHFz?=
 =?utf-8?B?NWd4a2F6K0ZYS0NDYTBWeDFtWkhReWd0Z05nN1k1OE5DR1BIOHczVk40SEFG?=
 =?utf-8?B?OE5CZlhmRE1oV0hEaVBrUEt1WUVmMDd4TEFJRTF5dUF6cWlUb2RJc1YxRnA4?=
 =?utf-8?B?aDVPdmhQZFRPUk5JUy9YS3VML29yTWZLWG04aU8wejlPdGc4Z0hkY2RwclVt?=
 =?utf-8?B?bWxnSkNUZkZaNGFYTWhsNUhORFY0Zy9aVTB1NkpiQ2d0N2N6NFlIditOZ2V2?=
 =?utf-8?B?bGljZkJGRGRvZHR0eUNvdS91YlJ5VnVpLzY5VHZtVUtTVmZPWnk5aFdBbjVZ?=
 =?utf-8?B?WjIrRVpSYXRpWktoWnRRZnB5aXZiVm9NaUdWbTFJNjR1SVRRU1ZkK3MvcEFr?=
 =?utf-8?B?cnVkbWJ6NGJXR3NIb1lYWUIyR3NxZi94eWdLOFl0SmdwSXZnVnM4TGp0RnFW?=
 =?utf-8?B?SytSZE5TeUkrZi8rMW0wTkNVRUV3c2pCUTFscVc4TW1OMGdCcjhwMUc0VCtI?=
 =?utf-8?B?MHUvaE5NTXoxWi9VeHpMYTBpTXErL2hUYXgvaU9Cd0trcmEwT3ZxSDlMQStq?=
 =?utf-8?B?eW1IY3V2THNFVEc1ZmppRjc3ZXBDYldpT01ZRnVCN09KOGY4Unp2dDlNY2Rq?=
 =?utf-8?B?aDNZR2FPbjBqdmlpR052UWpjaUxSYjZpNVk1RDZpZ0V2SllVRFpuZncxcXB4?=
 =?utf-8?B?S2V1Nzg4ZGx1bTNkY0l2YWpqZ0hqUnA3MjlDNEJMNlRNVG5GT1pKVi8vWnMv?=
 =?utf-8?B?anBkM1FBMHE1RDBHVEFURGRHajFyMjNsVVhjQXJEdFY1alJGUWd5bk9MMzNh?=
 =?utf-8?B?YmJ0RW54YUJvME5sclNqOUUwVDF4bGdmN0V2Yi90cXJJbXcwTkZBeExFYWpL?=
 =?utf-8?B?SVpRMWtsSDR3UWpVL21Wc2N2akNEUFIrdWZWWHU4VTdQTEJ3OXF6bmRzRDlH?=
 =?utf-8?B?Ry9jcHc1NzI4M2V0VzFESlI1M3ZVaENUWFkzbGZxc00yUmhLYldNZXRXbk1u?=
 =?utf-8?B?aGNwd0wwakpRNFM3Vm9UZzc4QnpaZVUrY2hqRGowUGtMazlLU3NKV0FDUm9m?=
 =?utf-8?B?b0dzU3pBbHJXT3dlTURpeU5WcGhkeXc1eDFFaFJrNlVhTk16bkJxdDFOb3FU?=
 =?utf-8?B?Vzc1VWNaUUdYUVB2UEtWNnM3VFdtRkdtYjBaSVFaOVdzU201bFJhM2haZTdH?=
 =?utf-8?B?YXVuZTRERmZNNWgzL2ZvbUVKcWtJdzdWVEEveFhWRDZwcGpJSDAzbVpiM242?=
 =?utf-8?B?QmcwSzhEZjZQNUdzRVJqSWQ1ajByV0Z0YW5HOEdmbE82SFpUU2pFU1NHTnIr?=
 =?utf-8?B?MEppeW9OOExhL05iT0d3TWxKSmd3SDM3aysrbjJPQlJOLzNnTGNhUUhXc0dU?=
 =?utf-8?B?bVVzV00rUHkwRFN6YVV4WnNNajFhT2Q5cDgvRk52Nmx0TWVTOFRlVUJHMHlp?=
 =?utf-8?B?RWYvdlJsR0FlL00rVm1ITHVlOFFWaW5OZ05FNUozTGV0RHYzM0w4Mm1VUW4z?=
 =?utf-8?B?ak5mWXdNcGJDVXVrNExVUDNOa1FTZWpEZmxaa2ZsV0ZHOTNwdTY5aGZ1c05w?=
 =?utf-8?B?UnNYWlkzTzVCK0xLTWtURUMySytpY2NQOVFvZDE4S0RmdW1FZ3NWT3IzZ3NC?=
 =?utf-8?B?TEZQRS9PR2hsQW56RkI3eTBOYkdxNVBrSkc0SkduV2VjMFZCN0E1WS9odVMz?=
 =?utf-8?Q?rysODpJAv1Z4k9gvLZ/VqeVQ1?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141fd3d6-d1be-45fd-a31a-08de27177249
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:57:58.9788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvJdYc1rzInM2Maijk5UpjipaZmFN/ktzNXss3jbpTgoIJfuFnd5IoAOSTK8/PhsYrLmbPe3SI2X5zalWHm4gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7311
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_185816_174046_4042058A 
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

SGkgUGlvdHIsCgoKT24gMTEvMTgvMjAyNSAxMDo1MCBQTSwgUGlvdHIgT25pc3pjenVrIHdyb3Rl
Ogo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gcGlvdHIub25pc3pjenVrQGdtYWls
LmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJu
QWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4gCj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4g
QW8sCj4gCj4gSXMgdGhlcmUgYW55IGNoYW5jZSB0byBnZXQgdGhpcyBzNCBkcm0gaGRtaSBzZXJp
ZXMgZm9yIGN1cnJlbnQgNi4xOD8KPiAKPiAoaSB0cmllZCBiYWNrcG9ydCB0aGlzIHNlcmllcyB0
byA2LjE4IGJ1dCBoYXZlIHNvbWUgaXNzdWVzIHdpdGggcmVwYXJlbnQgdnB1XzBfc2VsIHRvIHN5
c2Nsa19iX3NlbCkKCldoeSBkbyB3ZSBuZWVkIHRvIHJlcGFyZW50IHZwdV8wX3NlbCB0byBzeXNj
bGtfYl9zZWw/IGlzIHRoZXJlIGFueQpiYWNrZ3JvdW5kIGhlcmU/CgpUaGUgdnB1X2NsayBvbiBT
NCBkb2Vzbid0IHN1cHBvcnQgc3lzY2xrX2Jfc2VsIGFzIG9uZSBvZiBpdHMKc2VsZWN0YWJsZSBj
bG9jayBzb3VyY2VzLCBzbyB0aGlzIHJlcGFyZW50IG9wZXJhdGlvbiB3aWxsIGRlZmluaXRlbHkK
ZmFpbC4gVGhpcyBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoZSBrZXJuZWwgdmVyc2lvbi4KCj4g
Cj4gCj4gCj4+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IEFvIFh1IHZpYSBCNCBSZWxheSA8
ZGV2bnVsbCthby54dS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3IGRuaXUgMTAgc3R5IDIwMjUs
IG8gZ29kei4gMDY6Mzk6Cj4+Cj4+IEZyb206IEFvIFh1IDxhby54dUBhbWxvZ2ljLmNvbT4KPj4K
Pj4gQWRkIGRldmljZXRyZWUgZG9jdW1lbnQgZm9yIFM0IEhETUkgY29udHJvbGxlcgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBBbyBYdSA8YW8ueHVAYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWku
eWFtbCB8IDEgKwo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMs
bWVzb24tZHctaGRtaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwKPj4gaW5kZXggODRkNjhiOGNmY2NjODZm
ZDg3YTZhMGZkMmI3MGFmMTJlNTFlYjhhNC4uNmUwYTgzNjllZWU5MTVmYWI1NWFmMjRkNDUwYTZj
NDBlMDhkZWYzOCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlh
bWwKPj4gQEAgLTU1LDYgKzU1LDcgQEAgcHJvcGVydGllczoKPj4gICAgICAgICAgICAtIGNvbnN0
OiBhbWxvZ2ljLG1lc29uLWd4LWR3LWhkbWkKPj4gICAgICAgIC0gZW51bToKPj4gICAgICAgICAg
ICAtIGFtbG9naWMsbWVzb24tZzEyYS1kdy1oZG1pICMgRzEyQSAoUzkwNVgyLCBTOTA1WTIsIFM5
MDVEMikKPj4gKyAgICAgICAgICAtIGFtbG9naWMsbWVzb24tczQtZHctaGRtaSAjIFM0IChTOTA1
WTQpCj4+Cj4+ICAgIHJlZzoKPj4gICAgICBtYXhJdGVtczogMQo+Pgo+PiAtLQo+PiAyLjQzLjAK
Pj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4gbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
