Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B7ACDB47E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Oct 2023 07:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1FH697z70geYxxx8ERL7zKH4vJQJblzZyeKUctcrGw=; b=nSZDO23mNqfuD0
	4NIC/nLRX8wV/NyJyAZK1qwIVt83H5/zHRRc7Mjuc/8ZAAE/9YTSu2AdtXihSzzvpSn8zLoCZezii
	/2xdC/HnA+n9TpSXIpzlOtS3XaYbiGuIbhuDCl/tyPTvqpBYVKqavHIVsDfLaYnthJjqQIdLllKFk
	8imrBU0THVsdPznELUv5Q0MentPDieeaU8qv8LwAQRh/B/pXnvet+U3DzQzrRJWJvu+8202HLjkbN
	wAH76J7Fel2MeWljBkJuWNHpNgrHFSfxFJlJyibto5PkNqlVCe9Jxax942nOzHYtJPMLWj8vnpXvU
	VXU75GKV1P+WPD0dpW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkN7-001UBu-28;
	Fri, 20 Oct 2023 07:56:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkN4-001UAC-1v
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Oct 2023 07:56:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtkMy-0003G2-E3; Fri, 20 Oct 2023 09:56:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtkMy-002yUH-0m; Fri, 20 Oct 2023 09:56:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtkMx-002OIN-NT; Fri, 20 Oct 2023 09:56:31 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 05/42] crypto: amlogic-gxl-core - Convert to platform remove callback returning void
Date: Fri, 20 Oct 2023 09:55:27 +0200
Message-ID: <20231020075521.2121571-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hXDLzoMA+y5An9CnasWFkoxWoOYFEvCz++Cfy0XuFYo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMjJvvN0Q7PlqJK6xoRBrUxyKtBnx/kra+bF0y 8Nd+QigtyKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTIybwAKCRCPgPtYfRL+ ThQvB/9o/uBuSUqapZmm9Aei5FfC51JaCF1TbLTRTnkO6/NKxrj7pB47dHjpvhmlrNROqxLA++b iJM4e/jqun7RAwFIocihBaMNdl4PodtEAX/WRN74KskqYsboHZJFC6uKKsc55BOesAJluYyxpL7 F46lHV9GT+8VKwmgbx+jt9qCRsmNs5UYsjyPTsZ2jmw7tvrKVr6Bu1gpOqrxTFqHJPKHiFvnfuu jV+zWdEpxJaYtBJwaX4g0v8XTUW2iLnA5nCMdS3hqiG9QyCpU8mopgqiRW4efBYh0XwUTNFkXL8 +IlI6+pLxpMKB1AaQU6b1Y5ENcS13cyg86yELKIr/xUswT/Y
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_005638_654773_047578A9 
X-CRM114-Status: GOOD (  14.83  )
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
ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYyB8IDUgKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMgYi9kcml2ZXJzL2NyeXB0by9h
bWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYwppbmRleCBkYTZkZmUwZjlhYzMuLmY1NGFiMGQwYjFl
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMK
KysrIGIvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMKQEAgLTI5OSw3
ICsyOTksNyBAQCBzdGF0aWMgaW50IG1lc29uX2NyeXB0b19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCXJldHVybiBlcnI7CiB9CiAKLXN0YXRpYyBpbnQgbWVzb25fY3J5cHRv
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgbWVzb25f
Y3J5cHRvX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBt
ZXNvbl9kZXYgKm1jID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKQEAgLTMxMiw3ICsz
MTIsNiBAQCBzdGF0aWMgaW50IG1lc29uX2NyeXB0b19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAltZXNvbl9mcmVlX2NoYW5saXN0KG1jLCBNQVhGTE9XIC0gMSk7CiAKIAlj
bGtfZGlzYWJsZV91bnByZXBhcmUobWMtPmJ1c2Nsayk7Ci0JcmV0dXJuIDA7CiB9CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lc29uX2NyeXB0b19vZl9tYXRjaF90YWJsZVtd
ID0gewpAQCAtMzIzLDcgKzMyMiw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1lc29uX2Ny
eXB0b19vZl9tYXRjaF90YWJsZSk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1l
c29uX2NyeXB0b19kcml2ZXIgPSB7CiAJLnByb2JlCQkgPSBtZXNvbl9jcnlwdG9fcHJvYmUsCi0J
LnJlbW92ZQkJID0gbWVzb25fY3J5cHRvX3JlbW92ZSwKKwkucmVtb3ZlX25ldwkgPSBtZXNvbl9j
cnlwdG9fcmVtb3ZlLAogCS5kcml2ZXIJCSA9IHsKIAkJLm5hbWUJCSAgID0gImd4bC1jcnlwdG8i
LAogCQkub2ZfbWF0Y2hfdGFibGUJPSBtZXNvbl9jcnlwdG9fb2ZfbWF0Y2hfdGFibGUsCi0tIAoy
LjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
