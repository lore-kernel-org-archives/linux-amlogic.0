Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA334E743ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Sep 2023 06:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B4pC+WsxY3FvierZ9jDlcVyDmkCCfaR39vO7dTF+l5c=; b=U6Zp7kwVd8vmF5
	QILfxeBoGTEFjxoPzF98XOqagdLZGOlCRc8VwL6K7eCIa3sTWU4PrDuGaBdJGPbopkVXIuaP3g2QN
	FbhTiLu+LuPrhMSJJQGZ5SGQUhy9zkHx2EgD1pmCXnh8zgMlRTh6Sd6HSw0mPHo8jMKdrCrvtuj3N
	7ZTnj9DASvWksiAgukfpQ6D9KqErMjpENIn5KmDFsGBMHP6laKD6+tGLZzLaWdW5LzX0aqsE9z1cn
	JUAs9DwA2LhJ/B6xOqa5iawVK5vJtX7FxFCZzGEY+nyMWxrSm54n+aqYX5Fs8IoeuK01lWzFfyJux
	nRwts/0F0bbiPkVn69MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm6ke-007Eqg-0P;
	Fri, 29 Sep 2023 06:13:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm6ka-007Eq8-26
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Sep 2023 06:13:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qm6kR-0006t6-Jz; Fri, 29 Sep 2023 08:13:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qm6kQ-009kcb-DQ; Fri, 29 Sep 2023 08:13:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qm6kQ-005q0n-30; Fri, 29 Sep 2023 08:13:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc: kernel@pengutronix.de,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guillaume La Roque <glaroque@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] thermal: amlogic: Fix build failure after conversion to .remove_new()
Date: Fri, 29 Sep 2023 08:13:05 +0200
Message-Id: <20230929061305.2351953-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=13Z1to5MG3FIfiSVPPchPg9gsuDRWRE9cMd7HsLPULM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlFmrwVgajUhEsC20E8NOZ4T/fEWNbhyqEvmByM c3ujLPIxseJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRZq8AAKCRCPgPtYfRL+ To8wB/9Htf20WNbgD4mF3exvAEiOkhGYvEjGNMT2/kzqJ6ICxintj2SIJtavL1m2DMAp9d5WtL0 i2Lm6DSwcnI1YQhSWysYDvxSVNNJx61kPQ5dQKSwE6uMOn3+d8Z6XaDOgqXhaxPuSUWglNuOIha 5zAXRLvU562DVevp8iLlqn94udoPQOQGXiIf2t4QVdlXYDGgXvZbJBMwusKLBBH+SKM/yaUmpXJ uxvDVlGWNNzpjQS9lo2mslUkKRwSJ+P4Db/WRMgfmE6oVGrbS76dr1TMVHbS1A/9KxTiqrUR2QR RXRpYo9LBvGAliW23ei2+tx/+kTL7QbRN64PR7vrrZbMrvJA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_231320_688701_8D344E73 
X-CRM114-Status: GOOD (  13.38  )
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

Q29tbWl0IDg4YWY4YjY2ZmZlZCAoInRoZXJtYWw6IGFtbG9naWM6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlCmNhbGxiYWNrIHJldHVybmluZyB2b2lkIikgY29udmVydGVkIGFtbG9naWNfdGhl
cm1hbF9kaXNhYmxlKCkgdG8gcmV0dXJuCm5vIHZhbHVlIGJ1dCBtaXNzZWQgdGhhdCBhbWxvZ2lj
X3RoZXJtYWxfc3VzcGVuZCgpIG1ha2VzIHVzZSBvZiB0aGUgaW50CnJldHVybmVkIGJ5IHRoaXMg
ZnVuY3Rpb24uIEFzIGFtbG9naWNfdGhlcm1hbF9kaXNhYmxlKCkgcmV0dXJuZWQgemVybwp1bmNv
bmRpdGlvbmFsbHkgYmVmb3JlLCBhZGQgYSByZXR1cm4gMCB0byBnZXQgdGhlIHNhbWUgYmVoYXZp
b3VyIGFzCmJlZm9yZSB0aGUgb2ZmZW5kaW5nIGNvbW1pdC4KCkZpeGVzOiA4OGFmOGI2NmZmZWQg
KCJ0aGVybWFsOiBhbWxvZ2ljOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBy
ZXR1cm5pbmcgdm9pZCIpClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVs
LmNvbT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMw
OTI5MTIxNC5Iam4zZ0o5NC1sa3BAaW50ZWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KSGVsbG8sCgpzb3Jy
eSBmb3Igbm90IGNhdGNoaW5nIHRoYXQgYmVmb3JlIHNlbmRpbmcuIEkgZG9uJ3QgdW5kZXJzdGFu
ZCB5ZXQgd2hhdAp3YXMgd3Jvbmcgd2l0aCBteSB0ZXN0aW5nOyBJIHdvdWxkIGhhdmUgYmV0IHRo
ZSBzZXJpZXMgd2FzIHRlc3RlZCB3aXRoCmFuIEFSQ0g9YXJtNjQgYWxsbW9kY29uZmlnIGJ1aWxk
LiA6LVwKCklmIHlvdSBwcmVmZXIgaXQsIGZlZWwgZnJlZSB0byBzcXVhc2ggdGhpcyBwYXRjaCBp
bnRvIHRoZSBvZmZlbmRpbmcKY29tbWl0LgoKQmVzdCByZWdhcmRzLCBzb3JyeSBhbmQgdGhhbmtz
LApVd2UKCiBkcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgfCA0ICsrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgYi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dp
Y190aGVybWFsLmMKaW5kZXggMTQyNmYxZWI0YWM2Li41NjJmNjNiN2JmMjcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYworKysgYi9kcml2ZXJzL3RoZXJtYWwv
YW1sb2dpY190aGVybWFsLmMKQEAgLTMwMCw3ICszMDAsOSBAQCBzdGF0aWMgaW50IF9fbWF5YmVf
dW51c2VkIGFtbG9naWNfdGhlcm1hbF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlz
dHJ1Y3QgYW1sb2dpY190aGVybWFsICpkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAKLQly
ZXR1cm4gYW1sb2dpY190aGVybWFsX2Rpc2FibGUoZGF0YSk7CisJYW1sb2dpY190aGVybWFsX2Rp
c2FibGUoZGF0YSk7CisKKwlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBhbWxvZ2ljX3RoZXJtYWxfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKLS0gCjIuNDAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
