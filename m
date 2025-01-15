Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B159C02180
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2025 06:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyC0/XsPyIqIoggV+YavFcCK84VkABoh8wa6DeOBt8M=; b=ORZdZolmi8USsCeskBqk+dLx1/
	qkI7teTtx+dfJk4BeEBKvhRVHi2oqSPXmJ1418K5AOifqc+kAdkmrh2Qw5n6jHh0IMAWC7gpnTcZP
	Gg149fpoJGfwicrpYZ8vBfsbFif+TFXGdXHvOcRyxHo5NhiwMJGJ0KTLuWV5u3Xqf1f7HYhjQqZkp
	3090t6IVaQQUdSilbQFN+pINknyz/J1s5/74SJ6F/mNmhwO5tNsw4PGgXcI2RaeRgK0iffR+TA95n
	Wp1v/gzyZEvgu1u5RlkZEs46RGLQjmcr3ymWnwOrc4Vivb9bhXqvO+zEXoY4vPdt0A5fE06Z9DhMd
	wgmYW4Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwgs-0000000Alao-3ZlR;
	Wed, 15 Jan 2025 06:15:46 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwgp-0000000AlZ4-3Yql;
	Wed, 15 Jan 2025 06:15:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaTxhaMel/aeENRhJfEAg4gFc8KUeS5v8kziuXa4ynWaJ/5WzkWuFezAp9CpOQK6EPsSztENtv0TcQBCRXru7UiiT+3YYAoYdvqV/RsnyRqdxPN/373RsJ+Qd0MCQ5x0rQguOMsoSmVda7j25QArq552y9iTTVnp3x9FIs+U3zJczus32s1/IMOYQqhn/AoWxbAdX5exwnl/A66gbNdI5S5Q70xtExBFJJYgZ86jLWdh7IRnqUbl+LdIg3VmrJhg0E0VzVI0M+Lm3NPR9Sucrs64t6Gm8gmS87FVZRA7V23DVZXEw/B//PohcneiBdYkRouALxYaet1e7MYdWpPuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMfmEtno/Tkgt2/H3QN1iOtj9flfpa4G1z70unjRL4Q=;
 b=zJQtdG4Q4audEmV8iTwhmqFIs7jqM0Crd2BxG5XpuRbKYBu7iUoQnIYm2LCXxxhPeXofkWluqu6pOL+u9zG1ixeCP2eEq3rDgEr+o4Cjoiz0KHKm8rWbcEoGX4OvXwQpCMmZYAfNh72BBAwKiuv+iJ8GWFIkRFZEwOznxmkHm7qh+sBxCBA+T2tPR7aUn8vsk71FnW012v44UtwMRIRdvlJuilOFDa5lJnh7Uc5xd5JQ7ivmMogZLUl+M/Sb6M4bDHtgIwGLm4N0KnfJZF6TbsT/LdQddXUrk2DBCQiUNe4BsPi73meco0Mu1Tv84j0L5JvRU9/SBD+Vj8L6d6pJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMfmEtno/Tkgt2/H3QN1iOtj9flfpa4G1z70unjRL4Q=;
 b=jQeSuBQRGjKj4Z32uOX4U4SuAe+UzVJk809599nJ+Fc00m8aF/DrPa8Z4nHVeCqolryiWn0HWuAlvj0JPEGMQZSEYyAdllq9S8dAdt1/wE/cTJy13xxPD2lBBBmGynXNl+936pa9KX10iW5uXNtD0dbMdg1sjBkfXtRALYWv+qLNNrLnXj3fuz+5GeK4wWq8v7OYSZ81miqIGQUr3xHH9IdCHJFomL/ajmJeiN/BX2yHGmeMdTWPH/rD8CuH7p09Y9TnFcit6nikeRd/lzDc6+v4I+Yigh1+eMEKxnEbmClS/EMLBodaRx9szOvrMC3N0OoQWUxoFZ270EMs6UZ9jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by KL1PR03MB7599.apcprd03.prod.outlook.com (2603:1096:820:cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 06:15:21 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724%7]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 06:15:21 +0000
