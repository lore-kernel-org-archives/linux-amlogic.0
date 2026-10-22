Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73D6606A319
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 02:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GaNM0f2E;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=jlX5ToI5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzJxFbg35r1pIP6MBZv+9Bn3Hu5z1VYc4nRnyxXGdqk=; b=GaNM0f2Ec6hhXTkZuxXBuY5c0O
	t4Aw9S55MGdoSKHWu9bwIh/r1oyjVWRR1JqM22o7C4BDQ1Hm8H0Kk26p47Or68RlJ+XeNocpPXRbA
	cEFzt6KGgs8IvBMir7kI7emlJjgMokkFiMhwVQQJfQkISYb6uzYieaR9XOsNNV0EwkCSu2P/bybbt
	k7b93J6csVyxB7xdmY6jW47mIcoiUDpwkA9owfJCWe5x3a8kFQU9xVfvrDgtBSZpK4j7hvVjGq3da
	w8butafGOk7ecPJ0q2/ZCVoC37g0X1AU0T58MF9o56XGJMBdQhheGZRdRW262SuCMpuSVW37tr6VC
	tELE7F+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiTz-0000000DC8M-03KM;
	Thu, 22 Oct 2026 02:24:43 +0000
Received: from mail-japanwestazon11022079.outbound.protection.outlook.com ([40.107.75.79] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiTv-0000000DC7K-2euD;
	Thu, 22 Oct 2026 02:24:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rt+XuSC9aUO+Z+b7UTo03/wjVGIZktrnXVvAlgtxVBUTOzHTWfzYXmF1Zz8Wm/GV35CUno68R3/henZotlmdd4vrH+RTLEoQzKEJf3AvzrtXHjA8TQvAOJVW7iq14XPHn/0/0nJyngb09WP0YPozb+I2ib8GoqH8EZcC0PgZIkrX+eC8ym9QqgbvVQdN4BA30x4IfEKFSlWCcigxIhdyglm/OSEYqNXS7wC9cjTsZSH39Zj/nUGZ9SG08Y9l0z0hLgkU4cFQIB0tRs4Kmv6o6Sp72YRg288iWYQXjtZJrNaF17DZB8FDqESiiTgEobvlDIIgmez5HT+hyFs081jDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ6TEXmRqjyEaZIEQysYmLI0+LE0QNEPyL7RQNv99xs=;
 b=wRD8k5wLcUrx3S487ZbQzJsHHLuiQ8FDmC0HZhlhfvnESzAVlD0TSLyqYxEDvUzz+x70nQAnUhlEjtM/T9PO6PdjgjM4njmn5besd0+qlf2JVRXjTQppPAlSA9SfjOvjMFbMxz+nL08SIo1EgWm5jzuqeS4gRxyOq8BHwbBkBVxVmAItj5kh8XZZUT6KqpoBJI2nfpEsf3S9XIzubgz/7GDACV3nnONryXxQEuJHZKNhofvWaucgNksqzl3xBowH4V5M+g6xM2cQnnErnHANbJiHBzBGFl7yJJafgJ+PCZbUSHp1pJbabjd0k1YLkAFXmfAdbVx+gMvPF3E2bvm1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ6TEXmRqjyEaZIEQysYmLI0+LE0QNEPyL7RQNv99xs=;
 b=jlX5ToI5tY+zET6XDrCfhgEY0qQ9JzISvo03YqVHKExYSZz2h2zcjCrV//j/3vOT4a04JOX4WB1ieTp+3blELra46fDWp8v/XPw1YrdELa3KXh23bLF44+K4fechuzt6HorexZB07w/94PvaFqTyGbH3zI8PeifFN7KfWW3PKCAAV3LNZC28nXnkEomq4F4h+ZHdrWk5aUKdmwnZGncTYEoxE0Ph2mnPl4wpO246uk2JxM5ikWsGrcTahAD8B1Kg0wZr6FfZjhgNWuQjCssOb3xmKH1IKttziCHi8Aj71/qMFYb/dqv2Dynphoi4lZn79/VxuLEOCwVqYax2heWEdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21) by TYSPR03MB7572.apcprd03.prod.outlook.com
 (2603:1096:400:432::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 02:24:23 +0000
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7]) by TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7%6]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 02:24:23 +0000
Message-ID: <83bb17dc-49e2-437f-a55f-3f8a5e77c5f4@amlogic.com>
Date: Thu, 22 Oct 2026 10:24:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
 <179259528986.4070168.179126639869298765.b4-review@b4>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <179259528986.4070168.179126639869298765.b4-review@b4>
