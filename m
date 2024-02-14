Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E96C48BEB
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Feb 2024 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y69jd5jEE/d1OmsHKbrFBSIW0+eS2p5qSnwBtvHfpO8=; b=e6abZXDCh+dgDA
	GulG5K1wqozZxgJdBb7VqtqypUagDM+xPbf/3DBv6li96qF/1q84w2RUzcAwwEj6A+YSu41lVkxox
	azDOIiMUbT3PPqoO078KxZWxtAvF8q7poFnyEXtWN/RoBBdWirZD15s+Q53NVvuLh+hXbNzIl3exu
	W0uDrho9gTOfPPllIGuu26cYpnVwhoYzA0rwUZwW/Y7WZkYCagztDhXj0TD1wS0qvmF14YUr/NqmT
	hRgPBW2EUIeyEn23VfiDqSDsc/MAHKvM0q2VZ+PmBhzkx/Fip8C9ghNzyynfhMz2UAYFu3EAm4N1e
	DdWwd6ItL5zbcSQET2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBgz-0000000CM91-3YUW;
	Wed, 14 Feb 2024 09:36:37 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBf4-0000000CKMD-2lnC
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Feb 2024 09:34:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBew-00056v-Pb; Wed, 14 Feb 2024 10:34:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBeu-000fDA-V0; Wed, 14 Feb 2024 10:34:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBeu-004Y4Z-2p;
	Wed, 14 Feb 2024 10:34:28 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-pwm@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v6 071/164] pwm: meson: Make use of pwmchip_parent() accessor
Date: Wed, 14 Feb 2024 10:31:58 +0100
Message-ID: <02d5f32001c4d0817fa79f5831cfd16b7e345f00.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=lGUecNCwBfcrdR1yv/aBSypKpDhhdu1IeSjEpVahTX8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIicu0Qm2x0kESKafacDQMOK2tGhj6by91QPQ 8xM4An/CGiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyInAAKCRCPgPtYfRL+ TtQaCACrgQRjkPmjo63SZIBLq/BColLa6bOlmKXmO3Lu+7q7KYKjyFJ23MJYIwb0GFMM0tTThqx lKmYG3szeg8npTWTEkLza2H8WSoRxztqcaa06BjuN4EzK4IZ39BvSIzTsMkjshGEyJpQL5JV1Lr ENynJWyjfdzNZR4HU1gxESxp77P5g1dmZU5cKA9nX1l80ZkzuweNlfpYcIRCKIOLYsh+8phmrfM +wWe33LvwP1mDIBbq6InqTfCfuZVRzXwT/fum4MnFpy21ikeki2Vl9GRfIOEcxHWLSxRE29G2qj Hpet/6aqXEfxAEKKulkzRBk5QNMgGtcCu/I4c7Lxdmmo5Y7j
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_013438_871216_AC13026D 
X-CRM114-Status: GOOD (  13.81  )
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

