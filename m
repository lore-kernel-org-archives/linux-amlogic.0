Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8C9E82CC3
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 19:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsP7J5H/W0u5d0yK95pLK+neDX5bI+sJnmExM5q80G0=; b=4bsR+R9AjCdUm0
	VQXCGVkyLpU807U9c/34/uRtuXaD9FroxbBmyKVcjwZzd9GrBbHPWiwnfm+y5nJNafRRfSv1onUk5
	MNKX70rhBV14FHGHAELdnMxdA+RfJBTwWbao8sfhqkNAuCK2bEsjr1CnjfuZZkqNKFjFhIPJbsbV4
	JnOMn1meoEShNR0ZXgI9fgc82srdQCpKfbFiZgf/KWsID6BDdqzSHUMk6HSwIBzBGzbH+W+nWNb1N
	GI7hZXc/CZBa3YjDBWLhYHoCFAMf34GHyzE3DRvenGmiCtYAFoq8nDsGdDmh4n7LQjgkYtaXZH/G+
	+PiRWXtprMPVbvRVpBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlaMB-001fJc-2g;
	Wed, 27 Sep 2023 19:37:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlaM8-001fHV-2i
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Sep 2023 19:37:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlaLt-00026h-H9; Wed, 27 Sep 2023 21:37:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlaLs-009PZC-RF; Wed, 27 Sep 2023 21:37:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlaLs-005RfO-Ht; Wed, 27 Sep 2023 21:37:40 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 01/31] thermal: amlogic: Convert to platform remove callback returning void
Date: Wed, 27 Sep 2023 21:37:06 +0200
Message-Id: <20230927193736.2236447-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
References: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2461; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KxL8aBbxeG861TkwND8mWyXQYKx1VJQ+ig1ZgxFPaLE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlFIRalZDbOoWWsVvgInsGRLaQoIOvEjn79XJqE Owea3jLoz+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRSEWgAKCRCPgPtYfRL+ Tui2CACKbQGRijUIxoCyJCojT3AqP+lOQDd9LzPQ/2t6lYKyiESE/O/CO7WzHbxyWh7XJWr0FpG 3SQS5HOXhfVXGggOqdQSdEERNpKZgdp+6m8KMbejXJwM3DZJdsvTOrF69Gq4akfa7onMCP/XfsW RyqQ0axmobLx7Ez7vKVFWK1eR9zgyjCC4daAytV1Wyc/YzecAB4a0Kw5wDPcdzF+XDHKAenZa4R X/GvYke2HN/ffw4f1OgiRtkdkDo9DVuOk3CWN0vxFIH3E0BAthid87UZImtjwuVtnrydzWDAyL8 1ACUuqRXEazp9lD2/dFtqKj1Ga0t0H5Jp+EIMr3JwATUfF4h
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_123756_890602_99905AA4 
X-CRM114-Status: GOOD (  15.64  )
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
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgphbWxvZ2ljX3RoZXJtYWxf
ZGlzYWJsZSgpIGFsd2F5cyByZXR1cm5lZCB6ZXJvLiBDaGFuZ2UgaXQgdG8gcmV0dXJuIG5vCnZh
bHVlIGFuZCB0aGVuIHRyaXZpYWxseSBjb252ZXJ0IHRoZSBkcml2ZXIgdG8gLnJlbW92ZV9uZXco
KSBhbmQgZml4IGEKd2hpdGVzcGFjZSBpbmNvbnNpdGVuY3kgZW4gcGFzc2FudC4KClNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
Ci0tLQogZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jIHwgMTIgKysrKystLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYyBiL2RyaXZlcnMvdGhlcm1h
bC9hbWxvZ2ljX3RoZXJtYWwuYwppbmRleCA4MWViYmY2ZGUwZGUuLjE0MjZmMWViNGFjNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCisrKyBiL2RyaXZlcnMv
dGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYwpAQCAtMTY3LDEzICsxNjcsMTEgQEAgc3RhdGljIGlu
dCBhbWxvZ2ljX3RoZXJtYWxfZW5hYmxlKHN0cnVjdCBhbWxvZ2ljX3RoZXJtYWwgKmRhdGEpCiAJ
cmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgYW1sb2dpY190aGVybWFsX2Rpc2FibGUoc3RydWN0
IGFtbG9naWNfdGhlcm1hbCAqZGF0YSkKK3N0YXRpYyB2b2lkIGFtbG9naWNfdGhlcm1hbF9kaXNh
YmxlKHN0cnVjdCBhbWxvZ2ljX3RoZXJtYWwgKmRhdGEpCiB7CiAJcmVnbWFwX3VwZGF0ZV9iaXRz
KGRhdGEtPnJlZ21hcCwgVFNFTlNPUl9DRkdfUkVHMSwKIAkJCSAgIFRTRU5TT1JfQ0ZHX1JFRzFf
RU5BQkxFLCAwKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZGF0YS0+Y2xrKTsKLQotCXJldHVy
biAwOwogfQogCiBzdGF0aWMgaW50IGFtbG9naWNfdGhlcm1hbF9nZXRfdGVtcChzdHJ1Y3QgdGhl
cm1hbF96b25lX2RldmljZSAqdHosIGludCAqdGVtcCkKQEAgLTI5MSwxMSArMjg5LDExIEBAIHN0
YXRpYyBpbnQgYW1sb2dpY190aGVybWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBhbWxvZ2ljX3RoZXJtYWxfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBhbWxvZ2ljX3RoZXJt
YWxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGFtbG9n
aWNfdGhlcm1hbCAqZGF0YSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCi0JcmV0dXJu
IGFtbG9naWNfdGhlcm1hbF9kaXNhYmxlKGRhdGEpOworCWFtbG9naWNfdGhlcm1hbF9kaXNhYmxl
KGRhdGEpOwogfQogCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGFtbG9naWNfdGhlcm1hbF9z
dXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKQEAgLTMyMSw4ICszMTksOCBAQCBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciBhbWxvZ2ljX3RoZXJtYWxfZHJpdmVyID0gewogCQkucG0JCT0g
JmFtbG9naWNfdGhlcm1hbF9wbV9vcHMsCiAJCS5vZl9tYXRjaF90YWJsZSA9IG9mX2FtbG9naWNf
dGhlcm1hbF9tYXRjaCwKIAl9LAotCS5wcm9iZQk9IGFtbG9naWNfdGhlcm1hbF9wcm9iZSwKLQku
cmVtb3ZlCT0gYW1sb2dpY190aGVybWFsX3JlbW92ZSwKKwkucHJvYmUgPSBhbWxvZ2ljX3RoZXJt
YWxfcHJvYmUsCisJLnJlbW92ZV9uZXcgPSBhbWxvZ2ljX3RoZXJtYWxfcmVtb3ZlLAogfTsKIAog
bW9kdWxlX3BsYXRmb3JtX2RyaXZlcihhbWxvZ2ljX3RoZXJtYWxfZHJpdmVyKTsKLS0gCjIuNDAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
