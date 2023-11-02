Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE04EC4167B
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Nov 2023 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yExevNA2PItKinGxZjPKOAleV/PlRvu0yYs/NPd6bIc=; b=HbZd6dPk0xwa6g
	mBPkhxAjFkdZcxi6inlg6v1KMd63ctxm0AxzqoidATKKcgPBWrF1u1wBz0zs3UmfdKShz7uO1VCsk
	eSb1NV+fow0NiaG4BJ+ZhCJPjugIFFBYDmy0VK/93oaJQEAJ0ppDqXUd9q4lxf6750bA93LaIXmbK
	eeoH1VGpgafYAo7TAYiHh7fLkDHcf8NRTxCnBIIceg8hQqoNzASlM03q1yZaWevT4DgAfTa4syiZR
	NLZ8Dy3sKuTYSSUlqG3jrZmsMAZoviCQR9+yioAXJ07d4wc4tBsGCz+qKoWWEy83xzf0fYYcHRmS7
	ZfqRZnMm1HmD4mzGnNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyb0W-009vOk-0V;
	Thu, 02 Nov 2023 16:57:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyb0S-009vMo-0r
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Nov 2023 16:57:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyb0I-000381-H9; Thu, 02 Nov 2023 17:57:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyb0I-0067FW-0y; Thu, 02 Nov 2023 17:57:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyb0H-00Bjcl-Ny; Thu, 02 Nov 2023 17:57:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v3 13/16] drm/meson: Convert to platform remove callback returning void
Date: Thu,  2 Nov 2023 17:56:54 +0100
Message-ID: <20231102165640.3307820-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fTCgeG8D3r24mPhaDqET6D9T7D0QbFJghvuSAARj8M8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TYIjO1+70sN6Yiz3+MVdT0lSg9thUez+jFX Ej2s/15KOaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU2AAKCRCPgPtYfRL+ TncICAC38V4qAo1DtPCUBId7a9LgQZcf0pNV2nIpntNvOOt+ubXsT2Y09QjrDFA0X4Cz1QtyJZB pgYpezDiy2iYB2juJxDdc7/gwUeoshFsr3V44ie43vPnXM5spMmziRYW+d37hdgbOgK04QV3fwD 6q+N1nlPiw8BDLeALE0rtutcMZDFViAd83WB4Hqlj2ieBhricJ5cf8HTPCDt/c25AU/slDu3urX czDiq5w0QsECfQP2bL3esSs5Cli1q8weyamxNNuTZCDITYn4gojvsBwPRMU1UUBfTH8Ocs//M+P oZR3udcV3M8GpNFkSi6ofcmu3kD8SuIIgrt5lcpVKIpX37m9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_095720_301094_4B09A864 
X-CRM114-Status: GOOD (  15.75  )
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfbWlwaV9kc2kuYyB8IDYgKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2R3X21pcGlfZHNpLmMKaW5kZXggZTVmZTRlOTk0ZjQzLi5hNmJjMWJkYjNk
MGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jCkBAIC0zMjMs
MTMgKzMyMywxMSBAQCBzdGF0aWMgaW50IG1lc29uX2R3X21pcGlfZHNpX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgbWVzb25f
ZHdfbWlwaV9kc2lfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMg
dm9pZCBtZXNvbl9kd19taXBpX2RzaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKIAlzdHJ1Y3QgbWVzb25fZHdfbWlwaV9kc2kgKm1pcGlfZHNpID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7CiAKIAlkd19taXBpX2RzaV9yZW1vdmUobWlwaV9kc2ktPmRtZCk7Ci0K
LQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25f
ZHdfbWlwaV9kc2lfb2ZfdGFibGVbXSA9IHsKQEAgLTM0MCw3ICszMzgsNyBAQCBNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBtZXNvbl9kd19taXBpX2RzaV9vZl90YWJsZSk7CiAKIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX2R3X21pcGlfZHNpX3BsYXRmb3JtX2RyaXZlciA9IHsK
IAkucHJvYmUJCT0gbWVzb25fZHdfbWlwaV9kc2lfcHJvYmUsCi0JLnJlbW92ZQkJPSBtZXNvbl9k
d19taXBpX2RzaV9yZW1vdmUsCisJLnJlbW92ZV9uZXcJPSBtZXNvbl9kd19taXBpX2RzaV9yZW1v
dmUsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCQk9IERSSVZFUl9OQU1FLAogCQkub2ZfbWF0Y2hf
dGFibGUJPSBtZXNvbl9kd19taXBpX2RzaV9vZl90YWJsZSwKLS0gCjIuNDIuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
