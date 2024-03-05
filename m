Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4525C54E4A
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2024 21:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/dnJLwAa8ln/OO+/RSNh20/4zaRJ+jeu9j8tPFzICc=; b=Dz7QIxuID4DB4t
	reugeAchKrpfJtG+vwFh9NfE1HOWREDddk7kUE36Lbf8KZOeAj0a0KmrYmabIiPVTd/Cwn39QRoyy
	zHFhhsLGtgkFuWafhrjQKeErJgpFNLUVqS5mr4w0YY6FrzlNcchekJ0uhpNRdyIsL7fOeT/BW3FHJ
	l7H8gAP8rR6fwIqGOn9DDjGSJXtDOjX16XTNTSBbpCWwbZixad3qH4OwxFx1G3WbJLWDT+7oOkH8y
	l0lqVv+6ceFcP2QFyqSWiwKFsTFp+qeLygtfXdv3V3S6vCVZp5JEmSoPdjeQqaV62u+4qlmaXqoPi
	hsQF569GGGt37ZdiYiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhcOj-0000000FKit-3tCp;
	Tue, 05 Mar 2024 21:32:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhcOh-0000000FKgo-3JxI
	for linux-amlogic@lists.infradead.org;
	Tue, 05 Mar 2024 21:32:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcOe-0006r5-NY; Tue, 05 Mar 2024 22:32:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcOe-004cmH-8i; Tue, 05 Mar 2024 22:32:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcOe-000ISx-0a;
	Tue, 05 Mar 2024 22:32:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 1/3] reset: meson-audio-arb: Convert to platform remove callback returning void
Date: Tue,  5 Mar 2024 22:32:03 +0100
Message-ID: <dbca07bad345abe7ca421515004987acf1cb41c2.1709674157.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1709674157.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709674157.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=ax4ocmWgdyR2S0Rp27gdwmhqKLnCwEq0x6qra/psAgE=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtTn/SExj8u8VgcX69yuiG7acTjXfv7ha9/s2ly/BNrt+ ayv57+uk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJrHjHwbDzZGJ1H4fz3tww 07/p8iaGmksUnohsDZULuv8sXqmF/02k+4x9/mI3VBLbDxTczjiQnDpl+rJd34RWshfrHJT9Et9 ftKEnVL00+bBXY5n9qzam3nVaxo1MRSlLb1tI7++7ERSjyMZf+a5Y/ue8qRY7J941mbQ6c53e/r n5FjeaWt+zPN8yfZJRfvVZpe9/chVaOmdv9xcXfrrr2yePJ0yz3of88qiZ7Hz2T4pf7cLKXbJSf 1Y5HJzvHnOI56P/u+To1PT3qg8u7b2lX+x86yOX+mTu10K6SkLHHttGOtgH6ogrXxDLnLOJmbPR 6I+O8HFuji4D83wnw9umGyqkPIJDS9SvMhpv+FvsPakMAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_133227_869640_4AA44C0F 
X-CRM114-Status: GOOD (  15.52  )
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
ZXJzL3Jlc2V0L3Jlc2V0LW1lc29uLWF1ZGlvLWFyYi5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9yZXNldC9yZXNldC1tZXNvbi1hdWRpby1hcmIuYyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtbWVz
b24tYXVkaW8tYXJiLmMKaW5kZXggNzg5MWQ1MmZhODk5Li44NzQwZjVmNmFiZjggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtbWVzb24tYXVkaW8tYXJiLmMKKysrIGIvZHJpdmVycy9y
ZXNldC9yZXNldC1tZXNvbi1hdWRpby1hcmIuYwpAQCAtMTIwLDcgKzEyMCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lc29uX2F1ZGlvX2FyYl9vZl9tYXRjaFtdID0gewog
fTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1lc29uX2F1ZGlvX2FyYl9vZl9tYXRjaCk7CiAK
LXN0YXRpYyBpbnQgbWVzb25fYXVkaW9fYXJiX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQorc3RhdGljIHZvaWQgbWVzb25fYXVkaW9fYXJiX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBtZXNvbl9hdWRpb19hcmJfZGF0YSAqYXJiID0g
cGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKQEAgLTEzMCw4ICsxMzAsNiBAQCBzdGF0aWMg
aW50IG1lc29uX2F1ZGlvX2FyYl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAlzcGluX3VubG9jaygmYXJiLT5sb2NrKTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShhcmIt
PmNsayk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBtZXNvbl9hdWRpb19hcmJfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKQEAgLTE4OSw3ICsxODcsNyBAQCBzdGF0
aWMgaW50IG1lc29uX2F1ZGlvX2FyYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtZXNvbl9hdWRpb19hcmJfcGRydiA9
IHsKIAkucHJvYmUgPSBtZXNvbl9hdWRpb19hcmJfcHJvYmUsCi0JLnJlbW92ZSA9IG1lc29uX2F1
ZGlvX2FyYl9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBtZXNvbl9hdWRpb19hcmJfcmVtb3ZlLAog
CS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gIm1lc29uLWF1ZGlvLWFyYi1yZXNldCIsCiAJCS5vZl9t
YXRjaF90YWJsZSA9IG1lc29uX2F1ZGlvX2FyYl9vZl9tYXRjaCwKLS0gCjIuNDMuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
