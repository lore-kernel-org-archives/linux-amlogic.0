Return-Path: <SRS0=wHej=K4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B652C47080
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 01:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D41D613CD
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 01:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D41D613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPqKbKaIkf8N6yIQ85HtKvZhnz+5SZQYI7DcobCJbog=; b=RFCr/MD1RsNlxS
	O9KWjWWrtyYFO1LPs4+yh5Ykq4nnfYLwyg5T+JD5tSqT7yV3xbMuPjQL9Mwygysmmm+Rolz6jwXpS
	u/OaiVy+odh1c3nk+iNKgOQQFEgSz91HAUkLQKsbAmY949YfZt21CAtt2FizwWUsmYwCBGtbk/ttJ
	AdVIScENPtR4VPNVd+VSBzKho8zXz0ZVnqeyhs77rp93V3vUqnuik7mMuxSb5a8garp4heYUY9Jxp
	y4SA+RrsGlN66zgb5u+JUN0tmAPGAHJmZ1JrJpWeeAC2Mv3iC6oluJEreW8Er6jmUbTzyhHIDoM8q
	4FfLHsbVJma5rqn66Rrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loFpO-001VAK-QO; Wed, 02 Jun 2021 01:37:50 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loFpK-001V8X-Qx
 for linux-amlogic@lists.infradead.org; Wed, 02 Jun 2021 01:37:48 +0000
Received: from dggeme709-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fvs5t6dKwzYn13;
 Wed,  2 Jun 2021 09:34:58 +0800 (CST)
Received: from dggeme760-chm.china.huawei.com (10.3.19.106) by
 dggeme709-chm.china.huawei.com (10.1.199.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:37:42 +0800
Received: from dggeme760-chm.china.huawei.com ([10.6.80.70]) by
 dggeme760-chm.china.huawei.com ([10.6.80.70]) with mapi id 15.01.2176.012;
 Wed, 2 Jun 2021 09:37:42 +0800
From: zhengyongjun <zhengyongjun3@huawei.com>
To: Russell King <linux@armlinux.org.uk>
CC: "andrew@lunn.ch" <andrew@lunn.ch>, "hkallweit1@gmail.com"
 <hkallweit1@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "rjui@broadcom.com" <rjui@broadcom.com>, 
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "narmstrong@baylibre.com"
 <narmstrong@baylibre.com>, "khilman@baylibre.com" <khilman@baylibre.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "opendmb@gmail.com" <opendmb@gmail.com>, "f.fainelli@gmail.com"
 <f.fainelli@gmail.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIG5ldC1uZXh0XSBuZXQ6IG1kaW86IEZpeCBzcGVsbGlu?=
 =?gb2312?Q?g_mistakes?=
Thread-Topic: [PATCH net-next] net: mdio: Fix spelling mistakes
Thread-Index: AQHXVu8poZJ1gXDCckK65ke/PM4ReKr+rcUAgAFD+mA=
Date: Wed, 2 Jun 2021 01:37:42 +0000
Message-ID: <083325fb1314426fb6d4437304a9ed9c@huawei.com>
References: <20210601141859.4131776-1-zhengyongjun3@huawei.com>
 <20210601141738.GA30436@shell.armlinux.org.uk>
In-Reply-To: <20210601141738.GA30436@shell.armlinux.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.176.64]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_183747_066921_86643EC6 
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SSBoYXZlIGRvIHRoaXMgYXMgeW91ciBhZHZpY2UgYW5kIHNlbmQgcGF0Y2ggdjIgOikNCg0KLS0t
LS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IFJ1c3NlbGwgS2luZyBbbWFpbHRvOmxpbnV4QGFybWxp
bnV4Lm9yZy51a10gDQq3osvNyrG85DogMjAyMcTqNtTCMcjVIDIyOjE4DQrK1bz+yMs6IHpoZW5n
eW9uZ2p1biA8emhlbmd5b25nanVuM0BodWF3ZWkuY29tPg0Ks63LzTogYW5kcmV3QGx1bm4uY2g7
IGhrYWxsd2VpdDFAZ21haWwuY29tOyBkYXZlbUBkYXZlbWxvZnQubmV0OyBrdWJhQGtlcm5lbC5v
cmc7IHJqdWlAYnJvYWRjb20uY29tOyBzYnJhbmRlbkBicm9hZGNvbS5jb207IGJjbS1rZXJuZWwt
ZmVlZGJhY2stbGlzdEBicm9hZGNvbS5jb207IG5hcm1zdHJvbmdAYmF5bGlicmUuY29tOyBraGls
bWFuQGJheWxpYnJlLmNvbTsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnOyBvcGVuZG1i
QGdtYWlsLmNvbTsgZi5mYWluZWxsaUBnbWFpbC5jb207IGpicnVuZXRAYmF5bGlicmUuY29tOyBt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tDQrW98ziOiBSZTogW1BBVENIIG5ldC1u
ZXh0XSBuZXQ6IG1kaW86IEZpeCBzcGVsbGluZyBtaXN0YWtlcw0KDQpPbiBUdWUsIEp1biAwMSwg
MjAyMSBhdCAxMDoxODo1OVBNICswODAwLCBaaGVuZyBZb25nanVuIHdyb3RlOg0KPiBpbmZvcm1h
dGlvbnMgID09PiBpbmZvcm1hdGlvbg0KPiB0eXBpY2FseSAgPT0+IHR5cGljYWxseQ0KPiBkZXJy
aXZlICA9PT4gZGVyaXZlDQo+IGV2ZW50aG91Z2ggID09PiBldmVuIHRob3VnaA0KDQpJZiB5b3Un
cmUgZG9pbmcgdGhpcywgdGhlbiBwbGVhc2UgYWxzbyBjaGFuZ2UgImh6IiB0byAiSHoiLiBUaGUg
dW5pdCBvZiBmcmVxdWVuY3kgaXMgdGhlIGxhdHRlciwgbm90IHRoZSBmb3JtZXIuIFRoYW5rcy4N
Cg0KLS0NClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2Rl
dmVsb3Blci9wYXRjaGVzLw0KRlRUUCBpcyBoZXJlISA0ME1icHMgZG93biAxME1icHMgdXAuIERl
Y2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
