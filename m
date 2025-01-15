Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C073DC02180
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2025 12:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Blm7VqMha/XnFZFvnLlyxr+3JdaWRwi2un4WmdQVkko=; b=Mz6gEuFO2SSP5hDInJwKxtZ2qt
	BfKXt3tawb/gm961vwNyj0jVhGD5x7M93EWLg1ssYhk6NU2R0mP00Hs5jER3QSfLhl8onspv3YY5o
	0EHQeLBOZh0RNmkgXaGIL6ZPR/AcGXMxGFbwo6x3FlBHLqwkqXDO4D0PFaLiSsPOqrGciLnlbbKVe
	khfHEofvFRo5+n9c8Dl7w9Ko+WxOw/Gtdpqpw1XIEPuN9VWuhrVAuTP1tOWWCteEmiqJxY1wuj16y
	TxdDGXgiPPWbhNZXjGi7Svzb/hCjrLRBAzfDEI/DQKYEeWsbghNHblBBmkwRc6kYI8dEfUfJozIHX
	69C8wyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2EO-0000000Bntu-166o;
	Wed, 15 Jan 2025 12:10:44 +0000
Received: from mail-sg2apc01on20721.outbound.protection.outlook.com ([2a01:111:f403:200f::721] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2D8-0000000BnlB-0i46;
	Wed, 15 Jan 2025 12:09:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms4IK10xaGMUQBxtOuMCy0FnBagIgoRc+RaVVGNp1nuMmpg1y/vYJ7+vOam/UpANN4iO+kEOKzXvFqI1wygAySuEwRkPkNZHF5RItNspSy7Zy79QNB62+Qk0gtmsitwHZkX1y3c8+ONQfwnNtLBc2luXk6AByZJH676q8F05+2NmGervyx/uxHgJw+ClnyEBriP/NLC0fIGMnr034VoCNe1lpfUX7iHrG66KSSTSTRYYXtAPvB8a2zkfbGt9QSfYBzjXLYZUpjgYSrIxyBSQuzQAEwIf6HEp8NgXyWutg6cGoCU/eGgQNa++ZUm9XmRlpd8sR7blCQSnPt/ZqBFzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/Ofh4zGlpRsoJdspWCOf3dHzqaLgcdfbC0x7ZqCCEs=;
 b=ZAmj6o4frOtIhUqUmxoxwLjD8isxGaRSK1QT9ONrqlss0q/m4YmumQDyfsr9vCWvouK3juWndMSddKWG7gu5nJ9J7v04Sh/ZCZ3UKVc8dmw8nlncORgITr3b1p9BMA3Ve6wp1OPKxfhf4ZdF/zPC2D+/QirWVTQaO4H1tx69xKJBlmw03wYJGDeZA1SeChe+mwBlqXd1BxxLzUDMrEuspC69/ZpecgckWJGVciqEqGRqzK3HIRWxMUwzAGq/qxxx2vveXietoLYCBY4am+M9WrQimwH0o7VJ3gjKrI3Y0SR3YzWt5PfsMExlV4NqvZUW/NCUA6YtRwccwOAAorTXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/Ofh4zGlpRsoJdspWCOf3dHzqaLgcdfbC0x7ZqCCEs=;
 b=jhgOHlLkVlM189hYIeDnHrWOjSKBQAeDDrNpMRD4BxxFJdwnkhO4XiRLBhHZjjmPryhvfFj7EvIeVJ5kf2w7cIuNJVMwrW9cxGpRj9ZEz3/NMM/bAIf+nwnRWTgl22XmgYoYcPCuS/Hqw4sMI+OdcX+eLSK0sxXLVF0NfRZJvLYLwd6D7QHOKBYV7yjzZXddQNFEmOkYPcwhNt3jXaIuBNjUcZD6KL2Q7euD/aToa0+lsabPUzM8aulm88GwW4C+SKPFt4hYu6i5E8yA32kkWmsydogo3/fo2oyzyej3kI8pd1TQeC375hu4MFJMe7tADbMFfBuJbsVJwqJEoWpbug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEZPR03MB7124.apcprd03.prod.outlook.com (2603:1096:101:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 12:09:15 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 12:09:14 +0000
Message-ID: <b3b60ec4-ae88-4110-9839-449ee7477d9b@amlogic.com>
Date: Wed, 15 Jan 2025 20:09:10 +0800
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
 <af4fde1c-281b-4826-a52c-a4e14727eb67@amlogic.com>
In-Reply-To: <af4fde1c-281b-4826-a52c-a4e14727eb67@amlogic.com>
X-ClientProxiedBy: TY2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:404:f6::25) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEZPR03MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e498b03-161d-4e38-441a-08dd355d6db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzNWaFVxU0JoQVZXbm5QNnI4TWlIbmlocVBaeXc5empXRjMzeTZQY1YrLzZM?=
 =?utf-8?B?c0VXV1RTZm1vcDg3aGlDR1k1Nnd6TWlIQmR1WU9YZ25EN1BVaHlTV2FwNXp5?=
 =?utf-8?B?MmxORUg1SVQvc2t5Wndia1ZOQWVPTm5EOXpSSmxLQmVlSENDc1VoR2xHajh5?=
 =?utf-8?B?RExOMDNabXdSNEUxUElaMkc0UmhGUVk5aW96cmUxWEVjZy9tQXVFM2owNFRE?=
 =?utf-8?B?YnlFQ0pWNE1ZMHZiL0ZWUWhhcklCMjhHZGtiNjl5YjhvTUlEL3BQejdvSDRv?=
 =?utf-8?B?bzZRTFZXeVRJOVMvbVIxdTVDTEE4d0xIL1ZwWEVjc05GNEVaaFFHNUVTMnhD?=
 =?utf-8?B?UXpWQ0xVM2IzVHFRTzN2VENUN3BvR2gxMTY1bG1jZ1FQeWVCY2xsUFVGdERi?=
 =?utf-8?B?SVNMTXgvU0hVVno2dHlqeFV2bURHOUZDV0MvWHVHTHFRZ1hGNnBDNUY2ZUNu?=
 =?utf-8?B?WXdqNmRhSU9XcVFubjN6dW9WbnRNc0NlWUpsSzZ2UWJ4MndycHl4NHhjMUlL?=
 =?utf-8?B?TThFYm5teUc4UDFvV0dvMlM1YldrS1oxNmNac2lPWTArOUlPRThkZjUxYzlW?=
 =?utf-8?B?UjJva1Izc0N1WFNjZkVkVnc2S05TeStpM2lDNDdybFFIRE5oRFVkaGNwb1Ra?=
 =?utf-8?B?cktWOU5ydDk1WHhjTXp0WmVsVm95SWZ0d0l5ZXpkbzl0TTFISUs3ejJFMlZt?=
 =?utf-8?B?eGxQcEJ5NGduWGN1dGRNeWxWci9kU3JNQ29QKzFFVzhGRzJwUHplUTYyNmJ0?=
 =?utf-8?B?VERjb2oyd1JlQTBzaEdTMG92Y1JFZ082K1BMdkhVNXdaRGZnRXpHWEJCQWw5?=
 =?utf-8?B?c3JJZXhoRXZnRWJXc2w0WUJUMmFHOG5LRStVTXZEdXlzTlIzOFVkdWVQYzJS?=
 =?utf-8?B?ZEk4ZEVCQVNvZ01JemU3UGx3TUppQjFnc0FlZlFtcXZyN1IxcmIxUDdhL2VL?=
 =?utf-8?B?WjNvY0lyUUE0S3M2MWFGaEJZTGlDZmhMcVV2YnBJRlREMWl1VlVIVk5mR1Bh?=
 =?utf-8?B?clJKbkdNRkdjTXMzNSttTFl6aXl4b2ZENlZ6c00rcDc3b2h4cm1FNUZnM1ZX?=
 =?utf-8?B?ZWpsajZMZkY4cWNQbTl2Z1ZJZHgrcVBObHU5R004V3FwMlA4VmRmYTkzZ1Nw?=
 =?utf-8?B?eDRnS1JNVW9ka3ZQb1JCWmdwVUhOdDBoMDJ0RDRURFd4OEIxMm80cGo0blFn?=
 =?utf-8?B?S29nYjliN25NdWpqZGRmM3Q2dVhWYU93dDRHL20yaWZpQUJoR05NWHNoQ1hC?=
 =?utf-8?B?cTl5c3BJM3cxQnZBb1FleitBSHRpb1I2WUpRTkNpRHI3M2NmSGQ3RERDbDd1?=
 =?utf-8?B?Z0RrellHYm52OGFIUi9nazZrbEVDSWF0MmlkQXdIaDNoM1BRWHVnWjZDMlpN?=
 =?utf-8?B?NHcvT1oxQlp0NkdDRXY0bktZNHRrZWRnSzRKZVAwa0hqVTUxaldVWEFKaUI2?=
 =?utf-8?B?djFPTEJzSGQrNm15b0Jld2JvcDFXaGxDbUNWY1d6YndxTjRVMiswQUhUd2FZ?=
 =?utf-8?B?R0RCU0hBdkxQbHdJZkNwc0h3cWMrajQwWFdlaHFBNXVxalpXbVBJRlZiMjZl?=
 =?utf-8?B?VTNiSUhJQ3VlaGI2ZzBJRlZOQTFtQ3FKVjNVQjlwQWZNRnRINXZUQWlhZ0Iw?=
 =?utf-8?B?U3I1QUVYYU1GbDhkVjlsVjFtWHM5MmM5WGg2UDZOL0tWL2s5dU53YlJOVDBm?=
 =?utf-8?B?VXZMWFlycUk0bXpJQ3lObjlOc1RSVW5TdFZJdXQ5UVhReE15VnZHN2tVMS9l?=
 =?utf-8?B?MXplVHBWbDRCUW41b3Y2YlMreDgra3VlODlqUlJodGJwdHc0WXJlaEF2czZI?=
 =?utf-8?B?TTBVeEpFQk1yVVBWMkRSa1NRMk92czZWUW4yUENGUVNsV1ZkaWthaEdCY0k4?=
 =?utf-8?Q?02CKtMnWGZIvJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2NUck5zWkRPTXQxa3BUekwrcjF0eWtWK2dJT2JuRU1lUG02WXdSRkEzdFg2?=
 =?utf-8?B?dmtHZllSOXlnTUpCeWw2OVU3UlY1N3FVMkVueDNyVmpmbFAwekgxYzRqSE1V?=
 =?utf-8?B?NmtvUmhUUHl3RzR0U3NOOGZMbytMblpWWlFjWUZ5VlQ3a3Z5LzdFRzhGVVN6?=
 =?utf-8?B?Mldqdk9YRXVpcHRTNlk2T1lMOXB6c0RoMGlPZy8zTHJhZVJ6cnd1Y2NVRjJQ?=
 =?utf-8?B?bXdwby9KUmlzVWpnMkNCSHhXd1Q1VE44S2M2MDNBcG4rQzR5K3JrR0p4UFpD?=
 =?utf-8?B?MjNEQm9KWjZpVmN3bThLSmtab3VVQ0VlYjBkSVZiN0VkMFptaE9jWjFyKzg4?=
 =?utf-8?B?WUE2MFlKZlEzZGdRcVJJNjhWckhUbG9qK1NPTUltTHQrZThZUE13THM0OG5r?=
 =?utf-8?B?a0doVEdlOVRIOHVISm1XVFVnb0JsWUVPZllIOUJBWkxzV2JwTFZKcnZBdWho?=
 =?utf-8?B?QWpZOWQ2emxpNkR6M0J5dnpnTGdITEFKMTFkdzFHdGRvZVRlMThpOEFSK2p4?=
 =?utf-8?B?U3VvdDlHNFBPU0hEQnFkYXg5RW9xRnVMQ0JWRUI4aEFNblhtaEJHVHdxQXNS?=
 =?utf-8?B?VVY5SHNvWUNDcndoSFpvRlMxeDJvWUI4WnVqZWFPSFJDYlhCZkhwYm04b0FV?=
 =?utf-8?B?RitqejJKNVN4L2hCcmYxR3VDT2pTZnVtWTZvbUdoZHZ5VXVEWlZ0eEswd1pL?=
 =?utf-8?B?Mk53eTNVVlRGWURGeHhUM2FaZURvcC91cVRkdFErSnlicHFhTFF0NTl4MnNy?=
 =?utf-8?B?WCs3N3hBNTloT256OW45YUpZNTFTOEJxb01mZDhKM2ZJYndsRlQ4bmRlOFk0?=
 =?utf-8?B?UGNMbVdZTHhUN1B0eEFkWHMrWngrNHlQazRGUkJtc0wxK0JCMXVyaHBpWEkv?=
 =?utf-8?B?NUw0NTVQb2ZqZlVYa0U0TmlTaC9rUE96dExyTkYvN3FDa2diSkdhdnNZK1N4?=
 =?utf-8?B?M2VPZ1FDbFNEQW9raU03eTA3ek1vVG5veW1JZHJuTlAzRjVBdEVudUpOS3B0?=
 =?utf-8?B?YUlIK3lRYXZRNG1KM2cvdnNkMUliUWFWNTR3OTdmUjlLTGFpZDd2R3V5aGlQ?=
 =?utf-8?B?dVJmTGpWNUJHcVNHQXVORGpXcnp0dGJmQ2lDSFhwSHp2T1ovczRFNTNCTVlJ?=
 =?utf-8?B?UGVteFhYV1R0S0V1SGt1SWZ4ZWd5TU9hR2Ruei8wYjZ0c3h0dkFhdFp5cVRu?=
 =?utf-8?B?YzBDcGZXL0RBc3JBMk9TV3ZSWnIrUGlvQ1VuUWdxeUhoazJQbk02cXBRSTdM?=
 =?utf-8?B?SVk4RUZPNnhOcE8rZk9vc09EWWZXaTlOT3BSZWFRTWp1TjhNRThXcGFjMS9t?=
 =?utf-8?B?VHhEek9hT2lpdTJiL3NkTkRCT2ltbVd5ZXFQc0lXVWFpMFA1QWovZHdud1lN?=
 =?utf-8?B?SlB6dTdKMXoxa0UyNHl2N1RzdkQrZWJYbU9neTMvY05UYVlCKytZM3FSMlJo?=
 =?utf-8?B?cmtETVYzdnpaWUtRMWlpZU5jSytaa3dRWlNvcUhuOTB5UjQ2TXRJd1FsdDBl?=
 =?utf-8?B?OTdKR3dvYkw5ZWs4K0tSSndPM20rMlEwVjRwOG5DN1NVVmQrVlhXcUxnM3Zx?=
 =?utf-8?B?bUVVUCt4WGxnUk9qa2lXV29YVm1IdlJaY1V2cFpuRkYzUlhOcHFaaWRjZEp2?=
 =?utf-8?B?U0VsY1dMalFHSGxTVTdaN0RKUW93TzhUNk95NVRxQWJMOHB2VkpaRkVrMWZG?=
 =?utf-8?B?QnVoVXpzR1poNDVHZ2lwaVpKd3oxVGRSVGd3OUxSQmhzVVFBejNPTjJkQVE1?=
 =?utf-8?B?QXh2bGdJR1FJVWphL0lYM0NJRStaYXZaTmVONHpWMGt4T01kM3BzZzBKcUx5?=
 =?utf-8?B?cVpheE9aTndtTzQwVXlKQk9OKzlsZlczVWxzV21IaVhSc2JiUHRZai84QUJq?=
 =?utf-8?B?Z0RsRFp6MGxNL1NhbXBsZHZKOWc5Y3pNV29ISWdITUFtaUx1NUJERFJpSFlI?=
 =?utf-8?B?OVNNTlZoMm1rSHNtc2J2aC9nTHp4cHFlNHg0c2ZFd1VSNEM0UjBtR1dDQ1Nq?=
 =?utf-8?B?dXRMVHYwdEZCS0pRbXdJMjlmK3FVL0xPM3BFbTZXR1h3bTVaL01sQURNYmhQ?=
 =?utf-8?B?RndrUEJneDJOVVppL2RaQXBsNmE0c1VPWHlIeGRJeS9uZ25Pc3lOVy95S05h?=
 =?utf-8?B?bVRXV3pidlEyRlpub3dEYzhXMEFNSXZJTjV2bzNTUmhBRTNaOHYzbFFBY0dW?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e498b03-161d-4e38-441a-08dd355d6db5
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 12:09:14.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWhrHW03Lo2nP4nCYDBkoMtWecYImc0X61S1Q/NCUE0SU13F6UuWwUfo97rstK54oNfPmDVJYtOlC5yGz4Tp4FKnmJPgNzrorm/icFmwGZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_040926_391194_A4D8E5EC 
X-CRM114-Status: GOOD (  26.57  )
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

CuWcqCAyMDI1LzEvMTUgMTk6NDcsIEppZWJpbmcgQ2hlbiDlhpnpgZM6Cj4KPiDlnKggMjAyNS8x
LzE1IDE4OjM2LCBKaWViaW5nIENoZW4g5YaZ6YGTOgo+Pgo+PiDlnKggMjAyNS8xLzE1IDE2OjM2
LCBKZXJvbWUgQnJ1bmV0IOWGmemBkzoKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9u
IFdlZCAxNSBKYW4gMjAyNSBhdCAxMDo1NiwgSmllYmluZyBDaGVuIDxqaWViaW5nLmNoZW5AYW1s
b2dpYy5jb20+IAo+Pj4gd3JvdGU6Cj4+Pgo+Pj4+IOWcqCAyMDI1LzEvMTQgMjI6MDUsIEplcm9t
ZSBCcnVuZXQg5YaZ6YGTOgo+Pj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pj4KPj4+Pj4gT24g
VHVlIDE0IEphbiAyMDI1IGF0IDE5OjIwLCBKaWViaW5nIENoZW4gCj4+Pj4+IDxqaWViaW5nLmNo
ZW5AYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gK01PRFVM
RV9ERVNDUklQVElPTigiQW1sb2dpYyB0byBjb2RlYyBkcml2ZXIiKTsKPj4+Pj4+Pj4+ICtNT0RV
TEVfQVVUSE9SKCJqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20iKTsKPj4+Pj4+Pj4+ICtNT0RVTEVf
TElDRU5TRSgiR1BMIik7Cj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL21lc29uL3Q5
MDE1LmMgYi9zb3VuZC9zb2MvbWVzb24vdDkwMTUuYwo+Pj4+Pj4+Pj4gaW5kZXgKPj4+Pj4+Pj4+
IDU3MWY2NTc4OGM1OTIwNTBhYmRjYTI2NGY1NjU2ZDRkMWE5ZDk5ZjYuLjJkYjFjZDE4Y2YyY2Vh
NTA3ZjNkNzI4MjA1NGUwM2Q5NTM1ODY2NDggCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gMTAwNjQ0Cj4+
Pj4+Pj4+PiAtLS0gYS9zb3VuZC9zb2MvbWVzb24vdDkwMTUuYwo+Pj4+Pj4+Pj4gKysrIGIvc291
bmQvc29jL21lc29uL3Q5MDE1LmMKPj4+Pj4+Pj4+IEBAIC04OSwxMCArODksNyBAQCBzdGF0aWMg
c3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciB0OTAxNV9kYWkgPSB7Cj4+Pj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWluID0gMSwKPj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19tYXggPSAyLAo+Pj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhdGVzID0gU05EUlZfUENNX1JB
VEVfODAwMF85NjAwMCwKPj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZvcm1h
dHMgPSAoU05EUlZfUENNX0ZNVEJJVF9TOCB8Cj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFIHwK
Pj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgU05EUlZfUENNX0ZNVEJJVF9TMjBfTEUgfAo+Pj4+Pj4+Pj4gLSBTTkRSVl9QQ01fRk1UQklU
X1MyNF9MRSksCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0g
KFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFIHwKPj4+Pj4+Pj4+IFNORFJWX1BDTV9GTVRCSVRfUzMy
X0xFKSwKPj4+Pj4+Pj4gQWdhaW4sIG1peGVkIHVwIGNoYW5nZXMgd2l0aCB6ZXJvIGp1c3RpZmlj
YXRpb24uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgZHJvcHMgUzggYW5kIFMxNiBmb3JtYXQgc3Vw
cG9ydCBmb3IgdGhlIGV4aXN0aW5nIFNvQ3MgCj4+Pj4+Pj4+IChzdWNoIGFzIEdYTCkKPj4+Pj4+
Pj4gd2hpY2ggaXMga25vd24gdG8gd29yayBhbmQgYWRkIFMzMiBzdXBwb3J0IG9uIGFuIEhXIGRv
Y3VtZW50ZWQgCj4+Pj4+Pj4+IGFzIDI0Yml0cwo+Pj4+Pj4+PiBvbmx5LiBDYW4geW91IGV4cGxh
aW4gPwo+Pj4+Pj4gZm9yIGcxMmEsIHNtMSBldGMsIGl0IGlzIHVzZSBuZXcgYXVkaW8gaXAsIEdY
TCBpcyBvbGQgaXAsCj4+Pj4+IElmIHRoZXJlIGFyZSBjaGlwcyBkaWZmZXJlbmNlIHdlIGRpZCBu
b3Qga25vdyBhYm91dCwgdGhlbiB5b3Ugc2hvdWxkCj4+Pj4+IGludHJvZHVjZSB0aG9zZSBkaWZm
ZXJlbmNlLCB3aXRob3V0IGJyZWFraW5nIGV4aXN0aW5nIHN1cHBvcnQgLQo+Pj4+PiBpbmNsdWRp
bmcgZm9yIEdYTCwgd2hpY2ggaXMgd2hhdCB5b3UgZGlkIElJVUMuCj4+Pj4+Cj4+Pj4+PiB0aGUg
bmV3IGlwIG5vdCBzdXBwb3J0IDI0IGJpdCwKPj4+Pj4gQXJlIHN1cmUgYWJvdXQgdGhhdCA/IHRo
YXQgY29kZSBoYXMgYmVlbiB0aGVyZSBmb3IgYSB3aGlsZS4KPj4+Pj4KPj4+Pj4gSWYgc20xIGRv
ZXMgbm90IHN1cHBvcnQgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUsIHlvdSBzaG91bGQgYSBmaXgg
Cj4+Pj4+IHVwIHBhdGNoIGZvcgo+Pj4+PiB0aGF0LCB3aXRoIHRoZSBwcm9wZXIgIkZpeGVzOiIg
dGFnLCBob3cgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIGFuZAo+Pj4+PiBleHBsYWluaW5nIHRo
ZSBmaXguCgpBdCBmaXJzdCBJIHRob3VnaHQgeW91IHNhaWQgMjRiaXQgaXMgczI0XzNsZSwgYmVj
YXN1ZSBvZiB0aGUgZmRkciBjYW4ndCAKZ2V0IGl0LAoKc2/CoCBzcGVuZCBhIGxvdCBvZiB0aW1l
IHRyeWluZyB0byBleHBsYWluIGl0CgpJIHRoaW5rIGl0IG1heSBiZSBiZWNhdXNlIG9mIHRoaXMg
ZGlmZmVyZW5jZSB0aGF0IHdlIGFyZSBub3QgZm9jdXNlZCBvbiAKdGhlIHNhbWUgcHJvYmxlbQoK
eWVzLCB3ZSBzdXBwb3J0IHMyNF9sZSzCoCB0aGUgaW50ZXJuYWwgY29kZWMgYWxzbyBwcm9jZXNz
IGl0IDI0IGJpdCBvZiAzMiAKYml0LAoKaWYgd2Ugc2VuZCB2YWxpZCAzMmJpdCBkYXRhLCBpdCBv
bmx5IHByb2Nlc3MgMjRiaXQsIGRpc2NhcmQgOCBiaXQgZGF0YSwgCmlmIHRoaXMgYmVoYXZpb3Ig
c2hvdWxkIGJlIHByb2hpYml0Cgp3ZSB3aWxsIGZvbGxvdyB0aGlzIHJ1bGUKCj4+Pj4gbWF5YmUg
dGhlcmUgYXJlIHNvbWUgZ2FwICwgd2Ugc3VwcG9ydCBTTkRSVl9QQ01fRk1UQklUX1MyNCwgbm90
IAo+Pj4+IHN1cHBvcnQgdGhlCj4+Pj4KPj4+PiBTTkRSVl9QQ01fRk1UQklUX1MyNF8zTEUswqAg
Zm9yIFNORFJWX1BDTV9GTVRCSVRfUzI0Cj4+Pj4KPj4+PiBpdCBpc8KgIFNpZ25lZCwgMjQtYml0
ICgzMi1iaXQgaW4gbWVtb3J5KSwgbGl0dGxlIGVuZGlhbiAsIHRoZSBhdWRpbyAKPj4+PiBkbWEK
Pj4+PiBidXNydCBpcyA2NGJpdAo+Pj4gSXQgbWFrZXMgYWJzb2x1dGVseSBubyBzZW5zZSB0byBk
aXNjdXNzIG1lbW9yeSBsYXlvdXQgZm9yIHRoZSBjb2RlYy4KPj4+Cj4+Pj4gaXQgY2FuIGdldCB0
aGUgZnVsbCBkYXRhLiB3ZSBzZW5kIHRoZSAzMiBiaXQgZGF0YcKgIG1jbGsgPSAzMmJpdCogCj4+
Pj4gNDhrICo0LAo+Pj4+IHVzZSB0aGUgY2xrIHRvIHNlbmQKPj4+Pgo+Pj4+IHRoZcKgIFNORFJW
X1BDTV9GTVRCSVRfUzI0LMKgwqAgdGhlIGhhZHdhcmUgYWx3YXlzIHNlbmQgdGhlIDMyYml0IGRh
dGEKPj4+IE5vIGl0IGRvZXMgbm90LiBJdCBzZW5kIDI0IGJpdHMgb2YgZGF0YSBvdmVyIGEgMzIg
Yml0cyBwaHlzaWNhbCB3b3JkIAo+Pj4gd2l0aAo+Pj4gOCBiaXRzIGlnbm9yZWQuCj4+Cj4+IFRo
ZSBvcmlnaW5hbCBpbnRlbnRpb24sIHdlIHBsYXkgMzJiaXQgZGF0YSBmcm9tIHRkbW91dCwgaXQg
cGxheSAKPj4gZXJyb3IsIHNvIHdlIGFkZCB0aGUgczMyX2xlCj4+Cj4+IGZvciB0ZG1vdXRhICxp
dCBjYW4gYmluZCBNdWx0aXBsZSBjb2RlYywgb25lIGNvZGVjIGlzIHRoZSBpbnRlcm5hbCAKPj4g
Y29kZWMsCj4+Cj4+IG90aGVyIGlzIGV4dGVybmFsIGNvZGVjLCB0ZG1vdXQgY2FuIHNlbmQgdGhl
IGRhdGEgdG8gaW50ZXJuYWwgY29kZWMgCj4+IGFuZCBleHRlcm5hbCBjb2RlYyBmcm9tIHRoZSBv
dXRwdXQgcGFkCj4+Cj4+IGZvciBleGFtcGxlLCB0ZG1vdXQgc2VuZCA0IGNoLCAyIGNoIGlzIHNl
bmQgdGhlIGludGVybmFsIGNvZGVjLCAyIGNoIAo+PiBzZW5kIHRoZSBkYXRhIHBhZAo+Pgo+PiBp
dCBhcGxheSBlcnJvciwgZHVlIHRvIHRoZSBpbnRlcm5hbCBjb2RlYyBmb21hdCBwYXJhbWV0ZXIg
bGltaXRpbmcgCj4+IGNvbmRpdGlvbgo+Pgo+PiBUaGVyZSBpcyBhIGNvbnRyYWRpY3Rpb24gaGVy
ZSzCoCBDb25zaWRlcmluZyBvdXIgaW50ZXJuYWwgY29kZWMgY2FuIAo+PiBwcm9jZXNzIHRoaXMg
aXQsIGRyb3AgOGJpdCwgMjRiaXQgdmFsaWQKPj4KPj4gdGhlcmVmb3JlIHNvZnR3YXJlIGNhbiBz
ZXQgczI0X2xlL3MzMl9sZSwgc3RpbGzCoCB3b3JrIG9rIGZvciAKPj4gaGFyZHdhcmUsIHNvIE11
bHRpcGxlIGNoIGNhbiBzdXBwb3J0IGZvciBpbnRlcm5hbCBjb2RlYyBhbmQgZXh0ZXJuYWwgCj4+
IGNvZGVjCj4+Cj4+Cj4gYWRkIHRoZSBzMzJfbGUgZm9ybWF0IGZvciB0aGUgdDkwMTUuYyzCoCBp
dCBjYW4gcmVzb3ZsZSBNdWx0aXBsZSBjb2RlYyAKPiBzMzJfbGUgZm9ybWF0IGNhc2UswqAgYWx0
aG91Z2ggaGFyZHdhcmUgb25seSBwcm9jZXNzIDI0Yml0IG9mIDMyYml0LCAKPiBidXQgaXQgY2Fu
J3QgYWZmZWN0IHRoZSBhY29kZWMgaGFyZHdhcmUgd29yaywgaXQgc3RpbGwgd29yayBmaW5lCj4K
PiB1c3VhbGx5IHdlIGFkZCB0aGUgczMyX2xlIGZvcm1hdCBzdXBwb3J0LCBpZiBub3QgYWxsb3cg
dG8gZG8gaXQsIHRoaW5rIAo+IG9mIGl0IGFzIGEgbGltaXRhdGlvbiwgd2UgY2FuwqAgcmVtb3Zl
IDMyYml0IHRlc3QgZm9yIGl0Cj4KPj4+Cj4+Pj4gc28sIGkgdGhpbmsgd2Ugb25seSBhZGQgdGhl
IFNORFJWX1BDTV9GTVRCSVRfUzMyIGJhc2Ugb24gaXQKPj4+IFRoYXQncyB3cm9uZyBpZiB0aGUg
Y29kZWMgZG9lcyBub3QgYWN0dWFsbHkgdXNlIHRoZSBmdWxsIDMyYml0cyAuLi4gYW5kCj4+PiBJ
IGhhdmUgY2xlYXIgaW5kaWNhdGlvbiB0aGF0J3Mgd2hhdCB0aGUgY29kZWMgaXMgZG9pbmcsIG9u
IEdYTCBhdCAKPj4+IGxlYXN0Lgo+Pj4KPj4+PiB3ZSB0aGluayB0aGUgMjQgYml0IGlzIHRoZSBT
TkRSVl9QQ01fRk1UQklUX1MyNF8zTEUsIGl0IGlzIDI0Yml0IGluIAo+Pj4+IG1lbXJveSwKPj4+
Pgo+Pj4+IGR1ZSB0byB0aGUgZG1hIGJ1c3J0IDY0IGJpdCBsaW1pdCwgaXQgY2FuJ3QgYWxpZ24g
dGhlIHNhbXBsZSBiaXQsIAo+Pj4+IGlmIGl0IGlzCj4+Pj4gMjQgYml0Cj4+PiBBZ2FpbiwgbWVt
b3J5IGxheW91dCBtYWtlcyBubyBzZW5zZSBoZXJlLgo+Pj4KPj4+PiBzbyB0aGUgY2xvY2sgY29u
ZmlndXJlIGNhbid0IDI0Yml0IGNsb2NrLAo+Pj4gSSBkaXNhZ3JlZSBhbmQgdGhpcyBoYXMgYmVl
biB0ZXN0ZWQuIElmIHlvdSBoYXZlIGEgdGVzdCBjYXNlIHNob3dpbmcKPj4+IG90aGVyd2lzZSBw
bGVhc2Ugc2hhcmUgaXQuCj4+Pgo+Pj4+IGJ5IHRoZSB3YXksIFdlIGRpc2N1c3MgaW50ZXJuYWxs
eSBmb3IgZ3hsLAo+Pj4+Cj4+Pj4gaXQgYWxzbyBzdXBwb3J0IHRoZSBTTkRSVl9QQ01fRk1UQklU
X1MzMgo+Pj4+Cj4+PiBEb2VzIGl0IHJlYWxseSA/IElmIGl0IGlzIGp1c3QgdG8gaWdub3JlIHRo
ZSA4Yml0cyBMU0IsIHRoYXQgbm90IGEgCj4+PiBzdXBwb3J0Lgo+Pj4KPj4+Pj4+IHVzdWFsbHkg
c3VwcG9ydCAxNi8zMiBiaXQgZm9yIG5ldyBhdWRpbyBpcCAsIGZvciAKPj4+Pj4+IFNORFJWX1BD
TV9GTVRCSVRfUzI0X0xFLAo+Pj4+Pj4gaXQgd2lkdGggPTI0LCBwaHkgPTMyCj4+Pj4+IFllcyBw
aHlzaWNhbCBvZiBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSwgc28gbW9zdCBjaGlwIHN1cHBvcnRp
bmcgCj4+Pj4+IDMyIGJpdHMKPj4+Pj4gd2lkdGggd291bGQgc3VwcG9ydCB0aGlzIFMyNF9MRSwg
dW5sZXNzIHRoZXJlIGlzIHNvbWV0aGluZyBvZGQuCj4+Pj4+Cj4+Pj4+PiBpdCB3YXPCoCB0cmVh
dGVkIGFzIDMyIGJpdCB0byBzZW5kIGZvciB0ZG0sIHNvIHdlIGNhbiBvbmx5IGFkZCB0aGUgCj4+
Pj4+PiBTMzJMRQo+Pj4+Pj4gYmFzZSBvbiBpdCAsIHJpZ2h0ID8KPj4+Pj4gWW91IGFyZSBhc2tp
bmcgbWUgPyBIb3cgYW0gSSBzdXBwb3NlIHRvIGtub3cgPwo+Pj4+Pgo+Pj4+Pj4gYnV0IGlmIHRo
ZSBneGwgbm90IHN1cHBvcnQgdGhlIDMyYml0Cj4+Pj4+IEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSB3
aXRoIGEgREFDIHRha2luZyBpbnB1dCBvbiAzMmJpdHMgcGh5c2ljYWwKPj4+Pj4gaW50ZXJmYWNl
IGFuZCBpZ25vcmluZyBzb21lIGJpdCBvbiBwcm9jZXNzaW5nLgo+Pj4+Pgo+Pj4+PiBJZiB0aGF0
J3Mgbm90IHRoZSBjYXNlLCBwbGVhc2Ugc2VuZCBhIHByb3BlciBmaXggY2hhbmdlIHdpdGggc29t
ZSAKPj4+Pj4gZXhwbGFuYXRpb24KPj4+Pj4KPj4+Pj4+IHdlIG5lZWQgYWRkIG5ldyBzbmRfc29j
X2RhaV9kcml2ZXIgdDkwMTVfZGFpX3M0ID8KPj4+Pj4+Cj4+Pj4+IElmIEkgdW5kZXJzdG9vZCBj
b3JyZWN0bHkgZm9ybWF0IGRlcGVuZHMgb24gdGhlIGNoaXAgYW5kIG5lZWRzIHRvCj4+Pj4+IGFk
anVzdGVkIGluY2x1ZGluZyBmb3Igc20xLgo+Pj4+Pgo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oCB9LAo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAub3BzID0gJnQ5MDE1X2RhaV9vcHMsCj4+
Pj4+Pj4+PiDCoMKgwqAgfTsKPj4+Pj4+Pj4gLS0gSmVyb21lCj4+Pj4+IC0tIAo+Pj4+PiBKZXJv
bWUKPj4+IC0tIAo+Pj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
