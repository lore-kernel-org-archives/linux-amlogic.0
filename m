Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1153C83F1B
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jul 2025 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4a8WVpFBcfR1PzBTff15H9CDagfzLhiYZwfn5X3qQ78=; b=UMVQJzXZfUkQDJ/DUaV1nzx6YQ
	BGGU/gojyzPFr1lFBRZLAJSSLqrzbe9xyO/RQYtLsY3el9LGVA7y6CyKKBRvd5o2VWEiAIdSzTFfg
	FJMcoLEPrPi3nQSGmmYquTFR2aWpqOQTt9iOT2L4UGhsNmBvfc6L/NX0WTHiwzGWAEcy4nJ+XOjQb
	aAzufPgSeuwhZ6af1qqPxl11eSFykC5xhhi0WP7bq+shA7rsw0QCqBgDWn4tkIp8Xe0bIghQ/AuLD
	tDKMLLjHnZbUkCgAa+NhY/5WeghL2vJw9bI0UaxCZ9/GnChYSsLG++CjgIIZQa3Y0fbzzo59B0Exa
	Yj8ZdfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyT8-00000007HqG-12YC;
	Wed, 16 Jul 2025 09:30:30 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyT5-00000007Hp2-3BCE
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Jul 2025 09:30:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2FDn4SXSkd8vFzc/1/CNaxvddoS4gFRFG63Gq8HZMsNuh39jASD0rtHgNEEZcYKSJLPBo8su/fltO6qtIxVANpq4j+M/BZIPYVhbMkCCGhSM0LkN/sWM5+lpbonJw2ielYGPwXQJxEPwTKbo7teBdedY/VYxKc29SaaGikhOiBqUVoXCbqnl2Ykii4pL6QG82sHRIptBwSe7g5HJHvSzG3akHI8EDoa2kAloZD59dUXmwDcBIo8FOTmsgKLR4EkSjvnUHFX9whtCPjFjA7mbvL32YY0hqNS70VGmdhEUwwKpY2fxqUpi0Al2761tkv6DzF/oRY6MULv7Xf7yPva7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNCDTft8bQAwUo3qH18mNzUWbvqFz6/F1CCJbr+mi88=;
 b=rCOsd5sSwedCnMquNKNRp1JiQ1Yz0pOvCOOxWF3eyPpgKeBGN8gjivMTGkLEjBjlwFWBZsqO4C4JphBk6H8YG9L7c2rCAcTuwQqrb4snuG5Coyk7mUE8FOrWKBmvdZMS2xcJoJC1xtbTclIjiBl+fDRS/tZjVgvHdf9g6bm8NooeOQC36fvTldbcTMgOU51BRnaU2VHEvMdDLnb+0kv3xOLqKbQEnmMgZ2zztUNUYLIlK+355aNrhbSKBdpnxDseVM9kI4AQauk0HZW/P4IAQ5O50xsWwsU+pEIUIbPYFOq7B0IkyZsceUo5JUWiWZVrNhYimjTsJc7qACmkHLw9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNCDTft8bQAwUo3qH18mNzUWbvqFz6/F1CCJbr+mi88=;
 b=MHmjc55FJuEH6/q74SxOc0y3LwBoLtmCYytAQa3+TnpAI1Iq4RwbXMTECtcnJzbWcXzs1TAKV4C8Al4k3ENuYYSVBbB2MCjK5NmzjTseonjhpEGfl7OyhJLqsdzYqByUH/QynhMsUsDTh+XAP3bdmTNLSSOUGM5FGHfKJmSOaNicyJR3Yvnj3pFeDoHIq7xS9T6RajWUJoSnTgB6P/fPzRShJbcZtLxNt3jb3JihenqcGsfz8LBe9mOAg4cmF5W6qZSqxGO322rtClNmSKNHroYlY50fMOgh1+bKdRg1hqf+ZnXENCQy6O42ypAYy8TsLlk8A1ouw7HKjIPajyWADw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY1PPF5E6276BA7.apcprd03.prod.outlook.com (2603:1096:408::a59) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 09:30:09 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%2]) with mapi id 15.20.8901.024; Wed, 16 Jul 2025
 09:30:09 +0000
