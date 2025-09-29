Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B4ECAC5B0
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Sep 2025 09:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXW8TSLfy9eNJWGe3WdB7y5fI5pz8zx6qXgDbuNxX48=; b=zCuFFMeLLukjoDeaMMeCx4mmKr
	XMsuxVHTMdrCXCtgrVzdJIsAT48RIZWR7PtQgywGfGmOYEzQJDFlgUm1CBBQZXiOhIVDM55MaSNaV
	cnuIsRiIn5D4YxHpLgRA0HNMNNznpRAY/O7XC39KFgGDiZl7laG+VKbJ1P95Gj7FSWao2eUUxdyDd
	x4FllweWfWnfm2tZKtJa2Rsd7KjjSsSerhAC04EtmBZK4ipcnXWfzIdZW2km6pHUd70tRmhnRO/iP
	vW1XyPU5emKmyjS1S/oG3dvV2xl3O8zT+AVNPUYdVcf3hIWCjxvrj4TwPgq4jkUzQ3ZZIPPuOhCKH
	gpLO5ejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AEa-00000001yro-377v;
	Mon, 29 Sep 2025 09:31:52 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AEY-00000001yq4-12Al;
	Mon, 29 Sep 2025 09:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=La0cnvT4cYOzJPWL/ihImE5wZLCbK/Bc/BeyhnxzD+/3Sk1EO7eInLgw1p8qZisxIMLxe6XAHQFx2XQQ6ahoWZNyaOLLRqkyBaFC7rWjRdMcepzNeqTXFyhcaNofdAlL0I5gu69kzpET86nEEghQ9Zt2TVFqKsVUc7yYniN+NSYFWiLQYVgZD78XcpBjreD0P6byeSd6Yoag7h30ZIwtJDOo6rToHeS8ZcEIYBS5yZsLwcYHL7VufCQio56gfY4s71RachSq3Ql5GkIwqxoOxptgaZXJ7MjgA6DwqrNpv9V3O0jdp5I1eF2ItzZLLekYFhFVCe5xPhcXu0ly6CoMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6js61FF3XzIpiviMctRcf9MyKu6wVA9+NNyDgU9sXY=;
 b=ngsPTAtpgpAgC/IxLwHAXaHC/E5kpL5PEOLC+PMcevQoYVG3sisFJVVZB2Wgoyed2OPdrA+qYbtlOm79K3c6pVOUQxWpe6upObZI9UxOsvQ8qNwt/GMvUpbhzRC6+oU/8RIqZB+c8LBm29rozbyRWIz/E7HcGGwsKXJHYHg2vPtzrIV1xNiK3EM7D/gWZHZ1TWxPIj9EnSfUvLEdX/vusAIZ/TKxb1muiQq7NbieYF8Sg5urKg1mFIKYFhkNNHOz85hmZzuJc7Qt3Q0cg8Xh1f7HN4GxeprYleXevlTfRUqXqdGNMC27/GJH91a6iC5HkPdI2NStXdkZQAmyzKh4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6js61FF3XzIpiviMctRcf9MyKu6wVA9+NNyDgU9sXY=;
 b=wE0s3H77GDgIg4c2zuh/UDzsC28EBZygKQ4ko4AcGXBfcHEnY69XP5j1BJx0LWQ1MndtoS8d3DM7c3WrzXHCOpFWxv33hwz/YtZLWqWAP/kxKS3iNE8nyb00cCjz4tKm8/85SrYickZL9Wm3H6d7hfBCpJZGC54RkgmFnzRb8x377/wIEv8/qWL653KSKsHHxYhj0/k+M4/cpwWqKOgX8wX1STzfUtIgp8AXu2WiEjSsrs/WkDIHt27BoRp+f1Xy36VB5ElZuevB6KNwxq4F/U5WmMmIJ+rRj7FpPZJYjcvrU7giteXnM9Wv0Rq+lUblg/RF36NBVzzc5B6zhL/S+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7576.apcprd03.prod.outlook.com (2603:1096:400:427::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 29 Sep
 2025 09:31:40 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 09:31:40 +0000
Message-ID: <36cd6282-ae1d-43f3-8738-592f043d0ba6@amlogic.com>
Date: Mon, 29 Sep 2025 17:31:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
 <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
 <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
 <20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
 <1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
 <e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
 <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
 <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
 <1jfrc563wa.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jfrc563wa.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: f639bc76-1b94-440e-e445-08ddff3afecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2M4TTA0dHdXcXNhaEVhRjBXZVlhNXFvL01qTXVTVXhQRlVudzhuL3ZjZzla?=
 =?utf-8?B?azRnK2xVVXp1ZHdLUXpqdU1lNEN0UEdxM1BhMTJydkJMcFJhb2x6OVRidm1w?=
 =?utf-8?B?YzFmV1A0N0pVVmY1KzRqa0VOZlpvVnNNVEV3SSthSDlhZ2lERUVmUWdKbFhy?=
 =?utf-8?B?UGtpT0MwVk44a1NYYkZHajQrUnZoZUQvUlo4dVJlK1V2NWZtVGZlcVFyWXhw?=
 =?utf-8?B?MWhQanA1NEdKdkl5cGg3MHoyYkdScnB5WWMzamtBWXlFL2pzZTFURWt5ME15?=
 =?utf-8?B?TDNnZXN2Si9ONzlVSDY1WExRem5BcjZ5bDV4V0dVSjBmeUhaTEcwdTRiZE00?=
 =?utf-8?B?dzMyRDFUUEZxbjF1aVM3L24xWWVzUDd6Yy9FaU8vdCs2K2FMczZMSmxiTG56?=
 =?utf-8?B?ZzRQWFFJZlZJemZ6ZXpJRFR2c3JMamRUZ0hCRFNsUkVNdVdMaXRIWlhVM3pv?=
 =?utf-8?B?NkcrMms4NnV4M2F4L2M3amlCYU9tak1DcVcyNC9yUloxdi9QeDAxVFk1dXRn?=
 =?utf-8?B?VUNUYkYzekVEOGlRZVdqa2ZaZGRsNkdGc3NtSWFGcmJnVC8vc0VKZGdvVDhV?=
 =?utf-8?B?V0EzbnlnRjJnQVJBSWtwWU9BbWVOUkpmM0FkOWIyRHFQNzZXWGFHTGFOUmNT?=
 =?utf-8?B?ekNIMzI3MWJxWnBoeThkOHFoRzdlZTVwUDczN0VBd2dIUGwvTXN3cVdLYUNJ?=
 =?utf-8?B?ZEN2SG51OGp5VXQwcE5NdVhYeUpJYi84WnJtRStQRTlXWWErenhWWHgzbTEy?=
 =?utf-8?B?b3BrbS9SSWp1MlZnUkxGbCs2WkJEQWM1WThyN3RjazNRYTVsMUMvQWxKZTRK?=
 =?utf-8?B?WnhrUHFTQU8yUDR1RmN4bXU1eWY0dlhWRnByN0VYNTdnaFBQRzBDMCs4a04r?=
 =?utf-8?B?Z0xtVjhLS3dCZ2E4UzVVci85L2RIVXgxdVNsZHlOa0c0Y2s3dEVONUdBT21W?=
 =?utf-8?B?U2Q5YW5SVzdtUmdOVFU3RjBiVDF2MWRoSkdZVHZZOFlpM0hkUG02ZFFzbWZa?=
 =?utf-8?B?MGY2VWllbjhOcFQ5bFVnR1FOczlHUFBDemVlL1dBRFhZK21nZk1rVGo2d0tq?=
 =?utf-8?B?TGFxQVN1L282SlRMbGY5QXBrNXN5a0tpRm12alRCY1FmaTM5Vk5temFSNDVQ?=
 =?utf-8?B?WlV3MHg0dHBsc3gzZ1hsUWtxUjJDM3M3aFpodHBRbGpQbE9zUzRsbHIrd3dt?=
 =?utf-8?B?R3pPQXZZM2d5WWdQdWFvQ1VVM2lBeTRDRS9ZSERkZEhzWFpxcWcrbHNqWG0y?=
 =?utf-8?B?K3RaUEZQaktMVldVeExOVEU4TGh2WEZ3a1pSYkxOMy9pQUxyQU5tTUlqaDlr?=
 =?utf-8?B?Ykpxb0RsMmQ1bXc2Yjk4Zm0vOE8zQ29PTE5jcUtWejIxWlFLS1Z1UzJ5Q1Ay?=
 =?utf-8?B?UWlXMyswcTU1NEIxbXhtRm81djhQaUk5L2Zqend4Y3NLcmh3WjN4aUlrbit2?=
 =?utf-8?B?RDAzTTV2K2RCVWRPdWRvdUNNa2oza2oxRGxka3AxQjVoVmJad0ZoRGI0eUNB?=
 =?utf-8?B?bk43T3pFY3pIN0ZCeUk2Z3FNeFBjdDlvTlJnU2VpRXdaNE5jKys3UFlsN21Z?=
 =?utf-8?B?RkFMdDIvWG1xYzlUZlV0elpzODA0VGxSRVQ2UGd5WFdDTFRuQ2wzWDdkWE5m?=
 =?utf-8?B?U3F1c1NMcWxRQmpvV2pvRGdGeE1RVlBVbEpsRFppQ3hPODJjbVp2NWdGR0ZR?=
 =?utf-8?B?S0pod1VxaXZ6K2Q0T3YyckFObk5WdjR0R3ZScGxvRlBWUEU0eEJLajNqMHNy?=
 =?utf-8?B?VkROaGxkZGQvbmFzTCtIMXd5QlF0WE56enR2UnVacm9Lb3pHS0xvTzdxNkc5?=
 =?utf-8?B?NktwZWxrVmpFaFF6UjFLWHRDM285UER4bi9ZTThaMEVQR0tHNmRHRFV0WVpS?=
 =?utf-8?B?eWltalk3TEhQOGFGNDBiU0VFeHUyd1ZIWFNjQnMzM3ZRZ0dQakxvRDlRL3Za?=
 =?utf-8?Q?7yacMEjALtviR4nr31VVzzP+FmW0eqec?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzd4MGUvOGxYOVprUWdVMUYvTUx6bkJtai9URlZ4bXlYMDhWSHFEWm94Y0Ra?=
 =?utf-8?B?Z0c4cFVJSDJSaC9VdVhTLzYvblJYQi9GY3g1MGlXUEJNT003WDV5bnErVmx6?=
 =?utf-8?B?RkFXMzYzc2p4cVZIMERZc0diU3pUN0JrckoxRUxtVk1RVmZGeXE3RStTRWVL?=
 =?utf-8?B?TzFnbHpFaHNVYlRRZW1kdWNzcHQ4VXA2d01aTmZHNjBBeVdNQnoxMDg5ZElG?=
 =?utf-8?B?K2cxTVNOY2c4ZmNFVDYzL1JBY0ZTaUhTc3Yyd1BhRE5Kc0FOWDBBVEY4c2hv?=
 =?utf-8?B?SzFwSmFtOEpBdUpidWQycVBtQkVLNXk2MlRlOTV3TFU4MW1tV1JBS3FHQ0tB?=
 =?utf-8?B?WFVWWGt0QjdkdkJFV2lPZmZNSUpTYVFJSlNUM1hvMUJKQytFbDhBU2JXeG16?=
 =?utf-8?B?Z3czcXFHQThmcDl6WW8zd20zSzE4VG9BSXpiMnBvZXRubGhES3dyT0E5dU0x?=
 =?utf-8?B?YWcyckxONWYwS2d0dEd1YW43WEF1S0hUazhrSmo0d2NURWhwZGV2U1pKNVZV?=
 =?utf-8?B?OGxkQVlSTXpYWW54TUVWSDVSWHRRcktNb2pzMUtDOWZ3ZUF2RFdYSERGSmlo?=
 =?utf-8?B?TmxQdjl6VHRIVnhqdG9FR0JuMVJZWVRESTNFY252UDUzbSs0Mnd1Y2xqYk9J?=
 =?utf-8?B?U3FRNnBpNTVqNVE2SXlNVGsvekxlYXlSc05qTXZqSFBjSGZiVCtqbVg0Y0JE?=
 =?utf-8?B?TGprbWxmSnpLcHB4dnU0RzRoMEh4c29McjMwZ0s4eE12N0hmcDVEVEFYQ25K?=
 =?utf-8?B?amVvMS9nL3U4cXlyU0F4RkI1TUIvVDJ4RUZvK1l4N21MZ0tFa2plc2FCTVpZ?=
 =?utf-8?B?Tm1rWWFFR3FPZnRhVUFxTFFpS0hRUitxa2RieGJUbXd1VTRBZWxXYVBhbUpt?=
 =?utf-8?B?TkhGVzZRdTlROGFFVVFqQVFKbStPa0xsd1hSeVJsRHgzY2JUeXFQVEl2ckto?=
 =?utf-8?B?NlFSdFpNS1U5UGt4M0dRcHh0QkNQc3pXU0FuSFRJaWJicFl1bzdLb1V4R0JW?=
 =?utf-8?B?c3MzbFNTT0s4bzllZHN1U05LNFdtTkcyK1l0TFhKa3FpVXY5ZGdQcUxXRFY3?=
 =?utf-8?B?M1ovYVh3eTlyZEwxZ1hZY0lnZ2tvOVd0ZmJPcGFyd3BBdVN5SHZRVFQxZkFD?=
 =?utf-8?B?eXJEK0FKclZHWWptbGd6SHV6TVJ6NWxjMGx5THlxcXd0b2dlaHdiekpNVHJU?=
 =?utf-8?B?NDVKUXBXdFRwcGRuYjRPWXVLZzNkakVvTnNDanR1VTVHZFY2OUVqY3NlRzVt?=
 =?utf-8?B?SVpWelh4Z0h3NTFEb2c1YmZrc1ZnUHVSemNkOTM3UTloVTJOMmpGNWliMTFD?=
 =?utf-8?B?SGZmdm0rRG0yVTBaU2VlMUtaU0ZRVlZiK2VxVU13d29sL2RwRVNMQ1VVa3Bq?=
 =?utf-8?B?VjdhTkg2ZHJHYWZ6eUNRRU9iN0VRemdiS2V5ZzI3UzVyTEVOYjhQeXZ4SzV1?=
 =?utf-8?B?L1NMT0xBcHFmdmxGUnFpTmZpWGFmemkzVnFGYWdXWlJZQ2E0a0dpV0dpb25i?=
 =?utf-8?B?ZUQ3UFNsTlZLclFwZGNWaXQrbURxK3pNeVJPNmMrZmd5dmlYd3pTdkZmaDVN?=
 =?utf-8?B?QlR4M0tjcGd6bzlEUkxoWk8wY3JiNk5zbnFlUCs1VnBCb3AwREoxS0JhaHl4?=
 =?utf-8?B?c0tRSWc5MzNDemJ3ekplb1B5Vk9aYXpNV2VFc29hLzVqOVovNEZCQXg0SkhZ?=
 =?utf-8?B?R3dRN1Y3M2ZDbG1uZTdweHFYOEVIcE5MU1BvN1g4cXZGVVNGc0FSS2h3aFds?=
 =?utf-8?B?T1NPY0JnSUFKZXpxVGI3a2ZoYUgwTGdydVJzeUtVaUNIdGE2VVByRDlBYkkv?=
 =?utf-8?B?YlgveG9uenZjNi9Ra2lnV1laYm00Y3dpWWUvaXgvdUtTTXczUVBseFA1ZmJx?=
 =?utf-8?B?NC9FM0llS1BheWNzT3M5RkJlaDBHM3ZlVXpINlhUOHhpc0tNZUlzN3ZIRnNL?=
 =?utf-8?B?NENFR2xtVXpNQUZoZndFUkFjRGh6anQrWFEyTVpOeHpBMnlQZmtCOFpXa1lS?=
 =?utf-8?B?YkVHd3pXMk42ZHFMTWRqTEtFSlhtZ1ZOZHk0RGpQNm5PcEM5Z3BVay9TOVB0?=
 =?utf-8?B?M1lvaFhhc3BReHFWcmY2aWtRaXBqRitBcEI1ZFNIeDJLUXhaejhRQktZYzlX?=
 =?utf-8?Q?SNObewiR462tb7qBCjhTjxdH7?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f639bc76-1b94-440e-e445-08ddff3afecc
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 09:31:40.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yncgKn2wxgcez5we+oQ+bgV4DojWhzitfE6kRbYgqZTFrBUZVPK9Svm2Jf13OYeVWcLhUfZ+Dg/pswOU041Y9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_023150_299827_FCEDCA7D 
X-CRM114-Status: GOOD (  24.82  )
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

Ck9uIDkvMjkvMjAyNSA0OjQ4IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gT24gU3VuIDI4IFNlcCAyMDI1IGF0IDIyOjU1LCBNYXJ0aW4gQmx1bWVuc3Rp
bmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+PiBIZWxs
bywKPj4KPj4gT24gU3VuLCBTZXAgMjgsIDIwMjUgYXQgODo0MeKAr0FNIENodWFuIExpdSA8Y2h1
YW4ubGl1QGFtbG9naWMuY29tPiB3cm90ZToKPj4+Cj4+PiBPbiA5LzI4LzIwMjUgMjowNSBQTSwg
Q2h1YW4gTGl1IHdyb3RlOgo+Pj4+IEhpIEplcm9tZSAmIE1hcnRpbjoKPj4+Pgo+Pj4+IFNvcnJ5
IGZvciB0aGUgaW1wcmVjaXNlIGRlc2NyaXB0aW9uIG9mIHRoZSBnbGl0Y2gtZnJlZSBtdXggZWFy
bGllci4KPj4+Pgo+Pj4+IFJlY2VudGx5LCB3aGlsZSB0cm91Ymxlc2hvb3RpbmcgYSBDUFUgaGFu
ZyBpc3N1ZSBjYXVzZWQgYnkgZ2xpdGNoZXMsCj4+Pj4gSSByZWFsaXplZCB0aGVyZSB3YXMgYSBk
aXNjcmVwYW5jeSBmcm9tIG91ciBwcmV2aW91cyB1bmRlcnN0YW5kaW5nLAo+Pj4+IHNvIEknZCBs
aWtlIHRvIGNsYXJpZnkgaXQgaGVyZS4KPj4gWy4uLl0KPj4+IEFuIGV4YW1wbGUgb2YgdGhlIGNs
b2NrIHdhdmVmb3JtIGlzIHNob3duIGJlbG93Ogo+Pj4KPj4+Cj4gICAgICAgICAgICAgICAgICAg
ICAgIDEgICAgICAgICAgICAgICAgICAyCj4gICAgICAgICAgICAgICAgICAgICAgIHYgICAgICAg
ICAgICAgICAgICB2Cj4+PiAgICAgICAgICBfXyAgICBfXyAgICBfXyAgICBfXyAgICBfXyAgICBf
XyAgICBfXyAgICBfXwo+Pj4gb3JpOiAg4oaRICB8X1/ihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/i
hpEgIHxfX+KGkSAgfF9f4oaRICB8X1/ihpEgIHxfX+KGkQo+Pj4gICAgICAgICAgICAgICAgICAg
ICBeCj4+PiAgICAgICAgICAgICAgICAgICAgIDEgKiBjeWNsZSBvcmlnaW5hbCBjaGFubmVsLgo+
Pj4gICAgICAgICAgXyAgIF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBf
Cj4+PiBuZXc6ICDihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEg
fF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEKPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgNSAqIGN5Y2xlcyBuZXcgY2hhbm5lbC4KPj4+ICAgICAgICAgIF9fICAgIF9fICAgICAg
ICAgICAgICAgICAgICAgICAgXyAgIF8gICBfICAgXwo+Pj4gb3V0OiAg4oaRICB8X1/ihpEgIHxf
X19fX19fX19fX19fX19fX19fX19f4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRCj4+PiAgICAg
ICAgICAgICAgICBeICAgICAgICAgICAgICAgICAgICAgICAgXgo+Pj4gICAgICAgICAgICAgICAg
c3RhcnQgc3dpdGNoaW5nIG11eC4gICAgIHN3aXRjaCB0byBuZXcgY2hhbm5lbC4KPiBPayAuLi4g
YnV0IHdoZW4gaXMgaXQgc2FmZSB0byBkaXNhYmxlIHRoZSAib3JpIiBjbG9jayA/Cj4gQ2FuIHlv
dSBkbyBpdCBhdCAnMScgYWxyZWFkeSA/IG9yIGRvIHlvdSBoYXZlIHRvIHdhaXQgZm9yICcyJyA/
CgoKSXQgc2hvdWxkIHdhaXQgZm9yICIyIiwgYmVjYXVzZSB0aGVyZSBpcyBhIHN0YXRlIG1hY2hp
bmUgaW4gdGhlCmdsaXRjaC1mcmVlIG11eCwgdGhpcyBzdGF0ZSBtYWNoaW5lIGlzIGRyaXZlbiBi
eSB0aGUgd29ya2luZyBjbG9jawpwcm92aWRlZCBieSBpdHMgY2hhbm5lbCAwLgoKCj4KPj4gVGhh
bmsgeW91IGZvciB0aGUgZGV0YWlsZWQgcmVwb3J0IQo+PiBUaGlzIGlzIGluZGVlZCBwcm9ibGVt
YXRpYyBiZWhhdmlvci4gSSBndWVzcyB0aGUgcmVzdWx0IGlzIHNvbWV3aGF0Cj4+IHJhbmRvbTog
ZGVwZW5kaW5nIG9uIGxvYWQgKHBvd2VyIGRyYXcpLCBzaWxpY29uIGxvdHRlcnkgKHF1YWxpdHkp
LAo+PiB0ZW1wZXJhdHVyZSwgdm9sdGFnZSBzdXBwbHksIC4uLiAtIG9uZSBtYXkgb3IgbWF5IG5v
dCBzZWUgY3Jhc2hlcwo+PiBjYXVzZWQgYnkgdGhpcy4KPj4KPj4gQmFzZWQgb24gdGhlIHByZXZp
b3VzIGRpc2N1c3Npb24gb24gdGhpcyB0b3BpYywgbXkgc3VnZ2VzdGlvbiBpcyB0bwo+PiBzcGxp
dCB0aGUgb3JpZ2luYWwgcGF0Y2g6Cj4+IC0gb25lIHRvIGFkZCBDTEtfU0VUX1JBVEVfR0FURSB3
aGVyZSBuZWVkZWQgKEkgdGhpbmsgdGhlIG1lc29uOGIuYwo+PiBkcml2ZXIgYWxyZWFkeSBoYXMg
dGhpcyB3aGVyZSBuZWVkZWQpIHRvIGFjdHVhbGx5IGVuYWJsZSB0aGUKPj4gZ2xpdGNoLWZyZWUg
bXV4IGJlaGF2aW9yCj4+IC0gYW5vdGhlciBvbmUgd2l0aCB0aGUgQ0xLX09QU19QQVJFTlRfRU5B
QkxFIGNoYW5nZSAobWVzb244Yi5jIHdvdWxkCj4+IGFsc28gbmVlZCB0byBiZSB1cGRhdGVkKSB0
byBwcmV2ZW50IHRoZSBnbGl0Y2gtZnJlZSBtdXggZnJvbQo+PiB0ZW1wb3JhcmlseSBvdXRwdXR0
aW5nIGFuIGVsZWN0cmljYWwgbG93IHNpZ25hbC4gSmVyb21lIGFsc28gYXNrZWQgdG8KPj4gZG9j
dW1lbnQgdGhlIGJlaGF2aW9yIHNvIHdlIGRvbid0IGZvcmdldCB3aHkgd2Ugc2V0IHRoaXMgZmxh
Zwo+IFllcyBwbGVhc2Ugc3BsaXQgdGhlIGNoYW5nZXMgYW5kIHZpc2l0IGFsbCB0aGUgY29udHJv
bGxlcnMgc2hpcHBpbmcgdGhpcwo+IHR5cGUgb2YgbXV4ZXMuCj4KPj4gQm90aCBwYXRjaGVzIHNo
b3VsZCBnZXQgdGhlIHByb3BlciAiRml4ZXMiIHRhZ3MuCj4gLi4uIGFuZCBwcm9wZXIgZml4ZXMg
dGFnIG1heWJlIGRpZmZlcmVudCBkZXBlbmRpbmcgb24gdGhlIGNvbnRyb2xsZXIgc28KPiB0aGVy
ZSBtaWdodCBtb3JlIHRoYXQganVzdCAyIGNoYW5nZXMuCj4KPj4gSSB0aGluayBpdCB3b3VsZCBh
bHNvIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBpbmNsdWRlIHRoZSB3YXZlZm9ybQo+PiBleGFtcGxl
IGluIGF0IGxlYXN0IHRoZSBjb21taXQgbWVzc2FnZSBhcyBpdCBoZWxwcyB1bmRlcnN0YW5kIHRo
ZQo+PiBwcm9ibGVtLgo+Pgo+PiBMZXQncyBhbHNvIGdpdmUgSmVyb21lIHNvbWUgdGltZSB0byBj
b21tZW50IGJlZm9yZSB5b3Ugc2VuZCBwYXRjaGVzLgo+Pgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+
IE1hcnRpbgo+IC0tCj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
