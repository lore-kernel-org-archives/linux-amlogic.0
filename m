Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504C2C35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vlmkfcj64AVUEivw7Mh9hBEZHVrPReLaCc+3MLundWA=; b=3L3+xbylSXrHUolooTX5wg8eQy
	lq5U18N8vgN9e8rrDgHuIYlRNPtYpxKKavXC+cwPHUk/nc6KtZIzNdbt5/PjHGD9CGjsHavonH3nU
	bO66wU5A6g+qQ+TExkrv+wrIIAQ7cHgQdaQysYUr+VE1WQzyFu+W+EiTzRBEl8Onq96Z3QgPRWbDd
	kq4bDjmH7xJKCfveL+b8We9g8N0b0vSwxlIWOnkPHFJTfJ2Vo1YJ5G8aEKyChFsBiN7lkzLd5hsRq
	OKYGz/d81+2W22AgecedZqhLJjE0O2ApeS3BmezH8HkMJSB4nMWy6zKUMGnqGoh8a0zfMKYm8mCBW
	wtQ+aF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqrj-00000008gsJ-3Cuq;
	Wed, 19 Mar 2025 10:41:39 +0000
Received: from mail-tyzapc01on20727.outbound.protection.outlook.com ([2a01:111:f403:2011::727] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqp6-00000008gbS-3LK3;
	Wed, 19 Mar 2025 10:38:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAoDHkizOag5LS+L9Zx+4NKEOIa/BMUIVnBl8wB0tj3Qt8OcGj8uxegNs53AV4nYbUaI4GTzltoXWFq0lNJaYfwo4dONqsaLsJ1AJ7i+rfbfV01csQpIpH++8HOZdODmFzKx7J8/SSIgZdkMAdXrQZxfGT0yduicjKu7czkfCPCGLrOcyBefeWD5zACd4bfuD/tNZC+SDS823mKtb44xlHGGmJajEUVD3FrrDmKRLUK1HcbTlS28FCS54pk5gn6mH2/3jvQfLzzLs1oYBex50rDdz8F3yWvcbJ8zdotZoiYviZGyvDayAiqq/jIyuoFqJRW4788CwH2FYzzOFGQutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5b3igubDhuU5HR1um3nzESUfEmedLO5VGNPmNXB81I=;
 b=LYWK2gKivdsSwY84cOKPzqeewh4r01RFySoosEoIStzmRG7ZWkrDkeQWNXM+oDdERFZIW2iUDLnCE4bVnBQeI1/bhqnYOTyTzy0WCVI0wl9TPAJJa4F9EqsNhvfNYZWxA40eSOEHUdk+bUSxXI87a9f/V4HMtDxrXGlwSuh8XSub7BcWKi7zR0AfyeaM414e1aMklpZSWTVxzr+AMCrIlnSdohPKPNNktvOfZGCOnyXh8W2XXhx5mYpJPhbM8QZAR6Ixnt2C+9a0swsLnpcNjJ9W3VyRP2C7fzjubwL6IfudqfXSfbyGjjLu7wBT3M0dMHneWM0NdwChsQZveb/cVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5b3igubDhuU5HR1um3nzESUfEmedLO5VGNPmNXB81I=;
 b=t1l14D+blt5yim1SdmDetXj9Wkm9EwxxUE3PC66iMBh56lFSFEJ58PbpuoStC54NzelnSm1TH8PQA5rkpdk3fiX2CYnRQnq7MmqAkii2EgEtkIjvjcYm7dr79UQVMH8SEYA8tqObk/mrsfkqvZSlhsoDM4SxQ64/vMWC/aarlXW0eA+2K9b4YC9Aq9RzqbF1GxgBxBtt5wvzcNrQULiZ9l2RFo3AXASezskuRsh/WY8SN3knXUmvawBIlTVqwaYy5SU+tB4S8HtIREY4/7mLP307WRiyqEnrhLeUSJI/zD8/KUzGUHShNBdzlSS0ICZc9vQMzs78utQVYZByBwS0Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by TYZPR03MB7518.apcprd03.prod.outlook.com (2603:1096:400:419::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 10:38:50 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%7]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 10:38:49 +0000
Message-ID: <9397d6d5-518d-4bd0-a34a-7a5f5e1201f1@amlogic.com>
Date: Wed, 19 Mar 2025 18:38:44 +0800
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
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250319-quizzical-coyote-of-assurance-d4c91d@krzk-bin>
X-ClientProxiedBy: KL1PR0401CA0013.apcprd04.prod.outlook.com
 (2603:1096:820:f::18) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|TYZPR03MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fec6d1-9b74-4a82-deea-08dd66d23c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1FMYzRCaFVWY1VneStGa0RrTFpYenpPQm5JdU9RWStpWDlTbHU3TlZIeCth?=
 =?utf-8?B?bG5aZkkwUWFZS1FzMUpZSlUwUGFEc012aGl6Vnk3VWFRM2hlTUhTQlFUWW4y?=
 =?utf-8?B?UFhUcm9IditGaG12MW5FT2hiK2EwOENjM1JjcmVqMzhDZkNXUjJ6MVNhU2kv?=
 =?utf-8?B?RUNCelpLQlBXdnlhaDNKV0hXa0FhaU4vcE9pdUlNNk13RzczM0RPM3R0NnQr?=
 =?utf-8?B?ZFdscXZ2TGw4WWl4Nisrdk9INTYvOFBzL0d0c3JZMDViNnlaNFFGTUY5cXJt?=
 =?utf-8?B?LzZRUStJVmR3Q3Zmc09YRCt2RlZrcUtsUTdpUlZXU2ZjZitHSzFkNGNwWC9S?=
 =?utf-8?B?V0FGWWV0OUxUdjU2TUY5WTZ4b21YbUR2b01Pc00yNE9icTJlSXlPdVNzcEZ1?=
 =?utf-8?B?d1UrNTVxa00xYWF0VUpOcjZKTGR4RlpqNTZ4T3FzYloxZ0cxdm5wSkJvbGd4?=
 =?utf-8?B?cE8yQitxYXFOeWlFeThrMzJuaFJUd2FPcy9nRm11aGxaM01Ea1BBQkZYbERz?=
 =?utf-8?B?L3BVcUtNWks5Kzk1bTFvZ3psZDBsM1ZxeDRGVmcvYThqdHdVWkp0RkxtV1lZ?=
 =?utf-8?B?MzcrSFdlM0Y0SXhNWGNuWkNBYm9nektidDQ0Z25iQS9VZ2s3ZDBwbUc1aTkz?=
 =?utf-8?B?bnpKcmJNaGlMd05kdVdxVW52aHJDZklOQkVJM2pmQ215aWhtdXh3K3ZBSmIv?=
 =?utf-8?B?WGExTFNpQkhYWjFxSTlaYzUxMnY4dk50UEl3cEJ0SU4xS3M5YWg2Mi96RHlu?=
 =?utf-8?B?WmdlYmFGU3RINkpYeXZNdkJsQU9GYlVhcXZ6bXhZaEtnWjFja3ZuYmVOS01K?=
 =?utf-8?B?RUxDU1RhQTBFZGJwQW55cnUwcDYrRDN4dzNoQm9TMWZlL3NSVGhFQkZvQ3V6?=
 =?utf-8?B?aExGbFJPUUVOK3dodWlEZE5rQWNUUEJTWDVmdUdDMWV2MExPS095SStGZ05z?=
 =?utf-8?B?cGlGenB1anFDZWhQSE5heWJRa0JmbmhrTXRUR0NzMDdISk5KWklvM0pUZlBI?=
 =?utf-8?B?bUtoenhJdDVQMjI4QU9GeEMrZ2tUaXlseGFDc1U5WmVmV3FmVVA3VkpFYXor?=
 =?utf-8?B?Nm92cmlEOW5Va1JHTFpXQ0VadXg0SENrM2VyT09iT2N0RTRXeTNyQSt5U3ZN?=
 =?utf-8?B?anZjbXdmN290alhTVm55Y1ZMb1dGYjU0SXoyQ2pNektXWUd5aGFFaldLL1lk?=
 =?utf-8?B?SEhTSG9LS0ZHelpjUUtxemhBK3luR3BYYlNhK29NYUEyWlRTL2hDNmlYNTYx?=
 =?utf-8?B?M2prdDE1dE9jVyt1bEdXc0RBU1dTR1JsdWhSRHYwc1QvUmd1RnIwbTFEYlNl?=
 =?utf-8?B?SmgydGdtMk9adGN6RGNJbE9JekV4VEFNQUNLSmdMaTRjT1dNWFpWQnhJb3Bs?=
 =?utf-8?B?R0hoM1ErODZjNXU5UkFhbEJ5YzU1OUNDZWNxNTA4YlgxR3Jwb204eHZITjcr?=
 =?utf-8?B?aWdJR2lmdDEwRHB0a0N6OHBBM0ZoRXkwSC9DclVQTXdSc3p5YkpBdU1mUUs3?=
 =?utf-8?B?eitQR3o2UTRtWkIrSEtXelJEVDFBNWUrYmRtRkVGZTM4NGJrMTArQzBOVVpz?=
 =?utf-8?B?OUVUNDJvWldZeGQrUWZxME9wNStESjNIbWdpL2pBOW5nWHdWdmF3Q00wbW5I?=
 =?utf-8?B?VWVYOWR5ZDl0WGxQZFR2OWozNnlUVmU0aGs0Q3JzNDM0c3lyUmtPZ244TEtD?=
 =?utf-8?B?S1dWV00yLzlwRzZtQ0NLblpGbVV1UVlRNWs5cER3b240eU50dng1bGRCaGNW?=
 =?utf-8?B?ajNLdS96L2F6anpqa21laFJ5WHdVTEwxNDUySHF5T1IwWk8yd2h5YTg2NUtB?=
 =?utf-8?B?S3grYlNwWUROWm1UanRqUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDBjbC9GekZ4RUxFZ1ptNEc1dEloeVdVbms2RE5LdUlWMzhTQ1BLcDBtcVU0?=
 =?utf-8?B?VTE4bldsNUdYL01TaWlWYUlOQS9lOGtON21BRS83WEwrK09sWFNqelV2QytE?=
 =?utf-8?B?RjZiTnJiVFQ2KysxempFaVcvSkpZTFdMVGJ3SWdrenpkS050bEgzaDY5NVVT?=
 =?utf-8?B?SWRlNFg2M1lHZktFOVloTy90NzdvNUtWU3ZaYlJwODRYRU1UNnltMk0zUFFE?=
 =?utf-8?B?UDVjcENLQjUvOVN5UTZ4dk5lSVpHOW82eVlDcUtYMitHOW9sSi84SmtEN2lI?=
 =?utf-8?B?a3RiVmVPM3VQVkxDUE93dk5VTm1HSTZUMEk0cVlqL3BXN3l4clhGSHptZExH?=
 =?utf-8?B?bjNqRGJuVW1OV1pyVTgxSkxNb2hjOFQwYm9TZGc3NlpPTGw1ZE1IeEZlUUZY?=
 =?utf-8?B?OHhlNXQ5cDZvN1NLdHhDQ09nclI5UWdLVGFCYjhYdDNDV2pNVVhTeHlQTXMz?=
 =?utf-8?B?V2llUDBWUE1GOUorM2YvZ2RhUXRWMHE4V2lCbk9mSlVsNDd4MVNqNGNHY0Y3?=
 =?utf-8?B?V2ZVcyt3UXVXMTZ0OENGTHVZMk1BZmRCYU5iZ21BdDJDd1NFMUZ4T3kvV2JM?=
 =?utf-8?B?SmZmTTdVRUo3TDZqa3c5L2Rpb3FMSHUzV3ZLN1hiTnUrdVp2NWV4WWtZQmdZ?=
 =?utf-8?B?cXE5UFVzbmxwYTMwSjdXeFJsRUErOTZoZXZCbGV5VWVneWVOdEEzOTBtNVFW?=
 =?utf-8?B?TUpsb0RZMnE2RWdNeWNaYzFRTmxWVVJhbzZZcUtKTDBQcHc5V0VFdGhPZXk3?=
 =?utf-8?B?NEJZcklvRHJLMGNjR3QvY2NDQWUySU9zRm9hT1o1eWRSMktPVFBoL0hBV2hT?=
 =?utf-8?B?YXBZWm1YL1Y4bTBVMkF2NXBjakk2YzhSQUZCTkdzbkIrS0lRaTlYcFErMExS?=
 =?utf-8?B?TzNvQnVGY0lGT1VqUGFlWlJRcTd2enBlR2l1bVcrM3lNQldKUHdSa0g3QklY?=
 =?utf-8?B?YmFzMTNLY2o1VGg4NjhmUjFDUlNKZjlqZW81TjEwMVZMOXJhOEdoVnkwbWZL?=
 =?utf-8?B?WGxQNC9DbDAxUUlWSGdiV2h0am1oa3p0QTM4WnJVUnl0VmdWYjFSaFJBVDRN?=
 =?utf-8?B?MlVGY1ZQUTZmTmorVVRuc29Oa1k3VWRMUTZzdU1BTlJoQmZZQTEwdDdkbzIy?=
 =?utf-8?B?blR3UG9EZUxpR1ZROEZ2VUw4aFFYUkt0SWcyL1hVcUdKWWE1aXRkejg5UjVr?=
 =?utf-8?B?SmRIMXNtckwxeUZMdjlXSXdWY1NmelNOLzlSb1hER2Nja2NyNGdmSU1BUDBs?=
 =?utf-8?B?UFdYNDRscU9jNENLZGw3Y055QnF4VXpBY2pwcHY1YmdybFBGZk9RRHpCbk55?=
 =?utf-8?B?ejZkS2ZrY2JyRUpEeVcxbkJ2bWx4SW5mWWdwdllBOG0yWHFIbDl0c2k0WEQ1?=
 =?utf-8?B?RThscjc2eUJJZnFUM08ydDJ4SlJuZ0U0cWp2aXdCdTQ5UW9GRUMzaDJzaFNM?=
 =?utf-8?B?RVNlbVJJREV2SmxHT1AyRklmSUl5QnRvT2VDd2NFQkt4UXVhNGhiMXozbzgv?=
 =?utf-8?B?WjZ0NjRDaTZIZm5wS1REYVl0bk8zY0l3NU5kWWxnNTVUa1hBYTh0QUtlbUlo?=
 =?utf-8?B?RnQ2L29kYnJ3dE9GY09QeHEybjJVcStRNnIwU05mUUkrbkZwdVZKSnBMWXU3?=
 =?utf-8?B?MHZOT0tPVVRINHFiMy9EWDFrVzlEdEhyeHZUejgrbmZjZ0FHeDg4Zkw5eVRp?=
 =?utf-8?B?ajBOb1lVWUhZZWZTVUZCQ0F2LzFhS0N3MHpuODFabmxJLzErZGkrTVJ3dXlu?=
 =?utf-8?B?cWs2SGlFeXEvYWJUNmlLOGtJaE5ZZDBTZ0xZMFlzWGdMSThmWXcycjRnZVRV?=
 =?utf-8?B?QzFxSGE1RVVPT0pvSTRPTS9JWkZEZ01oR1FnZ2JPQkJ2T2JqUEdoWXJqL0FP?=
 =?utf-8?B?K1BzM1dkZStveSticXh4dmE4UklUcFQ3SVVELzYwWEw1ZndScCtFWW82bUd0?=
 =?utf-8?B?SFpSZThab3hSQ1lGMVpNL3E3aFZ6c21Ld1lMYW9aWUpNM1RzNm1DcWRNQW9i?=
 =?utf-8?B?dnhwZFZyQU91RSsrVnhwMCs5N2pwZW1jTVY1ZDNldzlYeFd0OTRFZnA5ZUc5?=
 =?utf-8?B?NW5YSnZzMlVmdXdzdUt1U2JLZWhXYlRVK1dSbi9aUVBLeEwzbG5RTnkwVk04?=
 =?utf-8?B?M0laWXFOL3lnUlc3RDR2UXFiNTgwWFlhNWxQYlJuZ0liSDhyN1k2ZlJvTUZS?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fec6d1-9b74-4a82-deea-08dd66d23c11
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 10:38:49.6841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFvRUUvkoRjDdT03rqysWDAqamTwMe1yVhdu80775CZrJn6cNGco2IYLDf1iXsYghMXXDnNh1dM0tPLWUK6SLFV3BFBQE/FZfcXj+gZM54A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7518
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_033856_943842_68200F93 
X-CRM114-Status: GOOD (  18.96  )
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

CuWcqCAyMDI1LzMvMTkgMTY6MjYsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+IFtZb3Ug
ZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20ga3J6a0BrZXJuZWwub3JnLiBMZWFybiB3aHkgdGhp
cyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZp
Y2F0aW9uIF0KPgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gT24gV2VkLCBNYXIgMTksIDIwMjUg
YXQgMDM6MDQ6NDlQTSArMDgwMCwgamllYmluZyBjaGVuIHdyb3RlOgo+PiBBZGQgYmFzaWMgYXVk
aW8gZHJpdmVyIHN1cHBvcnQgZm9yIHRoZSBBbWxvZ2ljIFM0IGJhc2VkCj4+IEFtbG9naWMgQVEy
MjIgYm9hcmQuIHVzZSBoaWZpcGxsIHBsbCAoMTE3OTY0ODAwMCkgdG8KPj4gc3VwcG9ydCA3Njhr
IHNhbXBsZSByYXRlIGFuZCAyNCBiaXQgKHMyNF9sZSksIDI0Yml0IHNjbGsKPj4gaXMgNDhmcywg
dXNlIG1wbGwwICgyNzA5NTA0MDApIHRvIHN1cHBvcnQgNzA1LjZrIHNhbXBsZQo+PiByYXRlIGFu
ZCAzMmJpdCwgdXNlIG1wbGwxICgzMzg2ODgwMDApIHRvIHN1cHBvcnQgNzA1LjZrCj4+IGFuZCAy
NGJpdC4KPiBQbGVhc2Ugd3JhcCBjb21taXQgbWVzc2FnZSBhY2NvcmRpbmcgdG8gTGludXggY29k
aW5nIHN0eWxlIC8gc3VibWlzc2lvbgo+IHByb2Nlc3MgKG5laXRoZXIgdG9vIGVhcmx5IG5vciBv
dmVyIHRoZSBsaW1pdCk6Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNC1y
YzEvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0w1
OTcKb2ssIHRoYW5ha3MKPj4gU2lnbmVkLW9mZi1ieTogamllYmluZyBjaGVuIDxqaWViaW5nLmNo
ZW5AYW1sb2dpYy5jb20+Cj4gLi4uCj4KPj4gKwo+PiArICAgICAgICAgICAgIGRhaS1saW5rLTEy
IHsKPj4gKyAgICAgICAgICAgICAgICAgICAgIHNvdW5kLWRhaSA9IDwmdG9hY29kZWMgVE9BQ09E
RUNfT1VUPjsKPj4gKwo+PiArICAgICAgICAgICAgICAgICAgICAgY29kZWMgewo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzb3VuZC1kYWkgPSA8JmFjb2RlYz47Cj4+ICsgICAgICAg
ICAgICAgICAgICAgICB9Owo+PiArICAgICAgICAgICAgIH07Cj4+ICsgICAgIH07Cj4+ICsKPiBE
byBub3QgYWRkIHN0cmF5IGJsYW5rIGxpbmVzLgo+Cj4+ICAgfTsKPj4KPj4gICAmcHdtX2VmIHsK
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNp
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPj4gaW5kZXggOTU3
NTc3ZDk4NmMwNjc1YTUwMzExNWUxY2NiYzQzODdjMjA1MTYyMC4uODNlZGFmYzI2NDY0MzhlM2U2
YjE5NDVmYTFjNGIzMjcyNTRhNDEzMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLXM0LmR0c2kKPj4gQEAgLTExLDcgKzExLDExIEBACj4+ICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGVyaXBoZXJhbHMtY2xrYy5oPgo+PiAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tZXNvbi1zNC1wb3dlci5oPgo+PiAgICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXM0LXJlc2V0Lmg+Cj4+IC0KPiBXaHk/CgpU
aGUgZm9sbG93aW5nIGZpbGVzIGFyZSBpbmNsdWRlZCB0aGF0IHRoZSBhdWRpbyBkcml2ZXIgZGVw
ZW5kcyBvbgoKaXQgaXMgc2FtZSBhcyBzbTEgY2hpcAoKPj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9jbG9jay9heGctYXVkaW8tY2xrYy5oPgo+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0
L2FtbG9naWMsbWVzb24tYXhnLWF1ZGlvLWFyYi5oPgo+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L3Jlc2V0L2FtbG9naWMsbWVzb24tZzEyYS1hdWRpby1yZXNldC5oPgo+PiArI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL3NvdW5kL21lc29uLWcxMmEtdG9hY29kZWMuaD4KPj4gKyNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9zb3VuZC9tZXNvbi1nMTJhLXRvaGRtaXR4Lmg+Cj4gT2xkIHN0eWxlIHdhcyBjb3Jy
ZWN0LgoKSSBkaWRuJ3QgdW5kZXJzdGFuZCB3aGVyZSB5b3Ugd2VyZSByZWZlcnJpbmcgdG8sIEkn
bSBndWVzc2luZyB0aGF0J3MgCndoYXQgaXQgd2FzIGFib3V0Cgp0aGUgZm9sbG93aW5nIGNoYW5n
ZXMgdG8gdGRtaWZfYQoKb2xkOgoKY2xvY2stbmFtZXMgPSAibWNsayIsICJzY2xrIiwgImxyY2xr
IjsKCm5ldzoKY2xvY2stbmFtZXMgPSAic2NsayIsICJscmNsayIsIm1jbGsiOwppdCBmaXggd2Fy
bmluZwoKaXQgc2hvd2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL2FtbG9naWMs
YXhnLXRkbS1pZmFjZS55YW1sIwpleGFtcGxlczoKICAgLSB8CiAgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2Nsb2NrL2F4Zy1hdWRpby1jbGtjLmg+CgogICAgIGF1ZGlvLWNvbnRyb2xsZXIgewog
ICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYXhnLXRkbS1pZmFjZSI7CiAgICAgICAgICNz
b3VuZC1kYWktY2VsbHMgPSA8MD47CiAgICAgICAgIGNsb2NrcyA9IDwmY2xrY19hdWRpbyBBVURf
Q0xLSURfTVNUX0FfU0NMSz4sCiAgICAgICAgICAgICAgICAgIDwmY2xrY19hdWRpbyBBVURfQ0xL
SURfTVNUX0FfTFJDTEs+LAogICAgICAgICAgICAgICAgICA8JmNsa2NfYXVkaW8gQVVEX0NMS0lE
X01TVF9BX01DTEs+OwogICAgICAgICBjbG9jay1uYW1lcyA9ICJzY2xrIiwgImxyY2xrIiwgIm1j
bGsiOwogICAgIH07Cgo+Cj4+ICAgLyB7Cj4+ICAgICAgICBjcHVzIHsKPj4gICAgICAgICAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+IEBAIC00Niw2ICs1MCwzNiBAQCBjcHUzOiBjcHVA
MyB7Cj4+ICAgICAgICAgICAgICAgIH07Cj4+ICAgICAgICB9Owo+Pgo+PiArICAgICB0ZG1pZl9h
OiBhdWRpby1jb250cm9sbGVyLTAgewo+PiArICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1s
b2dpYyxheGctdGRtLWlmYWNlIjsKPj4gKyAgICAgICAgICAgICAjc291bmQtZGFpLWNlbGxzID0g
PDA+Owo+PiArICAgICAgICAgICAgIHNvdW5kLW5hbWUtcHJlZml4ID0gIlRETV9BIjsKPj4gKyAg
ICAgICAgICAgICBjbG9ja3MgPSA8JmNsa2NfYXVkaW8gQVVEX0NMS0lEX01TVF9BX1NDTEs+LAo+
PiArICAgICAgICAgICAgICAgICAgICAgIDwmY2xrY19hdWRpbyBBVURfQ0xLSURfTVNUX0FfTFJD
TEs+LAo+PiArICAgICAgICAgICAgICAgICAgICAgIDwmY2xrY19hdWRpbyBBVURfQ0xLSURfTVNU
X0FfTUNMSz47Cj4+ICsgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAic2NsayIsICJscmNsayIs
Im1jbGsiOwo+PiArICAgICB9Owo+PiArCj4+ICsgICAgIHRkbWlmX2I6IGF1ZGlvLWNvbnRyb2xs
ZXItMSB7Cj4+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGF4Zy10ZG0taWZh
Y2UiOwo+PiArICAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47Cj4+ICsgICAgICAg
ICAgICAgc291bmQtbmFtZS1wcmVmaXggPSAiVERNX0IiOwo+PiArICAgICAgICAgICAgIGNsb2Nr
cyA9IDwmY2xrY19hdWRpbyBBVURfQ0xLSURfTVNUX0FfU0NMSz4sCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgPCZjbGtjX2F1ZGlvIEFVRF9DTEtJRF9NU1RfQl9MUkNMSz4sCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgPCZjbGtjX2F1ZGlvIEFVRF9DTEtJRF9NU1RfQl9NQ0xLPjsKPj4gKyAg
ICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJzY2xrIiwgImxyY2xrIiwibWNsayI7Cj4+ICsgICAg
IH07Cj4+ICsKPj4gKyAgICAgdGRtaWZfYzogYXVkaW8tY29udHJvbGxlci0yIHsKPj4gKyAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYXhnLXRkbS1pZmFjZSI7Cj4+ICsgICAgICAg
ICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsKPj4gKyAgICAgICAgICAgICBzb3VuZC1uYW1l
LXByZWZpeCA9ICJURE1fQyI7Cj4+ICsgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtjX2F1ZGlv
IEFVRF9DTEtJRF9NU1RfQ19TQ0xLPiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICA8JmNsa2Nf
YXVkaW8gQVVEX0NMS0lEX01TVF9DX0xSQ0xLPiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICA8
JmNsa2NfYXVkaW8gQVVEX0NMS0lEX01TVF9DX01DTEs+Owo+PiArICAgICAgICAgICAgIGNsb2Nr
LW5hbWVzID0gInNjbGsiLCAibHJjbGsiLCJtY2xrIjsKPj4gKyAgICAgfTsKPj4gKwo+PiAgICAg
ICAgdGltZXIgewo+PiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFybSxhcm12OC10aW1l
ciI7Cj4+ICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1BQSSAxMyAoR0lDX0NQVV9N
QVNLX1NJTVBMRSg0KSB8IElSUV9UWVBFX0xFVkVMX0xPVyk+LAo+PiBAQCAtMTAxLDcgKzEzNSw2
IEBAIGFwYjQ6IGJ1c0BmZTAwMDAwMCB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8Mj47Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8
Mj47Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgcmFuZ2VzID0gPDB4MCAweDAgMHgwIDB4ZmUw
MDAwMDAgMHgwIDB4NDgwMDAwPjsKPj4gLQo+IFdoeT8gV2hhdCBpcyBoYXBwZW5pbmcgaW4gdGhp
cyBwYXRjaCAtIHdoeSBhcmUgeW91IGNoYW5naW5nIHNvIG1hbnkKPiBvdGhlciBwaWVjZXM/Cj4K
Pj4gICAgICAgICAgICAgICAgICAgICAgICBjbGtjX3BlcmlwaHM6IGNsb2NrLWNvbnRyb2xsZXJA
MCB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9n
aWMsczQtcGVyaXBoZXJhbHMtY2xrYyI7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSA8MHgwIDB4MCAweDAgMHg0OWM+Owo+PiBAQCAtMTM0LDYgKzE2NywxNyBAQCBjbGtj
X3BsbDogY2xvY2stY29udHJvbGxlckA4MDAwIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICNjbG9jay1jZWxscyA9IDwxPjsKPj4gICAgICAgICAgICAgICAgICAgICAgICB9Owo+
Pgo+PiArICAgICAgICAgICAgICAgICAgICAgYWNvZGVjOiBhdWRpby1jb250cm9sbGVyQDFhMDAw
IHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LHQ5MDE1IjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDFB
MDAwIDB4MCAweDE0PjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3NvdW5kLWRh
aS1jZWxscyA9IDwwPjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc291bmQtbmFt
ZS1wcmVmaXggPSAiQUNPREVDIjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xv
Y2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfQUNPREVDPjsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAicGNsayI7Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlc2V0cyA9IDwmcmVzZXQgUkVTRVRfQUNPREVDPjsKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgQVZERC1zdXBwbHkgPSA8JnZkZGlvX2FvMXY4PjsKPj4gKyAgICAg
ICAgICAgICAgICAgICAgIH07Cj4+ICsKPj4gICAgICAgICAgICAgICAgICAgICAgICB3YXRjaGRv
Z0AyMTAwIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
YW1sb2dpYyxzNC13ZHQiLCAiYW1sb2dpYyx0Ny13ZHQiOwo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDB4MCAweDIxMDAgMHgwIDB4MTA+Owo+PiBAQCAtODUwLDMgKzg5
NCwzMjcgQEAgZW1tYzogbW1jQGZlMDhjMDAwIHsKPj4gICAgICAgICAgICAgICAgfTsKPj4gICAg
ICAgIH07Cj4+ICAgfTsKPj4gKwo+PiArJmFwYjQgewo+PiArICAgICBhdWRpbzogYnVzQDMzMDAw
MCB7Cj4+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKPj4gKyAgICAg
ICAgICAgICByZWcgPSA8MHgwIDB4MzMwMDAwIDB4MCAweDEwMDA+Owo+IFRoYXQncyBub3QgYSBz
aW1wbGUgYnVzIGluIHN1Y2ggY2FzZS4KCnRoZXNlIGNvZGUgYmFzZSBvbiBvbGQgZHRzIGxpa2Ug
c20xL2cxMmEsIHdlIGRpZG4ndCBlYXNpbHkgY2hhbmdlIGFueSBvZiAKdGhlIHJlbGV2YW50IHBy
b3BlcnRpZXMKClRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgcHJldmlvdXMgb25lCgo+Cj4gTkFL
Cj4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
