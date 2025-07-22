Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017C1C83F25
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jul 2025 02:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eox8OUHLbN1kv5j5iKWnDJ5Kh3QufOmpJaOI/wS4SPU=; b=atiwByKycpOvBAx50kGpuNmDTb
	g1Sg3m2eJiK1zwCNiZJtpMSJoBlGbi1W2Us6Z5hQP9t2iNyflX0GjmfPOV24JDUOOxwPJh3C/aP2W
	N6kZ1i0hgQusGg9iO25CSEA97nl/KztqnL/phbtlqF5gMHK0EUbJEtH5Dmt+XbGqIlhTd5Hebt27f
	pvB+ofG6pGEbNBx8bHSpdwHdCvMj6AQK9FOHYzAGhJIRa68NppqWw64dKpu3gUiBGR5OQfhYtAgBb
	F6Mpiw/5fDSlMDR3ebC4deoqQ8JjT93bLZuCoiDgv518mf16AdgV6fZgyGwhmmKJqnD4Rq7pidWcn
	oE9Mgoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue2rf-000000016g2-1YSX;
	Tue, 22 Jul 2025 02:36:23 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue2pB-000000016UT-0TrF;
	Tue, 22 Jul 2025 02:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nV5bzHSWC0wur3XJPN1jUr2SocqfGsuSjudmHsLkw3VfI+tfoCtCZ66Ln94bgnql0TsrJ+FeX+H6+j1PwO6o2Eyikb6KSTgOmiYDfZ0l0GGzcHqmPYVDWJZkGJaS+EQv1PMEOnapUOBW6eAA6eE9VgONN694+JF4xn/0A4hOIWZe68kQNc0wrXBcHi14vg4oKGqnQRJKQmVpqwirEQDiQpTjFNe7dhgS0OSBMh4VoCoO0plDD4C6Q7ryyTSllbweQczHpMRLddhsmEnxINXT7BrVlBggNmkP+yuDgKhGPryCh6c3AwntLW6hjap6C5ozDf7yrZIeEmG2RuIcEBhQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpe10epkVvv+nNylR9uA9P99cRqhmcYFnLttcxXz1KU=;
 b=B/Sj8iMnBvbYlKvQW7VSFZurJZ6Bj6xS2kdTbUdK+CvBvhiXixCZ8jMDOhGeh5uIj8jrFSNtQe3TwOi3FQIttS2p22Ro+bF3rN64tHqrsVPlWlR+z+uqzO8MxXVtH1zX9RaHqBE8Jlz5BXPYiwQlxAMXvGAHgJhjAOleE+Ze2SOTW5JwkZkIknstQf/QbtjHLxAyaV4xY53yoAF8Tx6ZJObfmy5OkFXFN6HBx/R4OcPM3adj90qc2yZBW7wf451TKzmfqlqe48278ToLIcvbRPXWtMip2vgASGTypsZ7TkAIKRs9Elfio6PRhLeRiGcKyQPAXM3ZmFA5At6z9C29fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpe10epkVvv+nNylR9uA9P99cRqhmcYFnLttcxXz1KU=;
 b=vrCCC1xYjugh7TbBElZy+Di9HK0RV841XTil/mAbEWPonp1+WsBIY3PDW646iuu6Zel0817Y1uuO72PcaffC49zYLEsp5lN2iztJUtGdE56fZ7O9KBiy7djLMUCMRe7g3oLjgjqMf+qwa86URuRRypCFjQecCJKX37tiVxBo+aMuZdXAyej3cwUgHuHlgag7mT1XF4yM/KOfzLdYHur+PyosNfKJX1IY2Yus7881CJkC02gDzk8EoZAObcha+snHmbEUKO8B3CMNOy0k5NgDFIDGmEUfAayx5diEJ6WMqd2gYq6YPOLCzPGltzV5Bd2pxfoK50cTKupmSNONK44rzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KUZPR03MB9444.apcprd03.prod.outlook.com (2603:1096:d10:48::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 02:33:26 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%4]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 02:33:25 +0000