Message-ID: <b42995ed-d1d5-4624-88ab-4ba1b6f54ebe@amlogic.com>
Date: Wed, 16 Jul 2025 17:30:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] spi: Add Amlogic SPISG driver
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sunny Luo <sunny.luo@amlogic.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com>
 <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
 <3ac88119-9980-42df-9e1c-c0ec30bbaadd@sirena.org.uk>
 <55ecc836-7fed-44d5-aa4b-94bc17894ef0@amlogic.com>
 <aG0hU5nbjLjTWS6p@finisterre.sirena.org.uk>
 <03b7abe4-95d5-44f4-96ec-989c736e58b0@amlogic.com>
Content-Language: en-US
In-Reply-To: <03b7abe4-95d5-44f4-96ec-989c736e58b0@amlogic.com>
X-ClientProxiedBy: SG3P274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::16)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY1PPF5E6276BA7:EE_
X-MS-Office365-Filtering-Correlation-Id: 41784350-d9f9-4759-9c2c-08ddc44b5b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1EyL2htTkRhR0J6RmpSN0ljdUQrRDJwOVFzVnVBMFpMQkpNNDVqZzJHZWFK?=
 =?utf-8?B?a25RdTByTTlBS05iWFZES2paRHJlRjNEdnlzVWtNemRObm1Ybko3aUIwZzE2?=
 =?utf-8?B?NkhBMW1zR2IzbTdNYnJ6YmRKNklEVWJkb0pjUHNVV2J1V1ZCTStIdUcwOGFh?=
 =?utf-8?B?eXg4SnR1YzMyYkJvOFozQnQzWDdCRFg2U3dmYTBXN2FmSFhjYTN3TXBHK3o2?=
 =?utf-8?B?QnFYL3BOUXJpeHFQV0hZcWFQNi85a2o4bGhRdzgyaFRZK1lVazhod21nczln?=
 =?utf-8?B?ZkxUbjAyR0p3eFZIVnpuVmhXcjlJYlFRc29zZTlNb0pmS21yd0dCV09TNlUx?=
 =?utf-8?B?d3d1N04wcjJiUHJRT3UzREdod0hIaFgxclVzM1BIU2RDS0JOWGhCZjlzaUFP?=
 =?utf-8?B?dFU2T2pLMUNldGw2NE5MNWhtZVVJMjFzNGxNLy8za045T2laYVdKZFZMYTRp?=
 =?utf-8?B?MlJSNDNXdUF6MTNzY0cyMmJ5LzhiL0ljNTFGZVI0T1B5eHhvV0FPbkR1bGFq?=
 =?utf-8?B?V1NBK3B4Y1J3NFNYNnYzQ1FLOUwyeGZtdDEzTVVGY1lFZU9tT0ZKQmI2cDZn?=
 =?utf-8?B?QWo5c0JTOUhKc3I3WGMzWmh4SFF2cWd2L1N2TkdmOFZMaGtmQlBhUTFybGdZ?=
 =?utf-8?B?RmF3U0RvVUxnSlhxRXRabmN2VitXdTJZSmMrbjh2S3lheFN4c08yOW9nVlZO?=
 =?utf-8?B?ajNETDNSVnp2U2tSdEVDTlVFVkdUdGZEdE5TTHlRVU5sMWRoN2ZGVE9zcnhP?=
 =?utf-8?B?QzR1MjExUU9DUDZaZWY2Wnh3a01GbzlSMjJleC9nNlJJSzM3NUx3S2ZMY1oz?=
 =?utf-8?B?YmMzN0Ixa0lIcWtSRGRhSFRiTWRiOUx4TDQrcjhBNldudW4wazhsaDBQTGZU?=
 =?utf-8?B?ZGJtNHdIekNSejdEK2J6SjBTT0xuVlV2V0hnTW5aVmhYNW12MWo4cmYyeG1h?=
 =?utf-8?B?MDNLMDJXN0lqcnFyKytqaytoVHA0NUh2bkpzUzUwQXVIOEpGTlk3cFdxb0s2?=
 =?utf-8?B?K3RtbjFISlhWYkR1YlhaWVQrZnVHZkVCZkQwUzlSa280cDNIQVkvbEdvaDh0?=
 =?utf-8?B?M3MwaXRTOEpFZXh4aFhOZkp4NmNkNkUvaFpYMmx0VGkwbllYRkZCL3JrOHlN?=
 =?utf-8?B?UCtpN0h5UnNSMHgzU0UwWnhuSmtFYXhvZFJwYmJXWDlUWllGVmRnc2xPdHoy?=
 =?utf-8?B?MzVFVUE4aXo1MlZuN2VOUE1ONVQrUy8wOVN3RFJBVjE2dHlocHZnUzkxVDJ3?=
 =?utf-8?B?Znh5MnVtT0JlK3lkYVhqWDhzYWFnd1VwR0FwT2dBekw2OTJIZCtPdUZpTkZY?=
 =?utf-8?B?akJ3bUtqMmJTeFVXVmhYbS83VWJHSU9CSWhCRWtVNk5zaWFNVTJCbFgyblpF?=
 =?utf-8?B?Sk1vMzNyYmsyMlo3aGtmU3FQTWZhY2pjZ1pwVTNpY3lpN0xYVDJUcEltRVN5?=
 =?utf-8?B?NE5hejFCQStLQXpUVzJCc1hBZitIckx1Z21zVFdta1o2Q3BJSnNseStKb0Jr?=
 =?utf-8?B?QnJYV2QvQXhoRGM0WjNWZ2RuWTZyUG1IcWZoeEg5Q3FCU0ZiTUY1dEFrYjlN?=
 =?utf-8?B?UXhxbDFBWUlURXp4MjU2eCtrNVltMzZ0Y0ZsVzEzbUVIcEFnRm4yczFGVkFu?=
 =?utf-8?B?UEFac2ZyMVE5YWVWc1hBMzRhK3NQMnBGcVNGRFNHV0N2RWV4aFpFdVZINENr?=
 =?utf-8?B?cGVaTWhadXlrNGRybkxWTldhU2RFVXhzUnVMWU5XMTVnRTJKUmdYMFpKbnF3?=
 =?utf-8?B?WXBzQTVJc2lLWm11cWZPTVpUWGhhQmJyV1dUeTM4MGl4RGZoT0M0aVcvclQ5?=
 =?utf-8?B?NnZ6cHRTTUQ4MVF1ZzRxMHZtNi9IeHozaEZtMGNMeTI5Vm1rc3BSbERScDBJ?=
 =?utf-8?B?V0pjbEhsOEU5S0d4dzdKaXE3b3poNnNxa3F4bEVUVUQvSmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDhQSzI5VWpzNGljUWROVFBPNTRsdTlwTDBLenRDTlNGQVJ0NnQzK0FpUzRt?=
 =?utf-8?B?SW9kNWJpYU0zRDUyZ1hGc1ZGZklSSThXM0lCNWk5NmhkRitFSzdqNDBTWXdQ?=
 =?utf-8?B?MTV1bnBYT2pFSzI5MStYcndZY1c1STZnR2xkUm1CRHlyeVEwRHlQVU9DNFQ4?=
 =?utf-8?B?a3FzYnBwWHNJWUlmbm50di80bmR5QmVEaUkzVlh5UGpjeFlyL3hGZmYza0la?=
 =?utf-8?B?dXh6cG94eUg4QnlPL0ZZdWJFT3lDb0g3UGZiV2x0YzJYcXBsTVlhcm8yZU9B?=
 =?utf-8?B?cktkcU1UWkljSEtseDJWekJUbHhWazk2MGU1VVJwMkhSNUhKbDM4b2o5STc3?=
 =?utf-8?B?dVZ0QmRtTVl5MjlaZ0M2akVzQ042WFlGZDA0M09ZTG5QcGNCQ3RHTGVZMnhX?=
 =?utf-8?B?enVHeEt5WnpQM1hwaVpvd0g4eTl6Rmd4djgraTFQbkZlKzM3djA0Y2xVZGhw?=
 =?utf-8?B?WTRRMVVuZmh4U3I5T2xwbDRWRW95dW8rYTVrMHJHN3pwbjl5eXVzVk13WFZh?=
 =?utf-8?B?dkhHOUpEMHRSTVp0MWtaMFZLQ0hlTzN0VDVGOEFhc1pjbHZsSlBKd2wzSk5k?=
 =?utf-8?B?RHJXcWdlaDF6RGlyMlJhZCtrU3VPREpvSUYySnZ0SlVEL2JSbWlnaXVMcVQ0?=
 =?utf-8?B?MWR5cllvelZkanRaMmZVMjk5bmFlSlJrYzRVZEJuMW5tc1BlTUsrcWZEUXpm?=
 =?utf-8?B?KzBnV1RWWnZYU1Y0UmFyQXQyWFRkaytnN1BNRHRQMTBwMzM0T3djeXoyeFNW?=
 =?utf-8?B?Vm1JbnVFQ0oyMmRkZnpITUdVelhHcG54ZEsrQjhOSWd0N0RJL1VDSTVXd3dM?=
 =?utf-8?B?MmhMZDZPWmxmUlY0SjZ6MTloSWNSYVd6SFdBL3dBYjY1UUVGSlRlZU1FTE5G?=
 =?utf-8?B?enc4VDJFWHVJbnFCRzE2ZHl0LzAwS3c4Q2d2L2RwKzQ0aWUrK1VPVklEdVRx?=
 =?utf-8?B?THB0ZXdScG9KeVhmNklMRVZINm1yTjE5bEFUOUc2V1N4bzdPVjRSUk1OMUpT?=
 =?utf-8?B?WmhvL3Vnbk16TkZ2S21oUGYzK3JsSHVEMFRIU2l0MkZoRFREMFIrenlwb2d6?=
 =?utf-8?B?REtLd2ljQXQ0T1poc0NkOWIzM2xpaFlpUlhHRkdvRUp0L1ZFdWp2YWE1TzEz?=
 =?utf-8?B?bFZNQURrRG9jNk5jMVVpbmdYN1VoUEpUWGRaTmpSdFdUMWdjckJsbVEwVWQz?=
 =?utf-8?B?RUtabjJJbDhkKyt3KzJuT0R2aitVYTBWWklNY0Yxd1M0VVB4WEhweGNzVTBW?=
 =?utf-8?B?TlRMdko0RDkyVnNqSURTK3h3V0JnTUZqYnh6Q0JQLyt3L085NGJicmdneVRJ?=
 =?utf-8?B?aDFoM051eXVPN09IS1NiT0NxYURaU3g2RHNWYm1PcDlSNncvTkVuU0NHdTJ6?=
 =?utf-8?B?eWN6Tk1ORHR3aE9RN05rU05kYm5rR29Vb2s0dk5nZVh4OGtmRllaazVsakJt?=
 =?utf-8?B?VHdLV1FiNHNRb0tuanFXQTNJRGRwUmtNc09SdWE4SktEbndBSGtRNXNVc0gx?=
 =?utf-8?B?b2hjandQYi80WnA4S0RBZkZUQjJPK1diOVoya1B1bTBjYkw1TDJIckd6QUxW?=
 =?utf-8?B?amorZm10RXdVOGl3QVZxUzEyWHlkcDZTbXZCZmJCOXZwSUl5V0lHZUtVVmJL?=
 =?utf-8?B?bVVGTXlpdTFwVkJsRnplY1R0cHh6UmQxbU9DNjgzUVRMb2Qvai9yOGoyRWEx?=
 =?utf-8?B?eGFrMUdVWTgxNEpReFFXZUoyMDlBTmdEWVFQb2RCTGNkdUVHNllpTnBObVYz?=
 =?utf-8?B?cUxRbmVKd0VRSU4vWDhhOFlMNWh4Z0RQa252OGNDajZSTzBoWWxlcGk4eEkv?=
 =?utf-8?B?M3Uzd0lOU3M5eGxyYzNlM0puK0w0bGdsV01ST1RoeDJWYlRUZzV4VzhYcTlL?=
 =?utf-8?B?MmNVQjN5STY2dGh5NVl6ZVFUSS9TMkFjYTMvS0R5Y1JOUVRlVGF4V0d1SGkr?=
 =?utf-8?B?Y0lyaVM5S1RBWmdPYTBwY243ak9pbXlDUDFoSFMwbHB2czAza3RrZ1NjYTlp?=
 =?utf-8?B?ckNkMUVUUzdyeDFVSXhmb3BXczd5RnF1UkU3ZEh6R1RyTWRTWlBISGNYWU12?=
 =?utf-8?B?eTdZY25NV3ViSDk3T0RmV001Q01HNU13dlQyakEzMzFQNU1qVDRJa1o1VzBC?=
 =?utf-8?B?RTNVMkVRNk1zb3B0eUx5bS9na3hWZWxGQ0IwdXpIS0Y1dklGTUt1TjQ3OWEv?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41784350-d9f9-4759-9c2c-08ddc44b5b6f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 09:30:09.4942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arYxQe9QLy203fVDUWooabM7YK13KpPW9IV4DfFLXkRUTr4aDwUL0yUThj9auJjkPcS7LO6n4xh/v9N+Q5OKaaCvQXC+YyenfX4J0pse/Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF5E6276BA7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_023027_797399_5E18A1DF 
