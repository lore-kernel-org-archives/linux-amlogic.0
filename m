Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90476C7EE22
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 May 2023 23:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7ASI5WCyIWjTsRWjjO0h8SHHkQ7kGQuIACJBDUdGYs=; b=pcwtyMJj/nQZ0x
	mAZMyxZJIJgGePMgLsKWFBe8jKTw4x43BRkPuwvn3O7qigLrtUu+tVgxbXz/ZHh77jgU0cVj5RXrO
	/QUVJbZJjzb/TJoxzrLGosdvwixHKItXtdWhBMd/x4zc+EdPFHJ97Y+VE006y2tgBC980diFL7dqP
	ZNGBdocAKTEIpzDIHe5Xy9ca90Wyg4hAwHQ1pOqObLT3I4DKg9+aWch/wLxXPSs9C5/bc6AOzsbRf
	Fpzw0b38z0xueFqPjy/PVOzRWpBtdjKKRo8cMnvXDHObolhI+nBdgHa4EmL8WFB6D4tv5DE6E5Hhi
	MoNPPF2dkZa1S8vpLPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQBh-00BIkf-0A;
	Wed, 17 May 2023 23:04:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQAm-00BI3L-1z
	for linux-amlogic@lists.infradead.org;
	Wed, 17 May 2023 23:03:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAQ-0007nB-RW; Thu, 18 May 2023 01:02:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAQ-000wop-6D; Thu, 18 May 2023 01:02:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAP-005UWI-FF; Thu, 18 May 2023 01:02:45 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 17/97] usb: dwc3-meson-g12a: Convert to platform remove callback returning void
Date: Thu, 18 May 2023 01:01:19 +0200
Message-Id: <20230517230239.187727-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bBrKVx6OfZrSZVEoSGBtaNr7cq96r3z82Q7VQ738QaA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVv+Ga7t9fqZ/L85VfZ8l5ysQ6NNnQv1sZU9k 6uofkm64QOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb/gAKCRCPgPtYfRL+ ToHwB/0VhlUxmaahZ5cCzjtZfjbg+2Pcrb4WLXHPsXbMpPruGDJgYSv6if5+8c6PT2WDa/7BIVD gBx3lFgN37y48gZbTkPNrbn+rpnamKZnGUXfcyJtZma7eR/RiClNPo5lnY1f1QFeMGd2xXIiJ7q ouIZp03Pru/t+t9K+PzkCETDPPBnhfGC/OKVodus58h/Aqy2bjp2XsVhPtzhBg9wk5fuIVkyZcU KFqOVVbMRies1lkt67mFYiLji9tXpdkubkE2fUNMKAZoRU8Cc1C2bxL2BhhzSpb0oeSzomO4cXW yRgSZPTXnHDRqNj06Hu0+skz9rvTWr3vIYXUJAlOJVNgvceQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_160308_796587_270DD54F 
X-CRM114-Status: GOOD (  16.11  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydCBmcm9tCmVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
IFRvIGltcHJvdmUKaGVyZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxs
YmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0CnN0ZXAgb2YgdGhpcyBxdWVzdCBhbGwgZHJp
dmVycyBhcmUgY29udmVydGVkIHRvIC5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeQpyZXR1cm5z
IHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCwgLnJlbW92
ZV9uZXcoKSBpcwpyZW5hbWVkIHRvIC5yZW1vdmUoKS4KClRyaXZpYWxseSBjb252ZXJ0IHRoaXMg
ZHJpdmVyIGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKY2FsbGJhY2sg
dG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvdXNi
L2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtbWVzb24tZzEyYS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW1lc29uLWcxMmEuYwpp
bmRleCBiMjgyYWQwZTY5YzYuLjdlZDVhMjFmYjQ0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLW1lc29uLWcxMmEuYworKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24t
ZzEyYS5jCkBAIC04MzUsNyArODM1LDcgQEAgc3RhdGljIGludCBkd2MzX21lc29uX2cxMmFfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0
aWMgaW50IGR3YzNfbWVzb25fZzEyYV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKK3N0YXRpYyB2b2lkIGR3YzNfbWVzb25fZzEyYV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZHdjM19tZXNvbl9nMTJhICpwcml2ID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKQEAg
LTg1OSw4ICs4NTksNiBAQCBzdGF0aWMgaW50IGR3YzNfbWVzb25fZzEyYV9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKHBy
aXYtPmRydmRhdGEtPm51bV9jbGtzLAogCQkJCSAgIHByaXYtPmRydmRhdGEtPmNsa3MpOwotCi0J
cmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdjM19tZXNvbl9nMTJh
X3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC05NzEsNyArOTY5LDcgQEAg
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHdjM19tZXNvbl9nMTJhX21hdGNoKTsKIAogc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdjM19tZXNvbl9nMTJhX2RyaXZlciA9IHsKIAkucHJv
YmUJCT0gZHdjM19tZXNvbl9nMTJhX3Byb2JlLAotCS5yZW1vdmUJCT0gZHdjM19tZXNvbl9nMTJh
X3JlbW92ZSwKKwkucmVtb3ZlX25ldwk9IGR3YzNfbWVzb25fZzEyYV9yZW1vdmUsCiAJLmRyaXZl
cgkJPSB7CiAJCS5uYW1lCT0gImR3YzMtbWVzb24tZzEyYSIsCiAJCS5vZl9tYXRjaF90YWJsZSA9
IGR3YzNfbWVzb25fZzEyYV9tYXRjaCwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
