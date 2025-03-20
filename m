Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEB0C35FFC
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Mar 2025 02:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsJn/hN5xVn7h2XujyZC8H3vyoHXj1dWePsy3dNPdDc=; b=sLSMoN4+fzxP33LI45e6Iqs4T5
	Wyf1L3HXiQoQ80DYj7HAiwXMGpem0pH+5Gga+GhMRCVQNhL9GqwfpDzKPWvtjbQkZ/hyvizNKxpww
	YvWMVnSh154d+dj0ylX/8LRU/n4b5/+lVvGDoUJjnmIM265XDCC8Spir0hV/Nd/9rHS+nSLojXi/A
	mW4Ry3OfhNJ0mBaC9nXo5yj3cY4d06MdFUt9FhrcOgcVms4lY8axnrF92yczwPVVOpYJt4wGh7RVP
	vx711YqCWvS7FzBbdQsvvwNUl+CV/pPx3yDbpIOq3agvOGoAKPuMVbyEalxw2CS6pcu0sPJ3oCEe5
	mSapv87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5ht-0000000AuVW-0VNC;
	Thu, 20 Mar 2025 02:32:29 +0000
Received: from mail-psaapc01on2072a.outbound.protection.outlook.com ([2a01:111:f403:200e::72a] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5cN-0000000At8c-0DQL;
	Thu, 20 Mar 2025 02:26:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCBaLRMxx++otNvnHwqPYRNm7y5zuIEhyLekK7PkyrvqW6R7uA6z/WBv5hKa4io5+tX+9jMyKXdmx/MX0TGktI/7MYi1pVLj2MjNUs7P0uEA7xVZI5Ch3ac/hc21PFOF1Iwesw6DkwsG3pnzFwG9PDNaTauM7BUyxGTRJ6xoIA9RyYAwOfLXzXO2jKObshimMfWBayu0zf7yGoVaF5GWq4TdbG/ShkBPvF5XuSpB6iJ29EiO8a3P7eLVcr1ONPDhKOMC25q6G6oliBQd7FlXUOAnyCOWr2FsvFO7Ss7voTnsWoJ3LCwRAi6d/rLGLrejENOhVH+19P/zTLcZ2DSL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAnkaj5atPsTpRiIYkv7uGsik4OTl7GHkdS1a9UOhpo=;
 b=FwjMjLzBM1hAALTM1bvVqFGJbSh4HJL3z5m9hZJh0gwo8u6Zv7yyAAjeAlbEkKwpseHCWPsJfutI55T/ynxByqnf9LvdyIC02nsvHzg+9dbdIbOMI/uxEajfYpUg9SUm8vmguKw1cwsShLprpB3lvJNCl6vXlYwwrzC2aHBvPMcMmpVNGupos6UUf3WdGOlg+kY/PrgYHtDnvyedYExoNlSuahd9gyvfVwuc/Ik303V7+eWwoJFIA7LVi5QM58nzaPPF28YREIbTa/nJsP9KQbiIGjKitQNf2yWSwHSWB6Kp80+AXN01+PgezGdBF7i6EW94AwvKWhgAkMZWPXLhKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAnkaj5atPsTpRiIYkv7uGsik4OTl7GHkdS1a9UOhpo=;
 b=YrRaen8lUGGgHAqpoeUOIF6aNNvZZxQUQ4X3ABppuxiOzi8FxjN6oPLSIMEbzR+TypnlWpFhPF/99qEpmtknYHbAwi4uhbCcMkO/fJgzTzE3Mc+BY/q65/6d6czpOl5b5X0V8qadTzHB5we8yY+9qG1PtFFm1U4AMl4QCUgT4z6Hbos5kSmIYUX9goBzzhvTJlCGGJ1XpGezqBV+7Ml9wWgFxmeFtwfO8PRjU56HyJ65AN7RfWtd/P+Ld7kvrTSERRC1txUECn0/i7187Az7uyVxnMYeapgW5xA+jQIPoam7Y4IdNbTvxr/fX+zU9/aRIX2JYyMzyEPqAWZEcKdgZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEYPR03MB8479.apcprd03.prod.outlook.com (2603:1096:101:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 02:26:37 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%7]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 02:26:36 +0000
Message-ID: <e5d3741d-0f4e-4f92-9b1c-04b114892330@amlogic.com>
Date: Thu, 20 Mar 2025 10:26:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad clock ids
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
 <20250319-audio_drvier-v4-2-686867fad719@amlogic.com>
 <20250319-daffy-classy-kangaroo-023e1f@krzk-bin>
 <9ae73d75-9c59-4255-8924-b456c86cbc01@amlogic.com>
 <7084e271-8546-4a49-9eb8-ee3f647c529a@kernel.org>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <7084e271-8546-4a49-9eb8-ee3f647c529a@kernel.org>
X-ClientProxiedBy: SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) To
 PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEYPR03MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ed80bd-4864-406c-049f-08dd6756a374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1FwSGtlaHdULzRCRDh6MFJpTHBxWDFXOTZib1NDczI4Y0dUUm5zVWxxYTNp?=
 =?utf-8?B?b0V1Z01Bdm9CdlBIR002YmJJOTdES0pVRnZGdVRDVi9DWkY2ZTd2ajM1amxB?=
 =?utf-8?B?YlBmNlJwczZGYTcrNXJkbklUdDVzNWhvZkhDQ09zN3c2bGJuVXRsNHFsOVBN?=
 =?utf-8?B?ZXRna25DdFJ1RGpyMjEwUktlN2JHREdDU0FJVmNNMWhhaGhDQmZLdWlCYWNq?=
 =?utf-8?B?emRxR3JobitCZzdHQ2Nma056R2JFNDBYSTJOVkFNNzRYUERPVmhRc05kS3Rv?=
 =?utf-8?B?alZzd2hwV0xyM2Fabjg5NU1yR2IwVTltQ3YycFUvNzYvVDB0dFlIcS9MVWZD?=
 =?utf-8?B?NGpzdldqc2xrZHcrakt1VGd3NnZZVUJSSzdDdTdZNm1uRU9uak82MEpkWWZB?=
 =?utf-8?B?SXdqSkpvRWVYM0svcDVUNWc1MTN1OHczRWhjSGNNM1B5MEZZcmUrbDZ4QVRC?=
 =?utf-8?B?YXBuRCtuMjJQdXNjb1B1WDVIVTZJeEVoZTRIdnU3ZCtEL1ovUVVKZlY5VUFW?=
 =?utf-8?B?c2FLamFvOE9LR1NDRWJ6ak5JOVVlTEZmYUNBY0FGM1lWTzVrRFV0OExDRUhS?=
 =?utf-8?B?SDVnNHhKdkpnQlpWcjFEMHl6MTcyOFJCTFJMbGpuNGFnVUQzcnRKZk1LR1FC?=
 =?utf-8?B?YkFGS0JKKzFnejQ5K0RncmNWMXZ0bnR1bnZSYmJTdWJsNnZFVEhMVmIyNG8y?=
 =?utf-8?B?VGZpRFYyd3cySy9TM1Qxb2I0N1ZWSEd6K2ZxTGsyaktEVmExWlgvWUZ5QW5C?=
 =?utf-8?B?Y2FrRS9HSmZSM0pxenlYZFhuTTNkT0ZNaGVpT1BMbWVXWWdib2c5Vk1NcWo2?=
 =?utf-8?B?VFIzZGdDTnk2c3pXbTVXUDNxRkQycG9yVEk3NDlXckIwZGNwcWlnWUZ2NDli?=
 =?utf-8?B?MGw2R3U1UDZpR2YrQnpKZlNBNmF5d1JsY0ZvUnFodjhtdVBPKzl0Mnc2TWZj?=
 =?utf-8?B?YVEyZ09jTlFmR0xkQUJuWjJBKzVaRUQ2YVVaQlczMlpvSEhYVUV5RzIrb2w0?=
 =?utf-8?B?Rld4ckNPWVV5SEQyNVY1Q0JSanN6MndnZ0JTdFFpbDdocm9lMnJNOXNYWXRJ?=
 =?utf-8?B?N0JwaHg5ZjdZVCt6TjRDMjZyVVp0U1BFOU9xRXhOaUNpQ1loM3RmTHRxZEE4?=
 =?utf-8?B?SDB2TE9wRVpVeWZuN2NXZlFONmk5ckxiaUV6WEVyQlppOFRiNEFZSSs4NGI0?=
 =?utf-8?B?clpNQkJveFBSbXJIbXZQTzlzdzlFSm50TmJCVEdKUXE0UHRhVnN0eFRDdHdV?=
 =?utf-8?B?SGNaVjZlUnhCWFpNTm5VbElZdEVwcUhranpmcThoREt4dmZuRGFyN0NRN2VZ?=
 =?utf-8?B?VkxTNXU2R3gvNXpVdStCdkxodnhkUnB2S2RsTiszQUNjc3RDTGhtY2V6QmZt?=
 =?utf-8?B?TERHNFF6dkdqSEdkbHpaT0FqS0pDY2grMEVVMEZSMEtuTUNDZDViSlQ0RURN?=
 =?utf-8?B?SGEyQXZJOHp3aEZmVFQyRlA2Q3dkclBlK2d5UHQ2RGltVkticWZKQy9ZZGpq?=
 =?utf-8?B?dzUvNzV5QWpVV0haOUg2UTlzaHUrcWlMOExTaGRmbWJpYkQzMUxtV2NrMFJ6?=
 =?utf-8?B?YnlJMEx3NE9abmR4bHpZcU01cml3Ri9yS1pGU0dKd0NtL01kMWoxUW1FbXFs?=
 =?utf-8?B?Qm1hTGpKR1QvZjJEZ2QzbzEzQTZxd1A3Rk1laWxEYnJHWFNEdmlZcWZ5Znpm?=
 =?utf-8?B?TUFvYjVURkNsbldkYi9Dc2tLVndldThyZ2tGYm9JRTZlWlZyOWZsclB1OG14?=
 =?utf-8?B?b2IvYkZzLzg0aDc4UU9nNk1lZ1dPWHBuNmVVQlVVeEJ3bEREUVdNc2szbEd5?=
 =?utf-8?B?ZlpOdUJrc0hZc1dQR0tFZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW44eVFiS1hsQ2RhalJKNC9ZcU5wdnBaTGpscUxTWUlhYkx2czY2ZjBnTWNE?=
 =?utf-8?B?MjVXOTRVRW5Cb2dGNmVSRSszTFhJVXlGZzBGcm1XaGJmLzBJT2dNdFRWckZS?=
 =?utf-8?B?Sis0VW5TT3FWTWEwekhGUkVCVm1qNi93U3RBMjkwZ0dBQlBUUHlLV3RhWWx3?=
 =?utf-8?B?MWpFQ3BpTm5qS1RVVUR0dW84UjhRNVBsVGVPMVN6R2FWaHJzSUhUNURHMWQ4?=
 =?utf-8?B?VzVHTU5tbnJMU2dMMjBmK0xUOHpJaDU4SVdiRFpjRDlGM0NqMlNDVlNGVTVV?=
 =?utf-8?B?SzZOQWorY3luWDhGTW1oOTk3Z3Z0RmpCS3oxa0FmQWgvUG5vMi9jTEhwZVp6?=
 =?utf-8?B?UWozLzNrUHhDT3U1N2tBdFdNbUtCTkdNMG1UMnNWME1GSEZDSVlQUE5WaDFV?=
 =?utf-8?B?Y1lhenVIT0NEOFZXRjNKejEyMGNFbWFKVGczNXVoZnFGSENSR0Y2bzhmUUhM?=
 =?utf-8?B?RkkvY0J0dzhuZWF3dzJXbXV2WlhVNDBGL0tQTnlHK3VGV0wrQ2J2RVIyamFD?=
 =?utf-8?B?TzB3K0pxTnJvRjlKRGVXcmdXczgyV013Wm1VRy92R1ErSHZhRHM1blpyTDRj?=
 =?utf-8?B?VG9NWXBpLzhJWXczZHRQRTJXK2EvTnJ5UmpGTzBxSUROZXdZYURvZEVDWkFZ?=
 =?utf-8?B?MDV0L1lRelRTVWJFV05OQnFKNDFkTDdEdCtCZHdocUdpOVpKdms2bVg4T1Jr?=
 =?utf-8?B?RnpqZjZWTW1QOXhucUdGV1ZpT1NaR3E1QjZpUmR0Nzk5UjNlMVFqWUpBa29J?=
 =?utf-8?B?S0RrZ0pkOE83ZFdLSzBGM0t3c2NEaHI0ZjJuaCthbURZNzRUVk4wRXg2eWU0?=
 =?utf-8?B?LzM0T3lOb05MK3RHN3BQMFpGY2FtVENCdVJmcG1aNDNGOFhqckQ1RUxZdDFl?=
 =?utf-8?B?L2hRNmUyT0tWY2F4dWNQVTJQRmtQbEhNWFlmRWoxcTI5OURzOGlCV0M2UEZY?=
 =?utf-8?B?NzVYaGl1SkZGRDlMOG12SlprM1NSWS9QYnQ5QUZ4dGlNQ0tiSkNZYW4zM3k4?=
 =?utf-8?B?ZGgzVHZuOGsvL3hqQk9mcW5VNE5Ccng0UHcwaEUxZ24za3VITVZ0VkE1UFRW?=
 =?utf-8?B?VFUyWS82NU5QK2hUblNpV3YxOTI4SHBpYUF6SXpocFdhT1NvRjRXa2NRYUkx?=
 =?utf-8?B?QXFnZmhxY3NoVkwrL2FJRkJheU5FSUhXN0RCcERTUzQ1eGVOcmIwTWphRURV?=
 =?utf-8?B?ZFkrcVJCVG4zQjFpUWRoZXdmQ0hNT2lMRWpyaWJ0NDZiOFlWR21hT1l2ZXZX?=
 =?utf-8?B?YlMyOXpyVUU1RHhpTW1sZ2d1YmJyU1U5amM2elZNUER5enF1c3BzQmc4NUZS?=
 =?utf-8?B?SkE2SngwLy96U1ZRUHFzQ3gvOEhCbU9JSSs3WDBJR2tudWh6MmkxWm5SY3Ba?=
 =?utf-8?B?T0hoQnJycXhVUzRIN3JmdllsOElHY2duMCtGNzU1aGphcHFHMlF5U3c0aGZs?=
 =?utf-8?B?czJBaE41eW4zVXNObzUvajZhZWQ2bDQ0Tkt0ZjB6SkM5RjhBUk1OVDZtN1lZ?=
 =?utf-8?B?bXE2TWxzMVA4RjFkUDhJMnIzc3FDRnVZRTRZZGNNRlg1MnJ1NEpTOVhEOGpI?=
 =?utf-8?B?eTk2QllFZFJMY3NXOU96OElWM3lXaCtMNmFaT3dwSmJjRVZEYUJZSisyd29a?=
 =?utf-8?B?WktkdEU5OUpxWkZZd0p5b0FMZU9VLytKREhKb2ZlNlVMVDdSaU12TkgvZDU1?=
 =?utf-8?B?V3VJdUVRMGtpdStzdzczUFhmbThnRitnQktBTm5ZYllxWVk3eFNiVVp5QnRF?=
 =?utf-8?B?bUUxanZXVzVGL0NGYkxYUmFwZXNnZG1WdnV1VDFEcFQwdGhVNmJ1RnVzY3M3?=
 =?utf-8?B?ZTlUeWtHS1hYcUppaFY0VGRyZXljM241aFhTQ0lwM1pPZHArOCtxRWlwN3lS?=
 =?utf-8?B?VVZ5elJCWnUzM3dFZ093bjloZUNMTmNpUzVzVTV6N0hmakowckd5YndiTytj?=
 =?utf-8?B?VUdEY0VZZlRZL3VlSEFSaC84QlpGdWs3ME5uQnloUit4SjhOdHJFRDhRS0Zm?=
 =?utf-8?B?L28wbGhYK1BmOHEwdVR3TytaZ3JnK1A5TFJoVGp5cmtyWThrcXF0Q0w4N3Jl?=
 =?utf-8?B?c3B1UzlmZDdNT2l2eWRQZFBwbTkrQXBmNUlXVExxaWx1b01ZNTBPSU1Hc1o4?=
 =?utf-8?B?UTl2cjF4THgwcG1pL3N6cnFqNmRvR3dDSm0vZjBvU2Y2K1lTSWVHM211UDBv?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ed80bd-4864-406c-049f-08dd6756a374
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 02:26:36.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KHBVz0gms/DhytItGSqOmAlT6MhBcmCTqiYPjBHz742gTaywtU9yg6/1g+Su/s5yA5IxSituhYP8wkAxSAv9wMh3sucKnQ8RHMzchZKO5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8479
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_192647_104002_966D0F15 
X-CRM114-Status: GOOD (  15.91  )
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

