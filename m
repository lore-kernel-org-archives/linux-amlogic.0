Return-Path: <SRS0=rSxG=P3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7629FC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Nov 2021 13:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D465661177
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Nov 2021 13:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D465661177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ccnBQknCFdHNonIJCwcXpui3+gLxGos3x0lta4mXCk=; b=fS3A4f/7QN1hOy
	XJBuvf2z4Rx+HhWjBFtACAyE4iz/Wa/yWMD0+XkMz2oUq7WNZOYkNSqOO+B4ctyBB/Nxn8C7HyOVB
	f5/nL+UUoPOor89XAO6cMgOWtNLkk9uHT9mFwqCjOJZ8SheJb1f80D3FN5CXFUuQ70/WBMZC8e4O7
	Q97vvDRfrYMjWHlPWam6o+kXUpzF9TVUDOrt/BxQnTiuQW143xtbVBDDfppKTTWwPraXAXMhQ33ou
	ir2hKQZhaGECD3W5tSlh8XPBaQrUlxCp6a3K3NIXxYZnjSW/uR3FvY2GlnBA1Oa6U6GxVtdPFTYiD
	3IygzwffXs/twJZjIpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk4yw-00GWai-3Q; Mon, 08 Nov 2021 13:46:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk4ys-00GWZ1-7n
 for linux-amlogic@lists.infradead.org; Mon, 08 Nov 2021 13:46:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4yn-0004Uf-Kw; Mon, 08 Nov 2021 14:46:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4ym-00069C-0m; Mon, 08 Nov 2021 14:46:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4yl-0002p8-W0; Mon, 08 Nov 2021 14:46:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Subject: [PATCH 2/4] pwm: meson: Drop useless check for channel data being NULL
Date: Mon,  8 Nov 2021 14:46:25 +0100
Message-Id: <20211108134628.120474-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
References: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=WYWbEo0mdLasyONjA5l0Q8GW6ag2v1wA0HYDo9/eUbo=;
 m=3MDjJzoRh63117QhB/RgLRb8f8aNIyaZ/jAm+bicXOk=;
 p=Hw1bqdubrn8I4UHF0kD52flQxDKafxUj3KVtG+rMoPQ=;
 g=d11fe241c518b8a375ef3cda3e0d354bfe0bc0b4
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGJKigACgkQwfwUeK3K7AmB0Qf/Y6E
 qXsMl91ssbdUh7Ztdip6h9FkWb4LZ0aFHtSo4M9fn9Y1pIZ7snFfXq4S+kqNISljAkLh4SfUehJA9
 VAj3/IUVFdbf5RyZNEV8RvXH7/93DLQz13ZxoNKooHoNA/OuTAl1p5csZhaxeowUKD7A/pQsuZ/h/
 nOEks7Js0kPMTl5Y56AzBbUvUm9QWmbZ2VDD5vVq3FeaF9lCiY4cqqUJ50k28OfTFYdyPuYX9uXYR
 vTGmc9CQu26voug2FKwPJej+Z0prDE7q850gf4JbUQEhArEVHl9HYoSqyEbbaINmg4eEFuZvJOF8/
 jpCsUSFRU6bSFg2yu+llzki1lC4he8A==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_054638_360998_5DD7BA77 
X-CRM114-Status: GOOD (  11.61  )
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

SW4gbWVzb25fcHdtX2ZyZWUoKSB0aGUgZnVuY3Rpb24gcHdtX2dldF9jaGlwX2RhdGEoKSBhbHdh
eXMgcmV0dXJucyBhCm5vbi1OVUxMIHBvaW50ZXIgYmVjYXVzZSBpdCdzIG9ubHkgY2FsbGVkIHdo
ZW4gdGhlIHJlcXVlc3QgY2FsbGJhY2sKc3VjY2VlZGVkIGFuZCB0aGlzIGNhbGxiYWNrIGNhbGxz
IHB3bV9zZXRfY2hpcF9kYXRhKCkgaW4gdGhpcyBjYXNlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJz
L3B3bS9wd20tbWVzb24uYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMgYi9k
cml2ZXJzL3B3bS9wd20tbWVzb24uYwppbmRleCBiZTNjODA2YjU3ZTQuLjFmYmU1NGEyYWJmZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKKysrIGIvZHJpdmVycy9wd20vcHdt
LW1lc29uLmMKQEAgLTE0OCw4ICsxNDgsNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9wd21fZnJlZShz
dHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20pCiB7CiAJc3RydWN0
IG1lc29uX3B3bV9jaGFubmVsICpjaGFubmVsID0gcHdtX2dldF9jaGlwX2RhdGEocHdtKTsKIAot
CWlmIChjaGFubmVsKQotCQljbGtfZGlzYWJsZV91bnByZXBhcmUoY2hhbm5lbC0+Y2xrKTsKKwlj
bGtfZGlzYWJsZV91bnByZXBhcmUoY2hhbm5lbC0+Y2xrKTsKIH0KIAogc3RhdGljIGludCBtZXNv
bl9wd21fY2FsYyhzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwgc3RydWN0IHB3bV9kZXZpY2UgKnB3
bSwKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