Message-ID: <490ebd13-cbce-4a96-8f6e-fac8f3a96199@amlogic.com>
Date: Wed, 15 Jan 2025 14:15:17 +0800
User-Agent: Mozilla Thunderbird
From: Ao Xu <ao.xu@amlogic.com>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
 <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: TYCPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:1::15) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|KL1PR03MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: b62429e5-a027-47f8-8cc1-08dd352bfd73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZURsRFBPcDhrUFJxU2hxMFFBZnRhdGNyWDdIQlN0NmE5M2xRUFRKSFJrMDJX?=
 =?utf-8?B?SEZmL2RoYVVxY0pJUmxTUy8rZ1VJUWRXVUJhcUxIRTlIWEJaK1Z3Y1FucVpV?=
 =?utf-8?B?elZDbU9LZTBNQXZ6SGlUSDVvcTQvcUJuaGMyNldjMzFoQWlZeTFZa1V1SkY4?=
 =?utf-8?B?TkNZQmRqZDA4aEZjWi8waDArL3QyS2ZqWUZZNEVBeE9Kcmw3bkE1bnlHQW0r?=
 =?utf-8?B?cUhwakZOeXhUdWNJSkJpbG9RRVlVY2k5cnN1OXpNblBUNkdZdk10RHJPYlhn?=
 =?utf-8?B?bHRvaFIyQSs4QTU2a1ZXdndFSDFUWk9lekQrbFNybFAvRVMyZ0tKbWxjWTFl?=
 =?utf-8?B?UnZINmc3WHkzWHB0a0pFN2JWd2pYd3NjM1BVYUpxN2RMb2owSHYwUGxZSkdi?=
 =?utf-8?B?a25MaVJtTllmSG0wREYwUGU5enhxS0tqUytQR3BuSUZXa3o1RHBvQ1VjaE41?=
 =?utf-8?B?UldncE1zT0pqS05TNUJLTk8vL2htdVIwRm9SYmdXeGZKNHhzM2JIQjdpLzg3?=
 =?utf-8?B?THZWVUNzd1RqTWd2YWR0YXJEV0lLUnE4a01nbmNHblZDNTdUSDZTOVNDSS9k?=
 =?utf-8?B?VFlJVmpVVWJNVUc4d3ZlOVNmUGpVeE41dEdMcXMzRVRyT2NLUTA2Qjg3Vkxx?=
 =?utf-8?B?RW1VVzNDSHVMNXEzSlhKRmF4UWIxaGxiSUszZk41ODE2eEFzeC9vc1dOQllz?=
 =?utf-8?B?S3FpSVVYU0VZTFI4Vk1nTjNJMU8xa2NNNnA0bXBDTEV3ZjJXL3d5Rm9MZkNa?=
 =?utf-8?B?SFBuVC9URlRIdnAyUndVYmVVcndjaDNmQm5qMDNVUzlhbUk1bE8xWjRNdHB5?=
 =?utf-8?B?a3JHdXE1QVV3ZzVzUzEzYlRJYmpzSXJYRHlVVVpmTTBNa3o0SmJYVUxha0Iz?=
 =?utf-8?B?RlN5bjhmNnNPUklvR2ZVWmtRc3hKcVRrUFM4T051YTdaS3FMZGtCdDZFQmJw?=
 =?utf-8?B?dHpPRjBIY29ZWnMrVTk1YkZHckN2OEIxN04yRmlyMENqak1nMTl2aDJ6dTdh?=
 =?utf-8?B?Lzd0TmdoR2JpbklLZFErOUE5N2ZFWDZWMjRyVzVjcHJGbDM4K0RXSENCcU9a?=
 =?utf-8?B?bTJMTEJ1c3ltUTdGZDNKRTNXM0p1MURvUis1M09IVXFRMlViMUgvUlN6YUIr?=
 =?utf-8?B?cFcrVDRpc1FsdEtISTlRNTBLem9MSWg0MURETEdvU3NrN01vYjZTNURhZUJu?=
 =?utf-8?B?YlNrbDY3eHpwcWlmNGhHWXlKOGttYzJwQWhYK3U2OS83VHZ6TDFsQ2VnZmVz?=
 =?utf-8?B?K0dwQzhlNnY4UzJCK2plQzBkYmp6bm1zRFhGVWdJbnBuMlJhNWl0VDZJeWhX?=
 =?utf-8?B?RUl6bEhMY0UzbWtJcjNTbzAzZXdYU215UTNhNmVOeldLYnJvY1RGUi96elpl?=
 =?utf-8?B?Wm41dEJQZjdNVXRtNnl5MTczU0ttemxIVWFCandNeS9qMjJDWUk4c0cvTzZO?=
 =?utf-8?B?S0x4L1R5QmJ2Q1JCQVBjeDlVWHZkUDU5RVFhci90OVlrN0N5OWUvcjQ3Y2Vl?=
 =?utf-8?B?Tk90MXRnUEdXdnk2V014SHlpMFR1aDBzbkR0dXFaYnBnLytDZkx1b2dZd0dH?=
 =?utf-8?B?YXpTalgvUVpiS1BxcDdJM1paSVNlR2k5QnVoSUFWUVUrdmVjZURsUkRnVjZY?=
 =?utf-8?B?Y1VjYmdtZ1IvcEJSeHpEWnFUTU1sbjN2eEE0bVNJZXR0VVNYakVwc3pOYVBH?=
 =?utf-8?B?SUNWK2hROFJUaS9NSC8rRTVXNk1HTUY4eDhnSlJoaGp4MEIvZzRSNkUvWGRj?=
 =?utf-8?B?Rk8zQjBkQUZSRTFwREJocWxhREFjOWRBWFNXdU1scEt5NDU4anhJakdUejNQ?=
 =?utf-8?B?NitTR092Z0t2bWFTT1NPUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7155.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlZCVXVwYXZFdWovSG11eTVGZDlCWVRXUmkyeUhoWnZKdnJCK1lmNGozVERt?=
 =?utf-8?B?MGo2V240elNETlNEUjNyZkJFdDNiWXhjMnczclZtNVJwS3E5NHh3LzEvTTFx?=
 =?utf-8?B?RlZ5Y3Y5Q2tnd3ltMVdoVjJvaUs2NnR1b3MxRVFhL2Vzc3dsdEprc2pESEhq?=
 =?utf-8?B?cUt4M21maGsvckwrUHoybVliNXI4aGF6WmJDVW82L3A2anlLYm03MWxQWjl4?=
 =?utf-8?B?ZUNaYmZXQndkNDBZenpla252Y1U5cGJzOHY5VWxCbDhVWlU0a1JSaUxWQVpy?=
 =?utf-8?B?SlJOY0N0ekk2QXQ2RDhIYVgrTDRWQzdWRW5oYll2MjgvcDUwMC9mNGx6Q05o?=
 =?utf-8?B?eHJrWWtnNVJEYmZnUXhXMk5CVHdHL3d0Y2ZOOVF1N3I1MUk2NEFhSUZWMXcz?=
 =?utf-8?B?d3luTk9LVUFzOEc4T3R6V3cyQUQ5YituOHpwU2dsOHZjaW9DMHd5QUkvaHhS?=
 =?utf-8?B?L003YUVKTW50UU1zT1ZHR2FiNGZubHJheGQxazZ6TklNSVhwT2RCcmhGdVFG?=
 =?utf-8?B?MG9GWkREcWZnU1QyVXNDUnZGaWU0ZVh3TDVGTmg1d1J6dlVVL3dRSmNiN3Av?=
 =?utf-8?B?cVJ4eEhGVzhRNmdBRTJmdkttaWkzNXFjd0xrSEtjWlVhQkNxRlpoS0g3bjls?=
 =?utf-8?B?L3VjM0ZTZFZVUmdzY3VFSkpxeEVKaEZ0YnBnODNjT05FUHRUTVpxSEp5c3Bi?=
 =?utf-8?B?QkJWc05jTC9mTjdHQzBTakNtandBcGduUDVEa1MvbitGa0tBZmFza2VLMEdn?=
 =?utf-8?B?bWt1VjIzKzV0dXdCd0EyTllCcUtGQWFienVndHJmYUdDeGdTQkcweG1aUDA0?=
 =?utf-8?B?cG00VmxGZmlPVk1mWG4vUURCSGRWZHA3Nm9XcUZsOHZXYVNpQUhWS2hDejZ0?=
 =?utf-8?B?UStwalhHY3FyeksrZko0MmpIUk01Y2N5Qm1uU3FoK0hTeDNTZEcwMi9reFhi?=
 =?utf-8?B?OWdsbDZNeGVuVXY5SWkzVXJWTTNweUNhdVBqL09jbzJ6TXc2dkNzdlduUjZP?=
 =?utf-8?B?NkVmbDBPaWFzUndGLzRza1Q3a1ZMYWgrdEt0WDNOOXZwdFRoTDhkd25HSFZD?=
 =?utf-8?B?RGEwUG9DTTR6LzlqR3p6UUsxY3pOSU5EUXIyR2MxUkNwM0JsdVFXNmI0SHQ3?=
 =?utf-8?B?cXhDOXRYaGQ4THFUT0E2bnpnMnhaZzVZRmZhUGU4aGE1QlNPaHJFYjE5bSs1?=
 =?utf-8?B?Z1B2QXc5cTJMZVEyKzlibThrLzdrUDNWSFc5ZkhoMXF6K0RDaG9OQUZCVUdZ?=
 =?utf-8?B?d2xBajl5YTI3WGpjNmo2d3BEQU4wajNYa0JvQ1RhdkJuUVd2bXY2SGduNmVF?=
 =?utf-8?B?RVF5VmYxWkdhQU1YTnhjWHlEVndUaW96ekR4bTJMU0ZhSXlUOW9JTVBOUytk?=
 =?utf-8?B?UmdKUVhHTFhRdkt1NTk0WVpOTFFhVWc1UnVTY2lFSFJBalRLLzhja2pWUGR6?=
 =?utf-8?B?QzR1R2gwZHRscVNJYnhuOXZhR1JxdHgrYmtmQWROWWUyM29NRVRGZVlMeUNB?=
 =?utf-8?B?UG5acFpPaDM4VDZzMTZFNnRzL01nK0pCaS84elpDUUVTcjRtSzZFS0hTQnUx?=
 =?utf-8?B?cVR5WXI3SUdzN0NTdHRwajNPU1hsdld6SERRZDUyc3JORGpkNlg1SXZIK0NC?=
 =?utf-8?B?N1p1bndnd1pld1J6RU9DV01VdGMxbFJZREwwVEtqMzRaNFJSY3FQYXZ6MFNJ?=
 =?utf-8?B?S25NaG9EV3ZmRTJEWjBUVzZPZkxIUGtnd1NXbFpOeGo1cEtqeXlzdE5vazlO?=
 =?utf-8?B?SFkxOERRYTlkRkxaeFpQNERSY3hrSkQ5VU5zNFNaSHkvQ3ZCVGNEVXppYis0?=
 =?utf-8?B?ZUtvSWZCb1JDSTFQblFKWkFhck0zcTVENVpUQnRTd2h2TUtBNUNCVG4zZVFK?=
 =?utf-8?B?L1Qxa2dNWitBbWpOakxBblRHOFRsN0FPY3B3TmRzTURVd3U0NzlNNkNXRXpt?=
 =?utf-8?B?cVhFVTZmOXRrMUhWKzRJd0kzNGtCY3RsR0F0SVJsVDVKdnJ2REd3d0ZSL2xE?=
 =?utf-8?B?VTJhWEtYSlNxSEhFNjduTDNpRnlRZlN0WFJVQ1k2d29JV0dMTDVISzJiYUIw?=
 =?utf-8?B?OWlHY2c0bHVEbzdKQ1hBNnhtMWdMVENyRGlKOVdaUFdKZUltaFQ4Wmd3MkV1?=
 =?utf-8?Q?I0VAnBB0IiLXgYVRKPtilx3Qc?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62429e5-a027-47f8-8cc1-08dd352bfd73
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 06:15:20.9712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QLpD6HQPNg5dGUuuuf5UwOcbbkZydePv8cfbM1xVfek8wSeJtl4qcoGAQOrXzdTIPYBlY3tHZOwe54KGmYjJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_221544_012705_C5AF038F 
X-CRM114-Status: GOOD (  37.38  )
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

