Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FE1C43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jun 2022 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ljL06Yhjt1ir2S3oNIUgBIZgVfMQq3fSS6Duv6l/K3M=; b=f1t9vBmzz9lXy9
	X3oaEqCkpgAolACK+aUP/D2/45XhJDpZpWuz/Kf4zM1eEVazIUQYbIZjLdF2rbz6Kg0uQtoKVYLFZ
	gBb8Mjof/qVhOVQ/JsyIcfXi+B4p4WQWdtC8iEWmxGhDng46Nn0GSHfDzjT1OnyYZiyJtftYhZcgd
	X1MI1RNLOuuNREg2QLlFw/1KOZ6EYcE0Hw6cx7Voz+rOG2XN5UdIHv1eqoJdQqpD/2D9ZCq4A5fYW
	PZ86zLySpKIEFdou5Fz+zemZHpu6Yx+CMKsFzmbsYazc00S2t9EckuFnFJe89cJGTYjsIFy/gxub2
	Zoc+o5cg31/4bNncFagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kUE-00H0IH-7b; Mon, 27 Jun 2022 08:52:50 +0000
Received: from mail-os0jpn01olkn2040.outbound.protection.outlook.com ([40.92.98.40] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kUB-00H0Eg-BK
	for linux-amlogic@lists.infradead.org; Mon, 27 Jun 2022 08:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nni23nfO+/BBdyjbJC+n2h0LNVA+S2SN6w5/1XQlxHjkJ/xCuFmKkXrWTlL5DxLf2YcFtPywKV1NuaR2Cfu5yoh9m7femX49QHsWIdUzzpAsGj9iLlVJSZXVM5p68DKWXSbCNSoWfRjGyy1eexyGUxxh6Ifsje9deRr5QYbfyeRvPKbP0XhisNyNrdWKJOUMic2LCCBODN2+tPdWeV0C9l1Bh5iwULoLpUyOJvWdH4Qk9EsveRnu6qH8Q3SoGWsOj8Qoql6YuWHz5NIR1xiLXaGQZ2bVqjNjKSKoA1u623S6sRVNumkz+ahGCF2ax663feIA8/d7y2/ifQ578DZwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qh76/4cpHdUOQ5inXN0fXUKxGhkT7UCJktBJw7UymYw=;
 b=hnn8Lab3dDklCaiPzmhfksj+MFjTzfTCRYYirOc4hZ287ll3JHTvyVwfJSdgAcvBj1nyAb1ZI/DxTkhS1ZjS2z/IbGZ423ti34xI3wrBCZpzxNHmUGmEpCMZ9U4iNiNdRl7d74HukP5IH1vmQ0yFFIBsDACYY/uKLcbbOS42zMxTMclTZ8K8NTrvZazdg7gRl4+PJge2xMjdWt9Lmdo0PGg4Wb4dCX9zTTaY/hS7zfaNLKSR7BzMsgEbnRIKF+3o70ejMMESrqPRsq4gfdp1x2eulj6VjPD2caapRg7xO56rW8tOjjLr5JuzZhs1W16ow4zuAtWFZVOQl7yEKFCIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh76/4cpHdUOQ5inXN0fXUKxGhkT7UCJktBJw7UymYw=;
 b=WL+i6TiSxrxu2xfr6eWJk3iEtL0x8QqkXOtlCpmQ5xn/CvhtgvjLtFQQL7Epiljnj00zu/bhThQpFDYss7K2941xW0mZmEPiHEhZ2yGPqN4+EM1Srfcrgczglq0CR3Tcmdah5U76dauD0PQdRD605njDeKAfy+8WEdCaNQS1W6nbz3VdP16E/vSM56isvWUXbedomz7LD5ty5/ebnQFS2teKDUEei+IkZH14PJGxlGj8+oev4bbosqYL7Olk+76BvWKYihgjAzES/pZli8lO84GhA1ZHBUy2aUgFT0SR3Q8OMZzOcEaMPLWf22NQWil9uVdPwCuWXZjAil1XAbQnMQ==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by TYCP286MB2703.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:246::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 08:52:37 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::816e:460a:dd94:b94c]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::816e:460a:dd94:b94c%9]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 08:52:37 +0000
