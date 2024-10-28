Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB40FD13570
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Oct 2024 10:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zngp9xkQvQItyUnAnqFsZWjgfHcUL9NZd4cZdboCX44=; b=muvDNz3rcgSAqQM9dW68jDJDjz
	BmUcuF3ZNgmDG44IQXMcpkeodBixcDesSKQXXTI/WYs/mO80EfnRt9g95jRk1X/gfeP5gq6W10+ab
	OVpP9w/vzcFfQxxY/v9IB7LkU2qo8aqzFqGKINt9GT1V2xW2oYl+dxQ1OhpdIPz7A0q+WX2Y0XMpk
	llRvCM3czipS2FOxs+kP4/I1f/JkGmUI+kTFh9kaAMHybojjLlylYuVJolMwZXLTdtCNNQ/mvAOSw
	wws3YD/yeHlsi5gfB+LohEF+P/GazN2UJqzXPtyF3c2ZGlkdpTEL1uqxmvsdGHIutQjXkiui68ZbM
	BvfKBoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MY0-0000000AKgV-12Jx;
	Mon, 28 Oct 2024 10:00:28 +0000
Received: from mail-sg2apc01on2071e.outbound.protection.outlook.com ([2a01:111:f403:200f::71e] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MWu-0000000AKFj-3hOo;
	Mon, 28 Oct 2024 09:59:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dziV1KwjOkzDlANZnu4SMX09v+t3gfCqtKm9fn1C1j7G3y+SwLreaKCQD6sTQI3GCoLDyHry812XGU9/B1vF/9INkbfd48nK8+Cs+NpnPLyiKgrK6ByeNisocRhxcqyMgRNAxlD2o50qP9HHb0NDl6qdEZZqa+s3A9NjJDCqs6F0tjAO7s+3FVrKViYJkAbBNfIWsrexO9rhQXC3GeK3zbuM8WcEmd/ueEZhaDmx8C8VupoJSiS5DtRie2WNcWqjTLp3nUL5qISUWPQFe0wVm0+p59jWfv0VCBud52A8pi0kYqC+qnsjZYftWwAjg38Mr65bXsFAXFoulYDJ7fiMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf8HsF+UTj3qiIO3I7OSedTMS1L3A4ztyJ+MZ3ONqog=;
 b=HcoJGVtVWCDSpk1fR7ePlkaFDJMpZxdNGqZnUMUK4tocahkCz2zCCfFu1Jr3J/PCWkNAO+rN+6jt4FDPzmEk3Dh5YNe+1H6QCD7n2cjCE7xZOcvHQnM64jkDwdB0+1r3x+J2Gk44IGWweqHdu1zVDBp7JCRAXnR/3xqpwzSGrY7/24N9k8PtKLV2BiN9ZXDodFKSg2OSl0R0jXbWy4FuaG95MkOhRyhF400ZLu+/GRLLr8MHoe1OVtALhnnKeDL2EL7UUTWSeA875p/PVG5pqm4qcNM/cp6j/SEcaSVa+qpXaC18Q7IfmZFljwgCkJUfiQVA01g/zb7nXDc8t3Afyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vf8HsF+UTj3qiIO3I7OSedTMS1L3A4ztyJ+MZ3ONqog=;
 b=vi9YNJchOg6bGU17v9gbPxZdpHjFCjj7bx/5DSSpLS70YHqd0+EhA+h/w8GU6HiORwQWAX0E9uhtRgojtKeVWxQKwKCvGdBujv54HBw9oFge5vhGyClt7XSGjG2T1qx9xTgEY5PlWjkazvnrtn+kNwoX2MPtebrsLhydQ17NXqu5zJp0bggR69Nb2Lp2T6QOmpGw51RPWdYRQdQlS0BoiELcMA5/x2KuN/OoJfY7oQorvCdhn36B7oorT7rg/abtBxUcJfXJI4e1oLVfrCnuoFb1dMA0P8RgoeZOcFummVxDaZ9hkT90WScDHgK05eEUPOUnVXZCagEHWmurlvbJnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by KL1PR03MB8320.apcprd03.prod.outlook.com (2603:1096:820:10e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 09:59:12 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f%3]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 09:59:12 +0000
Message-ID: <7c069b82-c31b-45cc-8cf3-a2181a56c2f5@amlogic.com>
Date: Mon, 28 Oct 2024 17:59:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Content-Language: en-US
To: neil.armstrong@linaro.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
 <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
 <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
 <91bcc765-2e56-433d-a629-c5255fc8d256@kernel.org>
 <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
 <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
 <d4ae04da-d841-49e8-be88-b0fe0c7b3de5@amlogic.com>
 <a0c30691-ad28-4217-bf46-924fca5f48de@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <a0c30691-ad28-4217-bf46-924fca5f48de@linaro.org>
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|KL1PR03MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 457c2115-b14c-48b3-eeb2-08dcf7372c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3FJOTJ2cUwxNi94cE1Yb2w0WnZWc0hCOWhtMWd6NXovdmhPSDhqWCt0b1Vx?=
 =?utf-8?B?aHFXUlAyQVA3OSt2SnAzNHJZeWNjSWI1WStXS1VyVUxBaXBOVTFvOUhZRkcv?=
 =?utf-8?B?R1ZiR3lObUYzUGxhQ2FGU1hSbi9ETUdrR3NEcnJ6dGx3UmdKbGlDMTZybit2?=
 =?utf-8?B?LzJGcnhvaDlDMWxVQUVLS2Y2T0JVWVZHMTlIZTZWVmFYK2g2SWRjWVVTT1lt?=
 =?utf-8?B?RlZlN08zVjN2RS9WeGNxZWhOWGZCV0NGdXVKbnhBSHVBWmdCZXZDbjhZZnAw?=
 =?utf-8?B?bFZjYmQ1TVliNU1ZNEE5YWg2RFBwamk4d2J0bk9tQWNCZnUvMFpCK0VudnJh?=
 =?utf-8?B?bU0yY0cxVkZQOGJOMm5wc29XdjVQZ0czZ2VreCs3ZExvb1E0ZUZZYjJ5Yk04?=
 =?utf-8?B?ODJqbXEwNm8rVEdqdEo1dmVvQjMrK2lNUmtPZFhTTkhWNGEvMVo2S00wVmZ1?=
 =?utf-8?B?SHkyQmtodzdVMDJiZ2F2cUFJbWV1ZFVIZ0p2TG5Mc3hMT1llV2NKS0pQNDlZ?=
 =?utf-8?B?bWh4WTlhbW0yb2E5QjFKdkttVWQzQTJPWlBjRUxxWGJEQU9LNmhaZW8rQWJv?=
 =?utf-8?B?aFJuM0JGZ1VsRnJwZE91VWJhdU1ZYlVaTkVEVDh5RHNnb2lwSklUOU5qbXlv?=
 =?utf-8?B?SThObGFqa2dqNVJWQWFRc0tEVzZsb3plSitELzUyR2Nwc3VHTXphcWxQeEFN?=
 =?utf-8?B?d3VBSnlORThJbFl0WEg2WUsxd3lkUUx5UDVVbDhxYkRibU15dzBHNjJMMGdv?=
 =?utf-8?B?My9XaHd3TTB2dGEwL0w4WkZhUXlieFJEOWQ3cUhKVFE1cjB1YSs5akZaTEZk?=
 =?utf-8?B?THVJUU9hblNaZ1dWaFR2NXM3bW1ydWdEcHo3anJFNFdodmxjTFdHMmREK2RU?=
 =?utf-8?B?VWNqcHRKVi9Vemlycm5kb3U4UlZYWUlSQUg0WnFmR2wvdWU2bEdVOXZidmc1?=
 =?utf-8?B?OHVCekZwazlGMWMrK045VXNQTllmVnZWN0QvQTR5RkNHSncwSWRUYVNTSk0w?=
 =?utf-8?B?WFN0N3gwdnFXZlg1UjBtbXk2Z1UwVWVIQXp5a05vRy9PWUNONE5ac0JHYW1Z?=
 =?utf-8?B?d3lKeXUrWEhGUGk3ekFMNzVxZjNzMnEzRTdyM0J3MkJKbU5SNWZpL1hFWFZC?=
 =?utf-8?B?RWNlSjdmdjU5ejI3NG1mQTI5akNZcVV0ZTJ4UkZ5RjlIbXQ5R21tK1Q1d3pC?=
 =?utf-8?B?UEhNQWZiL2JWUXFSYkVwZllSVi84dmg5a05ZSHZYdVFSNDRpbGJHczJoYmU3?=
 =?utf-8?B?NE11VEpSY2ltUnhyTGptOFNkZE0yTWNoQ1VWWlA4aEh2R1AydCtobnFTcVA2?=
 =?utf-8?B?emxhNDMzWUdqSkcvNDZuVWswNkpKRSszMkxzaGRQQ1RIWG1vVHdqdjRESnl5?=
 =?utf-8?B?Y1YwVnZPNkJVbG9hTVA4RHhUMFo3UkhGVnhqeExoa1M1UGpkZ3VaSlcwbXFp?=
 =?utf-8?B?SmduYXhRM0FTa2FtRVJqZHYxRmRCM2NqRjJ4VWxOcW1jUHZnNmZhaDNWVUV3?=
 =?utf-8?B?b2hiT0N3SW5vT2sxSnZkdERtQVNFWWlIMFkyWnpSZXZ6VVlnWXZOQjErVEdD?=
 =?utf-8?B?dzQwd1Y2ZkJVaVZaeVlxcEgvMTRKYUtUeGd4bHpiRnlDZWpHQnZ6Q3BMdDNu?=
 =?utf-8?B?UUN3aGJZd0FSN2pITEpBS2I3dVpOcU9TT3FXaTN6UFJyaE9LVUF2Z1RRVytn?=
 =?utf-8?B?WVR4dnZFekxiVUtwZXBKdmlSaHFYdHp0YXF1b2lJWE9UTHRLQnJzUEQxN1lN?=
 =?utf-8?Q?J5dVsyxkVXHdbR2elmuexxvZs3SJ0MenDpXEm/a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anMrdnZJMTRUbnFseTRsUFNsTFhjUzhoUU1YOHNScE5LMzFYMk9qNGRDMmxj?=
 =?utf-8?B?MEs2dVo4NWx6N3BKM2hjLzFPeXVLQ2pWbFhVcE9NcnZ4RnBmNzR1MFlDVFhO?=
 =?utf-8?B?Sk9GSHFNem5iVCtMQnhoNVIzdjNvM1FsZFlESjJqRWFJN2hlcGZMdlVGVVVH?=
 =?utf-8?B?M2ZOVDZUbmczODJqYzR1MGVjYnlmOTUyMkZJRHBxclN6SDV2RFlIRkRxeW5N?=
 =?utf-8?B?NkRFZ0tIeUlzZlMwYWo3cVFsZG9uY1gxZVp0NmZFVUUzczZ2S0VvTDI3VDFM?=
 =?utf-8?B?TU4wclliaFpwWVpUS0dpUHBndFVpcllHTlUrVmJKKy9iR2phYVNmSEVxYnF2?=
 =?utf-8?B?MGV6Y21LUDJRWE5BOGh6Ym83WCswUmJSNDg5endRMFc1Tjk2UmprTTJRNXhy?=
 =?utf-8?B?cE1LWGQ0blBoQmdValNYNUg0NlVkUFBhQklCSFpVek1WNDdwK3ZzSDhZZWlr?=
 =?utf-8?B?b2lUYUNlOXJyMEY2Y0NldUwrNkdkcHV2bGt6cHZ1S1U3NEp2cnhjMG85TGhM?=
 =?utf-8?B?c2RQT0pVaHdMK2lIeXR0T2hvUzhmTEs2TFhhL1YwdzdNbVQwNVlxdCt2czYz?=
 =?utf-8?B?U3k0RVdWbTZmdTVVTi9NNDNVa0o5ZlFkL1p0ZlAxS1MrV1BjN2sydjhVcFg0?=
 =?utf-8?B?VWs2YUhXUCtOdFlMUC9wd21wRXlMNmRLcWdZRlFuQk9UZmNtMUtEMzNueUpl?=
 =?utf-8?B?aDhpeTlwT2d2bytKdmlVcjZyU2VJNVZkNS9VMjdPZ2Rua285azBkMG5xSUxa?=
 =?utf-8?B?ZkQrYlhRM1Jtb3BWQzNpcGlRaWRsMXN0cXB6TlNHTnIyNnl6c2gxNHhuQzlG?=
 =?utf-8?B?amQ0U1JiNHg3Zk9nR2NUdHRWZ1J1V3B4aVJVcUpoTWQ1QkJmdTB4UHA1bE1J?=
 =?utf-8?B?UXVRNjhXaUFOUlZqRWkrZkxhdEJmNmRBcHd2Wm4zaFlJTjVSTmxWMENIZG5P?=
 =?utf-8?B?SEFoQnhxdzlRY0syTGdpbU5SY0xVVmU1OXR1TlhGeE5DRGh2aGxOdW8vazNl?=
 =?utf-8?B?ZTNJd0xZdll2MXNnYVFHS2JxMS9XNE92MXlQWXU0c0p2TmFIdjVaNVdPeFJ4?=
 =?utf-8?B?cDVQVTZSQ3ZaSHZpTEVTdmE2bU1GQ1VJYVFPZWdpM2VpSmtqem12bzBtS1pn?=
 =?utf-8?B?aWJNMERMTzlRTVhQelB6dTdHY2xZbFZiVGlEdHZtQkcxZHBnQVVCWnNzM094?=
 =?utf-8?B?TlZudWNOYXhXNlhYemxhSWd3dHBBRHJ3eExJUmQ3Y3hEVUx0QTZqdHdBUGV1?=
 =?utf-8?B?Rk94VnNGUUdma0ZmSmtyeEtWYlBKMWJGVGVUK3luUEg5WlVSaHhjMkZVY21E?=
 =?utf-8?B?VFVxdFVKdGR5NG9WS09PZTlGTVBJTmhLLzJsdUJSQUtydXNkV2tMN3lsWGlF?=
 =?utf-8?B?YTgzR3dTZEltTzVpQ1FYYy9mWm1ibEZ2SmV1VTlWVFhuTGthTGhJNldsei91?=
 =?utf-8?B?cGpLNzlvcDd4VEhyRTRuay81RXZsODZmYUtjSTJGR3pCa1NQOFRXdGdDcU9S?=
 =?utf-8?B?cDM5azZ4M0MzN0ExbmNoZFp6cElSWlk4MVBEVW9ZdjlLVWJ2b2pSU1YwOWx6?=
 =?utf-8?B?c0k3QnpKanI5cmFib2dUMFIrR3BtMG4xNk9Qa3RHWGczL2pLc2lSMkptZlRH?=
 =?utf-8?B?bmdVVzE4RjM4M0MzbjBtb3BQU2ZmZ21SdmM0bWQzRzhiVFRmTDNWVzhqdUoy?=
 =?utf-8?B?NW5PQ1pSSkdKa1llb0dsT1J6aXFTcmpGNlhjcnR5bm1LQkoyWTVpb2xyVG10?=
 =?utf-8?B?M0ZybUtIWmxxK1N6ekY0YWQwMFNXRGk2c0NoY3EvK3IwQmZJV08yT1U5bUt2?=
 =?utf-8?B?YlFpcXNBaTl6TkM5cGJBbzhDRHRLRHhSWkhmM00zc2dvVnVtUE5tNk9ZQW9W?=
 =?utf-8?B?OXlxK2pIVzIyUU1SajhLdDQwUnpzekRXdnRyUzhOZFhkcDZQM2t1MXFpNUVV?=
 =?utf-8?B?SC9KM0lzY2laa2tmQkZjNlJzalZxdjdVTTNCNDl1N0RYUmNpMUlFbzZUeUdr?=
 =?utf-8?B?V0ZYMGFMMThhK0g5TTIzNjFWQzRvNWh3azIxY2llRU1saHd1VmJhcktNRzFB?=
 =?utf-8?B?cGRxdDlUWTNOd3dUSVR2R0VQdGhsd05TbzJzc05DWWVLM0E3SHMrcm0rYnRx?=
 =?utf-8?B?enlNeWVBMEE5SXlMWTNtbDc3QmpKZHJWWEFpdWZyTGp5RiswSGcrL1ZEYzJr?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457c2115-b14c-48b3-eeb2-08dcf7372c6f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 09:59:12.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hfsg2QqbOA4ZcHGNl+Gzo3czxxXSuFaS8ac+ctkF1HUiaHA6IDfeRqv016bBzuIL5IZGgQehEhsdfurCyYuhW8SlGEZS1/es7uWmtjYxog0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_025921_130260_32E32BAB 
X-CRM114-Status: GOOD (  21.23  )
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

CgpPbiAyMDI0LzEwLzI4IDE3OjQ2LCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIDI4LzEwLzIwMjQgMTA6MzYsIFhpYW53ZWkgWmhh
byB3cm90ZToKPj4gSGkgTmVpbCwKPj4gwqDCoMKgIFRoYW5rcyBmb3IgeW91ciBhZHZpY2UuCj4+
Cj4+IE9uIDIwMjQvMTAvMjggMTc6MDksIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6
Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiAyOC8xMC8yMDI0IDEwOjA3LCBYaWFu
d2VpIFpoYW8gd3JvdGU6Cj4+Pj4gSGkgTmVpbCwKPj4+PiDCoMKgwqDCoCBCYXNlZCBvbiB0aGUg
Y3VycmVudCBkaXNjdXNzaW9uIHJlc3VsdHMsIEdQSU8gaW5kZXggbWFjcm8gCj4+Pj4gZGVmaW5p
dGlvbiBkb2VzIG5vdCBiZWxvbmcgdG8gYmluZGluZ3MuIElmIHNvLCB0aGUgcGluY3RybCBkcml2
ZXIgCj4+Pj4ga2VlcHMgdGhlIGV4aXN0aW5nIGFyY2hpdGVjdHVyZSwgYW5kIHVzZSBudW1iZXJz
IGluc3RlYWQgaW4gZHRzIAo+Pj4+IGZpbGUuIE9yIHRoZSBwaW5jdHJsIGRyaXZlciB1c2UgYmFu
ayBtb2RlIGFjZXNzLCB0aGlzIG1heSBub3QgYmUgCj4+Pj4gY29tcGF0aWJsZSB3aXRoIGV4aXN0
aW5nIGZyYW1ld29ya3MuIFRoaXMgaXMgZG9uZSBieSBhZGRpbmcgb2ZfeGxhdGUgCj4+Pj4gaG9v
ayBmdW5jdGlvbnMgaW4gcGluY3RybF9jaGlwIHN0cnVjdC4KPj4+Pgo+Pj4+IFdoYXQgaXMgeW91
ciBhZHZpY2UgdGhhdCBJIGNhbiBpbXBsZW1lbnQgaW4gdGhlIG5leHQgdmVyc2lvbi4gVGhhbmtz
IQo+Pj4KPj4+IEtlZXAgdGhlIGRyaXZlciBhcy1pcywgYnV0IG1vdmUgdGhlIGhlYWRlciBmaWxl
IGludG8gCj4+PiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMgbGlrZSBpdCB3YXMgZG9uZSBm
b3IgdGhlIGxhc3QgcmVzZXQgCj4+PiBjb250cm9sbGVyIHN1cHBvcnQ6Cj4+PiBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1yZXNldC5oCj4+Pgo+Pgo+PiBJIGRvbid0IHNl
ZSBleGFtcGxlcyBDIGZpbGUgYXBwbGllcyBkdHMgaGVhZGVyIGZpbGUuCj4+IEMgZmlsZSBuZWVk
IHRvIGJlIGRlZmluZWQgb25jZSwgYW5kIHRoaXMgbmVlZHMgdG8gYmUgZGVmaW5lZCBhZ2FpbiBp
biAKPj4gZHRzIGhlYWRlciBmaWxlLgo+IAo+IFNvcnJ5IGNvdWxkIHlvdSByZXBocmFzZSwgdGhl
IHNlbnRlbmNlIGlzbid0IGNsZWFyLgo+IAoKSSdtIHNvcnJ5IEkgZGlkbid0IGRlc2NyaWJlIGl0
IGNsZWFybHkuCgpUaGUgcGluIGluZGV4IGRlZmluaXRpb24gaXMgdXNlZCBpbiBkcml2ZXIgQyBm
aWxlIGFuZCBpbiBEVFMgZmlsZXMuCkl0J3Mgbm90IGxpa2UgcmVzZXQgZGVmaW5pdGlvbiBvbmx5
IHVzZWQgaW4gRFRTIGZpbGVzLgpJZiB0aGUgcGluIGRlZmluaXRpb24gaGVhZGVyIGZpbGUgcGxh
Y2UgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljLCBzbyAKdGhlIGRyaXZlciBDIGZpbGUgbmVl
ZHMgdG8gYmUgZGVmaW5lZCBhZ2Fpbi4gSSBkb24ndCBzZWUgZXhhbXBsZXMgb2YgaG93IAphIEMg
ZmlsZSBhcHBsaWVzIGEgRFRTIGhlYWRlciBmaWxlLgoKPiBOZWlsCj4gCj4+Cj4+PiBOZWlsCj4+
Pgo+Pj4+Cj4+Pj4gT24gMjAyNC8xMC8yMSAyMzoyNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4+Cj4+Pj4+IE9uIDIxLzEwLzIwMjQgMTI6
MzgsIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4+Pj4+Pj4+ID09PT0+PD09PT09
PT09PT09PT09PT09Cj4+Pj4+Pj4+ICsvKiBTdGFuZGFyZCBwb3J0ICovCj4+Pj4+Pj4+ICsjZGVm
aW5lIEdQSU9CX1NUQVJUwqDCoMKgwqDCoMKgwqAgMAo+Pj4+Pj4+PiArI2RlZmluZSBHUElPQl9O
VU3CoCAxNAo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9EX1NUQVJUwqDCoMKgwqDC
oMKgwqAgKEdQSU9CX1NUQVJUICsgR1BJT0JfTlVNKQo+Pj4+Pj4+PiArI2RlZmluZSBHUElPRF9O
VU3CoCAxNgo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9FX1NUQVJUwqDCoMKgwqDC
oMKgwqAgKEdQSU9EX1NUQVJUICsgR1BJT0RfTlVNKQo+Pj4+Pj4+PiArI2RlZmluZSBHUElPRV9O
VU3CoCAyCj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKyNkZWZpbmUgR1BJT1RfU1RBUlTCoMKgwqDCoMKg
wqDCoCAoR1BJT0VfU1RBUlQgKyBHUElPRV9OVU0pCj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9UX05V
TcKgIDIzCj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKyNkZWZpbmUgR1BJT1hfU1RBUlTCoMKgwqDCoMKg
wqDCoCAoR1BJT1RfU1RBUlQgKyBHUElPVF9OVU0pCj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9YX05V
TcKgIDE4Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKyNkZWZpbmUgUEVSSVBIU19QSU5fTlVNwqDCoMKg
IChHUElPWF9TVEFSVCArIEdQSU9YX05VTSkKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArLyogQW9idXMg
cG9ydCAqLwo+Pj4+Pj4+PiArI2RlZmluZSBHUElPQU9fU1RBUlTCoMKgwqDCoMKgwqAgMAo+Pj4+
Pj4+PiArI2RlZmluZSBHUElPQU9fTlVNIDcKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArLyogSXQncyBh
IHNwZWNpYWwgZGVmaW5pdGlvbiwgcHV0IGF0IHRoZSBlbmQsIGp1c3QgMSBudW0gKi8KPj4+Pj4+
Pj4gKyNkZWZpbmXCoMKgwqAgR1BJT19URVNUX07CoMKgwqDCoCAoR1BJT0FPX1NUQVJUICvCoCBH
UElPQU9fTlVNKQo+Pj4+Pj4+PiArI2RlZmluZcKgwqDCoCBBT0JVU19QSU5fTlVNwqDCoCAoR1BJ
T19URVNUX04gKyAxKQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsjZGVmaW5lIEFNTE9HSUNfR1BJTyhw
b3J0LCBvZmZzZXQpIChwb3J0IyNfU1RBUlQgKyAob2Zmc2V0KSkKPj4+Pj4+Pj4gPT09PT48PT09
PT09PT09PT09PT09PT0KPj4+Pj4+Pj4KPj4+Pj4+Pj4gaXMgZXhhY3RseSB3aGF0IHJvYiBhc2tl
ZCBmb3IsIGFuZCB5b3UgbmFja2VkIGl0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gTm8sIHRoaXMgaXMgbm90
IHdoYXQgd2FzIGFza2VkLCBhdCBsZWFzdCBhY2NvcmRpbmcgdG8gbXkgCj4+Pj4+Pj4gdW5kZXJz
dGFuZGluZy4KPj4+Pj4+PiBOdW1iZXIgb2YgR1BJT3MgaXMgbm90IGFuIEFCSS4gTmVpdGhlciBp
cyB0aGVpciByZWxhdGlvbnNoaXAsIAo+Pj4+Pj4+IHdoZXJlIG9uZQo+Pj4+Pj4+IHN0YXJ0cyBh
bmQgb3RoZXIgZW5kcy4KPj4+Pj4+Cj4+Pj4+PiBJIGNvbmZpcm0gdGhpcyBuZWVkIHNvbWUgd29y
aywgYnV0IGl0IG1vdmVkIHRoZSBwZXItcGluIGRlZmluZSB0byAKPj4+Pj4+IHN0YXJ0Cj4+Pj4+
PiBhbmQgcmFuZ2VzLCBzbyB3aGF0IGRpZCByb2IgZXhwZWN0ID8KPj4+Pj4+Cj4+Pj4+Pj4KPj4+
Pj4+PiBNYXliZSBJIG1pc3NlZCBzb21ldGhpbmcsIGJ1dCBJIGNvdWxkIG5vdCBmaW5kIGFueSB1
c2VycyBvZiB0aGVzZSAKPj4+Pj4+PiBpbiB0aGUKPj4+Pj4+PiBEVFMuIExvb2s6Cj4+Pj4+Pj4K
Pj4+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDEwMTQtYTRfcGluY3RybC12
Mi0zLTNlNzRhNjVjMjg1ZUBhbWxvZ2ljLmNvbS8KPj4+Pj4+Cj4+Pj4+PiBTbyB5b3Ugd2FudCBj
b25zdW1lcnMgYmVmb3JlIHRoZSBiaW5kaW5ncyA/IHN0cmFuZ2UgYXJndW1lbnQKPj4+Pj4+Cj4+
Pj4+Pj4KPj4+Pj4+PiBXaGVyZSBpcyBhbnkgb2YgYWJvdmUgZGVmaW5lcz8KPj4+Pj4+Pgo+Pj4+
Pj4+IE1heWJlIHRoZXkgd2lsbCBiZSB2aXNpYmxlIGluIHRoZSBjb25zdW1lciBjb2RlLCBidXQg
SSBkaWQgbm90IAo+Pj4+Pj4+IGltYWdpbmUKPj4+Pj4+PiBzdWNoIHVzZS4gWW91IGV4cGVjdDoK
Pj4+Pj4+PiByZXNldC1ncGlvcyA9IDwmY3RybCBHUElPQU9fU1RBUlQgMT4/Pz8KPj4+Pj4+Cj4+
Pj4+PiBObyBJIGV4cGVjdDoKPj4+Pj4+IHJlc2V0LWdwaW9zID0gPCZjdHJsIEFNTE9HSUNfR1BJ
TyhCLCAwKSAxPjsKPj4+Pj4+Cj4+Pj4+PiBidXQgdGhlIG1hY3JvIHNob3VsZCBnbyBhbG9uZyB0
aGUgZHRzIGxpa2Ugd2UgZGlkIGZvciB0aGUgcmVzZXQgCj4+Pj4+PiBkZWZpbmVzLAo+Pj4+Pj4g
c28gcGVyaGFwcyB0aGlzIGlzIHRoZSBzb2x1dGlvbiA/Cj4+Pj4+Cj4+Pj4+IE9LLCBzbyBJIHNh
aWQgaXQgd2FzIG5vdCBhIGJpbmRpbmc6Cj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC91NGFmeHFjM2x1ZHNpYzRuM2hzM3IzZHJnM2Z0bXNiY3dmamx0aWMybWI2NmZvbzQ3eEB4ZTU3
Z2x0bDc3aHEvCj4+Pj4+Cj4+Pj4+IGFuZCB5b3UgaGVyZSBjb25maXJtLCBpZiBJIHVuZGVyc3Rv
b2QgeW91IGNvcnJlY3RseSwgdGhhdCBpdCBnb2VzIHdpdGgKPj4+Pj4gdGhlIERUUyBsaWtlIHJl
c2V0IGRlZmluZXMgKEkgYXNzdW1lIG5vbi1JRCBsaWtlIGRlZmluZXM/KSwgc28gYWxzbyAKPj4+
Pj4gbm90Cj4+Pj4+IGEgYmluZGluZz8KPj4+Pj4KPj4+Pj4gV2hhdCBhcmUgd2UgZGlzYWdyZWVp
bmcgd2l0aD8KPj4+Pj4KPj4+Pj4gSnVzdCB0byByZWNhbGwsIEplcm9tZSBhc2tlZCB3aGV0aGVy
IHlvdSBoYXZlIHRvIG5vdyB1c2UgYXJiaXRyYXJ5Cj4+Pj4+IG51bWJlcnMgaW4gRFRTIGFuZCBt
eSBhbnN3ZXIgd2FzOiBub3QuIEl0J3Mgc3RpbGwgdGhlIHNhbWUgYW5zd2VyLgo+Pj4+Pgo+Pj4+
PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+IEtyenlzenRvZgo+Pj4+Pgo+Pj4KPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