Message-ID: <9cea1e05-e24a-47c0-b974-d9e58e2e3cf8@amlogic.com>
Date: Tue, 22 Jul 2025 10:32:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: amlogic: clk-measure: Optimize measurement accuracy
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com>
 <CAFBinCDyjf7MOE6f_AGEEwqV8z68qRv6JAUxn7zt5ZZqwFLkPg@mail.gmail.com>
 <7fbd3743-cfda-4877-888d-bdeb28d4972f@amlogic.com>
 <CAFBinCBdCiNKWoXrL0tw1+_0BL_9XyYfuqQrRNePyzmUh=PX3Q@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCBdCiNKWoXrL0tw1+_0BL_9XyYfuqQrRNePyzmUh=PX3Q@mail.gmail.com>
X-ClientProxiedBy: SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KUZPR03MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d34e1ac-f1bf-47eb-423a-08ddc8c82230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkRXTTVCeCsrVnF2WnRwbXVzeDlNNFBBYWhaaUJLMmxVQmx3NHM0OWZVbUQx?=
 =?utf-8?B?ajFTSWw5bWxnaUVLVXF6U0MzMmJCeDVQN2RERkVtaWRBZnNrYUpvaG44NUQ2?=
 =?utf-8?B?THl4STlsRHBTUXg1RmczUnd5YjRvZ01lcWlLSXc5YnRhZlhQNjA0K0R3ck9j?=
 =?utf-8?B?bVlOOGtNaEZJS0tVTW5mRWVWRFB3d2h1Z29uOTNDRWtib3pyU1BpQ3pUWDBT?=
 =?utf-8?B?TFA4bDdEUUd3Y05jazlYTlE2NjhvMlNGL2RteUthbjB1bHB0Q0hCVnQvaGkw?=
 =?utf-8?B?eGxUV0t6WHVaUUVsa09QVmxBN1ljc25qdngrZ0F6S3k0R0Y3alI2bjdjakds?=
 =?utf-8?B?bk8xVitGNGNkOEU5MWY1TnlQVmpmb0VSMEZRSlVETzRhSVV0eEUyS1MrUDM5?=
 =?utf-8?B?VklSOE5DMHg1b0UwVmc5UjE0VFgxNWxUYXdQT0ZBLzBZTCtEZkdpdGhXSE45?=
 =?utf-8?B?eUpjd2w1SXhSdFRHWG92YVB6VG94b0FEa296RlYzS3FZTzJGWEVtdXVUKzgz?=
 =?utf-8?B?cHhhZ2t3cVMraDdqSlBkSnduallJbUprNlJkOEJqY2E3UWFOc1RGRzdlcEM1?=
 =?utf-8?B?SS9hcWhBYUptM0VjdFRITmkrUjZ1dGZDNEhjd0lRQ3JqdTlud0pXSWQ1Vy80?=
 =?utf-8?B?dnp4SWpNQWRaY1pVVGYrMHNFVmdqYTZKeUdJcVgvWk5vVjJaL3c4V1NvdWlt?=
 =?utf-8?B?cTFBZkcwTml1NTl1NkxFS0RVUFJQdXJ6ekZ6M2k4MWh0b0xLMDc1OUZTWThQ?=
 =?utf-8?B?Y25neVp1MW9VelkzN2pkV2xpeGYwZzhoMmdzQ0dOQTlpaE9nY3dyRGJiZy9V?=
 =?utf-8?B?eitiWGtsZTlpTVJESTNzUWt4MExMbE5wY2xvcHVFM1NRNUszM2ttRnZhZ0J4?=
 =?utf-8?B?cVFwSi9MWCtUdVp0Wlg4VUZjU0czTFBnaVRRNlU0Y3lPYWxlM0Z1U1NxcWxi?=
 =?utf-8?B?ZU5oWVhQMWlZMjZHRXJwWG9NODVkUndFYzJkRHFnc2hOR2krR0QvWlp3L21G?=
 =?utf-8?B?TjBxWUErQU9uY2d2K0w5cjU2NnRTZElYVWtIRCtDRFFVVEFpdzJWSzdYVFJZ?=
 =?utf-8?B?Y2EvYmJDV01rVVRwQWlLRnBXOHBDc3F5SFBLUEcyRmxxaWNXSWhhL08xc2JB?=
 =?utf-8?B?emhvZGFHS2xBUm80V3FQZ1RueDdMNlFybGlOUzlnbmdSWEZ2WUMrV2ltaDNQ?=
 =?utf-8?B?S3JURDlCWU9oMVlpcWZwbWJJMHpYQ2xoVWUxTHBicUl6N09PQlhkcFNpa2Fr?=
 =?utf-8?B?SjRRTzcxR1FRSHpja09Ya2t2L2o0eFVKMkpvM1BCNlJ4REJUMFR3OGp0K1BB?=
 =?utf-8?B?T1AxSUVNUmVjdlJ0OU5iMDFqK0pGQkdhTHY3Z0lEeFZzbi9wS0JvWHY4Z3Qy?=
 =?utf-8?B?cHBiYkNuWDlEK2FVQkJJSHFGZUhKOXEyS0pnakFnMU9qVjdaeE9PZm5yRFRl?=
 =?utf-8?B?S01sNzhxcDZtYTlmMEZiY0NsS2hTL0h4dGdKK2lJTnJ4Sk9JZ24vdTNwY3kv?=
 =?utf-8?B?QWlVZGdBSzF3alZTSFZQVWlOY3Y1OHRwczNYYTBSdEZ1TGk0MTFySERKMDRq?=
 =?utf-8?B?SDByeVYxZ3cwaGpRaGNiMFJPd1Q0TGljWXJGZUJ2aEdhZnYrcmxKNUpXQTh3?=
 =?utf-8?B?bjZiZHBpNW1RekhYY0VPa00wODE5eG1JdmlYYUREQ1VoaXNJczdOWEVOZEFr?=
 =?utf-8?B?bkQzcW81aTFVS092UnlCUGZiZXczQVNMT3RwcVVVenFMUXBJUkZLZk1UVDZQ?=
 =?utf-8?B?bVZhTWtuRVRZem5SUlByMTdlbDFZWVhLcHZHZEI1R3VtZGdCZDAvUjdlOUdX?=
 =?utf-8?B?OGw5TkpTcnoxNHltYnBoREl6UGZqNUs3OXptY1g0eThReWdOeEdNTWd0dENu?=
 =?utf-8?B?cjZtNXVjR0tzWVZsWjBVMW4rSEsycWg3ZklUUFNPakJXK3AwN2dmbkxWWGk2?=
 =?utf-8?Q?Z4HZgU4W2F8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U01qbFBxVFVTSGdsK1VHMnF3WmJIcUxBV2IrQ0s4S25rbXhGN0xQbHJjZzAy?=
 =?utf-8?B?Q0k3amRmeHhlRXJPYUlVNzg5blJic1U4ejVUZWxxdkZmblVXS0hWSnJ6NzFM?=
 =?utf-8?B?U2FGbnJCSStTUktLQk91QjhOTzlzdkRDb3p4YU0xcnZDd2RpNDJ1WGVuQTBu?=
 =?utf-8?B?T1p6MnozUWc2MUpkVlN0OFE1NDdwTTMzWlZ3a0ZnN2JRY0J1TnFHYXlXNHdU?=
 =?utf-8?B?NU5TM2lSYU5zYW9ITTJVNUQ3Nkhsa3YzQWJnV255M0JLQmx3VktVS0FrMkZG?=
 =?utf-8?B?alVSVUMxVThPRVJ5TUF3N1JiNHhLK2VOVnRXbWFIaWtXcWs5Zmw2N1dNdFVX?=
 =?utf-8?B?UHNGaXY3Wi9VeWhKUUhGaDJCRE5nT09hbEY3dEVDMVdrOWxzVVJPeFIzT3NU?=
 =?utf-8?B?S2VUWVFJSEk5akd3RWd6ZTVreDVpSTNVTFlteDMxRmRoOGduT3UxR0U1U1JV?=
 =?utf-8?B?Q1hGdFpzSE5acWpSSjByOWZLUm5XWCtEZFd6SVRpWUh2VStwMHVmOXpQb3JE?=
 =?utf-8?B?SlZZLzA2S1NrbHVlRHJXNDgxdDJ2QUk0VXRLOG9iYVlvUW43dmFVdjJYcDFn?=
 =?utf-8?B?Y1FzdzY0RGcvejRNLzNVd2h4Z00yVjFQSlN1MjUvR2R4Y3ZsUHdqT0JBK2dZ?=
 =?utf-8?B?UW1rMFBkVjgwVzFHNmVYRWRuRDYwMnkxbU5WREtTazAwWE1LSXNzbXZZMy9p?=
 =?utf-8?B?TnozbGtRZFdyL0ROazlEV216akVnUlVYTTU0Ymt1dVpVN1p5T0VrQUtyK2Zj?=
 =?utf-8?B?bDlueVplWVlkZjBKem1BaE50SHBnNjEvK3J4cDNqbWhPbzdtTjFLcU5ldVE0?=
 =?utf-8?B?c0FFbmc4R245NGtSUUVMRTl6MUVjdyt0ZnhxNVZKanZYM1huVk1JVnd4aE9V?=
 =?utf-8?B?ZW9tUkVjZ3kwRmZyeGpka1pJSERhSDB2cHliSzhjOUoxZjl1dFNJOGZtdmpC?=
 =?utf-8?B?SlZTNmF6dWFIL1orajhyNG9jRFFEMUhGTU9DVmplVjJGbXdkVXQ0aUI1MEtB?=
 =?utf-8?B?YkdrdWp3ZTBvTTZyTVBkMXdCUGRycFkwdTY3bW1sblRKTDhuRFRCMnYwUDRm?=
 =?utf-8?B?dU42dGsvb3RsbVRuSGFhdi9yWmN6SWdJM2Z1YzlMUEU3dC9JdG9za3NVZDBu?=
 =?utf-8?B?RkMyaVdNMHptb2EwbU1NSktvR25YdFlQalZWcExsSWxYOWdNUTBxRldyenVu?=
 =?utf-8?B?RnhCcGJIZ21tZ3pPTDJ5ZUliVU9rSHZheTVMcTFiZE9ESWVXd2NLMjNPakE1?=
 =?utf-8?B?Z3p2YUJveENUYUlPZWpBOU42QnIxREM3cVdWQ2dpSGEwNm44eHltNWI2OEVR?=
 =?utf-8?B?VTdqNzMxSkRiZDdLWHY1VE1Md2g3Y0dxWnR3di85WjExeEQyVDVHTUlUditX?=
 =?utf-8?B?ZkpROUxScDF3d0lydWplbUY5a1lUSEtwL0h3d08zcnM2bjdvUm9DNWEvWVA5?=
 =?utf-8?B?MnZtVzdYamtYZ3NSbWN5Zm5QQTd5aWQxQnkzTmhTL3pjYk5RVllHdFFuV3hu?=
 =?utf-8?B?UE1MSTJYU3dnZTYwMWVuVCtjSUF0ZW56TW1UbzJSeFZuYjVtbm1XVUhlQnp1?=
 =?utf-8?B?dkxYTXI3WUxLK25JZ0VDOWtrdXYzVGd3aXdPWGJ3TTVPdWJGTHJFa2RsVFlh?=
 =?utf-8?B?ZG5kYkZrMEdNeDJjUlNmM3E3bTNmZjNHRWRWQ2hKVXR6SjBwSUdMSDFlUDRI?=
 =?utf-8?B?Q3dYd0tJekd3QndPbHR4dU9ON2Z4OWJBblR6RmJIdXlaSWVuTVltRFRtRFk3?=
 =?utf-8?B?NkcrMXl4REdDdUFoQ2lmZVR6ZVkyTGVoODk4NXhqSHJmK056NkIxN1RmK1pw?=
 =?utf-8?B?aXRsREZCYUtTN096M2d1QTBSMEhic05aV1ZyZVNrRVQ3d3ViKytacjd1V0dY?=
 =?utf-8?B?QUxrQm0ycGxNSGY3RWlXY2l0M2pNRUN3YWszZ25MYmJJd0h6WW5wRzRDeFd5?=
 =?utf-8?B?bzA4eFV2bkU4YlIxT2NPdm05Y0JOODFqZ2t1UmxDazNWby9HTE5yN2RCaXgx?=
 =?utf-8?B?cGVKR0ZGNUc2SHJ2MnpqbW1lTCs5VEQ5cG4xMGx1U3J2WGhGcDZRWUt3b00x?=
 =?utf-8?B?YmNudTh4OXUyR2FIZ0RoY1VWMmFVM243Q25ESWI3TU9VSDkzZjRpdEJKbDNI?=
 =?utf-8?Q?Vxw59J+uJ8F7yGGQXY97EnAOZ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d34e1ac-f1bf-47eb-423a-08ddc8c82230
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 02:33:25.1680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOtr8DeZ1Pcv20NicU5v1okpnO882bOVCs/QEE1k50OjWJdjsE7I8XMOwqWWIkHbb8lbzwR5ZqiJWvXwj3Royg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9444
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_193349_280957_7E5716A6 
X-CRM114-Status: GOOD (  20.86  )
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

