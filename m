Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501A3CD342F
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2026 03:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqoVS+RrgoxBAQd7Lzp/T1q22+oeMpJ9LYGT3VAU6kc=; b=jfgu0i75z5ZHBWpr3+C4pUlmrT
	GWty6vSFUhVfMTPtOiOusBIWTJhmFzqlCz4pMh84oCluqfYmT87T6MsYbI16wHRIWycKl7t/Z65xG
	GeLpqh4HQOl0/ADHs9b9gsJwbJJ/kIkDuiQE6+mgQrrnYY/3IBbIP96oxF2IBnL/Lg617XZgsjmPx
	g9EUk6vkeY2olkAYhn9zaTjFx9ROZPYEKkouD6hjSchDLtBx8PMikVbUOIgRa6OdcpbAZDoVxj4Kr
	EXScLGU0c504hf4XPWSoUDQMDi3Fiu6Kr+KX1oF5A30mEOTBM31y27mSTXFhlnQKqhLKsy1MbC1L5
	WqsfhSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKSW4-00000000ZkP-0QvH;
	Wed, 06 May 2026 03:01:40 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKSW1-00000000ZjS-1Vyi;
	Wed, 06 May 2026 03:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCeUWrzEW/p6/gtrmL/ZKVjmYaU579mmxaMc+CAwd7QngDEvQl4nz/2Bu0tVKYUYEH+R0uHnkCub0AHLZQL7q5xvAsxxgT7gXFoA2MSdx4qgKEw6yfPUlNVkO9clF5HVluu9cch53swB4aho7XcnB2xyZvVb+qaMAxaVlq0Hw0MU3b8fN6mbkGa/zoN8sku6nmDARwBXijFZfAssekVmLgpfNKKzO1+c2NT9lcU9i6VIBd58MihtWsU+K+oLjHgonXhfbrBIFpxioIgsAKf7s8DHNdvNZ7SuP0l94cdk1dFZypYq0GWRvB/H7fkl9o6PyZPSc3WDS+HS40vuQu8sqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7eOBZwsrXFCTM4l3XtXY5lNGDZHI0rYvOXarCcz1Q4=;
 b=mj0Tr/VTRYO87nXgc3HSArsw5qFKKE31HH0lPFD+YxDT5PsBCZWsttAV5XGpHW5ooPSTO2UY4Ablq2HnbfSs9Q0lSK411exVS3noqz30rZnzrnjR7bZPkdBKmMjNWwEHKF7kknfuqiCJPu0hFd5CkcuaKBR5ljxjMXZNSyEwHkIItFypLba+G+TU3GJ7uDGhywyl5iGNtvn2YMoKmSqYCmIc2ieLFpHyE62SFebfZ9XYj2CJ+OF3U4qmmU5jC+/aJhbb64sN9zsLcTGO43qwhq9GuGRwqATDtU4AzSnSo3Zi3yok+7j+SKLfMta7nu4Gr9AzLbuDZKmOQTV1ssAU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7eOBZwsrXFCTM4l3XtXY5lNGDZHI0rYvOXarCcz1Q4=;
 b=kd3jwsniF6ulHyJaiV86ltsnJBkMZB7AbRn8tEGlAv3Mz5olm/XLcx34WzD6TMTzLxlu44jVHaHmu30Vi9ejzCaX3+BAK7OU6dNWmGjbDJku/1TwNi5+4APPbpxvyoBIvqBxCZUFFub4arb2agMEfBMZULGr9lL8wJ3j43qZgspTJsCxAc8UxYIfHVXPLrbOAUUHylS8dNDgCvDZVQfvIDxvm6z/DNuqZY1uYFHF08buC7sA6RfAGdLPICgxA0lZH0zi3IRsc3FijdRjneYyNbRZ69f/iGIpm/yuWyNRp+5neuJ3cXMHRF8cQqAPLWf8GIvDrvt2o23o/r2ZpM8/4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB8156.apcprd03.prod.outlook.com (2603:1096:101:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 03:01:07 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:01:07 +0000
Message-ID: <a2dd374c-568d-4701-8197-14ba37acb3fd@amlogic.com>
Date: Wed, 6 May 2026 11:01:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
Content-Language: en-US
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
 <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
 <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
X-ClientProxiedBy: TP0P295CA0046.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::9)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: b65dfd89-58ee-43ed-2ea9-08deab1bb7e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: UsP9jTZvKCDp4PPti2YfcM8FbEo77Q/XQ98ctZprF03UvRajriXYhPIL+Wvr0yifwJmZRR4qJuwx5e4Q1J/0KKO9BbW8qciwX67tNJP59l8JKoD6fv0cJU7vQzgNWT9Jqz/T4xr84YLKANXm0WRc4JRC/JU0Z6T8UAB1ONiApd1H185tos6sSmvs2KGLPcIYBbpNyTWDfOiTF8GpLWGjujjkNrWoGPOS/yn/xsMG1TGo5bmI/sulck1iG5mKmlMO1TbrWgfM0gqfeFNlvD1hC+9OFqq6BbS0gGlSL4GyCBzQrtxhVatDo1Sh1TSJcmwj9FQiBqEYjEph3ROIvTQw2T408GDJVCAZE8RIKUofVtnXSS1OOsEYOe6M10qmG66hioMjjdrgKSMRFkQWwTiIiuVSO3NApALFQqkyGx+NMqlJMW7ihBHHRglM4P83Mi9tLqPonVNM19SniuqLvXEkU/EWAiX6o1J4vr16HrhBlGMCPPSgoiIL3k/dclwkKDD5xbZPPR7TPJ4vIvE6jkzdMTLwrEeq7ea14R0XM6ZADOD2HFlaAgYBeFN3MYKh5qigVJgPub+bLHyPIm1xA7PHOIuKkx7IWgbGmxEWYey//pwAjDyeW68F/xz519kBOKHv/+2K5nexFWDbtk4v17LvkwTOY2yPuAu3vOS1sImqNs6cQ/nkJt7jTOa16gPVA9RC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2F1cWRzQlJlTHZSeWNtWGV0a0xOSWtPSWN4eUF3SmhkYXA1aXVrZStJWmg3?=
 =?utf-8?B?NkVFT2R5WFMwZkZEQ0FyWnBFQnYxb1gzOTlxUUp1TXl4MmNGVEVkYWtvVkU5?=
 =?utf-8?B?ajFyWW02SFhyM0M5MHlwdnB1UDVoTHU5STcwcmNlWEVLdEZGZlEyc3gxTW9o?=
 =?utf-8?B?cmJHcmpSeDNnQVRraWVzeWU3bWtGTnZYZU1lcFJNb2Y4dDVyVmNtZkhqNGdz?=
 =?utf-8?B?d01WTWJzRitCWmJFWmxkdVVTNXB6T0RQMnF3TzEvTjVyT1VIOWZNa2pTcy8x?=
 =?utf-8?B?aGFuMmZqNzRaUlREY2pXaUFPdW5iYXNnbU1NM0tWeTQ3cEtsMXowRVJmRDVl?=
 =?utf-8?B?SmRWWUcrcTNSbW8zYmNONmdWRmF5NGJMR2hIRG5DcGc1YW8yZzN5ck8vdTVB?=
 =?utf-8?B?cW93VTJyZnphNHBKL1J5N1NOQjRIV1FtblBHUDRJR3NFYlRsSzRwL2t1L0Zy?=
 =?utf-8?B?elRqNktmMVdRazllYkFRZ3ZMMlJnZlVxZnBXb05yTWhVM3ZxQmFWU2phK21Z?=
 =?utf-8?B?a2tVSEk0bHB2cEFzYVNLUmlWZzYrT1VuMHh4NXIrRmNkUDFmWUtteHJrdDJa?=
 =?utf-8?B?Wmh6VUp4REl0UGkvcTU3Mm42bSsvQ3R4cnBrN3h2UE5GWGMxU1R0bnh0MGpi?=
 =?utf-8?B?UFFBek1ZNG9leHFzU3djTmk0L3o5Y1B6QUNENm9HQ0s1NGtSb0lpa0R5Ykxp?=
 =?utf-8?B?TUU5SDczUFk3dW1FaExnditiL2ZkSjVKRG0yK09DVnpkcERTRi9OazgvZHpy?=
 =?utf-8?B?dVhuTy9ENHVLT3o5L2tpNlVQam9EWmhBQVJlZTdnTmtyQjhNZmdoU083MG0z?=
 =?utf-8?B?QUV2bVRzM2hEU0dyZ3NBYWF5NFFHUFcweU5veWY5L1poU01tMnVXZElZOVpU?=
 =?utf-8?B?WkhEK29FdkcvOXA4U3ByWjlmWFZKQ0toUkdxTzB5Tk1xNENUaWp6cUVESE9y?=
 =?utf-8?B?U2JFdGplT3NxcEswQXlYVG1VWTQyUEFRbDcrMWFaV0lwazcvbjNXOC9mMytl?=
 =?utf-8?B?WTFlcU1LN0pvVWNpZ0gva3crTHd6M3ZjUnJ5UXBPOEQ5NjJsbndWVWtMUkVO?=
 =?utf-8?B?UWNZekdKdWdtY3dyWVR0TzREckRVSW9tNVdpRHA5UU82cUozY2lkcFZwZU5D?=
 =?utf-8?B?b2dVc2lXSGJlek1aT2drd2VVa3MrbjJtOHRpMHoxZlhsSHpMY0pRYU1ZS0Fk?=
 =?utf-8?B?Nm5sTFB3M1VUWXJ0MEVabVl4YVcvQTVHS09pdDBqam45N2orTHZjeHpNNXlB?=
 =?utf-8?B?Y1ZaUGlUOXFsSjFYVDB5SjZRcUJrSUNBK2xFdkF3c0p0azVic1htN3c2azlw?=
 =?utf-8?B?Mk1BMjJRdWpYY2dhRk9TMXVnNVdCM0lHazY4dGNSOWxSWFUxNlBDbGVBZlFS?=
 =?utf-8?B?QTV3R2RZbmhBOXpoQTdnaElNOFUzV1FJTjhDQWtwZy9Fb2Z0a2hwdXI4TG13?=
 =?utf-8?B?TTVCeHhvc05CWFMxVllBaTNIWXU1WS83ODFHUVo3ZTBFY3BUZ2g1YmEyQW5l?=
 =?utf-8?B?RE5VdlNuVUdBcU9VYnpCY0dVUkpDMUVPZ1MzM1k5QWxucExzMFhFWHdTaXVw?=
 =?utf-8?B?S045WSsycjhCdDZUSGk1RmQ5L2p6NEJUd0NYdXhxZ0dzaUdYeXNIak41OXlw?=
 =?utf-8?B?V2ltK2xLSFZiMGFjcHQ5UFNXYm5vckE0d0RCUUcza1pMbGlFZDFySnRNYkpG?=
 =?utf-8?B?bjRXaXRHNEVDd2tTblJHVjhEMWdzNGNZQWpUaVoxUWpVb2g3UUdZdWtHSlJP?=
 =?utf-8?B?RlhlWThVV0NqaXRTUWlpZDFENHJ5dTNObzZQTlpFNnYvUDdIc29pWDNObjBs?=
 =?utf-8?B?ZVFpUWZwL2M1eUtSNWVENlk2aStsT0VqdCtTdUZneHN6RUlBc1V2bW5hN3pt?=
 =?utf-8?B?OFZ0NGc4ZVhUUGVPMjlnclBJclBWd3RCM2tocjE1OCt5UXl3aExmenBmMThD?=
 =?utf-8?B?SmpxaGRTZnNvWlNxRE0wNVRabkJxU0ZqRmxDRklaNlpGcTVVTXY5aXNEK01H?=
 =?utf-8?B?NlhkK0I1MElnWVVUMCtOd0pCYXFucEROQ29jZnFuMXg1cW9rM0hxWDNyam92?=
 =?utf-8?B?TENXUnh6c0pJeEdCNGc4UEZRTUZGdnpibzhVUzkreUV6ZUNGUk5mNnJ2YVR1?=
 =?utf-8?B?NTVyd0dzV29UK08yRlVQQ3RoMGlvcGJNZkJlSDJtQ1VHd0ZVdkhTcGNnNEEw?=
 =?utf-8?B?enNEL0ZrWnBrMndMVjFNbWNLSkkyQkRpdlNucEI1dzZsRjZaWWxYb2lMUElm?=
 =?utf-8?B?TXVuVXpZUjhQYVZvU3ZwTnN0YW1BcTMwYStUa1hDbjY5SkNFUWs5TnRKRnpT?=
 =?utf-8?B?bGV0WWtpdkVHdVRmaVJXdnd1a1VUYmZDdms0Yk56N2IzQzh0VURLZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65dfd89-58ee-43ed-2ea9-08deab1bb7e6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:01:07.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDMCwHEwHK8zFh1iPXHLV8akkjSISW5ljMPpfTpmNlaBNLKVdPCC7jvQzAmTi0iYcNuGZfSMz2jkWWalc5pCZvLrVtUSKsF0kldhb393yYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_200137_398077_D6E2BFC2 
