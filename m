Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E88C35FFC
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Mar 2025 02:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xz8BFLGjzE9J1ebDSReZyAZEhDHzFWjl2RCpyOPzrY=; b=OQIHThHfE2Kzlo+434Gw5fzkCl
	3U70fZkrbPtITuY4z/PKZQekIEmVKRaP6LHIIQCT8VeEfBSCLaEWpIB81bgA2VGzDUWdr1kj8Ubzn
	Kv/HFySF+A7BUBqePBZgGF7pQhSKTgrya7G/01v/9NEX+cPbHFtsDfiDDqRCyjRjYwJkDESSktms9
	i7ewLNskta9GJtHstT+I8+SBXr4W5H0E6Dyu7Ca9fOmdkljAts7333g2zdqBslUQ/nvgmzxLH2XBh
	HaAq7CqzRf3b7Xbw+KpMxiLo5FolIyBog17lUVieDzKrpxntJlBmxpqAEbiE/hqxiaEVjn9yq15kW
	AATtNwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5mt-0000000AvD7-1A1R;
	Thu, 20 Mar 2025 02:37:39 +0000
Received: from mail-psaapc01on20707.outbound.protection.outlook.com ([2a01:111:f403:200e::707] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5gh-0000000AuEi-2eJa;
	Thu, 20 Mar 2025 02:31:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJZc3ZZfj5DkoPVbqKcU7IdJ1eXsYAqeEMVK3P49RhVgGjsbrBbBpVYEGYz8YzAtKKUn2JpvH+npXtIRWIK04SMTRmkuHYXbUyORrWv98sCTD74upArP2mhULWgS3zUp/tNUdvpM36aV+dis1g+SKMBdIVnKSYk9++X787ssd2ZhzMIrNNARov7U2T+FlZU0DvyQTYdGKPAh8wHk3Yr18MS9JO52VACHURsF50mG6Fk+Y1W/dnBFlAK2BCrtadSEjeeEVWlcz9bsuLFB58fPdFsalHi8cfAB/t0l871B+TmwKLPeppxSo6d7yD06MkXcFwRwMPohLdkyCSg6hY/aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZMIo2Ggat9ntABznHVoO2zcFF6vDgo3M8mDd9XL1RM=;
 b=KhJ0plecYImqeU+WnzEA8lbexFDOIN+n7uBkSO60B92Qv8F+DOyngUItZghrhJ503qicJhWCcXX/v85Nh4WMiXZmUUYxL6dt/57Fi+S7DkBBdoFQ0tLvBvzS0CgV9tX1KWYrHTfxiox0kZjbj2IrAV/Wmv39U/DLZhgCGPjcb51wBZ5J3cg9kv+RDrxZN2ppPr3ZJXs/Pg40pfzywHmP2AVwfmFGG/K8XwJuSs5WoTD9pA9eK4F8YIJiQhbgNQOajB5Bq6wUa9LyRqtONx442ME6/ThqRDTCcAKhnMLI4EUQy3fKOe9fFsJb38F4T0f6lN6lBeaGGwJ881r7J6K5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZMIo2Ggat9ntABznHVoO2zcFF6vDgo3M8mDd9XL1RM=;
 b=EXhLvUVQp7dvlvLMrXsi9dobG5HnhC0EtrWmh0Sv2DAzrhuJkSgaDCAamTLHTG9fAzB5OpTO0+TFT0tEBiXgHdQuImet71Kj95nPXRvkWVZ8VImpp8EZHAr2D/VfXdv5jAvIQ94LUJrZ/Z04JRQkeUdoEksXQ/TP2UGAx5dkyTMR9WVLVLCUCGsDJ2Or3r8IRo4kN18KIUulQmCOqFy4CRQze4unZ4b04AjNiT+plySR/DpifZDMKxNZbIkRsCVQGHEhSMueDkOsUU+mR6snPDHmykpWI6KapAhW4YP8OL9MRyCyDbzYXK7U1NftrxpvElDLJtuhvE3JaosaXTWJFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by KU2PPFAE58CCB97.apcprd03.prod.outlook.com (2603:1096:d18::421) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 02:31:08 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%7]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 02:31:08 +0000
