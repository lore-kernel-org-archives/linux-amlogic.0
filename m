Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2272CC47258
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jan 2024 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtdZAnY9D4d+wUJjEViCwMZTZy1LbhrM7s2b/dvHW/M=; b=UaKv6MyOibwOo7+u7RkqDg47TH
	0gkuCAYk6C0Tyva8q5WFSiQebxeA63SH2PdVq5QToCDJI9OiJs73LCGDSPV3bKkScb6Ta0FMLtFJk
	YKC3eiVQGM0Ie+KqKExfstVhRXzfW3+dFqKtlR1jKarQaSCV85nwDq7GEBRbQ8Nam+UJhbnHqNSxH
	ArfyZwUxFlpau5zO7QyKj1k6khYMatCXkEVxh7i5OTscU1YD2pmafd3bM/WGT/oz4tC5nn/n4n97P
	qHrOiRJEHhnMF1+h7ms0sXKvQ9DIoTUhgn0lkG86/CeVJbK3+Orsp5FaKAykbabDZ6ZJdTOo3m3EN
	SATJxnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSug7-007Cea-2Q;
	Thu, 25 Jan 2024 08:01:39 +0000
Received: from mail-psaapc01on2070c.outbound.protection.outlook.com ([2a01:111:f400:feae::70c] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStcr-006uTU-2J
	for linux-amlogic@lists.infradead.org;
	Thu, 25 Jan 2024 06:54:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BK1RQYkZaeqbIjBnKnoWeTzDYAWPjjwho+nB/gn1GvunvyvZM143H0jEHXX1TteuA9gVo7/3EP2x6GHjcpjSmgg7srB2Av6WrtuVRRldxicji1veq1/xqmmn2Phksu/V16PQIRH6MOUiIdTeaL1r9jQeHX6b1mztkvu8CJJfRfr6e4veDBZkAoyNiPfzgLcbf1v3HeVw0pMmV/Dk1uimSRxUHyTanIdzOdgZCrvNMpQUH8OWNIu4rcvsqrsu38xV70A+4sk+V6gc0NGzTNzMWrF3OYeJOJKGVtmKS79quttfUSR85jDRu8bKsH/1+BwnqiUryqTxwrDpsS1v+4vscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHXGpeSObhmcSLNQnnT/spDPJj19r6OYUOIBEUEkAlw=;
 b=S5kK2OXE70q3yhxyxq5s0HFf16/lVwNa7Z6HRatOY3Wi6E/emE0SGfsbVqw+VqzFsudaFP2mG7/Q1PwZVhbgfuYTbRNQ/cUjJQw16aUnbA/8SiIuhrr6h9m9PorDY7FxXaw8jJgiwCqRaz2XJ0FkPzgLmJhl0obhN7NXCym5IXaskiavpM79RX87c4IOt1VSQJRVWiAQo3+mEdxpTsIMrRiatT7l5D9zi5bjQHDVf6E3Qcwcyb8fOeB5wa1JhqGrfDvLs0LNrsb0g7PIc2sLbXIXAuJyjzPeSWySOdTvzvYZ9HeqwBFK41ympmlWgN4w/qH8BWh8OvORivYcWPnRHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHXGpeSObhmcSLNQnnT/spDPJj19r6OYUOIBEUEkAlw=;
 b=m3FKd5PFD1Um3DlReielKGPgw7BUVHXgHqz2uiCOKpXyQhoqjlDg5nWHAOk6E/HG5eTAr7jVapyutoJQjeXmzJWJseu9oC6Obz5TqS8kbT1aQyn+0lSFKs812/H/bM+9wzpZhf04ykSvdZeZrc3Q1ygTff7r/Fn77uC5BMvoGhQitvnfjLRLw18FmGaaJbUoNsL9yh1ADm06kqzMWFulgD1ezVG2Kv26uLnhe0WBTqeP5CAE0k+qCcSOa6Gm8Ohp7KFseSFAA4Lkkd8qWRV2D/KoN+Hbb3gMV4FfuBhH9CLi9gDdTSrHqEBg7xcpFTzIGuPXYhvaVDL8e0Uf1kt99w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5732.apcprd03.prod.outlook.com (2603:1096:820:70::7)
 by SEYPR03MB7780.apcprd03.prod.outlook.com (2603:1096:101:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 06:53:52 +0000
Received: from KL1PR03MB5732.apcprd03.prod.outlook.com
 ([fe80::d8bc:1799:661e:dc86]) by KL1PR03MB5732.apcprd03.prod.outlook.com
 ([fe80::d8bc:1799:661e:dc86%7]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 06:53:52 +0000
Message-ID: <6ee50584-38f8-4c34-8b54-4ee6af4c3906@amlogic.com>
Date: Thu, 25 Jan 2024 14:53:46 +0800
User-Agent: Mozilla Thunderbird
From: Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 5/6] pwm: meson: don't carry internal clock elements
 around
To: Jerome Brunet <jbrunet@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-6-jbrunet@baylibre.com>
 <gyhea42rtydw3g45lfkfbxfm6xcbwibz67vw7xke2sm7powz2a@i33g4pyanu4l>
 <1jttn3w0ja.fsf@starbuckisacylon.baylibre.com>
 <jlrptw2norojxgpfmsybv6b5aq3epkdkqvri2l2rkvtx5qofjd@q4ggezt47a42>
 <1jplxrvyin.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-GB
In-Reply-To: <1jplxrvyin.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: TY1PR01CA0186.jpnprd01.prod.outlook.com (2603:1096:403::16)
 To KL1PR03MB5732.apcprd03.prod.outlook.com (2603:1096:820:70::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5732:EE_|SEYPR03MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 685a3964-44dd-4c0c-a99b-08dc1d726426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZC56CGuT1Ty5SPcSfcAdg4BGbwIuABh2mra9WvniEEhRSnggtURvqO/wpwRdkDzmY7u7d5x4JY4xTs7W1sZGzwkjCzQMYhtZWWJ+1krMn2eVZ+h8ZV+bf9MFyKa8eEeelbrK7CtDy0/9fSbf0qQK6PTDAt4zvjYkTRbR65vCzhLvnwL434gJC9JEhuAMoEIYJwaLJEqh56nY+R9JcW/Zo23xLPDJ/Mc12a3Ldr6WepEVhZQYytbX6svXsHn2c4ttNdowDNrzZ9Bxm0ZgWThXd7cDcAWfkO6Arz3D8pM/f60UMykFbX2IN1Eh6v4XA4Dlygg8V8fxXJkuesluQ1t85NCCF452qAkfWaEzEwPkecqBtTagwhLliU2tu4W0IlaMJnwSbJX0TOfw8fgF436hn6r4Qzj34gWlrpuSe7xKZRl/b5HNQcsyMaI6SM6oKGJp/TZ0SNz/bVTJErV+MU6f96y5KSIGXYK0zIV4BSqAk9FBWjTqDfJEKfW/n+L3/i2KtmxHAdbg0CRG98qDeGs0HQdo5a6guu0thtwQHm/n4v8o9xFFcQ9/FMOi7q2AH3xQA8xjbWRJlclxTtksTwkPPs9eB0T7QWtaC3sw3YiREfekZOXnvewgzUCZpho2Fc5bQjlex1u+ajI7eyStrnAr1AJ/e+jwu2wvOQjRvUc1Pa/m/bhhpYGrcTg07uNtaV/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(39850400004)(366004)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(83380400001)(316002)(8676002)(4326008)(44832011)(8936002)(41300700001)(31686004)(2616005)(54906003)(66476007)(66556008)(66946007)(26005)(36756003)(110136005)(86362001)(31696002)(6506007)(6512007)(6666004)(2906002)(7416002)(6486002)(38100700002)(478600001)(5660300002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnh4VkJra2tDb24xYjlDNk1wb3p3TERSRGxuaFFZVHorc0d0ZUUreU5STVUy?=
 =?utf-8?B?QlhhaThZTWY3RHREblRiWjRPbFppbCtVcnIxQ3Z0TFB1czkzbCtDZ2N4Z3pp?=
 =?utf-8?B?MjNoaitZakhjeUZnQ3QyVjlLRVEwUTR5aHpwUDBxdmRHRU9JRjY1enRBT1VW?=
 =?utf-8?B?M1ZBcmtTNDNyQ215cWFCcFA0OVR2TFdweDFxbE04NzUvSzUwWVFWRWxCOWdB?=
 =?utf-8?B?MXNIVmx0ZzJsNzJFS3EvejBwOGZOZ1J6L1hDYmR4K3hRcENqTmMyZThXdTBs?=
 =?utf-8?B?VGNXY3lDd1Z4Y082blNkOGhDc3h1MFV1b2ZpM2MwanA0aFlCbVpRZ2M2eXo1?=
 =?utf-8?B?YjJhZ1B5a0V0MlBETU5EOVptUHdVeHorSnlhdWZ1aHhUS1hQd3ZwOGRHcTln?=
 =?utf-8?B?R2h4cXVRay9tNGpkUjRGalFxVWovUW44ZDg4bWZxVTNGV0t5OVZ2VE1IeStr?=
 =?utf-8?B?Wi9QZlZXbHRUYjJsUEs3QWlkeVVjVGgyazFkUUtaQjZXeDc5S0hzOUNUdG5t?=
 =?utf-8?B?TTVWWS9lak9sMXFDamVkYXZKdHdmQ0RRQmNSUENKbEpxeE12bW1BcnNWL3BX?=
 =?utf-8?B?QW1VSkpaT1FEMnJ1M09oUDBzd0lpb2RGVVBMTGpuby9tdElIOXFXWUFJd0x0?=
 =?utf-8?B?dzFoV3JqOE4yZmpwcUVSQXlFNG9rTjdYVjhLVkNtbGlOZTdLU1pNMnpMckI3?=
 =?utf-8?B?KzlxVEducjV3aUl4ZmRRbWNSZWpGTE5WSXZRcUc0dHZMUHNXNFBKS2xML0pj?=
 =?utf-8?B?YnVaWDNqQTFaci9laFVoT3UxRk15OVJpOHZMUUd1aUFpTmtyMlIzaG56OFlF?=
 =?utf-8?B?cU9xMVJreWZwZnRBUzl6cm0rUTJBZ0R6RDZIUkoxdnNqUC9OenlRbmhnMlpt?=
 =?utf-8?B?VldndkFVR1FHaXZsQldDTE11RnQxTkpWSzlJbEFIUmY2NzVrTUlOMS9CRm5L?=
 =?utf-8?B?N2V6TU1Ra1VWMDZZWGUwU0pTaGlpQmw1L3JQN21PWVo2SWh2TUxqVlZueXhv?=
 =?utf-8?B?RHYyUEtJZTVBWC8zQ0QwYnYwVUxiNDVNd3JHWldHTVVqME5iT1NRMlEwSlhU?=
 =?utf-8?B?OUpGSFZSaDZqUFJrclRlSCtWVFc2RkVPcExWTjBMbXRuSDVWTGRBbzJKeS80?=
 =?utf-8?B?MUJ5VVdpbm1TUTU0UWg3ZTJYUlQ3S2tNWDhkcXM2U2VVQjlqakgxb09rMU1m?=
 =?utf-8?B?WDFRMWpSNzdGOW9YZkRLOTZucmN2R2RoMVhzK1ltZ2N0UlMyRCszSlZCenJ3?=
 =?utf-8?B?bEpGa21IN1RTSXJFdHNYQXdXN0ZOb3lBQVJrSkc5QnRNa055ODZPYUlFZkNk?=
 =?utf-8?B?Zy9XejI2aVRESGNhSkw2MnFsM0ExdHEyUFVpSWxRNWo1TmVFdm1sQnJGT3VH?=
 =?utf-8?B?dWRZYVVQbTZSV2dkc25NdTlabjRlTnZYMEZsNnNqcG5oMFNnRnRud1R4N2hN?=
 =?utf-8?B?THJyVUZzZEZKNkNUN216OW1YNmlwRHltQkIxa3AyK0JKQlArUTdReXVWUzlh?=
 =?utf-8?B?NUlhRDAvY3ZlT2swb2YxdXVna0l5UHorSUZDclM4OUZEUXcxblpQL1psa1Jl?=
 =?utf-8?B?aVlHMTFkci9xanVWbzg4NWhGTm5Yc1hSaytPQVJVYkRwTnVRTVpCbEM0b1lI?=
 =?utf-8?B?TWxjNHZZK3NOUnF5KzJmZUJoVXplRGlNUWdqOVFVYVBSanpsV1B5ZFdqcEhR?=
 =?utf-8?B?REZ2QjR0b2UrT1VXSHRJQk1xMkFWMFFmRk01bDlqMTl2bXZNNno3MzRtOG1x?=
 =?utf-8?B?TFVaMGJJWEpNYXMyaElHLzlESU5URTNmbnJEdWRrbHRoOW15YSsxbGpRRDlh?=
 =?utf-8?B?VGF5V1JQb3grNFNhMlRZakY0Z1Q1STYvVWhzZ3FhcHB3L0J3SXkwS0lhN2kw?=
 =?utf-8?B?enVrNFJYYmQ2WG56ckZBQVViSHo0NnREU1NxS3I5cnVReFVuOVJSL3g0K1hl?=
 =?utf-8?B?L3RKNVh6enQxVFd3bGFtL3VjNWF5VW5aeFJxdjAzdEFhSEN1N0E4TVBjcXFL?=
 =?utf-8?B?MThEMlBsVU1FQWJaOUVmREZ2MGJRbTJFa2owUVluL0FKUnVSZFNZWG12VkhG?=
 =?utf-8?B?Z2pwYVJ5ckl6dHpSOXBqbmNWbDVaaVM2ZkFwZFp4djJoWjFlc05lTEkyWlA1?=
 =?utf-8?Q?hVJosRjUd8SLsZDjvAGVd7wnZ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685a3964-44dd-4c0c-a99b-08dc1d726426
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 06:53:52.6219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/2cW1mGaOrray2ftp+wYFBg8JORagDBj4SyEEen5HotY57C6lYzvYNik/VHAn2EWHCV0U+2M2Sm0aaxxVFf5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_225413_778076_2E050E38 
X-CRM114-Status: GOOD (  21.46  )
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

CgpPbiAyMDI0LzEvMjQgMTc6NTksIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gT24gV2VkIDI0IEphbiAyMDI0IGF0IDEwOjQ4LCBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiAKPj4gW1tQR1AgU2ln
bmVkIFBhcnQ6VW5kZWNpZGVkXV0KPj4gSGVsbG8gSmVyb21lLAo+Pgo+PiBPbiBXZWQsIEphbiAy
NCwgMjAyNCBhdCAxMDoxNjoxN0FNICswMTAwLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+Pj4gT24g
V2VkIDI0IEphbiAyMDI0IGF0IDEwOjAyLCBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPj4+PiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAx
MjoxNjo1M1BNICswMTAwLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+Pj4+PiBAQCAtNDQyLDYgKzQz
OSwxMyBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzKHN0cnVjdCBkZXZpY2Ug
KmRldikKPj4+Pj4gICAgICAgICAgICBzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwgKmNoYW5uZWwg
PSAmbWVzb24tPmNoYW5uZWxzW2ldOwo+Pj4+PiAgICAgICAgICAgIHN0cnVjdCBjbGtfcGFyZW50
X2RhdGEgZGl2X3BhcmVudCA9IHt9LCBnYXRlX3BhcmVudCA9IHt9Owo+Pj4+PiAgICAgICAgICAg
IHN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKPj4+Pj4gKyAgICAgICAgIHN0cnVjdCBj
bGtfZGl2aWRlciAqZGl2Owo+Pj4+PiArICAgICAgICAgc3RydWN0IGNsa19nYXRlICpnYXRlOwo+
Pj4+PiArICAgICAgICAgc3RydWN0IGNsa19tdXggKm11eDsKPj4+Pj4gKwo+Pj4+PiArICAgICAg
ICAgbXV4ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCptdXgpLCBHRlBfS0VSTkVMKTsKPj4+
Pj4gKyAgICAgICAgIGlmICghbXV4KQo+Pj4+PiArICAgICAgICAgICAgICAgICByZXR1cm4gLUVO
T01FTTsKPj4+Pgo+Pj4+IEkgZG9uJ3QgbGlrZSB0aGlzIGNoYW5nZS4gV2hpbGUgaXQgZG9lc24n
dCBpbmNyZWFzZSB0aGUgbWVtb3J5IHVzZWQsIGl0Cj4+Pj4gZnJhZ21lbnRzIHRoZSB1c2VkIG1l
bW9yeSBhbmQgaW5jcmVhc2VzIHRoZSBvdmVyaGVhZCBvZiBtZW1vcnkKPj4+PiBtYW5hZ2VtZW50
IGFuZCB0aGUgbnVtYmVyIG9mIGRldm0gYWxsb2NhdGlvbnMuCj4+Pj4KPj4+PiBBcmUgdGhlc2Ug
bWVtYmVycyBvZiBtZXNvbl9wd21fY2hhbm5lbCBpbiB0aGUgd2F5IGZvciBhbnl0aGluZyBsYXRl
cj8KPj4+Cj4+PiBOb3QgcmVhbGx5LiBJdCBpcyBqdXN0IG5vdCB1c2VmdWwgb24gdGhlIFNvQ3Mg
d2hpY2ggZG8gdXNlIGl0IGFuZCBub3QKPj4+IHVzZWQgYXQgYWxsIHN0YXJ0aW5nIGZyb20gczQv
YTEuCj4+Cj4+IFRoaXMgcmVtZW1iZXJzIG1lIGFib3V0IHRoZSBvbGQgcHdtLWlteCBkcml2ZXIu
IFRoaXMgd2FzIGVzc2VudGlhbGx5IGEKPj4gc2luZ2xlIGZpbGUgY29udGFpbmluZyB0d28gZHJp
dmVycyBqdXN0IGJlY2F1c2UgYm90aCB0eXBlcyBhcHBlYXJlZCBvbgo+PiBpbXggbWFjaGluZXMu
IExhdGVyIGl0IHdhcyBzcGxpdCBpbnRvIGlteDEgYW5kIGlteDI3Lgo+Pgo+PiBJIGRpZG4ndCBs
b29rIGF0IHRoZSByZWxldmFudCBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBleGlzdGluZyBkcml2
ZXIKPj4gYW5kIHRoZSBjaGFuZ2VzIG5lZWRlZCBmb3IgczQsIGJ1dCBwbGVhc2UgZG9uJ3QgcmVw
ZWF0IHRoaXMgaXNzdWUgZm9yCj4+IG1lc29uLiBOb3Qgc3VyZSB0aGlzIGZlYXIgaXMganVzdGlm
aWVkLCBqdXN0IHNheWluZyAuLi4KPiAKPiBOb3RlZC4gRG9uJ3Qgd29ycnkuIHM0IGlzIGluZGVl
ZCB0aGUgc2FtZSBQV00gYmxvY2sgYXMgYmVmb3JlLCBqdXN0Cj4gbXV4L2Rpdi9nYXRlIG1pZ3Jh
dGVkIGZyb20gdGhlIHB3bSBJUCB0byB0aGUgbWFpbiBjbGsgY29udHJvbGxlci4KPiBUaGF0J3Mg
YWxsIC4uLiBJIGtub3cgOykKPiAKPiBPbmx5IHRoZSBjbG9jayByZWdpc3RyYXRpb24gc2hvdWxk
IGNoYW5nZSBhbmQgc2ltcGxpZnkuCj4gCj4+Cj4+IEJlc3QgcmVnYXJkcwo+PiBVd2UKPiAKPiAK
PiAtLQo+IEplcm9tZQpIaSAsVXdlIGFuZCBKZXJvbS4KQ29tcGFyZWQgd2l0aCBtOGIgZzEyYSBh
bmQgc20xLCBzNCBhbmQgQTEgYXJlIG5ldyBwd20gaXAgdGhhdCBtb3ZlZCAKTVVYL0RJVi9HQVRF
IGZyb20gcHdtIGNoaXAgdG8gY2xvY2sgdHJlZSBtb2R1bGUgYW5kIHRoZSBwd20gYmxvY2sgYXJl
IHNhbWUuCkFib3V0IG5ldyBzN++8jGNvbXBhcmVkIHdpdGggczTvvIxvbmUgcHdtY2hpcCBjb3Jy
ZXNwb25kcyBvbmUgcHdtIGNoYW5uZWwuIApMaWtl77yMd2Ugc2VwYXJhdGUgUFdNQUIgaW50byBQ
V01BIGFuZCBQV01CLgpIZXJlIGlzIGEgdmVyc2lvbiBmcm9tIEFtbG9naWMuIFdlIHdpbGwgc3Rh
cnQgdGhlIGZvbGxvd2luZyB3b3JrIG9mIHB3bSAKZHJpdmVyLiBXZWxjb20gdG8gZ2l2ZSBjb21t
ZW50cy4KCkJlc3QgcmVnYXJkcwotLQpKdW55aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
