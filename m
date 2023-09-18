Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD14CCD37B0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Sep 2023 19:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HY+y3nkFTF03nt5NI/B406Aq11P4Fe4P03yX+jgdcnc=; b=RGYt/4jYO5h4wF
	cJm7oGBazfPaz5N6PqELq7jMy1DmW8No321QDKyCviJDnRCN0RQR6rHBasxbn5qGBh04RuajlcrEh
	Hc5hmS4gKroUg0EsGVi7/11do+QwOGtx/B9x3VjvchyoxfO+N+DnswORO5OKZR+WU92CsreqlFEnz
	yl5fk1KNlDhZJc3e83utpa+Vol45rKv4MAqQQj66Mse6+M3iHtSBLGrdY07Bt+F4vgzCB8JWzF+pz
	keZ7flrXVYnFpWtRpqzk+P2mFoyVmrjNFJlnL6haFsCXRilDr2F5pqDShVPirWKpOFM+LJxcHMY9L
	RfoCHWb6iUFeX7+F1p5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKHQ-00GDhb-16;
	Mon, 18 Sep 2023 19:51:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKHJ-00GDdX-1f
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Sep 2023 19:51:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKHA-0003tb-JB; Mon, 18 Sep 2023 21:51:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKHA-007I99-5V; Mon, 18 Sep 2023 21:51:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKH9-002mCo-SC; Mon, 18 Sep 2023 21:51:19 +0200
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
Subject: [PATCH net-next 13/19] net: mdio: mux-meson-g12a: Convert to platform remove callback returning void
Date: Mon, 18 Sep 2023 21:50:56 +0200
Message-Id: <20230918195102.1302746-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
References: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EzJFBBjWak83XqZfwXAmsPeATMXEasxL4vEIaynihO4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCKoPKfUwDQDhH8du0OvFGHGy/cy/8NHJo8l/V BExs0+U2kmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQiqDwAKCRCPgPtYfRL+ TnypCACUDyS5DHFzFzNuBt/1GnxBHxRj+FItq3pn9j1bAuTt0BtINBnJ2FVOxKZ+HWIeM5lgJXy G1MK3iGEBVHvLVu6TLS8UpA8aJ5rUdfFO3KyFKmViyoLkQpusyo4wqA9wj0QSdZ5wk/jDXrHivX cgIYGngVkHSzlzeMTA8nJNmdcDDQHc4g5iJ9fzVmJODorwn06JAs7ttSAbkRsqQU6kGicXkCcLU dN5nz/WyYw8xn3PgbaN9bGDo1kfVAwTDN3Tm6VW5zVS4ief9o7IcZ+66f5i9W5oxUIjQoC5Z+tJ Jk5GHCetMEO5hxLCA1MdOapxlaZcEa7htdOFyd+X5q7ze+ZL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_125129_548939_E757CEDE 
X-CRM114-Status: GOOD (  15.86  )
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
L21kaW8vbWRpby1tdXgtbWVzb24tZzEyYS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
bWRpby9tZGlvLW11eC1tZXNvbi1nMTJhLmMgYi9kcml2ZXJzL25ldC9tZGlvL21kaW8tbXV4LW1l
c29uLWcxMmEuYwppbmRleCA5MTBlNWNmNzRlODkuLjc1NGIwZjJjZjE1YiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1tZXNvbi1nMTJhLmMKKysrIGIvZHJpdmVycy9uZXQv
bWRpby9tZGlvLW11eC1tZXNvbi1nMTJhLmMKQEAgLTMzNiw3ICszMzYsNyBAQCBzdGF0aWMgaW50
IGcxMmFfbWRpb19tdXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1
cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IGcxMmFfbWRpb19tdXhfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBnMTJhX21kaW9fbXV4X3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBnMTJhX21kaW9fbXV4ICpwcml2
ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKQEAgLTM0NCwxMyArMzQ0LDExIEBAIHN0
YXRpYyBpbnQgZzEyYV9tZGlvX211eF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAogCWlmIChfX2Nsa19pc19lbmFibGVkKHByaXYtPnBsbCkpCiAJCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShwcml2LT5wbGwpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIGcxMmFfbWRpb19tdXhfZHJpdmVyID0gewogCS5wcm9iZQkJPSBnMTJhX21k
aW9fbXV4X3Byb2JlLAotCS5yZW1vdmUJCT0gZzEyYV9tZGlvX211eF9yZW1vdmUsCisJLnJlbW92
ZV9uZXcJPSBnMTJhX21kaW9fbXV4X3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSAi
ZzEyYS1tZGlvX211eCIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IGcxMmFfbWRpb19tdXhfbWF0Y2gs
Ci0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
