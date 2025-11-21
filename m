Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD82CFA466
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Nov 2025 02:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkNm6VmyKmpY6cSY8wjXBr2/SfN5QjCm9gDTzIpdMfI=; b=vs129DXWfOadLonvxJfVT14rO3
	ALMlDKzEbCxL6GMCxip8PHkOcPzucD1gzbxw/lcXTunq1fxmItqNcipKUqQPA8UPDx+z2/Ofd6dWW
	N1bgMUEdu/hUrZhPfGmaBtwMoUwrZsrziMkskx9lyg7zfolwkYAcgg+PQW55eukWsxKdXQlKdGYb3
	vK5Y4FasDrsZvFrh/RYBHEyO6gCfdoEcqOTtXADlHkIEjUvRgvOJ4p3kcHES32F/3CedTDCFSwyso
	6fX0rFrwlwKqOSmITvkSfzk28ArcRRZC9Xq4C5omCpf3RuDzW8apZf4Vf7HD1QcLsNWidHOmzFC/U
	W4SfqURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHJH-00000007jRs-2big;
	Fri, 21 Nov 2025 02:55:43 +0000
Received: from mail-koreacentralazon11023115.outbound.protection.outlook.com ([40.107.44.115] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHJF-00000007jR5-072x;
	Fri, 21 Nov 2025 02:55:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc5c0lghkKOotUpRefgmU8+7JJTH3co9hVT9xpqKKWetPZVGI17J+F0lIF6ThdIzbW0c4VtZ9FdozAmHF4NSqF2q+kGL1uh02DdfMN8Sk5B4iUiaf6k5bwLJHMnkuZSN7g6lRQts4p+bpnez8+XOxn6NS4PpBpPJ/9Lc97sDiyBC9kXKN3CzJqbRBw4EQAlOhs7M6Uu0NWsI1+iTjcvWi1sobhMUUqdnsebEVO65ctudROQCD+idNIY+b2BUH5kxWOgsYLBIB958xxddiVdzxEPrGhDe24EGJzxPdqWPuniYRR34DtnLpFgbezgiCgVrS7XHSi4QcHH5GYQUcWV5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6bAiq3Ex2yizmgrTm2sbk8l0WQLVR0JX9Hc6yK9LF8=;
 b=Ndf7lMkoYXbtAb9KzR8SjA4SMzagTub3Il0Gg+DdzhcsRjGM04wYp23+BjKTQ1lj852T1teVhUK132Vvb0JdT79GNbb5wU2MnHUuqWmNGNaPNENpp8bfkd4RIC0ytgBfuqIyywjI3WT4mzSJA8L59BZ87PzhsSpvMaM/2j/UT2gkbToBqafFI8dYGNhO4oS9tlbA48Jh1iUi54fH5Mv0/NRpZMVTaCoTKuVrXv2WXU03zYqMCb/W4gA54ZbbbeMTtK6HH/PZ0zFX8zUyb0QPMd/FYSgEkDwzrMu/AMeJyo23rhW1BSLwbeWX0eRZFuT4oUKS4QWJNfBeJ2K+5WAkgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6bAiq3Ex2yizmgrTm2sbk8l0WQLVR0JX9Hc6yK9LF8=;
 b=R7PMvT+WYw546ngGd/XdaDWn1DBtJ7n9cx5CQrSB8jQmC+RNCwgzADyI9+9GE4EXo7adjrHnhFplKSSgBZ/Q2Slt5MM/OW/fRx8RuuRSyjdnV7HFZ0wWejwTmKt08zMNbAM6e8djMm2TDUm+wLeE3kvuS681EClGMvjDjwBQW6+m1XP9tTKdOSYOiiqkWXYQovS4ryXw1S2LBpNpIIzbd7sqKfn90AnRsA3fMpyr8C9Wc3EKss1uuvxENL8dYnD1HrivogXdq1c2zbCFnXS3OtR/5wr9W8Ws88r0/qx7HaPWp7a31lvOmfh/IlIqAon8/d2xkmdr1uPYWI7Wa1GQ1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by KUZPR03MB9382.apcprd03.prod.outlook.com (2603:1096:d10:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 02:55:29 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724%4]) with mapi id 15.20.9320.018; Fri, 21 Nov 2025
 02:55:29 +0000