X-CRM114-Status: GOOD (  19.41  )
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

SGkgTWFyaywKCk9uIDIwMjUvNy85IDE1OjAyLCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4gSGkgTWFy
aywKPiAgwqDCoCBUaGFua3MgZm9yIHlvdXIgYWR2aWNlLgo+IAo+IE9uIDIwMjUvNy84IDIxOjUw
LCBNYXJrIEJyb3duIHdyb3RlOgo+PiBTdWJqZWN0Ogo+PiBSZTogW1BBVENIIHY0IDIvM10gc3Bp
OiBBZGQgQW1sb2dpYyBTUElTRyBkcml2ZXIKPj4gRnJvbToKPj4gTWFyayBCcm93biA8YnJvb25p
ZUBrZXJuZWwub3JnPgo+PiBEYXRlOgo+PiAyMDI1LzcvOCAyMTo1MAo+Pgo+PiBUbzoKPj4gWGlh
bndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+IENDOgo+PiBTdW5ueSBMdW8g
PHN1bm55Lmx1b0BhbWxvZ2ljLmNvbT4sIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+LCAK
Pj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPiwgQ29ub3IgRG9vbGV5
IAo+PiA8Y29ub3IrZHRAa2VybmVsLm9yZz4sIGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZywgCj4+IGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmcsIGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnLCAKPj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+Pgo+Pgo+Pgo+PiBPbiBU
dWUsIEp1bCAwOCwgMjAyNSBhdCAwNjozNDowMlBNICswODAwLCBYaWFud2VpIFpoYW8gd3JvdGU6
Cj4+PiBPbiAyMDI1LzcvNyAyMTowNSwgTWFyayBCcm93biB3cm90ZToKPj4+PiBJcyBpdCB3b3J0
aCBoYXZpbmcgYSBjb3B5YnJlYWsgc3VjaCB0aGF0IHNtYWxsZXIgdHJhbnNmZXJzIGFyZSBkb25l
Cj4+Pj4gdXNpbmcgUElPP8KgIFdpdGggYSBsb3Qgb2YgY29udHJvbGxlcnMgdGhhdCBpbmNyZWFz
ZXMgcGVyZm9ybWFuY2UgZHVlIHRvCj4+Pj4gdGhlIGV4dHJhIG92ZXJoZWFkIG9mIHNldHRpbmcg
dXAgRE1BLCB0YWxraW5nIHRvIHRoZSBETUEgYW5kIGludGVycnVwdAo+Pj4+IGNvbnRyb2xsZXJz
IGNhbiBiZSBhcyBleHBlbnNpdmUgYXMgZGlyZWN0bHkgYWNjZXNzaW5nIHRoZSBGSUZPcy4KPj4+
IElmIHRoZSBkYXRhIHZvbHVtZSBvZiBhIHNpbmdsZSB0cmFuc2ZlciAoeGZlcikgaXMgc21hbGws
IFBJTyBtb2RlIAo+Pj4gZG9lcyBvZmZlcgo+Pj4gc29tZSBhZHZhbnRhZ2VzLiBIb3dldmVyLCBz
aW5jZSBQSU8gcmVxdWlyZXMgdGhlIENQVSB0byB3YWl0IGluIGEgCj4+PiBidXN5IGxvb3AKPj4+
IGZvciB0aGUgdHJhbnNmZXIgdG8gY29tcGxldGUsIGl0IGNvbnRpbnVvdXNseSBvY2N1cGllcyBD
UFUgcmVzb3VyY2VzLiAKPj4+IEFzIGEKPj4+IHJlc3VsdCwgaXRzIGFkdmFudGFnZXMgYXJlIG5v
dCBwYXJ0aWN1bGFybHkgc2lnbmlmaWNhbnQuCj4+IFRoZSBDUFUgb3ZlcmhlYWQgdGVuZHMgdG8g
YmUgaGlnaGVyICh5b3UgY2FuIGF2b2lkIHNvbWUgb2YgaXQgd2l0aCBhCj4+IGRlYWQgcmVja29u
aW5nIHNsZWVwKSwgYnV0IHRoZSBsYXRlbmN5IHZhc3RseSBpbXByb3ZlZCB3aGljaCBmb3IgbWFu
eQo+PiBhcHBsaWNhdGlvbnMgaXMgYSB3b3J0aHdoaWxlIGFkdmFudGFnZS7CoCBJdCB0ZW5kcyB0
byBiZSB0aGluZ3MgbGlrZQo+PiBhY2Nlc3NlcyB0byBvbmUgb3IgdHdvIHJlZ2lzdGVycyBvbiBh
IGRldmljZSB3aXRoIHJlZ2lzdGVycyB3aGVyZSB0aGlzCj4+IHdpbnMsIDE2IGJ5dGVzIG9yIGxv
d2VyIHdvdWxkIGJlIGEgY29tbW9uIG51bWJlciBvZmYgdGhlIHRvcCBvZiBteSBoZWFkLgo+Pgo+
Pj4gSWYgUElPIGlzIHRvIGJlIGltcGxlbWVudGVkLCBpdCBjYW4gb25seSBoYW5kbGUgb25lIHRy
YW5zZmVyIGF0IGEgCj4+PiB0aW1lICh2aWEKPj4+IHRyYW5zZmVyX29uZSksIGFuZCBub3QgZW50
aXJlIG1lc3NhZ2VzICh3aGljaCBjb25zaXN0IG9mIG11bHRpcGxlCj4+PiB0cmFuc2ZlcnMpLiBJ
biBjb250cmFzdCwgd2hlbiBwcm9jZXNzaW5nIG1lc3NhZ2VzLCB0aGUgU1BJIGNvbnRyb2xsZXIg
Cj4+PiBjYW4KPj4+IGhhbmRsZSB0aGUgZW50aXJlIHNlcXVlbmNlIGluIG9uZSBnbywgd2hpY2gg
YWxzbyBwcm92aWRlcyBjZXJ0YWluIAo+Pj4gYmVuZWZpdHMuCj4+IEl0J3MgcHJvYmFibHkgd29y
dGggYWRkaW5nIHNvbWV0aGluZyB0byB0aGUgZnJhbWV3b3JrIHRvIGJlIGFibGUgdG8gdGFrZQo+
PiBhIGRlY2lzaW9uIGF0IHRoZSBtZXNzYWdlIGxldmVsLCBmb3Igd3JpdGVzIHRoaXMgdGVuZHMg
dG8gYWxsIGZhbGwgb3V0Cj4+IG5hdHVyYWxseSBzaW5jZSB0aGUgd3JpdGUgd2lsbCB0ZW5kIHRv
IGJlIGEgc2luZ2xlIHRyYW5zZmVyIGFueXdheS4KPiAKPiBJIHdpbGwgdHJ5IHRvIGFkZCBuZXcg
QVBJIG1lc3NhZ2VfY2FuX2RtYSBmb3IgZnJhbWV3b3JrLCBhbmQgaW1wbGVtZW50IAo+IFBJTyBm
b3IgbWVzc2FnZS4KPiAKCkkgdHJpZWQgdG8gaW1wbGVtZW50IFBJTyBtb2RlIGluIHRoZSBkcml2
ZXIsIGJ1dCBpdCB0dXJuZWQgb3V0IHRvIGJlIHRvbyAKc2xvdy4gRHVlIHRvIHRoZSBsYWNrIG9m
IGFuIGludGVybmFsIEZJRk8sIGRhdGEgY291bGQgb25seSBiZSAKdHJhbnNtaXR0ZWQgb25lIHdv
cmQgYXQgYSB0aW1lLCBhbmQgZWFjaCB0cmFuc21pc3Npb24gcmVxdWlyZWQgCnJlY29uZmlndXJp
bmcgdGhlIGNvcnJlc3BvbmRpbmcgcmVnaXN0ZXJzLiBBcyBhIHJlc3VsdCwgdGhlIGVmZmljaWVu
Y3kgCndhcyBxdWl0ZSBsb3cuCgpUaGUgb25seSBzaW1wbGlmaWNhdGlvbnMgcHJvdmlkZWQgYnkg
UElPIG1vZGUgd2VyZSBpbiB0d28gYXJlYXM6CgoxLiBUaGUgYWxsb2NhdGlvbiBhbmQgcmVsZWFz
ZSBvZiB0aGUgdHJhbnNmZXIgZGVzY3JpcHRvcgoyLiBUaGUgRE1BIG1hcHBpbmcgYW5kIHVubWFw
cGluZyBwcm9jZXNzCgpUaGVyZWZvcmUsIEkgc3VnZ2VzdCBub3QgaW1wbGVtZW50aW5nIFBJTyBt
b2RlIGluIHRoaXMgZHJpdmVyLiBJIHdpbGwgCmRvY3VtZW50IGNsZWFybHkgaW4gdGhlIGNvZGUg
dGhhdCBQSU8gbW9kZSBpcyBub3Qgc3VwcG9ydGVkIGFuZCBleHBsYWluIAp0aGUgcmVhc29ucyBi
ZWhpbmQgdGhpcyBkZWNpc2lvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
