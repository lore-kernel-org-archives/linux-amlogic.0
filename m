Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77620C83F03
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jul 2025 06:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bqqmtFv+Gm1w4x81lHNzJSOZT8GkPIdY+mYChPWvxU=; b=HEkRDtBLytkKJwXV7MvFUYZa0v
	OF7Hxqd7UR5DyS3IpbCZJK0QppRy8EG6RVaVNprIhGQoFTDDJJihbwUEj0nfM7l//sLa+3MSAo9xq
	+sU1JhcE+oQQfCmh3PMekmGqvKzFGHzlvj6HrfW8Sx7vynKrPrQ+qivJ6n9I4PlHyTOUXX/viWU6z
	ii4CcRS++GYXb8sYdIC0LQR4RScS6bFlhsGCP5qH90/uh0KxYnNRfZ8EioboOuHl0wQeYyJ6MK+Km
	ndCslY2+AlMvgpk7Mx/8zLdRqlsfb4U8tDEgxLv+Dja1x0oEdxAHG6uhQsv99aa5CDdNnrg/vM0Iz
	ZHd+VXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOJM-00000007fx2-3n5T;
	Wed, 09 Jul 2025 06:29:44 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOJK-00000007fvq-1VIG
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Jul 2025 06:29:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tx+HkLaUlhfRl2NZdesH60AW7WTKR6cEQBvWfEhFHIs7dar4RHzSPdbRsYWN/B9hN7OlytZ3utMrqgi7NUGfzrcblW1yI9jU0nSvurcLTmw/N0j3Lx/RlQ8ZBikaz5ZnN8b88bck5eD8Cvexz/Ne3ZNO2xuo/bbWJB/Aa8PoIp40aru1Gjr2sLqLBQxgSoT8hmFGFTZbm85dXmH++qeSd9DBgGbDG1lZdWJVfwWjszYi+i5m1ynEefX+TjSp0p6y0vUvpPcssRZa1zpV3f6x3DtgNOwIo58iS5F0yDZgr1QdAro/46cFl+V+mf2sm8dNLkRV+cvFwkaQjMtffva0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70Kjsow97SpSjFTUp9r/Mopjg+DY70dvJWkLSMrv16M=;
 b=NJbCngqKugvDsGve1qDCAtRrDNW/56kCgVSTTaZWO2tecZFQg0pPI0d81THdAq6oHGJnb8KmYThytezlSF+KNC8MeaVjUlbE2x+oAlJ7IPOXRu4AYHyPU9KesbiDEEpaSWUDYJwLH2Dwcf81MgvyHNTTZCzNFmb/zNTjQmJgSvgasgGzBbW1BcmbU9NiIUQnEX0E/yzcO7x59ZL/34EAZ47JpM7CoKenEfx23Bj6Qozg3u6UePxEW/RYMz4azibieSROqL8hRC1mjLKPfzj4e7Jcejg4U+qgDnv2+O3aLisIAINsRCzGFW8lxR/6fuIzSXSWXVq3YEO7vvjqB918lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70Kjsow97SpSjFTUp9r/Mopjg+DY70dvJWkLSMrv16M=;
 b=xXMfTJScWImDT6rLD0SzWQzvJF5ZyYDu76EV1MljiZVWFEKezbGY9EaKgtxChjGBWpaFi1jjlWMUb+bhEHu5kAzvGGDgdU3bdk7s52W2c50+jI/Pancyk6GGbo4qMd6Di89XOJJl3T4QK4wcCf8qDy3AYXnJL5TD7zZG4j7mEU3StfYMFRnI4hyLd9qKOckhKs/iSLQSdWz7MfRIvTrv3toDiQJNEEmj8oWhZEOKYb0U1VtIQQaKEAVnKiMfhwRlmXHjng96PYi3tMnuZWi0ELxVxMRsjB/CU5z9fPw7vQdRci1YvePx4O83WbJ99TsnxgxayWT6RMXgs3LVEAbA2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB7203.apcprd03.prod.outlook.com (2603:1096:400:339::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 06:29:12 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%2]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 06:29:11 +0000
