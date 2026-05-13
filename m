Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FE9CD37B6
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6EVWp4LGlq8Dl/hZq4+xWYHK2uMlkBKdJhUKIltKhU=; b=AsgYg9j/3bZ/exVANAZa8N0rwH
	gevv4poAAs/tZ2l1mEJ0iC8BvKHlRGZKBTBpc96332NhiBdcgJWTxaNZ0QN9ng9cUqXHAwZAHSqGH
	DUzvoMd3/kmV8ndhYI+tWcG5AjF9CrWYRo89AyfSAq58Hz5CiHziGVAF+TpCT7Ah+zE2tpUgM3PhX
	KAJneWuXDO6qQqITkblvz6LOdWDaz8c/mkoLimWzLEMun746UNHIWD+xAalgykYYAyMbQOZg2+2LW
	oLFPGJeAeg0Qur6WmxgHqx4/xI0idDr5qlyk1jK9wbxif0FOUd3x1hCh+y8IeM4eCm64XN243KKbR
	/oWKEsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5JA-00000001nwD-27FI;
	Wed, 13 May 2026 08:51:12 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5J7-00000001nvD-2hsq;
	Wed, 13 May 2026 08:51:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5CZPwOZNOluNrmOftsfr27BfloJaXQo0Cn9+j29QvmjS43wg/oo1Gtop0eccFZ8Bqy99JOlb42jLbmEiWaPYmPsM8d4tWXDm3MiztcnuZSxG9+5ArgTBr4wUXkTeNhEW+ArSX3QQKY4Ac5FB4YsOlMaPrqwEVAk2IJUWTQoleFOHYDuldEtV0KjDVDkK6divNlVCurWukdF9h67APwaGiVk0wHggZfhA0v/ip0tIzO45GOUnOx7JHN2HbmopVkzGi73Oj43Ye0WcPme4sid/smO7BNoyctaHJ72SV9s4T/b1/fV3gnxLEIA2sRfYDMo9WipMTcskVc81Gq02m7bng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHz2ZP/Yj/LVP4hC0jUYTBaLqWIPQwgf4nCmR7VfxG0=;
 b=jkX2v94LJFt9o8frhvB0XzvZgulstSlepXDB7JDVcVgcxWEntUAC1pdImH7smCt34+q2AkblF2OlF1DM51WA21+eoFTdZ3mk7SI/z+UISMM8AgpEHUs9Pe0B8rJJMiu97Y7KFsHmqShVEl2i2sPAwTB3lRRW1htN3lmeG+x8xILvb/ilEBDA8gck120MKRJnLWEGMRA2Eu4tcDgwZJxIxE6k6kPIJfSXZsTqD11bufS0zVXHN2Fz6/V0Qw2E+sApumEI4duHmnPuAPhRv3a3SLYaQO+AALxJ0wC8qa0y22NV7RRuUj4CQVnYT1zCnnyIazvBT3vJGno0vJXTJvEmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHz2ZP/Yj/LVP4hC0jUYTBaLqWIPQwgf4nCmR7VfxG0=;
 b=neV+CQx2oxY1jYIkiUnpaicSxSrVuHsOg+aReKuy5YCINx34w4GYfFaLluBXfcJLUp+QVpwWJD32GRDlPn5Pb3BChJjn/exCyYYB2YNnHQ6p0OYsIEUN8h1Rrl+GFxjbpmGzINUqf4UMFDlJRPPzR2aD8qxz4mEHXo4emb6ZHlXkN29ty1SI/QMJqXJQMWksbRyf4UbAqlKJs0sC8p6YO48QcB6HdQ8gLzvlGB4dJclLlgcPVWQ4K8bcqeNGhMNcr/MXxT2Aknn26fV7AUIu2YkqmM2HQWcxn/6ILOOrulgXOTPZR09HSl4LJglY+ZTTqKm5tqxCKFOKzOVJ0wGhbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7702.apcprd03.prod.outlook.com (2603:1096:101:10d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 08:51:02 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 08:51:02 +0000
Message-ID: <00d8ed18-f753-405a-9ba4-e044129bf33a@amlogic.com>
Date: Wed, 13 May 2026 16:50:57 +0800
User-Agent: Mozilla Thunderbird
From: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH 09/10] clk: amlogic: Add A9 peripherals clock controller
 driver
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-9-41cb4071b7c9@amlogic.com>
 <agH4_gClJW8CVV75@redhat.com>
