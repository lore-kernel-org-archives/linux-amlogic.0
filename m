Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01F2CD13D8
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Sep 2023 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFu2W2XnMHYKcvzOvEi1y23fgECp1JKsMSpQ+t5RxOs=; b=ObVBJrfJ2m/qlW
	Q52iIgmH3lENhfKXLADH/bD6+JB+i46buROhdh1CqAWcUIW6Xz4uEqG7GFLE+thuXnp8KVMREVPDm
	CH51Bz6z9HNCgGPSDimk21sVTxsev5vNiEpA/QTu9jA+EdEOTy5lQB9qgRKfM+OEPN0m+9DEPcv0X
	vmgpc3jRYyGgI8Qph+id5C7dAwDDhaMpV8bU9IY89IZyBtIMUZo27cDilet1nltth3+wn8iXIkTbL
	VthPqweQyk7q3NvhrJMfmyPm40s3RJ07uVjby5vSUolu19XHsvq0qeAnc1Pis/NYt8I22fdsQZmit
	WDqGC1HePd63gmaNyYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKHT-00GDkB-1x;
	Mon, 18 Sep 2023 19:51:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKHQ-00GDgz-0Z
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Sep 2023 19:51:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKHA-0003tk-RZ; Mon, 18 Sep 2023 21:51:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKHA-007I9E-DA; Mon, 18 Sep 2023 21:51:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKHA-002mCs-3W; Mon, 18 Sep 2023 21:51:20 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 14/19] net: mdio: mux-meson-gxl: Convert to platform remove callback returning void
Date: Mon, 18 Sep 2023 21:50:57 +0200
Message-Id: <20230918195102.1302746-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
References: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ozIWasGq3N/xU1iR0Yrnd+TYz54kh5bAZ+sTOn8pRXI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCKoQ0fJ6ojipVcTwNWKvfLBM8FcQpdBBlYn/S vCT+JOQEtKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQiqEAAKCRCPgPtYfRL+ TtTSB/4sCglF6vJ5Wp7MSvPiGxMQhwl9gEoGl7FOl2982E1bRen7y+6KM/7EvTSNNCmEUf8rTVE DLjZQnsVNHbz2YtuZ2viSjO/tzDgeMJVIheCkEw9WezNtIkYXMQNCUYt17CX7ph9FvrGDESDLw3 q+QcajXEZ89FjJQt3ZLVSaTl6hzIf4PQC7EbMEbWSp/dat9pN0quna3kzgSmCpW/7CfkH2kxlfy lHtIvEny8INNFJl8GS0dO2UOB1Bm4KKEFtukCYlRl/zPiCgnGaJZ6ikAFqGBhZ+GyIsKb0xL79S W219IQo4hv5EZnfLdrexM/ZuCPg5BvDEG6xeHndx1O/5Qw5K
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_125136_213186_91BFF7ED 
X-CRM114-Status: GOOD (  15.89  )
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
ClRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxs
YmFjayByZXR1cm4Kdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcyBxdWVzdCBhbGwgZHJp
dmVycyBhcmUgY29udmVydGVkIHRvCi5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5z
IHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMKYXJlIGNvbnZlcnRlZCwgLnJlbW92
ZV9uZXcoKSBpcyByZW5hbWVkIHRvIC5yZW1vdmUoKS4KClRyaXZpYWxseSBjb252ZXJ0IHRoaXMg
ZHJpdmVyIGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKY2FsbGJhY2sg
dG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbmV0
L21kaW8vbWRpby1tdXgtbWVzb24tZ3hsLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9t
ZGlvL21kaW8tbXV4LW1lc29uLWd4bC5jIGIvZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1tZXNv
bi1neGwuYwppbmRleCA3NjE4ODU3NWNhMWYuLjg5NTU0MDIxYjVjYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9uZXQvbWRpby9tZGlvLW11eC1tZXNvbi1neGwuYworKysgYi9kcml2ZXJzL25ldC9tZGlv
L21kaW8tbXV4LW1lc29uLWd4bC5jCkBAIC0xNDAsMTggKzE0MCwxNiBAQCBzdGF0aWMgaW50IGd4
bF9tZGlvX211eF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiBy
ZXQ7CiB9CiAKLXN0YXRpYyBpbnQgZ3hsX21kaW9fbXV4X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgZ3hsX21kaW9fbXV4X3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBneGxfbWRpb19tdXggKnByaXYgPSBwbGF0
Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAogCW1kaW9fbXV4X3VuaW5pdChwcml2LT5tdXhfaGFu
ZGxlKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBn
eGxfbWRpb19tdXhfZHJpdmVyID0gewogCS5wcm9iZQkJPSBneGxfbWRpb19tdXhfcHJvYmUsCi0J
LnJlbW92ZQkJPSBneGxfbWRpb19tdXhfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gZ3hsX21kaW9f
bXV4X3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSAiZ3hsLW1kaW8tbXV4IiwKIAkJ
Lm9mX21hdGNoX3RhYmxlID0gZ3hsX21kaW9fbXV4X21hdGNoLAotLSAKMi40MC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
