Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308DEC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Apr 2024 01:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOeAM0fYS7Zm7/3aKcaAEgd2HKRcuvT8e9Lwj19wC28=; b=aYTJE5RxQ03/7sEDmNWRaKA4SX
	TAgnw/4ueZJsTS4qGpyxeUTncab6xvsIp22iB+x68lz7RtY0Yat+GY+yVcs1KXgFporsow7TK/Wnx
	3fLeoT3Oy8nDQDx5q0GA6uV+MmSvJuCVzibGfn+YCNlCYKf/V8gLfemjLN3E37iitPtB4s2B9VB7x
	ERLgP6qpZwlJOb7Ae8vNpjA6mukXSiPd9LogsarXPm6z1rEaD+htzGBmJFlRPoLxCRu8VyGnC+WVT
	AXVgqJyLQhlEF7Ep9nujcq7PqS02jZjuMH2jpMIla7LnkEeya01JsSNZiTn+G3bGI2PDF54MIWp5+
	hC78ygTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxdPT-000000046PW-1WAb;
	Fri, 19 Apr 2024 01:51:27 +0000
Received: from mail-tyzapc01on20701.outbound.protection.outlook.com ([2a01:111:f403:2011::701] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxdPP-000000046OC-2Lap;
	Fri, 19 Apr 2024 01:51:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wdx2xLQ0AmtVrsGfAQmaZxNsBruIqzOtzKZbG9BwCVwe78toly+BngQCXY2coNfxtrFDWTIECfFRoGzIQVN5HjcgogrNFN7WpYapBPOwd3GMVyr5cGCfYoGfaFlCiXfe3pQ4qYf9LXZ4JB7+Uwb4BmXnBV8TNEkrw4SMeLndrbEEWR9BwyWk5kc1i4F9ACR3j/5a2n8nXCqvtvsOZOR1JnuN6XLEHWsPUpZXQCnNzYNO0rhYL6lNryRKu8Gns8dDmFb/OjLBkdJ4erDvHRSNHncp/o8ZHELBK/CmYTeMC54370n5J7lRGT/JEVlV8eG3LVbdBe+dLCea2blUiAfBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu2xoDhn/x9ppgxVF1xf6ZoiaxGpt6tfqZump017aXo=;
 b=MD8f12t7312zitjF35QHXEeIAxgaT157CTz0NNY/sQixU7dj5vliKuG6Br6mKJPD89qrwla+qip+s8DAVCh5rms/TWt+eNyD7jAegpEE+1j2vRclMnSV4fFUmCFBrnW7MDSg1a5Lrs5GO5xcVtnjAwgZ3C5s0HRsE844RkhyZ0UZlWV9L1MxAYjAijGjDwp7vqsifl0gsGOFx4pimRqHZ66qRW9G1Bq8MHFLdLZky9urPaFQo+hGa9UPKL48e+qtBmOi5d3+M96l9FDYXnEeOTIQ1sLLuTrToCNkfzIR8R8jgAgWmecqP3oWpf0wMVdu4I7Jr73cMYiY6zKTjd0OAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu2xoDhn/x9ppgxVF1xf6ZoiaxGpt6tfqZump017aXo=;
 b=cK2bJZ/Ju4ui4kfuS8KEP6f9rXJY3PH0xC7jFQ1uQHLF5g4ekjEfP1Uz1XEuJqyjIP2+XpGNX/eUWCUpH/y5Sr/nxbaksAsOpMyQCPWRtTgurafeNsCR9X4rwvt5V+KndNVWB8/r6dBzRBaZLjT765s3qW3YMkmn3Jof1JanBI2KKRZJw1Wk+euFRUAjO/yIXkE+B0pk0PtWzvsD4NLVxcsZvhi6E6s+u9wCbbMTEhLukfGlHXrq+oF5cjDJgp/TiK4ph65bQ3K1BpHcocqvRubaVXyWMBvK1Z9pJhLvPTZfKSDcy+irrXCSgry1GVqZbi6t/wek6vMR55mv5u2coQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com (2603:1096:990:11::8)
 by TYZPR03MB8727.apcprd03.prod.outlook.com (2603:1096:405:75::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Fri, 19 Apr
 2024 01:51:11 +0000
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::8627:9243:4397:43c3]) by JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::8627:9243:4397:43c3%6]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 01:51:11 +0000
Message-ID: <af81f1e4-250b-4785-8b44-fc3e9753dba8@amlogic.com>
Date: Fri, 19 Apr 2024 09:51:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Amlogic T7 Reset Controller
Content-Language: en-US
To: neil.armstrong@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
 <20240329-t7-reset-v1-1-4c6e2e68359e@amlogic.com>
 <927ad2cb-3b41-4eda-b930-856be64ae9ba@linaro.org>
 <10650c59-96f2-4234-b5fd-aa8efec90e5b@linaro.org>
 <579a1569-7bba-491f-ba5e-7cfcb34ccc1f@linaro.org>
 <c7e243e3-3f61-4d63-8727-3837838bdfcc@linaro.org>
 <48005005-54ad-473b-826d-23b0b3f3a52c@amlogic.com>
 <64c765e4-698f-49d6-8d17-4b512c3dc8ec@linaro.org>
 <f845db57-64dc-4127-ab8d-9a038fd8d35b@linaro.org>
 <4736ba70-a42a-473f-8724-8e664bbfe4eb@linaro.org>
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
In-Reply-To: <4736ba70-a42a-473f-8724-8e664bbfe4eb@linaro.org>
X-ClientProxiedBy: TYCP286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::9) To JH0PR03MB7384.apcprd03.prod.outlook.com
 (2603:1096:990:11::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7384:EE_|TYZPR03MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cf6232-5abc-4f76-7ced-08dc6013302b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2tqMStRSGJGcHBlU3pnYU4ybm0rSEowMGE5V0NPUTJ6UHlwemp5Y2xqb0FI?=
 =?utf-8?B?dTVWOG1UejQ5YS9JZy84SXFGbVlScjVtYm1qazFVZmhTak5Va1o3VTg5UkVu?=
 =?utf-8?B?YmxTeFNoZG1sK1JWeE9KamE0UDgzYXFNeGdYMUpoOGNObnpMS2lnbTBiQUxo?=
 =?utf-8?B?Zm82Ti91MWovZW9aWjFlamJPdURnWXc4VHE0K2xEdFl3VzVBMllVT0IzalpZ?=
 =?utf-8?B?YUNOc0liWEcvZEFSRmkxNDVFSkNLTmNhYkJlT2tEbVZ4R2pOVmhyMUtOTlFs?=
 =?utf-8?B?d3NwbTI3K2pwV2lLTXFoRVlnQU04cy9CTlNIOThmakp0c2svMTJnK09DM29i?=
 =?utf-8?B?WGdCSCttK1Q1NUZTREw5YmoyZlI3L25xaFZBTlZPaW9rYUIxQTZnbSs2UUYr?=
 =?utf-8?B?RkNqM2hsUkcrMjkzMm5oSnBxaEpERktEZGF6Y3VOTHdLWVZFV3hMWHJHazRm?=
 =?utf-8?B?M0V6dkR0alhUbDMvbXh0cjlLOG9KbFE0SjZEemx0ZHJBY0xDaG5JVHJvNUVZ?=
 =?utf-8?B?cGlYaDhmdnFETFNqejNQbjQrd1hheVBDSHNIbmNzbXAySTJrTVQ2SnIrc3lG?=
 =?utf-8?B?OGxBRDJ5U3BlTHNMckxxQzc1YjkvZkMzRmo4d0N4UkVodmtFMk1Sc1VlOTNt?=
 =?utf-8?B?Tjd5SnkxTFRoM2tIckdNKzlNN29sNGZqaGxRTHQ2aGQ4M3FJWlZCQitEeisv?=
 =?utf-8?B?alRMVUJ1M0VPeXJUOHg0eGY3Q2Z0cUQ1bTl3NEFCZXcralRQWkhzQjRvRVNV?=
 =?utf-8?B?YzJRNS9DOExjZHQ0Q2RRYXZsVEp0ZDJ5SWJ6OU5wWU5SbWRqQXFnRjluVjRa?=
 =?utf-8?B?cHlWNmxlTHFucVFRRGdFZFcvSXBZeVhWSXUzVytFYjhOc2NITkFvQTdueTh3?=
 =?utf-8?B?VkgwcHF1Sm5lTC96WGVmaHRoQ2dVd3NHMEk5Y21lSklqekJiZU5GUlFVMUt3?=
 =?utf-8?B?eW05ZkVNYWMrZWYvZHNubkZiT3d4Y3FTTFRkVmYvbC9FUEhUbHBXejg2UXdO?=
 =?utf-8?B?end6T2pDNjNadGpoTnNLcitwT21RTEsyelBsSUZ5UVc2OC9GU2UxbVNZTXlU?=
 =?utf-8?B?VzdsNjZ5d1NGYzdpM29ZUmIzYnpUS2tiZnVDMUsxamtQRm1oQjBPN2pET05T?=
 =?utf-8?B?dmZUbWFRcE5VS3J6cEFpMFZiRDNBWWtIcERWclpOcGhIcVVRb1VWMXNucDI1?=
 =?utf-8?B?U0x1ekR0V0puNEk4Z1h6VFV3UlBPQXpsNys4V0lGS2EvNlRIQnZCdFpKSjFM?=
 =?utf-8?B?WHpTOWluSU5Xa3JiRkZkZkpXdGw2TWlJZm1MSnNOVnVQMFplckhvNVFFNUxH?=
 =?utf-8?B?WE5wbXFIWGl6dTNvSUsxVGREM0xDZGU3SzBBdkZxY2drWGdHeGI2ZmgxVi8w?=
 =?utf-8?B?dCtIcUp6Q3ZHQkN1WTVNOEpBcUozZERXRS81ODZQbi9FTXlSNkNBalN4REdT?=
 =?utf-8?B?V1R6OXA2RGQ5S0JjZThCc0hacjZvNkJoMzREVUpzODRxd2xxZTJUK01TNlM1?=
 =?utf-8?B?MU5PRzZMNXVBN0pBY0RpV05CdTVpZzVBd3NGcFBnQkN2YndNZktlUzZNSVB3?=
 =?utf-8?B?SGROLzltYmxZYWkrUFVaV0dCVC94clVTQVpCcU1qZkI1MkRXZDhHWXVMQ2hX?=
 =?utf-8?B?Z1c2dnFOMGQzeW84dmQ4U0ZNNk5jenRjS1J3L1ZVcU1oT1BVd0FCR25pTGZm?=
 =?utf-8?B?QnE3cm90ZFdkdm1LcFpvVUlRL0hlU3BLYm9LOVpBcTJQdDNIUCtTYXB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7384.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WStyRU53RElJYiszRlp2TUVEYjJ0YnNiZjk4L0hJYk5BMDRXeDQ5UURGaHg1?=
 =?utf-8?B?NlZyQnc0RndWYk10MHlmZnFTQzFUZ1NaTXI4Ym9vUzBaOHB0N1ZadTVOMHRo?=
 =?utf-8?B?RkRxSUREVjJNTkFGbFRsNHBiYVo3MVk1VFdwYXhNZHNqVG5nWDdZOFNGOW51?=
 =?utf-8?B?elpvbURIS211Rmc0Yi80SVNITTdOdlVsYkVjNlFzd1ZWRVdCVEl5R1F2b3hr?=
 =?utf-8?B?NFBYb08wRXFTZzdzbHVhc1I0d25vNXE2aHRWWWlCemtMOUVPRHM4Q3RuN1NB?=
 =?utf-8?B?SzFBS3NVcFFjaUdQSnJyL2FJbnJ4bVhJb0JmVUlFVlBUakNTRDNVcEhzcDVR?=
 =?utf-8?B?QUNrcWVZeUp6dFlpdjFzVWltYWhuc2w3N2V5c2J1Rms3K3hhVS92M25YNXdO?=
 =?utf-8?B?YmpwTkpRTUpLWnRMZEc2bENSSDV1YnE2SUxmbUF1YlRiZ0o3UDMyU2ZxdU50?=
 =?utf-8?B?T3lEcitoRWZQdzZqZHpJd3dDczVRaCtYaVFYTGVuK3hINDlGUTNOVFcyTWht?=
 =?utf-8?B?SzBkb3B2RklNMTkxRTBJdWJNbmFZc0dVcU8rT3NxRjRFUTN1YlNnQXFFRzBz?=
 =?utf-8?B?RGxMcUZsbU5pczJ0Y3J3R1hzOWoxVGtqbytpTDgrSk91eGNqYmhBVjFtdHo2?=
 =?utf-8?B?NEl6RmUvSk1QODJoVkQxTHUwZDV5MytYYktrYnp0aEFXRTNYM3QwYVFKY3JF?=
 =?utf-8?B?cDYvRS8xWk9oS09TalNPQndJc2dCWWxxWFRFalFSTThpSmd6TnVjQmNobjJ2?=
 =?utf-8?B?YlFnMm1YamdEM1V2RllpQWYrdmpXMVZBV0lDWFVzemxlelBzRUcwTmRpM0lC?=
 =?utf-8?B?T2NTZGtoeStwZ3l5OHkybUVnQTZCejlvZUNGYTN6cmttT0R6amZtdXEyVlNp?=
 =?utf-8?B?TDJRWlBobVZkaTNnOFBOejFkcFAvSzlXeFlkeENsYlJKQWpYR0NUcVJCazlm?=
 =?utf-8?B?TTNLdzg1TGVNMzdtK05pWkwrV3RiOVhVK2luZ3orVjR5dUtSM2N5a04ycVo5?=
 =?utf-8?B?SWk3RGk5L3FhL2I5aHpvMDBCeXh6RXpxZ0U0SStORDM4WmVLek1JK09FOWlK?=
 =?utf-8?B?ejlveDJEL3JDYUVzNlNwcWdFUVRTNmhtREd1cGJ1eWZONWZYak04VkpHam5q?=
 =?utf-8?B?NmRJMU1pQmVGeHBVblFORDI3K0FxSjJLN3NOTGZic0RaQ0pUajBQZHAxUC8y?=
 =?utf-8?B?ZUhHaHZzL0FWSGZ3WkRKTG1NcFp0anBiU1ArL2N5alhrcWdZa2QweU42anc4?=
 =?utf-8?B?bk9DcHdNUkxLUTlEV3psRms2TUZDcWtYZ0ZCUUxJS1BQZWpRK2VrYnNKR1ZM?=
 =?utf-8?B?THBiOWRacjNmZnZlbm11MndtUGhXd0JiTmdJYldxeVJMSGxLOHB5Nml0bUoz?=
 =?utf-8?B?NUJJbG1EVFd6N01pcEJUTlUxWmhBbldEb2hSSjJaajBQM21vOHk2cjZsWEdh?=
 =?utf-8?B?YnFQZGI1RWV4SFFjcjJvSUZ3ZG1XRVY4WkVYRTVDdnJKQWtHemQ2Q0E1RGIz?=
 =?utf-8?B?OXVhbVYzbTdUYVRpbWRNSThId0d0UDlEWEZ6eDM2Q01NOUxyRUgrbW5TUHdY?=
 =?utf-8?B?cG4xd0V3ZGFKc2w5VHY3ejdLUDQvbTI4YmxMc3c0WjNpOG84NTFLL3k4VnJT?=
 =?utf-8?B?dUtKTzMraHpEU1JjM1Nidzk1bVNFY1ZtcXh3aFJiSUplNWo4dUt0SDVlQTlm?=
 =?utf-8?B?ZFZhK2wwSm1XNmpqZWlFWStDa3Qrb2pHNHBESUxpcnhBbUFVaVdtU0QzclVN?=
 =?utf-8?B?aW9FbkZ2ZDNlZmRac3I3M05lZzZZbExRV2pnVnRZRlJsMjQxUGo0Q0prUW5J?=
 =?utf-8?B?enlsMGc3R0xFRTUrbGRpMlYzQnpWRW9JZjRRUTlubGdnbVF4SXF5djhhNU5w?=
 =?utf-8?B?dThGSGxKMzlvek5VMmF5QWw1VStQcFV6SDZMSDBLbXVueE5hNSt0VEllb0Ev?=
 =?utf-8?B?QUtEWXFEVlkybENOdGtvL2NwSG1DQ21kL2dNai9Xb2QyNmVzYTU4WjBwK0x5?=
 =?utf-8?B?ajNqS3BtdG93Z1dOS1JZZFhldDdBZFRqRjExS3FLclFKWHRsM3RMQUNyV2Y2?=
 =?utf-8?B?VEsxN3I2NEJFMi9UYnRKYk5uU2lpdVQ3UHBJdjRlWjVxQlUwNnBMN0x5b0Fn?=
 =?utf-8?B?MFRXaUhKMSs3ZlpOc0R5SnJHSmdnY2tRUVJxYUVjcXV3NCtUMDdXeVZrTXBW?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cf6232-5abc-4f76-7ced-08dc6013302b
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7384.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 01:51:11.0231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmaiABGIVv5qHzToZszPGjExV7EPfdM3G2/NvtRS66wR7ZQUc8PGW6Vd4QXavrosASfWepNkNKZHo6+MvIOYn4Y98rWlBbva+axQ4FzZGkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_185123_735211_EB671FFF 
X-CRM114-Status: GOOD (  20.51  )
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

CgpPbiAyMDI0LzQvMTkgMDU6MDMsIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4g
WyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gT24gMTcvMDQvMjAyNCAyMTowOCwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToKPj4gT24gMTYvMDQvMjAyNCAwMTozMCwgbmVpbC5hcm1zdHJvbmdAbGlu
YXJvLm9yZyB3cm90ZToKPj4+IE9uIDE1LzA0LzIwMjQgMTI6MzEsIEtlbHZpbiBaaGFuZyB3cm90
ZToKPj4+Pgo+Pj4+IE9uIDIwMjQvNC8xMyAwMjowMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4+Cj4+Pj4+IE9uIDEyLzA0LzIwMjQgMTk6
NTcsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+Pj4+PiBPbiAxMi8wNC8yMDI0IDE1OjEy
LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+Pj4+PiBIaSwKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIDI5
LzAzLzIwMjQgMjA6MzksIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+Pj4+Pj4+IE9uIDI5
LzAzLzIwMjQgMTA6MTcsIEtlbHZpbiBaaGFuZyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4+Pj4+Pj4+
PiBGcm9tOiBaZWxvbmcgRG9uZyA8emVsb25nLmRvbmdAYW1sb2dpYy5jb20+Cj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4gQWRkIGEgbmV3IGNvbXBhdGlibGUgYW5kIHRoZSByZWxhdGVkIGhlYWRlciBmaWxl
Cj4+Pj4+Pj4+PiBmb3IgQW1sb2dpYyBUNyBSZXNldCBDb250cm9sbGVyLgo+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9uZ0BhbWxvZ2ljLmNv
bT4KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEtlbHZpbiBaaGFuZyA8a2VsdmluLnpoYW5nQGFt
bG9naWMuY29tPgo+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+PiDCoMKgwqAgLi4uL2JpbmRpbmdzL3Jl
c2V0L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4+
Pj4+Pj4gwqDCoMKgIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyx0Ny1yZXNldC5o
wqDCoMKgwqDCoMKgIHwgMTk3IAo+Pj4+Pj4+Pj4gKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+
Pj4+PiDCoMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCAxOTggaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgCj4+Pj4+Pj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXJlc2V0LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1yZXNldC55YW1sCj4+Pj4+
Pj4+PiBpbmRleCBmMGM2YzBkZjBjZTMuLmZlZmUzNDNlNWFmZSAxMDA2NDQKPj4+Pj4+Pj4+IC0t
LSAKPj4+Pj4+Pj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2Ft
bG9naWMsbWVzb24tcmVzZXQueWFtbAo+Pj4+Pj4+Pj4gKysrIAo+Pj4+Pj4+Pj4gYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1yZXNldC55YW1s
Cj4+Pj4+Pj4+PiBAQCAtMTksNiArMTksNyBAQCBwcm9wZXJ0aWVzOgo+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1hMS1yZXNldCAjIFJlc2V0IENvbnRyb2xsZXIg
b24gQTEgYW5kIAo+Pj4+Pj4+Pj4gY29tcGF0aWJsZSBTb0NzCj4+Pj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLXM0LXJlc2V0ICMgUmVzZXQgQ29udHJvbGxlciBvbiBT
NCBhbmQgCj4+Pj4+Pj4+PiBjb21wYXRpYmxlIFNvQ3MKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCAtIGFtbG9naWMsYzMtcmVzZXQgIyBSZXNldCBDb250cm9sbGVyIG9uIEMzIGFuZCAKPj4+
Pj4+Pj4+IGNvbXBhdGlibGUgU29Dcwo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqAgLSBhbWxvZ2ljLHQ3
LXJlc2V0ICMgUmVzZXQgQ29udHJvbGxlciBvbiBUNyBhbmQgCj4+Pj4+Pj4+PiBjb21wYXRpYmxl
IFNvQ3MKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IElmIHRoZXJlIGlzIGdvaW5nIHRvIGJl
IGFueSByZXNlbmQsIHBsZWFzZSBkcm9wIHRoZSBjb21tZW50LiAKPj4+Pj4+Pj4gSXQncyBub3QK
Pj4+Pj4+Pj4gcmVhbGx5IGhlbHBmdWwgYW5kIG1ha2VzIGl0IHRyaWNraWVyIHRvIHJlYWQuCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgIHJlZzoKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
IG1heEl0ZW1zOiAxCj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9hbWxvZ2ljLHQ3LXJlc2V0LmggCj4+Pj4+Pj4+PiBiL2luY2x1ZGUvZHQtYmluZGluZ3Mv
cmVzZXQvYW1sb2dpYyx0Ny1yZXNldC5oCj4+Pj4+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
Pj4+Pj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jYTRhODMyZWVlZWMKPj4+Pj4+Pj4+IC0tLSAv
ZGV2L251bGwKPj4+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dp
Yyx0Ny1yZXNldC5oCj4+Pj4+Pj4+PiBAQCAtMCwwICsxLDE5NyBAQAo+Pj4+Pj4+Pj4gKy8qIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIE1JVCkgKi8KPj4+Pj4+Pj4+
ICsvKgo+Pj4+Pj4+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAyNCBBbWxvZ2ljLCBJbmMuIEFsbCBy
aWdodHMgcmVzZXJ2ZWQuCj4+Pj4+Pj4+PiArICovCj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArI2lm
bmRlZiBfRFRfQklORElOR1NfQU1MT0dJQ19UN19SRVNFVF9ICj4+Pj4+Pj4+PiArI2RlZmluZSBf
RFRfQklORElOR1NfQU1MT0dJQ19UN19SRVNFVF9ICj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArLyog
UkVTRVQwICovCj4+Pj4+Pj4+PiArLyrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMC0zwqDCoMKgwqAg
Ki8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSBhc3N1bWUgdGhpcyBtYXRjaGVzIGV4aXN0aW5nIGRyaXZl
cnMgd2hpY2ggZG8gbm90IHVzZSBJRHMgYnV0IAo+Pj4+Pj4+PiBtYXAgdGhlCj4+Pj4+Pj4+IGJp
bmRpbmcgdG8gaGFyZHdhcmUgdmFsdWU/IEkgcmVtZW1iZXIgd2UgdGFsa2VkIGFib3V0IGNoYW5n
aW5nIAo+Pj4+Pj4+PiBpdCwgc28gaWYKPj4+Pj4+Pj4gc29tZXRoaW5nIGhhcHBlbmVkIGFib3V0
IHRoaXMgYW5kIGl0IGNvdWxkIGJlIGNoYW5nZWQ6IHBsZWFzZSAKPj4+Pj4+Pj4gY2hhbmdlLgo+
Pj4+Pj4+Cj4+Pj4+Pj4gSSdtIG5vdCBhd2FyZSBvZiBzdWNoIGRpc2N1c3Npb24sIGFuZCBJIGRv
bid0IHJlYWxseSBzZWUgdGhlIAo+Pj4+Pj4+IGlzc3VlLi4uCj4+Pj4+Pj4gdGhvc2VzIGFyZSBJ
RHMsIGFuZCB5ZXMgdGhleSBtYXRjaCB0aGUgSGFyZHdhcmUgb2Zmc2V0cywgYW5kID8KPj4+Pj4+
Cj4+Pj4+PiBCaW5kaW5ncyBhcmUgbm90IGZvciBoYXJkd2FyZSBvZmZzZXRzL3ZhbHVlcy9hZGRy
ZXNzZXMuIEl0J3MganVzdCAKPj4+Pj4+IG5vdCBhCj4+Pj4+PiBiaW5kaW5nLgo+Pj4+Pj4KPj4+
Pj4+IEkgcXVpY2tseSBsb29rZWQgYXQgeW91ciBkcml2ZXIgcGF0Y2ggYW5kIGl0IGNvbmZpcm1z
OiBub3QgYSBiaW5kaW5nLgo+Pj4+Pj4gQmluZGluZyBjb25zdGFudCBpcyB1c2VkIGJ5IHRoZSBk
cml2ZXIgYW5kIERUUyBjb25zdW1lci4KPj4+Pj4+Cj4+Pj4+PiBJIGFtIHJlYWxseSBzdXJlIHdl
IGhhZCB0aGlzIHRhbGsgaW4gdGhlIHBhc3QsIGJ1dCBjb3VsZCBiZSBJIHRoaW5rCj4+Pj4+PiBh
Ym91dCBkaWZmZXJlbnQgcGxhdGZvcm0uIFNpbmNlIHRoaXMgaXMgbm90IGEgYmluZGluZywgSSBk
byBub3QgdGhpbmsKPj4+Pj4+IGNsYWltaW5nIHRoZXJlIGlzIGFueSBBQkkgaGVyZSBpcyByZWFz
b25hYmxlLiBGZWVsIGZyZWUgdG8gc3RvcmUgdGhlbQo+Pj4+Pj4gd2l0aCBvdGhlciBoYXJkd2Fy
ZSB2YWx1ZXMsIGxpa2UgaW4gRFRTIGhlYWRlcnMgZXRjLiBXZSBhbHJlYWR5IAo+Pj4+Pj4gbW92
ZWQgdG8KPj4+Pj4+IERUUyBoZWFkZXJzIHNldmVyYWwgc3VjaCAibm9uLWJpbmRpbmciIGNvbnN0
YW50cy4KPj4+Pj4KPj4+Pj4gVW4tYWNrZWQuCj4+Pj4+Cj4+Pj4+IEkgbG9va2VkIGF0IG15IGFy
Y2hpdmVzIGFuZCB3ZSBkaWQgdGFsayBhYm91dCBpdCBhbmQgeW91IHdlcmUgQ0NlZDoKPj4+Pj4K
Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS9jMDg4ZTAxYy0w
NzE0LTgyYmUtODM0Ny02MTQwZGFmNTY2NDBAbGluYXJvLm9yZy8KPj4+Pj4gc2ltcGxlLXJlc2V0
IGlzIGFuIGV4Y2VwdGlvbi4KPj4+Pj4KPj4+Pj4gU28gdG8gcmVjYXA6Cj4+Pj4+IFRoYXQncyBu
b3QgYSBiaW5kaW5nLiBEb24ndCBhZGQgc29tZSByZWFsIHZhbHVlcyB0byBiaW5kaW5nIGhlYWRl
cnMKPj4+Pj4gYmVjYXVzZSBpdCBpcyBub3QgYSBiaW5kaW5nIHRoZW4uCj4+Pgo+Pj4gU28gd2hh
dCdzIGV4YWN0bHkgYSBiaW5kaW5nIHRoZW4/Cj4+Cj4+IEJpbmRpbmcgaGVhZGVycyBpcyBpbnRl
cmZhY2UgbmVlZGVkIChuZWNlc3NhcnkpIGJldHdlZW4gaW1wbGVtZW50YXRpb24KPj4gKGxpa2Ug
TGludXggZHJpdmVycykgYW5kIERUUy4KPj4KPj4+IHJhbmRvbSBsaW5lYXIgbnVtYmVycyB0aGF0
IG1lYW5zIG5vdGhpbmcgY2FuIGJlIGEgYmluZGluZwo+Pj4gYnV0IHJlZ2lzdGVycyBudW1iZXJz
IGNhbid0IGJlID8gd2h5ID8gSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kLCB3aHkgCj4+PiB0aGlz
IHN1ZGRlbmx5IGdldHMgcHJvYmxlbWF0aWMgPwo+Pgo+PiBUaGVyZSBpcyBubyBpbnRlcmZhY2Ug
aGVyZS4gRHJpdmVycyBkb24ndCB1c2UgdGhlbS4gSXQncyBub3QgInN1ZGRlbmx5Igo+PiBwcm9i
bGVtYXRpYywgSSBjb21tZW50ZWQgb24gdGhpcyB5ZWFyIG9yIHR3byB5ZWFycyBhZ28gYW5kIHdl
IGFsc28KPj4gc3RhcnRlZCBtb3Zpbmcgc3VjaCBoZWFkZXItYWJ1c2VycyBvdXQgb2YgYmluZGlu
Z3MuCj4+Cj4+Pgo+Pj4+Pgo+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZp
Y2V0cmVlL0NBSzhQM2ExQVB6czc0WVRjWj1tNDNHM3pybXdKWktjWVNUdlY1ZUREUVgtMzdVWTdU
d0BtYWlsLmdtYWlsLmNvbS8KPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2
aWNldHJlZS9DQUs4UDNhMGZESlF2R0xFdEcwZnhMa0cwOEZoOVY3TEVNUHN4NEFhUysyTGRvX3hX
eHdAbWFpbC5nbWFpbC5jb20vCj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRl
dmljZXRyZWUvYjYwZjVmZDItZGM0OC05Mzc1LWRhMWMtZmZjZmU4MjkyNjgzQGxpbmFyby5vcmcv
Cj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvNDE4YzVmMGMt
NTI3OS00MWY1LTM3MDUtMzQ1ZWM5YTk3ZWEyQGxpbmFyby5vcmcvCj4+Pj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDE0MDExMTE0MTUuMjkzOTUuYXJuZEBhcm5kYi5kZS8KPj4+Pj4K
Pj4+PiBHb3QgaXQuIFdpbGwgZGVsZXRlIGFtbG9naWMsdDctcmVzZXQuaCBhbmQgdXNlIHRoZSBo
YXJkd2FyZSBudW1iZXJzCj4+Pj4gZGlyZWN0bHkgaW4gdGhlIERULiA+Cj4+Pj4gSGkgTmVpbCwK
Pj4+PiBBcyB5b3Uga25vdywgQW1sb2dpYyByZXNldCBjb250cm9sbGVyIGlzIGRpdmlkZWQgaW50
byBzZXZlcmFsIAo+Pj4+IGdyb3VwczogcmVzZXQwLCByZXNldDEsIC4uLiwgcmVzZXROLiBJJ2Qg
bGlrZSB0byBkaXNjdXNzIHRoZSAKPj4+PiByYXRpb25hbGl0eSBvZiBzcGxpdHRpbmcgdGhlIG9u
ZSBkZXZpY2Ugbm9kZSBvZiByZXNldCBjb250cm9sbGVyIAo+Pj4+IGludG8gZGV2aWNlIG5vZGVz
IGFjY29yZGluZyB0byB0aGUgZ3JvdXBzLiBUaGVuIHdlIGNhbiB1c2UgdGhlIGJpdCAKPj4+PiBu
dW1iZXIgd2l0aGluIHRoZSAncmVzZXRzJyBwcm9wZXJ0eS4KPj4+PiByZXNldDA6IHJlc2V0LWNv
bnRyb2xsZXJAMjAwMCB7Cj4+Pj4gLi4uCj4+Pj4gfTsKPj4+Pgo+Pj4+IHJlc2V0MTogcmVzZXQt
Y29udHJvbGxlckAyMDA0IHsKPj4+PiAuLi4KPj4+PiB9Owo+Pj4+IC4uLgo+Pj4+Cj4+Pj4gV2hh
dCBkbyB5b3UgdGhpbms/Cj4+Pgo+Pj4gTm8gc2luY2UgeW91J2xsIGJhc2ljYWxseSBhZGQgYSBu
b2RlIHBlciByZWdpc3RlciwgeW91IG5lZWQgdG8gYWRkIGEgCj4+PiBub2RlIGZvciB0aGUgd2hp
bGUgcmVzZXQgSFcgZnVuY3Rpb24sIGFub3RoZXIKPj4+IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHNw
bGl0IHRoZSBwaGFuZGxlIGFyZ3VtZW50cyBpbiAyLCB0aGUgZmlyc3QgCj4+PiBmaXJzdCB3b3Vs
ZCBiZSB0aGUgcmVzZXQgYmFuaywgYW5kIHRoZSBzZWNvbmQgb25lCj4+PiB0aGUgcmVzZXQgbGlu
ZSBmb3IgdGhlIGJhbmsuCj4+Pgo+Pj4gQnV0IHN0aWxsIGl0J3MgYSByZWdyZXNzaW9uIGluIHJl
YWRhYmlsaXR5IHRvIGRyb3AgdGhlIG1hY3JvcywgdW50aWwgCj4+PiBncGlvcyBvciBwaW5zIHRo
ZSByZXNldCBudW1iZXIgZG9lc24ndCBtZWFuIGFueXRoaW5nIHBlciBzZS4KPj4KPj4KPj4gV2hh
dCBzdG9wcyB5b3UgZnJvbSBwdXR0aW5nIHRoZSBoZWFkZXIgaW4gdGhlIERUUz8gSnVzdCBsaWtl
IG90aGVycyBhcmUKPj4gZG9pbmc/Cj4gCj4gT2sgc28gbm93IEkgdW5kZXJzdGFuZCwgS2Vsdmlu
IGp1c3Qga2VlcCB0aGUgaGVhZGVyIGJ1dCBtb3ZlIGl0IGluIAo+IGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYyBhbG9uZyB0aGUgRFQgcGF0Y2ggYW5kIGRyb3AgaXQgZnJvbSB0aGUgCj4gYmlu
ZGluZ3MgcGF0Y2guCj4gCldpbGwgZG8uClRoYW5rcyEKCj4gVGhhbmtzLAo+IE5laWwKPiAKPj4K
Pj4gQmVzdCByZWdhcmRzLAo+PiBLcnp5c3p0b2YKPj4KPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
