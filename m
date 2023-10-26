Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B1C25B6F
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Oct 2023 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDwMdGqngcrxl6vVah5u1K0Vu7gFhT2q1bqDaBUj6vc=; b=lxfMYqvamq0gy3
	iK0fT8+l8ACYJjlOsVItuHqp+tjqBNx0JDGRpaflJU5Pe/IWCVhsD7adBSvjrgzmAA+iWFJMiGklX
	1w+v8PGMP05Lqu1tenev3Q8w+bw5TKtpZ0oq6vb+dKQRgtOBYRy8YqgK+mRltdPEqEdIfXnUrQu2O
	lLiZfLOMgPzX4mbbD6nN5uvThlCUNGiJfqab2TXMgpNnRNzfqGStqGrl2cXJNnZQBjC5SCNf/9zeX
	EEUfeUIYfNH7TBI9kPU1j5qeT4fodwzTsiTnYMOnElTG6MTApQUwyEwY7/t9fBo+oDxDjVxo0nwGa
	JHM44ri8fU+CywDtB9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxRv-00E9cb-2M;
	Thu, 26 Oct 2023 10:18:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxRp-00E9XM-0X
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Oct 2023 10:18:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRc-0002oI-MQ; Thu, 26 Oct 2023 12:18:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRc-004O20-8x; Thu, 26 Oct 2023 12:18:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qvxRb-006XU6-Vn; Thu, 26 Oct 2023 12:18:27 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 3/3] media: meson-ir-tx: Drop usage of platform_driver_probe()
Date: Thu, 26 Oct 2023 12:18:20 +0200
Message-ID: <20231026101816.2460464-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
References: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vc0rJ8a46VVSlA0HFx7Dn4WOCC0eWWSYg5tIiKkiq4M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOjzsCB78wx1ZkNeeTKhvksKu4eVjXNuc4O1qP eCAsxs+oACJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTo87AAKCRCPgPtYfRL+ Tp58CACHg1uU+5cM/jq9rx7aO0xIbGNXGC/vIpXdtfz8Wx22dfmnQex6v/mAR3r+IGhX5qbP60E G1yZwI8RlMSg2UjLJydp7ct02Gmf6063fpykCZehxH+aMRrJXQ7KiqqA1A2Y4BiX25SCyTfMabA IyFaw8nXz5X7UNF/YXfxPNCIcyeVTtk2oxU+doQ7CPa0FT+/PMec5ZL7jMI2IduUlFqFNPfMAXt zWQVV5cAcrg0IIa4WZPKWedxr6zGp/9oA+VzwOj8FHRIA18VLx+GCY5GK/oKt8C84XRDT3akcHC YB7ZSWebXRVJ5X1o8dlZOvXygWBMNHLR3wd4Z72dfiVgk3+R
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_031841_208292_BC22F49A 
X-CRM114-Status: GOOD (  15.23  )
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

VGhlIGJlbmVmaXQgb2YgcGxhdGZvcm1fZHJpdmVyX3Byb2JlKCkgaGVyZSBpcyBvbmx5IHRoYXQg
dGhlIHByb2JlCmZ1bmN0aW9uIGNhbiBiZSBkaXNjYXJkZWQgYWZ0ZXIgdGhlIGRyaXZlciBpcyBs
b2FkZWQuIEZvciBhbiBBUkNIPWFybQphbGxtb2Rjb25maWcgdGhhdCdzIDk1MiBieXRlcywgZm9y
IGFuIGFsbG5vY29uZmlnICsgSVJfTUVTT05fVFg9eSBpdCdzCm9ubHkgNDUyIGJ5dGVzLiBUaGUg
ZG93bnNpZGUgaXMgdGhhdCB0aGUgZHJpdmVyIGlzbid0IGR5bmFtaWNhbGx5CmJpbmRhYmxlIGFu
ZCB1bmJpbmRhYmxlLgoKVGhlcmUgYXJlIGNvbnNpZGVyYXRpb25zIHRvIGRyb3AgcGxhdGZvcm1f
ZHJpdmVyX3Byb2JlKCkgYXMgYSBjb25jZXB0CnRoYXQgaXNuJ3QgcmVsZXZhbnQgYW55IG1vcmUg
dG9kYXkuIEl0IGNvbWVzIHdpdGggYW4gYWRkZWQgY29tcGxleGl0eQp0aGF0IG1ha2VzIG1hbnkg
dXNlcnMgaG9sZCBpdCB3cm9uZy4gKEUuZy4gdGhpcyBkcml2ZXIgZGlkbid0IGJlbmVmaXQKYXMg
bXVjaCBhcyBpdCBjb3VsZCBhcyBvZiB2Ni42LXJjMSBhcyBtZXNvbl9pcnR4X3JlbW92ZSgpIGNv
dWxkIGhhdmUKYmVlbiBtYXJrZWQgd2l0aCBfX2V4aXQuKQoKVGhlIGFkdmFudGFnZXMgYXJlIG5v
dCB0aGF0IHJlbGV2YW50IGFueSBtb3JlIHRvZGF5LCBzbyBjb252ZXJ0IHRoaXMKZHJpdmVyIHRv
IGFuIG9yZGluYXJ5IHBsYXRmb3JtIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUt
S8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9tZWRp
YS9yYy9tZXNvbi1pci10eC5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9yYy9tZXNv
bi1pci10eC5jIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCmluZGV4IGJkODUzNjFk
NTYxZi4uZmRlZDJjMjU2ZjJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3JjL21lc29uLWly
LXR4LmMKKysrIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCkBAIC0zMDUsNyArMzA1
LDcgQEAgc3RhdGljIGludCBtZXNvbl9pcnR4X21vZF9jbG9ja19wcm9iZShzdHJ1Y3QgbWVzb25f
aXJ0eCAqaXIsCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgX19pbml0IG1lc29uX2lydHhf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyBpbnQgbWVzb25faXJ0
eF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZwZGV2LT5kZXY7CiAJc3RydWN0IG1lc29uX2lydHggKmlyOwpAQCAtMzc1LDEzICsz
NzUsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25faXJ0eF9kdF9t
YXRjaFtdID0gewogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWVzb25faXJ0eF9kdF9tYXRjaCk7
CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX2lydHhfcGQgPSB7CisJLnBy
b2JlID0gbWVzb25faXJ0eF9wcm9iZSwKIAkuZHJpdmVyID0gewogCQkubmFtZSA9IERSSVZFUl9O
QU1FLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBtZXNvbl9pcnR4X2R0X21hdGNoLAogCX0sCiB9Owot
Ci1tb2R1bGVfcGxhdGZvcm1fZHJpdmVyX3Byb2JlKG1lc29uX2lydHhfcGQsIG1lc29uX2lydHhf
cHJvYmUpOworbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihtZXNvbl9pcnR4X3BkKTsKIAogTU9EVUxF
X0RFU0NSSVBUSU9OKCJNZXNvbiBJUiBUWCBkcml2ZXIiKTsKIE1PRFVMRV9BVVRIT1IoIlZpa3Rv
ciBQcnV0eWFub3YgPHZpa3Rvci5wcnV0eWFub3ZAcGh5c3RlY2guZWR1PiIpOwotLSAKMi40Mi4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