c3RydWN0IHB3bV9jaGlwOjpkZXYgaXMgYWJvdXQgdG8gY2hhbmdlLiBUbyBub3QgaGF2ZSB0byB0
b3VjaCB0aGlzCmRyaXZlciBpbiB0aGUgc2FtZSBjb21taXQgYXMgc3RydWN0IHB3bV9jaGlwOjpk
ZXYsIHVzZSB0aGUgYWNjZXNzb3IKZnVuY3Rpb24gcHJvdmlkZWQgZm9yIGV4YWN0bHkgdGhpcyBw
dXJwb3NlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8IDE2ICsrKysr
KysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMgYi9kcml2ZXJzL3B3bS9w
d20tbWVzb24uYwppbmRleCA3Y2U0MTgxMTUzN2QuLjhmNjdkNmJhNDQzZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wd20vcHdtLW1lc29uLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKQEAg
LTEyMiw3ICsxMjIsNyBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9yZXF1ZXN0KHN0cnVjdCBwd21f
Y2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIHsKIAlzdHJ1Y3QgbWVzb25fcHdt
ICptZXNvbiA9IHRvX21lc29uX3B3bShjaGlwKTsKIAlzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwg
KmNoYW5uZWwgPSAmbWVzb24tPmNoYW5uZWxzW3B3bS0+aHdwd21dOwotCXN0cnVjdCBkZXZpY2Ug
KmRldiA9IGNoaXAtPmRldjsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwd21jaGlwX3BhcmVudChj
aGlwKTsKIAlpbnQgZXJyOwogCiAJZXJyID0gY2xrX3ByZXBhcmVfZW5hYmxlKGNoYW5uZWwtPmNs
ayk7CkBAIC0xNzAsMTkgKzE3MCwxOSBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9jYWxjKHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAogCWZpbl9mcmVxID0g
Y2xrX3JvdW5kX3JhdGUoY2hhbm5lbC0+Y2xrLCBmcmVxKTsKIAlpZiAoZmluX2ZyZXEgPT0gMCkg
ewotCQlkZXZfZXJyKGNoaXAtPmRldiwgImludmFsaWQgc291cmNlIGNsb2NrIGZyZXF1ZW5jeVxu
Iik7CisJCWRldl9lcnIocHdtY2hpcF9wYXJlbnQoY2hpcCksICJpbnZhbGlkIHNvdXJjZSBjbG9j
ayBmcmVxdWVuY3lcbiIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKLQlkZXZfZGJnKGNoaXAt
PmRldiwgImZpbl9mcmVxOiAlbHUgSHpcbiIsIGZpbl9mcmVxKTsKKwlkZXZfZGJnKHB3bWNoaXBf
cGFyZW50KGNoaXApLCAiZmluX2ZyZXE6ICVsdSBIelxuIiwgZmluX2ZyZXEpOwogCiAJY250ID0g
ZGl2X3U2NChmaW5fZnJlcSAqIHBlcmlvZCwgTlNFQ19QRVJfU0VDKTsKIAlpZiAoY250ID4gMHhm
ZmZmKSB7Ci0JCWRldl9lcnIoY2hpcC0+ZGV2LCAidW5hYmxlIHRvIGdldCBwZXJpb2QgY250XG4i
KTsKKwkJZGV2X2Vycihwd21jaGlwX3BhcmVudChjaGlwKSwgInVuYWJsZSB0byBnZXQgcGVyaW9k
IGNudFxuIik7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCWRldl9kYmcoY2hpcC0+ZGV2LCAi
cGVyaW9kPSVsbHUgY250PSV1XG4iLCBwZXJpb2QsIGNudCk7CisJZGV2X2RiZyhwd21jaGlwX3Bh
cmVudChjaGlwKSwgInBlcmlvZD0lbGx1IGNudD0ldVxuIiwgcGVyaW9kLCBjbnQpOwogCiAJaWYg
KGR1dHkgPT0gcGVyaW9kKSB7CiAJCWNoYW5uZWwtPmhpID0gY250OwpAQCAtMTkzLDcgKzE5Myw3
IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2NhbGMoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1
Y3QgcHdtX2RldmljZSAqcHdtLAogCX0gZWxzZSB7CiAJCWR1dHlfY250ID0gZGl2X3U2NChmaW5f
ZnJlcSAqIGR1dHksIE5TRUNfUEVSX1NFQyk7CiAKLQkJZGV2X2RiZyhjaGlwLT5kZXYsICJkdXR5
PSVsbHUgZHV0eV9jbnQ9JXVcbiIsIGR1dHksIGR1dHlfY250KTsKKwkJZGV2X2RiZyhwd21jaGlw
X3BhcmVudChjaGlwKSwgImR1dHk9JWxsdSBkdXR5X2NudD0ldVxuIiwgZHV0eSwgZHV0eV9jbnQp
OwogCiAJCWNoYW5uZWwtPmhpID0gZHV0eV9jbnQ7CiAJCWNoYW5uZWwtPmxvID0gY250IC0gZHV0
eV9jbnQ7CkBAIC0yMTcsNyArMjE3LDcgQEAgc3RhdGljIHZvaWQgbWVzb25fcHdtX2VuYWJsZShz
dHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20pCiAKIAllcnIgPSBj
bGtfc2V0X3JhdGUoY2hhbm5lbC0+Y2xrLCBjaGFubmVsLT5yYXRlKTsKIAlpZiAoZXJyKQotCQlk
ZXZfZXJyKGNoaXAtPmRldiwgInNldHRpbmcgY2xvY2sgcmF0ZSBmYWlsZWRcbiIpOworCQlkZXZf
ZXJyKHB3bWNoaXBfcGFyZW50KGNoaXApLCAic2V0dGluZyBjbG9jayByYXRlIGZhaWxlZFxuIik7
CiAKIAlzcGluX2xvY2tfaXJxc2F2ZSgmbWVzb24tPmxvY2ssIGZsYWdzKTsKIApAQCAtNDM5LDcg
KzQzOSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHMoc3RydWN0IHB3bV9j
aGlwICpjaGlwKQogewogCXN0cnVjdCBtZXNvbl9wd20gKm1lc29uID0gdG9fbWVzb25fcHdtKGNo
aXApOwogCXN0cnVjdCBjbGtfcGFyZW50X2RhdGEgbXV4X3BhcmVudF9kYXRhW01FU09OX01BWF9N
VVhfUEFSRU5UU10gPSB7fTsKLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBjaGlwLT5kZXY7CisJc3Ry
dWN0IGRldmljZSAqZGV2ID0gcHdtY2hpcF9wYXJlbnQoY2hpcCk7CiAJdW5zaWduZWQgaW50IGk7
CiAJY2hhciBuYW1lWzI1NV07CiAJaW50IGVycjsKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
