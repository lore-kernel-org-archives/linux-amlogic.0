Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373ADC47DDB
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jan 2024 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffFvx1IR8WGEztmZF9TnruhFCq6eV/UVKyPeMalYfzs=; b=U9P36KeTeK1wFazyMz+jw/h+r/
	TidFOZgEywhTLpMyg/903m2Fb8PvZrRzejGQlMPT/dWuSfeISu5sP3c3TTUU7bmsuSFBIUuD76e3e
	MbUZU82ti7rhR3x7ABOzPLs9xjFTYNuMu+BSvAbu8VbfCK6dYfI+Q5TzOVsIXIqCO0UHy1uf6FRNv
	275e8euoUVq8Q0RLaoVh21Clj67zMCbBW0qIHYhLVe8macDBvjmAlKjUj+ZfioX11OgPDdf4iCQG1
	qY8Mito8qN8plqeOmKmGA6YXOVoEltE04FhlWGeE9u1T8bOV2fZCJhVJYt0eZpJ0qnwFK/0YlSRoU
	+vDERAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSCA3-00FY1N-0p;
	Tue, 23 Jan 2024 08:29:35 +0000
Received: from mail-southeastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c401::] helo=SG2PR03CU006.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSC9w-00FXyY-2H
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jan 2024 08:29:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/bkCC7NfGbg0Wqi3/0DWg2XsZE5LJfxVl2lfEsAfg7WE6kMR1U9dp0goOVqb9i/IcGQHO5ZssNFV0xbGfIqdNz1Uj67PPeG/sAF4UicVLOutsjwjiauYGn5m5lrKUL2rn5nxCYEEnEpb910GKorsHg9vHRxOIERR7qv5T2dVc6uytSxcEzJW5iF4xhuiBgOozWuzWHttW0YqGGE88RBaT9iEA4WKpzf54VWPNomz2RVC2l6RuqCS2v58rBs7n8EIfv2Ak8trwZxEKPnK8Wg4tJKAYjFKVXihOdA6YQEMwkCfI+lXekuAcuMwNw2wmKjX3HplnLk933mbrNeT3SF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcNGOnC5SvB38mXshBQi3U0sHED31FtI2sBciK8GJsk=;
 b=n5oLkNzqcIWgH0oAMWe640OJRc01lcW9//sKCLpYEwxF9lg0fBRTD/x9crHvUo791u8QE7VwF1MoJgT0jcBkdTjkY+vI3QSrVIXnQ3owaiHvCUZm0t10vkzdnbx/X8Dq2N+6OX5gU7IwiBfOo2Y/U84fdVBbqtSpj4kfrI9qoZwGC9+dJLf7r44N9/Mj7OdQ7PheiES1xAU6Gw1baQhLGdXm8YhE+Pi/4MUi6UeLWBNTgjEmMO7W4jA3lYLcp1aOYqhow50C3pw8fRYFttFuiZscR2o2eTTW67luvGoV8rv36PJzFZkggDyhX6Xaqpg62/zAypHQCVfDKnD+8GN2hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcNGOnC5SvB38mXshBQi3U0sHED31FtI2sBciK8GJsk=;
 b=OZDWVUNHKgv66zm/Al/icTL0nlxTm/sYc0YO8xBDPk/mERU1BtGgJvWsIX2BxuzNpg6cZwDgr2qdZYOlG7QG8bNpQKO/Vgzc2Jf8Mp2VvXqw7IFu3a8IxhG/JqPfXOYhQqiydUFPxlIIEv1iX9PT1cs0NI0cq34qJci/t4RDPtKFqm3KDL560PoGqQ6e6Fhb2LQquenRvb0OG3mtE9vwzfgHQxm5MfiA6wwf0IQ4wp7xfMGbvZEpsM7CQX3NW4E8rOOgJQ0KNmTHbxV71+aO2JCfFkPAtHbDBOD2zzb3pxBWElfW4yeISncALAHh4vyAqrRlIQqxzlNQ5ECZRD4AwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by KL1PR0302MB5428.apcprd03.prod.outlook.com (2603:1096:820:45::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Tue, 23 Jan
 2024 08:29:14 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::bcf5:a954:cee6:a0ed]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::bcf5:a954:cee6:a0ed%5]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 08:29:14 +0000
