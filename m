Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D96C5ACB3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Nov 2023 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cf9V/596Pkszud4DG58V7UiXYHnUp4dX+lPOrk9xm1o=; b=HeB5Bne25PxX3V
	SAySB2Mxt/wmh/nlWZcUcEhMziGb1N84DQxiYTEKo35ZkVRwwInLEPVgkKSMgEFUtz/WqjSIBRtX3
	L10HxCqbURmD4r8qjHe5YaU1oUgWZdgLNPrZvk/LqUWJJ/F5emXImWER83Pbm+4BWoPdIsubln8H6
	7Sorwlowrxe8uarmL7Dug8+q9p3TrPqFpwiWBxIHdojMz4ORRUPNm0nGSPaKCRQWUkS7mO+zLv1WQ
	EI/zqOZ0toZqM6NMhHTytXNYywzHCvoQ/zRSWvLgW7GMDM1bCFn4AurxstSwVGdy1UPNhBR/znaDR
	5DRfRA+NUiFNkAPkvvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aWY-003EYB-39;
	Thu, 16 Nov 2023 11:27:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aWU-003ETV-0G
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Nov 2023 11:27:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3aWH-00084D-AH; Thu, 16 Nov 2023 12:26:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3aWG-009RE9-PB; Thu, 16 Nov 2023 12:26:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3aWG-002aLy-G8; Thu, 16 Nov 2023 12:26:48 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 2/2] thermal: amlogic: Use DEFINE_SIMPLE_DEV_PM_OPS for PM functions
Date: Thu, 16 Nov 2023 12:26:36 +0100
Message-ID: <20231116112633.668826-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
References: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1841; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=GhV61L6m5250RjClaUhpQ4Ok3kSdHAD+MEd8kv1eWac=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlVfxsDGe6lAm2SmhswY2cjWZPHW5ajdO34W3Uf Kv+prQDSaWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVX8bAAKCRCPgPtYfRL+ TnCdB/9YsxgNnfWbUb7UCsbX2HAdOY2Yfzz9LNLP1eNaSGSrM0GLE3kQxrg7zMrIPehmoErkHDs 9XYoZiByxH7hVvNKFHJaqNddzvjYKlCU0OZZe67sVdDBzq5yOpmLhAbEFHFrXm24exNVSuJRjjG Df+fILso3vPJl3TcY924K5/t/XnpXA2LJckEdBA/PWEvREucnpsnYFbcVUGDJ2aT7TRploQAa5f VPIHW4vHLSxba5jqFVrHptWosemRr7XFR073svBIEHGdESU19s0m0Izwl7+VFYZRH9cbP9JPYgW +3ERd08m9GEWDOeASyOxedH299LieKW4xNAdpQlGMxOk07Du
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_032702_125771_97B01424 
X-CRM114-Status: GOOD (  12.83  )
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

VGhpcyBtYWNybyBoYXMgdGhlIGFkdmFudGFnZSBvdmVyIFNJTVBMRV9ERVZfUE1fT1BTIHRoYXQg
d2UgZG9uJ3QgaGF2ZSB0bwpjYXJlIGFib3V0IHdoZW4gdGhlIGZ1bmN0aW9ucyBhcmUgYWN0dWFs
bHkgdXNlZCwgc28gdGhlIGNvcnJlc3BvbmRpbmcKX19tYXliZV91bnVzZWQgY2FuIGJlIGRyb3Bw
ZWQuCgpBbHNvIG1ha2UgdXNlIG9mIHBtX3B0cigpIHRvIGRpc2NhcmQgYWxsIFBNIHJlbGF0ZWQg
c3R1ZmYgaWYgQ09ORklHX1BNCmlzbid0IGVuYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMv
dGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYyB8IDExICsrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYyBiL2RyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJt
YWwuYwppbmRleCA1NjJmNjNiN2JmMjcuLmRmN2E1ZWQ1NTM4NSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCisrKyBiL2RyaXZlcnMvdGhlcm1hbC9hbWxvZ2lj
X3RoZXJtYWwuYwpAQCAtMjk2LDcgKzI5Niw3IEBAIHN0YXRpYyB2b2lkIGFtbG9naWNfdGhlcm1h
bF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlhbWxvZ2ljX3RoZXJtYWxf
ZGlzYWJsZShkYXRhKTsKIH0KIAotc3RhdGljIGludCBfX21heWJlX3VudXNlZCBhbWxvZ2ljX3Ro
ZXJtYWxfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCitzdGF0aWMgaW50IGFtbG9naWNfdGhl
cm1hbF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgYW1sb2dpY190aGVy
bWFsICpkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAKQEAgLTMwNSwyMCArMzA1LDIxIEBA
IHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgYW1sb2dpY190aGVybWFsX3N1c3BlbmQoc3RydWN0
IGRldmljZSAqZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IF9fbWF5YmVfdW51c2Vk
IGFtbG9naWNfdGhlcm1hbF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGludCBh
bWxvZ2ljX3RoZXJtYWxfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgYW1s
b2dpY190aGVybWFsICpkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAKIAlyZXR1cm4gYW1s
b2dpY190aGVybWFsX2VuYWJsZShkYXRhKTsKIH0KIAotc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BT
KGFtbG9naWNfdGhlcm1hbF9wbV9vcHMsCi0JCQkgYW1sb2dpY190aGVybWFsX3N1c3BlbmQsIGFt
bG9naWNfdGhlcm1hbF9yZXN1bWUpOworc3RhdGljIERFRklORV9TSU1QTEVfREVWX1BNX09QUyhh
bWxvZ2ljX3RoZXJtYWxfcG1fb3BzLAorCQkJCWFtbG9naWNfdGhlcm1hbF9zdXNwZW5kLAorCQkJ
CWFtbG9naWNfdGhlcm1hbF9yZXN1bWUpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBhbWxvZ2ljX3RoZXJtYWxfZHJpdmVyID0gewogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCQk9ICJh
bWxvZ2ljX3RoZXJtYWwiLAotCQkucG0JCT0gJmFtbG9naWNfdGhlcm1hbF9wbV9vcHMsCisJCS5w
bQkJPSBwbV9wdHIoJmFtbG9naWNfdGhlcm1hbF9wbV9vcHMpLAogCQkub2ZfbWF0Y2hfdGFibGUg
PSBvZl9hbWxvZ2ljX3RoZXJtYWxfbWF0Y2gsCiAJfSwKIAkucHJvYmUgPSBhbWxvZ2ljX3RoZXJt
YWxfcHJvYmUsCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