X-ClientProxiedBy: TYCP286CA0249.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::7) To TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYNPR03MB10226:EE_|TYSPR03MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5ce28e-0c75-4b11-559f-08df2fe39644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|10067099003|22082099003|261021121427099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: miX2Jabfg5ba0UN/IHc/zDhqzbW8GTcR0yJ2XvAmkj1WcnbJiyp3kdFS07lc07Oi0FeF0HhLnbiplbL7Y7vEwzjXalEZiyNTUrPtwMe7oTtRljo18AKl5noAVK+zsvWRPr2MHbcfcD1KIrFHxYGGFBdxv6wb/d80c2f3kicyyKLLkRESc+WNckECi57ue6qoHbaJJ9uDlEo+z/UB86NVz6VN0+G8miY2PH46UxG4KvRI8tvqx7ZjmM2bSuf1OLjpeGxqom7ZIWAnpdzaNyV2yWhtCAwKvn9TXqPFIY6wBXE4zTvqN7WmKzHXU6msDt4uE03R7nN8G6eYTzy4vY6Sj1yMj5LysIv7ghTtTy1lHU+KKKH6euW2DwiqTuNEfFPMTfWPnA9A4LVVQVfD+jorTYMmLE1ZULfnXJv6uJ8BntfmjXCbDjJDNsqd1QODMxn8bOgwiefoxVkD6H5gCD4nqq06oGjqtdyKExUvQgjvCq2eeRdpOHncmQ8EjQeWD5ftWvp+4FMtkvyw3MuRqJG150E1oRt3VD+O7Xz61B21M0Reurex+EdtzbNy/ogzrjpuiVRBVvFgHDM1pmuQyGp9KCRMivBtgztVXJcxORQTMYbaF0iDsgZrTas7B4kutjRd+kUcSsXpP4iB+lRrYiLEaNXtKY35OQWdwZdWxUHLbkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYNPR03MB10226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(10067099003)(22082099003)(261021121427099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFBhRDJBZHdpS2lXUFprU0NzbHdEbzJzNytDWmxXWitVQ25tdXR4REVqamRi?=
 =?utf-8?B?Qzd5ZlZyVUdJWVZBRXR3bmd1ampPb21yOHphckVLcGlJOE0zS040UXlpeVhq?=
 =?utf-8?B?bisyaHQzZkRDb2J5a25WbzJrTkp3UTZvWHdqOUdFQWxlME1CNTZzT1dPZklU?=
 =?utf-8?B?bzEraXpnNGs5STNXTm53UTRtWEpSRE51bGxESTdnODlxZWRwTWRrMzZSQkdl?=
 =?utf-8?B?Yk1OSGJ6Q01NUzBtdCtjeHNPaFE0a2hwSHorK0VlbCtkVkJzVExyZllROURj?=
 =?utf-8?B?UXNpWmVNaStlK1BSMGNQQ0pXdzNmcmpDRnJzeWlCVml0S2NVQVhXUmY5U21u?=
 =?utf-8?B?RWZBK3JQSitYYkJ1SkxoakM4cWR0S01EZjJEdGFwYW4zcVI2Q29sMXRONGZp?=
 =?utf-8?B?dW9DQi82Z3NzMVdJYnNwNnZNZUtiS0ZaZ3E3RHBCcVkzMHRmZVBRelg1eUZS?=
 =?utf-8?B?WU1rMUl1UzFrak1BZVhwcTRMTVF1RGxDOEcxVzdxQzVINzF2Q25IdDNFQlNN?=
 =?utf-8?B?blpWUzNtUGsyZHlNQW05dVZWS1kwUVRhWmpaT01qL0lQMi9zWTI1RFNuWFNV?=
 =?utf-8?B?dnhELzNRdmNsVkN2bVdSV2dMS3dnMllITEljekF2SzE0VHp6R011My93RVFP?=
 =?utf-8?B?YzExMGQyWVg5OGdpTE8wYmJoOWhTNk9DWk1acFJuTHpFT1RQOS9ZRXpadnBZ?=
 =?utf-8?B?QTAyclJicEJIU0E0d0Z5dFJKc2p5NDlRZVFaOHU1RHd6cUZjQ2VnS0doTW12?=
 =?utf-8?B?bStUbnRoS0tyeG1vc1kvV2lrb1VwemVTMElIdUZibXBSVjFBRWdmWmtXOWo2?=
 =?utf-8?B?NzNxeWNicllGOUpJU1FZbE4xYnVaRGs1MWcvK1dkTFlPMTAxVy9HejdGQ3A0?=
 =?utf-8?B?QUFDVGY3SW5wcW9PeGUzUS90SDJqcEVZa01FUXovdExic1BaRGdkeUgwT3Nm?=
 =?utf-8?B?SjVBelhCbnRlbjRjRWtUNUszNVo3WlhMWTN2NC9SN3llbU1pUU5WQm4vYmEv?=
 =?utf-8?B?aDYyZFlYWmtVNUF5M2pkOFZUZzY0SHRKMDhOeVhyODNlVVBreXliK0daeXhp?=
 =?utf-8?B?ZHMvelBaYklPMXZHNFlnbm5wUVE3Vm1YUzF1VVF4UDExYXAwa1V4WVFIQW05?=
 =?utf-8?B?OFhrYUp3Z3JGRTl3M3Y5VXZaTllDZlc5c0d3S1RIaGNnOGRjYXB2cENSelB0?=
 =?utf-8?B?MS9UeVpSSzU1RS9HQWtFcXBKWDQ1dFVRelBrNmtNVEkrYmdBUm5SUklXK2tG?=
 =?utf-8?B?N2JucUkvWEE1VkxOVzJ2SEhVRGU4VmpmcXBrQnYzOWdGWlo3YkVZTEVWN1Jq?=
 =?utf-8?B?bzNKNThGZ05LbFBtVUxaeUtmbUY1elNxRk5CRE4vSnR1bDZ4VG9ZazdCcmNu?=
 =?utf-8?B?eDBkRW9RTzFVN1NSU0RCVzg4dFlpNXhWMktwb0xMN3JjN0d4dGdYcmF0VFY2?=
 =?utf-8?B?OHg1dGFxOHZleUxxUktua0FjQlBNOTVZRGtXekl6WEdUa1dHZzhjaWlGSWcv?=
 =?utf-8?B?T2FYVEh4aStlRlY4dE5KQldObFNOc3lHa01TdWlKajZsYnNSRTdNTEVIUndJ?=
 =?utf-8?B?OHh4MVEwdlU3bzdqWVpqdzNkNFJ5WUYydkJMeThDNFpmK3hTakN4R3UyVjZk?=
 =?utf-8?B?MDN0MjNXZUpvK0haWnNJdDc4VmZsMmh5MWVPU3NGWHpHTzZ4NllwSmgzUU81?=
 =?utf-8?B?RUlpbnBOYlNpb241ZC9SQUluZGZUWWFHQVRmNTR0RWU1WUMxVzVJQ0p3THBH?=
 =?utf-8?B?SC9TN2puRkhVTzdFRFZZMitKeEZWeTY2SlVlOFNaWDdWSFhYMUdxVlllTTgr?=
 =?utf-8?B?Z0JWUWFNT3FibmtWRG9WWGJjbHB0S25uN1VFTllrR0hEQzFlV2NFY2JSdTRp?=
 =?utf-8?B?b1NtVGwxWDdWM0l6OUw3L2RCQ2l5TEdVeHBqcFZTTEsxc250UFRvT3hKVzJR?=
 =?utf-8?B?VnExQzZDd0hseXkyNWhHVEY1enR0NGpHNFlNR1FSbVVmU00rOFRUVkhFVEp5?=
 =?utf-8?B?M0hEbGo5b0p0RTFBbDBqaVhFM2doNytZZ1dST3hxVWZlZDQwa1pka0lGVFdo?=
 =?utf-8?B?bzdRdFZUOEVnZGoydnR0ZVFJdS84SjBUdUNnUTdjZjJ0bzFZc2Iya3pGVFFI?=
 =?utf-8?B?OTAreHZsVlY5WGU5MW8zNmNybG9GSFhIK1JIYnB4Qlh2TmlYSUFJN3c5Y1pj?=
 =?utf-8?B?OW5oRlFQVzNWMXNYUEdlNVgxRFlqa1VuRnhoRFV3c1VIcVBuajdBaVpSR1cy?=
 =?utf-8?B?cWdWcVdwNDRrNFpnVURlZWdxRnZRallCR2g4UmtHYk5QMStKT3h4S0dWczZU?=
 =?utf-8?B?Zk0xZ3FjZDZybmhISjBCYUNGdUg0dCs5d0ptVk9XS3U2cENGT3pWUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5ce28e-0c75-4b11-559f-08df2fe39644
X-MS-Exchange-CrossTenant-AuthSource: TYNPR03MB10226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 02:24:23.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YK5k/NNcyvC0tEguZcpeMoN3wywSk/jaVUnewq1XrZi4wxgiHJslAW4b5j91FESFNsapALXPAiWB5Ufh8rG4tIAN+wC/lyJF6KFxoNJ1B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_192439_682972_1490C0E9 
X-CRM114-Status: GOOD (  15.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CuWcqCAyMDI2LzEwLzIxIDIzOjA4LCBKZXJvbWUgQnJ1bmV0IOWGmemBkzoKPiBbIEVYVEVSTkFM
IEVNQUlMIF0KPgo+PiBUaGUgUzQgcmVxdWlyZXMgYWRkaXRpb25hbCBjbG9jayBjb250cm9sIGJp
dHMgdG8gYmUgdHVybiBvbiB3aGlsZSBlbmFibGVkLgo+PiBUaGUgUzQgaGFzIDggVERNIGxhbmVz
LCBpbnN0ZWFkIG9mIDQgb24gcHJldmlvdXMgU29DLgo+PiBVcGRhdGUgdGhlIHdpZGdldCBhY2Nv
cmRpbmdseS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmllYmluZyBDaGVuIDxqaWViaW5nLmNoZW5A
YW1sb2dpYy5jb20+Cj4+IC0tLQo+PiAgIHNvdW5kL3NvYy9tZXNvbi9nMTJhLXRvYWNvZGVjLmMg
fCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
bWVzb24vZzEyYS10b2Fjb2RlYy5jIGIvc291bmQvc29jL21lc29uL2cxMmEtdG9hY29kZWMuYwo+
PiBpbmRleCAyMTk0MWVlNTUyYzUuLjljZmVkMzcwMjM1NCAxMDA2NDQKPj4gLS0tIGEvc291bmQv
c29jL21lc29uL2cxMmEtdG9hY29kZWMuYwo+PiArKysgYi9zb3VuZC9zb2MvbWVzb24vZzEyYS10
b2Fjb2RlYy5jCj4+IEBAIC00MSw2ICs0MSw5IEBACj4+ICAgI2RlZmluZSAgQ1RSTDBfQkNMS19T
RUxfTFNCICAgICAgICAgIDQKPj4gICAjZGVmaW5lICBDVFJMMF9NQ0xLX1NFTCAgICAgICAgICAg
ICAgICAgICAgICBHRU5NQVNLKDIsIDApCj4+Cj4+ICsjZGVmaW5lIENUUkwwX0JDTEtfRU5BQkxF
X1NISUZUICAgICAgICAgICAgICAzMAo+PiArI2RlZmluZSBDVFJMMF9NQ0xLX0VOQUJMRV9TSElG
VCAgICAgICAgICAgICAgMjkKPiBQbGVhc2UgZm9sbG93IHRoZSBpbmRlbnRhdGlvbiBjb252ZW50
aW9uIGluIHBsYWNlICgyIHNwYWNlcykKTm90ZWQgd2l0aCB0aGFua3MKPgo+PiArCj4+ICAgI2Rl
ZmluZSBUT0FDT0RFQ19PVVRfQ0hNQVggICAgICAgICAgIDIKPj4KPj4gICBzdHJ1Y3QgZzEyYV90
b2Fjb2RlYyB7Cj4+IEBAIC0xNDEsNiArMTQ0LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25k
X3NvY19kYXBtX3dpZGdldCBzbTFfdG9hY29kZWNfd2lkZ2V0c1tdID0gewo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmZzEyYV90b2Fjb2RlY19vdXRfZW5hYmxlKSwKPj4gICB9Owo+Pgo+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0IHM0X3RvYWNvZGVjX3dp
ZGdldHNbXSA9IHsKPj4gKyAgICAgU05EX1NPQ19EQVBNX01VWCgiU1JDIiwgU05EX1NPQ19OT1BN
LCAwLCAwLAo+PiArICAgICAgICAgICAgICAgICAgICAgICZzbTFfdG9hY29kZWNfbXV4KSwKPj4g
KyAgICAgU05EX1NPQ19EQVBNX1NXSVRDSCgiT1VUIEVOIiwgU05EX1NPQ19OT1BNLCAwLCAwLAo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICZnMTJhX3RvYWNvZGVjX291dF9lbmFibGUpLAo+
PiArICAgICBTTkRfU09DX0RBUE1fU1VQUExZKCJJMlMgQkNMSyBHYXRlIiwgVE9BQ09ERUNfQ1RS
TDAsIENUUkwwX0JDTEtfRU5BQkxFX1NISUZULCAwLCBOVUxMLCAwKSwKPj4gKyAgICAgU05EX1NP
Q19EQVBNX1NVUFBMWSgiSTJTIE1DTEsgR2F0ZSIsIFRPQUNPREVDX0NUUkwwLCBDVFJMMF9NQ0xL
X0VOQUJMRV9TSElGVCwgMCwgTlVMTCwgMCksCj4gQkNMSyBHYXRlID0+IEJDTEsgRU4sIHNhbWUg
Zm9yIE1DTEsKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4gSeKAmWxsIGZpeCBpdC4KPgo+
PiArCj4+ICt9Owo+PiArCj4+ICAgc3RhdGljIGludCBnMTJhX3RvYWNvZGVjX2lucHV0X2h3X3Bh
cmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzbmRfcGNtX2h3X3BhcmFtcyAqcGFy
YW1zLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNu
ZF9zb2NfZGFpICpkYWkpCj4+IEBAIC0yMjYsNiArMjM5LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc25kX3NvY19kYXBtX3JvdXRlIGcxMmFfdG9hY29kZWNfcm91dGVzW10gPSB7Cj4+ICAgICAg
ICB7ICJPVVQgQ2FwdHVyZSIsIE5VTEwsICJPVVQgRU4iIH0sCj4+ICAgfTsKPj4KPj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3JvdXRlIHM0X3RvYWNvZGVjX3JvdXRlc1tdID0g
ewo+PiArICAgICB7ICJTUkMiLCAiSTJTIEEiLCAiSU4gQSBQbGF5YmFjayIgfSwKPj4gKyAgICAg
eyAiU1JDIiwgIkkyUyBCIiwgIklOIEIgUGxheWJhY2siIH0sCj4+ICsgICAgIHsgIlNSQyIsICJJ
MlMgQyIsICJJTiBDIFBsYXliYWNrIiB9LAo+PiArICAgICB7ICJPVVQgRU4iLCAiU3dpdGNoIiwg
IlNSQyIgfSwKPj4gKyAgICAgeyAiT1VUIENhcHR1cmUiLCBOVUxMLCAiT1VUIEVOIiB9LAo+PiAr
ICAgICB7ICJPVVQgRU4iLCBOVUxMLCAiSTJTIEJDTEsgR2F0ZSIgfSwKPj4gKyAgICAgeyAiSTJT
IEJDTEsgR2F0ZSIsIE5VTEwsICJJMlMgTUNMSyBHYXRlIiB9LAo+IEF1ZGlvIHNpZ25hbCBkb2Vz
IG5vdCBnbyB0aHJvdWdoIHRob3NlIEdhdGUgZWxlbWVudHMKPiBUaGV5IHNob3VsZCBiZSBzdXBw
bHkgcGF0aCBjb25uZWN0ZWQgdG8gT1VUIEVOLgpUaGFua3MgZm9yIHlvdXIgZ3VpZGFuY2UuIElz
IGl0IGNvcnJlY3QgdG8gdXNlIHRoZSBtZXRob2QgYmVsb3c/CgogIHsiT1VUIEVOIiwgTlVMTCwg
IkkyUyBCQ0xLIEVOIiB9LAogIHsiT1VUIEVOIiwgTlVMTCwgIkkyUyBNQ0xLIEVOIiB9LAoKPgo+
IC0tCj4gSmVyb21lCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