Message-ID: <66299b86-311a-43ff-a06e-9698dec5e804@amlogic.com>
Date: Tue, 23 Jan 2024 16:28:34 +0800
User-Agent: Mozilla Thunderbird
From: Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: pwm: amlogic: fix s4 bindings
To: Jerome Brunet <jbrunet@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-2-jbrunet@baylibre.com>
 <awxboh3nv4r5p7v7vcgwttu2m74fws47johb73c5f7econ2qqu@zl5xbnoeyclq>
 <1jbk9kxm52.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-GB
In-Reply-To: <1jbk9kxm52.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|KL1PR0302MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: c625db98-fa1b-4179-1908-08dc1bed61be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SM0SnPZT/DVL9tC5kjnjTE6AbpgrhU6m+YQ8NeOcDMnNbtm1fXspFgVBVrbIqNVM52EZDoas5cKAZa81ei2OjK5jdyWvcHNa+ah7Qz3rmBJ77gLoAx+131az1bp0xKnGzuH36QY9+R3/mOvlnXK+qlevWCl79+R8N++CEeDJhgkjf5CJ3lh44N/XDvoHYEZf4UMFNBzWTrixCJv6zOAx5wddjDUo0+Olkh6jEIJ0ivw8q/0sBbyuXK9zWRHI4AqaarjUol2OzHbszQi4Qnch9u/g9xXItzs6Uzd1xjZEUni9hWZGm4GSTJB0IBu3uqQmScuID6ta6wbJTOTlt7fHY5mRLkv/6eCQinAE52CoPZwK8d6tKFBpPYDkCrgJZgDhdhYH6K7TjUl6RJrNf3je+CNizCsYDXaZR+tNAMq7pv5Tf+coXSNDotV2yZr6M/B3HbfjxjFJAsEW8WmUw7pBJ7xjiz0csVWzKJAWgbNXhCOAYSG/myEwtnPcWWBe7TvxeyoHpG7GGnggKpIlSXrfAycfJ+0lgLP2eQGapHgR9uYYW3S8fFBmyiu197u+soUllVwXRca8wT9tkCJvic4AwguHra2bkJRLrF44k4MZohh2jKQZlFZ+MpJKB5jF0s+PKqFJJLRf8r2P/8jiwVLwP3H+O2hgPhTxU/OMpWPYkFqTw40sUcEnLmq5GtUftQZM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(346002)(396003)(366004)(230922051799003)(230173577357003)(230273577357003)(1800799012)(64100799003)(451199024)(186009)(53546011)(6506007)(54906003)(66476007)(316002)(66556008)(2616005)(110136005)(6512007)(66946007)(5660300002)(26005)(66574015)(478600001)(31686004)(6486002)(6666004)(83380400001)(44832011)(2906002)(36756003)(31696002)(38100700002)(41300700001)(86362001)(8676002)(66899024)(8936002)(4326008)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzQvSWxDczNRUGt3VHpxQlFwOGMrODFLTlZIUEVLYWRTTFJSdlBDY0tiakFX?=
 =?utf-8?B?ZTBWTjRYZnlLU2ZtMU5lSmxXejltRFI2eDdlVldlRE5xRnY3bS9janhIWWlK?=
 =?utf-8?B?UWpOSkQvSEpndXREV1R2ZStPTldjUi9kNmI4RzQ2YlROclBCcGhYVVZQd3Zu?=
 =?utf-8?B?SmRQT0RYb1l3QjFMNThZQUl5Nis3Um9MMjlsWVdJdmh4U1lyOTdJWXdhQjlt?=
 =?utf-8?B?NlpVa0N1NWhvek81TFE5ZzN5bjdNL29HSDU0bTRpb08zVjZhTFovajd6anNv?=
 =?utf-8?B?OWhhbTFtM2tYSytDYkR5SlZ6cGdzYk9mRTF6NklnZDZ6UjhmYjUvNytRcUtm?=
 =?utf-8?B?T1dkbTJsRk40cDBhMVBOQ0VEQVAwMTRFVGlTcS9sQ1VaQzZ2RXVFTHNEWUtY?=
 =?utf-8?B?ODl5RmtaY1dSZ2xramNUb1VBdjFzOXQ3U1h5QWxPdXNGTmZ6V1dZM29WRklH?=
 =?utf-8?B?d2RLTTg0UVA1czBiZGJGQkdXZ2dPbmZ3c1dEUUNNRXZBYVprYTVFMzhPaFND?=
 =?utf-8?B?YjdSbmJuTGhkZEpwL2tGeXpTRjNkK0FNanljN21VYkNKRHRjQmxUb2ZTajhG?=
 =?utf-8?B?ZldKQVZNT3BNRElUSENTWmJNUEpLbTFUM211Y2ZNdDV0WVNudHlDV3pQZzRZ?=
 =?utf-8?B?YXh2cUhlUlZtd3NnbjZGd0xEdTRuVGpoT0gyVlNPVWNScDhpM0NHaUhqR09W?=
 =?utf-8?B?ZGFnY1RUcHdNTjRTY1JkWk81ZGlaT1JCM29CS0JacEk3d0Y5amtjY3JLQU5W?=
 =?utf-8?B?L1BVaDd2R2dqS0YwenVNbEhjVEpLRVoyVFVnTk9yTzFHTTNsZW9BbEJyWEFX?=
 =?utf-8?B?aWNlY2trbUdzWkRyRUsrR0E3YTV4Mk12d0ZadS81ZzRrZXlHY0NOY0hpNW15?=
 =?utf-8?B?WUdhMXYyMHRmTXp1Um1tUGVTNVpBV0QyNlcxMlFCelFvOEQ0eGJSSGVJMjRm?=
 =?utf-8?B?b1IxYVFJUUdDdFZiZzhjd1FZSWFjZmpWOUtSZTFHZ3ZJMHR3TmdHdC9UK2FV?=
 =?utf-8?B?VjNqMk9XdkJOM2xJSFdjZHVoeE9yaXlKS1VHSDROeVk0Wm94bEZ1WnJjZjVL?=
 =?utf-8?B?a0xoOFQrd2tFMW5VQ1BoOXFOVkxKOEZiaUZmSnhkWTMxNTY1dzdDQWNSc0RI?=
 =?utf-8?B?NmMzanZlUENTYTQ4ZGxzanFlRzdabEUwMjZZM2NDNGx0NUg5VDZWTXZmSEVM?=
 =?utf-8?B?bUVOOXovNEJXb3BLOVZLUFhvS1ZJa1duRlZBODh5WmtURGppajJYelZSdXZL?=
 =?utf-8?B?RGgyRGtSZVRhZjhTSHMwZFhYL3l2K0kvWUdwenIzQThjSlNiSVJFZFljeFc1?=
 =?utf-8?B?OVJocmZvRGYycmRBZ0IvMnlxMWEzNE83Mng3bVpCYThnUG1uVHVQNHlURnZS?=
 =?utf-8?B?enNjR3BDRFQxbXhMaVl0alpXWUNHUVR4NkF1L0RIZEpSb3RqWGRZekpVM245?=
 =?utf-8?B?aTRDV0Q0dUZ0bnZ4bUpLUTlZU2V0K2NlRmszTVltSGRicDFpNERQc1B4QStN?=
 =?utf-8?B?UmJnaFd5MWh5NG0xWjVRVythU2JuT2Rac01HSngrZzZqTXhLZHdPdHVzY1dr?=
 =?utf-8?B?YmNiOTkwYVFKNU9WV1FlY0xlblZjTXcvZitnWStoUkh3UmlYek1Uc0IzcFo3?=
 =?utf-8?B?WEhHVmxsR3BkYlJRZjRVVTlUL0o1VmNvdjNZMXVHNHFCNmdxcWdpZW5Eb1VJ?=
 =?utf-8?B?L0M0Z2oyRXpmUWgvS1MyV0lDVUhoQ3FMWGdHV0xVck5IT2ZOWC9LaGs3QUlp?=
 =?utf-8?B?T2ZDRS9rYzQzTDQrUit1YktaUmhmazM2OURyam05aDBUMGd4U0pJVkZtM1lw?=
 =?utf-8?B?WkJvNzRrU0pMVUZPQU1aSGhhZit4c0tIQUpLWGJlS2xaeFdXNVNQUHYzdXQ1?=
 =?utf-8?B?bFVKUzBpY0tvcHVCUG5nSlRMVmQ4NXFiQ0lZS01uWmhrZXJTZW43NjJKSWlw?=
 =?utf-8?B?aFUrNEIxdlF5T3R1azllMlhYOGZpTHcvNnZBRFh6MTlZVy8vaHFlYzkrZ1Jv?=
 =?utf-8?B?VlVXWktkRERqbkxCRW1JMUpYcWFFc2JUeTN2SEZSNmxNdmx0LzROSzNTUGdP?=
 =?utf-8?B?YTJKMGQrWkN2UkpveURiOHgzMW9aSyt6c0x1eHBCQS92SjVwTmFjZFZnckhR?=
 =?utf-8?Q?J053f3tQ6FOPygPHSjeKKP6wZ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c625db98-fa1b-4179-1908-08dc1bed61be
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 08:29:14.2447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxjmGu0U9PNN1S6YVz6VpO7nmeeb6/kxiRd4QTj7dp5/Li2ELvMcKd5cfr+gwfZm8TMJPtE2Lqzj+NaQyhnDVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_002930_942940_111E0353 
X-CRM114-Status: GOOD (  33.03  )
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

