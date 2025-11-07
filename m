Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6946CCFA05
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Nov 2025 16:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4yTmjk3VKQq+RXWQGnkshvB95azAPOByPpZK55urOo=; b=kUb7IEIZTIgmxBJ1jbcS+rLAgP
	Amlb+EUjZOmjfxGKoo4XOlrFRSVhN6a4odb8+2tGNSH7A9MNORIX7Q1+orT7uy/1U5a7mHhizc5oW
	//TfD60Jmm3Sv/CMs+5UkXP6oUfNBL6I8J1pKoWA/VIEyPaufjutgmL70Cax+5tn2dSSSA6WZasbl
	AKfyYrNYTCSrBo0CEbvOBgRAsaHuxW9SsyoKorFmc6Ik061j5FvkwpCmhwFvz5w3M1Y8bqdt+mHzJ
	VSQTqgxmp2uWjvhxzxdmhAmr06q1XYZsRR/gD1amU2iD7Mn+NmaIAmfUBw2L30+fzOIlFQPpVAaB5
	id8R98RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPCf-0000000050B-29I9;
	Fri, 07 Nov 2025 16:20:45 +0000
Received: from mail-koreacentralazon11023111.outbound.protection.outlook.com ([40.107.44.111] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPCd-000000004yv-2bGW;
	Fri, 07 Nov 2025 16:20:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNSavJYp+PpcYg9AWQRE5gnYSVbMLpHxtm/sIDJX9uKTspYqN6QQTCWTE9KhWCl+eXreCbqaJHKOPOGYDbPofxUTmzPk5q3JMLexDWrk6ipJUr8f9ARcSWPicsoPQD+Q/3hmeVwi5Id2RFLAewYb68sgLsAa8XHW0ZCGZ0CkVWCQ+bHbWYTvOGyua5ddMvfzoiGSsfGvQkIR3mhPBl2Q61OvhCBITzYvEkK92Oz11SrXQQunIAWyTaBUoQ2xUxw04YVvN6CNdxj8QRzUbFTtWhyhae+Kyk3qx0rL0mCIvoXefezrJfX4EOKF5vi95qRDSLkXYNWhs7MkMTL4H7u52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Y13471qbTRUNnBppMM3NroIypPMTngKMmrh+DNU31k=;
 b=UZh2Rre+kKJXAM8zOxSBa+AJRQKSVx31rSHZTE/xSMwzU6/yvY3b3Chgduu0CaHgDuHCwkmO3dS9JdCe20yT/coRAsW7EgNglezP53T9O+Vjgb1DpBxVfLUY049HbxqtyZ+RTo/8hjHui3hmw6E6+16FXShvG9UsOWoC30MnWHfOQ7md9PNT+VTbGZll5m46UoCxtNAXGVMvd3dbhhQt29kRYX6iOa8VvwdT3slNngr1OlBapwi1HSMq4ymo7i5JH6dyJllXW7cqh3nGDhB7aRCA2l86PBqX+la2TlcyDXNdfyitZmB1beNGXxGVFWZHDfdiXwL7ViEUszQAUU0wLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Y13471qbTRUNnBppMM3NroIypPMTngKMmrh+DNU31k=;
 b=g3TytzeGRlQmUqMzgoI7gB/pzc9z1OZxtMs6oZFA99D8Jljr58B0GTi50sqMN06Hpe47qgLvgqmvxNyRDXlYtORkhZSI3TI8q8FqwDC/T4Agpn9gLXSiXYQeX1JDF5AyIPwI/3oKAxkPfESfPemLHyOxJ+P3qBNpxTtelntPqKt1AvtuK6SL7B01LZoiGHxULSZrFURSGcKVj9iAoavSqHyzg2ZPY1SzHKOZDYSDeitO94GEjAQJHROBJ9asUDthIk2TpRdKyTZonMrgJ48FDsHYLJ5CsgXB6bTqHJNjggbPRLu9+qKL/yNIefjhVwBp2waNDhNb8JaKjMLLWv8FVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by JH0PR03MB8147.apcprd03.prod.outlook.com (2603:1096:990:39::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 16:20:34 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 16:20:33 +0000
Message-ID: <236a568d-c809-4dc7-be2f-e813d0d85368@amlogic.com>
Date: Sat, 8 Nov 2025 00:20:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] clk: meson: t7: add t7 clock peripherals
 controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20251030094345.2571222-1-jian.hu@amlogic.com>
 <20251030094345.2571222-6-jian.hu@amlogic.com>
 <1jbjlnxuug.fsf@starbuckisacylon.baylibre.com>
 <3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com>
 <1j1pmew1cu.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j1pmew1cu.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|JH0PR03MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: a171c256-9e09-489e-756d-08de1e19934a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUVwalhITTZSUmJNRmJTd1RzN0FJUTV6K2JiK1JGaEZrdy9xTHFvclZyZUYv?=
 =?utf-8?B?VXlpd2V3K25yQmFCd0M2Vk5OOVBNVmI2RHVJTEtxdnFxdnRQTVpWVktBcmZX?=
 =?utf-8?B?SUtlRThUTHBZOStMN2V2dTFOQnd6NUxpeFZQZWIvdXRBWUtOa2k2dngrSlFR?=
 =?utf-8?B?Y3JJbnZBR2EwcXNabTlWeUtSQ1JxY3VSenFUYyt6aUtBMm5BYno1bWM3RUZq?=
 =?utf-8?B?dnR3QWt5aGErU0kzS3NYOTBlbTFkR2cyYjF3Rk1mYkxLZjFqQ1JrZFI0NkF6?=
 =?utf-8?B?Yy9uVXdCWXovUUUrTUIzWjF4ZWJ3dXdUTzFsNnhLYTVyL1hxdllPS2oxY2RN?=
 =?utf-8?B?V2o5NXNiUThxUnl0eU02bkMwdlppWFhtVjVYSXdXSE5SaVJ1Y0R3cHB3Tk5Q?=
 =?utf-8?B?dS83MWFkbDdiYkNtVkNvSWlWMzBTUmFiNXpYS3AxV243TnZWdFhrMjdYS3dN?=
 =?utf-8?B?NUZKNmY0QmIzS2F1NXFUaUNHYUtIUjBoS3gyYUt2Zlg4STZneDFHcmtKVXk2?=
 =?utf-8?B?UUFUTjVVbWpPeTZIWjdtZ081Tkd4bE15MkR5OUludStwR2ZRUzU0Q09JSWdO?=
 =?utf-8?B?OWpZQUNaU0YzYU5NbDRXaEQwNXJQTGdoMURjMjAvd0Q3QUJNWGExSGxyU2cx?=
 =?utf-8?B?MFdRZ1ZpaWlISFRJSVN6cmp3YnVTRENNaVhZR0U1Q0loUys4RUJKdWdTRElx?=
 =?utf-8?B?THpxL2pXbURPRmhpUEJncVB5QklMSy9Jd1RRWmxHbEpnVGNnbm9vUVdQR2pF?=
 =?utf-8?B?d202WllsbUhFakkyd0dyb1BCQUFpN0p5YXZpOFhoaWJOQmFkZTh0YXEzZU84?=
 =?utf-8?B?TTlDSjJOV083YmRwbUQzMDB3MmQxay8xVEdzNkg5V3ZaVzZtOE42bUhlN29u?=
 =?utf-8?B?ZWQzQ0swaVUzamU5WkxoV3dNWlAxeHJsUVVFb0lVR25aaHVNd3hZeWEyQmpp?=
 =?utf-8?B?N2dIU3N1aVVlOGJjZXVNT3J1QjRZRUxIZDhjV29tRXBFYmFZNTQvUVNPdlk3?=
 =?utf-8?B?bWN3dEp5SGd0YUpRNVpHY1ZaREd3alByc3NsWHlBSG5YNVJWS1E5Szh1a2Vn?=
 =?utf-8?B?LzJ6elFKbTRFNTVnV2JEdTZRL0kzci8yVGRZRTQwalVreUd3c25VbDBpbWJF?=
 =?utf-8?B?TEVxN2ZORFdiRGhBSS82dk5GbFJNamNpVEJRd0tPNmJSTmUyMVNYR2JYTmw1?=
 =?utf-8?B?QnFtM29ldzFpcDg0ZHB6Y2UvMU9Gdjk5Q1VHc25VZGtHeUUvQlp3VTMxMjdz?=
 =?utf-8?B?Z0FpZGkwWHA0M2NtellvK2VndzU3RDhmMXpLZVR3dWRhL21WZUJpdHZRS2pH?=
 =?utf-8?B?SUQvTjUxZlNJbEhtbk4zNXcrZVB4WktCakRucitweFgrY2hUMXE2QjQyOHpn?=
 =?utf-8?B?ZGF3YVg5UE1PQy9PY1RiS29FTXJQNGc3Mk1PMU1uRHE0SS9KOE5GcTZDS1Rz?=
 =?utf-8?B?emYzQ3VnbGpZdWUvb3ZuM09VNFlpMTlKQWtWNlBJK2wyZDY3bjZxRDZSbGxZ?=
 =?utf-8?B?aUtWUHFvS2lEZ0NKSm9ETDg1RzVhcE8wYW92VGxlVFkrZkJXbWtuR3p6Szdl?=
 =?utf-8?B?V25VR0ZWUDh3Zm0zVW5hK2FKajhmTmhiV25oRTdRZXdHMEhyZVVFaVVRYjdL?=
 =?utf-8?B?UTJYM2ZxNmNLQlpIbXl1d3EwSFlQa2FpVHVrK2d4dk52bFZkZzM4cklhNDdS?=
 =?utf-8?B?TUtlVUJCakFZdndvSGg2czAyMXVYNzVnUGZueW1CdktwVGpLb3l3SnExS2hr?=
 =?utf-8?B?VUxCdnp1TnhQdFg3OWszUGlwdG9xbHBOYVlOdFMwWDNXL1FDRHl0bm45bGFj?=
 =?utf-8?B?ckZDaG10SVhkTlhBd2g0V0FubS9sWHUvczd3VFlpV3ROYzF2VTl5dUpiSWZN?=
 =?utf-8?B?MkNRd2pVTFFzYU5tKytXdDZkZWlJS1VYWmFvbG56NDl0eW5GUFdEdWpSOHZH?=
 =?utf-8?Q?cRpMTTlcqnioY1jwY1ORIAXdFqEg7onn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE1iREVXMG9UbitNWkNGN0J5b3Zld0crNHdNeHNkemVZR2RxbjRRVWRpNmZq?=
 =?utf-8?B?WTRtQmUzMUJrUHBVQ1ZYMEVoZGNLTXBXMEhuTGtoRmJoVkFDK0VoNS9oQUlJ?=
 =?utf-8?B?RFlkR2xJcDhWMURheTIzMzgzZWg4SlQ3NjUzYlkyQXVVZzBuTWg1YW96OWZJ?=
 =?utf-8?B?NWd2Y1gwZURKekt3S0h2WW1VV1VOZUlpSWR1SEZ6bG9haXptWms5T2twL1lM?=
 =?utf-8?B?L01YbHF0Ry9TTXNmZmZybmp2Y1F0L1FJSDJTems1cEdEeFQ1K1RxUW1YbG5v?=
 =?utf-8?B?NWcyV3VQbS84V0VFS0FJODRWYXZ1alZPNGZDSmZubGthU211UEFqOVpuTnJq?=
 =?utf-8?B?VFA3RE5XSXBENUV5bVF2ZlV2VytobUI0NEJrVnVCTkRQQmRVcjdYcytaYm11?=
 =?utf-8?B?NGFxK1c3M1dpclBtR0YzZ1pkU2pobHUxU2FyRmZqZ01kUXBvRXBuQWNJTmsy?=
 =?utf-8?B?WDdKRjltZTF5S0thMFNXMHFTRThUMVV1Z2NWK2FZcG1RYndhOUxvOCtTZEZR?=
 =?utf-8?B?SHdJaThDYmRrNXZrdEtmS2JIZ1lrSW1tZHkxVkk4TDE4T0ttbnUrWHF4NG1n?=
 =?utf-8?B?RUdJSG84clJrdTNKYjIwZW1aWHQvR1NKclA4T2pTY29JbkladmJZZVNZYmpF?=
 =?utf-8?B?TmJsemV3T01YVHY5a1FzNU45VGM3TFVrdGlZTDNVdURaTEdBZ1czNWZFM0xX?=
 =?utf-8?B?RVIvUGFzbjNUVFRLTU50REgrR3JNNlRWbHRINWcyUU1YOEg0eHpMZHRJMFZR?=
 =?utf-8?B?Q003OVZINTdiK09ZTUtLRVpqTERXemJhbytEUmJ1VUpWTC9JYkMvWVhYTkRH?=
 =?utf-8?B?aTZ5eWF5b1FIMlhESHRGV29DUTd0eGxRSkV0c3MzUHJFYnZaUXVQRUV6eWF6?=
 =?utf-8?B?dUNvdkpySnhUUVMvMlNqU3BXUUNFUTVKM3ljdnlUYWE5M1ZZOE9MOXlGVEl6?=
 =?utf-8?B?Qmc5WWEwUWlIZkk1ZHpRdVNsdkVxU1FiRC82QUZWcFkzaysvYXRVb3JNRHI3?=
 =?utf-8?B?SGM0TElMOXV1aTJnWEtHZHZLTnlyTHJxSlVWS2FEZlRVanV4ZFk5M2N4T1Mw?=
 =?utf-8?B?dkpTREI0Y2ZDUEdNYW9ZS09EaG5FNVN4QytsVjNhQWg1V2M0YmFyMEEyNmhM?=
 =?utf-8?B?NDhhQzBNMkxhdmdIbCtmVVJ0TGtlS1haNHh3dWJMOTFEYjJZR2ZPdmlMNndN?=
 =?utf-8?B?ejNtamRuTjQvSGVxNlAxYkQ5Mzd4Z29FbUZVcDlnc21TNzFQcHVZV3hhVVBT?=
 =?utf-8?B?eGJRSVdQYkZ6ZmJWcTRDZ2huVEFUMWlJakNidGZJRzdEcW12UHJJdWphdW94?=
 =?utf-8?B?NG9reklUTHlNZUJDaVdodU5IOUhIRjBDVmd3V0pUbkFUbVJpSFVWTk16Sk1p?=
 =?utf-8?B?bjNkMmo2Yk1CTU5TV1ZidVkyQmVDeG80ZENiWXozbTNMRFFhYTNYNUdXK2JW?=
 =?utf-8?B?VkcrZm80dHlreno5UXd3d0JqVUN1TVdmUEpSUnR4ZVBqcW4yMmRSemowYUlt?=
 =?utf-8?B?bmZWdnh6eUN1YmRPanJkVnNUMDAwT1JrcW9xYmJOY0V6ZGVvbzFQZVZYRkNO?=
 =?utf-8?B?dVZ0aFJHYnlObW0wY0FTa1YvN0ZGa1RiWXM4UUlZVUZoSlVtbHIwek1VWDRi?=
 =?utf-8?B?ZTRZZ0pya0phbitsUDFudU10RjdjMVlVdjQvY3pLd1UrY3lWa1MwbHYvTW1I?=
 =?utf-8?B?S25IOERUOXNGOXp6czEwRG1Sb1VIZWRhZHhyMmFGZWdPRERnYkdqYnhvT3Rk?=
 =?utf-8?B?dlduTmt0WUtaYUhKTEZLeERaNW5qWXF5UmNXOHhoT2NZckY1VHhTc1FmWW81?=
 =?utf-8?B?Wm9jTkFRZzFoL1NNNU5XMGZNWlN6cXNUcXZNUXZNRkNzV3VyZWlsWVppY2E4?=
 =?utf-8?B?RTZJeXhtYi9UR1g1aDRPNElTcTQySjFQVmZLTi8yWGloYU5FQkd4bGtHSUxR?=
 =?utf-8?B?YUhWOUNLSGRzcEhFdXpjY3lBT0ZVTTlONXRkeHNDTG9JMjlUbGZOMFNFd2tN?=
 =?utf-8?B?d0tVdTBHdXdmSm9Md3E2WGlYQlczNXdwYVNhWUFrU0NnNXIwcGFHUUI2UVo2?=
 =?utf-8?B?SmJESCtpRGw3bVJhVTJaektNZ2tlUUlXa2ZUZDhiZi9CZCtGYnhESUVuSFVH?=
 =?utf-8?B?YXhOYmkrdkc1a1IzdFl4UnNXTXJ3OTNVWWloSmYvMUVheDYrV29hM3M4ZGtz?=
 =?utf-8?Q?zejCWXunw1JaRudsEMs8spFbD0oily1iUHIZKZJ8S9iB?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a171c256-9e09-489e-756d-08de1e19934a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 16:20:32.9779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zg221Lc3G6rGYulgIYLTh72CMZn6Qij7fx6Uc983ZDoIBn+vtA0Y4lkSRDfgfM1lqcuOV5OJ1Dc7ejH1seM5Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_082043_694699_02C0840F 
X-CRM114-Status: GOOD (  16.11  )
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

Ck9uIDExLzQvMjAyNSA2OjE0IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gT24gVHVlIDA0IE5vdiAyMDI1IGF0IDE3OjE3LCBKaWFuIEh1IDxqaWFuLmh1
QGFtbG9naWMuY29tPiB3cm90ZToKPgo+Pj4+ICsKPj4+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVn
bWFwIHQ3X2RzcGEgPSB7Cj4+Pj4gKyAgICAgLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX211
eF9kYXRhKXsKPj4+PiArICAgICAgICAgICAgIC5vZmZzZXQgPSBEU1BBX0NMS19DVFJMMCwKPj4+
PiArICAgICAgICAgICAgIC5tYXNrID0gMHgxLAo+Pj4+ICsgICAgICAgICAgICAgLnNoaWZ0ID0g
MTUsCj4+Pj4gKyAgICAgfSwKPj4+PiArICAgICAuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0
X2RhdGEpewo+Pj4+ICsgICAgICAgICAgICAgLm5hbWUgPSAiZHNwYSIsCj4+Pj4gKyAgICAgICAg
ICAgICAub3BzID0gJmNsa19yZWdtYXBfbXV4X29wcywKPj4+PiArICAgICAgICAgICAgIC5wYXJl
bnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7Cj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICZ0N19kc3BhX2EuaHcsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICZ0N19kc3Bh
X2IuaHcsCj4+Pj4gKyAgICAgICAgICAgICB9LAo+Pj4+ICsgICAgICAgICAgICAgLm51bV9wYXJl
bnRzID0gMiwKPj4+PiArICAgICAgICAgICAgIC5mbGFncyA9IENMS19TRVRfUkFURV9QQVJFTlQs
Cj4+Pj4gKyAgICAgfSwKPj4+PiArfTsKPj4+PiArCj4+Pj4gLi4uLi4uCj4+Pj4gKwo+Pj4+ICtz
dGF0aWMgc3RydWN0IGNsa19yZWdtYXAgdDdfYW5ha2luXzAgPSB7Cj4+PiBOaXRwaWNrOiBmb3Ig
dGhlIERTUCBpdCB3YXMgYS9iLCBoZXJlIGl0IGlzIDAvMQo+Pj4gQ291bGQgeW91IHBpY2sgb25l
IHdheSBvciB0aGUgb3RoZXIgYW5kIHN0aWNrIHRvIGl0ID8KPj4KPj4gb2sgLCBJIHdpbGwgdXNl
IDAvMSBmb3IgRFNQLgo+IEkgdGhpbmsgSSBwcmVmZXIgYS9iIGlmIHlvdSBkb24ndCBtaW5kLiBz
ZWUgYmVsb3cgZm9yIHdoeSAuLi4KCgpNYWxpIGlzIG5hbWVkIGFzIG1hbGlfMCwgbWFsaV8xIGlu
IHRoaXMgZHJpdmVyLsKgIMKgQW5kIEcxMkEvUzQvR1hCQiAKc2VyaWVzIGRvIHRoZSBzYW1lLgoK
SWYgdGhleSBhcmUgbmFtZWQgYXMgYW5ha2luX2EgYW5kIGFuYWtpbl9iIGhlcmUsIHRoZXJlIHdp
bGwgYmUgdHdvIApuYW1pbmcgbWV0aG9kcy4KClNoYWxsIHdlIGtlZXAgY29uc2lzdGVudCA/CgoK
SWYgdXNlIDAvMSB0byBuYW1lIHRoZW0uCgpkc3AgY2xvY2tzIGFyZToKCiDCoCDCoCBkc3BhXzBf
c2VsCgogwqAgwqAgZHNwYV8wX2RpdgoKIMKgIMKgIGRzcGFfMAoKIMKgIMKgIGRzcGFfMV9zZWwK
CiDCoCDCoCBkc3BhXzFfZGl2CgogwqAgwqAgZHNwYV8xCgogwqAgwqAgZHNwYl8wX3NlbAoKIMKg
IMKgIGRzcGJfMF9kaXYKCiDCoCDCoCBkc3BiXzAKCiDCoCDCoCBkc3BiXzFfc2VsCgogwqAgwqAg
ZHNwYl8xX2RpdgoKIMKgIMKgIGRzcGJfMQoKCmFuYWtpbiBjbG9ja3MgYXJlOgoKIMKgIMKgIGFu
YWtpbl8wX3NlbAoKIMKgIMKgIGFuYWtpbl8wX2RpdgoKIMKgIMKgIGFuYWtpbl8wCgogwqAgwqAg
YW5ha2luXzFfc2VsCgogwqAgwqAgYW5ha2luXzFfZGl2CgogwqAgwqAgYW5ha2luXzEKCiDCoCDC
oCBhbmFraW5fMDFfc2VsCgogwqAgwqAgYW5ha2luCgoKSWYgdXNlIGEvYiB0byBuYW1lIHRoZW0u
Cgpkc3AgY2xvY2tzIGFyZToKCiDCoCDCoCBkc3BhX2Ffc2VsCgogwqAgwqAgZHNwYV9hX2RpdgoK
IMKgIMKgIGRzcGFfYQoKIMKgIMKgIGRzcGFfYl9zZWwKCiDCoCDCoCBkc3BhX2JfZGl2CgogwqAg
wqAgZHNwYV9iCgogwqAgwqAgZHNwYl9hX3NlbAoKIMKgIMKgIGRzcGJfYV9kaXYKCiDCoCDCoCBk
c3BiX2EKCiDCoCDCoCBkc3BiX2Jfc2VsCgogwqAgwqAgZHNwYl9iX2RpdgoKIMKgIMKgIGRzcGJf
YgoKCmFuYWtpbiBjbG9ja3MgYXJlOgoKIMKgIMKgIGFuYWtpbl9hX3NlbAoKIMKgIMKgIGFuYWtp
bl9hX2RpdgoKIMKgIMKgIGFuYWtpbl9hCgogwqAgwqAgYW5ha2luX2Jfc2VsCgogwqAgwqAgYW5h
a2luX2JfZGl2CgogwqAgwqAgYW5ha2luX2IKCiDCoCDCoCBhbmFraW5fYWJfc2VsCgogwqAgwqAg
YW5ha2luCgoKV2hpY2ggb25lIGlzIGJldHRlcj8KCj4+Pj4gKyAgICAgLmRhdGEgPSAmKHN0cnVj
dCBjbGtfcmVnbWFwX2dhdGVfZGF0YSl7Cj4+Pj4gKyAgICAgICAgICAgICAub2Zmc2V0ID0gQU5B
S0lOX0NMS19DVFJMLAo+Pj4+ICsgICAgICAgICAgICAgLmJpdF9pZHggPSA4LAo+Pj4+ICsgICAg
IH0sCj4+Pj4gKyAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKSB7Cj4+Pj4g
KyAgICAgICAgICAgICAubmFtZSA9ICJhbmFraW5fMCIsCj4+Pj4gKyAgICAgICAgICAgICAub3Bz
ID0gJmNsa19yZWdtYXBfZ2F0ZV9vcHMsCj4+Pj4gKyAgICAgICAgICAgICAucGFyZW50X2h3cyA9
IChjb25zdCBzdHJ1Y3QgY2xrX2h3ICpbXSkgeyAmdDdfYW5ha2luXzBfZGl2Lmh3IH0sCj4+Pj4g
KyAgICAgICAgICAgICAubnVtX3BhcmVudHMgPSAxLAo+Pj4+ICsgICAgICAgICAgICAgLmZsYWdz
ID0gQ0xLX1NFVF9SQVRFX0dBVEUgfCBDTEtfU0VUX1JBVEVfUEFSRU5ULAo+Pj4+ICsgICAgIH0s
Cj4+Pj4gK307Cj4gWy4uLl0KPgo+Pj4+ICsKPj4+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFw
IHQ3X2FuYWtpbl9jbGsgPSB7Cj4+Pj4gKyAgICAgLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFw
X2dhdGVfZGF0YSl7Cj4+Pj4gKyAgICAgICAgICAgICAub2Zmc2V0ID0gQU5BS0lOX0NMS19DVFJM
LAo+Pj4+ICsgICAgICAgICAgICAgLmJpdF9pZHggPSAzMCwKPj4+PiArICAgICB9LAo+Pj4+ICsg
ICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkgewo+Pj4+ICsgICAgICAgICAg
ICAgLm5hbWUgPSAiYW5ha2luX2NsayIsCj4+PiBBZ2Fpbiwgbm90IGEgZ3JlYXQgbmFtZSwgZXNw
ZWNpYWxseSBjb25zaWRlcmluZyB0aGUgb25lIGFib3ZlLgo+Pj4gSXMgdGhpcyByZWFsbHkgcmVh
bGx5IGhvdyB0aGUgZG9jIHJlZmVycyB0byB0aGVzZSAyIGNsb2NrcyA/Cj4+Cj4+IGJpdDMwIGdh
dGUgY2xvY2sgaXMgYWZ0ZXIgYml0MzEgbXV4IGNsb2NrLCAgYW5kIHRoZSBnYXRlIGNsb2NrIGlz
IHRoZSBmaW5hbAo+PiBvdXRwdXQgY2xvY2ssIGl0IGlzIHVzZWQgdG8gZ2F0ZSBhbmFraW4gY2xv
Y2suCj4+Cj4+IEkgd2lsbCByZW5hbWUgYml0MzEgYXMgYW5ha2luX3ByZSwgcmVuYW1lIGJpdDMw
IGFzIGFuYWtpbi4KPiBPayBmb3IgdGhlIGxhc3QgZWxlbWVudAo+Cj4gLi4uIGJ1dCBJIGRvbid0
ICBsaWtlICJfcHJlIiBmb3IgYSBtdXggc2VsZWN0aW5nIG9uZSB0aGUgMiBnbGl0Y2ggZnJlZQo+
IHBhdGguIEl0IGRvZXMgbm90IGhlbHAgdW5kZXJzdGFuZGluZyB0aGUgdHJlZS4KPgo+IEZvciBz
dWNoIG11eCwgd2hlbiBpdCBpcyBub3QgdGhlIGxhc3QgZWxlbWVudCwgSSB3b3VsZCBzdWdnZXN0
Cj4gIl9hYl9zZWwiIC4uLiBhdCBsZWFzdCBpdCBpcyBjbGVhciB3aGF0IGl0IGRvZXMgc28sICJh
bmFraW5fYWJfc2VsIiA/Cj4KCm9rLCBhbmFraW5fYWJfc2VsIGFuZCBhbmFraW4gZm9yIHRoZXNl
IHR3byBjbG9ja3MuCgoKTWF5YmUgYW5ha2luXzAxX3NlbCBhbmQgYW5ha2luIGZvciB0aGVzZSB0
d28gY2xvY2tzLCBpZiB5b3UgYWdyZWUgdG8gMC8xIApuYW1pbmcgY29udmVudGlvbi4KCj4+Pj4g
KyAgICAgICAgICAgICAub3BzID0gJmNsa19yZWdtYXBfZ2F0ZV9vcHMsCj4+Pj4gKyAgICAgICAg
ICAgICAucGFyZW50X2h3cyA9IChjb25zdCBzdHJ1Y3QgY2xrX2h3ICpbXSkgewo+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAmdDdfYW5ha2luLmh3Cj4+Pj4gKyAgICAgICAgICAgICB9LAo+Pj4+
ICsgICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gMSwKPj4+PiArICAgICAgICAgICAgIC5mbGFn
cyA9IENMS19TRVRfUkFURV9QQVJFTlQKPj4+PiArICAgICB9LAo+Pj4+ICt9Owo+Pj4+ICsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
