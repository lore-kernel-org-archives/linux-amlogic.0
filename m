Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8786CFF60DE
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2026 07:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Li5DVNPVp6WT1vwSnBus+w+wcoXg16HpA11EI0CoCc=; b=QInmHJ/WWDoJuxauqOV2Obyniq
	3z05CRu9rDrwmIlpoytDnBM90YOggu8Y2X3Fwm5Ux3qjOOutxa8tuC6nQruPWPmsAkIK6r0Sdd/FM
	siO5W3399Sg05UUSSkSPovlyQdbktnWSVw+KmjqRdfR6JwzoLCkxgq5BQY7QHwBrD6UFV6D9382ju
	nRhaopoR7AeX3QMuC32QiutAtiEnA0m/QW5J+L/oJJKTEGY483xQQrA1C1WdHKmCMuHI6YCioPQsK
	OnNHxENZy1KkUEeOxJqbUbpukwJ/tKJoEi9cC/w/g8kqTYo5YkZZHt0BkpnS2WQnDuxFqt+y4smbk
	bDFcLz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7U0U-0000000CXcL-2jtX;
	Tue, 31 Mar 2026 07:59:26 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7U0R-0000000CXb6-3Vhe;
	Tue, 31 Mar 2026 07:59:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJadvmdPc5aM1aPeW5FKQp/eSIWEQJ/9r8WYWQ6JXGEmE2riiX9bO6RennFCGelnoGTmoGUuPTV4RGnXixS4V7HpDwwkdzpf04G2jJMHF3/9NmS4KksnFOh5755/MoZSJK60Nd+aYC9bSQCleEsBn9z0W7vbrArDs03lBLO3G01ztMoDTlfg8RVVpHAOsI1i6NS0P2MWJSOQPOpLbRvsH+4k8RS+zx0Gu8PkXGQ8hzKGSfLjuDSvW/w/xYmUml1binFMXGJ3k4fP7Ul0uayfqIA1SfcwiXPjh+hk1DqMA0iFh5DGBvygrhNM+54h1i7yGQyWCa0QbObErrHjthF0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEfbSanqzMoLfIrVD8uw9CpvRO4nIqaftfstWtTRn2Y=;
 b=Z9j0Ym9flk1QtODrsdQ42/XdRdMinTqXM10hPf/m5Vz8KO2xbd7ZTglrlvqxoyBr3wCU+0C1/fW/9G08FBj1XSY6rMgY4Ds7bCZQEzEdnsTX44SMfVFrZxedntLInRWigWMUr4fulDGwHHxWMHPhZfBrg1JqQIeHDx7Ahp40t1OAPWPx09oO2wBYfClV3Q2Y4g9z7xu0UeHR8gwjBjjyZgBSnhupIfz388kv4DdlN1Ku6H4dTSE7PGxkXJaS50FIhApG1bivCpsUceJgw3zHbmziU+0VMjIq5mJYBW1oWqWHCCyp907vXAnidVUsChOGRxawqPiVz0AUYGYvM0cqUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEfbSanqzMoLfIrVD8uw9CpvRO4nIqaftfstWtTRn2Y=;
 b=owBf9js8lyiiSfPr4J49yzcqA8IxgfDhbd40Vub+a+yAo+qE9FUsmCg9rQTFUEieQkYCVtJsVSMb1CEMHiSuTX7ELsFO17wip5PSzV+09vodJscfj8iJD58ROZCtz7YsJOFoe9KQzVVvf/ze7PZwsYqcRRyXpQzmAq1xcfHjM8vzmvbaESoaESlo3Js1JNGd52abobiUvFdyZWg/VDCiQbVMu+Ib5fLpCP0WAIP99ADjaPTshex4S3ogZ1V2pj7MmrXlpi9Wmfkvq3hxtwrsLFcE3Z3xb6kpkMpdX2ZZ9QxrTHpTxnL7IrdfjymDhjkqJdrggMZdDUdhbKotp8jJew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SE1PPFDD7AF816D.apcprd03.prod.outlook.com (2603:1096:108:1::86a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:59:08 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 07:59:08 +0000
Message-ID: <78e05060-6f25-4d78-8b0d-35b8fca0cecb@amlogic.com>
Date: Tue, 31 Mar 2026 15:59:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error]Re: [PATCH 0/2] Add PWM support Amlogic S7 S7D S6
Content-Language: en-US
To: George Stark <gnstark@salutedevices.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Junyi Zhao <junyi.zhao@amlogic.com>
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
 <CAFBinCD1GPP82MEBDHg3BwCJg6JY5k2HksEt+kCB=YjnYTO7Tw@mail.gmail.com>
 <70a637b1-a76a-470c-9a97-0b4599a40a1c@amlogic.com>
 <4a9c726a-d580-4b0b-9530-228b58389c80@salutedevices.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <4a9c726a-d580-4b0b-9530-228b58389c80@salutedevices.com>