CgpPbiAyMDI0LzEvMTcgMTg6MzAsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gT24gV2VkIDE3IEphbiAyMDI0IGF0IDExOjAzLCBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiAKPj4gW1tQR1AgU2ln
bmVkIFBhcnQ6VW5kZWNpZGVkXV0KPj4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6MTY6NDlQ
TSArMDEwMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4+IHM0IGhhcyBiZWVuIGFkZGVkIHRvIHRo
ZSBjb21wYXRpYmxlIGxpc3Qgd2hpbGUgY29udmVydGluZyB0aGUgQW1sb2dpYyBQV00KPj4+IGJp
bmRpbmcgZG9jdW1lbnRhdGlvbiBmcm9tIHR4dCB0byB5YW1sLgo+Pj4KPj4+IEhvd2V2ZXIsIG9u
IHRoZSBzNCwgdGhlIGNsb2NrIGJpbmRpbmdzIGhhdmUgZGlmZmVyZW50IG1lYW5pbmcgY29tcGFy
ZWQgdG8KPj4+IHRoZSBwcmV2aW91cyBTb0NzLgo+Pj4KPj4+IE9uIHRoZSBwcmV2aW91cyBTb0Nz
IHRoZSBjbG9jayBiaW5kaW5ncyB1c2VkIHRvIGRlc2NyaWJlIHdoaWNoIGlucHV0IHRoZQo+Pj4g
UFdNIGNoYW5uZWwgbXVsdGlwbGV4ZXIgc2hvdWxkIHBpY2sgYW1vbmcgaXRzIHBvc3NpYmxlIHBh
cmVudHMuCj4+Pgo+Pj4gVGhpcyBpcyB2ZXJ5IG11Y2ggdGllZCB0byB0aGUgZHJpdmVyIGltcGxl
bWVudGF0aW9uLCBpbnN0ZWFkIG9mIGRlc2NyaWJpbmcKPj4+IHRoZSBIVyBmb3Igd2hhdCBpdCBp
cy4gV2hlbiBzdXBwb3J0IGZvciB0aGUgQW1sb2dpYyBQV00gd2FzIGZpcnN0IGFkZGVkLAo+Pj4g
aG93IHRvIGRlYWwgd2l0aCBjbG9ja3MgdGhyb3VnaCBEVCB3YXMgbm90IGFzIGNsZWFyIGFzIGl0
IG5vd2FkYXlzLgo+Pj4gVGhlIExpbnV4IGRyaXZlciBub3cgaWdub3JlcyB0aGlzIERUIHNldHRp
bmcsIGJ1dCBzdGlsbCByZWxpZXMgb24gdGhlCj4+PiBoYXJkLWNvZGVkIGxpc3Qgb2YgY2xvY2sg
c291cmNlcy4KPj4+Cj4+PiBPbiB0aGUgczQsIHRoZSBpbnB1dCBtdWx0aXBsZXhlciBpcyBnb25l
LiBUaGUgY2xvY2sgYmluZGluZ3MgYWN0dWFsbHkKPj4+IGRlc2NyaWJlIHRoZSBjbG9jayBhcyBp
dCBleGlzdHMsIG5vdCBhIHNldHRpbmcuIFRoZSBwcm9wZXJ0eSBoYXMgYQo+Pj4gZGlmZmVyZW50
IG1lYW5pbmcsIGV2ZW4gaWYgaXQgaXMgc3RpbGwgMiBjbG9ja3MgYW5kIGl0IHdvdWxkIHBhc3Mg
dGhlIGNoZWNrCj4+PiB3aGVuIHN1cHBvcnQgaXMgYWN0dWFsbHkgYWRkZWQuCj4+Pgo+Pj4gQWxz
byB0aGUgczQgY2Fubm90IHdvcmsgaWYgdGhlIGNsb2NrcyBhcmUgbm90IHByb3ZpZGVkLCBzbyB0
aGUgcHJvcGVydHkgbm8KPj4+IGxvbmdlciBvcHRpb25hbC4KPj4KPj4gcy9uby9pcyBuby8KPj4K
Pj4+IEZpbmFsbHksIGZvciBvbmNlIGl0IG1ha2VzIHNlbnNlIHRvIHNlZSB0aGUgaW5wdXQgYXMg
YmVpbmcgbnVtYmVyZWQKPj4+IHNvbWVob3cuIE5vIG5lZWQgdG8gYm90aGVyIHdpdGggY2xvY2st
bmFtZXMgb24gdGhlIHM0IHR5cGUgb2YgUFdNLgo+Pj4KPj4+IEZpeGVzOiA0M2ExYzRmZjM5Nzcg
KCJkdC1iaW5kaW5nczogcHdtOiBDb252ZXJ0IEFtbG9naWMgTWVzb24gUFdNIGJpbmRpbmciKQo+
Pj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPj4+IC0tLQo+Pj4g
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLWFtbG9naWMueWFtbCAgfCA2NyArKysr
KysrKysrKysrKysrLS0tCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcHdtL3B3bS1hbWxvZ2ljLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcHdtL3B3bS1hbWxvZ2ljLnlhbWwKPj4+IGluZGV4IDUyNzg2NGE0ZDg1NS4u
YTFkMzgyYWFjYjgyIDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3B3bS9wd20tYW1sb2dpYy55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1hbWxvZ2ljLnlhbWwKPj4+IEBAIC05LDkgKzksNiBAQCB0
aXRsZTogQW1sb2dpYyBQV00KPj4+ICAgbWFpbnRhaW5lcnM6Cj4+PiAgICAgLSBIZWluZXIgS2Fs
bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+Pj4KPj4+IC1hbGxPZjoKPj4+IC0gIC0gJHJl
ZjogcHdtLnlhbWwjCj4+PiAtCj4+PiAgIHByb3BlcnRpZXM6Cj4+PiAgICAgY29tcGF0aWJsZToK
Pj4+ICAgICAgIG9uZU9mOgo+Pj4gQEAgLTQzLDEyICs0MCw4IEBAIHByb3BlcnRpZXM6Cj4+PiAg
ICAgICBtYXhJdGVtczogMgo+Pj4KPj4+ICAgICBjbG9jay1uYW1lczoKPj4+IC0gICAgb25lT2Y6
Cj4+PiAtICAgICAgLSBpdGVtczoKPj4+IC0gICAgICAgICAgLSBlbnVtOiBbY2xraW4wLCBjbGtp
bjFdCj4+PiAtICAgICAgLSBpdGVtczoKPj4+IC0gICAgICAgICAgLSBjb25zdDogY2xraW4wCj4+
PiAtICAgICAgICAgIC0gY29uc3Q6IGNsa2luMQo+Pj4gKyAgICBtaW5JdGVtczogMQo+Pj4gKyAg
ICBtYXhJdGVtczogMgo+Pj4KPj4+ICAgICAiI3B3bS1jZWxscyI6Cj4+PiAgICAgICBjb25zdDog
Mwo+Pj4gQEAgLTU3LDYgKzUwLDU1IEBAIHJlcXVpcmVkOgo+Pj4gICAgIC0gY29tcGF0aWJsZQo+
Pj4gICAgIC0gcmVnCj4+Pgo+Pj4gK2FsbE9mOgo+Pj4gKyAgLSAkcmVmOiBwd20ueWFtbCMKPj4+
ICsKPj4+ICsgIC0gaWY6Cj4+PiArICAgICAgcHJvcGVydGllczoKPj4+ICsgICAgICAgIGNvbXBh
dGlibGU6Cj4+PiArICAgICAgICAgIGNvbnRhaW5zOgo+Pj4gKyAgICAgICAgICAgIGVudW06Cj4+
PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb244LXB3bQo+Pj4gKyAgICAgICAgICAgICAg
LSBhbWxvZ2ljLG1lc29uOGItcHdtCj4+PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24t
Z3hiYi1wd20KPj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neGJiLWFvLXB3bQo+
Pj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1lZS1wd20KPj4+ICsgICAgICAg
ICAgICAgIC0gYW1sb2dpYyxtZXNvbi1heGctYW8tcHdtCj4+PiArICAgICAgICAgICAgICAtIGFt
bG9naWMsbWVzb24tZzEyYS1lZS1wd20KPj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNv
bi1nMTJhLWFvLXB3bS1hYgo+Pj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEt
YW8tcHdtLWNkCj4+PiArICAgIHRoZW46Cj4+PiArICAgICAgIyBIaXN0b3JpYyBiaW5kaW5ncyB0
aWVkIHRvIHRoZSBkcml2ZXIgaW1wbGVtZW50YXRpb24KPj4+ICsgICAgICAjIFRoZSBjbG9ja3Mg
cHJvdmlkZWQgaGVyZSBhcmUgbWVhbnQgdG8gYmUgbWF0Y2hlZCB3aXRoIHRoZSBpbnB1dAo+Pj4g
KyAgICAgICMga25vd24gKGhhcmQtY29kZWQpIGluIHRoZSBkcml2ZXIgYW5kIHVzZWQgdG8gc2Vs
ZWN0IHB3bSBjbG9jawo+Pj4gKyAgICAgICMgc291cmNlLiBDdXJyZW50bHksIHRoZSBsaW51eCBk
cml2ZXIgaWdub3JlcyB0aGlzLgo+Pgo+PiBJIGFkbWl0IEkgZGlkbid0IHVuZGVyc3RhbmQgdGhl
IHJlbGV2YW50IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZAo+PiB0aGUgbmV3IGJpbmRp
bmcgeWV0Lgo+IAo+IExldCdzIHRyeSB0byBleHBsYWluIGRpZmZlcmVudGx5IHRoZW46Cj4gKiBT
byBmYXIgZWFjaCBBTUwgUFdNIElQIGhhcyAyIHB3bS4KPiAqIFVwIHRvIEcxMiwgNCBpbnB1dCBQ
TEwvY2xvY2tzIGFyZSB3aXJlZCB0byB0aGUgSFcgSVAgYW5kIHRoZXJlCj4gICAgbXV4L2Rpdi9n
YXRlIHRvIHNlbGVjdCB3aGljaCBpbnB1dCB0byB0YWtlLgo+ICAgIC0gVGhlIGhpc3RvcmljIGJp
bmRpbmdzIGp1c3QgZGVzY3JpYmVkIGhvdyB0byBzZXR1cCBlYWNoIG9mIHRoZSAyCj4gICAgICBp
bnRlcm5hbCBtdXhlcyAtIDIgb3B0aW9ubmFsIGNsb2Nrcy4KPiAgICAgIFRoZSBhY3R1YWwgNCBp
bnB1dHMgbmFtZXMgZnJvbSBDQ0YgYXJlIGhhcmQgY29kZWQgaW4KPiAgICAgIHRoZSBkcml2ZXIu
IFRoaXMgaXMgYSBwcmV0dHkgYmFkIGRlc2NyaXB0aW9uLiBUaGUgZHJpdmVyIGhhcyBiZWVuCj4g
ICAgICB1cGRhdGVkIHNpbmNlIHRoZW4gdG8gdXNlIENDRiB0byBmaWd1cmUgb3V0IHRoZSBiZXN0
IHBhcmVudAo+ICAgICAgYWNjb3JkaW5nIHRvIHB3bSByYXRlIHNvIHRoaXMgc2V0dGluZyBpcyBp
Z25vcmVkIG5vdy4KPiAgICAtIFRoZSAnbmV3JyBiaW5kaW5ncyAoaW50cm9kdWNlZCBpbiBwYXRj
aCAjMikgZml4ZXMgdGhlIHByb2JsZW0gYWJvdmUKPiAgICAgIGJ1dCB0aGUgbWVhbmluZyBvZiB0
aGUgY2xvY2sgYmluZGluZyBpcyBkaWZmZXJlbnQuIEl0IGRlc2NyaWJlcyB0aGUKPiAgICAgIGFj
dHVhbCBIVyBwYXJlbnRzIC0gNCBjbG9ja3MsIG9wdGlvbm5hbCBzaW5jZSBzb21lIGFyZSBub3Qg
d2lyZWQgb24KPiAgICAgIHNvbWUgUFdNIGJsb2Nrcy4gVG8gYXZvaWQgYnJlYWtpbmcgdGhlIEFC
SSwgYSBuZXcgY29tcGF0aWJsZSBmb3IKPiAgICAgIHRoZXNlIFNvQyBpcyBpbnRyb2R1Y2VkLgo+
IAo+PiAoVGhlIGRyaXZlciBjdXJyZW50bHkgZG9lc24ndCBzdXBwb3J0IHRoZSBzNCwgcmlnaHQ/
KQo+IAo+IEluZGVlZC4gSSBrbm93IEFtbG9naWMgaXMgcHJlcGFyaW5nIHRoZSBzdXBwb3J0LiBJ
IGNvdWxkIGRvIGl0IGluIHRoaXMKPiBzZXJpZXMgYnV0IEkgcHJlZmVyIHRvIGVuY291cmFnZSB0
aGVtIHRvIGNvbnRyaWJ1dGUuIEl0IHNob3VsZCBjb21lCj4gc2hvcnRseSBhZnRlciB0aGlzIHNl
cmllcyBpcyBtZXJnZWQuClllcy4gQW1sb2dpYyBpcyB3YWl0aW5nIHRoZXNlIHBhdGNoZXMgb2Yg
SmVyb21lLiBhZnRlciB0aGVzZSBtZXJnZSwgd2UgCndpbGwgc3RhcnQgdG8gcmViYXNlIGFuZCBz
dWJtaXQgczQgY29kZS4KLQpCZXN0IFJlZ2FyZHMgSnVueWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