Ck9uIDcvMjIvMjAyNSA0OjE2IEFNLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IFsgRVhU
RVJOQUwgRU1BSUwgXQo+Cj4gT24gRnJpLCBKdWwgMTgsIDIwMjUgYXQgODoxNOKAr0FNIENodWFu
IExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPiB3cm90ZToKPj4gaGkgTWFydGk6Cj4+Cj4+Cj4+
IE9uIDcvMTcvMjAyNSAxMTo0MyBQTSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPj4+IFsg
RVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IEhlbGxvLAo+Pj4KPj4+IHRoYW5rIHlvdSBmb3IgdGhp
cyBwYXRjaCEKPj4+Cj4+PiBPbiBUaHUsIEp1bCAxNywgMjAyNSBhdCA1OjA44oCvQU0gQ2h1YW4g
TGl1IHZpYSBCNCBSZWxheQo+Pj4gPGRldm51bGwrY2h1YW4ubGl1LmFtbG9naWMuY29tQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Pj4+IEZyb206IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29t
Pgo+Pj4+Cj4+Pj4gVGhlIGN5Y2xlIGNvdW50IHJlZ2lzdGVyIGhhcyBhIDIwLWJpdCBlZmZlY3Rp
dmUgd2lkdGgsIGJ1dCB0aGUgZHJpdmVyCj4+Pj4gb25seSB1dGlsaXplcyAxNiBiaXRzLiBUaGlz
IHJlZHVjZXMgdGhlIHNhbXBsaW5nIHdpbmRvdyB3aGVuIG1lYXN1cmluZwo+Pj4+IGhpZ2gtZnJl
cXVlbmN5IGNsb2NrcywgcmVzdWx0aW5nIGluIChzbGlnaHRseSkgZGVncmFkZWQgbWVhc3VyZW1l
bnQKPj4+PiBhY2N1cmFjeS4KPj4+IEkgY2hlY2tlZCB0aGUgTWVzb244IGRvd25zdHJlYW0gY29k
ZSBbMF0gYW5kIGl0IHVzZXMgMHgwMDBGRkZGRiB0bwo+Pj4gbWFzayB0aGUgcmVnaXN0ZXIgdmFs
dWUgLT4gdGhpcyBtZWFucyB0aGF0IG9sZCBTb0NzIGFsc28gaGF2ZSBhIDIwLWJpdAo+Pj4gd2lk
ZSB3aWR0aC4KPj4+Cj4+PiBbLi4uXQo+Pj4+IEhlcmUgYXJlIHRoZSB0ZXN0IGNvbXBhcmlzb25z
IGJhc2VkIG9uIEMzOgo+Pj4gWy4uLl0KPj4+PiBIZXJlIGFyZSB0aGUgdGVzdCBjb21wYXJpc29u
cyBiYXNlZCBvbiBDMzoKPj4+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyBwYXRjaCB3aXRoIE1lc29uOGIg
YmFzZWQgT2Ryb2lkLUMxOgo+Pj4gcHJlLW9wdGltaXphdGlvbjoKPj4+ICMgdGltZSBjYXQgL3N5
cy9rZXJuZWwvZGVidWcvbWVzb24tY2xrLW1zci9tZWFzdXJlX3N1bW1hcnkgfCBncmVwIC12ICIg
IDAgICIKPj4+ICAgICBjbG9jayAgICAgICAgICAgICAgICAgICAgIHJhdGUgICAgcHJlY2lzaW9u
Cj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAg
IGNsazgxICAgICAgICAgICAgICAgICAxNTkzNzIzOTYgICAgKy8tNTIwOEh6Cj4+PiAgICBhOV9j
bGtfZGl2MTYgICAgICAgICAgIDI0MDAwMDAwICAgICsvLTMxMjVIego+Pj4gICAgcnRjX29zY19j
bGtfb3V0ICAgICAgICAgICAzMTI1MCAgICArLy0zMTI1SHoKPj4+ICAgIGhkbWlfY2gwX3RtZHMg
ICAgICAgICAxNDYzOTkwMzggICAgKy8tNDgwN0h6Cj4+PiAgICBzYXJfYWRjICAgICAgICAgICAg
ICAgICAxMTQwNjI1ICAgICsvLTMxMjVIego+Pj4gICAgc2RoY19yeCAgICAgICAgICAgICAgICA5
NDQ0Mzc1MCAgICArLy0zMTI1SHoKPj4+ICAgIHNkaGNfc2QgICAgICAgICAgICAgICAgOTQ0NDM3
NTAgICAgKy8tMzEyNUh6Cj4+PiAgICBwd21fZCAgICAgICAgICAgICAgICAgODQ5OTIxODc1ICAg
ICsvLTMxMjUwSHoKPj4+ICAgIHB3bV9jICAgICAgICAgICAgICAgICA4NDk5MjE4NzUgICAgKy8t
MzEyNTBIego+Pj4KPj4+IHJlYWwgICAgMG0wLjEwMnMKPj4+IHVzZXIgICAgMG0wLjAwNXMKPj4+
IHN5cyAgICAgMG0wLjA2OXMKPj4+Cj4+Pgo+Pj4gcG9zdC1vcHRpbWl6YXRpb246Cj4+PiAjIHRp
bWUgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lc29uLWNsay1tc3IvbWVhc3VyZV9zdW1tYXJ5IHwg
Z3JlcCAtdiAiICAwICAiCj4+PiAgICAgY2xvY2sgICAgICAgICAgICAgICAgICAgICByYXRlICAg
IHByZWNpc2lvbgo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+PiAgICBjbGs4MSAgICAgICAgICAgICAgICAgMTU5MzczNDM4ICAgICsvLTE1NjJIego+
Pj4gICAgYTlfY2xrX2RpdjE2ICAgICAgICAgICAxMjAwMDAwMCAgICArLy0xNTYySHoKPj4+ICAg
IHJ0Y19vc2NfY2xrX291dCAgICAgICAgICAgMzI4MTMgICAgKy8tMTU2Mkh6Cj4+PiAgICBoZG1p
X2NoMF90bWRzICAgICAgICAgMTQ2Mzk4NDM4ICAgICsvLTE1NjJIego+Pj4gICAgc2FyX2FkYyAg
ICAgICAgICAgICAgICAgMTE0Mzc1MCAgICArLy0xNTYySHoKPj4+ICAgIHNkaGNfcnggICAgICAg
ICAgICAgICAgOTQ0NDM3NTAgICAgKy8tMTU2Mkh6Cj4+PiAgICBzZGhjX3NkICAgICAgICAgICAg
ICAgIDk0NDQzNzUwICAgICsvLTE1NjJIego+Pj4gICAgcHdtX2QgICAgICAgICAgICAgICAgIDg0
OTk5MjE4OCAgICArLy0xNTYySHoKPj4+ICAgIHB3bV9jICAgICAgICAgICAgICAgICA4NDk5OTIx
ODggICAgKy8tMTU2Mkh6Cj4+Pgo+Pj4gcmVhbCAgICAwbTAuMTczcwo+Pj4gdXNlciAgICAwbTAu
MDA4cwo+Pj4gc3lzICAgICAwbTAuMTA5cwo+Pj4KPj4+IFNvIHRoZXJlJ3MgYWxzbyBhbiBpbXBy
b3ZlbWVudCBpbiBhY2N1cmFjeS4gVGhlIG9ubHkgZG93bnNpZGUgSSdtCj4+PiBzZWVpbmcgaXMg
dGhhdCBpdCB0YWtlcyA3NSUgZXh0cmEgdGltZSBmb3IgdGhlIG1lYXN1cmVtZW50LiBGb3IgbWUK
Pj4+IHRoaXMgaXMgaXJyZWxldmFudCBzaW5jZSB3ZSB1c2UgdGhpcyBmb3IgZGVidWdnaW5nLgo+
Pj4KPj4+IFsuLi5dCj4+Pj4gKyAgICAgICAvKgo+Pj4+ICsgICAgICAgICogSEFDSzogVGhlIGlu
cHV0IGNsb2NrIHNpZ25hbCBwYXRoIGZyb20gZ2F0ZSAoQ29udHJvbGxlZCBieSBNU1JfUlVOKQo+
Pj4+ICsgICAgICAgICogdG8gaW50ZXJuYWwgc2FtcGxpbmcgY2lyY3VpdCBpbiBjbGstbWVhc3Vy
ZSBoYXMgYSBwcm9wYWdhdGlvbiBkZWxheQo+Pj4+ICsgICAgICAgICogcmVxdWlyZW1lbnQ6IDI0
IGNsb2NrIGN5Y2xlcyBtdXN0IGVsYXBzZSBhZnRlciBtdXggc2VsZWN0aW9uIGJlZm9yZQo+Pj4+
ICsgICAgICAgICogc2FtcGxpbmcuCj4+Pj4gKyAgICAgICAgKgo+Pj4+ICsgICAgICAgICogRm9y
IGEgMzBrSHogbWVhc3VyZW1lbnQgY2xvY2ssIHRoaXMgdHJhbnNsYXRlcyB0byBhbiA4MDDOvHMg
ZGVsYXk6Cj4+Pj4gKyAgICAgICAgKiA4MDB1cyA9IDI0IC8gMzAwMDBIei4KPj4+PiArICAgICAg
ICAqLwo+Pj4+ICsgICAgICAgZnNsZWVwKDgwMCk7Cj4+PiBXaGF0IGlzIG5lZWRlZCB0byBtYWtl
IHRoaXMgbm90IGEgSEFDSyBhbnltb3JlPyBJcyB0aGVyZSBhIHJlZ2lzdGVyCj4+PiB0aGF0IHdl
IGNhbiBwb2xsIGZvciB0aGUgbnVtYmVyIG9mIGNsb2NrIGN5Y2xlcyB0aGF0IGhhdmUgcGFzc2Vk
Pwo+Pgo+PiBUaGUgcmVxdWlyZWQgZGVsYXkgZHVyYXRpb24gaXMgZnJlcXVlbmN5LWRlcGVuZGVu
dCBvbiB0aGUgbWVhc3VyZW1lbnQKPj4gY2xvY2sgc291cmNlLiBUaGUgY3VycmVudCA4MDDOvHMg
ZGVsYXkgaXMgY2FsY3VsYXRlZCBiYXNlZCBvbiBhCj4+IG1pbmltdW0gaW5wdXQgY2xvY2sgZnJl
cXVlbmN5IG9mIDMwa0h6LiBBdCBoaWdoZXIgaW5wdXQgZnJlcXVlbmNpZXMsCj4+IHRoaXMgZGVs
YXkgY291bGQgYmUgcHJvcG9ydGlvbmFsbHkgcmVkdWNlZC4gQXBwbHlpbmcgYSB1bmlmb3JtIDgw
MM68cwo+PiBkZWxheSB0aGVyZWZvcmUgYXBwZWFycyBvdmVybHkgY29uc2VydmF0aXZlIGZvciBn
ZW5lcmFsIHVzZSBjYXNlcy4KPj4KPj4KPj4gVGhlIElQIGN1cnJlbnRseSBsYWNrcyBhIHN0YXR1
cyByZWdpc3RlciB0byBkZXRlY3Qgd2hldGhlciB0aGUgaW5wdXQKPj4gY2xvY2sgc2lnbmFsIGhh
cyBzdWNjZXNzZnVsbHkgcHJvcGFnYXRlZCB0byB0aGUgaW50ZXJuYWwgbWVhc3VyZW1lbnQKPj4g
Y2lyY3VpdHJ5Lgo+Pgo+Pgo+PiBUaGUgZGVzaWduIG9mIHRoaXMgSVAgaGFzIGJlZW4gbWFpbnRh
aW5lZCBmb3IgbWFueSB5ZWFycy4gRnJvbSBhCj4+IGhhcmR3YXJlIGRlc2lnbiBwZXJzcGVjdGl2
ZSwgdGhlcmUgaXMgcm9vbSBmb3Igb3B0aW1pemF0aW9uIGluIHRoaXMKPj4gc2lnbmFsIHByb3Bh
Z2F0aW9uIGRlbGF5LiBGdXR1cmUgSVAgdXBkYXRlcyBtYXkgbm90IHJlcXVpcmUgc3VjaCBhCj4+
IGxvbmcgZGVsYXkuCj4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZGVzY3JpcHRpb24uIFRvIG1l
IHRoaXMgZG9lc24ndCBzZWVtIGxpa2UgYQo+ICJoYWNrIiB0aGVuLCBpdCdzIGp1c3Qgc29tZXRo
aW5nIHRoYXQncyBuZWVkZWQgdG8gaW50ZXJmYWNlIHdpdGggdGhlCj4gaGFyZHdhcmUgY29ycmVj
dGx5Lgo+IE15IHN1Z2dlc3Rpb24gaXMgdG8gcmVwbGFjZSB0aGUgd29yZCAiSEFDSyIgd2l0aCAi
Tk9URSIuCj4KPiBXaGF0IGRvIHlvdSB0aGluaz8KCgpPSywgdGhhbmtzIGZvciB5b3VyIHN1Z2dl
c3Rpb24uIEknbGwgcmVwbGFjZSBpdCB3aXRoIOKAnE5PVEXigJ0gaW4gdGhlIG5leHQgCnZlcnNp
b24uCgoKPgo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
