Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8475ACCFA18
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Nov 2025 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ub6BBrFms3JZZ3AjpcKwNxfDcfcF0xaKK7ew9r24g4o=; b=2cpgVg6XIDnc2E9cLhpKlSNUnG
	9HcD9TjlWd5BTmRQVFzmpL2EN9EzSN5XpEB+4vMbubg0mqClBNAJdaCBSp/63iYgCrqF3pO/tyfD7
	U5zyoSFlvDa5cmWg10h9QwVkfZhV8dql8EZLfRb3SWKFZZEmeRzqsF9+nzqw/dbLgggG2J9BD+9SF
	5Q2f13XNb2OWkV1RRga2FF9YpP9ZSO2fG7w78E+0dht/V15cL80yIRBnLswdw+LRwlfCOjRvr6Rj/
	len6nzeU/+vE2YagRY1yrYCEci2y2nZsSgcSb51Kg9JSI5eewwLVey5BvLubYghCzXewOO3U90vtz
	C7Hv5S2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJRxZ-0000000A12r-3ikL;
	Thu, 13 Nov 2025 07:41:37 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJRxW-0000000A12J-2NGf;
	Thu, 13 Nov 2025 07:41:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2uAj+KdE13clk4nb3Jm4dCCpBJjoax4fznF7iwdZpa2mHaNefAye66vNbXGaAbZ0uYtnzDQdo4M2Pmo8kkG6FjbPuP8L5cgYHi1AAa99uDVKBrJOMGLANYWQRsPw+zcfTpUvXhi1NjsNgtdpXT5qB2gnsyThldaRw+UY4s2tRTS7L8kACtfgh6bIUI1Y9U2/EcrqLs3JSEDfBqKLBXUCp5Bb+6ruLgE2QK+95HMiqdlckIuOhnRQbw73OHAACAtWlDtXRDIOu6fSA5W/U2nMw8xL6H1HfP5Ov8jkq8YVAc5lCdCklQCqiDTlu3r03fy4Ztv+zJsDuZGOCy0CnqKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyMqA0xtjftnJ8NAQOQ8JXn3JMd+9Ej8sF9X2axJRho=;
 b=r+fGzPXTrc3NPHKD24oKFbG/aOGQnbwebfOWile+USpZGMcq90mTQMn4qB9xn5zqKCDDlnGtKGx/qWUkOsWrKKKAAVYIlz7fHyXYMJDEzSSjamyfAtVOYJSfXDIFc0QxBIVZPF6KqdS5ttCVZvvFtSSW4O+j7LDHC1b8HASkrc67C9IGMQcj+q+13DClJyUylFrrCAWpOpxm5it0bDtGNDVuEzi8TZ6CqnRCpZDQitCJnro9qb2HWVgQQOxaoZIMd+fbb0SXsSRm+8uanNIFt1AO8d785F+nX/6ojQlLAqNgaF2UlcwPpZrvbDBcHE9WTyeTEhc4/S+1Fn2B/LN3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyMqA0xtjftnJ8NAQOQ8JXn3JMd+9Ej8sF9X2axJRho=;
 b=WjwT1yLdvBuAv0ljiXZe/cpqpRskPAU3mo3UtXhjgKQfI1Wpx7e8WHQAg+7bKm3VFeymw11mXuKkae7K5qY2AXGaarHqRakY7ZiA6P02hyISkYi0wicqbBSKO1zSPBwxMw9TOH1k+9gLdiobGpkQj9ha1E/z9aRyoLEM190ezD+N7+KJszSyUDfs1MB4OWcMndzrWURc8bnXGYciQmOC05tpaMcK/llUtDlFCnnSi0s+Re5T8NX9k6I/oP3mMw+ubxskqCS/0bL9hUIWsikST6/GQcQAV8Y0ih3bypY2ynWqwDLy30kBvNLr08q/4JsC0/TCPZsi1hOsoc6Do4QZ+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by JH0PR03MB7495.apcprd03.prod.outlook.com (2603:1096:990:9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 07:41:23 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:41:23 +0000
Message-ID: <f844390c-be5c-4dd3-b42a-416432832a54@amlogic.com>
Date: Thu, 13 Nov 2025 15:41:30 +0800
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
 <236a568d-c809-4dc7-be2f-e813d0d85368@amlogic.com>
 <1jv7jlvke8.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jv7jlvke8.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|JH0PR03MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a4a269-1a8c-4fb3-14bb-08de22880b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2dQdjRyeTF3TzkveUUvcWNhTEtraTl3TVVaQ1kyd3ZJNjFzT1Q0bXY5V2V5?=
 =?utf-8?B?TjZpTWtJUHBTL3NvbE43K3AvMG5ua1ZRMlI4aGFJSFR2ZTRRa2Fyd2FlOVZU?=
 =?utf-8?B?QjYwOFR5TEtKd1lUMUVaNGdoVTdwMjdIdzNSZHpwcjR1Nm03c1lidTg2bDRp?=
 =?utf-8?B?QUs5UWJxTjZzMHNkRjlUalluVmthWmZGSkZrQ05yVjJxMFJCVkdkR2ZnOGVI?=
 =?utf-8?B?aWsrY1VtdzNUeWZzdXlMcGt6YWNYUzJJREJWSU1jQ252bU9YK3hLM1VkTUhp?=
 =?utf-8?B?QzVXOXlLa1VxcUxWdzZkRGZONERNcTJ6WVoybWd1a1hRMGNwdnlzWk1CSzc4?=
 =?utf-8?B?d0ZDWnNTTEtBTHZhNXR3R3h5UXZadlkzNjE5U3k4R20xdThPQW90aVozTWM5?=
 =?utf-8?B?S29tdUh1OTJQVkFrdit2NkpMK013dWM4N251TW9pTm1EQ01DQnpMUXVQTkxX?=
 =?utf-8?B?R0tzbUlSTzRjem1RSnlIeTlEcGZWSjRqTG5YUld2VHdRQ1EvaXhjTHNCOVA3?=
 =?utf-8?B?TUt5YzBqTGQrc2UyMjJ0SnF1bWhlOHkya2tWdGpXVm10NmU0VmYxa1V5ZU1w?=
 =?utf-8?B?UjJaS0hPdXVVMWlzMXo1Nng3ZkNyVnBXVmV6amtUN1V2TFNuYy8wci9mYURR?=
 =?utf-8?B?K3EybWM1S0tTQU9od25iZThlSGorYkZ5VWxDUmhIZWkxUDY3NUpmNENEdStZ?=
 =?utf-8?B?WUlZMW1iMW5LVkkxMWtOM2dTcTc2Y09FUFUxNE4ydFZWam9TZDhPcXhjQ2R2?=
 =?utf-8?B?T3hyeG51RFNoT1plWG0yY0dFai9wcnkyTFZKS3BlTFA1WGtzY2FpNEdPRU52?=
 =?utf-8?B?MDd0VFI3eUFKeHR4SVNEV254SmQrcDJGTXVzWVdNV2hVY0FTbnhzenh4Mm9B?=
 =?utf-8?B?WWtoLzNvVEhsK1N4c1gzUEk5c2RpdE1WRVB5alRpU05UWkRzNDM0dGR2UEJI?=
 =?utf-8?B?bDllODNYQk1RZ3pGVEtLTVVtNE40WkRlaVowZnE0UjhyN29LSTB3eHhTcGsv?=
 =?utf-8?B?RmF6dmduRWp6NXJyVlA0dmpVcCsvOXkxTC94VW9YSkhQdkRTd0lGeWNCMFIr?=
 =?utf-8?B?RDRxOGphU0Z6V3MwRGgvYUlFZkdsd0xneTZseGw2cEQyaXlWMTBSaFkxREZB?=
 =?utf-8?B?a2E2WXlVT1BIaXBDaktpdFRTTXgzV1RVcURXNHZqd1BRZS9wZ1lldGNPdlRM?=
 =?utf-8?B?MkhvbnpGamVFdTNnT1A4K1BkNWJRZ1FFZFZVaXNRU3ZielZySVJZbjlXbmxl?=
 =?utf-8?B?UnpLQ3FJNmRBUmtTdGNneG81Q3g2cHZSbGQvSnhoMUNqVkRNTFp5Z0ZKWjBr?=
 =?utf-8?B?TERlWE9uMlBJWTl3SUJIR2Ixd3hvRzU4TjlEMk44SzZpYUw1MzRpK1BEV0Z5?=
 =?utf-8?B?aXJrTGVvbEJwR1ZFSVMwazQxOFcvUE14L2p2L253YTVyQU95Ym9qUEFYd3Zz?=
 =?utf-8?B?bVZ1MDcwemZOaXJyWFk3cFpTMVRNOFFyVnFNTndwaXpuTUZvbjJjSGhHZElh?=
 =?utf-8?B?YUJkRzNxM2dWNHhRbXRJVmQxNGZ2SVhoNElnaEs3TzU5MjRXSGZuWjdxRnhz?=
 =?utf-8?B?Z0hSTWcvZDBJQ09nSHlCZDlxaWxiKzVXNmZSVWRnZTNPTW0veElxT0c0MnBF?=
 =?utf-8?B?ZkZRYWFmZmtDN1dicXB3cnB1ZUt5NEpGUzdJNnByWC9YVDlFaVBhLzBrcmZ5?=
 =?utf-8?B?TE1IUS96Ykx3ZHNUekpzdUZwLzQ2TXBJQk5PV0lSWDZKcGhvS0IrdmljVDAz?=
 =?utf-8?B?UlFHckpidXRnd1RIOHRjdkJmcTB3Y29NM0JrK0ozNnZlVU5mOEpjci90SUdx?=
 =?utf-8?B?Z21oTUZGRE51RC9XNld0bytMZVN6cjZDMjluN3ZmTFdZNitJdXdKbllEM1RZ?=
 =?utf-8?B?K2VkdVUyUzh0ckNBLzUzMCtiYUJvNGhqN1M4bGxEdlZTR3NYSFl0NExDVHpj?=
 =?utf-8?Q?NWMNHADu4n4/TRmIsJV/fBz1tEU/AQTi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFN4WitlWng1U1lMcmlJRkZqT1h4M2pmejVpT2JJMmJWd3huRi9aVXdUcWJE?=
 =?utf-8?B?SFVvUVh3VkNPOXY4VnBrRDlNcUxFVVIraENydkVWNHpVUFBUajU2S2R6ditO?=
 =?utf-8?B?MERZU2hQckYvNy9Ec3RVL2xZZmZqdTJZN1d6YSt5aGFIaHoyUTFsVDFJeTgy?=
 =?utf-8?B?MU44Y0VtUitOcUVTNUdiUUFVVllRV05oVkc4anVLL21hNlpKZm9iY2t0WHlz?=
 =?utf-8?B?c0tyd3ZBaUVSUXlWK0tpdVd4V2FFNW9pRjFqQ3NxNFdtYi9WSUJ6bWFPeU9n?=
 =?utf-8?B?ZFEySmhEaVAwdmlTVkxGelZrbzVvNXFNciswNjJCWTFZa0RhdFFtMzlVQlFv?=
 =?utf-8?B?Sm1TelpHUndaSVVEU3g5b3FWY1R5TWR3TlVRd0NucXdIYWVaQll6V21YdWFr?=
 =?utf-8?B?YXZ3Y2dkTEZuOWZ5OFlVUUIwRnRKZFc3UHNjNkJ6WTFGY25wVU8rZVVoVXJn?=
 =?utf-8?B?T3Y1MDZkS3l6eHpraUFCVFJqeTZPc2N0Rkp3ZkYyMEtnQTdVYlZXTVM0MVpJ?=
 =?utf-8?B?VkVTUEFFM1luakFQRXFZdkw3OFFkN0dvWmRmSWZNOWlKYytlMWlUaW1yU2E4?=
 =?utf-8?B?emR1MFNVRTZQb2k2WHhtMXpJZHllRjZRdXNUc0Q3L1RBSDJMUWhDQU1rayth?=
 =?utf-8?B?SVprNmpDLzlHcnZVL2xLVWZaRG1tK0s0bUtRU2QyTm9ZOUZDaUtwWGFXOEV4?=
 =?utf-8?B?VkFNNkpac0VZSWR1YTlGcjNkTFNSalFMekJQcVlRZ1NOSm1ucCsyNGFUL3kw?=
 =?utf-8?B?UCt6Y0hWREZqTldaWmQ3N1hLTnA5cU9yRVNWM3VNVFJodEFSQVZFSEIzM2lS?=
 =?utf-8?B?UEt4R1VFV1A4ZDRKNzBZNmIxdnpnRDN5WWZQYzRZNUJyanVQUG15cVNiWlZv?=
 =?utf-8?B?VWRsQWNjVHh6bTZLblNMTFJqc1JMVlBtZU9FVGNQMnpxMFV0di9Xc09XeXht?=
 =?utf-8?B?VExCc3pONitOK2JSWEVoT28rSkZMclRGUWJmTDZ0WGtUMjkzZUVielpTN3BM?=
 =?utf-8?B?NlVXU2VTNUp2TW8zeUJST25YdFZYaDJ1RHBjbTlsTnQxUTZLVjlBVzE1R3pt?=
 =?utf-8?B?RlVTdmFJdUJrRFBlV3ptSmlyaS9XQzR0aEdaRlJlVExsOERSRk1adjZFcXVq?=
 =?utf-8?B?bGMreGdxeWd4aTlEc1BpMGFRSnhzMXN6ZUhaVG1KaEVVa29zS0U5U0xnRU1u?=
 =?utf-8?B?QjdPMC8xOFd5U1Y4QTBySXdJVWx6Zng2SkRmMXJ1Wm9MZUdpMmVPRlFuVDRw?=
 =?utf-8?B?YjBZVmlyWmxNbGNhTlRnZGhCMTdWd014RUFrUmthZlVEenl0QTM2WUt5L29l?=
 =?utf-8?B?bXFpWGw2aENMR1ZvNkJ4MFE1aTFTR3RCQStuSjdka0JkRkovbGhWWk1XTE1O?=
 =?utf-8?B?ZTkrVHc0VXRrdEJpa2xqQk1Ba1JnOTJlMDFKcjd4SGo1OGxaeC9qeVFWUnlr?=
 =?utf-8?B?SGs4Q0ZhOWZQOGlKZy9qZTZmWHllVCtweEFnVzR0UkNobFhkVlBIQnJqdjNo?=
 =?utf-8?B?SkFHTkh5UkxiMkRxQUh2LzkzMFJINExyS0RIZkxPMUdZSlFRYXVDMDkzNVBT?=
 =?utf-8?B?Q3dUWEI3WW8rNEVRMlVKUnBNOEE2Z1poR2dyOHFvRjRVYjZSclVnOFRycG10?=
 =?utf-8?B?NFVvS0E4ZHZXRWw3U1dWanV3NGh6NXZ6NjV5TGZ5UnErdjc4WDgxUXgvL2Jq?=
 =?utf-8?B?Sm1kbUZzbzloRHdvYWFQaXcwNklNemFMZmZ5dnNocVhlczhNa2JRSmd4UnFw?=
 =?utf-8?B?cC8rYUJKQkZuQldBMVhGb1NERTlkUGZVT3p1ZTFKVHJidlZrbWxXTUsxQWtp?=
 =?utf-8?B?S2dPazVoL2cyVndWUERjdTY1Yk1lZkozaHBBMW9NYWt4L09jdFFzSllkYU5C?=
 =?utf-8?B?U2pQYVA1eEw4MGlCOXpmREQxK0o0VnNwcENTd0RNMlZlOVZPM0dQRjNCWEpw?=
 =?utf-8?B?bzZ6QXJMVmc3L3pFWG1nWFRkNVNpbS9TQUxVNjR5T1p4cERrMTdoeXhLK2xR?=
 =?utf-8?B?cm1Oa0R0TWZiSWd5TXMxUHkvZFRmaGtTS2lkcnR3eWZVRURCbUlHNTBKK05q?=
 =?utf-8?B?SGNZUjZsNkpiL3BVanJTb2ZkcTBKa1NRb3JIOFlGNm02SnNsWFVINDV0ZjU4?=
 =?utf-8?B?cGNibGJJUURRSjRhV3oxZ1o5dDlOb3g2LzhyOEFCaENpNkRYZ0YyS052V1hU?=
 =?utf-8?Q?9c1EE6XgFRAGIK20Wg+fa9vl39oVvyH0um/Bh+70dlhd?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a4a269-1a8c-4fb3-14bb-08de22880b36
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 07:41:23.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8U4TaD9kFENvsZ1bzPDP1oAQ94EZ9Dpw027GloMbKY7DBq+SK9eOWdsvK1vYk9ON1dbPQx3SqhfJUcsaIyoTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_234134_811093_7F1E5023 
X-CRM114-Status: GOOD (  18.70  )
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

Ck9uIDExLzgvMjAyNSAxOjEwIEFNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gT24gU2F0IDA4IE5vdiAyMDI1IGF0IDAwOjIwLCBKaWFuIEh1IDxqaWFuLmh1
QGFtbG9naWMuY29tPiB3cm90ZToKPgo+PiBPbiAxMS80LzIwMjUgNjoxNCBQTSwgSmVyb21lIEJy
dW5ldCB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9uIFR1ZSAwNCBOb3Yg
MjAyNSBhdCAxNzoxNywgSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Pgo+
Pj4+Pj4gKwo+Pj4+Pj4gK3N0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCB0N19kc3BhID0gewo+Pj4+
Pj4gKyAgICAgLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX211eF9kYXRhKXsKPj4+Pj4+ICsg
ICAgICAgICAgICAgLm9mZnNldCA9IERTUEFfQ0xLX0NUUkwwLAo+Pj4+Pj4gKyAgICAgICAgICAg
ICAubWFzayA9IDB4MSwKPj4+Pj4+ICsgICAgICAgICAgICAgLnNoaWZ0ID0gMTUsCj4+Pj4+PiAr
ICAgICB9LAo+Pj4+Pj4gKyAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKXsK
Pj4+Pj4+ICsgICAgICAgICAgICAgLm5hbWUgPSAiZHNwYSIsCj4+Pj4+PiArICAgICAgICAgICAg
IC5vcHMgPSAmY2xrX3JlZ21hcF9tdXhfb3BzLAo+Pj4+Pj4gKyAgICAgICAgICAgICAucGFyZW50
X2h3cyA9IChjb25zdCBzdHJ1Y3QgY2xrX2h3ICpbXSkgewo+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICZ0N19kc3BhX2EuaHcsCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgJnQ3X2Rz
cGFfYi5odywKPj4+Pj4+ICsgICAgICAgICAgICAgfSwKPj4+Pj4+ICsgICAgICAgICAgICAgLm51
bV9wYXJlbnRzID0gMiwKPj4+Pj4+ICsgICAgICAgICAgICAgLmZsYWdzID0gQ0xLX1NFVF9SQVRF
X1BBUkVOVCwKPj4+Pj4+ICsgICAgIH0sCj4+Pj4+PiArfTsKPj4+Pj4+ICsKPj4+Pj4+IC4uLi4u
Lgo+Pj4+Pj4gKwo+Pj4+Pj4gK3N0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCB0N19hbmFraW5fMCA9
IHsKPj4+Pj4gTml0cGljazogZm9yIHRoZSBEU1AgaXQgd2FzIGEvYiwgaGVyZSBpdCBpcyAwLzEK
Pj4+Pj4gQ291bGQgeW91IHBpY2sgb25lIHdheSBvciB0aGUgb3RoZXIgYW5kIHN0aWNrIHRvIGl0
ID8KPj4+PiBvayAsIEkgd2lsbCB1c2UgMC8xIGZvciBEU1AuCj4+PiBJIHRoaW5rIEkgcHJlZmVy
IGEvYiBpZiB5b3UgZG9uJ3QgbWluZC4gc2VlIGJlbG93IGZvciB3aHkgLi4uCj4+Cj4+IE1hbGkg
aXMgbmFtZWQgYXMgbWFsaV8wLCBtYWxpXzEgaW4gdGhpcyBkcml2ZXIuICAgQW5kIEcxMkEvUzQv
R1hCQiBzZXJpZXMKPj4gZG8gdGhlIHNhbWUuCj4gLi4uIEExIHVzZSBkc3BhX2EgZHNwYV9iIChl
dGMgLi4uKQo+Cj4+IElmIHRoZXkgYXJlIG5hbWVkIGFzIGFuYWtpbl9hIGFuZCBhbmFraW5fYiBo
ZXJlLCB0aGVyZSB3aWxsIGJlIHR3byBuYW1pbmcKPj4gbWV0aG9kcy4KPj4KPiBBbHJlYWR5IGhh
dmUgdGhhdCB1bmZvcnR1bmF0ZWx5Cj4KPj4gU2hhbGwgd2Uga2VlcCBjb25zaXN0ZW50ID8KPj4K
PiBQbGVhc2UgdHJ5IHllcwoKCm9rYXkswqAgSSB3aWxsIHVzZSAwLzEgdG8gbmFtZSB0aGVtLgoK
Pj4gSWYgdXNlIDAvMSB0byBuYW1lIHRoZW0uCj4+Cj4+IGRzcCBjbG9ja3MgYXJlOgo+Pgo+PiAg
ICAgIGRzcGFfMF9zZWwKPj4KPj4gICAgICBkc3BhXzBfZGl2Cj4+Cj4+ICAgICAgZHNwYV8wCj4+
Cj4+ICAgICAgZHNwYV8xX3NlbAo+Pgo+PiAgICAgIGRzcGFfMV9kaXYKPj4KPj4gICAgICBkc3Bh
XzEKPj4KPj4gICAgICBkc3BiXzBfc2VsCj4+Cj4+ICAgICAgZHNwYl8wX2Rpdgo+Pgo+PiAgICAg
IGRzcGJfMAo+Pgo+PiAgICAgIGRzcGJfMV9zZWwKPj4KPj4gICAgICBkc3BiXzFfZGl2Cj4+Cj4+
ICAgICAgZHNwYl8xCj4+Cj4+Cj4+IGFuYWtpbiBjbG9ja3MgYXJlOgo+Pgo+PiAgICAgIGFuYWtp
bl8wX3NlbAo+Pgo+PiAgICAgIGFuYWtpbl8wX2Rpdgo+Pgo+PiAgICAgIGFuYWtpbl8wCj4+Cj4+
ICAgICAgYW5ha2luXzFfc2VsCj4+Cj4+ICAgICAgYW5ha2luXzFfZGl2Cj4+Cj4+ICAgICAgYW5h
a2luXzEKPj4KPj4gICAgICBhbmFraW5fMDFfc2VsCj4+Cj4+ICAgICAgYW5ha2luCj4+Cj4+Cj4+
IElmIHVzZSBhL2IgdG8gbmFtZSB0aGVtLgo+Pgo+PiBkc3AgY2xvY2tzIGFyZToKPj4KPj4gICAg
ICBkc3BhX2Ffc2VsCj4+Cj4+ICAgICAgZHNwYV9hX2Rpdgo+Pgo+PiAgICAgIGRzcGFfYQo+Pgo+
PiAgICAgIGRzcGFfYl9zZWwKPj4KPj4gICAgICBkc3BhX2JfZGl2Cj4+Cj4+ICAgICAgZHNwYV9i
Cj4+Cj4+ICAgICAgZHNwYl9hX3NlbAo+Pgo+PiAgICAgIGRzcGJfYV9kaXYKPj4KPj4gICAgICBk
c3BiX2EKPj4KPj4gICAgICBkc3BiX2Jfc2VsCj4+Cj4+ICAgICAgZHNwYl9iX2Rpdgo+Pgo+PiAg
ICAgIGRzcGJfYgo+Pgo+Pgo+PiBhbmFraW4gY2xvY2tzIGFyZToKPj4KPj4gICAgICBhbmFraW5f
YV9zZWwKPj4KPj4gICAgICBhbmFraW5fYV9kaXYKPj4KPj4gICAgICBhbmFraW5fYQo+Pgo+PiAg
ICAgIGFuYWtpbl9iX3NlbAo+Pgo+PiAgICAgIGFuYWtpbl9iX2Rpdgo+Pgo+PiAgICAgIGFuYWtp
bl9iCj4+Cj4+ICAgICAgYW5ha2luX2FiX3NlbAo+Pgo+PiAgICAgIGFuYWtpbgo+Pgo+Pgo+PiBX
aGljaCBvbmUgaXMgYmV0dGVyPwo+IGEvYiBvciAwLzEsIHdlIGFscmVhZHkgaGF2ZSBib3RoCj4K
PiBQaWNrIHdoaWNoIGV2ZXIgc2NoZW1lIHlvdSBwcmVmZXIsIGp1c3Qgc3RpY2sgdG8gaXQgZnJv
bSBub3cgb24uCgoKb2theSzCoCAwLzEgYXJlIG1vcmUgY29tbW9ubHkgdXNlZCBpbiBBbWxvZ2lj
IGNsb2NrIGRyaXZlcnMuIEkgd2lsbCB1c2UgCnRoaXMgYXBwcm9hY2ggZm9yIFQ3IGFuZCBsYXRl
ciBTb0NzLgoKClRoYW5rcyBmb3IgeW91ciByZXBseS4KCj4+Pj4+PiArICAgICAuZGF0YSA9ICYo
c3RydWN0IGNsa19yZWdtYXBfZ2F0ZV9kYXRhKXsKPj4+Pj4+ICsgICAgICAgICAgICAgLm9mZnNl
dCA9IEFOQUtJTl9DTEtfQ1RSTCwKPj4+Pj4+ICsgICAgICAgICAgICAgLmJpdF9pZHggPSA4LAo+
Pj4+Pj4gKyAgICAgfSwKPj4+Pj4+ICsgICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRf
ZGF0YSkgewo+Pj4+Pj4gKyAgICAgICAgICAgICAubmFtZSA9ICJhbmFraW5fMCIsCj4+Pj4+PiAr
ICAgICAgICAgICAgIC5vcHMgPSAmY2xrX3JlZ21hcF9nYXRlX29wcywKPj4+Pj4+ICsgICAgICAg
ICAgICAgLnBhcmVudF9od3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsgJnQ3X2FuYWtp
bl8wX2Rpdi5odyB9LAo+Pj4+Pj4gKyAgICAgICAgICAgICAubnVtX3BhcmVudHMgPSAxLAo+Pj4+
Pj4gKyAgICAgICAgICAgICAuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfR0FURSB8IENMS19TRVRfUkFU
RV9QQVJFTlQsCj4+Pj4+PiArICAgICB9LAo+Pj4+Pj4gK307Cj4+PiBbLi4uXQo+Pj4KPj4+Pj4+
ICsKPj4+Pj4+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgdDdfYW5ha2luX2NsayA9IHsKPj4+
Pj4+ICsgICAgIC5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9nYXRlX2RhdGEpewo+Pj4+Pj4g
KyAgICAgICAgICAgICAub2Zmc2V0ID0gQU5BS0lOX0NMS19DVFJMLAo+Pj4+Pj4gKyAgICAgICAg
ICAgICAuYml0X2lkeCA9IDMwLAo+Pj4+Pj4gKyAgICAgfSwKPj4+Pj4+ICsgICAgIC5ody5pbml0
ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkgewo+Pj4+Pj4gKyAgICAgICAgICAgICAubmFtZSA9
ICJhbmFraW5fY2xrIiwKPj4+Pj4gQWdhaW4sIG5vdCBhIGdyZWF0IG5hbWUsIGVzcGVjaWFsbHkg
Y29uc2lkZXJpbmcgdGhlIG9uZSBhYm92ZS4KPj4+Pj4gSXMgdGhpcyByZWFsbHkgcmVhbGx5IGhv
dyB0aGUgZG9jIHJlZmVycyB0byB0aGVzZSAyIGNsb2NrcyA/Cj4+Pj4gYml0MzAgZ2F0ZSBjbG9j
ayBpcyBhZnRlciBiaXQzMSBtdXggY2xvY2ssICBhbmQgdGhlIGdhdGUgY2xvY2sgaXMgdGhlIGZp
bmFsCj4+Pj4gb3V0cHV0IGNsb2NrLCBpdCBpcyB1c2VkIHRvIGdhdGUgYW5ha2luIGNsb2NrLgo+
Pj4+Cj4+Pj4gSSB3aWxsIHJlbmFtZSBiaXQzMSBhcyBhbmFraW5fcHJlLCByZW5hbWUgYml0MzAg
YXMgYW5ha2luLgo+Pj4gT2sgZm9yIHRoZSBsYXN0IGVsZW1lbnQKPj4+Cj4+PiAuLi4gYnV0IEkg
ZG9uJ3QgIGxpa2UgIl9wcmUiIGZvciBhIG11eCBzZWxlY3Rpbmcgb25lIHRoZSAyIGdsaXRjaCBm
cmVlCj4+PiBwYXRoLiBJdCBkb2VzIG5vdCBoZWxwIHVuZGVyc3RhbmRpbmcgdGhlIHRyZWUuCj4+
Pgo+Pj4gRm9yIHN1Y2ggbXV4LCB3aGVuIGl0IGlzIG5vdCB0aGUgbGFzdCBlbGVtZW50LCBJIHdv
dWxkIHN1Z2dlc3QKPj4+ICJfYWJfc2VsIiAuLi4gYXQgbGVhc3QgaXQgaXMgY2xlYXIgd2hhdCBp
dCBkb2VzIHNvLCAiYW5ha2luX2FiX3NlbCIgPwo+Pj4KPj4gb2ssIGFuYWtpbl9hYl9zZWwgYW5k
IGFuYWtpbiBmb3IgdGhlc2UgdHdvIGNsb2Nrcy4KPj4KPj4KPj4gTWF5YmUgYW5ha2luXzAxX3Nl
bCBhbmQgYW5ha2luIGZvciB0aGVzZSB0d28gY2xvY2tzLCBpZiB5b3UgYWdyZWUgdG8gMC8xCj4+
IG5hbWluZyBjb252ZW50aW9uLgo+Pgo+Pj4+Pj4gKyAgICAgICAgICAgICAub3BzID0gJmNsa19y
ZWdtYXBfZ2F0ZV9vcHMsCj4+Pj4+PiArICAgICAgICAgICAgIC5wYXJlbnRfaHdzID0gKGNvbnN0
IHN0cnVjdCBjbGtfaHcgKltdKSB7Cj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgJnQ3X2Fu
YWtpbi5odwo+Pj4+Pj4gKyAgICAgICAgICAgICB9LAo+Pj4+Pj4gKyAgICAgICAgICAgICAubnVt
X3BhcmVudHMgPSAxLAo+Pj4+Pj4gKyAgICAgICAgICAgICAuZmxhZ3MgPSBDTEtfU0VUX1JBVEVf
UEFSRU5UCj4+Pj4+PiArICAgICB9LAo+Pj4+Pj4gK307Cj4+Pj4+PiArCj4gLS0KPiBKZXJvbWUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
