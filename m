Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4B9CCD187
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Oct 2025 06:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u05U/1BeMgB79glYPCxY3dnsl330L1IifKoHF9Brna4=; b=TG6ppPOYdVpRdXDjOtmLCG9Rgj
	iAVO3+/6oTzhYxpeEzvDPHQiMqwBhst6pRoxBUWlj6/7DshIJ+/8T9BCHowUF20kyWULTLxHdY5FR
	KxIQcFvwGjejNu4HSEesluStB+G8ovaElHiM+U7WiSfyTYdDd4RXJ9164p5dvRN0pBzjE82SHej1F
	xSJGdrgTpHBo0bX3dcj8izS4K6Vb5jZAmRKNPa6ghSp1qeI9ysvmIKibk4Xob7G+xTPL88uMlEu2T
	DQeKZ8p2U1R5ELMHDzuiG+vc+CEWVbMXhiMYF/4AylV5ZxamgljjSn3O8FPn9DDuMnurkcfYYjFH5
	WN99IsJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76QW-00000007ksN-2I5k;
	Fri, 10 Oct 2025 06:16:28 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76QT-00000007krr-3aeK;
	Fri, 10 Oct 2025 06:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRr6YGXJij5rtHDK5Vx4cu6pWoyBBaGwsZbLiRhgPOkBK6+ZqjzaqH+3Sy8fjfOWctHLLEyDPsoGs0bqP3kNaQb+1rM7BZKFL+vFhwdPRCfOGEF4/wJbIzlturv4D2eTo8sqWXM8pXJQttekOmE4+3RGyPpKpltDi4y8Q6GGDcZFA+MvETbRMKaf4G2x0HX9Xc+XeMmIeM5LUoYEPdgwKxrucmIl26UD8NE9Fsbc5/nkDbzG3ayebrIf6sYTBhxj8J8b7zSRnoyAPIqB9lmUJ5F/szG95S+j7kFC7pzMIrx1d2KvTkR9IacUSiY1a2ipPQpqqXwcmtnwacOtIV2t/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0tEEn6hNUD6h+dyUFAchOmokesqzgR6hxejIbJiTFk=;
 b=L1BxDsPQ2+IpDTI0H0+KaxpWGfOLyKsJgtPs1akg4/flMC1zbevCTT2Ss/JHKKqnmEmMQRUhGrsVZqNeYvIVNRdLFQFUoLamlafqFgVzA7fE/RkEv82TSKM/+F6pVakhEM2buahdz9Y885begNoFijX/OsU0w2rcHWrSswiYqc1j03MN36W/DLIh2aD/L59hJsFj4CSqUAAOB9AlvY9s8YNgsPdJ0XKRHvsLNrRXKk127BH6zlpnUn2aifALvDy3xOqsM3srwcAwABuMZ3UmdT6or7inOunCX4GkfsADS0mNhRLPVu5orivBFpXGTz/Z3wUTgwjYdMuH+jTKzzXB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0tEEn6hNUD6h+dyUFAchOmokesqzgR6hxejIbJiTFk=;
 b=QkwT8EV/7IoVTjLU/F2lE1VahfqSl/B+hW0d/bP0/CIhmLRV0KJEs+jQW7bggazQqkVBuwNaB63HgbEQ/nRuZD5J0goYCbxFo0UceazlLTuOnpUZ+107JDOA3MD00FrJE/WdcUIZpYGpvHkCM0RVeaNEb3e4VpjO1aODBvMrEX55mnWLyWa105BBHyONr8xzzcIp9daZ0kIDuAmdMJuK40RzP1+fYwjRVw51LhNmuYztJwxJdOREmgWA6uZAakAXhHU5wXeaxXSHir7CQKQwSWUq+wCWvUWZjvhG2M8t8F3C7RmSAXW7TnG4lGJNaBZUq86u5ernwLbWRKZzgQCW3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB7701.apcprd03.prod.outlook.com (2603:1096:101:128::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 06:15:58 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 06:15:58 +0000
Message-ID: <362b6daf-6b2c-4385-88b3-f2dda38f6612@amlogic.com>
Date: Fri, 10 Oct 2025 14:15:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for A4
 and A5 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
 <1jv7kz3w1p.fsf@starbuckisacylon.baylibre.com>
 <b8105d25-112c-4406-9f3a-8fbbd0754b26@amlogic.com>
 <1jh5w84iat.fsf@starbuckisacylon.baylibre.com>
 <7a5d3f57-4c0e-483c-9d6f-9556583180a7@amlogic.com>
 <c922430f-3efb-4c2a-8b10-b2f150db827f@kernel.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <c922430f-3efb-4c2a-8b10-b2f150db827f@kernel.org>
X-ClientProxiedBy: SG2PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:4:7c::27) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: c3503f87-38cc-4e3f-dc72-08de07c47a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M01CaDR3b2VrNWtnOHhDQWZmWXVaVFJCNXg4WGxtR2hUUEo3Y3ZBM2lZTXpX?=
 =?utf-8?B?ZklJbHZmZ1p1am5JdTJpSkdYeWkrYjdXOXNOMDZGN0VYMXl5L3BHcTNDZVh0?=
 =?utf-8?B?YVk3dmVvZDRzSHRVUlB0UTZMeHJPT3JBbmFqSm1RY1l3bVJrc0hUTHhBWUhG?=
 =?utf-8?B?V3RXa0VJUU1rYm5adTdIMFhkejdYUXJMTnhnQmFPU3RjMm5oeTdRd3VvZFVk?=
 =?utf-8?B?TjQ2OXAwRElFNFlJNDZBMWNCZXR1eHhsRUVacHE1K2NNbW5IZEtlQ2NTeW9w?=
 =?utf-8?B?dndZVUZnV3htZnljZlZST0w4cTdDMWRPbnQ3ei81c0pNa1g5cXFtajFWZ1hW?=
 =?utf-8?B?azlzVU9idVA3VmVESkNPUFQvU3ZqRGVSQVZ6K2J3TkJsWWpVc0RLWVgvZWRu?=
 =?utf-8?B?cHVjVjZiRWZib3BMSTBRT2pZT1R0VCtRcktZcmRFV0NrZEIrVC9PV2VlaUJN?=
 =?utf-8?B?MUZwb1drMC9jWTdIOUZXb2EweTRaZWJaUmlnQUFzR2t1bFNHcDcwMWxWSEpK?=
 =?utf-8?B?TllST3RJaFRFa2lGZDBxb0hVNWoweGNualU5RmNCSjBEV1NML253Y2Z2TVo1?=
 =?utf-8?B?U2hhQ3E2LzNVdkltZHB2K21WbDhxbWFvUU5zS1J3OTlsZklLeG93M3FBMXVp?=
 =?utf-8?B?bFNJcjVEQ1JSMU1SZUR3N1ZWRzg2RnNyNjErQXVoNGRKd0VOMWNwT1lOdlhW?=
 =?utf-8?B?L2NWdW9vVWpwMkdZbVJpTlZCaFJad0VKQ0RpSUdxZjhTbEdNRDd2eUdoMnhl?=
 =?utf-8?B?dUREaGRQd2JyM1ZKTlgwTjdOM0diVmJWU3YwVWQ1V2JxRThlb2pkTVRoUzVs?=
 =?utf-8?B?OER4cjJGMW9NQ0dydFBoais0YVNkMStuT041NnF6WkhEbnVMcThlaWhJbkVl?=
 =?utf-8?B?eGQrSXpOam9tQjVxNkgrOWtUMXZ1WnMwcUlXZ04vemF6aU9TTXdWcTVpUXBH?=
 =?utf-8?B?MlJnODArcTJidUdIb2lrelpwNkh3UmFSTlNEN0ZMejROc2hZVDMyU1RyOWhh?=
 =?utf-8?B?dlQ3bFN5WWhhWTVrVkdvSURKNEZFN1lHeHZUVXBJaFFYVVJQRyswMGlXd0tE?=
 =?utf-8?B?NkdRaTZuYkdZdFVob1NoUFhRd3pqdmJLSm1vMjNmbWdaNmRWQktJVmxRNFlu?=
 =?utf-8?B?a3ZhR0ZsSEEzUjFmTVo5cEdmbTNiek9ZRnJPZ3g5TXNpeldHKytSNE5BV1lu?=
 =?utf-8?B?NVVJRnVvemM5MHVSQkJNZVRVMk9EV08yUjloMnVmdnBIT0wwenhValI3cnFu?=
 =?utf-8?B?QzdsUTVEWkpCekt3dit5aEk5akV3c0xrSkM2ZlJ6em5nSUZJV1NqVTZBWHAw?=
 =?utf-8?B?aWFhQzBlMXFOVXRmR0txM0Ryc203VENXdE9HQnZ5N1MxT2Y3OXFNTEpxeWla?=
 =?utf-8?B?V254NlRiUTdUeDVqZ0g4UXNJSm5DSXFydWVLWW5ldHdtN3BxK3lwUDE1Q0Yz?=
 =?utf-8?B?THdmY000VUpPMTZCcGNxOHNkYmZXNHVRNDNFeGxTQmUvcUZrYlNrTXN1TTNV?=
 =?utf-8?B?VXljUkFkalBzRHJSZmd0STYzNVM3enVrUzRhRGJlODF2TVk5WldDL1lPODd1?=
 =?utf-8?B?MCtZcnAzZzhxY29DbWkyR1pFcnR5b2VNVUttSUlBNDd4T0JtV3dCUkJXTDdP?=
 =?utf-8?B?bElUUFdNNE4zT0tSVlhUeDR1ZW10N1RRU2d4cldxSkFXQjQxYStTbGo3RFlY?=
 =?utf-8?B?cEVLVzRLeWwrMDBCbnR3RFNwK0dZYVNhZklmb0xGUnc1OXh1c0ZMbEtIdGlj?=
 =?utf-8?B?YlF2VXZWVHZveVYxSmV0RStvU0pLL3ZXZGIweHpaSUlGaUkxWUlIQ1hOV2tZ?=
 =?utf-8?B?SzBtbnp5RXJoLzBYS2pERG1JRmREc1JlVytIOGxJS0NTQ3JWNXNZYWRtaE9k?=
 =?utf-8?B?dEJNT2xSaWk4Vkp5anE5MmlQK1lJTXAxNWRWd1FHYWxKU1h0ckQ1RS9xNURG?=
 =?utf-8?B?K0hEYW9wcWJ5TzZHRU85ODRlclE5SVB2MzI5cVh4Yi9la1JPaDA3aGpzbTVo?=
 =?utf-8?B?M3BaWjFxVStnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STZXRzU2anBKZWFWWVJqSU1FQUxwQTRhMmF2R1ExQy9walZVRTJ2N3hNTkJj?=
 =?utf-8?B?dmM0emhBemtmQU94VmdNMFlObS9NWU1PNTl2MUFoRURicDQ3ME1EVlh0R3hH?=
 =?utf-8?B?cXRGNnA5NEd0ME9VeFhqbWpkQkI0YUp2ZDBYNHZ0S0tMWnl4OUFOSCt0czlk?=
 =?utf-8?B?Z2xJZlJwMnM4c0kzb2ppTEpNOFdlR2pSUmtnZHl4N1BYMm1WellYeFFEVFZH?=
 =?utf-8?B?cDAwaUlTWDVsd1lGMDFtWE9MdlhXVHJ6TndkWDV5V3N5aDMzNkpGZGlabXJZ?=
 =?utf-8?B?ZU1Qd29NeURnU0o2T2x4Mkswb3ZJOURGaVNFZ2NEQURuYnBoUmJoV2R6bFpF?=
 =?utf-8?B?Z3JvUGJldUJFcW9XTEdmc1JCRjZDUnBXYmhuMXNxNTRUSGYwNm9HWTFLN2pX?=
 =?utf-8?B?Z0sxRE0xYU9ZbS8vaFhySzIyc01qa0ZVaFBEYVBycnVyekRFYzUyZE1UcDFm?=
 =?utf-8?B?by9ZM3JQZVpDRG55UUlwcFFFNFYxVjBBMFFydm9IUXVoYzc2VnJ3clpEMzFU?=
 =?utf-8?B?VFQrUXVHNEdlSTJNYnhwREM4WkcwUy8vTDQrVnY2M2hoWm5FYjAzTzhGV3FD?=
 =?utf-8?B?Q0FLV29kckN5UjFrbzRVdVpGMy9wVTN2UHEwaE9KbGkwcHhxOE5PYkdNVWtt?=
 =?utf-8?B?Q1MzZjJ2Y1F4VGRNNkhQSUkyaUJvRTdoWERlOTQvcXRXdjkrRnhtRFJuVTBT?=
 =?utf-8?B?TWpFNXVlWGhIVzlPNEE1RS9FYTRDcDZKN2ovMFFmdS9OY3pqdG5WNTY5RkNZ?=
 =?utf-8?B?N1U3QjczWUF3RU0wc0xNKzJHV3hMdEFZMW1LUFBEQmN1N3RJK0tLRWQrdEhu?=
 =?utf-8?B?aU1VN3o3R241S2tWRHkyUHlVOVFRUVdmU3J0UXlLUzFEOTF3QzJ4RExwak5B?=
 =?utf-8?B?RjIzcVQ5L0tnQjNML2dqV3c5b1BtUG5XSGVNSHdOc0R6bEcwdnZkS0VPS2Uz?=
 =?utf-8?B?dlVYaGVORXYxWUlyeWx4MGlJZFBaYklrRlY2UW5hSzZjTEVpUnkzR2FUTCs4?=
 =?utf-8?B?aVgxSHBDR3NEbGU3bThNcWYxZ3pBeGg2TERGVm1nY3ordXRhdElDMFVVa09Z?=
 =?utf-8?B?QlBvQ0J2SFBOcGRpaHprNlpHQVdxbTJpSTFNb2NZb1p0aTRXMis2SUhPNm9h?=
 =?utf-8?B?bmJGSTZtcTY5M291QXAwbzBCbGFRNnJYNVVLMkE4aVRqaGlKUnRwREJBbXRK?=
 =?utf-8?B?NlVCMG1qUnI1NmlMVW40bk5iaGVzR2g2RWIwdGR6ck1XMkIxcnVUbVhncWtY?=
 =?utf-8?B?cElaYVpVVUxwNTlKUlZrUm9jYXNkMWQ4bUMrMUtUSEw3cEhyNlBlSDJpR014?=
 =?utf-8?B?Vm82enJhWEo3N2x0RnlmY3QvVnFyTm5yYVBqdnNETnZ4RkFMMUVjMjA1bUlk?=
 =?utf-8?B?SVNQRCtlWTJMbklZS2VmY1pVWUZ1RmhXc3hraVRwdG0wMW1pUmlZMWFQRjhY?=
 =?utf-8?B?aXdBazArOW8rTUpkK2FIczBlUHdzc2RmYkdSa0wrSTlVeGdNL29TeDUrWUp4?=
 =?utf-8?B?dFhncFRaR2E0aDBzUHkxZ0RWamt3L0Z6bHBBZXNzNHBkdGgzNmlwZFNWa3Zu?=
 =?utf-8?B?UE8rSFFhNnNwYzBUa2Y3TlZWUlNvb2ZxNDc3NlY0aVFSUkcwZ3RTckkxSnB2?=
 =?utf-8?B?WEZVTlpOMVVCMjBoeWpkSys5YTFCOENrTDNaZStjSzhaMWl0QVMwTUFsR08z?=
 =?utf-8?B?TmtmSTQxMm5Wb3NzZ1NGKzJyTjNscXh3WU9YUGgzSEUvdWpWR2xrMGw3K0Jq?=
 =?utf-8?B?M1BMc1BzVndVVnhaUzdJN1BBRSttZGlSbHFKdk5wUThITXVDamZvZ3l3ZnRj?=
 =?utf-8?B?T0lzOHcxb0JONU1vU3pXREJ5R1dyM2NOa1VKZHdsRnI5N3B6aUtHMVQxWE0x?=
 =?utf-8?B?blFOa2I5NmhJc05ZK0tBK0hoTUNYSDk4cklYZ043d21maDZNbUVsQlNkVllk?=
 =?utf-8?B?K0ZyOUoycGx5Y2ZEeitqQ3NSNDdxZU9CSzF1cUV1VmFEZHNqbVhOWmhyWG0y?=
 =?utf-8?B?NC9Wd1FPSHN5V1ljQVh3WUI5aUYvM0trWW10QW94QTR2ekd5REMvLzBSOEU4?=
 =?utf-8?B?a3d0ZWxRWFloeFlmNmF6eGY0Z1ZacTBmMmhQbFZTSDZ5b3o5UnJOOHhzY2s2?=
 =?utf-8?Q?qOBx6fJA0nQWHi81Ctk06M9PZ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3503f87-38cc-4e3f-dc72-08de07c47a40
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 06:15:58.0923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tc8Zu0bTkp6Iok40Yf0uKxe8cfVMGiCbgZ7tIVfWVS4U5CksP/YrrGx4yKyDoo3GOHh4y/TsGMrnhvHOr8zrPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_231626_091920_C033D2D8 
X-CRM114-Status: GOOD (  28.74  )
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