X-CRM114-Status: GOOD (  10.37  )
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

SGkgTGludXMsCiAgICBUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgpPbiAyMDI2LzUvNSAxNzoyMSwg
TGludXMgV2FsbGVpaiB3cm90ZToKPiBIaSBYaWFud2VpLAo+IAo+IHRoYW5rcyBmb3IgeW91ciBw
YXRjaCEKPiAKPiBPbiBUdWUsIEFwciAyOCwgMjAyNiBhdCAxMDoyMuKAr0FNIFhpYW53ZWkgWmhh
byB2aWEgQjQgUmVsYXkKPiA8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVs
Lm9yZz4gIHdyb3RlOgo+IAo+PiBGcm9tOiBYaWFud2VpIFpoYW88eGlhbndlaS56aGFvQGFtbG9n
aWMuY29tPgo+Pgo+PiBVcGRhdGUgZHQtYmluZGluZyBkb2N1bWVudCBmb3IgcGluY3RybCBvZiBB
bWxvZ2ljIEE5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW88eGlhbndlaS56aGFv
QGFtbG9naWMuY29tPgo+IFBsZWFzZSB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHdpdGggdGhl
IGluZm9ybWF0aW9uIHRoZSBEVAo+IG1haW50YWluZXJzIG5lZWQgdG8gZGV0ZXJtaW5lIHRoYXQg
YSBuZXcgY29tcGF0aWJsZSBpcyBuZWVkZWQsCj4gaS5lLiAicmVnaXN0ZXJzIGFyZSBhbGxvY2F0
ZWQgZGlmZmVyZW50bHkiIG9yICJuZXcgaGFyZHdhcmUgcmVnaXN0ZXJzCj4gZXhpc3QiIGV0Yy4K
CldpbGwgZG8uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
