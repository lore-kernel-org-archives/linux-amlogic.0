Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92508E77188
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2025 02:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbFIg6h6UQCdTb7yjS6Lc955XvzVnfYbSdFcxSvnwZw=; b=zdG32Q0m64/qe6hBO5VyS7VHTq
	xl1ujG60+B84/jblWeujH96H7zvlxv4936tmEpz+eEmrUc/prg4KFKCoMvgnY2XCYNJk4x9OxZ3Ia
	bSNVYkAmY3X+/f95/VVVSAZ2qGeMpcDPDtI1c9XneYIFBzN+SFSeliEdL+6S6BWpgNOI7MVxzTYjD
	npHQt2y6UksTiTtdasrm/6uussj1+nkm8fBpanK2l9MxOyOCwmGIlBclOH38RZx32JxcoX35w+ZMD
	LV8QMN3GtFL7IruhR/ataj/SWO5PgcE9nQsj2xpp+FL7zZoARvdmzWvaUlpw61XybbMN+ww3rHiQ/
	58v4VMXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtbS-0000000ASoC-35Oq;
	Wed, 15 Jan 2025 02:57:58 +0000
Received: from mail-eastasiaazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c400::2] helo=HK3PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtaB-0000000ASfP-2Lmu;
	Wed, 15 Jan 2025 02:56:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlUxADU71d3XUgLv57OLaOjvqEY+3WnFb8tCtA4KBX76x5HmITPxertiWJ09hDQKtOMDwfhpvZw4ScLjNUa6n6vSEmmyY8Ful3RYYXWNj9b+LkUnuE5NTIPSoOazGsc+VZOsyxfzyLjXm/GIxlLK65knp3BaH0JeybMQ/B4Cb57OogHKz9kstIxfXSV2Nz5X0AU5E57ZDZvdXB/NKquy4lfjb+J9uWjPRchXO8jFLysTKF6eUM9F5f2TmMaUakiODv5+GWXAuQp7zFYG7Fxw/bEBQZKmLQDyddtcwLShzd87wWyK02yDhzPLsUt9xFmZp1dmHpkqmv9l+br1E9A1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4REsXvx44bpWisazXvCYeiEnCc7jXtV18i6b9FM6tg=;
 b=iyUuDsRoQA2bSV8h7o8d5XqPzZo6UPag/gzNghisChYkpYmerXBmShQho49+wKTRQqu51pnUN7Ll25bJ5PgFaK3uQb5wlexSFN50GasOvzPTyEsGhTfHUGroj1geum+wbGPMWPx/Lun9ae/iDuv8fIcq4fINRae64Wev/7OGbfNGgHX8ywBLoRX5fVhLRZ0pDE4W/BOfYWUIV/ghqE/Xpo8qMPeuBM+HoU1iJwPaVjDmALPDKUFM8ndYDo5rsMC2mRG3MIimnV4AvegLn3G4znc9KJu3lvFI3kNTXLGeKvOZ4MkcQgvPWnW+77zcRFHVXbSj073O/WvFSpkzrnSvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4REsXvx44bpWisazXvCYeiEnCc7jXtV18i6b9FM6tg=;
 b=aiawVVm5F8xtHSbbIsStE9jicbMav7t49klom/MjSzCgKZja7ZgZcfazYVhq3SniOkNQ/mSigKHSdvKrN06xgliZ5OjFRiSQBJSNLDcYWFP3BHxsYpA7nNkPEDlQsH61iJIS7zo23IK8CX/3P/DtdxbIW6Eu/meBtJ6G2HVU8uAtF2WwpFKhJs7NueG0SsKbb/N5sJLTqAa1Kuvbk0BYNMYi5NdeamsEID8F9V9s1afLA6LlPaelHl1gUUZ4x63k9NISrdfD/j6ncCf0IFPEkggXBbm9fL/PM2H/tbY2Gp1Kh0lexypGsUPsbJInsQpaksv0Uop0W4GYUnbzURk19A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEZPR03MB8444.apcprd03.prod.outlook.com (2603:1096:101:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Wed, 15 Jan
 2025 02:56:22 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 02:56:22 +0000
Message-ID: <e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com>
Date: Wed, 15 Jan 2025 10:56:17 +0800
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
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19)
 To PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEZPR03MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f5e2ca-caf2-45d3-2b6d-08dd35103131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm1MR2RYNmtmMk96NWRCQXB0dGJFanEzZk92Nm9teHRiSVBGcXZDOXBiZ3Bj?=
 =?utf-8?B?T1NXYVhrdytUNWNRN2VELzlOSFFSTnZ3T0RWWEtpOGp0UEQvS3JZR0h6eHgz?=
 =?utf-8?B?WWJIVE9kT3JlU01yWVhKMjUxUEdHSTdTU2E2aUdWS0FHd1VueCtJZkwzYVc3?=
 =?utf-8?B?RkVFSDlpTVVuZ0lLdFdqL2syRGNkWlVGR0E1NWNUZDJCdkVMR3NCOTRYSXIw?=
 =?utf-8?B?TERXS3dBeWtWQWtFUGxCNGpncVdyTEF4SWdmOE0xem5NWWdXMDhPd1dTZlBM?=
 =?utf-8?B?U2cyWFJqODRsTmQ4RGVoMFNDd2Y5eTNhMWhNMEgxTmZaMTA3bi9haGtxcmdS?=
 =?utf-8?B?Y0E3L21ONVhpT1FkL2NCME9WcC9wSjNMZ2hLczlIdGpUYldmWDNhNFhpcFVp?=
 =?utf-8?B?NUl2ZytNK0w2Ry9CV3czZ0xNakpoQmo5Nk5ySHIrU2RJK1oreC9waTFmTVdQ?=
 =?utf-8?B?VmFCenU0Z1N2ZzV5TXpzQmpDMVNWb2FXS0RYOHJEL0tQMFdzQXdzODYwenox?=
 =?utf-8?B?b1FvMmgzQlc3dG1WTFdqNXRGV0JvcnFzRUMrUEkyUzhDYTlkMEFzMlo5Um1i?=
 =?utf-8?B?RDV4dEJLb3gzTDdxSjZrc3hKL1hiTVk2Q1ZLRXNieDl3MmR5RjE3dWtldjRE?=
 =?utf-8?B?dWdLcjJTVGxHdFp1WlZLVUZOR09oYU8xa0dUSkpzc2xpYlk5dkV2TzV0YUdX?=
 =?utf-8?B?TGh2Z3haS0Zoa2M3NEZFMUdRbXVid0s1N2lsQUszNks5ZnRvOE03WDhHcHpH?=
 =?utf-8?B?S3pONkxRSTFPR084RU5JUHo5UWN2RDBMQUtrSnhTcE40QVJWYThRdXo0bmI5?=
 =?utf-8?B?UE9BRUtmMUdhTmpOYmtNWUZTQlJJMnJOM1dYUmVWYUUrbU16MTRMWmpNdEZs?=
 =?utf-8?B?WHY4SWF4TDMweExiVWxzYzlLc1NyaWRwWWZzckZrM1VVUjBIT3k4SDFRUlNi?=
 =?utf-8?B?Y1ZQOVRkNUJRU1czZWhPRlJBLzRrVWNuS0xNY3NLUGV1KzI3eGFQeFAxMk5p?=
 =?utf-8?B?cHZac29JV0dkQk5MNGJaMUJMK3NlU1VlQ1YrRjRZSWZ5eEdwT2NIRnlBdDEz?=
 =?utf-8?B?VnBDMk9tMVMyaWJSZUxQcGduKzlZSVJieWQ1ejhkY2ZwZm9ZWVNxNXBQcnZG?=
 =?utf-8?B?ZnVtR2hhL0RzN3ZMcFNpZTZ1YXVKbTdXbnBjMkduRE1xaFh1eTJ4MFNjbmlq?=
 =?utf-8?B?ME50VkJjbzh5ZE5wWklLSXZhTXVzWURRTExLSXk5NDg1dGJESzdSYjRQR2E3?=
 =?utf-8?B?RmNwZTU1cURIVGFtVG9LWmI2Ly9OWFc5eEh1R2Y5ZWZmKzErTXROVDJldUE5?=
 =?utf-8?B?NmJWMWMxc1Ezd1g1ZkpadGtEZ1FJWWpVTFk0Q21JZkhoV1krNUIzMWd2UjU3?=
 =?utf-8?B?N3pqZkpPbGxVckYwV1hPWThDdzhuZUhDZlJJOVNlYXU4dG5RaU1UZjJDQVdm?=
 =?utf-8?B?d2NFSVRsdFlLN3J0YkxVMU1qYWxUZW0zRk8zZVZXang3VHBwT1N1ZTNXeGxJ?=
 =?utf-8?B?MGtUOTNrS2RvZUkwZU9wVE9oMjlaejR4YUo4L3R5SEVtV21Demo5NFlKUGhI?=
 =?utf-8?B?RWdMS0RxY3RhblQ0NkxDRUpGaTZtWHZjVWhDdXZkVm02Um03TlpVajcwc0x0?=
 =?utf-8?B?YkZqS05KejJ4ZVd4THNWTk4wVklGMHdpMVRiOEE4TzJJTXRVMnhEb29JSWdC?=
 =?utf-8?B?M05CSEdtNUsvZzFzMFFNc3NwRTZUMkRrZzArWkp6V3czc2xTcVhLTU40c3lY?=
 =?utf-8?B?bFpHN2RJNUpndTFJbUF5KytCOTYwOFpJaENoZDRBRjJ6aU51UEJWTHAySEQ5?=
 =?utf-8?B?bXVTY3FBYjF2NkpXdkI4azgvQ3RNZEdYRDBrTjV0NjFOREc2OTU1TVppL0wx?=
 =?utf-8?Q?bR0ITiRcCSZbU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStiMEZ5MlByS2tqU0EybXBjeEZQUXBZQ2tBdDh5NFdwdlVlQU1qb1I2UTRu?=
 =?utf-8?B?Rk1YRkxhL0pBYk9NUlFsNnNWOHp3T012aUNPaVpmcEppRnBwSGdWcjNOSi9a?=
 =?utf-8?B?bXJjdUFzdFJ5NmQxb2dBRmtFODdtUTBBem1XdlBldWNSalUxZEJzTnpPSVV6?=
 =?utf-8?B?M040RnQ0bWVPSXZkVEI5aWNWOFl6ZGpoUUd4eDh2a2F4OGlTRzZxYXlmRXJx?=
 =?utf-8?B?OVVmdlljRkdDVzhNc3JSby95Ry85WHg4eDdxOFowVS9ReTBwR2h1TlNlUFcx?=
 =?utf-8?B?R29JaWwzK3ljQVo4Z3RHTFBpSUZCUytzRmswbnM5M2R4TUNJeE8yQ0ZLaU8v?=
 =?utf-8?B?MHV6U054cU1SZ0xWSmllWXdDaWpVdjVOaytzR2hOSjdZcTJLQlZXeW9Sekpv?=
 =?utf-8?B?SlY0N0FzT3RhYnozRmYyS3MwQmgyelY5QVBLSzRFeWVCTTZJT0pZTXlxRFF2?=
 =?utf-8?B?Zm1vRlMxbkI3eUJnT25qcHJjT240YWZHTk9nemdhMDNVNXZKYks0K01OKzht?=
 =?utf-8?B?MUpjZ0s2d2c2cnlyaGxsTjFLM3BsOFgrbitheUQzUXdYdVJ6b3JjYTRxR1dj?=
 =?utf-8?B?RDYwaXpiQmx6cmNBT2U5aWxaQnlsSDdOVVNyZVp6TEthQTVTME1vNTk5QUpZ?=
 =?utf-8?B?aXlWUTVPeFNNNkNmZWM4MDl5bmpjeXNPQ2QyUmZtQUZVRlhqRW1kSTg3SGds?=
 =?utf-8?B?Ly9nbkFJL212aFE4eUl4d1V6SnVWdW5hcDZPV2QrK2d5OEpyMkRCRW5tZXFo?=
 =?utf-8?B?SWlKYytaajY2azgvYi9oU09PaDNvZnVZNW5TSDZqRVRYM2h1SUJMdGJsalYw?=
 =?utf-8?B?WHJVQktCZm5GQVo4Tmh5UUY2WEFIVERxcTQzdUFxTDJNa0VpSWR2dTArUEpO?=
 =?utf-8?B?R2VSY3NTWTZpYUZCMTczV0FOMTUrT1h4TDlLeDgzWlRvbk9jSmhIaGw1U2pS?=
 =?utf-8?B?R3pIZ3dHeHROeUkrNStsL3ZQYjhQMEYwT2R0T01YcTJlWUVQWjMzd2FkTEY5?=
 =?utf-8?B?Y3F6RWR3K3lIcTNjejU5aitkdi9yRW9TRERkUERVbWwvSXpwMFZNUlRMb2cv?=
 =?utf-8?B?MFRXUEJLQmhKZEtSa3VGcmJrMXNmNUpPYW00bFRsMFVwMUtmblY3MzNzVjkv?=
 =?utf-8?B?SE1NdDlBc2JRZ0M5c0pnNWg0Wi9XTlNuMGZZVWNwSDRVQjFvTTRDYytydkpt?=
 =?utf-8?B?eVE2RGp6Y3grcHJGbE5oS2t6N2F5c1dYNFNPUmxSK2lNUFE5cGt6SEg5cGJr?=
 =?utf-8?B?UndmY3oyUXdlMVA4Mi9pbkdoS1B2ZWF6RzExeGpzQmFqTFNZdHJmeEtTeWIx?=
 =?utf-8?B?K09FN0dhNWJUN0xXMXdBRWxVTEV0Q3dpcUI5TG93ZEFvRU41cGFSZnVIRk5C?=
 =?utf-8?B?ZXdKdGZScEg0TXBPZTRTS1VjdXVIaUVJUU1SYkdFSXFQYjBUWURiNDBoQVNs?=
 =?utf-8?B?ZG4wbUVUdHpWNWVlZDdEU2ptZi9EcnRpWjlKbDMxRlRkSTJhTG9ycXNUQisz?=
 =?utf-8?B?ZHdsazRoWEtFa1haUk9NdUc3dlViZzVLTTZHaFRSOFhCd3g5MnZERkp4ZGJM?=
 =?utf-8?B?SUtFY0xHQURVZmtLcnlJZnJGSVlVY1JocnBnSzhtdi9qTmpVZU9lRVpUUks5?=
 =?utf-8?B?RnBzaWFUYVVMNDR3ZlZNcnp4aXQxL0Q0Uzhlb2dSMTF2N1EzRHl3em5wOEtV?=
 =?utf-8?B?UncwcVE0VVU5UXFBYVBvbmRXTDJxcnVyUTh2VCtIekdWSDFqL0dDVXF1YWFX?=
 =?utf-8?B?bjBGc3l5dXBHUWl2eDYrVnJTdGplWHFaSi96UCsvRzBxcXhzSkUxVlBZWjRx?=
 =?utf-8?B?dXRDUnc3em9yNlYxRDVZSW03eDVVVzVYSSs2NXM0NUtlZUcxNTRVd3o5ZEQ0?=
 =?utf-8?B?ZUxWWDNlMUwvdHg0TFB1QWpaRG52NlZtUjlqa3h4ZHoraHdVbzVXMk9ybm03?=
 =?utf-8?B?WWkvdGIyV0JBc0plb1pxS0JWVE9UdFp0NllXb2tsVWtVK3BmdGcvY1hkVmt2?=
 =?utf-8?B?Q2RvWWRHR3RKUm4zZVBid01udEZ5WHB3cWp5Y3pKL2hPZjdmTUY0MDBiYURJ?=
 =?utf-8?B?dzBLSFFxQmVlZ1J2MEhGUlNKb09pTldQNEtOSjhiOE1Xa3l2VnZwVUw3dzhh?=
 =?utf-8?B?enJUWFdLNElOT1hmcldjQytvaExHZ05TcGFQdTdscVV0VW42UTJTeEErNndJ?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f5e2ca-caf2-45d3-2b6d-08dd35103131
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 02:56:21.9410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqgtBe/mXyhGH2k9x7SXH85Ggz80CoBdGQrx0SBd28MexWrnyoYqvWO6IJpnVIMTPXRZGy6tktXh3Mh7LDiIMJG8qtcdC9tHEFQyr9ZHPfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8444
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_185639_600329_4574A06A 
X-CRM114-Status: GOOD (  27.30  )
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