X-ClientProxiedBy: TPYP295CA0003.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SE1PPFDD7AF816D:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d2b881-2874-445a-3d3b-08de8efb62de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: K8fzXD9D+N8doRCak6fp1iWV/PTFQC505Yu8z1hFZ9t5wu06MWzhrGl+N32E+ozTPLSSTUV/21/gPhmjvSkZ+FHElibRm7CY3DGy2SJ6Wzevw8aLqr1pWlnmNMXCKbCWA2jBdTVqCPdv7bMOQyY68rlZHQ1kQ9vmt2gJNa8zncoGTr54sp0K+InjSLrfdBbiuVD6qjvIjCqVMdaHSSY5HMWneFBJlAM/XcHjQqIHEWfEeN4geZRYq/SnY5D2jiLNwPNyzIyOljyhZ+R0CaKdRoAIh6yaU4kazfvw10f5m68pQAHwFJ+SatiP12FIss0UsstIxvPIi7+SuDZiDtiJUX4PE6A0Gip026YumBI74zHDsYmthV05dbZBwtFZefUBt/ufyDMsnxoAGxcwhQQ8SPzOZYYuLluN9pWuaiS2vIfI+dc5H0HhoHa8x4qjxZpoB1UvH4BvQ1+z0BbUj7gDV/4ENZgM4TrSzTFHV/CZASlqOQIu0tq8cx20gTVs3/tQs01HPFVgGf+Y++C4I3cBTeXwXhbkmBy6dt/Qm3hxo36dy8UDUCByCQfvPf323Ko9o8hQI4JJVOD6SIj5JC+U8P121fI9gbXiJdtnZOpUXzVlERY/jrI8QWu8Lnw2qpd0PHktr0B8z0Ucs+B+xDWPhY7VbG76sXnF9vrCpFY9fNZc9Algrzc71NkXKY+7f/TIhoYXCSGEMibAH7H7iDp5cVbd61dpAjdKQzpUQzfcZTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDVwczQ0SkhIc2Y1VVNpVEJGRHYxNWNqaTR5c2tydEtiNmRqb2JWeXZsV1d1?=
 =?utf-8?B?alpuK2ZTeUt0ZFZRbnpXcHhTK1Y5b0JWSjZvaVExTzZaaUpXWmRPenNZdDFm?=
 =?utf-8?B?NTJVeFljb0l0aHlHbG9ZSm1NdllXcUQ5Q3FnNnlHcFQ3cklUejFyQVdjSlJG?=
 =?utf-8?B?VUZobHJjdWw3SEIrdDFlZGp3RmZmTkVTQzVPcDhPWFgxMmNzWDdsWUFnMWpZ?=
 =?utf-8?B?L0lITW90SWwxcDdpUVJCK3h1NS8rSWhhTHpwaDBtZVc4QXFPdmQ4di8zaFgw?=
 =?utf-8?B?OTJyVU12YWJaUXpHcVU3TkdjMExMNDdXVzJxanc3U1BGbGVvWFYwNXl1WTll?=
 =?utf-8?B?TjN5b29qZmFCNSttTkhiWXFiOHphRUVOdnV1Y2IvN0R0MTdMT2NLVVZ4eWlS?=
 =?utf-8?B?NkZ0YTRpU1ZMWm5ZbDJQNWFsSFA4cGp4c0FreUNDUmRhQVRYWFdGRW51VVBM?=
 =?utf-8?B?TG9OT3ZQd2hGUDFtZXI3RE5ZUFlEeEFuajFDdmpMTk1oUkE4SmJaSmlVV1pw?=
 =?utf-8?B?OFRUeXVVU2NlVnIzektVQ3V5NnZoRHpiem9mdmhEbTdhWWxIQmpEeXVSZ2dU?=
 =?utf-8?B?czA2S0crV1dabGxoZkpSVGRDV3JlVThtckV4c1lKdjZKUDFLbXhaY1NnYmcy?=
 =?utf-8?B?U2l3cURwbFp3b3NHYTBqang1VHFodEUzRXVkUWN5dW51NGc5UFhGczhIdHFV?=
 =?utf-8?B?S09EYXIwemJNcEpTTzRiZENuRjJmQ2JIWDV3TDFuVlEweW1reStlSnI3NExx?=
 =?utf-8?B?WDdOTm40NUd2U1BMMlBHMWNJVW5uVEp3eWdSTHBQR1RwU3lCMlVTT1M2Rmxq?=
 =?utf-8?B?TDNkUlBucWFzM0JYVjNCSjVCU2RpY1lTdDhHN1YzQ2NTV2l5bmN2bzRwWUFN?=
 =?utf-8?B?Ky9nWmVFanhkclFiTDU2WVZFNkwxZjNDcGpxV0xKS253aUlsOEZRVE5WSjRq?=
 =?utf-8?B?UEJjYzNnbGVodVZJc1VNd1ZVcUR1aWs4cGZHdlZhQjlXQjJyOXBPMGZJTFVv?=
 =?utf-8?B?dW5Dc2dMUHVGdUpyRUNwTXd3OE9IZTdwSTRza2Z0ZXM3dFJNVGpEUFhZL1U1?=
 =?utf-8?B?UXVBMUxUczAyOS9aUzJwSWZ2VnlrT3ErT3VsMW93c2llTmtRMk94YlNzbmE3?=
 =?utf-8?B?bkZ1TjRaZVpVdjJyeU1NazNYbTRWME5aTU13d3hDZTlESWtmMzFxMVhIQ0Fp?=
 =?utf-8?B?NERXdWE5L2FraGpNZ0c1V2ZtOUpEUFJlZkgrVk9uNmtOM21HcHJjc2hUdkhK?=
 =?utf-8?B?b3ZtbGNFN3ZqQWRJd1Q3YkIxUFM1WnZad0V6QnBjTkoySnRKck54UzlNeHBJ?=
 =?utf-8?B?U0pPUUM2ckxlcklqTlIwM3A1NVFJSHhrVmZrTzFxNlgyNGo2SjN5Vms3Z1k3?=
 =?utf-8?B?QVhobmU5VnVQZjE1VGxVVlJTRlNkUklETDhLVEdpWTZ0azFQN1UyQ0IzYWNn?=
 =?utf-8?B?bFQxYW5yUG0xajBIaE1SdktHL1FsTForWklQSjUvczZOS3NSeTBIMTM2N3dk?=
 =?utf-8?B?YkdsWlcrdGFzWXB0QzBVaDFiK2Z5cVJvWDBGSkdZZUt2dGlUSDRCc2Z4aVNr?=
 =?utf-8?B?U0kwUnU4NDJ4ZjNGYy9JL0FxNXRKbDJzQWZWR041T0MxdGZ0RnNmalFBZlBP?=
 =?utf-8?B?ZTZJYVRRVnEyN0ZnQ0FyTWZHNHpNcFQ1eXk3aWdMUFlqMG55V0IraEg1ZmRU?=
 =?utf-8?B?M1RTN1R0WjhZc20wc2dQdWJlbml4Q2JEN29zY0VHblV3QlY4U3c3ekd0ZUFM?=
 =?utf-8?B?SlBNd3JvODIwRmZyWVh6OW1ERGdOWldRZHlvbmF0WUhLaW1nYm56bDJjRm9L?=
 =?utf-8?B?ZGxSVS84VWI3R2N3dFZreVZJei9lUWgyVFRxYlFlVVRyQW4vbE9Vd2lYZGw0?=
 =?utf-8?B?dVFYUWZncUpBUXkvYXpGMERvSFdadnVFYjhydDE0L21wcEI1RmhzcmE4TjZH?=
 =?utf-8?B?dTIzT003OFJmYjJNd3pGYUc2UEpIOE15TU9YVjM0NHhuWWt2V0xzbXBXa2Fx?=
 =?utf-8?B?TzZkSEhEN2hmZ0pDaFdub3pWTGJTK3NWVFE2akNFY05HZURVVnpJMlExdXhj?=
 =?utf-8?B?bkVkbFAwSCtGNGF0aWplY3JiV2dOYVN5WThPVHp5WklrdWNLL2kvWnpYdHBC?=
 =?utf-8?B?QjZMQmJSMENSZ3R6b3VaWnpVR2VVZnAvN0NKYTVxand4R3VGUFgxSVNQU1Zk?=
 =?utf-8?B?U1ZrZk5JQTdSWUU3MVhsT3BRcGtFMFlCZTdTNjY1UEtJNWh6NHNlbkZlckJE?=
 =?utf-8?B?V25PcGJaekFnUzZXSy94OUpDeTYvMldLd0xqUGhrcXpqVm5XM2dXRHNobGJO?=
 =?utf-8?B?ZlluOGZFWlBVcVFmVTB3UGc2RVJRR2IwbGoxbk1kTkdBWDBhQnpIQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d2b881-2874-445a-3d3b-08de8efb62de
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:59:08.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MGNY5X+w6wG0ezZAyYSwb5apCHXcGVzC4S62cwfdYoOuJT1OAYf6a50qH+f06LndnFsuGNF8FoNGxq5Cf6E3R1BHcN6RpeS21+PPef+cEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFDD7AF816D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_005923_881566_882D3BB8 
X-CRM114-Status: GOOD (  17.01  )
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