In-Reply-To: <agH4_gClJW8CVV75@redhat.com>
X-ClientProxiedBy: SL2P216CA0182.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::12) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c2b986-5668-46ef-e45a-08deb0ccc2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hVPB+NcR/8jv68X8xZa+dwAPyqqCCGTLODwCR67vyXm8o5lKVK2bgF7t0oeOy9vpjRUPKKixsKzlQ38Wb9NnW2JRGNm39U5746GcHfRWF75DMfxJjR2ctHJVcHmJ2gKyLpGMOdHrkOJTp2QYtb2JTIjmE/d1bcIJrVb8iZ7en/uqk3vpNleic3OFYQNumXhrueP+VeEJ6bNa4DUL/05C3NOSGirq8MerwRhg1M2wwob5GsHrgnOaSbtuIulp3prBYZOO2stWEofoq045SG4ae6MlMB3npKKHXwVEpMcDkH7aVg6G7emwswwOYNm9h2kekiDntPmmVFIm+PhYjcJbi+wlRRTJEFJbYWbPNJsz8m1QY3qLLhW2BjJAww0wkyfuREPzOXdHKJbhPy9gRJ8hVOCIRnx3lbRL9b4nKPBRoPdSPR1drnKfj9DV5E/5KT7Nb37g4Kh1+CAV/j44fA7kMTB8UgxFvzJci+ORDj3JsEMU7+9yVLEo7ZGBVkGPR0Q0GHa0CPe5pWwR5uryAX2aBqpsFRfVWrn1u/HqL5vsZqRGHIAqLaSsl4B+pnKd6A4NLL2IcPlZwdODbU7eL7RkTD5B2DT5I6t+NTiXGDRzfjx+VKwoeGLsAmrZIJfJmg9gKL0GwelNaVvUdKRlLdNtt/ubRZZuLWxmU/zx9JJXTRw8ZuD3Z3yN7khSfIHcRfVM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnpCcC8veUY3QThJMG01bEFIQ2s2azNlNk9pbEVldURndmZwZkpvNGRqa2lX?=
 =?utf-8?B?T213WGpJY213aFl6M1NWcjBaRExMVldFY3kyWW5wM3h5YkZ6OHdSWVAybi85?=
 =?utf-8?B?TGh5WWljRTdqQ0htaE4zdXFNdU50b1VPeUZGL0FrUjVqeFpjM2hRMzdtZVBu?=
 =?utf-8?B?OU9MVFpIeGswdXdlT1d2K3JpN1NmTWtOamRHSktSbkxnWllhU2ljVndsenRX?=
 =?utf-8?B?QzB1WDg0N0hMdVg2OHNTRVR4TnI3MlpUdWNVSlZkbFIwMmo5WEtUdjhQWm4y?=
 =?utf-8?B?VGZlSjNNRkJ3VFZXMmwxZERXME56RlZQZDZVWFc4TDlDaW1YTTVnNmdFQWd5?=
 =?utf-8?B?SXIxaktDdVc4bGdqR3NCRmdvcFdMNnJOUjduT2REelNyYk1vYmovTjhpZzNS?=
 =?utf-8?B?dk1GeUVHK08rbTBvemhQZ09MeGF0R2FJYjBhZ0dWRFc0STV6R0xtTWVLSTNv?=
 =?utf-8?B?d29VVGNEQVdqbEhKVGo2bUVMMVBVbVNKblpHM0FpbXVLRFBXalRjWGJQc1lG?=
 =?utf-8?B?VTB6NkhTemJBU2dNVWhmeitXV0RyZGEvUjIzT1FYTTEvY2FQOW1BcjJUZ3Jy?=
 =?utf-8?B?eWh6T21uWjJQUC9SZE4wZWhlNThEcmFOcWg3L2tTS1ZWRXRRWDRXY3BkZHpB?=
 =?utf-8?B?VEdRQkxIdlRlY2pycjJnRlk2TFVFMkZzSmRJVnpLcGpIK2VuOE4rVDBwVmRW?=
 =?utf-8?B?WXlVanZUV3ZHbmtRZjUyZHJWckZMMzR1amtvYmNJVEZud1pXeVE0TENWRXlp?=
 =?utf-8?B?V2tVeTgrenRnVGhEMDEzRlJFRTJncFJmaGQ5YWRMSFM2aTl2LzNZbFgvY0pN?=
 =?utf-8?B?TGREV1dYZjgrMFkwdUFGcGVxL0R5VEJsdXF1Z05UUXl2UVdUZkxJZ2MvbTk3?=
 =?utf-8?B?bHRzWG5scUZyVGVwYjB0WCtUazFERVJyanNCUDU3MU00NkwveGhDMXgyRHFp?=
 =?utf-8?B?M054VjdGb0lTU2VzbWg1ZUtocXZKRnpUbmtmVzAyOUF1V05WcGxxTmdGeUFX?=
 =?utf-8?B?Q1ltVW04bm5nRy9LMldtNVBkVmF4dDBhc0c1UWdNS0w0MDRIWms1YlVwLzdR?=
 =?utf-8?B?VWpSZ3gwTEhDNFMrMmtXbms1SG84SkFvR2c5MXBuYWplU1Voa1d3TGpjZCtF?=
 =?utf-8?B?UFpHK0hIRWwyME1KRTVkQ0E0amhIN1FkTlY1ZXJCYWxxZStsYW1WRGZ1SWhR?=
 =?utf-8?B?emk0MGlnaFBxaS83dE0rV2ZpQTJubXBJdzBsZUY0bU9FQm8ybmwrK0VjSExI?=
 =?utf-8?B?dTFGWUt0RVV3UzhKL1dHb1NzNVF0TjYzSHN4QkxQcS9qeGJmZ2dKZ2Z3M2RC?=
 =?utf-8?B?YWhFS2JsWEtuQVovTEZuYkkrWnhGaWJVRUp1WjJXa0xOaFNBZUhiYS9KZG5r?=
 =?utf-8?B?LzIrUWRZYU1oMk5yVGV5blFqTi9nL2NWaGc2SVNUL3hBNFNLbmZJazVBNmZx?=
 =?utf-8?B?a2k0MHZLK2RmREZvVm1CY1FoS3JNMzJ0SkdHdTBZTDZPRXJtMWUvVUQzcE1B?=
 =?utf-8?B?Mk9mcE4xSmMzcVQ0bis2TEpydWZ0ekZhTjdlV2ZHSUdQNnpIcFZzN3MwenNo?=
 =?utf-8?B?eGxHVEZsK01sbkZhTEFsVEhlT2hjdU5GcEMybXcrUWFrYnZ3TTMxc1JVUUdZ?=
 =?utf-8?B?U3hwOCsycnlQZVlLcllmOGQ3b1RhZXl2QnBSWU1hbXM3L1VSV05yRjBIUWsy?=
 =?utf-8?B?V2hpR1ZZRUFRNnJsSm1kYS9tZmpzSEhBQkFlT0NhNDlDVlREVkF3WmxHRVZI?=
 =?utf-8?B?MDl6enlqcEZWWXRwS3JQeFdUdzVGQ0xXUTZQdEI4Mm9PU3hHLzM5TkFvelFK?=
 =?utf-8?B?QXYzWkdGRzlqdTBQYUgra1kzOUJWUU5YV2tGRmMxa3ZHSkkxeXc4S0hCdEgr?=
 =?utf-8?B?K2xjdmhJYlZQOFRFcERKclF2VTZMLzVhckdzRUg3czkwNWJ0OFdmOVAyZExT?=
 =?utf-8?B?ZjJ1RDV5dEZsdkd5NUp2RDdrUTlueU53dmZCRzJJK05ka2grVGFaVU1Tamcw?=
 =?utf-8?B?cXNCUU50SDlLMm8yWHNuZ3BzUXUwWkdDVisva0hlZFdnSFlWN2NyS1ZONzBu?=
 =?utf-8?B?MEw0K05hR2lGTlAzRXE4NU9KZzJzT1RLVFRwU0srbDNjczgzcFlNbVZOeVJI?=
 =?utf-8?B?M0ZLR3puTFR6eXJRV3huMnJsajZkbFF1SkYyMWZYUnlEYjdtaFJtck5Wb2Vl?=
 =?utf-8?B?b3FPSUx4M3dZVEJiMFZkLzNRSjNQK29BTTB4dTJaZmo2MjdQWGdmV0FKMUNZ?=
 =?utf-8?B?MWUrNTVzSGdvY3NTWENzTTN5b3BZODJkaDBMRFN3V3g4TG5ZY2k4OVl3UFNt?=
 =?utf-8?B?YjBBWjBQbjd3bWRrTGFmUFN1aE1mWGM3Tk5YYThyMXFZZWJyZzA2UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c2b986-5668-46ef-e45a-08deb0ccc2c1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:51:02.2616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ci+4SUTKvG+XLdz5P5bk+hmrRI2mnPRnv6NXDRA3Y7ZPEZa8KKzuwHkF6LS6PqbSR8KCFuOJhaRCRJd80nBZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_015109_695539_791C7946 