SGkgS3J6eXN6dG9mLAoKU29ycnkgZm9yIGJvdGhlcmluZyB5b3UgdW5pbnRlbnRpb25hbGx5LiBJ
IGhhdmVuJ3QgZnVsbHkgdW5kZXJzdG9vZApzb21lIG9mIHRoZSBkZXRhaWxzIHlldCwgSSdsbCBk
byBteSBiZXN0IHRvIHdvcmsgdGhyb3VnaCB0aGVtLgoKVGhhbmtzIGFnYWluIGZvciB5b3VyIHJl
bWluZGVyLgoKT24gMTAvMTAvMjAyNSAxMDo0MiBBTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBPbiAxMC8xMC8yMDI1IDA0OjM4LCBDaHVhbiBM
aXUgd3JvdGU6Cj4+IEhpIEplcm9tZSwKPj4KPj4KPj4gT24gMTAvOS8yMDI1IDM6NTkgUE0sIEpl
cm9tZSBCcnVuZXQgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiBUaHUg
MDkgT2N0IDIwMjUgYXQgMTE6MDksIENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPiB3
cm90ZToKPj4+Cj4+Pj4gSGkgSmVyb21lLAo+Pj4+Cj4+Pj4gICAgICAgVGhhbmtzIGZvciB5b3Vy
IHJldmlldywgYmVjYXVzZSB0aGUgbmF0aW9uYWwgZGF5IGhvbGlkYXlzIGRpZCBub3QKPj4+PiB0
aW1lbHkgZmVlZGJhY2suCj4+Pj4KPj4+Pgo+Pj4+IE9uIDEwLzEvMjAyNSAzOjQ1IFBNLCBKZXJv
bWUgQnJ1bmV0IHdyb3RlOgo+Pj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pj4KPj4+Pj4gT24g
VHVlIDMwIFNlcCAyMDI1IGF0IDE3OjM3LCBDaHVhbiBMaXUgdmlhIEI0IFJlbGF5Cj4+Pj4+IDxk
ZXZudWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4KPj4+
Pj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGluY2x1ZGVzIGNoYW5nZXMgcmVsYXRlZCB0byB0aGUgUExM
IGFuZCBwZXJpcGhlcmFsCj4+Pj4+PiBjbG9ja3MgZm9yIGJvdGggdGhlIEE0IGFuZCBBNSBTb0Nz
Lgo+Pj4+Pj4KPj4+Pj4+IFRoZSBwYXRjaGVzIGZvciBBNSB3ZXJlIHByZXZpb3VzbHkgc3VibWl0
dGVkIHVwIHRvIFYzIGJ5IFhpYW53ZWkuCj4+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNTAxMDMtYTUtY2xrLXYzLTAtYTIwN2NlODNiOWU5QGFtbG9naWMuY29tLwo+Pj4+Pj4g
QWZ0ZXIgZnJpZW5kbHkgY29vcmRpbmF0aW9uLCBJ4oCZdmUgdGFrZW4gb3ZlciBhbmQgY29udGlu
dWVkIHRoZQo+Pj4+Pj4gc3VibWlzc2lvbiBhcyBwYXJ0IG9mIHRoaXMgc2VyaWVzLiBUaGUgZHQt
YmluZGluZ3MgcGF0Y2ggcmV0YWlucyBSb2Incwo+Pj4+Pj4gb3JpZ2luYWwgIlJldmlld2VkLWJ5
IiB0YWcsIGFuZCBJIGhvcGUgdGhpcyBoYXNu4oCZdCBjYXVzZWQgYW55Cj4+Pj4+PiBhZGRpdGlv
bmFsIGNvbmZ1c2lvbi4KPj4+Pj4gLi4uIGFuZCB5ZXQgeW91IHJlc3RhcnQgdGhlIHZlcnNpb25p
bmcgb2YgdGhlIHNlcmllcyBtYWtpbmcgaXQgaGFyZGVyCj4+Pj4+IGZvciBwZW9wbGUgdG8gZm9s
bG93IHRoYXQKPj4+Pgo+Pj4+IFNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZSBjYXVzZWQuIFRo
ZSBtYWluIGNoYW5nZXMgY29tcGFyZWQgdG8gdGhlCj4+Pj4gcHJldmlvdXMgdmVyc2lvbiBieSBY
aWFud2VpIGFyZSBpbiB0aGUgZHJpdmVyIHBhcnQuCj4+Pj4KPj4+PiBUaGUgZHQtYmluZGluZ3Mg
cGFydCBvbmx5IGhhcyBtaW5vciBtb2RpZmljYXRpb25zIGluIFtQQVRDSCAxNC8xOV0uCj4+Pj4K
Pj4+PiBUaGUgZHJpdmVyIHBhcnQgaGFzIHJlbGF0aXZlbHkgbGFyZ2VyIGNoYW5nZXMgYmVjYXVz
ZSBpdCBuZWVkcyB0byBiZQo+Pj4+IGJhc2VkIG9uIHRoZSBjb2RlIGJhc2UgeW91IHByZXZpb3Vz
bHkgc3VibWl0dGVkLgo+Pj4gSSdtIG5vdCBzZWVpbmcgYSBqdXN0aWZpY2F0aW9uIGZvciB0aGUg
bWVzcyBpbnRyb2R1Y2VkIGFuZCBJJ20gbm90Cj4+PiBsb29raW5nIGZvciBvbmUgdG8gYmUgaG9u
ZXN0Cj4+Cj4+Cj4+IFByZXZpb3VzbHksIEkgcHJvdmlkZWQgYSBiYXNpYyB2ZXJzaW9uIG9mIHRo
ZSBBNSBjbG9jayBkcml2ZXIgdG8KPj4gWGlhbndlaSwgYW5kIGhlIGhlbHBlZCBpbXByb3ZlIGl0
IGJlZm9yZSBzdWJtaXR0aW5nIGl0Lgo+Pgo+PiBYaWFud2VpIGhhcyBiZWVuIHJlc3BvbnNpYmxl
IGZvciB1cHN0cmVhbWluZyBtYW55IG9mIG91ciBtb2R1bGVzLgo+PiBTaW5jZSBjbG9jayBkcml2
ZXJzIHJlcXVpcmUgc2lnbmlmaWNhbnQgZWZmb3J0LCBJ4oCZbSBzaGFyaW5nIHRoZQo+PiB3b3Jr
bG9hZCBieSBzdWJtaXR0aW5nIHNvbWUgb2YgdGhlIGNsb2NrLXJlbGF0ZWQgcGF0Y2hlcy4KPj4K
Pj4gVGhlIHRocmVlIHZlcnNpb25zIHByZXZpb3VzbHkgc3VibWl0dGVkIGJ5IFhpYW53ZWkgbWFp
bmx5IGZvY3VzZWQgb24KPj4gaW1wcm92aW5nIHRoZSBkdC1iaW5kaW5ncyBiYXNlZCBvbiBSb2Li
gJlzIGZlZWRiYWNrLiBUaGUgZHJpdmVyIHBhcnQKPj4gcmVtYWluZWQgdW5jaGFuZ2VkLgo+Pgo+
PiBUaGUgZHJpdmVyIHBhcnQgaW4gbXkgY3VycmVudCBwYXRjaCBzZXJpZXMgaGFzIHVuZGVyZ29u
ZSByZWxhdGl2ZWx5Cj4+IGxhcmdlIG1vZGlmaWNhdGlvbnMgdG8gYWRhcHQgdG8gdGhlIGxhdGVz
dCBjb2RlIGJhc2UsIHNvIGNvbXBhcmluZyBpdAo+PiB0byB0aGUgcHJldmlvdXMgdmVyc2lvbnMg
bWF5IG5vdCBiZSB2ZXJ5IG1lYW5pbmdmdWwuCj4+Cj4+IElmIGl0J3MgbW9yZSBhcHByb3ByaWF0
ZSBmb3IgdGhlIEE1IGNsb2NrLXJlbGF0ZWQgcGF0Y2hlcyB0byBjb250aW51ZQo+PiBldm9sdmlu
ZyBiYXNlZCBvbiBYaWFud2VpJ3MgZWFybGllciB2MyBzZXJpZXMsIHBsZWFzZSBmZWVsIGZyZWUg
dG8KPj4gcG9pbnQgaXQgb3V0LiBJIHdpbGwgY29udGludWUgdG8gYXNzaXN0IFhpYW53ZWkgaW4g
Y29tcGxldGluZyB0aGUKPj4gc3VibWlzc2lvbiBvZiB0aGUgcmVtYWluaW5nIEE1IGNsb2NrIHBh
dGNoZXMuCj4+Cj4+Cj4+Pj4+PiBCb3RoIEE0IGFuZCBBNSBiZWxvbmcgdG8gdGhlIEF1ZGlvIHNl
cmllcy4gSnVkZ2luZyBieSB0aGVpciBuYW1lcywgb25lCj4+Pj4+PiBtaWdodCBhc3N1bWUgdGhh
dCBBNSBpcyBhbiB1cGdyYWRlIHRvIEE0LCBidXQgaW4gZmFjdCwgQTUgd2FzIHJlbGVhc2VkCj4+
Pj4+PiBhIHllYXIgZWFybGllciB0aGFuIEE0Lgo+Pj4+Pj4KPj4+Pj4+IFNpbmNlIHRoZXJlIGFy
ZSBkaWZmZXJlbmNlcyBpbiB0aGUgUExMcyBhbmQgcGVyaXBoZXJhbCBjbG9ja3MgYmV0d2Vlbgo+
Pj4+Pj4gdGhlIEE0IGFuZCBBNSBTb0NzIChlc3BlY2lhbGx5IHRoZSBQTEwpLCBhbmQgdGFraW5n
IGludG8gYWNjb3VudCBmYWN0b3JzCj4+Pj4+PiBzdWNoIGFzIG1lbW9yeSBmb290cHJpbnQgYW5k
IG1haW50YWluYWJpbGl0eSwgdGhpcyBzZXJpZXMgZG9lcyBub3QKPj4+Pj4+IGF0dGVtcHQgdG8g
bWVyZ2UgdGhlIHR3byBpbnRvIGEgc2hhcmVkIGRyaXZlciBhcyB3YXMgZG9uZSBmb3IKPj4+Pj4+
IEcxMkEvRzEyQi9TTTEuCj4+Pj4+IC4uLiBhbmQgd2UgZW5kIHVwIHdpdGggMTkgcGF0Y2hlcyBz
ZXJpZXMgd2hpbGUgaXQgY291bGQgYmUgc3BsaXR0ZWQgaW50bwo+Pj4+PiBtYW5hZ2VhYmxlIHNl
cmllcywgZm9yIGVhY2ggY29udHJvbGxlciBvZiBlYWNoIFNvQwo+Pj4+Cj4+Pj4gSSdtIG5vdCBz
dXJlIGlmIEkgdW5kZXJzdG9vZCB5b3UgY29ycmVjdGx5Lgo+Pj4+Cj4+Pj4gRG8geW91IG1lYW4g
dGhhdCBJIHNob3VsZCBzcGxpdCB0aGlzIHNlcmllcyBvZiAxOSBwYXRjaGVzIGludG8gbXVsdGlw
bGUKPj4+PiBwYXRjaCBzZXJpZXMgYW5kIHNlbmQgdGhlbSBzZXBhcmF0ZWx5PyBGb3IgZXhhbXBs
ZToKPj4+PiBzZXJpZSAxOiBBNCBTQ01JIGNsb2NrIGNvbnRyb2xsZXIgKGR0LWJpbmRpbmdzKQo+
Pj4+IHNlcmllIDI6IEE0IFBMTCBjbG9jayBjb250cm9sbGVyIChkdC1iaW5kaW5ncywgZHJpdmVy
LCBkdHMpCj4+Pj4gc2VyaWUgMzogQTQgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlciAoZHQt
YmluZGluZ3MsIGRyaXZlciwgZHRzKQo+Pj4+IC4uLiBBNSBzaW1pbGFybHk/Cj4+PiBUaGluZ3Mg
dGhhdCBkbyBub3QgYWN0dWFsbHkgZGVwZW5kcyBvbiBlYWNoIG90aGVyIG9yIHdoaWNoIGFyZSBu
b3QKPj4+IG1lcmdlZCB0aHJvdWdoIHRoZSBzYW1lIHRyZWUgc2hvdWxkIG5vdCBiZSBzZW50IHRv
Z2V0aGVyLiBUaGVyZSBpcwo+Pj4gbm90aGluZyBuZXcgaGVyZS4gU2FtZSBiYXNpYyByZW1pbmRl
cnMgb24gZWFjaCBzdWJtaXNzaW9uLgo+Pgo+Pgo+PiBTb3JyeSwgYnV0IEknbSBzdGlsbCBub3Qg
cXVpdGUgc3VyZSBpZiBJIHVuZGVyc3Rvb2QgeW91IGNvcnJlY3RseS4KPj4KPj4gVGhpcyBzZXJp
ZXMgb2YgMTkgcGF0Y2hlcyBtYWlubHkgZmFsbHMgaW50byB0aHJlZSBtYWpvciBjYXRlZ29yaWVz
Ogo+PiAqIE9wdGltaXplIFBMTCBkcml2ZXIKPj4gKiBQTExzIGFuZCBwZXJpcGhlcmFscyBmb3Ig
QTQKPj4gKiBQTExzIGFuZCBwZXJpcGhlcmFscyBmb3IgQTUKPj4KPj4gQXJlIHlvdSBzdWdnZXN0
aW5nIHRoYXQgdGhlIFBMTCBkcml2ZXIgcGFydCBzaG91bGQgYmUgc2VudCBhcyBhCj4+IHNlcGFy
YXRlIHBhdGNoIHNlcmllcywgd2hpbGUgdGhlIEE0IGFuZCBBNSBwYXJ0cyBzaG91bGQgc3RpbGwg
Zm9sbG93Cj4+IHRoZSBwcmV2aW91cyBBNS9DMy1zdHlsZSBzdWJtaXNzaW9uPwo+Pgo+IAo+IFBs
ZWFzZSByZWFkIHN1Ym1pdHRpbmcgcGF0Y2hlcywgc29jIG1haW50YWluZXIgcHJvZmlsZSBhbmQg
RFQgc3VibWl0dGluZwo+IHBhdGNoZXMgZG9jdW1lbnRzLiBZb3UgYXNrIHVzIHRvIHJlcGVhdCBz
YW1lIGtub3dsZWRnZSBtdWx0aXBsZSB0aW1lcy4KPiBJdCdzIHdhc3RlIG9mIG91ciB0aW1lLCBz
byB3ZSBoYXZlIGRvY3VtZW50ZWQgaXQgZm9yIHlvdXIgY29udmVuaWVuY2UuCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IEtyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