From: =?gb2312?B?1cUgxP4=?= <zhangn1985@outlook.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	Nick <nick@khadas.com>, Neil Armstrong <narmstrong@baylibre.com>
CC: =?gb2312?B?1cUgxP4=?= <zhangn1985@outlook.com>
Subject: How to test meson_gx_pm
Thread-Topic: How to test meson_gx_pm
Thread-Index: AQHYigGRzKmehYfgSk2cJU0i2Jxf9g==
Date: Mon, 27 Jun 2022 08:52:37 +0000
Message-ID:  <OS0P286MB06419BC49795C5CC383B8D75CDB99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [V4ZcY1ssPQfKcoPvkRGj4nUj/ddQ0g1M2RTO59gIJH8=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d29edc9e-879c-4bc4-6766-08da581a629b
x-ms-exchange-slblob-mailprops:  gjx25WM8ZNV0HBxVxAjnTh4ywLWDGFqy3lLfzt0ZNAENsYYYmU/v1VlS9nWY7+WMOrlg9DG2jkQChJ+D/U8gzDyyifq0FwkYaWwGZAPShbKkQ1ACYA9Q4JzRVD/Nq6MpsHV1IRVdMW4y+KF2DIFgFrcDuHgNg13J7Kp3hukxo6FPZPPKKQuOBLDKy5Xlv9JE89RovaeNQ5Fam+WbQneQL2kcXIuTGyl2coIThsXcd4nhMDIQqH8DnOfi78rAejd+oIjS7gS0SEas9IcT4lhpnTY+FIz37VUZ/vIUcz1SbclzCzlUTN1D6ZEVrzHqDnlGMrC1jqR/jcxzkITX3VgmI6bh+RFP7LKxCMF495r8l/urOkqYieBWwlrBuqXNHQP5HmuhJhO4qBpqLQuvgV2pguvD5qWl9gOpefI1YTYR5Sl7JEYr4kRxLyWq6d/rpXP0Yv6Gx5uOPbzjKQAcDO6UfmoHURjdIpc7AR9blNkV0kynbyXgG4hQd5nRUWDasPIO4AaJcMEolzjFVJIrwtq8IR0rTWELfrsHjfdV9vpw41l4ScUviREyWKiNay7HF/Hni4y0bgHvTIYCiM7VZHdQkhw+un/eOeEJjiiV1lPNEDDDsJmg0wS0/iXoNXS5AXIuiLI9afSYmNjaKjzMkbhO8HmZEAa76YgMD3AreBI6eFyf+sW4y6vqDllMaKFhRZBSH5oP9wTiWtmnShAxqPmUus9NToaY1fSfFTL1cepoFdg=
x-ms-traffictypediagnostic: TYCP286MB2703:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4JZMtUC5RbwJhePIhS8IZqzoOH6IUP4o3CUXLYkIiUVQQxsRTaYYKTSWbZWZWaCNl/kWmE9GGfDhbnCdKHBMFM2/x6rm9UEyqbN7o46AcKTxKRX7kELbtKiWCl+xZ/qPhgq2aZEPLWkibyKnQCC1j/5myYO96gfWRONM+g9QpmZH73uPcWZsFkku3mGIh6qVgwoseckW+7zy4/ZbUfrIoZEkYfjzRwY/P4QDIBg5G0dePMWArSjm0ghBofnOLO5V97jcj9XaunkqQbgGw26/soRWggmIEopXJ2VLGfCmazqu4Mug6RAZF1rcLIKw5WTU9dnwdtskQd8moq6CqA8wWYLI5BjK7BKcnZDF4+rNopYS92heOWH8WZdG2cdv+x09ItZXGFw6e3Mr3a47eNxrH+RvDYLdDVUTDUhYdGIo+37+m5H6XxJkpJGZIgWFtQz6lgI4nq5G0T4b1GxdaOVnILB+mRo3/TufZJnRSV5RrQuE11FBO2gJaWt73Br7FORjp29e42oyH1T3MUCqA5rL2pPluB7o02bBfYJCQFvuVLjt10wqSY33Y29FucnUdOtuPzkNABbaJbnLriDHBqxyfeUZs/GKBvu8o7KtS1c7sgHPjVIo+iQItS5kUcmegTrA
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?gb2312?B?UVlzSnFESDBVc25raFRtRWdlOTNJcWYwSUVNT0RwcHg1NGtJZFA5Y1dIamdG?=
 =?gb2312?B?OCsvOGE4b2REbXBReFpoVUdxSFRPL05QZVRJYk5GSFpYUW1NTnJLT0owaS9k?=
 =?gb2312?B?ZVo2ekl1aXhSMk93WVZta05kREFXbDM3V2RPTVFZMWFtQXJjS3k5cW8wZXhw?=
 =?gb2312?B?bG1QcWdiZWtnQVZ1ZmI1K2NJWHlTNjhlNHVBTUxyMk51MjNIV0ROTEdGSi9n?=
 =?gb2312?B?c3kxN0hWdExoSk5tWFZBQXhrOFcwNUpUTkh6YWhNbUxnekVGalZZUVQ1TVdK?=
 =?gb2312?B?NjBXSkdGcDRML3kyai91ZmpTQyt4RHU5TnU1aHRSa3lQMllkZDJteWkrMUNh?=
 =?gb2312?B?Y1ByQ0QxTUluU045OG1vV2Y1aktnanYwd3liMFczTk1rd1p0d3AvMm91eDg5?=
 =?gb2312?B?bDYxYXNiRVdMM2FzZDk2YVZnOXZPSHZsU1phbnRTTkVoQzV0dndJZk8wOHNK?=
 =?gb2312?B?ZFZYenZmT2VEZ0NrVWVHUFozYUNXY2VMSlRUNG9LcWNGTyt0T2V0VXVjc1pU?=
 =?gb2312?B?TmQ2Q3FvcVkzUTZTNVpZNTJrUzF0QTN2MzJYK2YrU21HcWV4SlZPSDRRVlg2?=
 =?gb2312?B?aXM5QnFUamVLV1hlQWRhNUdabHg2OHU1V3kwN1d6QjF0VjNiakFYTGJKeXZZ?=
 =?gb2312?B?RkV4d3kwNzd4QlNiaGNKWnhqU3JDYWZ0Ym9ka1VnVlppNjd1Nk5sQkJ5U2xt?=
 =?gb2312?B?aktiTCtRR1E1WDdSdmlzTjgxdnFMYm9NTzRQVDFobnQ3dGlTc1g5d0taQUlN?=
 =?gb2312?B?ZGNHN256TlR0dEhJUG83QUFOem1UcjBySkxINXR2bHozbFliUk9BVExOd0ZC?=
 =?gb2312?B?L2Iza05BZE1ZOGhGSFR0TXA3L1RNNWF4b3loV1l4dVk5eHc5L2tWYW51TFZI?=
 =?gb2312?B?V2JHVElZZng2TFpGVEp0Sm5xclVuOC9KOHlkcDFRVDhqcnZPWXV2U3NRNWt4?=
 =?gb2312?B?SjNydldoa2JDT3F3MVNSbXNTVVZuMXJabVJaVC9ia0RtdnBiRGxtamJKVTdM?=
 =?gb2312?B?ZDZYNmVGYjBKaWtRUGhwdkt1NzZ0cVdaZXJ6dDMxK2dBVzc0T3RaWStodm5l?=
 =?gb2312?B?RXE5ZGdsQXNXYmlzUlFKcDhWZjRUUFVaK2JXSHFDNkJHaXozckYvNWN0djAz?=
 =?gb2312?B?blVPY2xUS3BPN0pXclVGeUlZZjVDVjFQQ2ttZDJFSUZQckE4TXFmcDRhSWMz?=
 =?gb2312?B?c3BoNUFPOVVJd1NsR2VVMmtGQ0Z5QUQ3TTZjWVlRMVVKRG1sUzdxZ2FpWG5V?=
 =?gb2312?B?TTVDWDBxK2FCWkZBRTY5ZmNmbjhwN1FNYnRzWnlLUDYrZUZFUGU3TGY3UGFT?=
 =?gb2312?B?c2h1N0xQRkZKUXAyVi9KVHNyZnlYQkpKcldHS3BLMTFSak9GekxVaUxxVS9O?=
 =?gb2312?B?VWJzcTY5NnBpZTdvdDgyK0NneHpNMFI3WmhrL2o4L2NhYXNZMzAwd0kyNTVv?=
 =?gb2312?B?SzhqTzRPUWRiKzdrSVBIN3orOVJmL0NpbUtEaWJwZ2lYQVpMS1Z2RUdyNXIv?=
 =?gb2312?B?aUk4VC8rQVRmbVFSRmtRZ3UwOUxuT25oa1J6Ym1leXZiblZXMW9aWkZZSHZh?=
 =?gb2312?B?aGRHYVBEL0JLcHF0bktVdjFGSllmWEp2WDNIem5UYkd5cWw5cTBkZGVKNkFv?=
 =?gb2312?B?S3pqZGp0TStyQnFhbGlSS3h3T051eGdpR3o2dzZGM3loOVRYVWdnZ3dkekNV?=
 =?gb2312?B?TVZoQVpWSTc0MURyalBmalBPR25FMHB3MWFjaHJ3TEp0QUppNC93OVBRPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d29edc9e-879c-4bc4-6766-08da581a629b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 08:52:37.2935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_015247_448175_23A66AA7 
X-CRM114-Status: UNSURE (   6.13  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi, Neil

I understand meson_gx_pm is rejected by upstream[0].

but it's OK to add this driver to personal kernel build or downstream kernel build for GXBB.

as a 6 years old driver, is it still work as expected?

I find this driver has been added to Khadas's mainline linux release for years. but they didn't do tests this driver.

how to test this driver is a problem now.

the driver is for suspend, thus can I use
"
# echo mem > /sys/power/state
"
from command line?

And how to wakeup device? power key on SBC?

BR.
Ning.


[0]: https://lore.kernel.org/lkml/1478183365-23708-1-git-send-email-narmstrong@baylibre.com/
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