Message-ID: <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
Date: Fri, 21 Nov 2025 10:55:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
From: Ao Xu <ao.xu@amlogic.com>
In-Reply-To: <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
X-ClientProxiedBy: TYCP286CA0258.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::6) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|KUZPR03MB9382:EE_
X-MS-Office365-Filtering-Correlation-Id: d40038ee-c9dc-46bb-2ba7-08de28a96dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|42112799006|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG1PTUl1cFloRFk3UFgzc21wV2ZVT1ZoSlFDRHlZOXBGVnh3UkQ5VGhxOVRC?=
 =?utf-8?B?clE0K3ZienBidjJoR2JDVjZtWG1lanUzTkMzR2RwOE8vS0c3cVp5ZG1ISmRU?=
 =?utf-8?B?a01JaFBoQVlGTXR5VTB1Mys4ZWtWalAzU2NySzBXSW1ubUdBSGJ1bUFvS3U1?=
 =?utf-8?B?am1CclZ4alRtV0ZkMnJPRVFiOUp4d2l1amVJN25ZUXNEbTJ2ZGJFL29HTHVr?=
 =?utf-8?B?OGVmSTdTSHEwUzQ5eWR5YmM3SnhVTUxWNkZ2S1V4enJjL3YrNk5HM0RkZjRC?=
 =?utf-8?B?ZXF5cWxndk1heWVIMUFOaithSFBsbGNhWXh2NXIxbDUyMU9RK3k2ZTNWREda?=
 =?utf-8?B?Q20xNFBIMEVWbFdkVEtyanJUdElnZEduMDlWdk44NXRrMWh0ZjdBWFA5RXVT?=
 =?utf-8?B?b3FaWHAwUXQweXNySFoxbk9WTFNqQytDV3NOV3c2aUErTnk5QWJhNUlvOVFR?=
 =?utf-8?B?TGFxcXFObmhPZDk2Q3ZZV295eXdmUmdLUklWeTF2UDF0OUhhcmdYMTJJY1pD?=
 =?utf-8?B?VjJjNmxXVWZDUUJBV3hXZnlPTWNPTkg3VlI0blkrMFZzc2ovbDYwYjBnQ2lW?=
 =?utf-8?B?M2xFdHJWOUxiaFAzamhrRzZUcUs3M2R4UUxBMk9aMk9tRERVSHpkUkVVWjA0?=
 =?utf-8?B?RFliRjlWdjB0cEV5dWlDcHNPQ0JYM2ZqdzlHdkp4bWdBZ1hiMXBLVmJScFJu?=
 =?utf-8?B?d1J1S3lHYWpiZTRJcXBqOUFxc1VSSTg3OXRreEV5M3ZRbndqYUZCVnhtSHd2?=
 =?utf-8?B?am9tZUtjMS8rZkxHMHQxTFBRek0rNVJNdzgyMGl4TmxyMmdYWUdSeHNZMXE2?=
 =?utf-8?B?dnE1TllTZDJudjVTaDBCRjYrYkpDWmZFSWZZOFdyeDVUaUpOQzFSd0NlT1gr?=
 =?utf-8?B?RDBnM0EwZ2JwRHVzd3ZCVlF3N2hFT2NqUVZ6UjFBMklBSjlRNkVVUzlqUFVK?=
 =?utf-8?B?M0NzK1lDcGI3Ym9leXhBU1gvNCtXUTNhWlpGSks3MGMxWHVpajNOcFF2em1Q?=
 =?utf-8?B?empyVklZVXM0eGtQWnhQQlJXd1ZBQ3pjZmEyNW1OdUJhM0lZSXcvWWxwd01j?=
 =?utf-8?B?c0lVZ3k3YmVxalNPSnJiVFpnK3Q1ZFVmSzBTZW1EZFlieEhiUEJqaEFHcXRv?=
 =?utf-8?B?bjZ2cy8wV1NOY2tic1BJUkF5cUlmTGJHTnlVYXdhZ29LeDJjVjFLVVFFTVk1?=
 =?utf-8?B?SjFzTnZ5NHNUVk1lNEg0MFpnNkZBcVF4UWllanY5Q2IrMjJIMy8yRE5VRmJZ?=
 =?utf-8?B?c3R0NVhxbS8zdGY0dG5RTTh2WVlENEJyUUg0VEc5ZUtjZ1czVE9zQnA0MWJV?=
 =?utf-8?B?T2R6Wk1sanNWeWEwa3U4NmFpZVZhOGg4U0ZWOGU2SUFGUXFkdXlQbVkvL1BZ?=
 =?utf-8?B?OU9neWlwQUhXWldqR1M5M0RYc2tpWG4wVXpmSlJpOTM1dnVsM2ZZdUhoWnF1?=
 =?utf-8?B?Rmc4UDkrcFBqRjBTSHNIK3k3SXd3ZFVlTmdsVGJJZ2c5YXE0eVNYRU9uM1FB?=
 =?utf-8?B?SXJZK1hUTkQxTWJ6cFRXNDZpbTZMcWRHZUd3VVdFYWtZU3A3QVJUaUtDY1U0?=
 =?utf-8?B?K1NjWVhuR1ppdDRLNWFldlZKOTF4UCs1eUYxeVcvRnZFTzBQVVEwVmRjZmd0?=
 =?utf-8?B?SkE0UXNSdm5KdHRONjhqZVc1YzU0M3NOdk1jM1A4Y0RPc2dYYThDck54Z2dM?=
 =?utf-8?B?TkVzaEl6TVYwZi9FQzFGRHp3R250ZDRETEZHYWRtYS9kU0ltWnZhUDJkVFE0?=
 =?utf-8?B?ZmxXRzI4c254NjJrdXJ2Vk1Tek1RNGxRcHpObzI1WUZJdk0yZ3BLSUJHRmpp?=
 =?utf-8?B?L0xGMG9JaXdSZ24rY0JBTXNlZlpjR1pQUjc2QnFKdFpzbU82dUlaMFN1bTEx?=
 =?utf-8?B?VUwxaC9wZXlXTExFQm45OUV0YzdhMWozZ0x0d3ZkOHJwZ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7155.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(42112799006)(13003099007)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGkrZXlBaXVTNFh5YkV3Q1BHOXkxTkdZREJaZE1vU3M5V09hdnU4eW5KeWNa?=
 =?utf-8?B?QjBJbnZxMUlwZkY4bWhXWkp2anBmbkR0N1hWSzUxS1FCdFhsZ2wwL0lENW9m?=
 =?utf-8?B?SW1BNzl4L0s3TC9SSjBrL0VIRGFBTVNUNzJmOXI0THRUWlJBRUlRKzRDci9C?=
 =?utf-8?B?OW9nRFBBYmJHN1VsL3JNd0loY0tvMWFwVFBHUVpsT0RMcXBXS3d4aWpHL3FG?=
 =?utf-8?B?bHNQWU5abURtcGFLM3dSV3NVTWgwWXJTa004eDVVYjFaU0RsVFZmMW50MEY2?=
 =?utf-8?B?R0N5RUM3RHVRTVlMeXFlZllkMDhTQ1pRUko1SUJwUzZtOStRNEYzaWdvRlU4?=
 =?utf-8?B?MWJ5aWIzSG9sQmtISG80Y1hLUS9kQ000Y2xmKzgzMm10UjhLaVNjM0hpemFD?=
 =?utf-8?B?V3lUSzJSZmxDaWI4Nk9KQ3hXbHhySTFBUGhuTUhuYnZuZ2tvbUI2d3owSWkr?=
 =?utf-8?B?SW9hL2VSMGM3eXVMUlhZNHQyV3BzaHIzOUlaVjM0Q3c2MEd0WjlPaWhXaWQ0?=
 =?utf-8?B?d0pYT2VpV01ya0kvdDVkM1JjbjJ3WnQzOGh2Y2lBU0pmdXdvMCt0bDhjVnlR?=
 =?utf-8?B?dDZSWEZJYjlRalFyZWs4STNPNTYyN3prZFIyL2Y1a3E4d3krS3R2YzlOTXB0?=
 =?utf-8?B?cFhDR2g4aGxHSmozWWFmTHQ1RUU1dEhqV0VZd0dzOFVsMWJpYzZEQW5BRHVX?=
 =?utf-8?B?eVc5eCt1cDByeFRYMVl6UitxQ1dlcGxFT2xLMW15YUhiZG9rSWd6K2o0QmFS?=
 =?utf-8?B?N3VSeDIzREVwZ2Y4MDhxbS9veFhCWmNIWjB4ZTdVTkx4Z2pFOTFEaVRrYSt4?=
 =?utf-8?B?L3NEYjhVc0NIVS9KQllWeWR1M3MwbHZwMU5MdzhoWEoxcFdRTVV2aVovS3Bh?=
 =?utf-8?B?MVlkQ2JTaHhWY1IxZTV6Y3Y0ODU3S1REc0NxMUxHYmYwM0R4ajEyemQ4Nk1C?=
 =?utf-8?B?K3dFcWhPam9zUUhBTVJPNU5BRjUydmpsbHRSL1dRSGx2QTgzRHF1NnVBTWpV?=
 =?utf-8?B?eW1KY1kyejBzWFRWNHg0V3MwY2N4Mzh2Q3pPS0QxTXJXRFpRdDVoOExKaTBm?=
 =?utf-8?B?R2pkU09CZVZxSXp5Zy9aVHk3K2JSRVlHN3lTMVM1dTZldWtKOEtPVkUyazVK?=
 =?utf-8?B?SkFuVXE1WHk3M1A1WTJPMTdMZ0FhbVVTR2VUYklIOXRLZkVNVGFXZTZsUU5B?=
 =?utf-8?B?eG5vWi9NKzdUajNzazl6ZmgzUEs0YlhONFZTaElST3hMdzVORmVmTDhOeUE1?=
 =?utf-8?B?MWZxVTMzNFBVS0VmWCtmZEZxazA2RzY4LzlMZ1I4Y2xYZWgwT1NES3ZOQnNG?=
 =?utf-8?B?Ly94QlR5eHNCaldLY21keVFNbUNPd000b2tMOThKWURlRHhkZmxRMTVtdGph?=
 =?utf-8?B?MWpkbm10UXdzWXduendMcTB4emk2VVJhWFM1Q0c5VEY5VFpMKzB6UlR0WHFh?=
 =?utf-8?B?ZmlOWWpxRmdObTV4WjhDSGpiTG1uZDVDYnNQVk53WGZDSzgxQkRyRVF1czI4?=
 =?utf-8?B?czN6aUFPSmJLQkc5SnFHNzNRRWI1K0tqQWN0NTMwMkUwb0txTlZzZGx1TWJv?=
 =?utf-8?B?czZ5bGc1Yzhzcmw4em1aR3VLVkFaOFBRSVVhdHVFYnpyK0d0OWM5SjJjb1Zn?=
 =?utf-8?B?LzZtZmliSEZkKzlmS1lDZ1ZnVmNnTzE3b2dUMnF0VzRqaEJkM1lhako2TDQ5?=
 =?utf-8?B?SXBQWk1IWUZ1ZHVGelFuYi93NlBmc3BjL2R3RnVMWU1xUi9ZVUdVZVRJNkw2?=
 =?utf-8?B?eHM5OHdNZWRadVBwZ3RFSTBuNG1JOHgxMHVOMnowSGJWUlpCK1RpMzYxc2ln?=
 =?utf-8?B?eWZEc1VQVm9HU3R3M3lSTXdwaFBOVlhUU2RtV0lMY1R5R0h6ZGM4WEd6L3Jo?=
 =?utf-8?B?RjYyT2gzS3J1Z1VBcUxOSEVFcjVobXJHMWdpMXd6c2RyMzRObXJ1MVpLVU53?=
 =?utf-8?B?b3JwcFJ0RFRrQUhpS2VQbytIVnE1bThoV1E5QkE3RE12QXU5djlpdHZuT2M3?=
 =?utf-8?B?YlRtMTNFc0JQUWpmei8rQlpHWjdWdE91SFdEWXdTTXl0TlJsNWMvdU81cjVE?=
 =?utf-8?B?MkgrT1g2VENzN0x2QWNweXJoVFFJRk03NllSQldqOG43TXRKdHNBaHN2cUZ4?=
 =?utf-8?Q?P6VmV6WdcNXAjBZsrFhdiONEo?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40038ee-c9dc-46bb-2ba7-08de28a96dc2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:55:29.1314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sv434kV8uKt/gC/SQPh4Un4sMWNBCvo75UN3KMI1BSz7xuo8jXIQkho3ByQQFBSuav/NEhi7rr3P24bla3/9Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_185541_217097_BBB7F63C 
