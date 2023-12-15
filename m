Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D647C46CC5
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Dec 2023 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kKCd/nlqIa9IHL0qWMrheonWBECjHJiIP8esdkly7o=; b=XpL2ic6FJRXOea
	zCM/UfsUsY0kCmQzGOw7unYf0cm8eZjDKmm00L/6LXEFCra87Z0q3u6sJ9xOoSeMVDPdTkyBqLXWE
	5jZciI2hWVewP4H5KYvVlqGXD9Nv4p6ZDtKTBZhbOl57T9obWAj+wMHWFOnggAoTcSarFxpgNbEH9
	01z9JlG/0mgMbpkGV5R3EgKFkVIyDQHz0FmDZ34L/owPBxoS/egE1TNWXf9gTQWNPz2G+BcAxnlXH
	KF3bTEJyW6fcJL/n/XBntO+kt1IETJfTQrByaxI8pUTSAKTCx4n93V2vwJMps5lPa6An079yhzqve
	UiNzu+JIWGtQm/FHLqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8jK-003T0K-1G;
	Fri, 15 Dec 2023 13:59:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8j4-003So1-0v
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Dec 2023 13:59:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rE8iv-0002lM-3E; Fri, 15 Dec 2023 14:59:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rE8iu-00G2ZJ-5O; Fri, 15 Dec 2023 14:59:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rE8it-003cC6-RU; Fri, 15 Dec 2023 14:59:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] perf: amlogic: Convert to platform remove callback returning void
Date: Fri, 15 Dec 2023 14:59:02 +0100
Message-ID: <33dbadf246eb323edd9e09ac744111216c167a55.1702648124.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702648124.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702648124.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=JQzThqbYJP0QqESsItg7VkQxjf7NhjUZgsGroMmrOZc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlfFunAL8ycJpqtt6tJDjG+TMfdjLtm1rASeztS gl+kihZlRqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXxbpwAKCRCPgPtYfRL+ TohvCACm7G4Swx+T76FjE6UsHXXIG1J+cbT4v9Z3seGjq6SJJgxd/XZI+9sThyUM0hr75yQ+KpS jE0G6cKisaCLXR79HtR5VSEvyrG7PhR6WMmKdDI+pBmcfP5v3XQ69go7jN9lLOEt4oPYIU5iYbJ XunL0YeN0g0LeGgz9Gkk7FmM4LPwIyF+a2+3kHbrFww67ebezxwk5CWO6LQeMAc2NxnUJCLnW4z yZAIEt5KxjFywnR3E9IwFoq9d0jUKGig/POvSBV9AihktZICVmOoVYdMNZd0ET96RzGJUPBGs1x vrxU0Ykd14+Mfgv6oNbwZaIw96Aj6yDImRvhOCTpJyDXxOv8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_055938_342249_F7849F9A 
X-CRM114-Status: GOOD (  14.71  )
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
ZXJzL3BlcmYvYW1sb2dpYy9tZXNvbl9nMTJfZGRyX3BtdS5jIHwgNiArKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wZXJmL2FtbG9naWMvbWVzb25fZzEyX2Rkcl9wbXUuYyBiL2RyaXZlcnMvcGVyZi9hbWxv
Z2ljL21lc29uX2cxMl9kZHJfcG11LmMKaW5kZXggMTVkNTJhYjMyNzZhLi45OWNjNzkxODkyYmMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGVyZi9hbWxvZ2ljL21lc29uX2cxMl9kZHJfcG11LmMKKysr
IGIvZHJpdmVycy9wZXJmL2FtbG9naWMvbWVzb25fZzEyX2Rkcl9wbXUuYwpAQCAtMzU1LDExICsz
NTUsOSBAQCBzdGF0aWMgaW50IGcxMl9kZHJfcG11X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJcmV0dXJuIG1lc29uX2Rkcl9wbXVfY3JlYXRlKHBkZXYpOwogfQogCi1zdGF0
aWMgaW50IGcxMl9kZHJfcG11X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQor
c3RhdGljIHZvaWQgZzEyX2Rkcl9wbXVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiB7CiAJbWVzb25fZGRyX3BtdV9yZW1vdmUocGRldik7Ci0KLQlyZXR1cm4gMDsKIH0KIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25fZGRyX3BtdV9kdF9tYXRjaFtd
ID0gewpAQCAtMzgxLDcgKzM3OSw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1lc29uX2Rk
cl9wbXVfZHRfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBnMTJfZGRy
X3BtdV9kcml2ZXIgPSB7CiAJLnByb2JlID0gZzEyX2Rkcl9wbXVfcHJvYmUsCi0JLnJlbW92ZSA9
IGcxMl9kZHJfcG11X3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IGcxMl9kZHJfcG11X3JlbW92ZSwK
IAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gIm1lc29uLWcxMi1kZHItcG11IiwKLS0gCjIuNDIu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