SGkgR2VvcmdlLAoKT24gMjAyNi8zLzMxIDE1OjMzLCBHZW9yZ2UgU3Rhcmsgd3JvdGU6Cj4gSGVs
bG8gTWFydGluLCBYaWFud2VpCj4gCj4gCj4gT24gMy8zMS8yNiAxMDoxMCwgWGlhbndlaSBaaGFv
IHdyb3RlOgo+PiBIaSBNYXJ0aW4sCj4+IMKgwqDCoMKgIEkgY29uZmlybWVkIHdpdGggSnVueWkg
WmhhbyB0aGF0IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGNvdW50cwo+PiBmcm9tIHplcm8s
IHNvIHRoaXMgc3VibWlzc2lvbiBpcyBjb3JyZWN0Lgo+PiBXZSBhZ3JlZSB0aGlzIHNob3VsZCBi
ZSBmaXhlZCBhbmQgd2lsbCBhZGRyZXNzIGl0IGluIGEgZm9sbG93LXVwIHBhdGNoLgo+PiBUaGFu
a3MgZm9yIHBvaW50aW5nIGl0IG91dC4KPj4KPj4gT24gMjAyNi8zLzMxIDA1OjU0LCBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIHdyb3RlOgo+Pj4gSGkgWGlhbndlaSBaaGFvLAo+Pj4KPj4+IHRoYW5rcyBm
b3IgeW91ciBjb250cmlidXRpb24hCj4+Pgo+Pj4gT24gVGh1LCBNYXIgMjYsIDIwMjYgYXQgNzoz
NeKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkKPj4+IDxkZXZudWxsK3hpYW53ZWkuemhh
by5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPsKgIHdyb3RlOgo+Pj4+IEFkZCBiaW5kaW5ncyBhbmQg
ZHJpdmVyIHN1cHBvcnQgQW1sb2dpYyBTNy9TN0QvUzYgU29Dcy4KPj4+IFRoZXJlIGlzIGFuIG9s
ZCByZXBvcnQgdGhhdCBnb3QgbG9zdCwgc3RhdGluZyB0aGF0IHRoZSBjdXJyZW50Cj4gCj4gWGlh
bndlaSBaaGFvIHRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbi4KPiBJIGFtIHRoZSBhdXRob3Ig
b2YgdGhlIG9sZCByZXBvcnQgYW5kIHRoZSBjb3JyZXNwb25kaW5nIHBhdGNoIGFuZCBpdCdzCj4g
bm90IGxvc3QuIFNvIGlmIHRoZSBwYXRjaCBpcyBjb3JyZWN0IEknbGwgYmUgZ2xhZCB0byBhZGQg
cmVsZXZhbnQKPiB0ZXN0ZWQtYnkgdGFncy4KPiAKCkkgd2lsbCB1c2UgeW91ciBwYXRjaCBhbmQg
d29uJ3Qgc2VuZCBhIHNlcGFyYXRlIG9uZS4KRG8geW91IG1lYW4gSSBzaG91bGQgYWRkIGEgVGVz
dGVkLWJ5IHRhZyB0byB5b3VyIHBhdGNoPwoKPj4+IHB3bS1tZXNvbiBkcml2ZXIgaGFzIGFuIG9m
Zi1ieS1vbmUgZXJyb3Igd2l0aCB0aGUgaGkgYW5kIGxvIGZpZWxkczoKPj4+IFswXQo+Pj4gU2lu
Y2UgeW91IGFyZSB3b3JraW5nIG9uIGJyaW5naW5nIHVwIGEgbmV3IHBsYXRmb3JtOiBpcyB0aGlz
IHNvbWV0aGluZwo+Pj4geW91IGNhbiB2ZXJpZnkgaW4geW91ciBsYWI/Cj4+PiBUbyBiZSBjbGVh
cjogSSdtIG5vdCBleHBlY3RpbmcgeW91IHRvIHdvcmsgb24gdGhpcyBhZC1ob2Mgb3IgYnJpbmcg
YQo+Pj4gcGF0Y2ggaW50byB0aGlzIHNlcmllcy4gSG93ZXZlciwgaXQgd291bGQgYmUgZ3JlYXQg
aWYgeW91IGNvdWxkIHZlcmlmeQo+Pj4gaWYgdGhlIGZpbmRpbmdzIGZyb20gWzBdIGFyZSBjb3Jy
ZWN0IGFuZCBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2ggaW4KPj4+IGZ1dHVyZS4KPj4+Cj4+PiBUaGFu
ayB5b3UgYW5kIGJlc3QgcmVnYXJkcwo+Pj4gTWFydGluIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