X-CRM114-Status: GOOD (  21.56  )
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

SGkgUGlvdHLvvIwKCiDCoCDCoCBJIHdpbGwgY2hlY2sgdGhpcyBpc3N1ZQoK5ZyoIDIwMjUvMTEv
MTkgMTg6MjcsIFBpb3RyIE9uaXN6Y3p1ayDlhpnpgZM6Cj4gW1lvdSBkb24ndCBvZnRlbiBnZXQg
ZW1haWwgZnJvbSBwaW90ci5vbmlzemN6dWtAZ21haWwuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBp
bXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9u
IF0KPgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gUGxzIHNlZSBpbmxpbmUKPgo+PiBXaWFkb21v
xZvEhyBuYXBpc2FuYSBwcnpleiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4gdyBk
bml1IDE5IGxpcyAyMDI1LCBvIGdvZHouIDAzOjU3Ogo+Pgo+PiBIaSBQaW90ciwKPj4KPj4KPj4g
T24gMTEvMTgvMjAyNSAxMDo1MCBQTSwgUGlvdHIgT25pc3pjenVrIHdyb3RlOgo+Pj4gW1lvdSBk
b24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBwaW90ci5vbmlzemN6dWtAZ21haWwuY29tLiBMZWFy
biB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRl
cklkZW50aWZpY2F0aW9uIF0KPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4gQW8sCj4+PiBJcyB0
aGVyZSBhbnkgY2hhbmNlIHRvIGdldCB0aGlzIHM0IGRybSBoZG1pIHNlcmllcyBmb3IgY3VycmVu
dCA2LjE4Pwo+Pj4gKGkgdHJpZWQgYmFja3BvcnQgdGhpcyBzZXJpZXMgdG8gNi4xOCBidXQgaGF2
ZSBzb21lIGlzc3VlcyB3aXRoIHJlcGFyZW50IHZwdV8wX3NlbCB0byBzeXNjbGtfYl9zZWwpCj4+
IFdoeSBkbyB3ZSBuZWVkIHRvIHJlcGFyZW50IHZwdV8wX3NlbCB0byBzeXNjbGtfYl9zZWw/IGlz
IHRoZXJlIGFueQo+PiBiYWNrZ3JvdW5kIGhlcmU/Cj4gV2VsbCAtIGl0IGxvb2tzIGl0IGlzIGJl
Y2F1c2UgYnVnLi4uLgo+IE1hcnRpbiBCbHVtZW5zdGluZ2wgaGFkIHBlcmZlY3QgZXllIGFuZCBj
YXRjaCB0eXBvIGluIHBhdGNoIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDExMC1k
cm0tczQtdjEtMTEtY2JjMmQ1ZWRhYWU4QGFtbG9naWMuY29tLzoKPgo+IEJ5IHJlcGxhY2luZzoK
PiBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfRkNMS19ESVYz
PiwKPiA8MD4sIC8qIERvIE5vdGhpbmcgKi8KPiA8JmNsa2NfcGVyaXBocyBDTEtJRF9WUFVfMD4s
Cj4gPCZjbGtjX3BlcmlwaHMgQ0xLSURfRkNMS19ESVY0PiwKPiA8MD4sIC8qIERvIE5vdGhpbmcg
Ki8KPiA8JmNsa2NfcGVyaXBocyBDTEtJRF9WQVBCXzA+Owo+Cj4gd2l0aDoKPiBhc3NpZ25lZC1j
bG9jay1wYXJlbnRzID0gPCZjbGtjX3BsbCBDTEtJRF9GQ0xLX0RJVjM+LAo+IDwwPiwgLyogRG8g
Tm90aGluZyAqLwo+IDwmY2xrY19wZXJpcGhzIENMS0lEX1ZQVV8wPiwKPiA8JmNsa2NfcGxsIENM
S0lEX0ZDTEtfRElWND4sCj4gPDA+LCAvKiBEbyBOb3RoaW5nICovCj4gPCZjbGtjX3BlcmlwaHMg
Q0xLSURfVkFQQl8wPjsKPgo+IGRtZXNnIGlzIGxpa2UgdGhpcyBodHRwczovL3Rlcm1iaW4uY29t
LzYwMjAKPgo+IFNvIGknbSBnZXR0aW5nIGhkbWkgd29ya2luZyAtIGJ1dCBvbmx5IHdoZW4gZGV2
aWNlIGJvb3RzIF93aXRob3V0XyBjb25uZWN0ZWQgaGRtaSBhdCBib290IChhbmQgY29ubmVjdGVk
IGxhdGVyKQo+IElmIGhkbWkgaXMgY29ubmVjdGVkIGF0IGJvb3QgLSBib290IGhhbmdzIGF0Ogo+
Cj4gICAgICAwLjM0MTY3Nl0gbWVzb24tZHctaGRtaSBmZTMwMDAwMC5oZG1pLXR4OiBEZXRlY3Rl
ZCBIRE1JIFRYIGNvbnRyb2xsZXIgdjIuMDFhIHdpdGggSERDUCAobWVzb25fZHdfaGRtaV9waHkp
Cj4gWyAgICAwLjM0Mjc1MF0gbWVzb24tZHctaGRtaSBmZTMwMDAwMC5oZG1pLXR4OiByZWdpc3Rl
cmVkIERlc2lnbldhcmUgSERNSSBJMkMgYnVzIGRyaXZlcgo+IFsgICAgMC4zNDM2NjBdIG1lc29u
LWRybSBmZjAwMDAwMC52cHU6IGJvdW5kIGZlMzAwMDAwLmhkbWktdHggKG9wcyBtZXNvbl9kd19o
ZG1pX29wcykKPiBbICAgIDAuMzQ0ODMyXSBbZHJtXSBJbml0aWFsaXplZCBtZXNvbiAxLjAuMCBm
b3IgZmYwMDAwMDAudnB1IG9uIG1pbm9yIDAKPgo+IEZZSTogSXQgaXMgYWZ0ZXIgYXBwbHlpbmcg
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFtbG9naWMvY292ZXIv
MjAyNTAxMTAtZHJtLXM0LXYxLTAtY2JjMmQ1ZWRhYWU4QGFtbG9naWMuY29tLyBvbiBtYWlubGlu
ZSA2LjE4ICh3aXRoIHNvbWUgbXkgYWRqdXN0bWVudHMgb24gdGhpcyBzZXJpZXMgcmVxdWlyZWQg
YnkgY2hhbmdlcyBpbiA2LjE4KS4KPiBGb3IgVlBVIGNsayBjaGFuZ2VzIHNlZSBodHRwczovL2dp
dGh1Yi5jb20vd2FycG1lL21pbmlteXRoMi9ibG9iL21hc3Rlci9zY3JpcHQva2VybmVsL2xpbnV4
LTYuMTgvZmlsZXMvMDMxMi1kcm0tbWVzb24tYWRkLXZwdS1jbGstc2V0dGluZy1mb3ItUzQucGF0
Y2gKPiBJdCBpcyA2LjE4IGFkYXB0YXRpb24gb2YgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LWFtbG9naWMvcGF0Y2gvMjAyNTAxMTAtZHJtLXM0LXYxLTktY2JjMmQ1
ZWRhYWU4QGFtbG9naWMuY29tLwo+Cj4gQXMga2VybmVsIGhhbmdzIC0gaSBoYXZlIGxpbWl0ZWQg
Y2FwcyB0byBkcmlsbCB3aGVyZSByb290IGNhdXNlIGlzLgo+Cj4gTWF5YmUgYWJvdmUgaGFuZyBp
cyByZWFzb24gb2YgbXkgYmFja3BvcnRzIG9yIG1pc3NpbmcgYW55IHByZS1yZXEgcmVxdWlyZWQg
dG8gZ2V0IHM0IGRybSB3b3JraW5nPwo+IEFueXdheSAtIGl0IHdpbGwgYmUgZ29vZCB0byB0ZXN0
IHdpdGggdXBkYXRlZCB0byA2LjE4IHNlcmllcyBvZiBBZGQgRFJNIHN1cHBvcnQgZm9yIEFtbG9n
aWMgUzQgKHBsdXMgaW5mbyBhYm91dCBhbnkgcHJlLXJlcSByZXF1aXJlZCB0byBnZXQgczQgZHJt
IHdvcmtpbmcpCj4KPgo+PiBUaGUgdnB1X2NsayBvbiBTNCBkb2Vzbid0IHN1cHBvcnQgc3lzY2xr
X2Jfc2VsIGFzIG9uZSBvZiBpdHMKPj4gc2VsZWN0YWJsZSBjbG9jayBzb3VyY2VzLCBzbyB0aGlz
IHJlcGFyZW50IG9wZXJhdGlvbiB3aWxsIGRlZmluaXRlbHkKPj4gZmFpbC4gVGhpcyBoYXMgbm90
aGluZyB0byBkbyB3aXRoIHRoZSBrZXJuZWwgdmVyc2lvbi4KPj4KPj4+PiBXaWFkb21vxZvEhyBu
YXBpc2FuYSBwcnpleiBBbyBYdSB2aWEgQjQgUmVsYXkgPGRldm51bGwrYW8ueHUuYW1sb2dpYy5j
b21Aa2VybmVsLm9yZz4gdyBkbml1IDEwIHN0eSAyMDI1LCBvIGdvZHouIDA2OjM5Ogo+Pj4+Cj4+
Pj4gRnJvbTogQW8gWHUgPGFvLnh1QGFtbG9naWMuY29tPgo+Pj4+Cj4+Pj4gQWRkIGRldmljZXRy
ZWUgZG9jdW1lbnQgZm9yIFM0IEhETUkgY29udHJvbGxlcgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogQW8gWHUgPGFvLnh1QGFtbG9naWMuY29tPgo+Pj4+IC0tLQo+Pj4+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sIHwg
MSArCj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxt
ZXNvbi1kdy1oZG1pLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbAo+Pj4+IGluZGV4IDg0ZDY4YjhjZmNjYzg2
ZmQ4N2E2YTBmZDJiNzBhZjEyZTUxZWI4YTQuLjZlMGE4MzY5ZWVlOTE1ZmFiNTVhZjI0ZDQ1MGE2
YzQwZTA4ZGVmMzggMTAwNjQ0Cj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwKPj4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhk
bWkueWFtbAo+Pj4+IEBAIC01NSw2ICs1NSw3IEBAIHByb3BlcnRpZXM6Cj4+Pj4gICAgICAgICAg
ICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWd4LWR3LWhkbWkKPj4+PiAgICAgICAgLSBlbnVtOgo+
Pj4+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHctaGRtaSAjIEcxMkEgKFM5MDVY
MiwgUzkwNVkyLCBTOTA1RDIpCj4+Pj4gKyAgICAgICAgICAtIGFtbG9naWMsbWVzb24tczQtZHct
aGRtaSAjIFM0IChTOTA1WTQpCj4+Pj4KPj4+PiAgICByZWc6Cj4+Pj4gICAgICBtYXhJdGVtczog
MQo+Pj4+Cj4+Pj4gLS0KPj4+PiAyLjQzLjAKPj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+IGxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0Cj4+Pj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4g
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
