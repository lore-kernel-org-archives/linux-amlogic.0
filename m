Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BEDC02180
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2025 10:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cos0P4QD5SxsX4p2VnOrezQf14RMW59r4LZMSvtD+Ts=; b=fVupvbPnxe0JfU1Ws5w6rjxGaL
	+AzS4FOqSmHM92w5Jmgkf1av3+YNEY/kF1Bl+BWF2s0tW4h64TysUvhMvE43UiY12SouRTxGgHBua
	K+f0M2SY24Z7aUgs0H+RsbtkndFmGi6ZnEmrVbHWGU7E3gzfftmN6aOUDwkXCIh0cbyZTAwjKcJPv
	kQiRnzN5J7lM7GDq6HYhPRFzlX8qP0lhB7LXpoxD7KWPMebLj8xVoBQ+Sa26tHRAx8KoHSOKE5fDD
	f0oOfMT5mYKbEnjSzXYm9IUhxr6/QWHLYqc0vxp7mKI/O/CARzaHo77WcUD3X2yoK68QrZJyU+dYn
	SM0ZxnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0qt-0000000BY4S-2rar;
	Wed, 15 Jan 2025 10:42:23 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0lZ-0000000BX3S-44os;
	Wed, 15 Jan 2025 10:36:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOJkojCxE3rT4hb5lIA2R12X6WE5MRDl71PWNZ3w19wU/16tD3u5WtJadG7yzRpt4ubF3UfsclVuwWMSGmVoYUQQ93b898kzb0zVaRDOyfuG3NSetDCnjKdvtANKgAwd5wjou7uK9LTMWHI/LpWARXCH2X1ZWXO9diK3N0QTLrcKWQuozm4Sm/HH0WEf3vtBWYnLxU6acRI0EBHYGXKjBanyBmnY+14Ydhm20dzO8gnWLQnRZ+M86/zUXJNZ+ZSTWASnOD2BoLQXpkEAKGvGQHe/HmhoHhs8XAMvNdq1gVHyL6yOslYlNSf5xc8XTAjtRPWnTEps3FVj6192Vl2W/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIGObzdz/VD66IyEas38efD8wsz6yh5kycSXh2tBod0=;
 b=WGvD0uNDzNfz1wXoP8E5kotBG6C3HG2DzubpeBqZci/vQ7p7gIwgmocGVVY0KqPhw+KrEAd70u0txypz3p+FO5A3nssyjlMoQ582ZQEtLiEUtfwIK9B/ntXemkfpZe4i716G1jzt+qOJFGxt3AkfJVNhRzB26JwvwjiGWBtWkyFa7kAtmrGSL5BAvw6FWefhIf1yV33f7Cux2Wt30+GP7P8jxkaNK23VQ3qhx+q1U1KsAOPO8M2gms+Kyy71U0MJjZuIV3MDHE/ltGKcae9c0NZ12cZGQ1foCVN+Vhe09oui+Lo1XddtivrXjEYuXJ0RJSt5uRRQSiiRykTz58IvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIGObzdz/VD66IyEas38efD8wsz6yh5kycSXh2tBod0=;
 b=RJATuHTjsXLJw7g05Af2KWPU5MWPXtpT/ib0oEPfoouCBugyGZKWARu9YqVAnmdqK/L+Qt6fbEyg3De1wxj47tq1M/gCbtFgeVsyHyqUWtFyTkCFh2gmoOAV5NXWBVjBWrEQSblcmdPht0q5Y0OtEWgo6WsyQpo2yUtpLcr8MtR8aVoXluogRhd4U93aKh2q8H5WmNJU8SBhB6cJApen26WPVHw3kStijlIxw0IrqyAI7WtInpZ7mPBNQkPD+ABaOsYNAIAywxdRcQMS0ulzjBoqL894H4006nLytCdLA9xrB7hTFnhTNwp11ZsUc31NeQf77WxpXWdl24iRZOuuiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by TYSPR03MB7888.apcprd03.prod.outlook.com (2603:1096:400:47b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Wed, 15 Jan
 2025 10:36:37 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 10:36:37 +0000
Message-ID: <7cf4c53c-7cd2-402c-9e31-f85767ead932@amlogic.com>
Date: Wed, 15 Jan 2025 18:36:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
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
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jr0545v8w.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: KL1P15301CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::24) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|TYSPR03MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5b5f2e-ab67-46da-f292-08dd35507d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjUwaXFlWW1HN0cyOHBOeWh0alBxMkwxN1R4dXlwZkd0VEtiSE4vSzhYcVFw?=
 =?utf-8?B?S1V1bkFoUERoUDl4cUp4aWFpUlBTa09EV29zT2wyaExtNFNoSzMrMmxHcUxY?=
 =?utf-8?B?SVIvUmZkRjRQOWpkVHNUM25kWVJUVkhpYk9IWGlmT29teGxsK05YcVJZTHd5?=
 =?utf-8?B?cEx0NGhJbGZmdk9uSW9DU0RLV0dzOHU4dzNxbTV0QUE2Mkw1Z2w0aTlaMWJM?=
 =?utf-8?B?cmRTck1YYWtGbU4reHNFbE1rdDBodllJTnVocTcrSi9JaG81eCs5V3pEcU1C?=
 =?utf-8?B?SGFhdVV3UnJmWGhqYTdGNWNWTlkzSlIxQUhYQmxwOGExNUdmMDRTc1VKcjNZ?=
 =?utf-8?B?SXV5eE5QV1I3VUJ3aEpsY1VKNE43emxORnBlVlF0Mm0rWGsyS1NTeWF5Q1Av?=
 =?utf-8?B?cmRkNEhvMVFkYnRBU1h3M1cwN3JpMTV2K0pLN1RlcGpTZWtZK3N5Q004bHZy?=
 =?utf-8?B?TnlETHZRQkR0aytEZGE2N0hWZGl4OUo2NjZ3Rnd1bU51ZUVKU3FzVENOQTNJ?=
 =?utf-8?B?dXUwV2I1TCtYbzNxTEp3ZWMwb1h1OVRFUUVORDFMaEJTdW5tbUlGNG54aFlL?=
 =?utf-8?B?NTZOQnc5RlRNWTZLVzVUbW1QUmF6elhDUDNqMXZWZHMrWG1WV2xRaVVDWnRs?=
 =?utf-8?B?SFdsQmpHdFA3REx6Y1A3YmVmUnpyeDU0RzRENyswamk5RGxzODhnOUFndjJi?=
 =?utf-8?B?aHg5a2RMcnlXeXNWN2tvVWdPcGVVOHZUbWw4RmQrd3lTT1B2Q3hHR3dxbnF1?=
 =?utf-8?B?YXRUalFGcTdzNVhoS1JFOUdiZjl1b3Y3K3NpZUFTZWpDdGVqcTROa3VzV0N1?=
 =?utf-8?B?bnJFbHZHT3RabUpWbFMyVTNJazQ4OTZkSVJ0OWtBamhkTE1PSmRXOEpHZnBw?=
 =?utf-8?B?MWpvMmViUnFzRlhIS0J4RDR5bTVZa2doVWlqT3ZXTUR5UjhqdGxWUkx5WnEv?=
 =?utf-8?B?Vm1yQkRwRFN2UjJZZUxLa3hGQzhnRXVoNSs1M2NONzZhdlpTRy9zNW1CaXN6?=
 =?utf-8?B?YnNXaSt2YlQrenJQMHJJZ0cvWWdTZ0RFR0JHSjlyLytLOHU2Y3hya3JpS05w?=
 =?utf-8?B?Wk8zTE51MktSU3NubEd1Tzdpc21TWFBwL05Xa3dDMWJ4YVUrb2lKSHlzc0gw?=
 =?utf-8?B?YnlDbmR1eUl2STV1TVhDaFlQU242aWcxbHY2dms3eG1zY2orTUxZUEc3TUxU?=
 =?utf-8?B?cnhSWDlTemJ6Y1hWNGlYZHRtSjg3bU1RSkVlNVZMaXRDb20xa2RtNHNjRmhN?=
 =?utf-8?B?UzJIU00yazRIempzVTFYTm5EVzQ2TVNxZ0NJek85L1VQM2NySG5xL0k5Rzdp?=
 =?utf-8?B?cm5OdGU1K3pLRTRkNDJnUGNEcW1CUkNuTEU1N21UQk9yTmllS2NidVQzSGdV?=
 =?utf-8?B?MFo3ZTVRT09qbzZCdTljNkpaUFJ4NDBwelZnSVJWSzlqWG5jeG9hS0o4QU9z?=
 =?utf-8?B?SGVka0ZnUXFzUkI0SUhRaThPZFV2VVg0T3dXd1ozQ1N5Qk9WR1ZQWUdnWVNE?=
 =?utf-8?B?R3ltMXNMY21TRGJwZXlNSnhsSXFmcjlVS2RJYlpJTllUVmVUTFhsYmF3djEw?=
 =?utf-8?B?NnFMMmNtTm5OUWxwc0hHVmtyWXBBNG9CenBkTjdva0grV1Z4N01aWHJ5TURS?=
 =?utf-8?B?NHU3MGdjVytJdmVxQzBXTGphYmZHdjVkNjE1MjROM1ZEZEp4RUxKU3E5UlBt?=
 =?utf-8?B?czk0MkZ6MHdkbnlDV0xkMGJOZDFmNnBpQzY4Vnd5ZzIvU2gxakJVRnNlMXlt?=
 =?utf-8?B?M3NiNzB3K2Z3TXFiMHNPakFheGNTOWY3S3lBeS9Lc2w4SGdUZExmVmwzVW01?=
 =?utf-8?B?YWJrRktTSS9ieHpFS2ZETytXV1VCc1NLL2M1dUdUVnJwNit6RTN5cFFSd1dw?=
 =?utf-8?Q?X6T+4l8X45Bc+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1N5RzhQRTYrRTlDNWVoS2lsa2ZmMnFiTi9UTWFNOWpwNjZQQ3RZY3IyWDZ4?=
 =?utf-8?B?KzkzNFA0dmR4Z29iUHhiU0RlTjFHVlA0SGRJWHdENFZkMkZvVFhGZENwTzY0?=
 =?utf-8?B?Q0w4QTBQbkR6MlFiL2FWb2duVjIzSVhBaWlIYjVWai9ybERBdXdJQ1Jqa0Uw?=
 =?utf-8?B?enRPbmU3d3hpOVdyelcwYjhOU25KVDk4c3QrNGlyaVNQdFZwYk15akd0SDlp?=
 =?utf-8?B?TjJHS2czTHZkdXNZUExPYm5xWlh6ZW9qcHdLUDAvOGdtWWdqRTJsN2FYZE1q?=
 =?utf-8?B?ZHFKb09Xb2RPanJPejd3dWNVVGVtb29PanBNdXVwdWd4anNjTTM4RHNBTlNj?=
 =?utf-8?B?SkczNkc3c2VPUDd0WEpGbURUU2NQaWRGRFI0ZVRsaEs4LzN1dnRxV3Fic1dm?=
 =?utf-8?B?a1M5WjFqeE81QzBBREtJVUxQS0tqY2J2QnNLWUJIVzlIbnI0WHV0SkJoQmZD?=
 =?utf-8?B?NWlmNDE3SytJVzBGWkRVUWtFRVNSVzJpaE1PdGcyUXhhOHpZVktNSW8xWXhV?=
 =?utf-8?B?SG91RGFjK0o5Wk4yZHhHbFBLYVdKNkQ2V3FSK29NWFNueW9Uaks2QkRCbjd3?=
 =?utf-8?B?Snl4SWcxcXk2RWF6UVpXOUU0d1ViVTVGdENDNVJWYk1pcVZaaXFGK1pLaG5v?=
 =?utf-8?B?c2ErL1lENC83YXhQYTJSV3RPWUFMd2VETXg2TTZqSzA0WnNjbXNXOGFKdVBY?=
 =?utf-8?B?Y3NPaUtsSURZTlZaZWFYWDhkQUlmbW9PQVJ3OEllNVNpRGh6eUtIajgrVzdj?=
 =?utf-8?B?VnVmNm9zRENqaEwzL2VTMTBTc3duZzFRam5OQVlGL09ZRjhvVVR6Tm9zY0tO?=
 =?utf-8?B?NG5TellkS1EzaTdXNGJDejZJcVpDaWlhRDlaNWlPYUxncXFHZnZqRFA3ejEr?=
 =?utf-8?B?eVMzMkpLeGZBdmpjK2pwQXpiejZIWlArQ0tFMHljOGpsV056c0tWclpseDkw?=
 =?utf-8?B?OTFnYURJVG1NVTFrakl3WVB0MXE0TW9VQVd0dWxObWxPQXZ4VlVXN3hhQ05Q?=
 =?utf-8?B?SXVweXJTblZJc0MwSkFXbE9YOHp2aGw2dzdkcThsdkczYU1DUTIvclVabDZU?=
 =?utf-8?B?bktiSmJ2dEF3UEZ0UlRlSjNLNU9LdlkzQjBEUjl1eTVNM2ZtSmVhaTRWNTVN?=
 =?utf-8?B?UnNKeWpDQnJUSHRpa1ZPcFFXWGhWWHBJZzlpK2NueUg4QUt6bDM3eUhXNTN1?=
 =?utf-8?B?UFoxaGtVdHQrS2FoOHUzSnlnZGRXbnFOdjJ0Mk41VTdzaEZSM1ZDYzJSZmhZ?=
 =?utf-8?B?bG5EdmpzYUlSWW5IUFpUc2d4a3dUcCtvcUFTYmNMTWkrb2Nqb0tmTCtuMlJn?=
 =?utf-8?B?VWwydGdYVit5eWZmL0lFZjB5NU9wdGprT2hBTS96Yk5wZjhtZDVOd1NXU3Yx?=
 =?utf-8?B?YUZIaHA5MEx0cmVuMnhaZkhnSUkvWDc1cjQ1eEhXdVRnOWdYZHFUb2lJM3Z6?=
 =?utf-8?B?OFNUbXBUWFlQSlZhYVZMSkZweFJzTDd0elhVc3VzaTFXNkdTY2UzTk55ODR5?=
 =?utf-8?B?NW8vWVJhQllmRVlZT29XS0NUY1VQMDJLNmU4VkxHRXpBZ0htZHcrUjhaWkl6?=
 =?utf-8?B?Y0VHdmQwU090STFKVWluOUh1SFhmWVM3MjBmalpTcmZsT0lEbktGM0NVSWVq?=
 =?utf-8?B?bk8weXJhTDhQU2FpWTFULzNYNlpyeitZeC81cnpvM1ZzQ204ZC95emp3RzhE?=
 =?utf-8?B?bkYxa3JaVXZpNU9NNGxDUWkwVTQ4dkxYaEtadVVld2VuakUxUUlqNXZudlpG?=
 =?utf-8?B?VzMvemFXU0dWeWxJbWhOWlc1d3BZakRrUzN0b1Z1VEpjMWtOMVF3emd5YUhy?=
 =?utf-8?B?M0VrZWNCY0l4UHVJUW9ZR05xODNNTW5NY2FHNnpIUktEOW5PN1h6YTJ2TXJh?=
 =?utf-8?B?cUlsNFViUmN0ek9KaHVTblJ2ZStRRWJvWVkreUtINklrRHVRZTRoK2tWZnVW?=
 =?utf-8?B?ZjdEZVN1VTVIQUJTNUs4QVh5R3hpa3ZkYVRuUkhPUmlraWpWTUVhTlJIdk9T?=
 =?utf-8?B?VlN6b0srNnBiNFJjVUd6R3ArMWJaRmNWUFBQMjhkYVBDVm45cmhTT1lNazE3?=
 =?utf-8?B?UjNUQ2Mwak9pQnczaVRXRlZ4NHN3dW03eVVIRTBhYm1BYUttZFg5S2xhdHBG?=
 =?utf-8?B?YWwwMDNxcS81TDhxWk12VmFlUGx5KzhXcEZXeGFFUnZwUWRlV0sxRE1oSEZW?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5b5f2e-ab67-46da-f292-08dd35507d24
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 10:36:37.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZO54oIQzz8A2+ZgjA2Gv5aVhQRixKTLJbEz4UUlT+e8cn481mS7I16BCbD99Sw1uSSIKwzstWKOFNuXfTyMHAxwk/D6DsNVGhP0xNT0Ylko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_023654_166136_D8BEF44B 
X-CRM114-Status: GOOD (  31.27  )
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

