Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC09C02180
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2025 11:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S836kaDNERWNxpf/Cq06jJo5gyDO1LNykJD+hLWDD14=; b=jTqSBPV5F/MRWVWsjlIgnXmE+j
	c2rn8qAsorIMtR53OpfCbwydFyyOyUkVwAK4RhPRPp4Kcbf8VxlXL9/0GjuuITWkgad7owQESh/R3
	qbPhVThjNr3hfz4wDzVx7xqmdXZafVZ3Vrd8svdplVSsqjXhsPTgoGuHF8gBO5GgGEbILJVMvCht9
	S2n3ZKKGFLPn3BYkcwGPScrnDMKb9vMkqmsj4V9k2t/JulMilgLNSYAmn/SvmTJQ9MXwE17rv197i
	DMFDaIWciTN6kHmUGI1q80ABMb2z08xpoK7CzujWrDVB8U38cC2u7LHkQNunOTiPCFZrPJCDOQiTg
	BGyeRUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1tf-0000000Bk4e-2hXX;
	Wed, 15 Jan 2025 11:49:19 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1sP-0000000BjzI-3PGi;
	Wed, 15 Jan 2025 11:48:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHcd2TDGYB6tK6vB3nuijlfm8zzkV+7O0iWpFl5vI2wNoRjl+c61glTrGf1lAOvykjMVyZYfH4C6YFpYdo9AHM0W7WGLrHFmtz50I4SgI1nafmYsEXiIhZrVElejEvSpYmcE7l60VxK4LV1kAp4uBqM3xUwMgZ0ROSYvNG7yHzQe85s2+F8m8Lhxyw5ENJYWyKDzwiFklExwfFBeWtQp4Bd7y+cHGAcPNhkfkltvcguyanPgc90vezbsuZR653t0phJ2Izq3EtTwRUM3dn52wUizgF6smud6djTdhqeQ581MQ/63aXNTdEj8EPBybW3gGH3kmpx4B3LLs6PS0xVxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uUbNfzpqxPt1PcWrOpI2ALqgDvkaqQWav9w9/zNJho=;
 b=YMvjsfUP7BrekJhh3QzqveySkI/4hewQppL1UORIG/wa+SOzfb2YXez+LD6Fz6eyGsZYg+lsheERITaUBSmy0WgEQoN7CYk6LftV9DQ7Z1rns53jBLAQQuTDC51dAMvqEy/oRCw7iYSoXI6GVbJHfHvXFf+sUNVva8QbwlvhuBI/FsSTWSpolA7H+bdeM65RzVHDCQ3oZ097W0SuLoIWFhPaFrI6hMDgmzuUfTpmGvJXq8qDmTxmdmLxb7Q4rGmkfTD/orKL9HgD0o370cCOjiKvB0DUo8bx54ME06er9zVXRYlnlp/Vqf7WCYi6btZnVo4UhnihQLXKQtXJjsEVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uUbNfzpqxPt1PcWrOpI2ALqgDvkaqQWav9w9/zNJho=;
 b=AH5RlOjr0UpADF2vubFDxS5ytAXlyNDjvbONcYDi0Om0Qxicb08R/ZeOmGrYssickKbMoAzm2zi9VZOYJ+tbKGRYNV3PkMoYPVYTiI9GeJqnFgmzUWAInf4nppUM9Zql12IOz+NFyxEQ5b8FU2Hf5C55EyPErghQfDahmoiVu2vPdl2qS72NZJBEjf3j3uzcJwN/UJ/fG3EY6K3MZemVmYL41nDiHH7M/pzXvqldH8WjQbFNYqsffzuYfXZKxF+pHl9p3vXY2Z+jGJZTx/kfhXFTqJXh10mk6iAtqE2L5XoOw4QygaHDOzxBRoHwyvZvSbip+blUwCSRTLiEUI1Lyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by TYZPR03MB8557.apcprd03.prod.outlook.com (2603:1096:405:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:47:36 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 11:47:36 +0000
Message-ID: <af4fde1c-281b-4826-a52c-a4e14727eb67@amlogic.com>
Date: Wed, 15 Jan 2025 19:47:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
From: Jiebing Chen <jiebing.chen@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
 <20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
 <1jwmey9451.fsf@starbuckisacylon.baylibre.com>
 <e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
 <e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
 <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
 <e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com>
 <1jr0545v8w.fsf@starbuckisacylon.baylibre.com>
 <7cf4c53c-7cd2-402c-9e31-f85767ead932@amlogic.com>
In-Reply-To: <7cf4c53c-7cd2-402c-9e31-f85767ead932@amlogic.com>
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|TYZPR03MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 85984c00-af9b-4b4e-9e1e-08dd355a67ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW82aXl5WDlUM21GTWUwd0VTUHRwNjVJbmxqNzN6bnpQVHZyTyt3bms5TjRF?=
 =?utf-8?B?bjNCbTRhOUhpYlQ1VWQ2T0tqc1lQVThIVzNxUEs5OGFVY1RqRkVOMzVSdTFU?=
 =?utf-8?B?L0VVRmlxRlo4aDMzSldBeXVIcFZnSDcwMVgzd2I0MVhGNjFya0htQUZ0S0Rk?=
 =?utf-8?B?ZVFscytrRWNHRXR5ZkMvZGY1dVc5dzhqUVpFcGRVUWpvTWdVTzhIYStUSW00?=
 =?utf-8?B?S2xKSGxwdUFRRGhpZ01jTnpiV2Jjbklwbi9neWdGRk0vRTdMTlVFUlUwbmY2?=
 =?utf-8?B?MUpvY2MvSllnTDV2SC9mcnVLSTNFYzlmOTJTMFhsMmRkL3lSMGRWdnBZRUI2?=
 =?utf-8?B?OUFXaHNmQTlDbjFzN0JGU1NTTVR0TitRczBEdUxuR0N6RXZlZ1NVM0NLQ2FB?=
 =?utf-8?B?L0xGQ09rcVJhTjhvNTFxQXA1cHdmSEx4UXlXeHFJMk1ZR2dLdkNtN1hOanZv?=
 =?utf-8?B?VHRJRUJwNnZuT1FWY0NhNVMrUTV2SnVrcCswamVxZWdWVzBBU0FUcE5HUElF?=
 =?utf-8?B?bDdmVmYzdUdTSU1mbXF6cEJ3NHQzcHVXUjhPeWNNQkdPREZ3SmhZYWUrSlFC?=
 =?utf-8?B?QlRiZTd4amMwT2o1QXR0TVNqclVkNStzVS9pY3FaQ1d1WFNJYVBUZkFwYmtx?=
 =?utf-8?B?bWdKZlpOOCt5ek5vYnl1dGtZMVRENS9oSkhrNXNUaTd5YlRYbUQzSEZrMnhp?=
 =?utf-8?B?K09kNFI3Sk45WDBBSUR0ekJHQkZHcFRBN1BzZEFVQ1NqVTdpbWRWNTQ1QnFj?=
 =?utf-8?B?MHRoV0xOMXdUdXJ2Y3QvOHdQN3p1MS9INWhUQTA0Y1czYzMvTFlXMVhzM280?=
 =?utf-8?B?OTFaR0Nhc2orelJKUEZvcUxkVW5ZM2QwVzhLN1ZKZUlndmVZeXp1UmRFRk10?=
 =?utf-8?B?Vmx4RzF5amRaK1BWZWU3UGRBempweXB5Y05WbVpNOVhZOHZHaDRMT3lqNkFn?=
 =?utf-8?B?S2NiajdrUStRaldlWlZXU3RSZnBHeTFteXFDdjI3ZURkNjQ4ZnpmYklpQkww?=
 =?utf-8?B?dlp4Tk1zemtQZzZzOC9jOElYYktkd3BwOUdhMDRDVjBMZGF5cjcveDIyelVB?=
 =?utf-8?B?MXQ2MEhBQnlqOSs0b1dDT3pmd0Y0VWloYXpSbmRhMWZkdWVndVVTbE9JWkYx?=
 =?utf-8?B?UEJtL1BOaklFcnJjN3lFdlNScTBuQ0oyRkxWWlpLdmNJWGRBMFlxZTVQS1gz?=
 =?utf-8?B?dVNlYlI1c25MdDlRclJNWnlQdDU2MU54UWpyT2VkQXZjeWF1NW5yZ0FHNzJp?=
 =?utf-8?B?SjJTVmxRRWxDd2ZDRnBEL2YwMWhQMWt3YXZWUkFmSmlWaGxOWGZTbnExWFdq?=
 =?utf-8?B?amhmMUVaR3g0ZUlFRFUyWXd0TDVpM09WZXlmVnJZa08rb21CTVBjbDNxejNu?=
 =?utf-8?B?elR2TS9zRHp5eDEyUU5tRzBGQVp4bGZTZmo1cW1VOXAvcFV4Z3ZXS2UzVEp2?=
 =?utf-8?B?WDMxODRzbWFveDRtWUFiU0N6ZmdrNjEyTGFjOUJPaHNlUjg1MFI2b29NMUFU?=
 =?utf-8?B?SHQ3TUx1d09UencrLzdxZW9vMkhTSHJJLzJQQ3ZmdXNGY2VvaXBkbENNdEJy?=
 =?utf-8?B?VHl6b1U5VisxczkxQ2RjdGc4cmJHQUFSK1JUVGQ5bHE4VG9aUDVmRGtqUWdh?=
 =?utf-8?B?cmM4R1FFMW4wNTM4VzlxTDgrYVlUT0FkVU5vZEh3NDE5VkI1dXEvclBzSDdl?=
 =?utf-8?B?WndjdkFsYXRXMUFGeHNrSG5SaXloaDJ5NmZEbldjN080WElmY0ZrTTl0YUJJ?=
 =?utf-8?B?VjhZeW10YUMxTmpDU01NYTYwVVE1LzVZVW55WmtlNmh2ck9oU3UxNXQ2L2FG?=
 =?utf-8?B?bXpjOHZMMG9uS2h2NFRBMmh2WWRRTGxGMHNMOGlJRnNMd3JKKzg5cjZtMnNE?=
 =?utf-8?Q?gPJsf3iopCWYq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmQrVmpBU2hzRHNPK1U5clAwRDB6aUg3dkhjSG4wdHZvMWs4SlE4cms5Sjd6?=
 =?utf-8?B?TCtsMmJBZkNndDlZbm51bDhZcFdidXg0MFVkS0xFc0dHV2F2Q1hSRE9Vd1po?=
 =?utf-8?B?eUdLSXVnYXNSaE9KUUdiSWtmdGFBUFkyWXZKbjFDazBWcUlPY3RySFBoYm9W?=
 =?utf-8?B?Y1NyMUxqTTBOVktWYVRieVQyNTMxQ01TWi9YMHpyaFAzTTg0Rmx0SVNPYTA2?=
 =?utf-8?B?ZG5mVWlQUVdHYmppa1RrOCtiR3Y0YmxFa0xHK1R5aUNBbStJczhJYWtKamJM?=
 =?utf-8?B?WndkUEJKRzgwbklkaTFEQ2dpZnJodWtqaVNqSnZjQ29qcXpCSkNaVmpuSzF6?=
 =?utf-8?B?QVdyOXZRVXJRMkR0OXlYZnZPcXd1R2dSaEhOVU1oYzB0R1VnVEVLbzBacVFn?=
 =?utf-8?B?Z1ZvVmRNMnV4cjU0bzkwbWFrWVdTZnVtSUlCWHhPdFhWNGdEdy9qdDNjQlcz?=
 =?utf-8?B?WTVjd05aQkxUaU1WQklhUkljYk1ybEVrOEZBVUZRMjQvWWJEQW93YjYvQ0tT?=
 =?utf-8?B?MFhkTmwvLzV2cklodWVBSVlITjB2ZW5qRzdBWDJzYmZEV2w2TlowcnZVTUZv?=
 =?utf-8?B?WGl3UmYwYmVlS29XdmV0S0ovdkE2aGVta25IQlJMTTd1VVBpTmpGMnpobXJt?=
 =?utf-8?B?dmREczRHckdXdzd3bWFhMkkwZS9xaWk2eHgvNS9DZVBVMnU2U0V0MjRUR3gw?=
 =?utf-8?B?aUFzYTBvUmQvV0JEQy9ZZmFXcVR2UFRNbm1ydkJ2dzFuSE9QcUZ5QjdTU2la?=
 =?utf-8?B?VlRFTmwwTHZUQWllVWkwZStCMW1SaWU3enlZRVZFSUtHT2g5ZGtCYkZ2TmxT?=
 =?utf-8?B?VHN6eXlWMDRiRE1rd0ptaW1ranpPRUdQWG9paHExVkpKaXRaZG96M0pEZytB?=
 =?utf-8?B?eFFZTEtTYTV5TmRPOFN1eFVINUJaZTZ0WkcxQ2tvS0dDUGtkT3ZCeGZ4N0xC?=
 =?utf-8?B?eGh5RUhxMW04TzFyQUhEVjB0SG1nbzQyanAzNHl4L0c3Q0V6MjV6ODFVa1JS?=
 =?utf-8?B?L1pDaUc0M092b2ZTSWFsc0htV3NQdVdXaFg2b0ltZWdXdEEzNTRPYWVYRzYy?=
 =?utf-8?B?SGo1cFZKV2ZESVdEL3BjblN4QytKcWFiM2lFbFg1dVVSdjBZM0N2dDFLV3c2?=
 =?utf-8?B?QURjMnpiWm9NRzI2OWFzUDgzYzAxMzdlcWsyUmpLWndMVXEybGtnOXVPZWg3?=
 =?utf-8?B?ZXBWMkNnM0JjTFpWdUFzKzdtbGVKOVhGYnE3cWhVSU5yay9tdHJEWFFFTUVq?=
 =?utf-8?B?QXpBcmJSNlJDM3gzZkd0NEdNVDgxd2QyMnk2N0RyNUNYbU9yOEVKaVAxempW?=
 =?utf-8?B?cTlMeEpJV2MvZ28zUWpLSk93czNBb0RsU3I2MnFUUkJNek51S0Q0cGxsWDZW?=
 =?utf-8?B?Z2xCdGQrOWNMVDJHdWkrQkprVUg1T1l6ck5QS21WWXFsbXNiZHZxS0xicGpV?=
 =?utf-8?B?RFprOWZNRXNtQ1BjRFIrVmcyY1VKQ2J2bXNzd2N5RmFvR3dJcE5LeElnbXlr?=
 =?utf-8?B?eURSWlM2QzF4YitZVnBGMVRhU2ZFblViSHJYb1dvY29KUW1hVE5oczBoaW9Y?=
 =?utf-8?B?aUVFYjE4ODVtcGFpbjBDSTljMjd5bFVUMW85bXhXN2REUnRHQVhjTVF2NWc1?=
 =?utf-8?B?Y20vYWEreHc5WjJkVkZKSGxqNWltVzFSWlhvQTdqaEJHUXp5UmVsMEFBN1VE?=
 =?utf-8?B?UU5ZQy8rajRlQUN4NjBlNjA2SE02WjNzU3JwUVovYzFLUnVjZWtEZEZGSXlo?=
 =?utf-8?B?V2FGS2NJM3A0S0FEbWJ0TnFjcGxURytFeHdvVXVBZDMwdG04QS9FaHZ3Qno0?=
 =?utf-8?B?OEFnTVJYYVlJSVRoaDUxbDM2enBFdWxMSzhGSk96TnI2VjQwdXNyVllqR0xH?=
 =?utf-8?B?RktyMHI0SkowVTJrdHNmcm9LRklCcjI4SndJVTJyc3UyeUZZWUg0MHhDek9s?=
 =?utf-8?B?OW9DWHIvRTlnWmJVYnQzR2d5MDFUbHViaWNmTEVDQTVkK3lod01xcHg4bHVJ?=
 =?utf-8?B?SjBqWE1aZnlqRFdjcVcxTTJ6V0ZyVDJJbFFGM2lxSkQ3TmZESzhrTVZwaktI?=
 =?utf-8?B?Tk9SYXFIM1RXY2JIT21vT2gwMXNJcHBwSk9WVkdxaUtEQkNuTWJleHJ1TE1H?=
 =?utf-8?B?N0syZXRpUWsyTlVxcGxxVUxJRHZzemZsUU44SXV5anFIS1B6RnltSXprbkk3?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85984c00-af9b-4b4e-9e1e-08dd355a67ac
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:47:36.1291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7P3t6V7cSUgRJFMMYoOPdLIqtz/r7+rlN3UUvgqH9sARI61zv2ilm/bfdhB+DjJ+ku1Aa0eYnQjQltACIVk7Yan0F1KERkNshxTclPtbsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_034801_978438_884C571A 
X-CRM114-Status: GOOD (  26.92  )
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

CuWcqCAyMDI1LzEvMTUgMTg6MzYsIEppZWJpbmcgQ2hlbiDlhpnpgZM6Cj4KPiDlnKggMjAyNS8x
LzE1IDE2OjM2LCBKZXJvbWUgQnJ1bmV0IOWGmemBkzoKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+
Cj4+IE9uIFdlZCAxNSBKYW4gMjAyNSBhdCAxMDo1NiwgSmllYmluZyBDaGVuIDxqaWViaW5nLmNo
ZW5AYW1sb2dpYy5jb20+IAo+PiB3cm90ZToKPj4KPj4+IOWcqCAyMDI1LzEvMTQgMjI6MDUsIEpl
cm9tZSBCcnVuZXQg5YaZ6YGTOgo+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+Cj4+Pj4gT24g
VHVlIDE0IEphbiAyMDI1IGF0IDE5OjIwLCBKaWViaW5nIENoZW4gCj4+Pj4gPGppZWJpbmcuY2hl
bkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArTU9EVUxFX0RF
U0NSSVBUSU9OKCJBbWxvZ2ljIHRvIGNvZGVjIGRyaXZlciIpOwo+Pj4+Pj4+PiArTU9EVUxFX0FV
VEhPUigiamllYmluZy5jaGVuQGFtbG9naWMuY29tIik7Cj4+Pj4+Pj4+ICtNT0RVTEVfTElDRU5T
RSgiR1BMIik7Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vdDkwMTUuYyBi
L3NvdW5kL3NvYy9tZXNvbi90OTAxNS5jCj4+Pj4+Pj4+IGluZGV4Cj4+Pj4+Pj4+IDU3MWY2NTc4
OGM1OTIwNTBhYmRjYTI2NGY1NjU2ZDRkMWE5ZDk5ZjYuLjJkYjFjZDE4Y2YyY2VhNTA3ZjNkNzI4
MjA1NGUwM2Q5NTM1ODY2NDggCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDEwMDY0NAo+Pj4+Pj4+PiAtLS0g
YS9zb3VuZC9zb2MvbWVzb24vdDkwMTUuYwo+Pj4+Pj4+PiArKysgYi9zb3VuZC9zb2MvbWVzb24v
dDkwMTUuYwo+Pj4+Pj4+PiBAQCAtODksMTAgKzg5LDcgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29j
X2RhaV9kcml2ZXIgdDkwMTVfZGFpID0gewo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuY2hhbm5lbHNfbWluID0gMSwKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21heCA9IDIsCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAsCj4+
Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSAoU05EUlZfUENNX0ZN
VEJJVF9TOCB8Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUgfAo+Pj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRf
UzIwX0xFIHwKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSksCj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSAoU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUgfAo+Pj4+
Pj4+PiBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSksCj4+Pj4+Pj4gQWdhaW4sIG1peGVkIHVwIGNo
YW5nZXMgd2l0aCB6ZXJvIGp1c3RpZmljYXRpb24uCj4+Pj4+Pj4KPj4+Pj4+PiBUaGlzIGRyb3Bz
IFM4IGFuZCBTMTYgZm9ybWF0IHN1cHBvcnQgZm9yIHRoZSBleGlzdGluZyBTb0NzIChzdWNoIAo+
Pj4+Pj4+IGFzIEdYTCkKPj4+Pj4+PiB3aGljaCBpcyBrbm93biB0byB3b3JrIGFuZCBhZGQgUzMy
IHN1cHBvcnQgb24gYW4gSFcgZG9jdW1lbnRlZCAKPj4+Pj4+PiBhcyAyNGJpdHMKPj4+Pj4+PiBv
bmx5LiBDYW4geW91IGV4cGxhaW4gPwo+Pj4+PiBmb3IgZzEyYSwgc20xIGV0YywgaXQgaXMgdXNl
IG5ldyBhdWRpbyBpcCwgR1hMIGlzIG9sZCBpcCwKPj4+PiBJZiB0aGVyZSBhcmUgY2hpcHMgZGlm
ZmVyZW5jZSB3ZSBkaWQgbm90IGtub3cgYWJvdXQsIHRoZW4geW91IHNob3VsZAo+Pj4+IGludHJv
ZHVjZSB0aG9zZSBkaWZmZXJlbmNlLCB3aXRob3V0IGJyZWFraW5nIGV4aXN0aW5nIHN1cHBvcnQg
LQo+Pj4+IGluY2x1ZGluZyBmb3IgR1hMLCB3aGljaCBpcyB3aGF0IHlvdSBkaWQgSUlVQy4KPj4+
Pgo+Pj4+PiB0aGUgbmV3IGlwIG5vdCBzdXBwb3J0IDI0IGJpdCwKPj4+PiBBcmUgc3VyZSBhYm91
dCB0aGF0ID8gdGhhdCBjb2RlIGhhcyBiZWVuIHRoZXJlIGZvciBhIHdoaWxlLgo+Pj4+Cj4+Pj4g
SWYgc20xIGRvZXMgbm90IHN1cHBvcnQgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUsIHlvdSBzaG91
bGQgYSBmaXggCj4+Pj4gdXAgcGF0Y2ggZm9yCj4+Pj4gdGhhdCwgd2l0aCB0aGUgcHJvcGVyICJG
aXhlczoiIHRhZywgaG93IHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSBhbmQKPj4+PiBleHBsYWlu
aW5nIHRoZSBmaXguCj4+PiBtYXliZSB0aGVyZSBhcmUgc29tZSBnYXAgLCB3ZSBzdXBwb3J0IFNO
RFJWX1BDTV9GTVRCSVRfUzI0LCBub3QgCj4+PiBzdXBwb3J0IHRoZQo+Pj4KPj4+IFNORFJWX1BD
TV9GTVRCSVRfUzI0XzNMRSzCoCBmb3IgU05EUlZfUENNX0ZNVEJJVF9TMjQKPj4+Cj4+PiBpdCBp
c8KgIFNpZ25lZCwgMjQtYml0ICgzMi1iaXQgaW4gbWVtb3J5KSwgbGl0dGxlIGVuZGlhbiAsIHRo
ZSBhdWRpbyBkbWEKPj4+IGJ1c3J0IGlzIDY0Yml0Cj4+IEl0IG1ha2VzIGFic29sdXRlbHkgbm8g
c2Vuc2UgdG8gZGlzY3VzcyBtZW1vcnkgbGF5b3V0IGZvciB0aGUgY29kZWMuCj4+Cj4+PiBpdCBj
YW4gZ2V0IHRoZSBmdWxsIGRhdGEuIHdlIHNlbmQgdGhlIDMyIGJpdCBkYXRhwqAgbWNsayA9IDMy
Yml0KiA0OGsgCj4+PiAqNCwKPj4+IHVzZSB0aGUgY2xrIHRvIHNlbmQKPj4+Cj4+PiB0aGXCoCBT
TkRSVl9QQ01fRk1UQklUX1MyNCzCoMKgIHRoZSBoYWR3YXJlIGFsd2F5cyBzZW5kIHRoZSAzMmJp
dCBkYXRhCj4+IE5vIGl0IGRvZXMgbm90LiBJdCBzZW5kIDI0IGJpdHMgb2YgZGF0YSBvdmVyIGEg
MzIgYml0cyBwaHlzaWNhbCB3b3JkIAo+PiB3aXRoCj4+IDggYml0cyBpZ25vcmVkLgo+Cj4gVGhl
IG9yaWdpbmFsIGludGVudGlvbiwgd2UgcGxheSAzMmJpdCBkYXRhIGZyb20gdGRtb3V0LCBpdCBw
bGF5IGVycm9yLCAKPiBzbyB3ZSBhZGQgdGhlIHMzMl9sZQo+Cj4gZm9yIHRkbW91dGEgLGl0IGNh
biBiaW5kIE11bHRpcGxlIGNvZGVjLCBvbmUgY29kZWMgaXMgdGhlIGludGVybmFsIGNvZGVjLAo+
Cj4gb3RoZXIgaXMgZXh0ZXJuYWwgY29kZWMsIHRkbW91dCBjYW4gc2VuZCB0aGUgZGF0YSB0byBp
bnRlcm5hbCBjb2RlYyAKPiBhbmQgZXh0ZXJuYWwgY29kZWMgZnJvbSB0aGUgb3V0cHV0IHBhZAo+
Cj4gZm9yIGV4YW1wbGUsIHRkbW91dCBzZW5kIDQgY2gsIDIgY2ggaXMgc2VuZCB0aGUgaW50ZXJu
YWwgY29kZWMsIDIgY2ggCj4gc2VuZCB0aGUgZGF0YSBwYWQKPgo+IGl0IGFwbGF5IGVycm9yLCBk
dWUgdG8gdGhlIGludGVybmFsIGNvZGVjIGZvbWF0IHBhcmFtZXRlciBsaW1pdGluZyAKPiBjb25k
aXRpb24KPgo+IFRoZXJlIGlzIGEgY29udHJhZGljdGlvbiBoZXJlLMKgIENvbnNpZGVyaW5nIG91
ciBpbnRlcm5hbCBjb2RlYyBjYW4gCj4gcHJvY2VzcyB0aGlzIGl0LCBkcm9wIDhiaXQsIDI0Yml0
IHZhbGlkCj4KPiB0aGVyZWZvcmUgc29mdHdhcmUgY2FuIHNldCBzMjRfbGUvczMyX2xlLCBzdGls
bMKgIHdvcmsgb2sgZm9yIGhhcmR3YXJlLCAKPiBzbyBNdWx0aXBsZSBjaCBjYW4gc3VwcG9ydCBm
b3IgaW50ZXJuYWwgY29kZWMgYW5kIGV4dGVybmFsIGNvZGVjCj4KPgphZGQgdGhlIHMzMl9sZSBm
b3JtYXQgZm9yIHRoZSB0OTAxNS5jLMKgIGl0IGNhbiByZXNvdmxlIE11bHRpcGxlIGNvZGVjIApz
MzJfbGUgZm9ybWF0IGNhc2UswqAgYWx0aG91Z2ggaGFyZHdhcmUgb25seSBwcm9jZXNzIDI0Yml0
IG9mIDMyYml0LCBidXQgCml0IGNhbid0IGFmZmVjdCB0aGUgYWNvZGVjIGhhcmR3YXJlIHdvcmss
IGl0IHN0aWxsIHdvcmsgZmluZQoKdXN1YWxseSB3ZSBhZGQgdGhlIHMzMl9sZSBmb3JtYXQgc3Vw
cG9ydCwgaWYgbm90IGFsbG93IHRvIGRvIGl0LCB0aGluayAKb2YgaXQgYXMgYSBsaW1pdGF0aW9u
LCB3ZSBjYW7CoCByZW1vdmUgMzJiaXQgdGVzdCBmb3IgaXQKCj4+Cj4+PiBzbywgaSB0aGluayB3
ZSBvbmx5IGFkZCB0aGUgU05EUlZfUENNX0ZNVEJJVF9TMzIgYmFzZSBvbiBpdAo+PiBUaGF0J3Mg
d3JvbmcgaWYgdGhlIGNvZGVjIGRvZXMgbm90IGFjdHVhbGx5IHVzZSB0aGUgZnVsbCAzMmJpdHMg
Li4uIGFuZAo+PiBJIGhhdmUgY2xlYXIgaW5kaWNhdGlvbiB0aGF0J3Mgd2hhdCB0aGUgY29kZWMg
aXMgZG9pbmcsIG9uIEdYTCBhdCBsZWFzdC4KPj4KPj4+IHdlIHRoaW5rIHRoZSAyNCBiaXQgaXMg
dGhlIFNORFJWX1BDTV9GTVRCSVRfUzI0XzNMRSwgaXQgaXMgMjRiaXQgaW4gCj4+PiBtZW1yb3ks
Cj4+Pgo+Pj4gZHVlIHRvIHRoZSBkbWEgYnVzcnQgNjQgYml0IGxpbWl0LCBpdCBjYW4ndCBhbGln
biB0aGUgc2FtcGxlIGJpdCwgaWYgCj4+PiBpdCBpcwo+Pj4gMjQgYml0Cj4+IEFnYWluLCBtZW1v
cnkgbGF5b3V0IG1ha2VzIG5vIHNlbnNlIGhlcmUuCj4+Cj4+PiBzbyB0aGUgY2xvY2sgY29uZmln
dXJlIGNhbid0IDI0Yml0IGNsb2NrLAo+PiBJIGRpc2FncmVlIGFuZCB0aGlzIGhhcyBiZWVuIHRl
c3RlZC4gSWYgeW91IGhhdmUgYSB0ZXN0IGNhc2Ugc2hvd2luZwo+PiBvdGhlcndpc2UgcGxlYXNl
IHNoYXJlIGl0Lgo+Pgo+Pj4gYnkgdGhlIHdheSwgV2UgZGlzY3VzcyBpbnRlcm5hbGx5IGZvciBn
eGwsCj4+Pgo+Pj4gaXQgYWxzbyBzdXBwb3J0IHRoZSBTTkRSVl9QQ01fRk1UQklUX1MzMgo+Pj4K
Pj4gRG9lcyBpdCByZWFsbHkgPyBJZiBpdCBpcyBqdXN0IHRvIGlnbm9yZSB0aGUgOGJpdHMgTFNC
LCB0aGF0IG5vdCBhIAo+PiBzdXBwb3J0Lgo+Pgo+Pj4+PiB1c3VhbGx5IHN1cHBvcnQgMTYvMzIg
Yml0IGZvciBuZXcgYXVkaW8gaXAgLCBmb3IgCj4+Pj4+IFNORFJWX1BDTV9GTVRCSVRfUzI0X0xF
LAo+Pj4+PiBpdCB3aWR0aCA9MjQsIHBoeSA9MzIKPj4+PiBZZXMgcGh5c2ljYWwgb2YgU05EUlZf
UENNX0ZNVEJJVF9TMjRfTEUsIHNvIG1vc3QgY2hpcCBzdXBwb3J0aW5nIDMyIAo+Pj4+IGJpdHMK
Pj4+PiB3aWR0aCB3b3VsZCBzdXBwb3J0IHRoaXMgUzI0X0xFLCB1bmxlc3MgdGhlcmUgaXMgc29t
ZXRoaW5nIG9kZC4KPj4+Pgo+Pj4+PiBpdCB3YXPCoCB0cmVhdGVkIGFzIDMyIGJpdCB0byBzZW5k
IGZvciB0ZG0sIHNvIHdlIGNhbiBvbmx5IGFkZCB0aGUgCj4+Pj4+IFMzMkxFCj4+Pj4+IGJhc2Ug
b24gaXQgLCByaWdodCA/Cj4+Pj4gWW91IGFyZSBhc2tpbmcgbWUgPyBIb3cgYW0gSSBzdXBwb3Nl
IHRvIGtub3cgPwo+Pj4+Cj4+Pj4+IGJ1dCBpZiB0aGUgZ3hsIG5vdCBzdXBwb3J0IHRoZSAzMmJp
dAo+Pj4+IEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSB3aXRoIGEgREFDIHRha2luZyBpbnB1dCBvbiAz
MmJpdHMgcGh5c2ljYWwKPj4+PiBpbnRlcmZhY2UgYW5kIGlnbm9yaW5nIHNvbWUgYml0IG9uIHBy
b2Nlc3NpbmcuCj4+Pj4KPj4+PiBJZiB0aGF0J3Mgbm90IHRoZSBjYXNlLCBwbGVhc2Ugc2VuZCBh
IHByb3BlciBmaXggY2hhbmdlIHdpdGggc29tZSAKPj4+PiBleHBsYW5hdGlvbgo+Pj4+Cj4+Pj4+
IHdlIG5lZWQgYWRkIG5ldyBzbmRfc29jX2RhaV9kcml2ZXIgdDkwMTVfZGFpX3M0ID8KPj4+Pj4K
Pj4+PiBJZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5IGZvcm1hdCBkZXBlbmRzIG9uIHRoZSBjaGlw
IGFuZCBuZWVkcyB0bwo+Pj4+IGFkanVzdGVkIGluY2x1ZGluZyBmb3Igc20xLgo+Pj4+Cj4+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAub3BzID0g
JnQ5MDE1X2RhaV9vcHMsCj4+Pj4+Pj4+IMKgwqDCoCB9Owo+Pj4+Pj4+IC0tIEplcm9tZQo+Pj4+
IC0tIAo+Pj4+IEplcm9tZQo+PiAtLSAKPj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