Message-ID: <646ef30f-cadb-40ab-a0ad-c493fbdb9709@amlogic.com>
Date: Wed, 9 Jul 2025 14:29:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] spi: Add Amlogic SPISG driver
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com>
 <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
 <CAFBinCB4Lw04StL-kPpzKHPyETKfi5FYFipHRBDDnPdtRVDrmA@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCB4Lw04StL-kPpzKHPyETKfi5FYFipHRBDDnPdtRVDrmA@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d689aa8-46b6-4c5f-b1b0-08ddbeb1eab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUw5VS92QTB3SzB1NkFBTExXVk5sTXRoQ0FhLzRvb2ZJWHdBdjhTMjUzbTlP?=
 =?utf-8?B?U3BVelBVV2g4VG1mTjNwQTRGYnFJMjh5ZXNsNE1ubXlSQnhxa012czFXSmpL?=
 =?utf-8?B?dnBiTWtyQkxhMTM3amlENkpTSHRCazROZ1V3RnRrZTBXaTJiRW51Y2JpM1VL?=
 =?utf-8?B?MEx1aDBiY0UrM3FQakY3ZlhvQzBqUkliNndWZmhVRzF4ek94eTJPd3F2MDVJ?=
 =?utf-8?B?MVY3aXpBOUdGMWJDRVNTQ2xBUWVBTk1jU1JqNUlOUWpVK243Ny80L1RrbTZE?=
 =?utf-8?B?akg1NUtFQWppY1BYT3Q1enNHcWRGeXdXZnl2NDJyNWtYcXFqSUlzZjhBT05o?=
 =?utf-8?B?dTB1V1JjNERZamlVaWNhUThSTjN0bzR2NjFyeGJibzluME9Wajc0bGIvOVlB?=
 =?utf-8?B?TUZhSGY2VGtmd0pEYjQvY3E4L2RYQkQybHRSY3JLZGVVTkpWMldhNkdTdnls?=
 =?utf-8?B?UTB0cVh6UmtJYit6UXhDSXljUkdpNnVJU0dKdjFEWDcvVG5uWnkxdlVJSFZh?=
 =?utf-8?B?NGY0cW90QlZLMkF5cEJadkhYbi9TRW5GYmRFWFBKUkNhZzdxUHhRMG5WQmJD?=
 =?utf-8?B?NjhLaVNadVF5TmplRDMwN3RxZUU3cE9VM0hpNUdtbWhsWGxVQjJtaWVXUUc1?=
 =?utf-8?B?cEp2NU9ZSUNRK2J3Mk5DN1pmQ3A3aVVmM2hDb29yc0xJa2paVmpFOWdrbEVY?=
 =?utf-8?B?cjh6Mmk2UlptWWwrMmVZTHFmVzJwU0VLaWJ5Y1NKN2l6dm9LVGRpUWZFZkVL?=
 =?utf-8?B?N1F1Ulhyc3ZhZTRuNHVERGhBY1g2amRQUnVibGVaMVAyNmtjME1DdWZ5NHkx?=
 =?utf-8?B?U0RNZkFCS2lxREp6cFlrVlk0VWUyQmZEMXRKbThzSGRNeGpDQkdiV3NqeGpT?=
 =?utf-8?B?Z2xZckg1Z2VKZkxlam5XVGNPRjF4QTVNTzFRY0duNUcvcW5hazZEUUcvVzd4?=
 =?utf-8?B?aHlhQmxYOEdXVGZTM0NUUWZReHRBa2FlV2dRSlN4OEtSbXVIYmtlZW56Vk0r?=
 =?utf-8?B?RDhVTURaT1pwNnJvRlJkTFRBSzhCQ0JNRFl1L0FEVGZYSGRESDhjOTNSNGhM?=
 =?utf-8?B?dVNXczlXbDkyZytldnhlb05VbVl4U0RMYm82ekptSkd6bXlQUlNOSmhEYkpp?=
 =?utf-8?B?NkZZTk8ydXRZNXBLU21NaEg2NUw3YTZPQTBVd0hKV1M4OERFL3Ewd2dXSnp3?=
 =?utf-8?B?M1NUa2ZJaWxyYm9aOGRPeXpKV0l1Vm8zbUk5bmlubDUzWk1hdUxpME9vdUdj?=
 =?utf-8?B?cmVNRzNMVkF0dWtYWkNGQ012YktxSDdCQzhEVGRTK2VHaEdqYk41QXVsK1Rx?=
 =?utf-8?B?dXFKREFKRTh3b2NrOVB3Uk9heGRQQi8ydEJpNjNaMHp4WnV6MUh2WlRBZFM5?=
 =?utf-8?B?L3VYKzJqRTk4dmEvYnJrZTVoSHAzY05IcGZUTlBUSkFLSldWam9xTm1PM1pq?=
 =?utf-8?B?eWdrN3hHTEd5ZkpJejRhcnhMV3ljd3QwMHZZTnhxTW5iYUhiVVo1NlYycVhZ?=
 =?utf-8?B?S2lIWTJVcFlaakJ6UDFKa2hGcGlKc1BqdjgvZG1aSWRadjJDY2l0WFVtTjc0?=
 =?utf-8?B?TnMwYlZUQ2F4T1NFV21LWStqTFkzbkN1ei9jaTN1bjRQWWxWNjlqUnF0QU1i?=
 =?utf-8?B?Y2N2QjZBeTBuQW02d1FJY3VpbHJWbGhNbHhnd0tCM3QyUEI4cEZzYzAwcWxp?=
 =?utf-8?B?dVZyS0kydkNZSmhpbU5DQlNmR2Vhbml2NHd2N3FlNWhaemZPRk9zeDZkWmVw?=
 =?utf-8?B?Q3JDSkwvTWRSSm5hSTBHdmRjaXFPSUdPdU01VFVJZzlLMzl1VmhVNGJuMzVs?=
 =?utf-8?B?MkJURmpvRGlsTFlMVFUvelpjZnBuQ1pUR3c0Uzdvc1VYeXdGZU9wYjEwNWxx?=
 =?utf-8?B?M0lsU0gzdExWUWE3V3N0TEdFaTI4Ujh6VGtwdzVPaDJQeFhsZytGWHVta0Ey?=
 =?utf-8?Q?LEc4QegZ8lA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3AvcHJyR1N0SDFGdDRraFlnTkl6WWlHdzNqbDlDM2JlV0dsQTlPaWpYSkdR?=
 =?utf-8?B?Q040b1VwUGRXVnlPdGxVZHEyeFkzY05jaWlnd2F1VnFuR1Bva25rU0VpbHJG?=
 =?utf-8?B?d1UxdWgvOG04VnpvWm5ic3FoazV0ZEZlaGcvcGlqNjBLRjVPMStPZjBtazhK?=
 =?utf-8?B?YVlRWnZrSFFFd1JYTm1XakRCSDJqdmN3NllzdkdESUhEczQ2ckxnWkZYVDBp?=
 =?utf-8?B?Rm1mWGRtQ3pVTkVEc2FrY08vVjJUNldpcXR0djRRUG54SFgyRmxDYW54YkQ5?=
 =?utf-8?B?MjFsbWttOUxveDRVbmhvN3VmREI0NlprV1c4d0F0TENRNFJwTkVpdTYyVFZQ?=
 =?utf-8?B?WWFyUWY2R2t1dW5FQkQwbkZaYmx0U05aaHZ3NW5iN1dpQjNwMmJmUmZPdVpH?=
 =?utf-8?B?NFBQU25nck9FTCsyRzdqMmFwOFp6UWtuaWtpTldRMmlwS0dGd1gyclI1Nk9m?=
 =?utf-8?B?a1dhNEx6VEIwc2tRQWcyUXdOTzFoSUR0QXlSb2dGR08vckdnS2xFbkEyaUZ4?=
 =?utf-8?B?RENRaEgxeEpGTEN4dDFQUEYyV0JreXZWc2ZwdTVmYTNBY0srYVJyUEZIcjhS?=
 =?utf-8?B?UmczalNZZ3RLYm9CWVVoQ3pBU3FISHQ5MHlURUNuLzhhT2puMWhzelNrb0tT?=
 =?utf-8?B?MEZ0amhMZ2RiUXNiZjBJL1JnT2FLS3UwVzBkcTQ2UE5VaDF1REF2dHN1c3Jt?=
 =?utf-8?B?aVlkRGkzdGVqb29KUHUyWTN0dDI5VWZILys4OHVaU3R4TkhZMWZ2bVRreWJW?=
 =?utf-8?B?VUxqZE5nSmhwUE91NmpCSnUwOE1SOU9TZXRjTGRxSjRPMDcyOFhnREhlclhI?=
 =?utf-8?B?M1dvSHk3L25OY1Mzc21DU3JOTUZPSm5lVHVOQzFIQUNuU3JxZWhLVUxVWjhH?=
 =?utf-8?B?aDhRNGNPencwcFo0b0w2RHN0WkRLWmM1UURPZnJzL09zSWVmbE9XZzcrMzgv?=
 =?utf-8?B?K1ptNC9LNHJ2K01HNEVhK1U3SXZjSFUyTWRpK1hUM3FJbGJkSUpzWlFUZ0NH?=
 =?utf-8?B?UmVwdFByaVMwMUdWTFBUUzM0cnJ1OFZRd2JjYVF2dUpKa09nUVZaNWx5aHBE?=
 =?utf-8?B?NDBNSmRqV2FES0JXaktxU2RncklmUFgvZ3RPdFZ0S3ZiODNWWUJIOGpSR3Vu?=
 =?utf-8?B?ZkZKdlQvYWEyM1d0RGVISUNrSTVxOHc2eGV5OThoTGcvMjd1VFIzQjkxQm1a?=
 =?utf-8?B?d2pPbTlsWHhSNEFzaTFPUnVvVEtHSWtjWW9aVkhXWnFhb0NXUlIwcUdpZmZi?=
 =?utf-8?B?QTEzY3N2Y3ZESGVzUFBpZUFObXVQQzVKSkFwdHc5c3prZktKclNZQTVTZmc2?=
 =?utf-8?B?dldYck43VjhodmVkR1NTb2d1QlRkaEQyeW9oZzRzQnF1dm9aRmtON25vQW5H?=
 =?utf-8?B?K1B6UllJSjJGdWNkdHVZeExXcmMxTWNabkFKbDhsYWh2aWFrc1FwMmdYM0c3?=
 =?utf-8?B?elNNNDRScE1ldjg5clROQjF5NkM2YUIvZ1M3M2FSOUJDSlM3amlZQWNiTkRv?=
 =?utf-8?B?MkIySlI5blRDTnk4WUFtK214U04rQ2ZFcWpJRHcwWlpjZk1xbEVNalhJZHAr?=
 =?utf-8?B?Z1RQVEJ0YVpqcm1RZjRxcmVidzFEL1cyNUkzUVhZZjNUcXZveW5ycDgxRVRD?=
 =?utf-8?B?MysrZlMvUFl6ajZaSm53aXM5ZUt3MXM1RStleEF1dnBHZjZLRk9vNG9NRUJm?=
 =?utf-8?B?ZTZaMUNJZ2VadWpleFNvVFoxMks4WmJvaWNrZS8yaUN1dGxPbGNIODUrOVhm?=
 =?utf-8?B?NVdNZk1UYlM0b1VFZ1RNUWF6bmY1RUZXejc0VS9TR0pBK2t1bHY2bkIvU2po?=
 =?utf-8?B?bHg2TU9iYzlVL3I3SGx4RW9PZEd0Q3VRa3R5MSttT0pDSWxXSU9MYm00dWNR?=
 =?utf-8?B?cTJVYjR3bWhhNVJxRlIxc0xKK0hKd0NIM1JxNFJGVTJyY21ncER1VFFrWkd6?=
 =?utf-8?B?TWtXRk1IeFJIVGpJbStEWFdWQ2Y0MktUalVndFQzYzZpd245YVppZ25ydGVN?=
 =?utf-8?B?UnhPVHE5M1lIS3E4YjdNUFFsamFlZWdLZUtmR2NhVkkvb2JoNVBQQm8wS2oz?=
 =?utf-8?B?MFhCQVhxdVJKZndJeS9rVFkrOC80VDN3Yy9ZelArbkZibVUzN29qTlQzNndu?=
 =?utf-8?B?ZXI3aDRSd2F0SzZyQkw3QkpwejQ0VjFPbjlHYTlhV1lvOFpKNklvWW94Q2hH?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d689aa8-46b6-4c5f-b1b0-08ddbeb1eab2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 06:29:11.5239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6o0yeus3wmspBX2PEuoX+4R+SsFHAsC2TQ1q+8FZZMO69UmzQs53QPaywi90G0MFYu55Bz1MS3lb9UYqFrYtM7sLBUVt2HhPVg66MYv0XmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7203
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_232942_567377_67068597 
X-CRM114-Status: GOOD (  23.57  )
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

SGkgTWFydGluLAogICAgVGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKT24gMjAyNS83LzkgMDA6MDEs
IE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gSGks
Cj4gCj4gT24gRnJpLCBKdWwgNCwgMjAyNSBhdCA1OjA34oCvQU0gWGlhbndlaSBaaGFvIHZpYSBC
NCBSZWxheQo+IDxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3
cm90ZToKPiBbLi4uXQo+PiArICAgICAgIGRpdi0+dGFibGUgPSB0Ymw7Cj4+ICsKPj4gKyAgICAg
ICAvKiBSZWdpc3RlciB2YWx1ZSBzaG91bGQgbm90IGJlIG91dHNpZGUgb2YgdGhlIHRhYmxlICov
Cj4+ICsgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKHNwaXNnLT5tYXAsIFNQSVNHX1JFR19DRkdf
QlVTLCBDRkdfQ0xLX0RJViwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgRklFTERfUFJF
UChDRkdfQ0xLX0RJViwgU1BJU0dfQ0xLX0RJVl9NSU4gLSAxKSk7Cj4gQXJlIHlvdSBkb2luZyB0
aGlzIHRvIHByZXZlbnQgZXJyb3JzIGZvciB2YWx1ZSB6ZXJvPwo+IElmIHNvLCBpcyBDTEtfRElW
SURFUl9NQVhfQVRfWkVSTyBhcHBsaWNhYmxlIGluc3RlYWQgKGl0IGhhcyBiZWVuCj4gZGlzY3Vz
c2VkIGZvciB0aGUgdDcgY2xvY2sgY29udHJvbGxlciByZWNlbnRseTogWzBdKT8KPiAKCk5vLCBp
ZiBhZGQgYWRkIGZsYWcgQ0xLX0RJVklERVJfTUFYX0FUX1pFUk8sIHJlZyB2YWx1ZSB3aWxsIGVx
dWFscyAKZGl2aWRlciwgc2VlCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9kcml2ZXJzL2Nsay9jbGstZGl2aWRl
ci5jP2g9bmV4dC0yMDI1MDcwOApBcyBmb2xsb3cgaW4gZnVuY3Rpb24gX2dldF9kaXYuCiAgICAg
ICAgICJpZiAoZmxhZ3MgJiBDTEtfRElWSURFUl9NQVhfQVRfWkVSTykKICAgICAgICAgICAgICAg
ICByZXR1cm4gdmFsID8gdmFsIDogY2xrX2Rpdl9tYXNrKHdpZHRoKSArIDE7IgoKQnV0IGhlcmUg
cmVnIHZhbHVlIGFkZGluZyBvbmUgZXF1YWxzIGRpdmlkZXIuCgo+PiArICAgICAgIC8qIFJlZ2lz
dGVyIGNsay1kaXZpZGVyICovCj4+ICsgICAgICAgcGFyZW50X25hbWVzWzBdID0gX19jbGtfZ2V0
X25hbWUoc3Bpc2ctPnBjbGspOwo+IEluc3RlYWQgb2YgdXNpbmcgX19jbGtfZ2V0X25hbWUgbXkg
c3VnZ2VzdGlvbiBpcyB0byB1c2Ugc3RydWN0Cj4gY2xrX3BhcmVudF9kYXRhIHdpdGggLmZ3X25h
bWUgc2V0Lgo+IElmIHlvdSB3YW50IHRvIHNpbXBsaWZ5IHRoZSBjb2RlIGZ1cnRoZXIgeW91IGNh
biB1c2UgaGVscGVyIG1hY3Jvcwo+IGxpa2UgQ0xLX0hXX0lOSVRfRldfTkFNRQoKaGVyZSBJIGRv
bid0IGtub3cgcGFyZW50IGZ3X25hbWUsIFRoZSBzeXN0ZW0gZG9lcyBub3QgaGF2ZSBhIApjb3Jy
ZXNwb25kaW5nIGludGVyZmFjZSB0byBvYnRhaW4gcGFyZW50IGZ3X25hbWUsIG9ubHkgbmFtZSAo
Y2xrLWNvcmUtPm5hbWUpCgo+IAo+PiArICAgICAgIHNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1l
KSwgIiVzX2RpdiIsIGRldl9uYW1lKGRldikpOwo+PiArICAgICAgIGluaXQubmFtZSA9IG5hbWU7
Cj4+ICsgICAgICAgaW5pdC5vcHMgPSAmY2xrX2RpdmlkZXJfb3BzOwo+PiArICAgICAgIGluaXQu
ZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5UOwo+PiArICAgICAgIGluaXQucGFyZW50X25hbWVz
ID0gcGFyZW50X25hbWVzOwo+PiArICAgICAgIGluaXQubnVtX3BhcmVudHMgPSAxOwo+PiArICAg
ICAgIGRpdi0+aHcuaW5pdCA9ICZpbml0Owo+PiArCj4+ICsgICAgICAgc3Bpc2ctPnNjbGsgPSBk
ZXZtX2Nsa19yZWdpc3RlcihkZXYsICZkaXYtPmh3KTsKPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRo
YXQgZGV2bV9jbGtfcmVnaXN0ZXIoKSBpcyBub3QgcmVjb21tZW5kZWQgZm9yIG5ldyBkcml2ZXJz
Lgo+IFRoZSByZXBsYWNlbWVudCBpcyB0byB1c2UgZGV2bV9jbGtfaHdfcmVnaXN0ZXIoKSBmaXJz
dCwgdGhlbgo+IGRldm1fY2xrX2h3X2dldF9jbGsoKS4gZHJpdmVycy9wd20vcHdtLW1lc29uLmMg
aW1wbGVtZW50cyB0aGlzIGluIGNhc2UKPiB5b3UncmUgbG9va2luZyBmb3IgYW4gZXhhbXBsZQo+
IAoKV2lsbCBkby4KCj4gCj4gWy4uLl0KPj4gK3N0YXRpYyBpbnQgYW1sX3NwaXNnX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICt7Cj4+ICsgICAgICAgc3RydWN0IHNwaV9j
b250cm9sbGVyICpjdGxyOwo+PiArICAgICAgIHN0cnVjdCBzcGlzZ19kZXZpY2UgKnNwaXNnOwo+
PiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+ICsgICAgICAgdm9p
ZCBfX2lvbWVtICpiYXNlOwo+PiArICAgICAgIGludCByZXQsIGlycTsKPj4gKwo+PiArICAgICAg
IGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIGFtbF9yZWdtYXBfY29uZmlnID0gewo+PiArICAg
ICAgICAgICAgICAgLnJlZ19iaXRzID0gMzIsCj4+ICsgICAgICAgICAgICAgICAudmFsX2JpdHMg
PSAzMiwKPj4gKyAgICAgICAgICAgICAgIC5yZWdfc3RyaWRlID0gNCwKPj4gKyAgICAgICAgICAg
ICAgIC5tYXhfcmVnaXN0ZXIgPSBTUElTR19NQVhfUkVHLAo+PiArICAgICAgIH07Cj4gTW9zdCBy
ZWdtYXBfY29uZmlncyBpbiBBbWxvZ2ljIGRyaXZlcnMgYXJlIHN0YXRpYyBjb25zdC4KPiBJZiB5
b3UgbWFrZSBpdCBhIHN0YXRpYyBjb25zdCB0aGVuIEkgc3VnZ2VzdCByZW5hbWluZyB0aGUgdmFy
aWFibGUgdG8KPiBhbWxfc3Bpc2dfcmVnbWFwX2NvbmZpZyBmb3IgY29uc2lzdGVuY3kuCj4gCgpy
ZWdtYXBfY29uZmlnIGFzIGEgbG9jYWwgdmFyaWFibGUsIGl0IGNhbiBzYXZlIHNwYWNlLgoKPiBb
Li4uXQo+PiArICAgICAgIGRldmljZV9yZXNldF9vcHRpb25hbChkZXYpOwo+IEkgaGF2ZW4ndCBj
aGVja2VkIHRoZSByZXNldCBjb2RlIGJ1dCBJIHRoaW5rIHRoZSByZXR1cm4gdmFsdWUgc3RpbGwK
PiBuZWVkcyB0byBiZSBjaGVja2VkIChkcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jIGRv
ZXMgc28pLgo+IEV2ZW4gdGhvdWdoIHRoZSByZXNldCBpcyBvcHRpb25hbCB0aGVyZSdzIGNvbmRp
dGlvbnMgd2hlcmUgd2UgbXVzdCBhY3QKPiBmb3IgZXhhbXBsZSBvbiAtRVBST0JFX0RFRkVSICh3
aGljaCBtdXN0IGJlIHByb3BhZ2F0ZWQpLgo+IAoKVGhlIHJlc2V0IG1pZ2h0IG5vdCBleGlzdCBm
b3IgdGhpcyBub2RlLCBzZWUgcmVsZXZhbnQgeWFtbCBmaWxlLgoKPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gTWFydGluCj4gCj4gCj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9n
aWMvYmQ2ODM1MmYtN2Y4Yy00Y2JjLTlmNGYtZjgzNjQ1Y2MxZjcwQGFtbG9naWMuY29tLwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
