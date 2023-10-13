Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53026CDB47E
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Oct 2023 22:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTt3fgmde+ofJAvRJBF7cg3LhV8bUEHazQu9TUbxma8=; b=y1Brt3wPboz73p
	Yqn1EvEELHMceJrktOsUCXFg7nARn0o8T9ocDbpn97sB9jMNHdXrzO85jkSSnCceQ9PiYxHr0m8TF
	Aky2ldEyUzOKjca+mxFJqo7UaD+tdI4PQxKn4PnARcj0Ne3qklVPdP50d5fZ9JTIuLnkiTvaM0lyx
	qd7gMGEfvlBFhJ+0kyzwhFgpeQJx1E+Wuu6JVszUXVonChyLrFIySG0ZDaYebhYYDeHZnOTB3FLsD
	713jG71RwCMG9QC4PfmeAgd2CE/yt93Ly1SEVRNq+WPeRA6fAMQzAA88CEZfnWVGMF4j4LjElnFhk
	jAFbb0kFeLSUb7AyWLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrQWN-004N5A-2W;
	Fri, 13 Oct 2023 22:20:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrQWA-004N1Z-19
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Oct 2023 22:20:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVw-0003uC-6H; Sat, 14 Oct 2023 00:20:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-001URD-JE; Sat, 14 Oct 2023 00:20:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-00FrH4-9h; Sat, 14 Oct 2023 00:20:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 5/7] ASoC: meson: Make meson_card_remove() return void
Date: Sat, 14 Oct 2023 00:19:51 +0200
Message-ID: <20231013221945.1489203-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2962; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yF2Q7ng4BO/0bNqNzg+OGX3edKvUXFE8sRAPvpn8ZJo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKcKHnrjMUvX5oysin1crHzg1x1xYF02Horo6o vPoRHC1nheJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSnChwAKCRCPgPtYfRL+ Tmm+CACpOts6HE9b9hyqqncrhckXQLavS2qdjGfrlZ74Retu3o4BrjF0Ho9Eep0YyRBFa/GO9zk bLHgnB6Trr/uXT7wqct/v/1G0godBI9CqlvGQ3EMJnLo04jKjURN8Bv48BJe+cFxU3FWcTvPhzS zw+S1/+m3a+x4lD7EvUKIGvzyOvqNLFLyw3HWeqwchXjCbF/M7iiYMY17ikaPfdqEMQl//Xrqg7 JFOGTHgPhFSYKICrH+y3m3+JikstRYb1amhs4lRHu62wqDOBsE7ZESaCQ/CGGLtHQAgbEtgSGCd OoEtVbD0rmSuRY7G9/04hQZgq+Xz84tFoF04Zo4ZSV8pv2ey
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_152026_426869_6A1CCD37 
X-CRM114-Status: GOOD (  16.26  )
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
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiAg
SG93ZXZlciB0aGUgdmFsdWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZAphbmQgdGhpcyB0
eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJl
IGlzIGEKcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0
aGUgZmlyc3Qgc3RlcCBvZiB0aGlzCnF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8g
LnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMKdm9pZC4KCm1lc29uX2NhcmRfcmVt
b3ZlKCkgcmV0dXJuZWQgemVybyB1bmNvbmRpdGlvbmFsbHkuIE1ha2UgaXQgcmV0dXJuIHZvaWQK
aW5zdGVhZCBhbmQgY29udmVydCBhbGwgdXNlcnMgdG8gc3RydWN0IHBsYXRmb3JtX2RldmljZTo6
cmVtb3ZlX25ldygpLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBzb3VuZC9zb2MvbWVzb24vYXhnLWNhcmQuYyAg
ICAgICAgIHwgMiArLQogc291bmQvc29jL21lc29uL2d4LWNhcmQuYyAgICAgICAgICB8IDIgKy0K
IHNvdW5kL3NvYy9tZXNvbi9tZXNvbi1jYXJkLXV0aWxzLmMgfCA0ICstLS0KIHNvdW5kL3NvYy9t
ZXNvbi9tZXNvbi1jYXJkLmggICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vYXhn
LWNhcmQuYyBiL3NvdW5kL3NvYy9tZXNvbi9heGctY2FyZC5jCmluZGV4IDE4YjE2Mjc0NDQ5ZS4u
MzE4MGFhNGQzYTE1IDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvbWVzb24vYXhnLWNhcmQuYworKysg
Yi9zb3VuZC9zb2MvbWVzb24vYXhnLWNhcmQuYwpAQCAtMzYwLDcgKzM2MCw3IEBAIE1PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIGF4Z19jYXJkX29mX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgYXhnX2NhcmRfcGRydiA9IHsKIAkucHJvYmUgPSBtZXNvbl9jYXJkX3Byb2Jl
LAotCS5yZW1vdmUgPSBtZXNvbl9jYXJkX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IG1lc29uX2Nh
cmRfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gImF4Zy1zb3VuZC1jYXJkIiwKIAkJ
Lm9mX21hdGNoX3RhYmxlID0gYXhnX2NhcmRfb2ZfbWF0Y2gsCmRpZmYgLS1naXQgYS9zb3VuZC9z
b2MvbWVzb24vZ3gtY2FyZC5jIGIvc291bmQvc29jL21lc29uL2d4LWNhcmQuYwppbmRleCAwMWJl
YWMxZDkyN2YuLmYxNTM5ZTU0MjYzOCAxMDA2NDQKLS0tIGEvc291bmQvc29jL21lc29uL2d4LWNh
cmQuYworKysgYi9zb3VuZC9zb2MvbWVzb24vZ3gtY2FyZC5jCkBAIC0xMzAsNyArMTMwLDcgQEAg
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZ3hfY2FyZF9vZl9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIGd4X2NhcmRfcGRydiA9IHsKIAkucHJvYmUgPSBtZXNvbl9jYXJk
X3Byb2JlLAotCS5yZW1vdmUgPSBtZXNvbl9jYXJkX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IG1l
c29uX2NhcmRfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gImd4LXNvdW5kLWNhcmQi
LAogCQkub2ZfbWF0Y2hfdGFibGUgPSBneF9jYXJkX29mX21hdGNoLApkaWZmIC0tZ2l0IGEvc291
bmQvc29jL21lc29uL21lc29uLWNhcmQtdXRpbHMuYyBiL3NvdW5kL3NvYy9tZXNvbi9tZXNvbi1j
YXJkLXV0aWxzLmMKaW5kZXggYzgxMDk5MjE4NTk3Li5lZDZjN2UyZjYwOWMgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3NvYy9tZXNvbi9tZXNvbi1jYXJkLXV0aWxzLmMKKysrIGIvc291bmQvc29jL21lc29u
L21lc29uLWNhcmQtdXRpbHMuYwpAQCAtMzI3LDEzICszMjcsMTEgQEAgaW50IG1lc29uX2NhcmRf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIH0KIEVYUE9SVF9TWU1CT0xfR1BM
KG1lc29uX2NhcmRfcHJvYmUpOwogCi1pbnQgbWVzb25fY2FyZF9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKK3ZvaWQgbWVzb25fY2FyZF9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbWVzb25fY2FyZCAqcHJpdiA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOwogCiAJbWVzb25fY2FyZF9jbGVhbl9yZWZlcmVuY2VzKHByaXYpOwot
Ci0JcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChtZXNvbl9jYXJkX3JlbW92ZSk7CiAK
ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZXNvbi9tZXNvbi1jYXJkLmggYi9zb3VuZC9zb2MvbWVz
b24vbWVzb24tY2FyZC5oCmluZGV4IGE1Mzc0MzI0YTE4OS4uYTBkNjkzZTRmNDYwIDEwMDY0NAot
LS0gYS9zb3VuZC9zb2MvbWVzb24vbWVzb24tY2FyZC5oCisrKyBiL3NvdW5kL3NvYy9tZXNvbi9t
ZXNvbi1jYXJkLmgKQEAgLTQ5LDYgKzQ5LDYgQEAgaW50IG1lc29uX2NhcmRfc2V0X2ZlX2xpbmso
c3RydWN0IHNuZF9zb2NfY2FyZCAqY2FyZCwKIAkJCSAgIGJvb2wgaXNfcGxheWJhY2spOwogCiBp
bnQgbWVzb25fY2FyZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTsKLWludCBt
ZXNvbl9jYXJkX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTsKK3ZvaWQgbWVz
b25fY2FyZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldik7CiAKICNlbmRpZiAv
KiBfTUVTT05fU05EX0NBUkRfSCAqLwotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