X-CRM114-Status: GOOD (  20.41  )
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

T24gNS8xMS8yMDI2IDExOjQyIFBNLCBCcmlhbiBNYXNuZXkgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4KPiBIaSBKaWFuLAo+Cj4gT24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMDg6NDc6MzFQ
TSArMDgwMCwgSmlhbiBIdSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4+IEZyb206IEppYW4gSHUgPGpp
YW4uaHVAYW1sb2dpYy5jb20+Cj4+Cj4+IEFkZCB0aGUgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJv
bGxlciBkcml2ZXIgZm9yIHRoZSBBbWxvZ2ljIEE5IFNvQyBmYW1pbHkuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMv
Y2xrL21lc29uL0tjb25maWcgICAgICAgICAgfCAgIDE1ICsKPj4gICBkcml2ZXJzL2Nsay9tZXNv
bi9NYWtlZmlsZSAgICAgICAgIHwgICAgMSArCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vYTktcGVy
aXBoZXJhbHMuYyB8IDIzMTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+
ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMzMzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xrL21lc29uL0tjb25maWcgYi9kcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnCj4+
IGluZGV4IDM1NDllNjdkNjk4OC4uNDhhMTVhNWUxMzIzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2Nsay9tZXNvbi9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL0tjb25maWcKPj4g
QEAgLTE0NSw2ICsxNDUsMjEgQEAgY29uZmlnIENPTU1PTl9DTEtfQTlfUExMCj4+ICAgICAgICAg
IGRldmljZSwgQUtBIEE5LiBQTExzIGFyZSByZXF1aXJlZCBieSBtb3N0IHBlcmlwaGVyYWwgdG8g
b3BlcmF0ZS4KPj4gICAgICAgICAgU2F5IFkgaWYgeW91IHdhbnQgQTkgUExMIGNsb2NrIGNvbnRy
b2xsZXIgdG8gd29yay4KPj4KPj4gK2NvbmZpZyBDT01NT05fQ0xLX0E5X1BFUklQSEVSQUxTCj4+
ICsgICAgIHRyaXN0YXRlICJBbWxvZ2ljIEE5IFNvQyBwZXJpcGhlcmFscyBjbG9jayBjb250cm9s
bGVyIHN1cHBvcnQiCj4+ICsgICAgIGRlcGVuZHMgb24gQVJNNjQKPiBkZXBlbmRzIG9uIEFSTTY0
IHx8IENPTVBJTEVfVEVTVAoKCk9rLCBJIHdpbGwgYWRkIENPTVBJTEVfVEVTVCBpbiB0aGUgbmV4
dCB2ZXJzaW9uLgoKPj4gKyAgICAgZGVmYXVsdCBBUkNIX01FU09OCj4+ICsgICAgIHNlbGVjdCBD
T01NT05fQ0xLX01FU09OX1JFR01BUAo+PiArICAgICBzZWxlY3QgQ09NTU9OX0NMS19NRVNPTl9D
TEtDX1VUSUxTCj4+ICsgICAgIHNlbGVjdCBDT01NT05fQ0xLX01FU09OX0RVQUxESVYKPj4gKyAg
ICAgc2VsZWN0IENPTU1PTl9DTEtfTUVTT05fVklEX1BMTF9ESVYKPj4gKyAgICAgaW1wbHkgQ09N
TU9OX0NMS19TQ01JCj4+ICsgICAgIGltcGx5IENPTU1PTl9DTEtfQTlfUExMCj4+ICsgICAgIGhl
bHAKPj4gKyAgICAgICBTdXBwb3J0IGZvciB0aGUgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxl
ciBvbiBBbWxvZ2ljIEEzMTFZMyBiYXNlZAo+PiArICAgICAgIGRldmljZSwgQUtBIEE5LiBQZXJp
cGhlcmFscyBhcmUgcmVxdWlyZWQgYnkgbW9zdCBwZXJpcGhlcmFsIHRvIG9wZXJhdGUuCj4+ICsg
ICAgICAgU2F5IFkgaWYgeW91IHdhbnQgQTkgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlciB0
byB3b3JrLgo+PiArCj4+ICAgY29uZmlnIENPTU1PTl9DTEtfQzNfUExMCj4+ICAgICAgICB0cmlz
dGF0ZSAiQW1sb2dpYyBDMyBQTEwgY2xvY2sgY29udHJvbGxlciIKPj4gICAgICAgIGRlcGVuZHMg
b24gQVJNNjQKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL01ha2VmaWxlIGIvZHJp
dmVycy9jbGsvbWVzb24vTWFrZWZpbGUKPj4gaW5kZXggNzc2MzYwMzMwNjFmLi4yYjViNjdiMTRl
ZmMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvY2xrL21lc29uL01ha2VmaWxlCj4+ICsrKyBiL2Ry
aXZlcnMvY2xrL21lc29uL01ha2VmaWxlCj4+IEBAIC0yMCw2ICsyMCw3IEBAIG9iai0kKENPTkZJ
R19DT01NT05fQ0xLX0FYR19BVURJTykgKz0gYXhnLWF1ZGlvLm8KPj4gICBvYmotJChDT05GSUdf
Q09NTU9OX0NMS19BMV9QTEwpICs9IGExLXBsbC5vCj4+ICAgb2JqLSQoQ09ORklHX0NPTU1PTl9D
TEtfQTFfUEVSSVBIRVJBTFMpICs9IGExLXBlcmlwaGVyYWxzLm8KPj4gICBvYmotJChDT05GSUdf
Q09NTU9OX0NMS19BOV9QTEwpICs9IGE5LXBsbC5vCj4+ICtvYmotJChDT05GSUdfQ09NTU9OX0NM
S19BOV9QRVJJUEhFUkFMUykgKz0gYTktcGVyaXBoZXJhbHMubwo+PiAgIG9iai0kKENPTkZJR19D
T01NT05fQ0xLX0MzX1BMTCkgKz0gYzMtcGxsLm8KPj4gICBvYmotJChDT05GSUdfQ09NTU9OX0NM
S19DM19QRVJJUEhFUkFMUykgKz0gYzMtcGVyaXBoZXJhbHMubwo+PiAgIG9iai0kKENPTkZJR19D
T01NT05fQ0xLX0dYQkIpICs9IGd4YmIubyBneGJiLWFvY2xrLm8KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL21lc29uL2E5LXBlcmlwaGVyYWxzLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9hOS1w
ZXJpcGhlcmFscy5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAw
MC4uMzM4YTkxYzQ3M2VhCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvZHJpdmVycy9jbGsvbWVz
b24vYTktcGVyaXBoZXJhbHMuYwo+PiBAQCAtMCwwICsxLDIzMTcgQEAKPj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIE1JVCkKPj4gKy8qCj4+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMjYgQW1sb2dpYywgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkCj4+ICsgKi8K
Pj4gKwo+PiArI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5oPgo+PiArI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPgo+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2Ft
bG9naWMsYTktcGVyaXBoZXJhbHMtY2xrYy5oPgo+PiArI2luY2x1ZGUgImNsay1yZWdtYXAuaCIK
Pj4gKyNpbmNsdWRlICJjbGstZHVhbGRpdi5oIgo+PiArI2luY2x1ZGUgInZpZC1wbGwtZGl2Lmgi
Cj4+ICsjaW5jbHVkZSAibWVzb24tY2xrYy11dGlscy5oIgo+IFNvcnQgdGhlIGhlYWRlcnMuCgoK
T2ssIEkgd2lsbCBwbGFjZSB0aGVtIGluIG9yZGVyLgoKQWZ0ZXIgdXBkYXRlZDoKCiNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGE5LXBlcmlwaGVyYWxzLWNsa2MuaD4KI2luY2x1
ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5oPgojaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNl
Lmg+CiNpbmNsdWRlICJjbGstcmVnbWFwLmgiCiNpbmNsdWRlICJjbGstZHVhbGRpdi5oIgojaW5j
bHVkZSAibWVzb24tY2xrYy11dGlscy5oIgojaW5jbHVkZSAidmlkLXBsbC1kaXYuaCIKClsuLi4u
Li5dCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSBhOV9ubmFfcGFyZW50
c1tdID0gewo+PiArICAgICB7IC5md19uYW1lID0gInh0YWwiLCB9LAo+PiArICAgICB7IC5md19u
YW1lID0gImZkaXYycDUiLCB9LAo+PiArICAgICB7IC5md19uYW1lID0gImZkaXY0IiwgfSwKPj4g
KyAgICAgeyAuZndfbmFtZSA9ICJmZGl2MyIsIH0sCj4+ICsgICAgIHsgLmZ3X25hbWUgPSAiZmRp
djUiLCB9LAo+PiArICAgICB7IC5md19uYW1lID0gImZkaXYyIiwgfSwKPj4gKyAgICAgeyAuZndf
bmFtZSA9ICJncDIiLCB9LAo+PiArICAgICB7IC5md19uYW1lID0gImhpZmkiLCB9Cj4gaGlmaSBp
c24ndCBpbiB0aGUgZHQgYmluZGluZ3MuIFNob3VsZCB0aGlzIGJlIGhpZmkwIGFuZC9vciBoaWZp
MT8KCgpJdCBzaG91bGQgYmUgaGlmaTDvvIxJIHdpbGwgZml4IGl0IGluIHRoZSBuZXh0IHZlcnNp
b24uCgpUaGFuayB5b3UgZm9yIHBvaW50aW5nIGl0IG91dC4KClsuLi4uLi5dCj4+ICsKPj4gK3N0
YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBhOV9zYyA9IHsKPj4gKyAgICAgLmRhdGEgPSAmKHN0cnVj
dCBjbGtfcmVnbWFwX2Rpdl9kYXRhKSB7Cj4+ICsgICAgICAgICAgICAgLm9mZnNldCA9IFNDX0NM
S19DVFJMLAo+PiArICAgICAgICAgICAgIC5zaGlmdCA9IDE2LAo+PiArICAgICAgICAgICAgIC53
aWR0aCA9IDQsCj4+ICsgICAgIH0sCj4+ICsgICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2lu
aXRfZGF0YSkgewo+PiArICAgICAgICAgICAgIC5uYW1lID0gInNjIiwKPj4gKyAgICAgICAgICAg
ICAub3BzID0gJmNsa19yZWdtYXBfZGl2aWRlcl9vcHMsCj4+ICsgICAgICAgICAgICAgLnBhcmVu
dF9od3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICZhOV9zY19wcmUuaHcKPj4gKyAgICAgICAgICAgICB9LAo+PiArICAgICAgICAgICAgIC5u
dW1fcGFyZW50cyA9IDEsCj4+ICsgICAgICAgICAgICAgLmZsYWdzID0gQ0xLX1NFVF9SQVRFX1BB
UkVOVCwKPj4gKyAgICAgfSwKPiBZb3UgY2FuIHVzZSBDTEtfSFdfSU5JVF9IV1MoKSBoZXJlLgo+
Cj4gQnJpYW4KCgpPaywgSSB3aWxsIHVzZSBDTEtfSFdfSU5JVF9IV1MgaW5zdGVhZCwgYW5kIHRo
ZSBzYW1lIGJlbG93LgoKCkJlc3QgcmVnYXJkcywKCkppYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