CuWcqCAyMDI1LzMvMjAgMzozMSwgS3J6eXN6dG9mIEtvemxvd3NraSDlhpnpgZM6Cj4gWyBFWFRF
Uk5BTCBFTUFJTCBdCj4KPiBPbiAxOS8wMy8yMDI1IDExOjA5LCBKaWViaW5nIENoZW4gd3JvdGU6
Cj4+IOWcqCAyMDI1LzMvMTkgMTY6MjIsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+Pj4g
W1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBrcnprQGtlcm5lbC5vcmcuIExlYXJuIHdo
eSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRl
bnRpZmljYXRpb24gXQo+Pj4KPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9uIFdlZCwg
TWFyIDE5LCAyMDI1IGF0IDAzOjA0OjQ1UE0gKzA4MDAsIGppZWJpbmcgY2hlbiB3cm90ZToKPj4+
PiBBZGQgY2xvY2sgSURzIGZvciB0aGUgbWNsayBwYWRzIGZvdW5kIG9uIHM0IFNvQ3MKPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IGppZWJpbmcgY2hlbiA8amllYmluZy5jaGVuQGFtbG9naWMuY29t
Pgo+Pj4+IC0tLQo+Pj4+ICAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXhnLWF1ZGlvLWNs
a2MuaCB8IDExICsrKysrKysrKysrCj4+PiBUaGlzIGJlbG9uZ3MgdG8gdGhlIGJpbmRpbmcgcGF0
Y2gsIHVzdWFsbHkuCj4+Pgo+Pj4gQW55d2F5IC0gZG8gbm90IGFzayB1cyB0byBkbyB0aGUgd29y
ayB0d2ljZS4KPj4+Cj4+PiA8Zm9ybSBsZXR0ZXI+Cj4+PiBUaGlzIGlzIGEgZnJpZW5kbHkgcmVt
aW5kZXIgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4KPj4+Cj4+PiBJdCBsb29rcyBsaWtlIHlv
dSByZWNlaXZlZCBhIHRhZyBhbmQgZm9yZ290IHRvIGFkZCBpdC4KPj4+Cj4+PiBJZiB5b3UgZG8g
bm90IGtub3cgdGhlIHByb2Nlc3MsIGhlcmUgaXMgYSBzaG9ydCBleHBsYW5hdGlvbjoKPj4+IFBs
ZWFzZSBhZGQgQWNrZWQtYnkvUmV2aWV3ZWQtYnkvVGVzdGVkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5n
IG5ldwo+Pj4gdmVyc2lvbnMgb2YgcGF0Y2hzZXQsIHVuZGVyIG9yIGFib3ZlIHlvdXIgU2lnbmVk
LW9mZi1ieSB0YWcsIHVubGVzcwo+Pj4gcGF0Y2ggY2hhbmdlZCBzaWduaWZpY2FudGx5IChlLmcu
IG5ldyBwcm9wZXJ0aWVzIGFkZGVkIHRvIHRoZSBEVAo+Pj4gYmluZGluZ3MpLiBUYWcgaXMgInJl
Y2VpdmVkIiwgd2hlbiBwcm92aWRlZCBpbiBhIG1lc3NhZ2UgcmVwbGllZCB0byB5b3UKPj4+IG9u
IHRoZSBtYWlsaW5nIGxpc3QuIFRvb2xzIGxpa2UgYjQgY2FuIGhlbHAgaGVyZS4gSG93ZXZlciwg
dGhlcmUncyBubwo+Pj4gbmVlZCB0byByZXBvc3QgcGF0Y2hlcyAqb25seSogdG8gYWRkIHRoZSB0
YWdzLiBUaGUgdXBzdHJlYW0gbWFpbnRhaW5lcgo+Pj4gd2lsbCBkbyB0aGF0IGZvciB0YWdzIHJl
Y2VpdmVkIG9uIHRoZSB2ZXJzaW9uIHRoZXkgYXBwbHkuCj4+Pgo+Pj4gUGxlYXNlIHJlYWQ6Cj4+
PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMi1yYzMvc291cmNlL0RvY3Vt
ZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0w1NzcKPj4+Cj4+PiBJZiBh
IHRhZyB3YXMgbm90IGFkZGVkIG9uIHB1cnBvc2UsIHBsZWFzZSBzdGF0ZSB3aHkgYW5kIHdoYXQg
Y2hhbmdlZC4KPj4+IDwvZm9ybSBsZXR0ZXI+Cj4+IHRoYW5rcyBmb3IgeW91ciByZW1pbmQKPiBB
cmUgeW91IGdvaW5nIHRvIGRvIGFueXRoaW5nIG9yIHlvdSBhcmUgZ29pbmcgdG8gaWdub3JlIHVz
PwoKc29ycnksIGkgZm9yZ2V0IHRvIHVzZSB0aGUgYjQgdHJhaWxlcnMgLXUgdG8gY2hlY2sgdGhl
IHRhZywgeW91IGFyZSAKZ3JlYXQsIHdlIHNob3VsZCBjaGVjayBhbnkgbWVzc2FnZSBpbiBodHRw
czovL2xvcmUua2VybmVsLm9yZy8KCnNvbWUgZW1haWwgbWlnaHQgbm90IHJlY2VpdmVkLCBmaXgg
aXQgaW4gYW5vdGhlciB2ZXJzaW9uLCBJIHdpbGwgY2hlY2sgCmFsbCB0aGUgbWlzc2luZyBjb21t
ZW50cywgVGhhbmsgeW91IGFnYWluCgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
