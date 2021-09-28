Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66806C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 02:50:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D340A60E05
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 02:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D340A60E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYvsOc0YTivJHy5AWWapSbL+43iNgChn/wsjAdicccY=; b=fA2m7Y/Hb2VmiY
	D6WFH8HB0U5rUiqQOnaaC7B3mzk1XoAoYqj7nFmZ/Uti3LXOgc4B0ITd5/BKq+nozdkGXlJdM8PYM
	qMssQASJC9Pi5tjIeN1GN2Q20MmYLiIvKDb/amnNTM2R9THS4JNocc+tf1A6JLSop6FBN9CYA4mxf
	zBCm9b0lr0/ZQZkGBV24o4U2ISl4gd7O9cTX+yxzrMjCSEWbfk1ljX0CyMpe2Ab9v5OoWl5yCOUEr
	Mh/8fkIbFCytirkg4umgL1isEiHFWg12IIMuijs+3Y16Dcu2sdyz2FisgAPEhflCXuW06cutU+5Rl
	CTl8KOs5EraGfj+MCo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV3Bw-005MRp-AW; Tue, 28 Sep 2021 02:50:00 +0000
Received: from mx24.baidu.com ([111.206.215.185] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV3Bt-005MQs-QZ; Tue, 28 Sep 2021 02:49:59 +0000
Received: from BC-Mail-Ex30.internal.baidu.com (unknown [172.31.51.24])
 by Forcepoint Email with ESMTPS id BE25CCC1775BA3014171;
 Tue, 28 Sep 2021 10:49:48 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex30.internal.baidu.com (172.31.51.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 28 Sep 2021 10:49:48 +0800
Received: from localhost (172.31.63.8) by BJHW-MAIL-EX27.internal.baidu.com
 (10.127.64.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 28
 Sep 2021 10:49:48 +0800
Date: Tue, 28 Sep 2021 10:49:46 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 6/9] iio: adc: meson_saradc: Make use of the helper
 function dev_err_probe()
Message-ID: <20210928024946.GA1628@LAPTOP-UKSR4ENP.internal.baidu.com>
References: <20210927081426.762-1-caihuoqing@baidu.com>
 <20210927081426.762-6-caihuoqing@baidu.com>
 <CAFBinCAatVy_9abUJ7A6frbsOqDqAzVe9oDJODOS5MC7aCcDVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAatVy_9abUJ7A6frbsOqDqAzVe9oDJODOS5MC7aCcDVg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex11.internal.baidu.com (172.31.51.51) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_194958_062563_1CF25133 
X-CRM114-Status: GOOD (  12.63  )
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

T24gMjcgOeaciCAyMSAyMjowOTo0NywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIZWxs
bywKPiAKPiBmaXJzdCBvZiBhbGw6IHRoYW5rcyBmb3IgdGhpcyBwYXRjaCEKPiAKPiBPbiBNb24s
IFNlcCAyNywgMjAyMSBhdCAxMDoxNSBBTSBDYWkgSHVvcWluZyA8Y2FpaHVvcWluZ0BiYWlkdS5j
b20+IHdyb3RlOgo+IFsuLi5dCj4gPiArICAgICAgIGlmIChJU19FUlIocHJpdi0+Y2xraW4pKQo+
ID4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFRSX0VSUihwcml2LT5jbGtpbiks
Cj4gSXMgdGhlcmUgYW55IHNwZWNpZmljIHJlYXNvbiB3aHkgeW91IHB1dCBQVFJfRVJSKCkgb24g
YSBzZXBhcmF0ZSBsaW5lPwo+IGl0IHdvdWxkIHN0aWxsIGZpdCBpbnRvIHRoZSBsaW5lIGFib3Zl
IGFuZCBiZSBiZWxvdyB0aGUgb2xkIDgwIGNoYXJzCj4gcGVyIGxpbmUgbGltaXQuCj4gRm9yIHBy
aXYtPnZyZWYgeW91IGFscmVhZHkgaGF2ZSBpdCB0aGUgd2F5IEkgYW0gc3VnZ2VzdGluZyB0aGVy
ZS4KPiAKPiBbLi4uXQo+ID4gKyAgICAgICBpZiAoSVNfRVJSKHByaXYtPmNvcmVfY2xrKSkKPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBUUl9FUlIocHJpdi0+Y29yZV9jbGsp
LAo+IHRoZSBzYW1lIHF1ZXN0aW9uIGFzIGFib3ZlIGFwcGxpZXMgaGVyZSBhcyB3ZWxsCj4gCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgpIaSwKClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4K
SSBoYXZlIHJlc2VuZCB2MiB0byBmaXggaXQuCmhlcmUKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtYXJtLWtlcm5lbC8yMDIxMDkyODAxMzYyMS4xMjQ1LTYtY2FpaHVvcWluZ0BiYWlkdS5j
b20vCgpNYW55IHRoYW5rcwpDYWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
