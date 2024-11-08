Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8041DD5E140
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Nov 2024 06:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHZktwinDlR85N5UMUO+qEyZWR80IE2xCFSooow3YaU=; b=PuVoFTcNKHn57TkNimuKMtn8g1
	LdVen2FYxOksd2aMGMd8RaY/S7bXz8ozwzyOM46+foK5lLgqm6XJfSYQF0+4ToU6B4w1AiH2eoaev
	Ef0IyHsqc9dM0k3m4ioe5N+N6j5d5S5jQfDqhFi8pkfQ1IQsDDYrGiapVwdbD7MIChR/SbQCw88KF
	KtPhIhhONKNvddewEK45wFcetQrKHoIwMKfDYckVHMcuXqZDOFXzWOBvnBvkoNp58Y7ROjIb6MA01
	nDTb4OEW4+iwoQH7bDGxH5UGNi9zf8P2OQOLxFzizZBNX0faeEsyqhLP4NPWyI7X90H/AbWR1xRr/
	ybFPMq8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9IMM-00000009TtS-3R0M;
	Fri, 08 Nov 2024 06:20:42 +0000
Received: from mail-sg2apc01on20730.outbound.protection.outlook.com ([2a01:111:f403:200f::730] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9IKa-00000009TiN-30Z2;
	Fri, 08 Nov 2024 06:18:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqp7NefFiV4rTDBhAtuvudCwqCpu09RrpbYObm+UXhnUNOVRBi7SrrOwdUV+B79/rDjxo8LhDd75yGdbN/1fEAWXG7G6q8jxJc8zg7SF3dPi3FpM69/kgKuk1jJOekw2RBH97stIYJ9Dmunp3NvIniqh6eUz7dkbDZHQpNA5PIJmspVkAdgnNAa/EEn1sLp7InCRx1v7c7hYKCueRk5w0CQp5wiiF2M78LmoWuUEWz4G8b5JeYxv5wfUYYY9HMxRjIoasmi+YnaLckHnrxLF34KbcFtsDYCGZBMul+tQ9UxhZBHZD4BcicRflVRJV3a3TNEWEo1dUgASWkIgCi759A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQpv0T2SEpAqkIE4AhF2AVC4LDtXueXYpPFptIoFlh4=;
 b=tvcpHK+numX7TnjegWz0nviUd3DlIuDbfLqwK5KTnK8w2CF96FA6ZS693YFcZ45/mVZT+NTTqG6cBpCEFpWdov2VXwrbranlYO1kfJTrqRL9L5lwNd7C4EjTRicWwGGZ7Gfz0rzqiomKRPPK2toHYJeu2HcYuiy265WCmNorToiIp57J4oVUZSTZREdClU7kb088CImq6KgxKyWMU4c0RVRv4Ho7D3+ErlT2E9lXe1ubMydDrpU8BtzozllDQ3QpU1VRTt+TkgmDm5Rr4MmzlPnDuZRvezDc2HkuccFdzQTrvTe34UXGBheKqEBZnes2K0nFINMCd9q+qIN1LUvzKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQpv0T2SEpAqkIE4AhF2AVC4LDtXueXYpPFptIoFlh4=;
 b=XfGB/g5n7t3D2GbHNIX4oIvsroEe2flGpH8DD+iwJkJY6ausvMOfXp4DJRtEvV6+jtJJPEHT+VyyyAtVDhH/P8hJqHIc4wB0yrWr3K/lG02GqZQ7Gd5d+rkW7L6WUSzEmxdf5MfbfkWmqi3nUuB0e4r3Wq0HK3U7PgmtWOm+Oaum3l+jKBuar7pBgRw/dSWRHGXALYOgf+LiYqltjeEwQm8CbANQpGKHyJQ4uNCLmY71rR1nWjKaFGraQ7oEcuw0HZpU79YHPWQjKCknxQ7MK44t5VJaJeRdEhrp+J0ypMEtUyZinP1d54zR54WGij5GF4S6+8lArOS3uQjy+tYk8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7019.apcprd03.prod.outlook.com (2603:1096:820:b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 06:18:41 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 06:18:41 +0000
Message-ID: <820705e4-d8bf-403a-9017-d20a028616ae@amlogic.com>
Date: Fri, 8 Nov 2024 14:18:38 +0800
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
 <7c069b82-c31b-45cc-8cf3-a2181a56c2f5@amlogic.com>
 <3b712cc6-3f3d-4786-b2f8-d66e40cf5008@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <3b712cc6-3f3d-4786-b2f8-d66e40cf5008@linaro.org>
X-ClientProxiedBy: TYCP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b557d9-1832-45aa-964a-08dcffbd30ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enYzeXFmZld0UER4Q3hjaG9VUW5tVFpDbjNtQzg4TkJSYmxIYS9Pd2VHMU1L?=
 =?utf-8?B?MnNFNFhweEJYazdqcEd6MEN2U2EydU5tZkc5YkZpa21Zc1FLQlo1U0Y1NGdo?=
 =?utf-8?B?aDRDU3VxOTByYzE5NWtvbkpjVEY4OGJIS25xeWVwTHZrRnlnSVdkT2s0c3Ft?=
 =?utf-8?B?eFF4ZVVpZGIxeUUyUSt2OHlNMzNRWWJ2V2F3dE9HT1dJR2xNanJReFdVdkdV?=
 =?utf-8?B?TUthdXRMNVpNT3VWaWNsb1NLWTlUYzQzRXdNSlFxY09vZTZIZ1lpY2NCQzEz?=
 =?utf-8?B?SE9wa0k0QmN5RUhLdWJzL1JFZW5qWnlMMWtBUWw3Yys2eWNtWkMzRzREa0NX?=
 =?utf-8?B?d1QreHgvWi92Vnd6UytNUVdNQ1JMQ1ppVFF0ZElka2xmQ1NYdWtCb3preDJW?=
 =?utf-8?B?UWxaMGc4SHFCQTlBWTgrNGx6T0x1Ti9IaS9MSmlmZkI1MU5DYXRxblVTYTVD?=
 =?utf-8?B?YWdJZzIwRXdqQSsrKzUzcGZKcjhZREFvd081TXQxWjlnV3hWNUtnQVNReHl6?=
 =?utf-8?B?b3d3eWwyQ3JqNkVjeE5KY3RqUlExRmVwWkV2QlBGMmIvVkcvVHRTZFRPdXNB?=
 =?utf-8?B?bHJMZXJSellDRFRhMnQrcFdxQ0hrYnBFVjRGZXhxaUhpNEZyMXV2UXlXdkp2?=
 =?utf-8?B?OGxIYmY4Z3BFb0hPUGh1Q0RwVmRDcUQ5YUthbXNxd29KUGozZXo0a3MvVHVo?=
 =?utf-8?B?VUkzc3J5V1B4THpzU251QVlXeW5kNm5XUEl0UERVblgxNExDKzBUWVptTmhz?=
 =?utf-8?B?OWE5WkRVTnBmcVFwdTVCZVN4RWc2SElhYjNSbDFpVEZNSjVmNFNNTEhzU1ZU?=
 =?utf-8?B?ZHNVRHJrYWtzeVZuYXZHZ1I5NHFrdnpydmF2ZFdQS0RyM3Z4ZVcwQ2JEVHlv?=
 =?utf-8?B?VmNRMEpaSHpPNGlwN3NZTk1TdENFZ0lGZ3UwRjYweDJVZnBOdDlCamVVVW95?=
 =?utf-8?B?QnMyUnNWM09RWlViQnZvRWRINHRKM2NHYzdJSjgxWlA3bGZUQkxVVUw0SWs0?=
 =?utf-8?B?d1RLaStDSnp1Qjd2ZlpqbHFabzNTejVTRXZJaFdSTTFZUERHU0NtbDRRRzkz?=
 =?utf-8?B?T1JpR1BFWWZSaXF3MEtkSkw2Wk1JK2NwdlhYZkRxZTVUOHZvclJEN0NvVUwz?=
 =?utf-8?B?NlFaMS83ZzNaa1VxYmRES0FYazRiQmljbVA2OWpua00rT2VybjJxOEs2Y01i?=
 =?utf-8?B?WnBVZ241dFpJTUpaVDFMNXZjZlhJeWRyUzkyMWoyWHM1b2RudEtEbHExQkJP?=
 =?utf-8?B?M09KVzh0ZDQ3U1RGc200Ujg0d0NVZHBxL3gyVVgyZlY4VFNudUlncWsxbTJi?=
 =?utf-8?B?UUt4TWhEbThTQ00yY0twQnVRSGlyOU5zSE9HdmJwMHZmODlsRHVYUW9Bamd2?=
 =?utf-8?B?UkxEZCttck0xK2o3OFMwY1NTV0pjUVhtRnhSdktObWk0WTV4ZzA3UHJWaTJn?=
 =?utf-8?B?Tk9ETWVKTEpMMUY5d3ZObEQ3bnA1dTVQbzIzNUlFN0FaK1VnSjJQcXplSmhl?=
 =?utf-8?B?MUh4bzI3dEdCaXVVY0MySVRVQTVCQndrd3J6dktiendPdEZYK2piQThFaC8y?=
 =?utf-8?B?dkdUeks4UHo4N01WclM0QkxOZXdNSVpFUjV5aC9BcGdNRXBid0JyeDYwZjdt?=
 =?utf-8?B?ZVFPWmZ4ZnFyNWh4SnQxdWNUOWUyQ0lYUHNLQkVadXNIL1h1TXVJYTFubndI?=
 =?utf-8?B?czhBbWx1NzE0cDUzcHRBNWRieFI4RDgwSGd0MHhLSUFNWFdNbm9SdG1uV1lw?=
 =?utf-8?Q?Kiv2dziV3ojAsP764QhhKuFEW85L/yq5ss+rInK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFRlV3RUWnNxRm80cnJPa3BzTFY5QkNnSEFZcldTSW5kRWVwVHJqVGV4RTlM?=
 =?utf-8?B?RXljQmtNTDZ6M2o4YWR2T1JjNFNvOGwwZmtweXdJSENOMFk4ZWtMUmVYUHVo?=
 =?utf-8?B?NGNZYllLRnR3dWVXV0t4SVVkZC80S3NwaEdEK1FTcjlGU2RkWmNxRjJ5eCtX?=
 =?utf-8?B?bjRWa2hEeDVYZG1Hb1VwU2Nja21YcnZweFZndGtvS3o3RnpiaXBuLzhIdWpN?=
 =?utf-8?B?alEvZUlQLzZ2ZWtXcmlMbkgwKzZZMk1STnZyZVR6dXQ5aEQvR2JKQlI5U3Rx?=
 =?utf-8?B?cnZQM1NPeDZoK3RrV2h2SFlvUVlSMEQ0MTE3NnpBeVFvTmxVQXMrTG9XU0VL?=
 =?utf-8?B?eGVDNnpRSVM5UVlranhhd2J3bXVqWXRGNjJ6dWYwa1ZWYkFkZmh6akgvdE00?=
 =?utf-8?B?QXBXdlh6RlBLS3M3RGRDY2ZmcVUxTzM3ZzQ2UjF3QkwwT3U5S1BFRStGTnpK?=
 =?utf-8?B?bFZDcGhBVDlmT0ptVWpZOStHbnR4SUxMNUVxVzU2djNHaUYzOUpueWhqdk51?=
 =?utf-8?B?N0RUSTVLeGEwSnkwcGtZVFNza1RKNGNiN0g1U0MydzhTbHAzL3lpQzJOZjdw?=
 =?utf-8?B?U1ltWjR4UnRrc2hiYzJNQi9GSHA4NmRDZzV5S0tsanFxZ25Gc25sdlZHdmVt?=
 =?utf-8?B?bnYvWEpKb3diRHJsYnBpVi9wVWQ1Y1c1NGkxUHlWMzR6Zk9iV3VxdEdBL3VU?=
 =?utf-8?B?ZVJrTGIzL08zZmkraWxTZVlrcUtqTlVFNWh2REoxY1pHcmp1ZjYwYTh0UVVl?=
 =?utf-8?B?RXZ0UDhjdWNKQUFrZDk4WTVTdmY4MG5rYnlLaGMvRFJiN1pld2ZENDdseW5r?=
 =?utf-8?B?ZjJTS3FkYS9WQ0xJUGgzN0wwdit2RzNYRi94WVgwSWhkUXRYaHZWdVlscGY0?=
 =?utf-8?B?MFBpekVGTmFNUTVHTlJQNHJkMzNkVStYc2dtTlBnYS9kVmo2LzhZYWNndlcr?=
 =?utf-8?B?b3JvTmNzWXpwU05mTmFldEJZRkNUeU5ta2lRMmxEVVh0ZS9TS1NhQ1A4RmZr?=
 =?utf-8?B?VWVnaUxlWG10WWVFRDEzVWtDdzF5dk5Nb3NqVFRyUWlIei93ZzRGZFNPNjFQ?=
 =?utf-8?B?cFFNcVM4VnBVcWRPbmlkV2R4OVl0WFpvaWw3VUFhRllaQlJMVlFwR3ZiQTZz?=
 =?utf-8?B?TXZhRzRRNzFCcURzc0xJM2RFWGd3dW43TjRKYnhjWEhheCtxNG1VR3cxb2g3?=
 =?utf-8?B?c0w3S3hJdUZFdm9tcWRId2E5LzVWTmlHYk1JbmRpM29jczhsUGFERkVZTlBD?=
 =?utf-8?B?Q2prME1ad3pIN0tnZjlRRzBzRm1lTlJTQTk0eSs2Q3g4SVYvWVphd0dIY2pP?=
 =?utf-8?B?V2c0di9KOWxlZTN0ZGZ5TWZRZ3JRL3BaWnBMSWJDajJjeEVxbFI5NUVOcTNl?=
 =?utf-8?B?bXc5SlB4QlB1V0JMVmFIenNsUVIxVC9DbXdybWh3a0xoeUczRm5sMmI2N29u?=
 =?utf-8?B?T0lEc20yUzhKaW9NM0UwZ2JpU3AwM2ZHakN5U3E3d0Y4T0daRm91ZE1FVFh6?=
 =?utf-8?B?SnB5RENmU2hpalpKTTl0RjdrWFVpaTFjNTRDdndkWDQ0VWxrakkyTy9hQ3Rm?=
 =?utf-8?B?RjB2ZSt4MCtmc0hVVFJKYlg5djhHblJpRFZMQlpUamYvaHorMytyc21MMlNV?=
 =?utf-8?B?aEV1bXVoa0tIOXREVmh4dXkyTlBNVTM4TmZQTTMrWE9wMnJPTk9OcTE2MDBo?=
 =?utf-8?B?RkgyQkVzK01KeklZZlkxdVA1S1BKb21jdFhjNWp1SXN0dElEM0lVS2sxYklI?=
 =?utf-8?B?blFYNWZ2dGhUV1BaQkVmMGFiRFZramNSbUs0WFlhbW12YlI5THZFMW9hdk1i?=
 =?utf-8?B?eFIyQk1kbjZtV3NCMG1tTzlhMitLVGdhVnVHcGd2TUxkMm9wMUg3SEpLZ05k?=
 =?utf-8?B?L1lOSnJMQWtnbHd2anBmSmY5OWRkUHR6Tm5VNFRzSlF6dkgxYmRhbW1UM3Nk?=
 =?utf-8?B?UG8vcU5DMmZrbmdRVGROL0IzNXlrOVZQaGp1c1Iwc3JYd2F4bjJ0enVlYnhm?=
 =?utf-8?B?MjVPNE1teXhZWkdtT1BpK1JnZGhxNnM2R0Yxa1RpYUlueWV0Unc0UmJFVFNM?=
 =?utf-8?B?aTQ2bEJPeVdvcFJtbmVrNlB0MlNNTWFsd1c0a0cvRGFBbWh6YW1icW9URFVV?=
 =?utf-8?B?dlhIZXRiNVcvNXlVVFY5SGFCQUg5TzJsSnZmRCthekJzTkxPY09RamgyTi9R?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b557d9-1832-45aa-964a-08dcffbd30ca
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 06:18:41.3462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DyuNqbO+9vob/q+wAlZNciKRgY2hUWHFnqtaJPylfjkZD8Gkn+Y/K7nIm7dhi4yQJ44vlEAQ3xL+lJgXikt7IaAzh4Z/Nf6v2WdkqiBvGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_221852_960493_DDF31C24 
X-CRM114-Status: GOOD (  28.68  )
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

SGkgTmVpbCwKICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KCiAgICBJJ3ZlIGFscmVhZHkgc2Vu
dCBSRkMgdjQgdmVyc2lvbiB0byBkaXNjdXNzIHRoZSBmZWFzaWJpbGl0eS4gCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI0MTEwMS1hNF9waW5jdHJsLXY0LTAtZWZkOThlZGMzYWQ0QGFt
bG9naWMuY29tLwoKICAgIFRoZSBkcml2ZXIgbWFpbnRhaW5zIHRoZSBvcmlnaW5hbCBmcmFtZXdv
cmssIGFuZCBpcyBjb21wYXRpYmxlIHdpdGggCnRoZSBwcmV2aW91cywgYnV0IGFkZHMgYSBob29r
IGZ1bmN0aW9uKG9mX3hsYXRlKSwgYW5kIGVhY2ggU29DIGRyaXZlciAKaW1wbGVtZW50cyBpdHMg
b3duIG9mX3hsYXRlIGZ1bmN0aW9uLgoKICAgIEluIHRoaXMgd2F5LCB0aGUgYmluZGluZyBoZWFk
ZXIgZmlsZSBuZWVkcyB0byBiZSBpbmNyZWFzZWQgb25jZSwgYW5kIAp0aGUgc3Vic2VxdWVudCBj
aGlwIGRyaXZlciBubyBsb25nZXIgYWRkcyB0aGUgaGVhZGVyIGZpbGUsIHRoaXMgd2F5IGhhcyAK
YWNrZWQgYnkgUm9iLgoKICAgIHdoYXQgZG8geW91IHRoaW5rIG9mIHRoZSBjaGFuZ2VzIHRvIHRo
ZSBkcml2ZXI/CgpPbiAyMDI0LzEwLzI4IDE4OjQ0LCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3Jn
IHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIDI4LzEwLzIwMjQgMTA6NTksIFhp
YW53ZWkgWmhhbyB3cm90ZToKPj4KPj4KPj4gT24gMjAyNC8xMC8yOCAxNzo0NiwgbmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9u
IDI4LzEwLzIwMjQgMTA6MzYsIFhpYW53ZWkgWmhhbyB3cm90ZToKPj4+PiBIaSBOZWlsLAo+Pj4+
IMKgwqDCoCBUaGFua3MgZm9yIHlvdXIgYWR2aWNlLgo+Pj4+Cj4+Pj4gT24gMjAyNC8xMC8yOCAx
NzowOSwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPj4+Pj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4+Pj4+Cj4+Pj4+IE9uIDI4LzEwLzIwMjQgMTA6MDcsIFhpYW53ZWkgWmhhbyB3cm90
ZToKPj4+Pj4+IEhpIE5laWwsCj4+Pj4+PiDCoMKgwqDCoCBCYXNlZCBvbiB0aGUgY3VycmVudCBk
aXNjdXNzaW9uIHJlc3VsdHMsIEdQSU8gaW5kZXggbWFjcm8gCj4+Pj4+PiBkZWZpbml0aW9uIGRv
ZXMgbm90IGJlbG9uZyB0byBiaW5kaW5ncy4gSWYgc28sIHRoZSBwaW5jdHJsIGRyaXZlciAKPj4+
Pj4+IGtlZXBzIHRoZSBleGlzdGluZyBhcmNoaXRlY3R1cmUsIGFuZCB1c2UgbnVtYmVycyBpbnN0
ZWFkIGluIGR0cyAKPj4+Pj4+IGZpbGUuIE9yIHRoZSBwaW5jdHJsIGRyaXZlciB1c2UgYmFuayBt
b2RlIGFjZXNzLCB0aGlzIG1heSBub3QgYmUgCj4+Pj4+PiBjb21wYXRpYmxlIHdpdGggZXhpc3Rp
bmcgZnJhbWV3b3Jrcy4gVGhpcyBpcyBkb25lIGJ5IGFkZGluZyAKPj4+Pj4+IG9mX3hsYXRlIGhv
b2sgZnVuY3Rpb25zIGluIHBpbmN0cmxfY2hpcCBzdHJ1Y3QuCj4+Pj4+Pgo+Pj4+Pj4gV2hhdCBp
cyB5b3VyIGFkdmljZSB0aGF0IEkgY2FuIGltcGxlbWVudCBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBU
aGFua3MhCj4+Pj4+Cj4+Pj4+IEtlZXAgdGhlIGRyaXZlciBhcy1pcywgYnV0IG1vdmUgdGhlIGhl
YWRlciBmaWxlIGludG8gCj4+Pj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYyBsaWtlIGl0
IHdhcyBkb25lIGZvciB0aGUgbGFzdCByZXNldCAKPj4+Pj4gY29udHJvbGxlciBzdXBwb3J0Ogo+
Pj4+PiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1yZXNldC5oCj4+Pj4+
Cj4+Pj4KPj4+PiBJIGRvbid0IHNlZSBleGFtcGxlcyBDIGZpbGUgYXBwbGllcyBkdHMgaGVhZGVy
IGZpbGUuCj4+Pj4gQyBmaWxlIG5lZWQgdG8gYmUgZGVmaW5lZCBvbmNlLCBhbmQgdGhpcyBuZWVk
cyB0byBiZSBkZWZpbmVkIGFnYWluIAo+Pj4+IGluIGR0cyBoZWFkZXIgZmlsZS4KPj4+Cj4+PiBT
b3JyeSBjb3VsZCB5b3UgcmVwaHJhc2UsIHRoZSBzZW50ZW5jZSBpc24ndCBjbGVhci4KPj4+Cj4+
Cj4+IEknbSBzb3JyeSBJIGRpZG4ndCBkZXNjcmliZSBpdCBjbGVhcmx5Lgo+Pgo+PiBUaGUgcGlu
IGluZGV4IGRlZmluaXRpb24gaXMgdXNlZCBpbiBkcml2ZXIgQyBmaWxlIGFuZCBpbiBEVFMgZmls
ZXMuCj4+IEl0J3Mgbm90IGxpa2UgcmVzZXQgZGVmaW5pdGlvbiBvbmx5IHVzZWQgaW4gRFRTIGZp
bGVzLgo+PiBJZiB0aGUgcGluIGRlZmluaXRpb24gaGVhZGVyIGZpbGUgcGxhY2UgYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljLCAKPj4gc28gdGhlIGRyaXZlciBDIGZpbGUgbmVlZHMgdG8gYmUg
ZGVmaW5lZCBhZ2Fpbi4gSSBkb24ndCBzZWUgZXhhbXBsZXMgCj4+IG9mIGhvdyBhIEMgZmlsZSBh
cHBsaWVzIGEgRFRTIGhlYWRlciBmaWxlLgo+IAo+IEdvb2QgcXVlc3Rpb24sIEkgc3RpbGwgZG9u
J3QgdW5kZXJzdGFuZCB3aHkgdGhlIG1vZGVsIHdlIHVzZWQgc28gZmFyIGlzIAo+IHN1ZGRlbmx5
IGJhZC4KPiAKPiBSb2Igc2ltcGx5IHBvaW50ZWQgZm9yIEFPQlVTOgo+ID09PT09PT09PT0+PD09
PT09PT09PT09PT09PT09PT09PQo+IEkgZmluZCBkZWZpbmVzIHdpdGggdGhlIHZhbHVlIG9mIHRo
ZSBkZWZpbmUgaW4gdGhlIG5hbWUgcHJldHR5Cj4gcG9pbnRsZXNzLgo+ID09PT09PT09PT0+PD09
PT09PT09PT09PT09PT09PT09PQo+IAo+IFJpZ2h0IGJ1dCB0aG9zZSBhcmUgYW4gZXhjZXB0aW9u
IGJlY2F1c2UgR1BJT19URVNUX04gaXMgdGhlIGV4Y2VwdGlvbiwKPiAKPiBBbmQgb2YgdGhlIHBl
cmlwaHM6Cj4gPT09PT09PT09PT48PT09PT09PT09PT09PT09PT09PT09Cj4gSSdtIG5vdCByZWFs
bHkgbXVjaCBvZiBhIGZhbiBvZiB1c2luZyBkZWZpbmVzIGZvciBHUElPcywgYnV0IGlmIHlvdSBk
bywKPiB3b3VsZG4ndCBiZSBiZXR0ZXIgdG8gc3BsaXQgYmFua3MgYW5kIGxpbmVzIHVwIHJhdGhl
ciB0aGFuIGEgZ2xvYmFsCj4gbnVtYmVyIHNwYWNlLiBTZWUgQVNQRUVEX0dQSU8oKSBvciB0ZWdy
YSBoZWFkZXIuCj4gPT09PT09PT09PT48PT09PT09PT09PT09PT09PT09PT09Cj4gCj4gVGhpcyBp
cyBleGFjdGx5IHdoYXQgd2FzIHByb3ZpZGVkIGluIHYyLCBhbmQgbWFwcGVkIHdoYXQgd2FzIGlu
IAo+IGFzcGVlZC1ncGlvLmgKPiAKPiBJIHJlcGVhdDoKPiBUaGUgR1BJTyBuYW1lcyBhcmUgbm90
IGxpbmVhciB0byBhIG51bWJlciwgcG9pbnRpbmcgdG8gdGhlIGZpcnN0IEFPQlVTIAo+IGZpcnN0
IGlzIGEgbm9uc2Vuc2Ugc2luY2UgR1BJT19URVNUX04gaXMgdGhlIGV4Y2VwdGlvbi4KPiAKPiBB
bmQgdGhlIGRyaXZlciBuZWVkcyB0aG9zZSBudW1iZXJzIHNpbmNlIHRoZXkgYXJlIGJpbmRpbmdz
Lgo+IAo+IE5laWwKPiAKPj4KPj4+IE5laWwKPj4+Cj4+Pj4KPj4+Pj4gTmVpbAo+Pj4+Pgo+Pj4+
Pj4KPj4+Pj4+IE9uIDIwMjQvMTAvMjEgMjM6MjcsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6
Cj4+Pj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4+Pj4KPj4+Pj4+PiBPbiAyMS8xMC8yMDI0
IDEyOjM4LCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+Pj4+Pj4+Pj4+ID09PT0+
PD09PT09PT09PT09PT09PT09Cj4+Pj4+Pj4+Pj4gKy8qIFN0YW5kYXJkIHBvcnQgKi8KPj4+Pj4+
Pj4+PiArI2RlZmluZSBHUElPQl9TVEFSVMKgwqDCoMKgwqDCoMKgIDAKPj4+Pj4+Pj4+PiArI2Rl
ZmluZSBHUElPQl9OVU3CoCAxNAo+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+PiArI2RlZmluZSBHUElP
RF9TVEFSVMKgwqDCoMKgwqDCoMKgIChHUElPQl9TVEFSVCArIEdQSU9CX05VTSkKPj4+Pj4+Pj4+
PiArI2RlZmluZSBHUElPRF9OVU3CoCAxNgo+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+PiArI2RlZmlu
ZSBHUElPRV9TVEFSVMKgwqDCoMKgwqDCoMKgIChHUElPRF9TVEFSVCArIEdQSU9EX05VTSkKPj4+
Pj4+Pj4+PiArI2RlZmluZSBHUElPRV9OVU3CoCAyCj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+ICsj
ZGVmaW5lIEdQSU9UX1NUQVJUwqDCoMKgwqDCoMKgwqAgKEdQSU9FX1NUQVJUICsgR1BJT0VfTlVN
KQo+Pj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9UX05VTcKgIDIzCj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+
Pj4+ICsjZGVmaW5lIEdQSU9YX1NUQVJUwqDCoMKgwqDCoMKgwqAgKEdQSU9UX1NUQVJUICsgR1BJ
T1RfTlVNKQo+Pj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9YX05VTcKgIDE4Cj4+Pj4+Pj4+Pj4gKwo+
Pj4+Pj4+Pj4+ICsjZGVmaW5lIFBFUklQSFNfUElOX05VTcKgwqDCoCAoR1BJT1hfU1RBUlQgKyBH
UElPWF9OVU0pCj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+ICsvKiBBb2J1cyBwb3J0ICovCj4+Pj4+
Pj4+Pj4gKyNkZWZpbmUgR1BJT0FPX1NUQVJUwqDCoMKgwqDCoMKgIDAKPj4+Pj4+Pj4+PiArI2Rl
ZmluZSBHUElPQU9fTlVNIDcKPj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4gKy8qIEl0J3MgYSBzcGVj
aWFsIGRlZmluaXRpb24sIHB1dCBhdCB0aGUgZW5kLCBqdXN0IDEgbnVtICovCj4+Pj4+Pj4+Pj4g
KyNkZWZpbmXCoMKgwqAgR1BJT19URVNUX07CoMKgwqDCoCAoR1BJT0FPX1NUQVJUICvCoCBHUElP
QU9fTlVNKQo+Pj4+Pj4+Pj4+ICsjZGVmaW5lwqDCoMKgIEFPQlVTX1BJTl9OVU3CoMKgIChHUElP
X1RFU1RfTiArIDEpCj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+ICsjZGVmaW5lIEFNTE9HSUNfR1BJ
Tyhwb3J0LCBvZmZzZXQpIChwb3J0IyNfU1RBUlQgKyAob2Zmc2V0KSkKPj4+Pj4+Pj4+PiA9PT09
Pjw9PT09PT09PT09PT09PT09PQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gaXMgZXhhY3RseSB3aGF0
IHJvYiBhc2tlZCBmb3IsIGFuZCB5b3UgbmFja2VkIGl0Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE5v
LCB0aGlzIGlzIG5vdCB3aGF0IHdhcyBhc2tlZCwgYXQgbGVhc3QgYWNjb3JkaW5nIHRvIG15IAo+
Pj4+Pj4+Pj4gdW5kZXJzdGFuZGluZy4KPj4+Pj4+Pj4+IE51bWJlciBvZiBHUElPcyBpcyBub3Qg
YW4gQUJJLiBOZWl0aGVyIGlzIHRoZWlyIHJlbGF0aW9uc2hpcCwgCj4+Pj4+Pj4+PiB3aGVyZSBv
bmUKPj4+Pj4+Pj4+IHN0YXJ0cyBhbmQgb3RoZXIgZW5kcy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSBj
b25maXJtIHRoaXMgbmVlZCBzb21lIHdvcmssIGJ1dCBpdCBtb3ZlZCB0aGUgcGVyLXBpbiBkZWZp
bmUgCj4+Pj4+Pj4+IHRvIHN0YXJ0Cj4+Pj4+Pj4+IGFuZCByYW5nZXMsIHNvIHdoYXQgZGlkIHJv
YiBleHBlY3QgPwo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE1heWJlIEkgbWlzc2VkIHNv
bWV0aGluZywgYnV0IEkgY291bGQgbm90IGZpbmQgYW55IHVzZXJzIG9mIAo+Pj4+Pj4+Pj4gdGhl
c2UgaW4gdGhlCj4+Pj4+Pj4+PiBEVFMuIExvb2s6Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMDE0LWE0X3BpbmN0cmwtdjItMy0zZTc0YTY1YzI4
NWVAYW1sb2dpYy5jb20vCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNvIHlvdSB3YW50IGNvbnN1bWVycyBi
ZWZvcmUgdGhlIGJpbmRpbmdzID8gc3RyYW5nZSBhcmd1bWVudAo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IFdoZXJlIGlzIGFueSBvZiBhYm92ZSBkZWZpbmVzPwo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+IE1heWJlIHRoZXkgd2lsbCBiZSB2aXNpYmxlIGluIHRoZSBjb25zdW1lciBjb2RlLCBidXQg
SSBkaWQgbm90IAo+Pj4+Pj4+Pj4gaW1hZ2luZQo+Pj4+Pj4+Pj4gc3VjaCB1c2UuIFlvdSBleHBl
Y3Q6Cj4+Pj4+Pj4+PiByZXNldC1ncGlvcyA9IDwmY3RybCBHUElPQU9fU1RBUlQgMT4/Pz8KPj4+
Pj4+Pj4KPj4+Pj4+Pj4gTm8gSSBleHBlY3Q6Cj4+Pj4+Pj4+IHJlc2V0LWdwaW9zID0gPCZjdHJs
IEFNTE9HSUNfR1BJTyhCLCAwKSAxPjsKPj4+Pj4+Pj4KPj4+Pj4+Pj4gYnV0IHRoZSBtYWNybyBz
aG91bGQgZ28gYWxvbmcgdGhlIGR0cyBsaWtlIHdlIGRpZCBmb3IgdGhlIHJlc2V0IAo+Pj4+Pj4+
PiBkZWZpbmVzLAo+Pj4+Pj4+PiBzbyBwZXJoYXBzIHRoaXMgaXMgdGhlIHNvbHV0aW9uID8KPj4+
Pj4+Pgo+Pj4+Pj4+IE9LLCBzbyBJIHNhaWQgaXQgd2FzIG5vdCBhIGJpbmRpbmc6Cj4+Pj4+Pj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL3U0YWZ4cWMzbHVkc2ljNG4zaHMzcjNkcmczZnRt
c2Jjd2ZqbHRpYzJtYjY2Zm9vNDd4QHhlNTdnbHRsNzdocS8KPj4+Pj4+Pgo+Pj4+Pj4+IGFuZCB5
b3UgaGVyZSBjb25maXJtLCBpZiBJIHVuZGVyc3Rvb2QgeW91IGNvcnJlY3RseSwgdGhhdCBpdCBn
b2VzIAo+Pj4+Pj4+IHdpdGgKPj4+Pj4+PiB0aGUgRFRTIGxpa2UgcmVzZXQgZGVmaW5lcyAoSSBh
c3N1bWUgbm9uLUlEIGxpa2UgZGVmaW5lcz8pLCBzbyAKPj4+Pj4+PiBhbHNvIG5vdAo+Pj4+Pj4+
IGEgYmluZGluZz8KPj4+Pj4+Pgo+Pj4+Pj4+IFdoYXQgYXJlIHdlIGRpc2FncmVlaW5nIHdpdGg/
Cj4+Pj4+Pj4KPj4+Pj4+PiBKdXN0IHRvIHJlY2FsbCwgSmVyb21lIGFza2VkIHdoZXRoZXIgeW91
IGhhdmUgdG8gbm93IHVzZSBhcmJpdHJhcnkKPj4+Pj4+PiBudW1iZXJzIGluIERUUyBhbmQgbXkg
YW5zd2VyIHdhczogbm90LiBJdCdzIHN0aWxsIHRoZSBzYW1lIGFuc3dlci4KPj4+Pj4+Pgo+Pj4+
Pj4+IEJlc3QgcmVnYXJkcywKPj4+Pj4+PiBLcnp5c3p0b2YKPj4+Pj4+Pgo+Pj4+Pgo+Pj4KPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