5ZyoIDIwMjUvMS8xNSAxOjUwLCBKZXJvbWUgQnJ1bmV0IOWGmemBkzoKPiBbIEVYVEVSTkFMIEVN
QUlMIF0KPgo+IE9uIFN1biAxMiBKYW4gMjAyNSBhdCAyMzo0NCwgTWFydGluIEJsdW1lbnN0aW5n
bCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPj4gSGVsbG8s
Cj4+Cj4+IE9uIEZyaSwgSmFuIDEwLCAyMDI1IGF0IDY6MznigK9BTSBBbyBYdSB2aWEgQjQgUmVs
YXkKPj4gPGRldm51bGwrYW8ueHUuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+PiBU
aGlzIHBhdGNoIHNlcmllcyBhZGRzIERSTSBzdXBwb3J0IGZvciB0aGUgQW1sb2dpYyBTNC1zZXJp
ZXMgU29Dcy4KPj4+IENvbXBhcmVkIHRvIHRoZSBBbWxvZ2ljIEcxMi1zZXJpZXMsIHRoZSBTNC1z
ZXJpZXMgaW50cm9kdWNlcyB0aGUgZm9sbG93aW5nIGNoYW5nZXM6Cj4+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaGVzLiBXaXRoIHRoaXMgbWFpbCBJJ2xsIHRyeSB0byBzdW1tYXJpemUgbXkKPj4gdW5k
ZXJzdGFuZGluZyBvZiB0aGUgc2l0dWF0aW9uIHdpdGggdGhlIGRybS9tZXNvbiBkcml2ZXIgYXMg
SSdtIG5vdAo+PiBzdXJlIGhvdyBmYW1pbGlhciB5b3UgYXJlIHdpdGggcHJldmlvdXMgZGlzY3Vz
c2lvbnMuCj4+Cj4+PiAxIFRoZSBTNC1zZXJpZXMgc3BsaXRzIHRoZSBISVUgaW50byB0aHJlZSBz
ZXBhcmF0ZSBjb21wb25lbnRzOiBgc3lzX2N0cmxgLCBgcHdyX2N0cmxgLCBhbmQgYGNsa19jdHJs
YC4KPj4+ICAgIEFzIGEgcmVzdWx0LCBWRU5DIGFuZCBWQ0xLIGRyaXZlcnMgYXJlIHVwZGF0ZWQg
d2l0aCBTNC1zcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZ3MgdG8gYWNjb21tb2RhdGUgdGhlc2Ug
Y2hhbmdlcy4KPj4gSmVyb21lIGhhcyBhbHJlYWR5IGNvbW1lbnRlZCBvbiBwYXRjaCAzLzExIHRo
YXQgdGhpcyBtaXhlcyBpbiB0b28gbWFueQo+PiBJUCBibG9ja3MgaW50byBvbmUgZHJpdmVyLgo+
PiBUaGlzIGlzIG5vdCBhIG5ldyBzaXR1YXRpb24sIHRoZSBleGlzdGluZyBjb2RlIGlzIGRvaW5n
IGV4YWN0bHkgdGhlIHNhbWUuCj4+Cj4+IEplcm9tZSBoYXMgcHJldmlvdXNseSBzZW50IGEgc2Vy
aWVzIHdoaWNoIHN0YXJ0ZWQgImFuIGVmZm9ydCB0byByZW1vdmUKPj4gdGhlIHVzZSBISEkgc3lz
Y29uIiBbMF0gZnJvbSB0aGUgZHJtL21lc29uIGhkbWkgZHJpdmVyLgo+PiBJbiB0aGUgc2FtZSBt
YWlsIGhlIGZ1cnRoZXIgbm90ZXM6ICJbdGhlIHBhdGNoc2V0XSBzdG9wcyBzaG9ydCBvZgo+PiBt
YWtpbmcgYW55IGNvbnRyb3ZlcnNpYWwgRFQgY2hhbmdlcy4gVG8gZGVjb3VwbGUgdGhlIEhETUkK
Pj4gcGh5IGRyaXZlciBhbmQgbWFpbiBEUk0gZHJpdmVyLCBhbGxvd2luZyB0aGUgUEhZIHRvIGdl
dCBob2xkIG9mIGl0cwo+PiByZWdpc3RlcnMsIEkgYmVsaWV2ZSBhIERUIEFCSSBicmVhayBpcyBp
bmV2aXRhYmxlLiBJZGVhbGx5IHRoZQo+PiByZWdpc3RlciByZWdpb24gb2YgdGhlIFBIWSB3aXRo
aW4gdGhlIEhISSBzaG91bGQgcHJvdmlkZWQsIG5vdCB0aGUKPj4gd2hvbGUgSEhJLiBUaGF0J3Mg
cGFpbiBmb3IgYW5vdGhlciBkYXkgLi4uIgo+Pgo+PiBGb3Igbm93IEknbSBhc3N1bWluZyB5b3Un
cmUgZmFtaWxpYXIgd2l0aCBkZXZpY2UtdHJlZSBBQkkuCj4+IElmIG5vdCB0aGVuIHBsZWFzZSBs
ZXQgdXMga25vdyBzbyB3ZSBjYW4gZWxhYm9yYXRlIGZ1cnRoZXIgb24gdGhpcy4KPj4KPj4gTXkg
b3duIG5vdGVzIGZvciBtZXNvbl9kd19oZG1pLmMgYXJlOgo+PiAtIHdlIHNob3VsZCBub3QgcHJv
Z3JhbSBISElfSERNSV9DTEtfQ05UTCBkaXJlY3RseSBidXQgZ28gdGhyb3VnaCBDQ0YKPj4gKGNv
bW1vbiBjbG9jayBmcmFtZXdvcmspIGluc3RlYWQgKHdlIHNob3VsZCBhbHJlYWR5IGhhdmUgdGhl
IGRyaXZlcgo+PiBmb3IgdGhpcyBpbiBwbGFjZSkKPj4gLSB3ZSBzaG91bGQgbm90IHByb2dyYW0g
SEhJX01FTV9QRF9SRUcwIGRpcmVjdGx5IGJ1dCBnbyB0aHJvdWdoIHRoZQo+PiBnZW5wZC9wbWRv
bWFpbiBmcmFtZXdvcmsgKHdlIHNob3VsZCBhbHJlYWR5IGhhdmUgdGhlIGRyaXZlciBmb3IgdGhp
cwo+PiBpbiBwbGFjZSkKPj4gLSBmb3IgdGhlIEhETUkgUEhZIHJlZ2lzdGVyczogb24gTWVzb244
LzhiLzhtMiAodGhvc2Ugd2VyZSAzMi1iaXQgU29Dcwo+PiBpbiBjYXNlIHlvdSdyZSBub3QgZmFt
aWxpYXIgd2l0aCB0aGVtLCB0aGV5IHByZWRhdGUgR1hCQi9HWEwvLi4uKSBJCj4+IHdyb3RlIGEg
UEhZIGRyaXZlciAod2hpY2ggaXMgYWxyZWFkeSB1cHN0cmVhbToKPj4gZHJpdmVycy9waHkvYW1s
b2dpYy9waHktbWVzb244LWhkbWktdHguYykgYXMgdGhhdCBtYWRlIG1vc3Qgc2Vuc2UgdG8KPj4g
bWUKPj4KPj4gVGhlbiB0aGVyZSdzIG1lc29uX3ZlbmMuYyB3aGljaCBoYXMgdHdvIHdyaXRlcyB0
byBISElfR0NMS19NUEVHMi4KPj4gSSB0aGluayB0aG9zZSBzaG91bGQgZ28gdGhyb3VnaCBDQ0Yg
aW5zdGVhZCBvZiBkaXJlY3RseSBhY2Nlc3NpbmcgdGhpcyByZWdpc3Rlci4KPj4KPj4gQWxzbyB0
aGVyZSdzIHRoZSBWREFDIHJlZ2lzdGVycyBpbiBtZXNvbl9lbmNvZGVyX2N2YnMuYzoKPj4gSSB0
aGluayBOZWlsIHN1Z2dlc3RlZCBhdCBvbmUgcG9pbnQgdG8gbWFrZSBpdCBhIFBIWSBkcml2ZXIu
IEkgZXZlbgo+PiBzdGFydGVkIHdvcmtpbmcgb24gdGhpcyAoaWYgeW91J3JlIGN1cmlvdXM6IHNl
ZSBbMF0gYW5kIFsxXSkuCj4+IERUIEFCSSBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBpcyBhbHNv
IGEgY29uY2VybiBoZXJlLgo+Pgo+PiBBbmQgZmluYWxseSB0aGVyZSdzIHRoZSB2aWRlbyBjbG9j
ayB0cmVlIHByb2dyYW1taW5nIGluIG1lc29uX3ZjbGsuYy4KPj4gTXkgdW5kZXJzdGFuZGluZyBo
ZXJlIGlzIHRoYXQgdmlkZW8gUExMIHNldHRpbmdzIGFyZSB2ZXJ5IHNlbnNpdGl2ZQo+PiBhbmQg
cmVxdWlyZSBmaW5lLXR1bmluZyBhY2NvcmRpbmcgdG8gdGhlIGRlc2lyZWQgb3V0cHV0IGNsb2Nr
Lgo+PiBTaW5jZSBpdCdzIGEgYnVuY2ggb2YgY2xvY2tzIEknZCBzYXkgdGhhdCBkaXJlY3QgcHJv
Z3JhbW1pbmcgb2YgdGhlCj4+IGNsb2NrIHJlZ2lzdGVycyBzaG91bGQgYmUgYXZvaWRlZCBhbmQg
d2UgbmVlZCB0byBnbyB0aHJvdWdoIENDRiBhcwo+PiB3ZWxsLgo+PiBCdXQgdG8gbWUgdGhvc2Ug
cmVnaXN0ZXIgdmFsdWVzIGFyZSBhbGwgbWFnaWMgKGFzIEkgYW0gbm90IGF3YXJlIG9mCj4+IGFu
eSBkb2N1bWVudGF0aW9uIHRoYXQncyBhdmFpbGFibGUgdG8gbWUgd2hpY2ggZGVzY3JpYmVzIGhv
dyB0bwo+PiBkZXRlcm1pbmUgdGhlIGNvcnJlY3QgUExMIHJlZ2lzdGVyIHZhbHVlcyAtIG90aGVy
c2lkZSB0aGUgc3RhbmRhcmQKPj4gZW4vbS9uL2ZyYWMvbG9jayBhbmQgcmVzZXQgYml0cykuCj4+
Cj4+IEknbSBub3Qgc2F5aW5nIHRoYXQgYWxsIG9mIG15IHRob3VnaHRzIGFyZSBjb3JyZWN0IGFu
ZCBpbW1lZGlhdGVseQo+PiBuZWVkIHRvIGJlIHB1dCBpbnRvIGNvZGUuCj4+IFRoaW5rIG9mIHRo
ZW0gbW9yZSBhcyBhbiBleHBsYW5hdGlvbiB0byBKZXJvbWUncyByZWFjdGlvbi4KPj4KPj4gSSB0
aGluayB3aGF0IHdlIG5lZWQgbmV4dCBpcyBhIGRpc2N1c3Npb24gb24gaG93IHRvIG1vdmUgZm9y
d2FyZCB3aXRoCj4+IGRldmljZS10cmVlIEFCSSBmb3IgbmV3IFNvQ3MuCj4+IE5laWwsIEplcm9t
ZTogSSdkIGxpa2UgdG8gaGVhciB5b3VyIGZlZWRiYWNrIG9uIHRoaXMuCj4gSSBjb21wbGV0ZWx5
IGFncmVlIHdpdGggeW91ciBkZXNjcmlwdGlvbiBvZiB0aGUgcHJvYmxlbSwgdGhhdCBhbmQKPiBL
cnp5c3p0b2YncyByZW1hcmsgb24gcGF0Y2ggNi4gVGhpcyBpcyBub3QgbmV3IHdpdGggdGhpcyBz
ZXJpZXMgaW5kZWVkLAo+IHNvIGl0IGRvZXMgbm90IGludHJvZHVjZSBuZXcgcHJvYmxlbXMgcmVh
bGx5IGJ1dCBpdCBjb21wb3VuZHMgdGhlCj4gZXhpc3Rpbmcgb25lcy4KPgo+IEFkZHJlc3Npbmcg
dGhvc2UgaXNzdWVzLCBpZiB3ZSB3YW50IHRvLCB3aWxsIGdldCBtb3JlIGRpZmZpY3VsdCBhcyBt
b3JlCj4gc3VwcG9ydCBpcyBhZGRlZCBmb3Igc3VyZS4KCkhpLCBKZXJvbWUsIE5laWwsIE1hcnRp
bgoKIMKgwqDCoCBUaGFua3MgZm9yIHlvdXIgcmV2aWV3LiBJIGhhZG4ndCBub3RpY2VkIEplcm9t
ZSdzIHBhdGNoc2V0cyBiZWZvcmUsIAphbmQgaGUgaGFzIGFscmVhZHkgZG9uZSBzb21lIGV4Y2Vs
bGVudCB3b3JrLgoKIMKgwqDCoCBJbmRlZWQsIHRoZSBjdXJyZW50IGNvZGUgaXMgb3Zlcmx5IGNv
dXBsZWQsIHdpdGggSEhJIGFuZCBWUFUgcmVnbWFwIAptaXhlZCB0b2dldGhlci4gSXQgYWxzbyBj
b250YWlucyBhIGxvdCBvZiByZWR1bmRhbnQgY29kZSwgd2hpY2ggaXMgbm90IAp2ZXJ5IGNvbmR1
Y2l2ZSB0byBleHRlbnNpb24gYW5kIG1haW50ZW5hbmNlLgoKIMKgwqDCoCBXZSBhcmUgYWxzbyBj
b25zaWRlcmluZyB3YXlzIHRvIGltcHJvdmUgdGhlIERSTSBNZXNvbiBjb2RlLCBhbmQgCnRoaXMg
aXMgYSBnb29kIGF0dGVtcHQuCgogwqDCoMKgIFRoZSBjb2RlIHNob3VsZCByZXVzZSBmcmFtZXdv
cmtzIGxpa2UgQ0NGLCByZXNldCwgUEhZLCBhbmQgUEQgYXMgCm11Y2ggYXMgcG9zc2libGUuCgog
wqDCoMKgIEknbSBtb3JlIHRoYW4gaGFwcHkgdG8gY29sbGFib3JhdGUgb24gcmVzdHJ1Y3R1cmlu
ZyB0aGVBbWxvZ2ljIERSTSAKZHJpdmVyIHRvIG1ha2UgaXQgYmV0dGVyIQoKPj4+IDIgVGhlIFM0
LXNlcmllcyBzZWN1cmVzIGFjY2VzcyB0byBIRE1JVFggRFdDIGFuZCBUT1AgcmVnaXN0ZXJzLAo+
Pj4gICAgcmVxdWlyaW5nIG1vZGlmaWNhdGlvbnMgdG8gdGhlIGRyaXZlciB0byBoYW5kbGUgdGhp
cyBuZXcgYWNjZXNzIG1ldGhvZC4KPiBSZWdtYXAgYnVzZXMgYXJlIG1hZGUgZm9yIHRob3NlIGNh
c2VzIHdoZXJlIHRoZSByZWdpc3RlcnMgYXJlIHRoZSBzYW1lLAo+IGJ1dCBhY2Nlc3NlZCBkaWZm
ZXJlbnRseS4gVGhlcmUgaXMgYW4gZXhhbXBsZSBpbiB0aGUgcGF0Y2hzZXQgcmVmZXJlbmNlZCBi
eQo+IE1hcnRpbiwgdG8gaGFuZGxlIEdYTCBhbmQgRzEyIGRpZmYuCj4KPj4gVGhpcyBpbmZvIHNo
b3VsZCBnbyBpbnRvIHBhdGNoIDEvMTEgdG8gZXhwbGFpbiB3aHkgdGhlIGcxMmEgY29tcGF0aWJs
ZQo+PiBzdHJpbmcgY2Fubm90IGJlIHVzZWQgYXMgZmFsbGJhY2suCj4+Cj4+Cj4+IEJlc3QgcmVn
YXJkcywKPj4gTWFydGluCj4+Cj4+Cj4+IFswXSBodHRwczovL2dpdGh1Yi5jb20veGRhcmtsaWdo
dC9saW51eC9jb21taXQvMzZlNjk4ZWRjMjVkYzY5OGEwZDU3YjcyOWE3YTQ1ODdmYWZjMDk4Nwo+
PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3hkYXJrbGlnaHQvbGludXgvY29tbWl0LzgyNGI3OTJm
ZGJkMmQzYzBiNzFiMjFlMTEwNWVjYTBhYWFkOGRhYTYKPiAtLQo+IEplcm9tZQoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
