Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5098CA5FAB
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2026 03:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMl1vOUsXXsO0gGU9qL++jRudOxIOs4bHF3pROD5s5k=; b=zhJF1fY/yqRZTSQtpkjiGdX5DI
	EO/lL02Ohu8Ugn9VNN4cSt/BMM4YzNbSj5T3QyD+XwMrCOWboAFtvcWgIKxwFLH3uTVfqUojDVp8D
	BO4Cub8pHpGHErn3tjWEUby3NkNrmtaJCQ1IfAUIrU0aAZ+gYlwk+m/Tz51XllkM4he0RLAtN8hz6
	kUvN7WJdJuYbDcZBRL7BQ0O/qRRCod0iOrHmyCOkVFkpt4Bx9KOxcimJZU/9gIyGIQp/CZbyADX68
	Qi+ApDsskmYQOKj8AM+qzCtEt8FqtYnuqdQl2TbSQi7iP6ckFWXCWHFReQQlJbyXenqyTA2pXlbpi
	Y+KPfrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOFo-00000002BMs-1jh6;
	Tue, 29 Sep 2026 03:11:40 +0000
Received: from mail-koreacentralazon11023098.outbound.protection.outlook.com ([40.107.44.98] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOFl-00000002BKf-1nF1
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Sep 2026 03:11:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWadCIKOFR375vVOIw3rjtUmIyawdbTrX9QwjzOU5xXj3zN/35/TkwdKprkffVgLpZTPUZhmaWCex7nkxRPEhEvJ8bYlw2hQ/RNnh5BDMnWLN+w2fWs+y0qQDoQA/jhOcYrXfmX2JNOkQO2Y/n6Rz7w9PvbuEJh6jVRBp3iJSyhMcv5zN9KkGtSwOyRAvEFspNRynCSegYYOJEKrsvs8uXyjWqE8UxWnbV4B+yqDSlq5bX39typcYejuxjT++jYbUAweBdN+5wmU504I3BcnumDAeqHuRj4+TOAbVjFFhsu2rBtX8+YeNYyK4EKzQ9e2eQ6cxsj3UgS/BAvk8ZVBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1pepjUqPOnuMlLmBIL7Myo5pxgyQqnU266jBWnWJRY=;
 b=Kh73bmqWCMueeWlU67gzwUh7pjaZE1xOvHApl4qQHdoXvwtlYVwNn9QZXiRayJUKwPpzK6vMqg9GtDEiewwbbrtOlTdYZR86w38yUaZNhBbobAAPEc/ETmDFgNgSaatK/Ft1Ri1fv9oqAKW0RyFeafYwidvRgpzccKRz6rDEReDuLyVFrXSb1GAOZ5BxRYWW+w9ZrPQB8MZN2ds8ai8Yj3QDv+dPoFTKz/US/ezA8rSMkTnq+6riR0cCEBNxwNcATRUjWoG4vWh/SDlf8ra+vcRsmSFHpZiSKMxApxns9q1RMRo1krdZQVM3rxNN7ecutnMfSPE341QY/SteQcG2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1pepjUqPOnuMlLmBIL7Myo5pxgyQqnU266jBWnWJRY=;
 b=KWHK5zUMb7/BO5meCtlkEHfgxtfvQRxKe+vVtm4BEkcCKPRlVFFunRjxgKLTKu3a84Ch0oUXcxN4NX3UMMo7yI08r17/5pCfLX8B3xKQOPQscY2aYI5+YLqsP0PtcDZDStgDiQhUag+ksnrpzSnDO+qcmWjtB/1N8W+BkxbQXEPDDahuOMkCFqcNnHIeQxELinfh39JiNGbNg9uVnRjvj+BZ2l+RGNkGW7kmyEN6M2FDM1nsYbCAApZlQi7VZJCO9cGzjz+gX1nirBD9ijGjH59uM1NuUK/8GZixH6eP6Zo4QJAL/DAa2hgYwetcY/sf81SkkurFZWlalXqo2sJZog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by KL1PR03MB8516.apcprd03.prod.outlook.com (2603:1096:820:13c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 03:11:20 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::5fc1:b7a:831:340f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::5fc1:b7a:831:340f%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 03:11:19 +0000
Message-ID: <c160559c-4636-401a-9d0e-c82601cc4eeb@amlogic.com>
Date: Tue, 29 Sep 2026 11:11:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: add Amlogic A9 I2C controller
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao
 <xianwei.zhaol@amlogic.com>, Junyi Zhao <junyi.zhaol@amlogic.com>,
 linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
 <20260924-a9-i2c-v1-1-b8ad9b46f4a8@amlogic.com>
 <20260924-primarily-harmonica-fe3455834a4d@spud>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260924-primarily-harmonica-fe3455834a4d@spud>
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|KL1PR03MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cbff35-7156-4ffb-d486-08df1dd7554e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|3023799007|56012099006|6133799003|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bIw4e9DU0BZh+xAvYvkfYuiFxAPDxcUG6YVqGZd0A99xQAa0waDbGXu8qCZk42bGmnP4FFqcYfOSIV12bBv+kLkKUj48KTpwzvWcuRT1YqtxHfG6hKXkKPOCRSnUJpqEIzl0FYyZ4xV5+gqE+gZBKTt9iUVK+TaRanaTyEzXb7CRjXeMR5YfTRrZYc6VtH4MNM+rTdOvOBAJYlWhVamlLbYxiuqjA0qherwcq7MRyw4ChsQ9Nmxx3Mbs0mhlbLfINhZ+mmz+l8xexyVSQb0rKsAFEMZYJSX0N97haHuwuTHc+ukWycfxXa37XnofKrKqspdXZzgDHW6TpQ3Xy2MhDkOEtOIImPXzY/pRkyTHD0scMAu3T7LAsNPBXVwasrzfE/gIpS/kamtAoMdLtb8uX9aSunXufZfAddoFq/5dEfwsqjqS5T8CCSRtbuDbUbt9C35K/kZiV9krzvv7xmpqq6NwR2/wXN4VTPuDuO4tChM6/cJLUYZDku+oHstFl15wpIrIWcxYCa+Q8/x4Z3AqipXZ87igvF441OgLwBEkNYdix66EVK+999J5aJE7QcxWmDf+VQFWOT39rSHuaWItcfkP2lXWPZHq1U9CqI6Z0OY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(3023799007)(56012099006)(6133799003)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGJDSkNCTHlaTVhsbXEyMUFPTzRkTGZYVzRPamd0TGd0QmJsemdqemxRaThG?=
 =?utf-8?B?Qng3SEZPKzZuaG5LaDFrMGJMNXlTNGZxeHpSRklKNkJlVytpNDRKejVNUjlk?=
 =?utf-8?B?dEFuL1BQd1VHVlZFNlJDaHZWWXlzU3NSR216NERpTVpLY0VvemZOWHRycWFM?=
 =?utf-8?B?UGM5a1Q2VmEwNmw2aGZXT3JrMGY3eXFGK2hhSmgrN1NyVTZYeWV2UEZpR0ox?=
 =?utf-8?B?Y1pWZDBoZ2VhT2s5VC9ZL2pPMjc5U3hkelBDWkVkSUNFaFlvSVpMbjh1Nkxu?=
 =?utf-8?B?WlpuNEQrZ2VOK05YeVIzQ29iWFhGbHNIRkVzUUk4MDRxYTdOWnJLUEF6NGRq?=
 =?utf-8?B?T0RDNFBQYnViSmtCNjhGY3JXRTFyQVlyM1pCdUdvTjI1RUN0Zng3VVZPOEE3?=
 =?utf-8?B?ZXorWVZ0WHBtaTNUcjRqbzlLVkxHTlRYaG9XaHlWZzZROXpvUGN6MTN5Qzg4?=
 =?utf-8?B?NUpRWnRVQ0tYaGVVTXg1OVVZMG5KWXRaOHJEb1RDS0Vwa09sTEk0RE9XaUVr?=
 =?utf-8?B?NG1ETitxM1NqVm5tV0dSQ0NWNDFleHIxKzZvK1VxZ29GeUF6Vjg5dFFIRjg5?=
 =?utf-8?B?b2t4RVFQSDYwNDBCd21ueW1UVXhLb1Rhb2N6Y25PZENPREJuNngzQk1BVWFL?=
 =?utf-8?B?bHZDeGlIdkU5TDBvTlRWcWxDZVg3SkZ5MUwvYWVlR0pleFlaUkhFUUEvWFEw?=
 =?utf-8?B?RElSY00vZkZ1U0JST0tWM3h0THhES1FlQjM2UzBhVWRGbmJQQmY5bDEwODd1?=
 =?utf-8?B?NkdIZ0RaRzdSOVJTUnYwVUh1NklKNzl5Q2pyZFpKZ1RmQVUzQUdkSGorWllk?=
 =?utf-8?B?UlhkUEJLUWhXREFsTFQzMmJ6R2ZmVUVoWEVPbTZsaUMzNmo0K0xiK0R4VEVD?=
 =?utf-8?B?cjNIYWFMaUQwOXRUUzdOUXZEQmwzN3d5elFoRVBYQThaNkcrdis2MzBhOVA2?=
 =?utf-8?B?dzQwblJCY1NhblEzVjVuSURhMTRHcDMrODlIYTNmTElxNXg1M2dUOEZ5WUk4?=
 =?utf-8?B?YXdBN3laTzRBN2tuSTUyV1l1WVRIUUNaYTUzazMwTXdPZ3JnKzh3aWpRL2FZ?=
 =?utf-8?B?eTYzdHhiNyt4OU8rTzFVWGNLU2xMbkNoS1dEcHArcmpRcTRXT1V3aEtPYW1H?=
 =?utf-8?B?VzVrS2ZDYzV6SjNhR200ZHJOZm02elFIemdJUVd6dUlMMDhKbFVTREtzNXpl?=
 =?utf-8?B?SUYrcmdwa2Jjb2hiai9FR0RIVjN1SnN2ZWZrYjB3a0JxOFlseWdLZFVudWVI?=
 =?utf-8?B?OVV0M2FJWmVrNHMwWkFuMzJWREhSQU5EK0lyblhtVFcwZ2ZQQVA4VXhOeGFD?=
 =?utf-8?B?azBLTmVWU2g0YVN6SVZyRmZGaU91ekpOT09pZk9YRGNYMmtoS2M3MlZwbjJ4?=
 =?utf-8?B?RGp3QkwyZjdLQ3FUSnZRTnFxRDhQL2FVSVRyNnF4UzRkNjRSMnpaSEs2SzRV?=
 =?utf-8?B?aFV3T1lZdGIyYVVuUWhnU0FrY1Z5ZjJDdDBPd2hQSzdaQnJmNWJuWmZhaGQ4?=
 =?utf-8?B?T0RKUCttYUFpSUpvNE40c2hIMmxDMHpFUHk4MVc5ZWtxR2JnVUhoZG4rRFJo?=
 =?utf-8?B?ZzdzdmVHcjBEdE9nNDMzaDFGTUxTdXBoNlU0NVpWVSs0NFVIcHNPeTcyS2NW?=
 =?utf-8?B?YXFLampCZTNBMlBVYlpyY0ZQZlMwUVJETEVDOWw0OTYyTDlZckFRb3FBdTQ4?=
 =?utf-8?B?T1FpdEsydUorSndyamlvT2pRNlBjdVAwL0lOSnAxS2NyVDlaWUZFY0tnQzgy?=
 =?utf-8?B?YmQ0Snp2SlRvZStzVHZ1dWJCUUNqdVlYVGRsa1JkQ0tlNWE1MXUyTGFvN1ZF?=
 =?utf-8?B?VHBZZGd6WE5oM2I2cXBJVjd1cGVSV0VXT3dXU2U5c1VVS3lFYkJEOTRhbTFV?=
 =?utf-8?B?cVJwTUJaUCs2V1FNUVBDZURUTWpZcGNOc3VFejFBb3JUNmZKdTZSRitpcmp1?=
 =?utf-8?B?MkQ3bjgzV1FleWJPb3phYVMyS2g3aXNJZkNQV1JZWmtPY0ZhaEhLWEVGR21U?=
 =?utf-8?B?cHU5NVNTaXV6MkNXTVhVek9HZWQ2WVo3cW1vckpLSUF6d29pT3VEQlBPWWNJ?=
 =?utf-8?B?OGlwM09HNWRzU3dYdnpObk95ZHVsc3pPYkU3KzlrN0kyZHRZVlNFcTEzTzBH?=
 =?utf-8?B?OE5BZEM5RGxBQUk5SkVGTlhGK3pxci9WRStoNjFTNjhDUnJUdWRCTHJ3UE5G?=
 =?utf-8?B?R3BueXZxL09hdFBKNVNoc0k0bXZjNnVSNlh6NUprdnZhd0ZDOWpLWlhuVVN6?=
 =?utf-8?B?RHdlWkllejFLNmJnRnZPMmhQZVZvTEdDOGw0OEUvaVYvK0k2WDlZeXBrRFo3?=
 =?utf-8?B?MmFLU3I3eVF3YUsvL1N0NTkzRVd2ZXd0VTJ5OEVtbzUwTUt6VjE5UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cbff35-7156-4ffb-d486-08df1dd7554e
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 03:11:19.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhyNfFpzsSrfQ1Dp2oOz+Or1o7K7gCAoBm7kOfTlyC8M9Ew3c0Ih6Pcv2uh61xa233vJxF+h9S2a3hLnJ2l45WLyjZl+bfvGPiWWDxyWjFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_201137_484882_42BC7825 
X-CRM114-Status: GOOD (  17.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Conor,
    Thanks for your review.

On 2026/9/25 01:01, Conor Dooley wrote:
> Subject:
> Re: [PATCH 1/3] dt-bindings: i2c: add Amlogic A9 I2C controller
> From:
> Conor Dooley <conor@kernel.org>
> Date:
> 2026/9/25 01:01
> 
> To:
> xianwei.zhao@amlogic.com
> CC:
> Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
> Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
> Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao 
> <xianwei.zhaol@amlogic.com>, Junyi Zhao <junyi.zhaol@amlogic.com>, 
> linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org, 
> devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
> 
> 
> On Thu, Sep 24, 2026 at 08:39:34AM +0000, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>
>> Add a Device Tree binding for the I2C controller found on the
>> Amlogic A9 SoC.
>>
>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
> Since this is not in the existing meson file, does that mean that
> there's a substantial change in the IP design, other than the addition
> of dma support?
> 

Yes. This is a new I2C controller that is different from the existing one.

>> ---
>>   .../devicetree/bindings/i2c/amlogic,a9-i2c.yaml    | 61 ++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
>> new file mode 100644
>> index 000000000000..681241a52680
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/i2c/amlogic,a9-i2c.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic A9 I2C Controller
>> +
>> +maintainers:
>> +  - Xianwei Zhao<xianwei.zhaol@amlogic.com>
>> +  - Junyi Zhao<junyi.zhaol@amlogic.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,a9-i2c
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  dmas:
>> +    items:
>> +      - description: DMA controller phandle and request line for RX
>> +      - description: DMA controller phandle and request line for TX
>> +
>> +  dma-names:
>> +    items:
>> +      - const: rx
>> +      - const: tx
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c@3a4400 {
>> +        compatible = "amlogic,a9-i2c";
>> +        reg = <0x3a4400 0x3c>;
>> +        interrupts = <1 164 1>;
>> +        clocks = <&clkc_periphs 11>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        eeprom@52 {
>> +            compatible = "atmel,24c32";
>> +            reg = <0x52>;
>> +        };
> Remove this from your example please.

Will remove eeprom node from examples.

> pw-bot: changes-requested
> 
> Thanks,
> Conor.
> 
>> +    };
>>
>> -- 
>> 2.52.0
>>
>>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