Message-ID: <2ea32d85-1d96-4b40-909f-053f309861d4@amlogic.com>
Date: Thu, 20 Mar 2025 10:31:03 +0800
User-Agent: Mozilla Thunderbird
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
 <9397d6d5-518d-4bd0-a34a-7a5f5e1201f1@amlogic.com>
 <37f65ad0-69fa-4031-86da-8b07828aff34@kernel.org>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <37f65ad0-69fa-4031-86da-8b07828aff34@kernel.org>
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|KU2PPFAE58CCB97:EE_
X-MS-Office365-Filtering-Correlation-Id: 89be2020-e3a4-41f6-1f49-08dd675745aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anY2YjVONWhoZlh6aytlTVU1SkpMdnlDcGlNaCtoTGtrTjM3aGRDc1M0WHNk?=
 =?utf-8?B?YlR2byt1c1FvMEd1QkcrUzU5SmFwNHBhMjBEdXZXY3Q1eUFRYVFnRjA3ZUFn?=
 =?utf-8?B?ak43cDVpL0xObmVCcllQVktlaHBVMDYxV3pDL1J5UkVUTHB6WDYra0NDNi9L?=
 =?utf-8?B?NCtCVVNQSFZEWVFnejlKd0ZmNHlKc05mVTFSUFRpUWdVdlhsbHM0VVVybTVE?=
 =?utf-8?B?aVozUHRLM1hqa2VLMEZUSk9UZU05NGlFUTc0Z2NuNU1hbUs5NGgvK0g4UnN3?=
 =?utf-8?B?OUZ0MjFObjNPZTgyYmlwMWhMSUVmRFE3V0ZPYkpmVnVGNDcvRlo3SmltcS9M?=
 =?utf-8?B?WFc5R0srTzBhcmIwd0d4S1hIQkhxK3pLajRBYWlDZEh1VzBrZUQ2cGNFMFBR?=
 =?utf-8?B?cFljT0RVb09EWXhwWmw4TnNlTkM3UEVXM1VYeWxNbzRKRkd5bVZ2NVhLNyta?=
 =?utf-8?B?eDN0Y3ExVytZeG5QRTlTSzUzUUZJMEF0ZGpJSDJmRE1DSGVacXBuMlpVZ21S?=
 =?utf-8?B?dldhQ3d6V1pSKy9VYkVYYnU5R3h2SHN3MVhzb2VhaGFyMTRPZUIvY1F1OFpz?=
 =?utf-8?B?aEM0VGo4NjErVDhXNnNmcHJTZnk3NmJTcGFwQ1o4cUJnaFozeGp6eURNamhS?=
 =?utf-8?B?ankzK1E3ZWVtM0NZdEY0bHlxSHI2QXVvb3l1Y1NRRW8zSnRqWGkxWThFYmpq?=
 =?utf-8?B?UEQzQlhIK01SZU1nU0VqeUQ3Z2VWekpGYThqUUk2dWtYSHZlVmcrODMrUHNQ?=
 =?utf-8?B?QmtlK2N6Z3cweXdYMUdrZW1KcUh4QlJiY1BlL3BBbm9RdXNCUDArc0dDNVA3?=
 =?utf-8?B?L3ZCblVSY2c5TDhrYWc4Nk5VRHlVNlVKTGhSNWZJV084TGFFTEJJU1gxVXBy?=
 =?utf-8?B?TjV3TEJlLzNMZ21SVmR3QWRLUDdhTXFDN2RiVlBHRTRSZ1ZXVVhvOGFqdUo2?=
 =?utf-8?B?d2Q4UlVIRkRWRjZjcTJmTW56aFQ5d2hiYnRuckV5OEpzVkNXdkxWU1pyU3Z3?=
 =?utf-8?B?THJsUVRLWGw5UlhUWE1ES2pzMUg1cmFPN2llVktocHZvaytiTE9IS2NZa0Jn?=
 =?utf-8?B?UG5vTDFaOFU4VzcyeDJleHdwNE45ZVZzN0tMei9ZZUYvenRyQ0NjRTZNSG14?=
 =?utf-8?B?RlRQa0FPUFYwclRxMFdldEJjaEZ0alZVZHZlMTIxZVdzSnYrL29qUUZNSW5w?=
 =?utf-8?B?SHVnZjlvQ0U3MzJUZnJqNUZyWFlMWi9sOS9GZDR4a2VyOGorYk44TzRIYWsw?=
 =?utf-8?B?SEoyU3NSRzhtcUhuWWhvZHpzOGFLbWp0SmtpdW10aTg1T0VieE5kOGpxNlBj?=
 =?utf-8?B?ZXgzL1VqVitHd09vdFNKd2podDcwNktQbHRmWWRpU0R6Tk85bWZRZm1TOHNm?=
 =?utf-8?B?MTdmYXZSendndDkzMkhqRVQzN2l0YWhOMjIzZmpJaUFNWlpyMU1MWnoySzdt?=
 =?utf-8?B?L2d4T0lHYUNuVmt5OThlZGpaTDNZVklsWnF4LzAvQ2k3cGFVZWowdEYyWGxY?=
 =?utf-8?B?U052U1l5Q0NReTZsNm5CVmR3eGhkS2UxSmhlTWFBc3Y0dzdMZ1I5MC9NWkxu?=
 =?utf-8?B?eG92MHllSldQWVU4bmFaekgwSGVPSnJVNlRldEtGNVU4eEtOdE1IbUVyZW9z?=
 =?utf-8?B?YUQ3cGlDT1ZLcFAyNWdnNW5CSmg2Z3VsYng1SXBUT1p0SzZaTm5heEQ0bWpJ?=
 =?utf-8?B?R1R1Tm1TQ1pxeHJkMEpxcnRGZngwanIxWXFCUWc4SDlzajlsZmpVOGh2RjJV?=
 =?utf-8?B?ZnlOYkM0aWZZdHVJYXYwb2tjVmdSRnNUS0Yxb1U3Mk4yN0xNbUlCMEdUNklP?=
 =?utf-8?B?dDNUNHVoSXJqZVQ4ODZoZFlOa212R0xER0RZamtBcXNBUURlY3l1ZDhYdWtv?=
 =?utf-8?Q?1UZbv4jvOH5YM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU9PUllaZWpJU0tITmRrR0tVL0NOWjFLN1RHOG5rQm4vSG1mU21KMzRJREIx?=
 =?utf-8?B?eTFuSUdOaGxIcllqcFBGTjIxUGJOdktrbmRJM2s5enRiKzg1a3JvS3pVNU82?=
 =?utf-8?B?R2xwOXNaN1orelplbC9jWHg2QURTL3JBVXE0ZkJMS21KTnZISjVtU0pJZElr?=
 =?utf-8?B?RitxRXFzZU9QQlpHSGdtNlRpOWYwcWMrYzRCZVNQQ2ZEc0xuSkZkQjM1YnZV?=
 =?utf-8?B?L3ZWS1hqRFN2NVNwSXd3ZHVlTC9kSWNUdXQzVXpITkVRUE9xMnp1Vi9Rc3JS?=
 =?utf-8?B?b0M4MkNpZVI3UkZMUFBRNXR2MGp2QkxJYkFLa1NnYlZ4ZGlPRjR6Q1ZDYi90?=
 =?utf-8?B?c3VPVzJMM1Rielo0UWs3OEd4OFMxNkgyYjAxTHArdHZHWWh2c1RPWnZWV2kr?=
 =?utf-8?B?UisweFp6MDdPa1ZvVUJyKzkwY0x1akVEQU5lUXVSWklyOEd1eXdIVkl5L2VM?=
 =?utf-8?B?S09sODdjcDZLTjhveTdDcFVGVVZtVC9VaG5ERk43TlpSMThZK3phdXFPNUJp?=
 =?utf-8?B?SGRsYlRwYnJhWVY1dXlueTNZcWJtVWpRRGFkdDN1SC9hMnpTSks3S0xqYnRO?=
 =?utf-8?B?K3RlOG9sYkkxZmZlTFI2bnpMRmxaYmlsMWM1aW50NWRiQ2t4aHp2RWpCZDdM?=
 =?utf-8?B?ZmpqRzZGb3hSVVBoUUlDalJnNUk1ak9ucTI5M0hEdTlEWStlZGYyWXBUa0sr?=
 =?utf-8?B?cnlxQS9zWEJmMlhuZWx3MEJtbnd1dEJLSCttTk5HQU1yNUJmNXJ6M0kyTFJF?=
 =?utf-8?B?UG5TcmczY0ZyYTl1ZmZXWmFmeE1KdjFMUVJ4SGhaYUEyd1ErSS94Y1N5Z2tp?=
 =?utf-8?B?V1I0RlUwdmptMlp0ZDA0dGp4TmJTTjNhTTFCTk9XTFgySnJ1WE4rZzJKNFlB?=
 =?utf-8?B?c2dYNVRQVUg3MDZFdGVEVVFudW80eGJRTCszUHpXRGc4dXBRNS9OM2wxLzgw?=
 =?utf-8?B?MkROMGFzaFdPZlNEMUIrSFgxNTMrZVN5UjFlOEF6Q3N2c3djMExGUnBySE81?=
 =?utf-8?B?VVlYZGsrVFU0UGRpdEVyTXBKaUpHQzJ0WGlRaVlFMVpKS2xtMFcxZDUvQi9h?=
 =?utf-8?B?Q0NlY3ZObFZ2TWxESkk5U3NxQk9kS1FxSXJ3MGQ3Z24vSkM2NnVmQWNOR295?=
 =?utf-8?B?UjV3MEVlUkpsZEtHVzdvcGY1ZXFWZXR1RzNwVTZJaVF6THl2M29yUmhLcXY4?=
 =?utf-8?B?RnhnZ3kzQisyQlc5cmJZOHVJblh2ekVoLzhvWnJNNlJpSWFLSitEa3JpMUd1?=
 =?utf-8?B?WkxMVkE0UTV2N3NQeVIrZnI3MTFBcHpKUlYwRDR5MTBNWUhJc2k2TWZyVmtw?=
 =?utf-8?B?aTdXYU9jcWFnSWc2RWd6SHRRRlpHKzB3YmVCdE9EeW1TMTVzczQ2U0VoM0lD?=
 =?utf-8?B?R3padkl2S21keC90Nms1WWNoeHdlbFJQVDRxRGVhQlBaZzNhQmVVc1RpNmpB?=
 =?utf-8?B?c3JNUkhxdVFMTXczNnZjclQzUzJvU3owWFNhRm1tOEh1WHNDbE00WW5CNmJh?=
 =?utf-8?B?cHUzRisrQW9zWHYrSkZPM3hpbFU1enRZNG8rVnF2YWpTYnF6Vzg5b3hLZnA4?=
 =?utf-8?B?TTBDZXlTUlpqdGFtcnhkUU1SSDUzeG1nRi9HZVhEQ2FmcHE2WWZtN2pBdzF0?=
 =?utf-8?B?R0dMdzFNK3ZMbGxxMGVEeVNldE9Say94ZkRwOWlCdy8rbFpsSFAyY1I1WVhO?=
 =?utf-8?B?K211Z1VTYVJlaFdNLyt2UjlCbWNRdmRDdDZrUUpQZ2V6K2ZsRU5wdjltd1hR?=
 =?utf-8?B?UVNJRTZKOTcyMDd6NHFLVmhRZkNTbnMrcFFmWEZpTVJqeDNMRDdwYUpubzAv?=
 =?utf-8?B?K2V0dFYxUWttRzFqSlUyYWNCY0lJRGkzTld2Y21xY3RCRDhLdmZnT1dETFls?=
 =?utf-8?B?NUUvSnhabnBYSUhwM2czMEc2UGJvc1JoVzdUalZkdFBQN0x6WSsvdXNWWmtB?=
 =?utf-8?B?SE8rT0puUi91a1dGaWo4S3ZTWURweU84cjMrVVA4RldxRlhPcGV6bTM4QlF5?=
 =?utf-8?B?NnRINGcwRGlCR0FKS3hhSGVVUXBIR21wZi8xYnNHTG5wZkYreXUwMlNLYXUz?=
 =?utf-8?B?UHRuTmx0L0JVSkkxcW93MjNqZktEc0RwV3JBbXVIU1o4UTZVZS9uVGNPUTJR?=
 =?utf-8?B?SDJqOGd4UHR1RU1DcTZ1NFQxbkpaNE82Wi9zUUl6Ykp5NUxKUUZaY2xzdzFJ?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89be2020-e3a4-41f6-1f49-08dd675745aa
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 02:31:08.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qR0Mv/5vIKzTrmC+oU/3zvRVes1XR1oEurwSOXt/k8nPLkopYaBKm5QKc3+5VAUciulMwO27wfDpf5yDQun5MV4h5Zgafji94OMDAM9vMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFAE58CCB97
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_193115_674059_A155B367 
X-CRM114-Status: GOOD (  19.38  )
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
Uk5BTCBFTUFJTCBdCj4KPiBPbiAxOS8wMy8yMDI1IDExOjM4LCBKaWViaW5nIENoZW4gd3JvdGU6
Cj4+Pj4gICAgfTsKPj4+Pgo+Pj4+ICAgICZwd21fZWYgewo+Pj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4+Pj4gaW5kZXggOTU3NTc3ZDk4NmMwNjc1YTUwMzEx
NWUxY2NiYzQzODdjMjA1MTYyMC4uODNlZGFmYzI2NDY0MzhlM2U2YjE5NDVmYTFjNGIzMjcyNTRh
NDEzMSAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
czQuZHRzaQo+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5k
dHNpCj4+Pj4gQEAgLTExLDcgKzExLDExIEBACj4+Pj4gICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2Nsb2NrL2FtbG9naWMsczQtcGVyaXBoZXJhbHMtY2xrYy5oPgo+Pj4+ICAgICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9wb3dlci9tZXNvbi1zNC1wb3dlci5oPgo+Pj4+ICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXM0LXJlc2V0Lmg+Cj4+Pj4gLQo+Pj4gV2h5Pwo+
PiBUaGUgZm9sbG93aW5nIGZpbGVzIGFyZSBpbmNsdWRlZCB0aGF0IHRoZSBhdWRpbyBkcml2ZXIg
ZGVwZW5kcyBvbgo+IERvIHlvdSB1bmRlcnN0YW5kIGhvdyBlbWFpbHMgd29yayBhbmQgcGF0Y2gg
cmV2aWV3PyBJIGNvbW1lbnRlZCB1bmRlcgo+IHlvdXIgY2hhbmdlLCBub3QgdW5yZWxhdGVkIGNv
ZGUgYmVpbmcgdGhlcmUgYWxyZWFkeS4KU29ycnksIEkgd2lsbCBjaGVjayB0aGUgcnVsZS4gVGhh
bmtzIHlvdSEKPj4gaXQgaXMgc2FtZSBhcyBzbTEgY2hpcAo+Pgo+Pj4+ICsjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvY2xvY2svYXhnLWF1ZGlvLWNsa2MuaD4KPj4+PiArI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tYXhnLWF1ZGlvLWFyYi5oPgo+Pj4+ICsjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1nMTJhLWF1ZGlvLXJlc2V0Lmg+Cj4+Pj4g
KyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9zb3VuZC9tZXNvbi1nMTJhLXRvYWNvZGVjLmg+Cj4+Pj4g
KyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9zb3VuZC9tZXNvbi1nMTJhLXRvaGRtaXR4Lmg+Cj4+PiBP
bGQgc3R5bGUgd2FzIGNvcnJlY3QuCj4+IEkgZGlkbid0IHVuZGVyc3RhbmQgd2hlcmUgeW91IHdl
cmUgcmVmZXJyaW5nIHRvLCBJJ20gZ3Vlc3NpbmcgdGhhdCdzCj4+IHdoYXQgaXQgd2FzIGFib3V0
Cj4gUmVhZCB5b3VyIHBhdGNoLgo+Cj4KPj4gdGhlIGZvbGxvd2luZyBjaGFuZ2VzIHRvIHRkbWlm
X2EKPj4KPj4gb2xkOgo+Pgo+PiBjbG9jay1uYW1lcyA9ICJtY2xrIiwgInNjbGsiLCAibHJjbGsi
Owo+Pgo+PiBuZXc6Cj4+IGNsb2NrLW5hbWVzID0gInNjbGsiLCAibHJjbGsiLCJtY2xrIjsKPj4g
aXQgZml4IHdhcm5pbmcKPiBIb3cgaXMgdGhpcyByZWxhdGVkIHRvIHRoZSBwYXRjaCBodW5rPwo+
Cj4gRG8geW91IHVuZGVyc3RhbmQgaG93IHBhdGNoIGZvcm1hdCB3b3Jrcz8KPgo+Cj4gLi4uCj4K
Pj4+PiAgICAgICAgIHRpbWVyIHsKPj4+PiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
cm0sYXJtdjgtdGltZXIiOwo+Pj4+ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19Q
UEkgMTMgKEdJQ19DUFVfTUFTS19TSU1QTEUoNCkgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPiwKPj4+
PiBAQCAtMTAxLDcgKzEzNSw2IEBAIGFwYjQ6IGJ1c0BmZTAwMDAwMCB7Cj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmFuZ2VzID0gPDB4MCAweDAgMHgwIDB4ZmUwMDAwMDAgMHgwIDB4NDgwMDAwPjsKPj4+PiAtCj4+
PiBXaHk/IFdoYXQgaXMgaGFwcGVuaW5nIGluIHRoaXMgcGF0Y2ggLSB3aHkgYXJlIHlvdSBjaGFu
Z2luZyBzbyBtYW55Cj4+PiBvdGhlciBwaWVjZXM/Cj4gWW91IGRpZCBub3QgcmVzcG9uZCBoZXJl
LCBzbyBJIGFzc3VtZSB5b3Ugd2lsbCBmaXggdGhpcyBhbmQgZG8gaW50ZW5zaXZlCj4gcmV2aWV3
IGJlZm9yZSBwb3N0aW5nIG5leHQgdmVyc2lvbi4KPgo+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGNsa2NfcGVyaXBoczogY2xvY2stY29udHJvbGxlckAwIHsKPj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxzNC1wZXJpcGhlcmFscy1j
bGtjIjsKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgw
IDB4MCAweDQ5Yz47Cj4+Pj4gQEAgLTEzNCw2ICsxNjcsMTcgQEAgY2xrY19wbGw6IGNsb2NrLWNv
bnRyb2xsZXJAODAwMCB7Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjY2xv
Y2stY2VsbHMgPSA8MT47Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgfTsKPj4+Pgo+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICBhY29kZWM6IGF1ZGlvLWNvbnRyb2xsZXJAMWEwMDAgewo+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyx0
OTAxNSI7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDFB
MDAwIDB4MCAweDE0PjsKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjc291bmQt
ZGFpLWNlbGxzID0gPDA+Owo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNvdW5k
LW5hbWUtcHJlZml4ID0gIkFDT0RFQyI7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfQUNPREVDPjsKPj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJwY2xrIjsKPj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JnJlc2V0IFJFU0VUX0FDT0RFQz47Cj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVZERC1zdXBwbHkgPSA8JnZkZGlvX2FvMXY4
PjsKPj4+PiArICAgICAgICAgICAgICAgICAgICAgfTsKPj4+PiArCj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgd2F0Y2hkb2dAMjEwMCB7Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsczQtd2R0IiwgImFtbG9naWMsdDctd2R0IjsK
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgyMTAwIDB4
MCAweDEwPjsKPj4+PiBAQCAtODUwLDMgKzg5NCwzMjcgQEAgZW1tYzogbW1jQGZlMDhjMDAwIHsK
Pj4+PiAgICAgICAgICAgICAgICAgfTsKPj4+PiAgICAgICAgIH07Cj4+Pj4gICAgfTsKPj4+PiAr
Cj4+Pj4gKyZhcGI0IHsKPj4+PiArICAgICBhdWRpbzogYnVzQDMzMDAwMCB7Cj4+Pj4gKyAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+Pj4+ICsgICAgICAgICAgICAgcmVn
ID0gPDB4MCAweDMzMDAwMCAweDAgMHgxMDAwPjsKPj4+IFRoYXQncyBub3QgYSBzaW1wbGUgYnVz
IGluIHN1Y2ggY2FzZS4KPj4gdGhlc2UgY29kZSBiYXNlIG9uIG9sZCBkdHMgbGlrZSBzbTEvZzEy
YSwgd2UgZGlkbid0IGVhc2lseSBjaGFuZ2UgYW55IG9mCj4+IHRoZSByZWxldmFudCBwcm9wZXJ0
aWVzCj4+Cj4+IFRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgcHJldmlvdXMgb25lCj4gU3RpbGwg
TkFLLgo+Cj4gWW91IGNhbm5vdCBhZGQgYnVncyBqdXN0IHRvIGJlIGNvbnNpc3RlbnQuCj4KPgo+
IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
