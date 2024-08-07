Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D67DC3DA7F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 05:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBEeoQRRkmkNdXITwhQc/wT3JWIs2ZjVI7Rv9TOnovo=; b=RXqfOBLYQ0fmiCoPRWSkSXz4nn
	VtybZVXf9bz4E9ffQCa4vOda9vD3zNzjzFbyLINdOn8kvHrbVLYXfFNnAC2axdzB6c0d+dEa6XjME
	04rBR3RDCzo65oeSdTL6xuTsqV8OqpAu2mdbIrmg/cuhyvJv0KQOoMoX2kdRjwLYahjgvBZkH7UEe
	SKqP7Yx/CjNPTZ0dWdv1H8dwAteyBfQa1Kb8eUIGtuYlQsFMNvHhiuViUw3vZL2LiixAMx7lEJ37r
	XrCC/p2Xtg4j7MNdXRR0DlRSHTFpe9Kc9rlWtnXC2CXfkTtAzWDnv9/cki9D7mjzTeN1RZrlmWeYp
	GV1fZM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbZdb-00000003vqs-3Sst;
	Wed, 07 Aug 2024 05:55:07 +0000
Received: from mail-psaapc01on20726.outbound.protection.outlook.com ([2a01:111:f400:feae::726] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbZdX-00000003vpe-3sXN;
	Wed, 07 Aug 2024 05:55:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsVK3NUw8/kiUUjRM/JM+dRvuJN0xbOd6r1WwWdGM6ZzrvqvgwcBfnUllZRcwcTXFUDLHRLO1L8FCaF5IjStyXUqvGd0/y+UEdGKjIiwILxls12SUgmp8tK1jQtMjfv3S06fX6irTgFJZBdaX8BjbtzmP7mQfHi1NSvQonfqcuAd84RmKA4hVnFNqTEFghYAz3yq3WpXNktBPFR4FEOwb57EuwfpvAgKnXLCRVzKv9qXTRB72DGyyx6B0pcMWaYxvB50A01b3r7HMSZFn/TvFSBmHLrFd8na4eergLPLp8Q4oUhQiFzhkbpuveXiAQG5+vtxYPQRTuk3jpFlrJji0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSe3oDXBEMkPovBozncGLMrcJFNDuy7eF9lBsmjqH5M=;
 b=sa3o56gu6txWbSRpeXZgXAwUrUO7B7n40tv2g88McBzqKWPs70Tsu0EGmPsZMgH5CjTiwK3RUTVcBl3dkjrpyGloyqMYz0a6YdWCbHrYnlQDvssEShg9c+IC9VqMuzdu1/acynC+BXe+BmdeW9j8Z5iIzQs+01VdgjDY9yBRO/3/B/b9dsy7kkCpk6GuFyZPaDoLr2dKAUr6dp2TqL7BEdL5PqWP4HludmXHrg7rf4hsn+WZ2EiyKmHJQAXbWfIJM4KRCJwNtt8O5RZJvHL3dkjoobLlKdG8+XipfFkhveh2JDXdEKHPUT/bMAnGWA7jA55kjx32xfLPjmFx0Zfhew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSe3oDXBEMkPovBozncGLMrcJFNDuy7eF9lBsmjqH5M=;
 b=XxepGwRMMCMa/wpyqt1MoT0VR+1ghdS+mG1uP41AjHB5eqtmYN7tBcia+YFgC2iCX1YP+ccvx2StzT0uxabGRyyi8rf6nfdFfyEvIhH7qNBrm0pef+9duvktuSumMQgPM2YpitI4POtuqj7B/wSFcybfuf0V4EGocdXDh5EwWl+cPIoVCEZdWen4jtlHHU+eR5LQ1GOzD3z0bryZ/wWvVfD54Ev17cYVZbZL0YeOl7M+o0eDRhtYBo9MG4U2c6mr1kTWeCBwMVc2JhS5Kez/+oQRj+O1t5rL6OiSkHg669YmJR5uFAWwrVye0VUAk6bK7h3UYbHK5sC8jbLwvqLJ+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7119.apcprd03.prod.outlook.com (2603:1096:101:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 05:54:45 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 05:54:45 +0000
Message-ID: <49b41346-a98a-470b-9572-0f81557eea29@amlogic.com>
Date: Wed, 7 Aug 2024 13:54:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: amlogic: add some device nodes for C3
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240806-c3_add_node-v1-0-c0de41341632@amlogic.com>
 <20240806-c3_add_node-v1-2-c0de41341632@amlogic.com>
 <a1aa292d-6d61-4cb9-8343-6f38258c176f@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <a1aa292d-6d61-4cb9-8343-6f38258c176f@kernel.org>
X-ClientProxiedBy: TYAPR01CA0172.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 520317c1-45c1-4a6c-bb94-08dcb6a5703d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnU0b2VXT2pHZFY5ek11YlBHVlppV3l6ZW9POHpIVlc3RTJ5WFhYRCtTL3k2?=
 =?utf-8?B?cnFqc1VaZVBpMUh2dUNmeCtWemt5ZnhSL1RDbDZsV0l1WUI0a0ZHNTFkRy9s?=
 =?utf-8?B?SjNIMkhGdVdiNDV5SnF0R0pnMnFKT1YrcGhidnlmUmc2cnYveEhDY1VES0Fo?=
 =?utf-8?B?ZU5ZYklTNkdSR3gzaWcwbytYQldPYW1JN2pETHlTdTV6bGVaZUREMDJ3bmI4?=
 =?utf-8?B?elFFbE9QYjR6NkVQTVJzSjhrNVcrTytGRFJobnkzZDJOZElXL1JOTWNwanF2?=
 =?utf-8?B?cVlvd0RoNVdsa1BSU1M5MTkvSUZFT2RZN1pXMHVIV3JwdFV5QWJUcXQ4S0hx?=
 =?utf-8?B?SGFJVzBvWFVzS0NYNHV6ZTFlWEpTZXRTSjkvRUpyUjRXQUswdnM3c1UxRXZT?=
 =?utf-8?B?T0tyclRNWEFiOGhHYks2bUJRSFVLUUdRTnpaSE9ncVJscFk4YkJmZjFKSC8z?=
 =?utf-8?B?L2lPQ01LNVNJaUJiY2lHZUxlRElBQm5EMlFyOFUzVzZsdXYzUmZleERmZm42?=
 =?utf-8?B?RHV2RnZXNjZDYUVLSmtQa2FweVhreVBrb0xOS3ZJczJhZ0tnYU94SU5BazRv?=
 =?utf-8?B?SjJnUmZtdThIUEN3NXR5Ym1QR1Z4Vm5POGpjZnBudWYxQ1JXOTJDYnJMWllC?=
 =?utf-8?B?YmF6bmk3SVBMU3drSDRITWliUTJqRzRjdlVKOHBvejdYVW8ybG1sS0NZei9q?=
 =?utf-8?B?Kzc3ZXJLUnNXdDNXb2pONnkwbEFzdTdjcmdBbGgrRHpuYUhFMzVTcmlWR2to?=
 =?utf-8?B?anRKL1c5VFFNYWljdDV3dzBqUEp3bEhCb2h6MDRMYU1uekdSaVNaZi8rTGh5?=
 =?utf-8?B?UGcvVVVnUkRsN0gwTmNjcG8zNFpZaE4zV2FjNUN1bUVLMXRMTHg0NmNHR3NY?=
 =?utf-8?B?S0ZkaGl3N1E4Mk9tZFI2b09GeE83TXRVNzBxL0VablYrRTRVUTZZdDBvVlRr?=
 =?utf-8?B?L0VBT0dETjkzRjN1dDRGQzBqejY0b1pZOGE2ajVOcFNOWWZaNWtPUW9PL1Ni?=
 =?utf-8?B?T3pUejJxSXRjT2o2Y3BQT1V4NUFqNlNnVXNHVVRkQzdQUTZoN3ZOb2FtZkxE?=
 =?utf-8?B?MTdPOWpML0ROSUxtd1lmajlqcEp5RklRRkNoV1VxWElvTkdXNGlsZW9yTVkr?=
 =?utf-8?B?YzZocnozTUxFWHh3eVMvU1AwSG42azRNVXR0ejJ0eHFSWVJxMnR3TUlBOGFo?=
 =?utf-8?B?UlFkRnFGZUxTR0s1NXdKVVJGanEwN1RURWduaVUrTnBSVlhmR3BBSG5vVWtS?=
 =?utf-8?B?dDJIRllFbmhXNjNsMi85T1diUUNKS2x5YTFRUldTdVFoSGFtZGhLY2pqKzQw?=
 =?utf-8?B?MndWWDRWZS85QUZYUmNTb2F2WTB4RGIrMDRENWZqMlhDWlpNNGxOazg1aUw5?=
 =?utf-8?B?VDU4RVk0VUJpUTFPOGNTK2ZvaDVHV01wMFE3ZHF2MXRzc3dQSG1DNFc5RVRQ?=
 =?utf-8?B?Rld5YkN1bEllWTgvNmVmd2ovZTBxRVJqMHRza3FFZU9tZXVxVXZQdEdta0tB?=
 =?utf-8?B?eGlSdk5IalV5SktCNkN2UEVwaEl3ZFRWOXZlU1pWSE1WM0NvZnlrcHRvVVFL?=
 =?utf-8?B?ZC9hL1U2SmFXNG5HbWthWXRqMWFPZHRYOFdNQnI4d2pOU2ZERjlMSHpGU1Fr?=
 =?utf-8?B?ZUVud1c1NjE0REhlL2tpL3lQQVJTZVhzSFRKUE8xSWUzQkNlMTMrTVpFYk5t?=
 =?utf-8?B?YXgraFJHMUJFOUszNGFFNWl1NXBCSU9iNitzb2ZNd2JRY2luYmRtc0dGNUVT?=
 =?utf-8?B?VXd1bFJ4MkdSV1hJOHZiRC82R3JTaTV4ekpneEp0MGlwNTMrcVVPbzBZRERn?=
 =?utf-8?B?RjFYZkRVcGxHZUdNd0FtZWxyNkNEbEozWVBlY2ZyVTFBSk1nRy84TVBtUklN?=
 =?utf-8?Q?iRhZC8/qM0vb3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGowM3RHSDZiVHpIWm9sbUxlTG9PditaUXJ6NHo3M1Fvek14TTN5UDRCcXBz?=
 =?utf-8?B?ZWg1ZmlXZmRmMUFXaTNzUW1pNG8veFoxU1FhRGZQYU5OcTJBZ0tmakN3cHpk?=
 =?utf-8?B?Y3VWb0tUN0pUTGsvT1Y3WXkxNDlzeHc3RENENTNpNFpvVE1LUnQzdzNGTDQy?=
 =?utf-8?B?NlFnTlU3RnhzNGdGcnZBYmswYlBuT3AwUWprSWxOZitzYjVjSkkwWnhlYTlL?=
 =?utf-8?B?bWhXV3VvVFVhelNvVjVvUkpUajJPMDlQbEMyTXZLcDBVZFZPSURRQzhJT1Nt?=
 =?utf-8?B?ZFREOXBhTUZqUUowYW5OUW9sVXE2WFRqVEl0QXJmZEo0bzFHVEdRb2EwY2dY?=
 =?utf-8?B?dFVDWG82UDkvc2hSeVRCUHRnOVJVb054UDZnZHp3L0FrVzlPc0lYbXdJbmUv?=
 =?utf-8?B?Qk5hSFJWL1ozWVArSWczWjhsMktwVGdGVG80NmpHNHpLb3poSDVWYlpSdG05?=
 =?utf-8?B?RGxNK1Rub1dUVUR3N051NFJHUURIQnIzMmo3cWhTbkFwSUhtalJUUTBHM0Jk?=
 =?utf-8?B?M1lTSTZBZVhvYjVBYjdHT1gydGs3Ykp0c0ZIMFRBcnlQOXF3eTl5aHRxYnZx?=
 =?utf-8?B?clJLVDZIbHRFdE1BZUtGZVV1NCtUMXBqeHZ2QkFFZStoWWViUEMzSWRmTFZJ?=
 =?utf-8?B?L1V3Y1Y2QzRQVGlGWXdoVUJnTjA1S0pZalNVRG1VdXdpenluUm5Mb3NSWjlB?=
 =?utf-8?B?ZE94TmNubGw4bmc4M0k3S0JuUFA4U2VsT09vd3RpTFVjSlArZFpQbTZzQ1JX?=
 =?utf-8?B?aFhQbVpSdkY3L1lHODROUnJobSszcmtHN0ZmU1FtRk5DdWVvZ0tUa2lENjBF?=
 =?utf-8?B?Tk5hQ0w2RE0ydVRlKzl4MmpHM1gwc242UEJVM2NjTGhjTWdTQ0laUDdhTmVE?=
 =?utf-8?B?YVdxVmQ2YUk0bUNpTjRJZGFRRStyUDh2L0tUYmdvdHZmY1pmTnRVOEtFSFNQ?=
 =?utf-8?B?ZG1JNTI5Y05GMHM3R1dWZ2pMblFZVW1zYWF5UzgxWW1aUS8vZGticjJMUmsz?=
 =?utf-8?B?aHNhcUJqY0VkV09xYmVuNnBra0FQMUlhYnUxdGRrZFk4ZjdNdWpSSWtsaXE2?=
 =?utf-8?B?YzA0RFVNeDlrVTRqZXJ5Qk45ZFVFdW1NWjZ6SFR2NFpuMDQ4MWtXWmFyZzhY?=
 =?utf-8?B?b3UrOXJ2d2ppUlhVMExsbS92VFV2T0duR1Z3b2NTbzUrL2E4VmxYSk5wTkll?=
 =?utf-8?B?bklqcmY3My8zcFF3T2dsZGxITE1Vazk4L2FJME54VFR0bkpOcWlobGh2am1k?=
 =?utf-8?B?TWZHNTdQQXRpaGlqZDA3bWhMY0NOekZWM0FHZkwycmw4VDAvRmZBSnFuK2NH?=
 =?utf-8?B?RXA3MlJEZHdJNk5LVkd5VWJ6SHlkUFVJcVFrcy8yenVxNm1RVVdYZjNFTURi?=
 =?utf-8?B?bjF5QnIvOWV2RXZieVNFMFFnVGpheFZ2NVZRUndiaDVmZ0dicHFlYjNlYUxk?=
 =?utf-8?B?OWNvRzBFM0t1QzNsaEV1R1BvOXJuUjJaVklnUnl3OFJNcHRhOEpCY2ZlOTZH?=
 =?utf-8?B?UkwxbmpPYU9DY3gvb09iZ05KSmg1aEdhVGgvSkppN3NIa0VHOWI4MnpsM3ZK?=
 =?utf-8?B?WHI5cGFXa0RzNHZyQTQ4VEtZNEJONUliTFR4ZHRuRnZRWkVmSS9uUCtqSXNz?=
 =?utf-8?B?Ykxmbk1mcitqbDFwTjFGU2praDZrMzFlYW5raU9DUGVkRjVmTGZjUnhhUHNi?=
 =?utf-8?B?TUlxTzMwOSt0MXdJNGRmNUVUQWFHeHJTRVhmdVR2bnJuM0M3UTJRSUhsSEpu?=
 =?utf-8?B?MVlybVRMMUt5ZDlSU21BR2dsbmwxL3ZCc2JySDM3Q3ZtSHA2RWpRWVRva2xj?=
 =?utf-8?B?TUdCS28vYXF3STUzKzhDaWVscTAxOG55bUh3Z0d4eHl5Y3BkR3Q2UGwvSVBR?=
 =?utf-8?B?S01PRFFpNVFnSy8xaFN5R1NoWjBiSHk1bUp4a1ZvU2xsWnJPL2d6YVlqSW5R?=
 =?utf-8?B?d1AzdFhnbkh1TUNzTmVaWmZYbW1NaUk5cGlTZXRMczRVUGxKdFdBaFpZV1NZ?=
 =?utf-8?B?a2pPWkZRcDZ1ZkZJRlpGYkZIMEtHQlcweWRzRW9oeDJGck5PU1JnWTNlQVpR?=
 =?utf-8?B?NnFsTHFwQS8wL2F1VWlPNmhmSlZXL0dQenVNT1ZGdmlUbXpjOE13eFduSHF4?=
 =?utf-8?B?NDkybFJ2MmdVQzcxL1hoK3hTdTJUK3M3dVRtNGRKNkZ6OHd6dHpmbkV5WmF2?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520317c1-45c1-4a6c-bb94-08dcb6a5703d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:54:45.0025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZPOe9S5Dzu9jNUYTVjxItaebQLhTscx7OYP9JyB7IUy4mnHBIpTkjjwVxh54tBkl69LdvbfjV3g9Xp5qSH+hC+n3xEGSnAZyA9CcI+Idqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_225504_138732_293903E2 
X-CRM114-Status: GOOD (  14.55  )
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

Hi Krzysztof,
    Thanks for your reply.

On 2024/8/6 21:13, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 06/08/2024 12:27, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add some device nodes for SoC C3, including periphs clock controller
>> node, PLL clock controller node, SPICC node, regulator node, NAND
>> controller node, sdcard node, Ethernet MAC and PHY node.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   .../boot/dts/amlogic/amlogic-c3-c302x-aw409.dts    | 249 +++++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 487 ++++++++++++++++++++-
>>   2 files changed, 735 insertions(+), 1 deletion(-)
>>
> 
> 
> ...
> 
> 
>> +
>> +                     sd: mmc@8a000 {
>> +                             compatible = "amlogic,meson-axg-mmc";
>> +                             reg = <0x0 0x8a000 0x0 0x800>;
>> +                             interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>> +                             power-domains = <&pwrc PWRC_C3_SDCARD_ID>;
>> +                             clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
>> +                                     <&clkc_periphs CLKID_SD_EMMC_B>,
>> +                                     <&clkc_pll CLKID_FCLK_DIV2>;
>> +                             clock-names = "core", "clkin0", "clkin1";
>> +                             no-mmc;
>> +                             no-sdio;
> 
> Hm? Why are these blocks incomplete that they do not handle SDIO? Aren't
> you putting board properties into SoC?
>The sdacrd (mmc@8a000) depends on regulator and pinctrl(select), So some 
property fields are placed at the board level. The SDIO is connect with 
the firmware (wifi&bt). Now I'll remove SDIO implementation and wait 
until later to submit it with the firmware.
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
