Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7676DC83F17
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jul 2025 07:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNdOL0NnK3EfeGcASnwY6Tlg4hiQqN2t7q6dYm6Sj5o=; b=TFJIhMxDoSG0jHRgiCiH6XMtMD
	qgNA0uteqc6NQ5q2ItLhDC2ieuYbru3hAOIQOnxQcE4stA6O1jSZjdNTLzlIcrP0PFPvRmGqHDnV7
	XwKGmJrmWNm1eMWFqokYi3kQspCmP5LbPKoLlFgG/Upkp5Cj8h71oAoGo6Fw+mnOQh+HKbeHvMJUB
	yEZjPjMJJIjL876GORldongD+p9rD+28BvfHzp2wr5StA6ecsnCqmI+qqYe7/iAy9YDRA/FZyOhwY
	3PKxgb60gVgfrHKeKBy3xNB8p80Ql59ovLxV4phpuhFUPXuo7StjVVcIQ3IxVZZE9ctZQXEosTcJd
	ElSF+hIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDvp-00000001WDL-0dR1;
	Mon, 14 Jul 2025 07:49:01 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDff-00000001Tnr-31uP;
	Mon, 14 Jul 2025 07:32:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6EvQmEo5+MvQkjoz7MmJa2sYYmGy7eQNRyVSpoIJquv9ceqEAR7AJlN2q2V1smhZcQZqW1BX5jPMZdszSSrwv/V1C+RbctIyW4k3DO9DPSlmUi8YpjYtTQEGDT+Jdxp8nXANFuUTu0YSuezwbFcZKpuKfxVfsRlNpdsL3AMJEgbJY3UvrUuA79cUXJma3MQuCeXkEwjr44NTGTPmV3weZ7LbSb47ezmLBzXbpD5H6AYhOWjw+mJEUiN2EreK8iDZFUBLGMemwpziSy+i2LNCSyh7Gu5SqwnXnf2gZTUjHbYpqiRRtdtd81TqJzIxl3pI4aM6GtRV23zVoSubNoOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vdcRxO2zLf3gvIup6aODAuZS5SddhlwmoE3JAOlffY=;
 b=rb9+TtKUdnwqgu1+z0MsJ1IiII2v6yujF6bc/wBqzWdCRWLJ+TxiBrxIUD1YFw/9wCck5AjhBpOso/h3G8KyhuwD4t2l16R5JohwmeloTSd0YAd/IlVZzRIwj5AC2axP2hL8F1JTEbwX7WvWzmR73fTqiTCy4w4cvxemFhVyrg08L0CJO/DhkRe/e10E+qOO90a4EJYXdNEWVBS+wWfqlpyAZrjr8YuWZ1BCi+IZPZXnu+6j5GZgiAtB99XZApcS1BZc/npxqnZQZ/ukbec85ZZF8CWW/wAZqs9mo6VNnmOySscVFo0IMk+ZgYmEnI/95aVO9mcG6WJNF/4H7vg6SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vdcRxO2zLf3gvIup6aODAuZS5SddhlwmoE3JAOlffY=;
 b=BK+CKbR8flrMIRrZHMdb1UCY8S1eO23dFjQAYsUtbzzp6RMown8RrCh/JfeLn9E5Zizu71CviZtrZmPQAiFmeYG2/ue/aBu2g4ipm50e+/BP35xev9IxbPJ2E4NVVUbivzTAIrxCzAcAocNbF29OPgiXZUzojWOqz5/o1PsBDhVztePhRMQ462m/sbjr/D00+GKxqJHYyF8tSobk/mlt8aluAerMGgY12YcjNDdhI0HJpxHzVQgNw5FyDTs5A96GfaWjWkWfhdmR0PwQlkFQVZxlwTWpKEwWKxKYHEfCLQQXy8spUBpZNpDwq9KA5bhjg4W8AtG5eFiAVMO4vLK6ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEYPR03MB7862.apcprd03.prod.outlook.com (2603:1096:101:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 07:32:04 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 07:32:04 +0000
Message-ID: <6846c3f5-0d73-44d7-9330-5edce7813f0e@amlogic.com>
Date: Mon, 14 Jul 2025 15:31:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
 <20250710-audio_drvier-v5-3-d4155f1e7464@amlogic.com>
 <82f1a34f-bfdf-466f-9c44-2e58d172f3fd@kernel.org>
 <b8d61abb-a6a6-49cd-94c3-f397bb30203e@kernel.org>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <b8d61abb-a6a6-49cd-94c3-f397bb30203e@kernel.org>
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEYPR03MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 11819406-6636-4ec3-8dc2-08ddc2a8874e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmFubDZCbWRBK3cvNndFZktkcW9ySDdmc1BQREpEdzZQVjRlM2Z2RmtIWnAx?=
 =?utf-8?B?WHJBZ2pEaEZWc3RLVXFBc3hKS0J1TzVNemM1Y011UHNncWRVTXFROTYwSjMy?=
 =?utf-8?B?SGsvVWQwVjcyUVZtZTRHN2Rkd2x3bExodlNMcnpxNENTMHU3U054UmFRWUdv?=
 =?utf-8?B?OWNWY3lnWmhOUy9pbFpoaHIrems0THVrUXd4bHJzUTY3Q2tUR0RvNVYwVVl5?=
 =?utf-8?B?UDRwS1IwK1RUWWpqSEthV2NJWUNuVlhXaXM3ZHNKeGRNUS8vV2dDN0ZtcmZh?=
 =?utf-8?B?TW9EMERpU01RSWhXWVJnSXBINnNvUWJaS1J6VzJWUmVDc1kycXBwamw3ZTll?=
 =?utf-8?B?MUhmMFJ2ajFJVWwwSkxwdSs3KzlkVVRpZ2RDUjI1Y1poMWcyQTRTcHkreUE4?=
 =?utf-8?B?biswU0x1Wkk2c1ZMckc4Y3NCdWczWkdUQ24rcWF3dWo4OUlzSjlmWitZWXov?=
 =?utf-8?B?aU5hcHcycmtyVDQrYVJDc0piVy93RXJtRk0zbVR4a2hLcWdGL2JDMDNvZkdK?=
 =?utf-8?B?aE8vVFpSb1V1QmhUS2VGeUZjaWhGOGFQZ0dYQ2xCS3ZuaHJTQUM2cnRhZEd0?=
 =?utf-8?B?YkFXYnFMTlM2SXBMUXd3T2JHS1Fubm5vdVdCM2d4L3YzbHJFY2pyVHhTYm1i?=
 =?utf-8?B?b2s0ck5ZZS9Iclg1ZEFXa0o2RVM4SjZlT3hJL2t2RzJIcFEvc1ppaHczVlhv?=
 =?utf-8?B?M0llWEcwa3VoV2ozdXd2dzRXOGFVNExTS2Z5ZU1FRWRkaHRHOFJtR2tQRWhj?=
 =?utf-8?B?NFVUQmJPbjZJb0ZnTzJvSkY5anNOUzg4aDRxZUJXWDVyenN0LzBrMWFFc1gy?=
 =?utf-8?B?QkZhSlhSLzN5TTI0OGFTUERIT05HK3k4U1I3WjRjNXE0YVB2OGJqNVdFa3Nv?=
 =?utf-8?B?YzZxV21naU5hWGtUU1ZjSUNyY1VKOUtIWlZBcmJPbFp0ckJBaitGZVY3OVVN?=
 =?utf-8?B?STRQWnlZSUJWbmVINlh6cmJPazhSMkJ3dzhEWklObzBjVWg1N0NBN3RhTldr?=
 =?utf-8?B?Y0lJQWdEaDhET3oxYTIzSXM1SVo0aVVGclhUQzRuWnp5QktQRkx6VWMwVVha?=
 =?utf-8?B?Vi81clM5TmNpTnRpSURINFNNbWMxY2lDWUkwOGwwbmpmSTAraFRyU3RvWDhK?=
 =?utf-8?B?RnB1cFhxSEVtVlRQR3NNNTZBZzd4dXBpVWxmSHhHMFd1aElteFpOdCszR2xs?=
 =?utf-8?B?eE5Bd0tTY0llYXRxRHJEWkVDVHY3Vzdjb2tnMi96aHJGRUZObldxSlV4OCtS?=
 =?utf-8?B?bXVMcjAwM245eWkvd1YvQ2I0cHI2alF1cGJPSzBvUDhvQmFDSGtsOVMrMEVM?=
 =?utf-8?B?SXB1cDhsckZzYjZZOFRjOWR2d3AvR1JZTG9WZEl3VWVzSXhFdlB2d3pvRW9x?=
 =?utf-8?B?VG16clBIZzBYSDNRQWtEVUc3OThObTlST3oyU1ZRVnQvZm1OVjRVS0txU2k1?=
 =?utf-8?B?cVJZNVkwUkM4M0lwRHlwOWpvVUhxL1B5MENMM1N4eU5ZRVY1bERka2diYzJZ?=
 =?utf-8?B?V2I4elpWZUZrM3NBUjRrTDdHMG9aTFhVL3JWa3VuQWpLL1phRFJ1cHljOGFa?=
 =?utf-8?B?aEZEMDBDMHFSZXljNDN3cDJDc2d3R0RPd1A1WnBCaHkvaXQyZkxmSUtkNFlO?=
 =?utf-8?B?RmlpeTkxcmtqSGZhcG1ad2FBTmJvRTJwMXhUUDVSSzBFUEgwK2syNWRJb1Y5?=
 =?utf-8?B?bjFZMFpYRXRKMWZIbmdiOGVETUZrV0ErZERtWStQdC9MTWdodklsVzl2K2dY?=
 =?utf-8?B?RlgxUlJ6SEhZeUVuSlp2dEs5ZlhMaGtRcElWOThFOTFvZk4veTlLZk9ja1dt?=
 =?utf-8?B?UURiS2RjWkJCbU1oWE9hSXZDVWVEY09rMHplY0dsdjFFdWJxNnd6TWdIWUJT?=
 =?utf-8?B?OThzSzJCSWxzZFd4ck02WVZZaUlnWmZpMGlTamZZV0NBMjVVT1E4U2pRZWV2?=
 =?utf-8?B?bU5DeUFYUDJQK3F3UGFKMStTOHVlUm9lT1lYdFZzR0JDcWxPcWk3VXBoV1dp?=
 =?utf-8?B?dHBKaDFsMTB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlhEQXhldzdVcEc1YlRmOE9IZ1YwR1RkdHZJNWZvL0l6ZTBnano4T0JNRUFw?=
 =?utf-8?B?RnVHT3hHMlkycUk2RjFpWFRVMzQ3aHB2SUJtL0lrcWxuSGk3eTRzcWdOMzJr?=
 =?utf-8?B?dzR3TmVOdjh6RXUrNUtOVkxUK0NaMGNaQkZEVVVNL3FaaitXanM0S01LS0xI?=
 =?utf-8?B?aElreVluUHZSQXd2MmQ3RHhFemFSaThseVJYNU1HTXhxKy93M2N5amtEaEdx?=
 =?utf-8?B?aVZNVituS3RHNkRxei9rZDFYUHBOekZHUGxYWXZXZU0yLzFHaWs3Q0t3SHlO?=
 =?utf-8?B?TDFzZzBtbWJoUE1jeHRwUGh6VThUaUMwMXJXNngrQUxxYmVKWEt5ZTNFZTV1?=
 =?utf-8?B?V3BHWG51M1p6RmY5ZW1ZR0xJb0VnRDFuaHlyL20vR0RHUEU0NkdsKzU3czRm?=
 =?utf-8?B?bmhFNlpNVWE1TkdJditTSUxIWm1xcThXY21EaFh2aU5odThtdDFyTW5oakIx?=
 =?utf-8?B?eTBnYTZZdVRhTm5aM3FhMnlUWnpQdDNQTzhJVE5TZlVmTHZiUi85T3E0eWYr?=
 =?utf-8?B?ck41Y0Nja0NIMzM5d0pEYk10aWhQTGxyb2FxbUtUWmpiQ1U1RWtDTVRtelFq?=
 =?utf-8?B?MmJnRFJ2a3dGMDg4QXFXczBlSTZDQWxUVmpQemxINFEwTUNRU043M3lOcmU1?=
 =?utf-8?B?aDh4ZXF5STE1WlZMd2FSZm5Rdi9SWVU3ZTZvUXFuWjlTYmRrSUF1alpFV0Nm?=
 =?utf-8?B?TWQ5cWgxRTRZK05rZFNZYVNERVRpTXQwNFRVZ3BlcG03RWpLa1QrMWxxSk9k?=
 =?utf-8?B?QTMwSE1CUUJSMlQxcVN2TmFZRTBFV0FTMDlCOEc0NXJFLzViams4ZXR4aUNq?=
 =?utf-8?B?cEExWkhNRVd0UlRnc3U4a1dxM0w4NEdHeEx3RTVIOTRGL0U1YmNDNGtUck9U?=
 =?utf-8?B?VnY2a0QxdDdMVno0elpnRmpZRXZKcUhoTzhrRElqSG9EbkVmVjhFWlpzU2R1?=
 =?utf-8?B?K2JwZ3Y4SUpBejlBaFY5RGVkWWN2dUJlTEtXUWNrWHdybEY2c0J0eVZLeVN0?=
 =?utf-8?B?NEQvS09VdGJDUFJYSmdCb3BYWnN4UlI1d3o4WmdZMG44VlMzbGlMTWY1OUZV?=
 =?utf-8?B?ZW8xTTJld1UzT3BVOG5ZRkw3TTJGejQrSUtNK1hmZ0huRm40QmhoWWZKaFNl?=
 =?utf-8?B?bzVvc2FjMEswTC9qR29sanNKQXkrVEN3c0htbEw3QlZaUFF0bTAyRlZvNnZZ?=
 =?utf-8?B?NnorM05zREt5ZUFJeHppdHFBNTJhYm0wQXplYTJwY2x1MTNVUUFOR1Yxd3FR?=
 =?utf-8?B?czhTMXByb0J0ZHVBQ2RWQjBSZVlNYnJ4Nkx2anhMTFJhWVpXdWxIaHZRWnRn?=
 =?utf-8?B?UVVsRDJVVzd5Tm56SFhSYW90bU5CR01oOHMrNEpMbGQ3RGxoWmg2bU1oZXUr?=
 =?utf-8?B?MjBSRmhVcFlUdUYvbnFIRGN4V3BnZW5lem1GWk5PVnMveDJKMlQ2NzNOVGRO?=
 =?utf-8?B?QUZjZWUrMnJkODhYK2VXbko3UVZobEc1eTdiZUV3MVp3U3BDY3JLSDJQUm56?=
 =?utf-8?B?eGNXWWxoTDJKWEE2SXRkZnVPRGtDSkpQMXV6d3dpdnNPeDZkYUxqdlpLZm9O?=
 =?utf-8?B?K3pqcTNDeG1BbUZrNDhaUVcvM0dYRExRbWM0UDA1WndDVFhFQ0tQbGhPU3VX?=
 =?utf-8?B?VU9QWHp4RWpEQmFPRkZIQTBmRFdLNlZ1TEw3MlZCTnVCWitJVWtjdlBEV2Qx?=
 =?utf-8?B?UjJOZ05JRC9SNVQwY3VRNDZOWmwyMFpmcFo1MFo4dUFsS2E4dFZxSmdNOXFK?=
 =?utf-8?B?aVVteW1NYzVrVVIvQi9uaUR3WlJwVWU4a3l5cjMwZXh6QklRMmlLTHZxLzFE?=
 =?utf-8?B?ZklKTTZSYzhpU1NNMU05anhvcTdGMmM3aFJUbVZ5L0hGVWhSNE9QRUtJTFM3?=
 =?utf-8?B?L2Y3ZXVkMmxmZDNBbGFKZ1A1ZmFrTCtFb3dLbDUxK0dMV2tCUWdNd0hCY0JC?=
 =?utf-8?B?OEYvZTRwVVVjMEZzUFBycTlTR1hRcHJJMWY5TTBQNUVPNmpDNlFPQ1p6NWRL?=
 =?utf-8?B?cTAwMEVoNFVPb0xsUkVkNkNCUEl0OWVRRGUrcWtaUy9WWi9IdDJxdEwwbjBI?=
 =?utf-8?B?azZCUmZNcE84NmJhMWRKVG5TMGdaOStPREx4cHpOeUhGUi9zSnJQVTZPVkNp?=
 =?utf-8?B?R2ZYWCs4bTkyQW1Yd0VUbU9wUUhCRnVoS1dKRWdBRXdtZzkzTjBqTmhUdEc3?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11819406-6636-4ec3-8dc2-08ddc2a8874e
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 07:32:03.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehedE5UGpHRUeXbB9mWJ6e8U/R/9D+RLtwtBJRP5EhY3Z745jfj7L1oAdzTHaOhYUSfhUbRRwJswxgGaKIKRS78UOFHy9YYWSvXZ6YgC5nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_003219_776185_0DF6FB8B 
X-CRM114-Status: GOOD (  12.82  )
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

CuWcqCAyMDI1LzcvMTQgMTU6MjIsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+IFsgRVhU
RVJOQUwgRU1BSUwgXQo+Cj4gT24gMTQvMDcvMjAyNSAwODoxMCwgS3J6eXN6dG9mIEtvemxvd3Nr
aSB3cm90ZToKPj4gT24gMTAvMDcvMjAyNSAwNTozNSwgamllYmluZyBjaGVuIHZpYSBCNCBSZWxh
eSB3cm90ZToKPj4+IEZyb206IGppZWJpbmcgY2hlbiA8amllYmluZy5jaGVuQGFtbG9naWMuY29t
Pgo+Pj4KPj4+IEFkZCBTNCBTb0MgdG9jb2RlYyBjb21wYXRpYmlsaXR5IHN1cHBvcnQuCj4+Pgo+
Pj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKaWViaW5nIENoZW4gPGppZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbT4KPj4+IC0t
LQo+PiBQbGVhc2UgdXNlIHN1YmplY3QgcHJlZml4ZXMgbWF0Y2hpbmcgdGhlIHN1YnN5c3RlbS4g
WW91IGNhbiBnZXQgdGhlbSBmb3IKPj4gZXhhbXBsZSB3aXRoIGBnaXQgbG9nIC0tb25lbGluZSAt
LSBESVJFQ1RPUllfT1JfRklMRWAgb24gdGhlIGRpcmVjdG9yeQo+PiB5b3VyIHBhdGNoIGlzIHRv
dWNoaW5nLiBGb3IgYmluZGluZ3MsIHRoZSBwcmVmZXJyZWQgc3ViamVjdHMgYXJlCj4+IGV4cGxh
aW5lZCBoZXJlOgo+PiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI2ktZm9yLXBhdGNoLXN1Ym1p
dHRlcnMKPj4KPj4KPj4gPGZvcm0gbGV0dGVyPgo+PiBUaGlzIGlzIGEgZnJpZW5kbHkgcmVtaW5k
ZXIgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4KPj4KPj4gSXQgc2VlbXMgbXkgb3Igb3RoZXIg
cmV2aWV3ZXIncyBwcmV2aW91cyBjb21tZW50cyB3ZXJlIG5vdCBmdWxseQo+PiBhZGRyZXNzZWQu
IE1heWJlIHRoZSBmZWVkYmFjayBnb3QgbG9zdCBiZXR3ZWVuIHRoZSBxdW90ZXMsIG1heWJlIHlv
dQo+PiBqdXN0IGZvcmdvdCB0byBhcHBseSBpdC4gUGxlYXNlIGdvIGJhY2sgdG8gdGhlIHByZXZp
b3VzIGRpc2N1c3Npb24gYW5kCj4+IGVpdGhlciBpbXBsZW1lbnQgYWxsIHJlcXVlc3RlZCBjaGFu
Z2VzIG9yIGtlZXAgZGlzY3Vzc2luZyB0aGVtLgo+Pgo+PiBUaGFuayB5b3UuCj4+IDwvZm9ybSBs
ZXR0ZXI+Cj4+Cj4gWW91IHJlc3BvbmRlZCBpbiBwcml2YXRlLCBidXQgdGhhdCdzIG5vdCBob3cg
d2UgZGlzY3VzcyBoZXJlLiBQbGVhc2UKPiBrZWVwIGFsbCBkaXNjdXNzaW9ucyBwdWJsaWMuCj4K
PiBBYm92ZSBmb3JtIGxldHRlciBtZWFucyB5b3UgcmVjZWl2ZWQgZmVlZGJhY2sgYXQgdjEgb3Ig
djIgYW5kIHlvdSBkaWQKPiBub3QgaW1wbGVtZW50IGl0LiBZb3UgZGlkIG5vdCByZXNwb25kIHRv
IGl0LCBlaXRoZXIuCj4KPiBQbGVhc2UgZ28gYmFjayB0byB2MSBvciB2MiBhbmQgaW1wbGVtZW50
IGVudGlyZSBmZWVkYmFjay4KCnRoYW5rcywgSSB3aWxsIHJlZmVyIHRvIHRoZSBwcmV2aW91cyBz
dWJtaXNzaW9uLgoKCjNmZGE4NTMyNGI4ZCBBU29DOiBkdC1iaW5kaW5nczogRXh0ZW5kIG5hbWUt
cHJlZml4LnlhbWwgaW50byBjb21tb24gREFJCnByb3BlcnRpZXMKCkFTb0M6IGR0LWJpbmRpbmdz
OgoKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
