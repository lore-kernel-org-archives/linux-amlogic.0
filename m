Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F5AC4167B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Dec 2023 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1TIHeS66NFoukS5cL/Tkj+9nl/FMaAndKuE1HdBg1Q=; b=AnDPmLdQU1gNoN
	wmoKhtJ2HpiC7iAdf27MsV/Wo/iMGmOwV2D5rF8hvOG83xelLR4CCDrW6gChEd33hEUWfn5Oc7LOU
	MuTZ+RwKqeQaAx5UHy50EeMeCcCqs/TZk7MGL90LSKZhySWGkaNB0F9dhCWtfEqnykb2oZeaA332N
	2eX5uKxseryz4JgUtzO9sUxnFc+94Xz1HjxI7jSqO6JtklIAKxB4ollAtmo0CAlR4KSGYZs95J8Qj
	5K8lIVKe9hGO7OEv55ELWnbg7kcNFxTCCeHLuVLIZCZ6vyKUaT/4ZUgwXZhpmr1FWWSXyn1LFRD79
	h1rCyo8p4QbL18bmQh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6XJ-00CNod-0Z;
	Tue, 12 Dec 2023 17:27:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6XE-00CNmY-0q
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Dec 2023 17:27:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Wx-0001uO-KM; Tue, 12 Dec 2023 18:26:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Ww-00FOPJ-Ja; Tue, 12 Dec 2023 18:26:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Ww-001nbc-AC; Tue, 12 Dec 2023 18:26:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 2/5] drm/meson: Simplify usage of clk_rate_exclusive_get()
Date: Tue, 12 Dec 2023 18:26:39 +0100
Message-ID: <c39cc382fcceca0166440367307260c10de7200d.1702400947.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=lLn3GpEtn8Cldb1t/gKKd7hxYx+CsmdNoorQTl0ii64=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBleJfPh1ko5EuKFkzhis18D1Q6ufxw2cmlRezUb e1bX4MJFxWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXiXzwAKCRCPgPtYfRL+ TuuXCACFYHK5vepI6H1w3vCAtGF3mzbvZvEHD9O6QgdN21YNyyRm5kW1ZmKRVDiiOabTVbvn6i/ r39UlcJB9fpR9+HopiUwEA+e8cmJF/6TfvG29AVvfxpEVBVhrXHQJo6JB6n9Z7ccemj7jxMIMit x/3W3JwISr2aymfEcfTrFnnxdK9bAnqa0w2zs+NcKeIGn4CX8sQzvf2FjdUTFHHvBXjBOns7g+C UHEn7VB/4ZkwXr9AbvUSPgxMkgDDm+JDoabKjzRVViZ0D2F0FmFBjDRHKlUgtSXA1J8bZ0fVtGM 5pVKd7TqH5FT6GXCnpqsgghJkyVfCpitvxCNhlgib/X06l7P
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_092708_309274_8606189E 
X-CRM114-Status: GOOD (  10.44  )
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

Y2xrX3JhdGVfZXhjbHVzaXZlX2dldCgpIHJldHVybnMgMCB1bmNvbmRpdGlvbmFsbHkuIFNvIHJl
bW92ZSBlcnJvcgpoYW5kbGluZy4gVGhpcyBwcmVwYXJlcyBtYWtpbmcgY2xrX3JhdGVfZXhjbHVz
aXZlX2dldCgpIHJldHVybiB2b2lkLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCkhlbGxvLAoKYnR3LCB0aGUgZHJp
dmVyIGZhaWxzIHRvIGNhbGwgY2xrX3JhdGVfZXhjbHVzaXZlX3B1dCgpIGluIHRoZSBlcnJvcgpw
YXRocyBvZiBkd19taXBpX2RzaV9waHlfaW5pdCgpLgoKQmVzdCByZWdhcmRzClV3ZQoKIGRyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jIHwgOCArLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2R3X21pcGlfZHNpLmMKaW5kZXggYTZiYzFiZGIzZDBkLi40OTU3MWYxZWQ4
OGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jCkBAIC04OCwx
NSArODgsOSBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3BoeV9pbml0KHZvaWQgKnByaXZfZGF0
YSkKIAl9CiAKIAkvKiBNYWtlIHN1cmUgdGhlIHJhdGUgb2YgdGhlIGJpdCBjbG9jayBpcyBub3Qg
bW9kaWZpZWQgYnkgc29tZW9uZSBlbHNlICovCi0JcmV0ID0gY2xrX3JhdGVfZXhjbHVzaXZlX2dl
dChtaXBpX2RzaS0+Yml0X2Nsayk7Ci0JaWYgKHJldCkgewotCQlkZXZfZXJyKG1pcGlfZHNpLT5k
ZXYsCi0JCQkiRmFpbGVkIHRvIHNldCB0aGUgZXhjbHVzaXZpdHkgb24gdGhlIGJpdCBjbG9jayBy
YXRlIChyZXQgJWQpXG4iLCByZXQpOwotCQlyZXR1cm4gcmV0OwotCX0KKwljbGtfcmF0ZV9leGNs
dXNpdmVfZ2V0KG1pcGlfZHNpLT5iaXRfY2xrKTsKIAogCXJldCA9IGNsa19zZXRfcmF0ZShtaXBp
X2RzaS0+cHhfY2xrLCBtaXBpX2RzaS0+bW9kZS0+Y2xvY2sgKiAxMDAwKTsKLQogCWlmIChyZXQp
IHsKIAkJZGV2X2VycihtaXBpX2RzaS0+ZGV2LCAiRmFpbGVkIHRvIHNldCBEU0kgUGl4ZWwgY2xv
Y2sgcmF0ZSAldSAoJWQpXG4iLAogCQkJbWlwaV9kc2ktPm1vZGUtPmNsb2NrICogMTAwMCwgcmV0
KTsKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
