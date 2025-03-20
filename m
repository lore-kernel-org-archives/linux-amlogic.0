Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC601C28B30
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Mar 2025 08:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz+kChsvMxKYKOzwVJi1v1oVbFB3TcpYqyCCcUppJZk=; b=o2kNhucvK6lMkK8XqDoX2ZLv8v
	wGHKHvNNibd+Y0muxXC9IbktQuxkQw6wl6QGAKPWL5QrsmhpILqCTFXlxHk+DLDSIE2+iso+GtQNv
	XnmERdrgL3gxYpTCKGkIVfIJuZ98C2r6c5eqfZfrovUZ73FZzFnLYrXf9toy0iX9Mxkyubo4Nsawp
	Lm15Mq163gLWnpVcW+WoptW9pUDPFtnM0g2ptP3ASwNCmDRoIC64kWlg4zA9FV3IneL6lwtLPH3Lj
	+3Xf/5NYGPCKPv4VKSu/iAeDrIukLg3zjaJygdDH938fHa4Z1GwxmYfXQmCMKr0CpnK5ugCqFoD9x
	gHjv0CqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBiu-0000000BcV8-1FY8;
	Thu, 20 Mar 2025 08:57:56 +0000
Received: from mail-tyzapc01on2072b.outbound.protection.outlook.com ([2a01:111:f403:2011::72b] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBeh-0000000BbYY-3SMG;
	Thu, 20 Mar 2025 08:53:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyADzLFrTOX5HXA28+UtgGGsOkNBY/C/Wvn2ohimpoNszs3IQIdhEe641VsJ5pfs7FeQLsrb3WXYFZkjC5Isz1HNTPtqkpklq9moeAjERODVwCQ+WiWaNeMuAQrra9etLClYk/pICoGt15X6yPchgFffosUlboKNmZPSRZULnQn/RDmwxq+uCSVESGTaZnN1NqaqgF81YlJDqhJIWTjFrIYt5crfaKvAQ7mbPUOQP3JY3aMnrHl7O+TbgbshGC2c6guu+fVDmGmq6mpiN1j3F54ncUt2Ybr6FEvEExC1i7x9FobHcyNtfqsfZc50UOY5UEXtb1KyK0GFrtJogR5o/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QuVi5m8TMQr1+OfyBDP3z2m8Fi/bOwH9zDg5M72r78=;
 b=ZPsmz5tgCFymbmtGSvBCmXwaKF7mgFXFzJtgtiKMomOINpoomF9TErx+zMh4gYDe/aCn+vyUYAGbiV9YWbE8Kd8yS4KT8GfqfYBAwNVIG//HuBS1c7lQRCekpZHSrCQBUSibLDRWl8WTwP4JKDURC4pgoOPcj43QEpQzoHGdiSPC66x9ohWbMLEMmN6XkVOwJEaxweN+ooCh1NjnQfyiQ96T9TcW6ln4ZkbBdqLJJuxMPoEnIpKUwABmc+HJ1+fPNT+izjbC5unlyIIeGtaBUadXhH3IHJu2NV2GXr8NLlZrynEWX8kvxZE/3neXqe5xIfmIhl8vR2lZjiEx/FhlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QuVi5m8TMQr1+OfyBDP3z2m8Fi/bOwH9zDg5M72r78=;
 b=RTE2HIWTLFTrH8mOoyN/k0jWLzYroZQKhjkcKjkFe5C211GsUjWuzYIJ/8qwcsZf9RdYjqgfyxxh2WigmC/0vo/R4rCccXiADYkufzq7LTf5OtWWhrE12YCYGizWhFCnu5remUNn5MKYsrTCF5bBaEJmQ6Pc1Sqw2XCHGDUFN4fz4kNBmy2mqVS/jlNi8rLanr1zf6TMDKKNe0MShLCKfW/qtBtV538QBY+VlCxZEZMA4GtOPI4PKJZ3taoyqAmPBwhpW9CFxQ9gNZrzJhf7VtqYNexHU3Ws+Kzq2NRD6tdLf4AeVlqeLLkR7mjP7CtdG/jGA/ESBTEIUboAyUv8sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by KL1PR03MB7717.apcprd03.prod.outlook.com (2603:1096:820:e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 08:53:24 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%7]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 08:53:24 +0000
Message-ID: <1d2f7290-a126-4e6a-a4be-17320ac8e3b9@amlogic.com>
Date: Thu, 20 Mar 2025 16:53:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] ASoC: meson: g12a-toacodec: Add s4 tocodec driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
 <20250319-audio_drvier-v4-4-686867fad719@amlogic.com>
 <1jfrj82ioj.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jfrj82ioj.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:4:7c::33) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|KL1PR03MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f7aabc-ace8-4eb3-c421-08dd678cac88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1JIRWN3dnhVQ0dYWFA3NXpSN1dZdkpNa3pWMEpPcmN4WDAzdG01RmIwcmZN?=
 =?utf-8?B?YjM0aGdNMFkzTHFEdmdlN0xyMW54OE1xNmNLQ1pyVTRNaVZyRTc2VUg2VDRV?=
 =?utf-8?B?bCtFeXZVTEsrSGUwQXFQYzJjc29KaXJXMk1HLzZjc2JjVmpwQ2praXBhUTZ4?=
 =?utf-8?B?K2lnanhBNXNyTU4wdjVRU0lCa2d5MDdwNU9UaFYrZS91UFU2T3h0Q2I0VGZj?=
 =?utf-8?B?K2kxUzIrZG5QaHF1YWU3ai8yMm9Jb1BQQUs3eVhoTHZKVzFCa3BvLzdBS2pX?=
 =?utf-8?B?UUZKVkErdGt0OGU3Z0lueHFkdGNCK0xMckNIVXJRRlh2RkNYQzcvUGtVZU1l?=
 =?utf-8?B?dEI1OFY1NHpsSndkQ0d0M0ZUTWFYT0hhQWNOSEpyLzNGODRjbEh1a1kyLzdV?=
 =?utf-8?B?dm9QVlhsejRWVVZOWHh1ekZVQTgyOGxNQkY5YVdSTHdqVmYwU0VVM0dJeE80?=
 =?utf-8?B?UUNyUUJiVmd5UHcycmdYRS9ZNFVuOTQ1eS9vRTBTajNtMFZDY1RzYnp0REJw?=
 =?utf-8?B?ZVN2NkZ6OFBVYVdJU0lJTnBkNW5Ealc3djJ4Z0RrK3BXVFRHaUIzbWtqOFlv?=
 =?utf-8?B?OXh5bVppc0N3dVcyY0s4TWtjcldJaUV6TFIrYkI5SEVDTkZxRWgyUDZScmZV?=
 =?utf-8?B?bEptWG9xZkgyU1ZESWNUeFltNUhYZWI3TmUrZTdwTkcwbE5DT01tVU5vYzFL?=
 =?utf-8?B?K2dKZEZEa0JvYTlvelhDWTI0ZTk2WjdZMHVyWWJOVUxQVlRvRHlUdDBoVGpF?=
 =?utf-8?B?WGZuRHFzNWk5alM0VStHMDdjVEttckNlaVdEVWJ1VERqVjFCSXNlclBRSGIw?=
 =?utf-8?B?cjVYZVJnRjNXNWdCdkpmNXREVzAyQjFEQ1JraU8zaXhCQjlLM2F0N0h5bGZC?=
 =?utf-8?B?NjM1WUY3KzZxclVMTnZMd3RpRTEwWkx4SlkxaFBHelhJY1dUcWw4bmxPMjdG?=
 =?utf-8?B?S2drV0pTNi9BRGFRamU3MlVGV3Q1aXZTSy9jeDJJODBDRGJsSlZSTFFMeERT?=
 =?utf-8?B?WnVYVHFKMGxKYVg4VE1MVFNPby9ReHF5WnhuT3lqWnlnQXI5Wm01QWxuMXFs?=
 =?utf-8?B?SnpoYkdOclVNSWNmb0tJSDlUOXVEQ0gvM0wvK2ZCa0ZxREtMOFRia0ZHR2VZ?=
 =?utf-8?B?VnVUMTg4Nk1heTJKVmo1Y0xEOEJwN0pCTjNUMzAyTkhlSUZLY3VIZlhyVlF0?=
 =?utf-8?B?ZjVuVk96NmFndVVrTENiMHFHR2U5WjJDV1FuYnNHTmtzc1E2NmxQYTVzbzhR?=
 =?utf-8?B?MTd6N05oTkFnSUt0RWl5UDBYc2VINmx6YmVENU1VSE1YOGp5UkMvWk9XMGg0?=
 =?utf-8?B?WHdGWXFqTTl6NGlvUTJaZWtDSUJubnhkL0VRekd4aU1kckVtVEoyNUF2NVhV?=
 =?utf-8?B?M0RwcEV4NjY5V3Y3czY2TXg0R1JlNFlnU1hGbUxwRjRHRENHcEtxVG5jWnRy?=
 =?utf-8?B?TTZid01MMm1xcGM2a1Z1R3J2SXpsbzQxQkg5U0M3alNIdzZTOEpzZVJkZytD?=
 =?utf-8?B?MnA3T05FcWkwb2lQbndvQWZaN0VqZzdqSnkxWTJabndrczZselFNWERrTVU1?=
 =?utf-8?B?MGVZZW1ZMnN4dTFvbVNpdEp1eXFZUW0xVFB4TG0vTVRxb0oxeXA0R2hRMjQ2?=
 =?utf-8?B?T3g1cnpZTms3dnVjOVdLbTQ2QnZDTUtUTmJVWFB3OVhMZ2tTQWZnOHQwMWhQ?=
 =?utf-8?B?ZDVyMnJqcHNHckdvM3ZaUVV3dmhUZDIwRkJSd3d5THJtVEdkZHdsYWNaNTB4?=
 =?utf-8?B?SmZhNVNucDRYZXhZQktGWlE3SkFxRzZBbUZkWm50b2lLZFNmQm81Qy9hS3NX?=
 =?utf-8?B?L0tSdkU1OC9KdkE1SXFwMTVDU2NKTXpUdjNSb2w0eExRQmtWc3dPSjVvaHRN?=
 =?utf-8?B?bXNEUGJIYkFPbWdQbG8zam00NjVxcWprK3VLdlNXUkZPS05sOVpNYUphUTNQ?=
 =?utf-8?Q?7Yrn3E6CENo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dqSnZZOGdHUlJST1FuTkRZM1BhZy9rdmh2OFJ2ZGVjVnd3cHJZQytHYTgy?=
 =?utf-8?B?dlZnYURPVnFNdGZDV2tUbG5yNVdjS3BJS2M3RG82SDN5c0FXT1RBZlYxMkVH?=
 =?utf-8?B?eTJORG5BczU4NjF2WG9VdUtHRC9QckNMNVNGNzNxWjJzOGswTUhscTNQQVRI?=
 =?utf-8?B?TXdKUkFhWTdOOXozRHZNWk1vM3AxM0ZiQ2RQbUdPTWpNOXlqaTZueHY1ZFdj?=
 =?utf-8?B?WThvWWJhWmJKczRyZFFPYllkYjZwZmpaalhPMkl4WmJJWVZWa0Y0dlZkNk1J?=
 =?utf-8?B?SDZxbUpFSzFjRzR2NnhJRzBNNGNJZ2V4YWhOcVZaSXFTSTE0eVFIZGw3eU5E?=
 =?utf-8?B?MnJFTGJVbExFTVJQQThMZ0ZkTUt1MldhSldBQ25yRzIyanVjRVN5V0dGam5j?=
 =?utf-8?B?OTgzUnMvM1hNNXdpU29VdVVlSk8vcXpUYU1pK2FOMEFrZnVvMGVJTExTaXVD?=
 =?utf-8?B?YnFtZ0ZGQ3BNLzVQU2ZVdHVtQ1lRc3A0SGNScEp1QisyUEdlZEt6bm5OYzZS?=
 =?utf-8?B?NmZvVWwvWjJOOVFWR2Iyc1FxN09OeTQwMGx1elllMCtXRFVMMTZmbGJnOCtk?=
 =?utf-8?B?Zm1rRlVrVWh0YVlVTDRFWWZSMi9MTmgxQldVaEt3SzQxcEZ4elJHbm9MdkNM?=
 =?utf-8?B?SEZHSE5TVWlURGlSSWZkQjZPb25iUGJsQTBSeEM5andYOFd6VzlVNmRNaHN3?=
 =?utf-8?B?M0gvV3NFTGNHWDhFYUtyUUtuNjQ4Q2k3TzhERW1BSGZFYXpvYUd4N0ptVEQz?=
 =?utf-8?B?ay9ndmNhT1lGajJrYTFyb1F6Rm1LSzdwWkMvTW1lejBXZkdsNHpmRWd4Vk9D?=
 =?utf-8?B?U0NDUHlROHYzWEZyNnQ2NjdwK2pWeXU5WUFnclpGY1NVTXN2aGhJZVBlQVdH?=
 =?utf-8?B?ejFObnc3UHZRbzRxWWZDQ3pGaVdVOXFyeHk0aXZEejhBTDZNQTFHcUNYRkI4?=
 =?utf-8?B?T0ZHOGJsUG5XUzNZUnBoQWczQ2orVXRYMXZ5SEpEOG16RkJxRDZWUUZYYlZo?=
 =?utf-8?B?MlRCbDJHK0hEUUYzY3llb0JIWmlibVkwa2ZTNFJvVkkzZGxER21ubXpnTVJ3?=
 =?utf-8?B?eW43ZHlvbUZwMXlDTlZzUTRqQXcwWlA5cVJGWGEraFRLZWlwNkNPb1JFZHNS?=
 =?utf-8?B?VDEzMW5zcXlGTmd0bGRhbVdiU0NTU0pvSUJFQUZXdzg2WmNrb1J0NExndGRs?=
 =?utf-8?B?K0dTcHdOeXR2YS8xT0N1cVd6NEwvNko4QVNCSDM1aTJVckhrMU55Z0JQNndG?=
 =?utf-8?B?MkZuQkdTcVA0UUNSVGc0RkZKV2dsaEdxalBCNDRwbkFHcUgxZ1plOGZmc2N5?=
 =?utf-8?B?Y0U1MUhNOUNWWXhYSnlEWUtwWllZeWpTL2hmZUpUVk9rUzZMM2QrRmtGTVJp?=
 =?utf-8?B?cnMxYU94dzNPY05MNUhFSnRnUDRtekRuRVVkQTlBNWJ0ejVPK0tnZUg3Q2dL?=
 =?utf-8?B?dHJ1akkxVUdTNUtUV3ZBRlFCZGovOFBFa3pCM2k0N2RUTjFDVzg5YTZHOWpC?=
 =?utf-8?B?MFp2bW4weC9lckJjbXduSVQrbXNWN01BY3c2MlFxYWtPem5EeUpKSHlaaEtX?=
 =?utf-8?B?MWZ4TGRYcEVpS1VjZUFiSDFXc0VWQXplWENKdEVIZlRMSElJQWQ0dHZGRkFF?=
 =?utf-8?B?L1AxRjR6VjBYbGx0V2NEZXB6bXNxUU04eEROU2RQSUxUa2R2L0lIclZOOTkz?=
 =?utf-8?B?cUxxcXBPK3RGdHN3VE5nTHBIZ2ZxelBYaUhac2RiMC9LRlcwNHJTRVU2MWVT?=
 =?utf-8?B?ajRYSzhFenJ4ZTB4OWNLSWFOYVFCdm5YOEdDbGNWbHBNU2dxM0FhRFlYa1B1?=
 =?utf-8?B?SUVoL2tjK1FlWWNnb1Rya0Z4bkR0a29RWU1lWkhRL2pZSDMxNHFuSjZ1ZlRk?=
 =?utf-8?B?MzBmWGk0ZEtUZHNjeXkxUHpTeFoyM0h6cnFrMVlLLzIza21YelBIWDFlK0o2?=
 =?utf-8?B?WkNNOGZUYm54amtOQ1I1OFQ2UTc2L1RmSkR3dytNMkR6ZE1ZWEd6b0hYSHl5?=
 =?utf-8?B?Q3lCUzladXpvWWVac0RBcmVQM0ZLd2NPVzNyeld6bks4UWN4RE55TVdSbmtr?=
 =?utf-8?B?UUM3RG9sRFR1aUw3K2w5UTk2eThUN0hZWWs0VzV6eVNRcFQ0NDhIdGNwMEFS?=
 =?utf-8?B?WVZYNHhTdmwxQTZTWGdOTjBhR0JoR1EwRHZCYTlVd2hIc3N0aFQ3RnY5dVZr?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f7aabc-ace8-4eb3-c421-08dd678cac88
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 08:53:24.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSC2wffyfKHNsZi18UofsrhPQgatYx4yY5DU4g5ZV27wb0XWv2aGIbdgfRU6V8foDxto2hbAvxSRYKBvc3qNP82f9z46TowFse5fj1S9p0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7717
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_015335_982578_0BE6A6FB 
X-CRM114-Status: GOOD (  13.77  )
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

