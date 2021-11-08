Return-Path: <SRS0=rSxG=P3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF4AC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Nov 2021 13:46:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150C361177
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Nov 2021 13:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 150C361177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QyylB96TnZ3nZlVS9qJ3gJDsnjIZDjVgY7uDLCTgWxk=; b=FrcloUs4uYwfEB
	LM/pCyj2hK9/XAMsmC3thv05PcwZF9wymghIo4EiU1QWmHY7X0WC+D5ahr5WkrlyOGNFfSKTDfQjP
	PDdIxx/jJEDH8M9+GPpz5HkwN9Eo8XAxTG2S+66DLS+VSllD8ChcxyuL+WHkNK1+Qyip90+Yv39MP
	knG1HvmNlFr0T8SHh+T1PR1sTkFoUaEIdMWo7SB3RgS/xrfzu3kTHjWPv7Uk9iwCD6v3Z2yQ2G8lt
	o765SaB7OVa8rEwHrIrQzu8Y8qg/k9GKt/TJ5Xuf9lc+4wWDcBwwtPtoGt6lLqPxwq8hNRwGnxsNG
	IjIaHq2ocmabqRVMRklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk4yw-00GWar-OR; Mon, 08 Nov 2021 13:46:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk4ys-00GWZ2-7o
 for linux-amlogic@lists.infradead.org; Mon, 08 Nov 2021 13:46:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4yn-0004Ue-Kw; Mon, 08 Nov 2021 14:46:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4yl-000699-Tp; Mon, 08 Nov 2021 14:46:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk4yl-0002ov-RJ; Mon, 08 Nov 2021 14:46:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Subject: [PATCH 1/4] pwm: meson: Drop always false check from .request()
Date: Mon,  8 Nov 2021 14:46:24 +0100
Message-Id: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=pFF+ThL4Urlu1TgeAT3wxZCnLMkalyqRs5xjfOsL+ZY=;
 m=nhk1f+7QpS0gg35JwXeZ3sqDXjYmbygGULsEVAtTKUQ=;
 p=u0Uw8z69fVb+Fwiw/oDyZ54AmbpstXAC/2Fa5ZfBsw0=;
 g=cf9f1f25cd7eecd9840378bff40eaedad4219019
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGJKiUACgkQwfwUeK3K7Alk1QgAk5M
 isgUA5ScsDyvJfOEg8PQFmdzrTFRAijf9kGuZbRH1b9EIAMnqNeFEFQJBwIvguQV4o6wOu2E+plZF
 AcLwTAXGe8WojGf+46Ka/fU2FzXCAqsHZuVbqjQGrcdVXkUGX+SYBqL+xlsaPPFSxhuC/wW+aNOSI
 MO2TnS5p5oMAe75ReJMSsdbGgkISZXtUABKqqpmKlcjmZu1ou2K3Tiyj5YPQy+YOYQsnHkl5gXL59
 18ggvXAtY0bi7rm0jtG7m+OTYzvJcYxSqT8Lh5y80ADuaJBKTTFXMSn+hhMzRq3HNcttViWm2OrDP
 bA7N+Z0UDSSV+igFgkBi+IGazmOWSxw==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_054638_354992_2F28C135 
X-CRM114-Status: GOOD (  11.67  )
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

SW4gLnJlcXVlc3QoKSBwd21fZ2V0X2NoaXBfZGF0YSgpIHJldHVybnMgTlVMTCBhbHdheXMgc2lu
Y2UgY29tbWl0CmU5MjZiMTJjNjExYyAoInB3bTogQ2xlYXIgY2hpcF9kYXRhIGluIHB3bV9wdXQo
KSIpLiAoQW5kIGlmIGl0IGRpZG4ndApyZXR1cm5pbmcgMCB3b3VsZCBiZSB3cm9uZyBiZWNhdXNl
IHRoZW4gLnJlcXVlc3QoKSB3b3VsZG4ndCByZWVuYWJsZQp0aGUgY2xrIHdoaWNoIHRoZSBvdGhl
ciBkcml2ZXIgY29kZSBkZXBlbmRzIG9uLikKClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9wd20vcHdt
LW1lc29uLmMgfCA4ICstLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMgYi9kcml2
ZXJzL3B3bS9wd20tbWVzb24uYwppbmRleCAzY2YzYmNmNWRkZmMuLmJlM2M4MDZiNTdlNCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLW1l
c29uLmMKQEAgLTEyMCwxNiArMTIwLDEwIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IG1lc29uX3B3
bSAqdG9fbWVzb25fcHdtKHN0cnVjdCBwd21fY2hpcCAqY2hpcCkKIHN0YXRpYyBpbnQgbWVzb25f
cHdtX3JlcXVlc3Qoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdt
KQogewogCXN0cnVjdCBtZXNvbl9wd20gKm1lc29uID0gdG9fbWVzb25fcHdtKGNoaXApOwotCXN0
cnVjdCBtZXNvbl9wd21fY2hhbm5lbCAqY2hhbm5lbDsKKwlzdHJ1Y3QgbWVzb25fcHdtX2NoYW5u
ZWwgKmNoYW5uZWwgPSAmbWVzb24tPmNoYW5uZWxzW3B3bS0+aHdwd21dOwogCXN0cnVjdCBkZXZp
Y2UgKmRldiA9IGNoaXAtPmRldjsKIAlpbnQgZXJyOwogCi0JY2hhbm5lbCA9IHB3bV9nZXRfY2hp
cF9kYXRhKHB3bSk7Ci0JaWYgKGNoYW5uZWwpCi0JCXJldHVybiAwOwotCi0JY2hhbm5lbCA9ICZt
ZXNvbi0+Y2hhbm5lbHNbcHdtLT5od3B3bV07Ci0KIAlpZiAoY2hhbm5lbC0+Y2xrX3BhcmVudCkg
ewogCQllcnIgPSBjbGtfc2V0X3BhcmVudChjaGFubmVsLT5jbGssIGNoYW5uZWwtPmNsa19wYXJl
bnQpOwogCQlpZiAoZXJyIDwgMCkgewoKYmFzZS1jb21taXQ6IDZiNzVkODhmYTgxYjEyMmNjZTM3
ZWJmMTc0MjhhODQ5Y2NkM2QwZjEKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