CuWcqCAyMDI1LzEvMTUgMTY6MzYsIEplcm9tZSBCcnVuZXQg5YaZ6YGTOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gT24gV2VkIDE1IEphbiAyMDI1IGF0IDEwOjU2LCBKaWViaW5nIENoZW4gPGpp
ZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPj4g5ZyoIDIwMjUvMS8xNCAyMjowNSwg
SmVyb21lIEJydW5ldCDlhpnpgZM6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiBU
dWUgMTQgSmFuIDIwMjUgYXQgMTk6MjAsIEppZWJpbmcgQ2hlbiA8amllYmluZy5jaGVuQGFtbG9n
aWMuY29tPiB3cm90ZToKPj4+Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICtNT0RVTEVfREVTQ1JJUFRJT04o
IkFtbG9naWMgdG8gY29kZWMgZHJpdmVyIik7Cj4+Pj4+Pj4gK01PRFVMRV9BVVRIT1IoImppZWJp
bmcuY2hlbkBhbWxvZ2ljLmNvbSIpOwo+Pj4+Pj4+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7Cj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZXNvbi90OTAxNS5jIGIvc291bmQvc29jL21l
c29uL3Q5MDE1LmMKPj4+Pj4+PiBpbmRleAo+Pj4+Pj4+IDU3MWY2NTc4OGM1OTIwNTBhYmRjYTI2
NGY1NjU2ZDRkMWE5ZDk5ZjYuLjJkYjFjZDE4Y2YyY2VhNTA3ZjNkNzI4MjA1NGUwM2Q5NTM1ODY2
NDgKPj4+Pj4+PiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9zb3VuZC9zb2MvbWVzb24vdDkwMTUuYwo+
Pj4+Pj4+ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi90OTAxNS5jCj4+Pj4+Pj4gQEAgLTg5LDEwICs4
OSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIHQ5MDE1X2RhaSA9IHsKPj4+
Pj4+PiAgICAgICAgICAgICAgICAgIC5jaGFubmVsc19taW4gPSAxLAo+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgLmNoYW5uZWxzX21heCA9IDIsCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAucmF0
ZXMgPSBTTkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+Pj4+Pj4+IC0gICAgICAgICAgICAgLmZv
cm1hdHMgPSAoU05EUlZfUENNX0ZNVEJJVF9TOCB8Cj4+Pj4+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSB8Cj4+Pj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyMF9MRSB8Cj4+Pj4+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSksCj4+Pj4+Pj4gKyAgICAgICAg
ICAgICAuZm9ybWF0cyA9IChTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSB8Cj4+Pj4+Pj4gU05EUlZf
UENNX0ZNVEJJVF9TMzJfTEUpLAo+Pj4+Pj4gQWdhaW4sIG1peGVkIHVwIGNoYW5nZXMgd2l0aCB6
ZXJvIGp1c3RpZmljYXRpb24uCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBkcm9wcyBTOCBhbmQgUzE2IGZv
cm1hdCBzdXBwb3J0IGZvciB0aGUgZXhpc3RpbmcgU29DcyAoc3VjaCBhcyBHWEwpCj4+Pj4+PiB3
aGljaCBpcyBrbm93biB0byB3b3JrIGFuZCBhZGQgUzMyIHN1cHBvcnQgb24gYW4gSFcgZG9jdW1l
bnRlZCBhcyAyNGJpdHMKPj4+Pj4+IG9ubHkuIENhbiB5b3UgZXhwbGFpbiA/Cj4+Pj4gZm9yIGcx
MmEsIHNtMSBldGMsIGl0IGlzIHVzZSBuZXcgYXVkaW8gaXAsIEdYTCBpcyBvbGQgaXAsCj4+PiBJ
ZiB0aGVyZSBhcmUgY2hpcHMgZGlmZmVyZW5jZSB3ZSBkaWQgbm90IGtub3cgYWJvdXQsIHRoZW4g
eW91IHNob3VsZAo+Pj4gaW50cm9kdWNlIHRob3NlIGRpZmZlcmVuY2UsIHdpdGhvdXQgYnJlYWtp
bmcgZXhpc3Rpbmcgc3VwcG9ydCAtCj4+PiBpbmNsdWRpbmcgZm9yIEdYTCwgd2hpY2ggaXMgd2hh
dCB5b3UgZGlkIElJVUMuCj4+Pgo+Pj4+IHRoZSBuZXcgaXAgbm90IHN1cHBvcnQgMjQgYml0LAo+
Pj4gQXJlIHN1cmUgYWJvdXQgdGhhdCA/IHRoYXQgY29kZSBoYXMgYmVlbiB0aGVyZSBmb3IgYSB3
aGlsZS4KPj4+Cj4+PiBJZiBzbTEgZG9lcyBub3Qgc3VwcG9ydCBTTkRSVl9QQ01fRk1UQklUX1My
NF9MRSwgeW91IHNob3VsZCBhIGZpeCB1cCBwYXRjaCBmb3IKPj4+IHRoYXQsIHdpdGggdGhlIHBy
b3BlciAiRml4ZXM6IiB0YWcsIGhvdyB0byByZXByb2R1Y2UgdGhlIHByb2JsZW0gYW5kCj4+PiBl
eHBsYWluaW5nIHRoZSBmaXguCj4+IG1heWJlIHRoZXJlIGFyZSBzb21lIGdhcCAsIHdlIHN1cHBv
cnQgU05EUlZfUENNX0ZNVEJJVF9TMjQsIG5vdCBzdXBwb3J0IHRoZQo+Pgo+PiBTTkRSVl9QQ01f
Rk1UQklUX1MyNF8zTEUsICBmb3IgU05EUlZfUENNX0ZNVEJJVF9TMjQKPj4KPj4gaXQgaXMgIFNp
Z25lZCwgMjQtYml0ICgzMi1iaXQgaW4gbWVtb3J5KSwgbGl0dGxlIGVuZGlhbiAsIHRoZSBhdWRp
byBkbWEKPj4gYnVzcnQgaXMgNjRiaXQKPiBJdCBtYWtlcyBhYnNvbHV0ZWx5IG5vIHNlbnNlIHRv
IGRpc2N1c3MgbWVtb3J5IGxheW91dCBmb3IgdGhlIGNvZGVjLgo+Cj4+IGl0IGNhbiBnZXQgdGhl
IGZ1bGwgZGF0YS4gd2Ugc2VuZCB0aGUgMzIgYml0IGRhdGEgIG1jbGsgPSAzMmJpdCogNDhrICo0
LAo+PiB1c2UgdGhlIGNsayB0byBzZW5kCj4+Cj4+IHRoZSAgU05EUlZfUENNX0ZNVEJJVF9TMjQs
ICAgdGhlIGhhZHdhcmUgYWx3YXlzIHNlbmQgdGhlIDMyYml0IGRhdGEKPiBObyBpdCBkb2VzIG5v
dC4gSXQgc2VuZCAyNCBiaXRzIG9mIGRhdGEgb3ZlciBhIDMyIGJpdHMgcGh5c2ljYWwgd29yZCB3
aXRoCj4gOCBiaXRzIGlnbm9yZWQuCgpUaGUgb3JpZ2luYWwgaW50ZW50aW9uLCB3ZSBwbGF5IDMy
Yml0IGRhdGEgZnJvbSB0ZG1vdXQsIGl0IHBsYXkgZXJyb3IsIApzbyB3ZSBhZGQgdGhlIHMzMl9s
ZQoKZm9yIHRkbW91dGEgLGl0IGNhbiBiaW5kIE11bHRpcGxlIGNvZGVjLCBvbmUgY29kZWMgaXMg
dGhlIGludGVybmFsIGNvZGVjLAoKb3RoZXIgaXMgZXh0ZXJuYWwgY29kZWMsIHRkbW91dCBjYW4g
c2VuZCB0aGUgZGF0YSB0byBpbnRlcm5hbCBjb2RlYyBhbmQgCmV4dGVybmFsIGNvZGVjIGZyb20g
dGhlIG91dHB1dCBwYWQKCmZvciBleGFtcGxlLCB0ZG1vdXQgc2VuZCA0IGNoLCAyIGNoIGlzIHNl
bmQgdGhlIGludGVybmFsIGNvZGVjLCAyIGNoIApzZW5kIHRoZSBkYXRhIHBhZAoKaXQgYXBsYXkg
ZXJyb3IsIGR1ZSB0byB0aGUgaW50ZXJuYWwgY29kZWMgZm9tYXQgcGFyYW1ldGVyIGxpbWl0aW5n
IGNvbmRpdGlvbgoKVGhlcmUgaXMgYSBjb250cmFkaWN0aW9uIGhlcmUswqAgQ29uc2lkZXJpbmcg
b3VyIGludGVybmFsIGNhbiBwcm9jZXNzIAp0aGlzIGl0LCBkcm9wIDhiaXQsIDI0Yml0IHZhbGlk
Cgp0aGVyZWZvcmUgc29mdHdhcmUgY2FuIHNldCBzMjRfbGUvczMyX2xlLCBzdGlsbMKgIHdvcmsg
b2sgZm9yIGhhcmR3YXJlLCAKc28gTXVsdGlwbGUgY2ggY2FuIHN1cHBvcnQgZm9yIGludGVybmFs
IGNvZGVjIGFuZCBleHRlcm5hbCBjb2RlYwoKCj4KPj4gc28sIGkgdGhpbmsgd2Ugb25seSBhZGQg
dGhlIFNORFJWX1BDTV9GTVRCSVRfUzMyIGJhc2Ugb24gaXQKPiBUaGF0J3Mgd3JvbmcgaWYgdGhl
IGNvZGVjIGRvZXMgbm90IGFjdHVhbGx5IHVzZSB0aGUgZnVsbCAzMmJpdHMgLi4uIGFuZAo+IEkg
aGF2ZSBjbGVhciBpbmRpY2F0aW9uIHRoYXQncyB3aGF0IHRoZSBjb2RlYyBpcyBkb2luZywgb24g
R1hMIGF0IGxlYXN0Lgo+Cj4+IHdlIHRoaW5rIHRoZSAyNCBiaXQgaXMgdGhlIFNORFJWX1BDTV9G
TVRCSVRfUzI0XzNMRSwgaXQgaXMgMjRiaXQgaW4gbWVtcm95LAo+Pgo+PiBkdWUgdG8gdGhlIGRt
YSBidXNydCA2NCBiaXQgbGltaXQsIGl0IGNhbid0IGFsaWduIHRoZSBzYW1wbGUgYml0LCBpZiBp
dCBpcwo+PiAyNCBiaXQKPiBBZ2FpbiwgbWVtb3J5IGxheW91dCBtYWtlcyBubyBzZW5zZSBoZXJl
Lgo+Cj4+IHNvIHRoZSBjbG9jayBjb25maWd1cmUgY2FuJ3QgMjRiaXQgY2xvY2ssCj4gSSBkaXNh
Z3JlZSBhbmQgdGhpcyBoYXMgYmVlbiB0ZXN0ZWQuIElmIHlvdSBoYXZlIGEgdGVzdCBjYXNlIHNo
b3dpbmcKPiBvdGhlcndpc2UgcGxlYXNlIHNoYXJlIGl0Lgo+Cj4+IGJ5IHRoZSB3YXksIFdlIGRp
c2N1c3MgaW50ZXJuYWxseSBmb3IgZ3hsLAo+Pgo+PiBpdCBhbHNvIHN1cHBvcnQgdGhlIFNORFJW
X1BDTV9GTVRCSVRfUzMyCj4+Cj4gRG9lcyBpdCByZWFsbHkgPyBJZiBpdCBpcyBqdXN0IHRvIGln
bm9yZSB0aGUgOGJpdHMgTFNCLCB0aGF0IG5vdCBhIHN1cHBvcnQuCj4KPj4+PiB1c3VhbGx5IHN1
cHBvcnQgMTYvMzIgYml0IGZvciBuZXcgYXVkaW8gaXAgLCBmb3IgU05EUlZfUENNX0ZNVEJJVF9T
MjRfTEUsCj4+Pj4gaXQgd2lkdGggPTI0LCBwaHkgPTMyCj4+PiBZZXMgcGh5c2ljYWwgb2YgU05E
UlZfUENNX0ZNVEJJVF9TMjRfTEUsIHNvIG1vc3QgY2hpcCBzdXBwb3J0aW5nIDMyIGJpdHMKPj4+
IHdpZHRoIHdvdWxkIHN1cHBvcnQgdGhpcyBTMjRfTEUsIHVubGVzcyB0aGVyZSBpcyBzb21ldGhp
bmcgb2RkLgo+Pj4KPj4+PiBpdCB3YXMgIHRyZWF0ZWQgYXMgMzIgYml0IHRvIHNlbmQgZm9yIHRk
bSwgc28gd2UgY2FuIG9ubHkgYWRkIHRoZSBTMzJMRQo+Pj4+IGJhc2Ugb24gaXQgLCByaWdodCA/
Cj4+PiBZb3UgYXJlIGFza2luZyBtZSA/IEhvdyBhbSBJIHN1cHBvc2UgdG8ga25vdyA/Cj4+Pgo+
Pj4+IGJ1dCBpZiB0aGUgZ3hsIG5vdCBzdXBwb3J0IHRoZSAzMmJpdAo+Pj4gSSBkb24ndCBzZWUg
YSBwcm9ibGVtIHdpdGggYSBEQUMgdGFraW5nIGlucHV0IG9uIDMyYml0cyBwaHlzaWNhbAo+Pj4g
aW50ZXJmYWNlIGFuZCBpZ25vcmluZyBzb21lIGJpdCBvbiBwcm9jZXNzaW5nLgo+Pj4KPj4+IElm
IHRoYXQncyBub3QgdGhlIGNhc2UsIHBsZWFzZSBzZW5kIGEgcHJvcGVyIGZpeCBjaGFuZ2Ugd2l0
aCBzb21lIGV4cGxhbmF0aW9uCj4+Pgo+Pj4+IHdlIG5lZWQgYWRkIG5ldyBzbmRfc29jX2RhaV9k
cml2ZXIgdDkwMTVfZGFpX3M0ID8KPj4+Pgo+Pj4gSWYgSSB1bmRlcnN0b29kIGNvcnJlY3RseSBm
b3JtYXQgZGVwZW5kcyBvbiB0aGUgY2hpcCBhbmQgbmVlZHMgdG8KPj4+IGFkanVzdGVkIGluY2x1
ZGluZyBmb3Igc20xLgo+Pj4KPj4+Pj4+PiAgICAgICAgICB9LAo+Pj4+Pj4+ICAgICAgICAgIC5v
cHMgPSAmdDkwMTVfZGFpX29wcywKPj4+Pj4+PiAgICAgfTsKPj4+Pj4+IC0tIEplcm9tZQo+Pj4g
LS0KPj4+IEplcm9tZQo+IC0tCj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