CuWcqCAyMDI1LzEvMTQgMjI6MDUsIEplcm9tZSBCcnVuZXQg5YaZ6YGTOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gT24gVHVlIDE0IEphbiAyMDI1IGF0IDE5OjIwLCBKaWViaW5nIENoZW4gPGpp
ZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPj4+Pj4gKwo+Pj4+PiArTU9EVUxFX0RF
U0NSSVBUSU9OKCJBbWxvZ2ljIHRvIGNvZGVjIGRyaXZlciIpOwo+Pj4+PiArTU9EVUxFX0FVVEhP
UigiamllYmluZy5jaGVuQGFtbG9naWMuY29tIik7Cj4+Pj4+ICtNT0RVTEVfTElDRU5TRSgiR1BM
Iik7Cj4+Pj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vdDkwMTUuYyBiL3NvdW5kL3Nv
Yy9tZXNvbi90OTAxNS5jCj4+Pj4+IGluZGV4Cj4+Pj4+IDU3MWY2NTc4OGM1OTIwNTBhYmRjYTI2
NGY1NjU2ZDRkMWE5ZDk5ZjYuLjJkYjFjZDE4Y2YyY2VhNTA3ZjNkNzI4MjA1NGUwM2Q5NTM1ODY2
NDgKPj4+Pj4gMTAwNjQ0Cj4+Pj4+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi90OTAxNS5jCj4+Pj4+
ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi90OTAxNS5jCj4+Pj4+IEBAIC04OSwxMCArODksNyBAQCBz
dGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciB0OTAxNV9kYWkgPSB7Cj4+Pj4+ICAgICAg
ICAgICAgICAgICAuY2hhbm5lbHNfbWluID0gMSwKPj4+Pj4gICAgICAgICAgICAgICAgIC5jaGFu
bmVsc19tYXggPSAyLAo+Pj4+PiAgICAgICAgICAgICAgICAgLnJhdGVzID0gU05EUlZfUENNX1JB
VEVfODAwMF85NjAwMCwKPj4+Pj4gLSAgICAgICAgICAgICAuZm9ybWF0cyA9IChTTkRSVl9QQ01f
Rk1UQklUX1M4IHwKPj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1U
QklUX1MxNl9MRSB8Cj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgU05EUlZfUENNX0ZN
VEJJVF9TMjBfTEUgfAo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9G
TVRCSVRfUzI0X0xFKSwKPj4+Pj4gKyAgICAgICAgICAgICAuZm9ybWF0cyA9IChTTkRSVl9QQ01f
Rk1UQklUX1MxNl9MRSB8Cj4+Pj4+IFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFKSwKPj4+PiBBZ2Fp
biwgbWl4ZWQgdXAgY2hhbmdlcyB3aXRoIHplcm8ganVzdGlmaWNhdGlvbi4KPj4+Pgo+Pj4+IFRo
aXMgZHJvcHMgUzggYW5kIFMxNiBmb3JtYXQgc3VwcG9ydCBmb3IgdGhlIGV4aXN0aW5nIFNvQ3Mg
KHN1Y2ggYXMgR1hMKQo+Pj4+IHdoaWNoIGlzIGtub3duIHRvIHdvcmsgYW5kIGFkZCBTMzIgc3Vw
cG9ydCBvbiBhbiBIVyBkb2N1bWVudGVkIGFzIDI0Yml0cwo+Pj4+IG9ubHkuIENhbiB5b3UgZXhw
bGFpbiA/Cj4+IGZvciBnMTJhLCBzbTEgZXRjLCBpdCBpcyB1c2UgbmV3IGF1ZGlvIGlwLCBHWEwg
aXMgb2xkIGlwLAo+IElmIHRoZXJlIGFyZSBjaGlwcyBkaWZmZXJlbmNlIHdlIGRpZCBub3Qga25v
dyBhYm91dCwgdGhlbiB5b3Ugc2hvdWxkCj4gaW50cm9kdWNlIHRob3NlIGRpZmZlcmVuY2UsIHdp
dGhvdXQgYnJlYWtpbmcgZXhpc3Rpbmcgc3VwcG9ydCAtCj4gaW5jbHVkaW5nIGZvciBHWEwsIHdo
aWNoIGlzIHdoYXQgeW91IGRpZCBJSVVDLgo+Cj4+IHRoZSBuZXcgaXAgbm90IHN1cHBvcnQgMjQg
Yml0LAo+IEFyZSBzdXJlIGFib3V0IHRoYXQgPyB0aGF0IGNvZGUgaGFzIGJlZW4gdGhlcmUgZm9y
IGEgd2hpbGUuCj4KPiBJZiBzbTEgZG9lcyBub3Qgc3VwcG9ydCBTTkRSVl9QQ01fRk1UQklUX1My
NF9MRSwgeW91IHNob3VsZCBhIGZpeCB1cCBwYXRjaCBmb3IKPiB0aGF0LCB3aXRoIHRoZSBwcm9w
ZXIgIkZpeGVzOiIgdGFnLCBob3cgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIGFuZAo+IGV4cGxh
aW5pbmcgdGhlIGZpeC4KCm1heWJlIHRoZXJlIGFyZSBzb21lIGdhcCAsIHdlIHN1cHBvcnQgU05E
UlZfUENNX0ZNVEJJVF9TMjQsIG5vdCBzdXBwb3J0IHRoZQoKU05EUlZfUENNX0ZNVEJJVF9TMjRf
M0xFLMKgIGZvciBTTkRSVl9QQ01fRk1UQklUX1MyNAoKaXQgaXPCoCBTaWduZWQsIDI0LWJpdCAo
MzItYml0IGluIG1lbW9yeSksIGxpdHRsZSBlbmRpYW4gLCB0aGUgYXVkaW8gZG1hIApidXNydCBp
cyA2NGJpdAoKaXQgY2FuIGdldCB0aGUgZnVsbCBkYXRhLiB3ZSBzZW5kIHRoZSAzMiBiaXQgZGF0
YcKgIG1jbGsgPSAzMmJpdCogNDhrIAoqNCzCoCB1c2UgdGhlIGNsayB0byBzZW5kCgp0aGXCoCBT
TkRSVl9QQ01fRk1UQklUX1MyNCzCoMKgIHRoZSBoYWR3YXJlIGFsd2F5cyBzZW5kIHRoZSAzMmJp
dCBkYXRhCgpzbywgaSB0aGluayB3ZSBvbmx5IGFkZCB0aGUgU05EUlZfUENNX0ZNVEJJVF9TMzIg
YmFzZSBvbiBpdAoKd2UgdGhpbmsgdGhlIDI0IGJpdCBpcyB0aGUgU05EUlZfUENNX0ZNVEJJVF9T
MjRfM0xFLCBpdCBpcyAyNGJpdCBpbiBtZW1yb3ksCgpkdWUgdG8gdGhlIGRtYSBidXNydCA2NCBi
aXQgbGltaXQsIGl0IGNhbid0IGFsaWduIHRoZSBzYW1wbGUgYml0LCBpZiBpdCAKaXMgMjQgYml0
CgpzbyB0aGUgY2xvY2sgY29uZmlndXJlIGNhbid0IDI0Yml0IGNsb2NrLCBieSB0aGUgd2F5LCBX
ZSBkaXNjdXNzIAppbnRlcm5hbGx5IGZvciBneGwsCgppdCBhbHNvIHN1cHBvcnQgdGhlIFNORFJW
X1BDTV9GTVRCSVRfUzMyCgoKPgo+PiB1c3VhbGx5IHN1cHBvcnQgMTYvMzIgYml0IGZvciBuZXcg
YXVkaW8gaXAgLCBmb3IgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUsCj4+IGl0IHdpZHRoID0yNCwg
cGh5ID0zMgo+IFllcyBwaHlzaWNhbCBvZiBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSwgc28gbW9z
dCBjaGlwIHN1cHBvcnRpbmcgMzIgYml0cwo+IHdpZHRoIHdvdWxkIHN1cHBvcnQgdGhpcyBTMjRf
TEUsIHVubGVzcyB0aGVyZSBpcyBzb21ldGhpbmcgb2RkLgo+Cj4+IGl0IHdhcyAgdHJlYXRlZCBh
cyAzMiBiaXQgdG8gc2VuZCBmb3IgdGRtLCBzbyB3ZSBjYW4gb25seSBhZGQgdGhlIFMzMkxFCj4+
IGJhc2Ugb24gaXQgLCByaWdodCA/Cj4gWW91IGFyZSBhc2tpbmcgbWUgPyBIb3cgYW0gSSBzdXBw
b3NlIHRvIGtub3cgPwo+Cj4+IGJ1dCBpZiB0aGUgZ3hsIG5vdCBzdXBwb3J0IHRoZSAzMmJpdAo+
IEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSB3aXRoIGEgREFDIHRha2luZyBpbnB1dCBvbiAzMmJpdHMg
cGh5c2ljYWwKPiBpbnRlcmZhY2UgYW5kIGlnbm9yaW5nIHNvbWUgYml0IG9uIHByb2Nlc3Npbmcu
Cj4KPiBJZiB0aGF0J3Mgbm90IHRoZSBjYXNlLCBwbGVhc2Ugc2VuZCBhIHByb3BlciBmaXggY2hh
bmdlIHdpdGggc29tZSBleHBsYW5hdGlvbgo+Cj4+IHdlIG5lZWQgYWRkIG5ldyBzbmRfc29jX2Rh
aV9kcml2ZXIgdDkwMTVfZGFpX3M0ID8KPj4KPiBJZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5IGZv
cm1hdCBkZXBlbmRzIG9uIHRoZSBjaGlwIGFuZCBuZWVkcyB0bwo+IGFkanVzdGVkIGluY2x1ZGlu
ZyBmb3Igc20xLgo+Cj4+Pj4+ICAgICAgICAgfSwKPj4+Pj4gICAgICAgICAub3BzID0gJnQ5MDE1
X2RhaV9vcHMsCj4+Pj4+ICAgIH07Cj4+Pj4gLS0gSmVyb21lCj4gLS0KPiBKZXJvbWUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
