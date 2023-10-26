Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59CBC25B6F
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Oct 2023 10:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIzj8uJFqzjRyGX+pL0PqFSceF6EgCoyPjcTOFS+674=; b=xVdnhmb6i7e4DA
	IwufhpTavEWE+R1y1Y/aXDRCJgpMvP90N8opRJLrMQ5sb7bafPla/Ar7BmdDBP4sBnQt7Vd/u0AmS
	9fMhF0qMveCJmBGAXp3n8d9RTPyhRv/68Q6wXXgpuog/Knu3CxQtQkuHTsHW3PFV7WzeA/XS4f6+u
	yWQ/c5a2y1Bv2S+PqA5xkSux4Fj/mXBSQ9M76H9w8nbwbIWBGAava7AyRWaS0DC53hc+Q/SfzjNFf
	qcGFTQf+0z6SrRLlquehItINdpkwAaONX1uhP2TP25jRvwAkAuV/60qLlWCfGE5rfuoKugRO7XVBE
	A30K0F6DInp6WgA2MPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxRu-00E9bn-0p;
	Thu, 26 Oct 2023 10:18:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxRp-00E9XH-0U
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Oct 2023 10:18:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRc-0002ng-Gp; Thu, 26 Oct 2023 12:18:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRc-004O1x-2n; Thu, 26 Oct 2023 12:18:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRb-006XU2-Pq; Thu, 26 Oct 2023 12:18:27 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 2/3] media: meson-ir-tx: Simplify and improve using dev_err_probe()
Date: Thu, 26 Oct 2023 12:18:19 +0200
Message-ID: <20231026101816.2460464-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
References: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xP/HXyC7f9rnqXpYHkc5zFosg3Ou9P4+kgR9nBBBZqc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOjzrZOzRNoBEbh0+ts8giNj+oBxAwnhW3Xlhs b/TvKU1hnCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTo86wAKCRCPgPtYfRL+ Tr9wB/0Xr5LPgszjKEwgg3Eitd3x3TtWYxK/WCYKYhW6e2BCGfscdXowyievh3k5RKQxJxuZqoD HKqlVrMTSBYs6QKHgylNpfAdBD7hFYnGU5l6B9DXZJRUApiG2YyttKZ+kt/2V2f6jZD4fydC90B j5ql1oX55cMx1aphJ5Y2ooJX+QBiyikdkpdOFgRDr1PXzesCDVeN7rUgCVxGOaCExmjgumkMZEo c1PxcUhnNQuCT48r8yskGSW1j0GoTa5YJ079kIX9Wam0id9euK/fTLL+8A9Caw19iZb2N9MTPX3 q3bBrkTVooI0rKlGuj/zK4fTDDeAclJvcQv0Dd5pklRb9rNi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_031841_208533_68E8525C 
X-CRM114-Status: GOOD (  12.37  )
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

V2l0aCBkZXZfZXJyX3Byb2JlKCkgdGhlIGVycm9yIHBhdGhzIGNhbiBiZSBpbXBsZW1lbnRlZCBp
biBhIG1vcmUKY29uZGVuc2VkIHdheSB3aXRoIHRoZSBhZGRlZCBiZW5lZml0IHRoYXQgdGhlIGVy
cm9yIGNvZGUgaXMgYWRkZWQgdG8gdGhlCmVycm9yIG1lc3NhZ2VzIGJ5IG5hbWUuCgpTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
PgotLS0KIGRyaXZlcnMvbWVkaWEvcmMvbWVzb24taXItdHguYyB8IDE2ICsrKysrKy0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcmMvbWVzb24taXItdHguYyBiL2RyaXZlcnMvbWVkaWEv
cmMvbWVzb24taXItdHguYwppbmRleCBkYWI1NDhkYzYzMDIuLmJkODUzNjFkNTYxZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCisrKyBiL2RyaXZlcnMvbWVkaWEv
cmMvbWVzb24taXItdHguYwpAQCAtMzMzLDIwICszMzMsMTcgQEAgc3RhdGljIGludCBfX2luaXQg
bWVzb25faXJ0eF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXNwaW5fbG9j
a19pbml0KCZpci0+bG9jayk7CiAKIAlyZXQgPSBtZXNvbl9pcnR4X21vZF9jbG9ja19wcm9iZShp
ciwgJmNsa19ucik7Ci0JaWYgKHJldCkgewotCQlkZXZfZXJyKGRldiwgIm1vZHVsYXRvciBjbG9j
ayBzZXR1cCBmYWlsZWRcbiIpOwotCQlyZXR1cm4gcmV0OwotCX0KKwlpZiAocmV0KQorCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIm1vZHVsYXRvciBjbG9jayBzZXR1cCBmYWlsZWRc
biIpOworCiAJbWVzb25faXJ0eF9zZXR1cChpciwgY2xrX25yKTsKIAogCXJldCA9IGRldm1fcmVx
dWVzdF9pcnEoZGV2LCBpcnEsCiAJCQkgICAgICAgbWVzb25faXJ0eF9pcnFoYW5kbGVyLAogCQkJ
ICAgICAgIElSUUZfVFJJR0dFUl9SSVNJTkcsCiAJCQkgICAgICAgRFJJVkVSX05BTUUsIGlyKTsK
LQlpZiAocmV0KSB7Ci0JCWRldl9lcnIoZGV2LCAiaXJxIHJlcXVlc3QgZmFpbGVkXG4iKTsKLQkJ
cmV0dXJuIHJldDsKLQl9CisJaWYgKHJldCkKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBy
ZXQsICJpcnEgcmVxdWVzdCBmYWlsZWRcbiIpOwogCiAJcmMgPSByY19hbGxvY2F0ZV9kZXZpY2Uo
UkNfRFJJVkVSX0lSX1JBV19UWCk7CiAJaWYgKCFyYykKQEAgLTM2Miw5ICszNTksOCBAQCBzdGF0
aWMgaW50IF9faW5pdCBtZXNvbl9pcnR4X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAKIAlyZXQgPSBkZXZtX3JjX3JlZ2lzdGVyX2RldmljZShkZXYsIHJjKTsKIAlpZiAocmV0
IDwgMCkgewotCQlkZXZfZXJyKGRldiwgInJjX2RldiByZWdpc3RyYXRpb24gZmFpbGVkXG4iKTsK
IAkJcmNfZnJlZV9kZXZpY2UocmMpOwotCQlyZXR1cm4gcmV0OworCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIHJldCwgInJjX2RldiByZWdpc3RyYXRpb24gZmFpbGVkXG4iKTsKIAl9CiAKIAly
ZXR1cm4gMDsKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