CuWcqCAyMDI1LzMvMjAgMTY6NDYsIEplcm9tZSBCcnVuZXQg5YaZ6YGTOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gT24gV2VkIDE5IE1hciAyMDI1IGF0IDE1OjA0LCBqaWViaW5nIGNoZW4gdmlh
IEI0IFJlbGF5IDxkZXZudWxsK2ppZWJpbmcuY2hlbi5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3
cm90ZToKPgo+PiBGcm9tOiBqaWViaW5nIGNoZW4gPGppZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbT4K
Pj4KPj4gUzQgdG9jb2RlYyBzdXBwb3J0IDggbGFuZSB0byBpbnB1dCwgSXQgbmVlZCB0byBlbmFi
bGUKPj4gYmNsayBhbmQgbWNsayBjb250cm9sIGJpdCB3aGVuIHdvcmsKPj4KPj4gU2lnbmVkLW9m
Zi1ieTogamllYmluZyBjaGVuIDxqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiAg
IHNvdW5kL3NvYy9tZXNvbi9nMTJhLXRvYWNvZGVjLmMgfCA0NiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vZzEyYS10b2Fjb2RlYy5jIGIv
c291bmQvc29jL21lc29uL2cxMmEtdG9hY29kZWMuYwo+PiBpbmRleCA1MzFiYjg3MDdhM2VjNGM0
NzgxNGQ2YTA2NzZkNWM2MmM3MDVkYTc1Li44OGY5YWRhYmIzYjVkN2Q4ODgxZmExMTBmMWQwZDUx
ZTlhYzljNjBlIDEwMDY0NAo+PiAtLS0gYS9zb3VuZC9zb2MvbWVzb24vZzEyYS10b2Fjb2RlYy5j
Cj4+ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi9nMTJhLXRvYWNvZGVjLmMKPj4gQEAgLTQxLDYgKzQx
LDkgQEAKPj4gICAjZGVmaW5lICBDVFJMMF9CQ0xLX1NFTF9MU0IgICAgICAgICAgNAo+PiAgICNk
ZWZpbmUgIENUUkwwX01DTEtfU0VMICAgICAgICAgICAgICAgICAgICAgIEdFTk1BU0soMiwgMCkK
Pj4KPj4gKyNkZWZpbmUgQ1RSTDBfQkNMS19FTkFCTEVfU0hJRlQgICAgICAgICAgICAgIDMwCj4+
ICsjZGVmaW5lIENUUkwwX01DTEtfRU5BQkxFX1NISUZUICAgICAgICAgICAgICAyOQo+PiArCj4+
ICAgI2RlZmluZSBUT0FDT0RFQ19PVVRfQ0hNQVggICAgICAgICAgIDIKPj4KPj4gICBzdHJ1Y3Qg
ZzEyYV90b2Fjb2RlYyB7Cj4+IEBAIC0xMjksNiArMTMyLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc25kX2tjb250cm9sX25ldyBnMTJhX3RvYWNvZGVjX291dF9lbmFibGUgPQo+PiAgICAgICAg
U09DX0RBUE1fU0lOR0xFX0FVVE9ESVNBQkxFKCJTd2l0Y2giLCBUT0FDT0RFQ19DVFJMMCwKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDVFJMMF9FTkFCTEVfU0hJRlQsIDEs
IDApOwo+Pgo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IHM0X3RvYWNv
ZGVjX2Nsa19lbmFibGUgPQo+PiArICAgICBTT0NfREFQTV9ET1VCTEUoIlN3aXRjaCIsIFRPQUNP
REVDX0NUUkwwLAo+PiArICAgICAgICAgICAgICAgICAgICAgQ1RSTDBfQkNMS19FTkFCTEVfU0hJ
RlQsIENUUkwwX01DTEtfRU5BQkxFX1NISUZULCAxLCAwKTsKPj4gKwo+IEkgdGhpbmsgSSByZW1l
bWJlciBjb21tZW50aW5nIG9uIHRoaXMgYWxyZWFkeS4KCkhJLCBKZXJvbWUKClRoaXMgbGluZSBp
cyBvbmx5IGRlZmluZWQgYW5kIG5vdCB1c2VkLCBpdCBzaG91bGQgYmUgZGVsZXRlIGluIG5leHQg
dmVyc2lvbgoKV2UgcHV0IHRoZSBlbmFibGUgb2YgYmNsayBvbiB3aWdldCBpbiBkYXBtIHdoZW4g
ZGFwbSBwb3dlciBvbiwgaGVscCB0byAKcmV2aWV3Cgp0aGlzIG1ldGhvZAoKK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCBzNF90b2Fjb2RlY193aWRnZXRzW10gPSB7Cisg
ICAgIFNORF9TT0NfREFQTV9NVVgoIlNSQyIsIFRPQUNPREVDX0NUUkwwLCBDVFJMMF9CQ0xLX0VO
QUJMRV9TSElGVCwgMCwKKyAgICAgICAgICAgICAgICAgICAgICAmc20xX3RvYWNvZGVjX211eCks
CisgICAgIFNORF9TT0NfREFQTV9TV0lUQ0goIk9VVCBFTiIsIFRPQUNPREVDX0NUUkwwLCBDVFJM
MF9NQ0xLX0VOQUJMRV9TSElGVCwgMCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAmZzEyYV90
b2Fjb2RlY19vdXRfZW5hYmxlKSwKK307CisKCj4KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHNu
ZF9zb2NfZGFwbV93aWRnZXQgZzEyYV90b2Fjb2RlY193aWRnZXRzW10gPSB7Cj4+ICAgICAgICBT
TkRfU09DX0RBUE1fTVVYKCJTUkMiLCBTTkRfU09DX05PUE0sIDAsIDAsCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICZnMTJhX3RvYWNvZGVjX211eCksCj4+IEBAIC0xNDMsNiArMTUwLDE5IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCBzbTFfdG9hY29kZWNfd2lk
Z2V0c1tdID0gewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZzEyYV90b2Fjb2RlY19v
dXRfZW5hYmxlKSwKPj4gICB9Owo+Pgo+PiArLyoKPj4gKyAqIEZJWE1FOgo+PiArICogT24gdGhp
cyBzb2MsIHRvY29kZWMgbmVlZCBlbmFibGUgbWNsayBhbmQgYmNsayBjb250cm9sCj4+ICsgKiBq
dXN0IGVuYWJsZSBpdCB3aGVuIGRhcG0gcG93ZXIgd2lkZ2V0IHBvd2VyIG9uLgo+PiArICovCj4+
ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCBzNF90b2Fjb2Rl
Y193aWRnZXRzW10gPSB7Cj4+ICsgICAgIFNORF9TT0NfREFQTV9NVVgoIlNSQyIsIFRPQUNPREVD
X0NUUkwwLCBDVFJMMF9CQ0xLX0VOQUJMRV9TSElGVCwgMCwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAmc20xX3RvYWNvZGVjX211eCksCj4+ICsgICAgIFNORF9TT0NfREFQTV9TV0lUQ0goIk9V
VCBFTiIsIFRPQUNPREVDX0NUUkwwLCBDVFJMMF9NQ0xLX0VOQUJMRV9TSElGVCwgMCwKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAmZzEyYV90b2Fjb2RlY19vdXRfZW5hYmxlKSwKPj4gK307
Cj4+ICsKPj4gICBzdGF0aWMgaW50IGcxMmFfdG9hY29kZWNfaW5wdXRfaHdfcGFyYW1zKHN0cnVj
dCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHNuZF9wY21faHdfcGFyYW1zICpwYXJhbXMsCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc25kX3NvY19kYWkg
KmRhaSkKPj4gQEAgLTIzNiw2ICsyNTYsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2Nv
bnRyb2xfbmV3IHNtMV90b2Fjb2RlY19jb250cm9sc1tdID0gewo+PiAgICAgICAgU09DX1NJTkdM
RSgiTGFuZSBTZWxlY3QiLCBUT0FDT0RFQ19DVFJMMCwgQ1RSTDBfTEFORV9TRUxfU00xLCAzLCAw
KSwKPj4gICB9Owo+Pgo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IHM0
X3RvYWNvZGVjX2NvbnRyb2xzW10gPSB7Cj4+ICsgICAgIFNPQ19TSU5HTEUoIkxhbmUgU2VsZWN0
IiwgVE9BQ09ERUNfQ1RSTDAsIENUUkwwX0xBTkVfU0VMX1NNMSwgNywgMCksCj4+ICt9Owo+PiAr
Cj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudF9kcml2ZXIgZzEyYV90
b2Fjb2RlY19jb21wb25lbnRfZHJ2ID0gewo+PiAgICAgICAgLnByb2JlICAgICAgICAgICAgICAg
ICAgPSBnMTJhX3RvYWNvZGVjX2NvbXBvbmVudF9wcm9iZSwKPj4gICAgICAgIC5jb250cm9scyAg
ICAgICAgICAgICAgID0gZzEyYV90b2Fjb2RlY19jb250cm9scywKPj4gQEAgLTI1OCw2ICsyODIs
MTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudF9kcml2ZXIgc20xX3Rv
YWNvZGVjX2NvbXBvbmVudF9kcnYgPSB7Cj4+ICAgICAgICAuZW5kaWFubmVzcyAgICAgICAgICAg
ICA9IDEsCj4+ICAgfTsKPj4KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19jb21wb25l
bnRfZHJpdmVyIHM0X3RvYWNvZGVjX2NvbXBvbmVudF9kcnYgPSB7Cj4+ICsgICAgIC5wcm9iZSAg
ICAgICAgICAgICAgICAgID0gc20xX3RvYWNvZGVjX2NvbXBvbmVudF9wcm9iZSwKPj4gKyAgICAg
LmNvbnRyb2xzICAgICAgICAgICAgICAgPSBzNF90b2Fjb2RlY19jb250cm9scywKPj4gKyAgICAg
Lm51bV9jb250cm9scyAgICAgICAgICAgPSBBUlJBWV9TSVpFKHM0X3RvYWNvZGVjX2NvbnRyb2xz
KSwKPj4gKyAgICAgLmRhcG1fd2lkZ2V0cyAgICAgICAgICAgPSBzNF90b2Fjb2RlY193aWRnZXRz
LAo+PiArICAgICAubnVtX2RhcG1fd2lkZ2V0cyAgICAgICA9IEFSUkFZX1NJWkUoczRfdG9hY29k
ZWNfd2lkZ2V0cyksCj4+ICsgICAgIC5kYXBtX3JvdXRlcyAgICAgICAgICAgID0gZzEyYV90b2Fj
b2RlY19yb3V0ZXMsCj4+ICsgICAgIC5udW1fZGFwbV9yb3V0ZXMgICAgICAgID0gQVJSQVlfU0la
RShnMTJhX3RvYWNvZGVjX3JvdXRlcyksCj4+ICsgICAgIC5lbmRpYW5uZXNzICAgICAgICAgICAg
ID0gMSwKPj4gK307Cj4+ICsKPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcg
ZzEyYV90b2Fjb2RlY19yZWdtYXBfY2ZnID0gewo+PiAgICAgICAgLnJlZ19iaXRzICAgICAgID0g
MzIsCj4+ICAgICAgICAudmFsX2JpdHMgICAgICAgPSAzMiwKPj4gQEAgLTI3OCw2ICszMTMsMTMg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBnMTJhX3RvYWNvZGVjX21hdGNoX2RhdGEgc20xX3RvYWNv
ZGVjX21hdGNoX2RhdGEgPSB7Cj4+ICAgICAgICAuZmllbGRfYmNsa19zZWwgPSBSRUdfRklFTEQo
VE9BQ09ERUNfQ1RSTDAsIDQsIDYpLAo+PiAgIH07Cj4+Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGcxMmFfdG9hY29kZWNfbWF0Y2hfZGF0YSBzNF90b2Fjb2RlY19tYXRjaF9kYXRhID0gewo+PiAr
ICAgICAuY29tcG9uZW50X2RydiAgPSAmczRfdG9hY29kZWNfY29tcG9uZW50X2RydiwKPj4gKyAg
ICAgLmZpZWxkX2RhdF9zZWwgID0gUkVHX0ZJRUxEKFRPQUNPREVDX0NUUkwwLCAxOSwgMjApLAo+
PiArICAgICAuZmllbGRfbHJjbGtfc2VsID0gUkVHX0ZJRUxEKFRPQUNPREVDX0NUUkwwLCAxMiwg
MTQpLAo+PiArICAgICAuZmllbGRfYmNsa19zZWwgPSBSRUdfRklFTEQoVE9BQ09ERUNfQ1RSTDAs
IDQsIDYpLAo+PiArfTsKPj4gKwo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGcxMmFfdG9hY29kZWNfb2ZfbWF0Y2hbXSA9IHsKPj4gICAgICAgIHsKPj4gICAgICAgICAgICAg
ICAgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxnMTJhLXRvYWNvZGVjIiwKPj4gQEAgLTI4Nyw2ICsz
MjksMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZzEyYV90b2Fjb2RlY19v
Zl9tYXRjaFtdID0gewo+PiAgICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHNt
MS10b2Fjb2RlYyIsCj4+ICAgICAgICAgICAgICAgIC5kYXRhID0gJnNtMV90b2Fjb2RlY19tYXRj
aF9kYXRhLAo+PiAgICAgICAgfSwKPj4gKyAgICAgewo+PiArICAgICAgICAgICAgIC5jb21wYXRp
YmxlID0gImFtbG9naWMsczQtdG9hY29kZWMiLAo+PiArICAgICAgICAgICAgIC5kYXRhID0gJnM0
X3RvYWNvZGVjX21hdGNoX2RhdGEsCj4+ICsgICAgIH0sCj4+ICAgICAgICB7fQo+PiAgIH07Cj4+
ICAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZzEyYV90b2Fjb2RlY19vZl9tYXRjaCk7Cj4gLS0K
PiBKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
