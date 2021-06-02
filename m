Return-Path: <SRS0=wHej=K4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBB6C4708F
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 06:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A3C660FDC
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 06:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A3C660FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yj4Xtj0OCpenz+tbgtuQ3y1fUtFKQoiDhtEOuuE74sI=; b=QX/A7DNf/b2UkW
	qsKXIOIeI3l8MlQ6iibE306fW5EyVhBlmDlJ386JiKiMI9YQD3eCAuf9fegKe07V1FqU8FzE2UhWN
	/EDhALAoevW/7I3M9oGVBKm3tM/TERtgvKjBcVzN4qf2ZJ1rODXPubbcnXJiURtRbTv4KJmsETkdS
	Q6ntY15vLPZIx9A3DThN5viFxJJi5iqDTJUg17xJiRZaCOc0Mdai6rDvCBBOHn759i/ee9aLaCCRK
	QdDTEF0tSQFqwX90KubUJ09hknL8Q10P12qPYjBbcjv9LxVNyXr6VFck5H2pdcwYIjfw4Y3oFlmAP
	WPsZcbFeikwSfi5bzO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKJs-0021O3-FC; Wed, 02 Jun 2021 06:25:36 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKJp-0021N5-PU
 for linux-amlogic@lists.infradead.org; Wed, 02 Jun 2021 06:25:35 +0000
Received: from dggeme710-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FvzTd1CrYz693w;
 Wed,  2 Jun 2021 14:22:29 +0800 (CST)
Received: from dggeme760-chm.china.huawei.com (10.3.19.106) by
 dggeme710-chm.china.huawei.com (10.1.199.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 2 Jun 2021 14:25:26 +0800
Received: from dggeme760-chm.china.huawei.com ([10.6.80.70]) by
 dggeme760-chm.china.huawei.com ([10.6.80.70]) with mapi id 15.01.2176.012;
 Wed, 2 Jun 2021 14:25:26 +0800
From: zhengyongjun <zhengyongjun3@huawei.com>
To: Florian Fainelli <f.fainelli@gmail.com>, "andrew@lunn.ch"
 <andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org"
 <kuba@kernel.org>, "rjui@broadcom.com" <rjui@broadcom.com>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "narmstrong@baylibre.com"
 <narmstrong@baylibre.com>, "khilman@baylibre.com" <khilman@baylibre.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
CC: "opendmb@gmail.com" <opendmb@gmail.com>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjIgbmV0LW5leHRdIG5ldDogbWRpbzogRml4IHNw?=
 =?utf-8?Q?elling_mistakes?=
Thread-Topic: [PATCH v2 net-next] net: mdio: Fix spelling mistakes
Thread-Index: AQHXV0/0yeESSU45Zkat1EPmshxhFKr/kyaAgACuOKA=
Date: Wed, 2 Jun 2021 06:25:26 +0000
Message-ID: <8f437442d492476bbb0a9d7c4672a65b@huawei.com>
References: <20210602015151.4135891-1-zhengyongjun3@huawei.com>
 <ce8d1b78-47ce-9211-d948-093d316ea647@gmail.com>
In-Reply-To: <ce8d1b78-47ce-9211-d948-093d316ea647@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.176.64]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_232534_040808_AA2D7042 
X-CRM114-Status: UNSURE (   5.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RmluZSwgSSB3aWxsIHNlbmQgdGhlIHBhdGNoIHJpZ2h0IG5vdyA6KQ0KDQotLS0tLemCruS7tuWO
n+S7ti0tLS0tDQrlj5Hku7bkuro6IEZsb3JpYW4gRmFpbmVsbGkgW21haWx0bzpmLmZhaW5lbGxp
QGdtYWlsLmNvbV0gDQrlj5HpgIHml7bpl7Q6IDIwMjHlubQ25pyIMuaXpSAxMjowMQ0K5pS25Lu2
5Lq6OiB6aGVuZ3lvbmdqdW4gPHpoZW5neW9uZ2p1bjNAaHVhd2VpLmNvbT47IGFuZHJld0BsdW5u
LmNoOyBoa2FsbHdlaXQxQGdtYWlsLmNvbTsgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsga3ViYUBrZXJu
ZWwub3JnOyByanVpQGJyb2FkY29tLmNvbTsgc2JyYW5kZW5AYnJvYWRjb20uY29tOyBiY20ta2Vy
bmVsLWZlZWRiYWNrLWxpc3RAYnJvYWRjb20uY29tOyBuYXJtc3Ryb25nQGJheWxpYnJlLmNvbTsg
a2hpbG1hbkBiYXlsaWJyZS5jb207IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZw0K5oqE
6YCBOiBvcGVuZG1iQGdtYWlsLmNvbTsgZi5mYWluZWxsaUBnbWFpbC5jb207IGxpbnV4QGFybWxp
bnV4Lm9yZy51azsgamJydW5ldEBiYXlsaWJyZS5jb207IG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29v
Z2xlbWFpbC5jb20NCuS4u+mimDogUmU6IFtQQVRDSCB2MiBuZXQtbmV4dF0gbmV0OiBtZGlvOiBG
aXggc3BlbGxpbmcgbWlzdGFrZXMNCg0KDQoNCk9uIDYvMS8yMDIxIDY6NTEgUE0sIFpoZW5nIFlv
bmdqdW4gd3JvdGU6DQo+IGluZm9ybWF0aW9ucyAgPT0+IGluZm9ybWF0aW9uDQo+IHR5cGljYWx5
ICA9PT4gdHlwaWNhbGx5DQo+IGRlcnJpdmUgID09PiBkZXJpdmUNCj4gZXZlbnRob3VnaCAgPT0+
IGV2ZW4gdGhvdWdoDQo+IGh6ID09PiBIeg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhlbmcgWW9u
Z2p1biA8emhlbmd5b25nanVuM0BodWF3ZWkuY29tPg0KDQpZb3VyIHYxIHdhcyBhcHBsaWVkIGFs
cmVhZHk6DQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvZTY1YzI3
OTM4ZDhlDQoNCnNvIHlvdSB3b3VsZCBuZWVkIHRvIHN1Ym1pdCBhbiBpbmNyZW1lbnRhbCBwYXRj
aCB0aGFua3MhDQotLSANCkZsb3JpYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
