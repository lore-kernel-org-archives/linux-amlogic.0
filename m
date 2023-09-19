Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A963CE79AA
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Sep 2023 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NccXorSUqUfMY325i0IxN+8nO2m+npbSgKtCuh/xyok=; b=svM0K4eWV97QIj
	ZU9hHmDgxvj+StMB5PH1HfYNm/erzdQ75crz3BnlQmkJjR4z5wtGuKlSb5IpMtE+6kaOyypOli89i
	FmrSrQfOHY1VqnUcBPiBgVepDZmN/e0V8erHIY4aP2DT3KaD4FNZIHW/c15HDsyxYLApcvfEc8Whg
	lcEVTw3F7xkI7Djl2pQkgyaJmyroguWkNlpam/rUysfNBHHyCgWuuQR0/L6u5Cd2wIF6ueT7uAYoV
	9ElK1SxG28Tl1+yWjL2wZpBT+pGkdv/tMCc/QKw/2J4X8uqAbqpnRvX0UZJirqlFzkqZuvomQjjay
	DdyayCsE0qYV73F2D+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiere-000zDA-1n;
	Tue, 19 Sep 2023 17:50:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qierS-000z0a-2Z
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Sep 2023 17:50:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qier9-0006Rs-FF; Tue, 19 Sep 2023 19:49:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qier8-007VWL-9S; Tue, 19 Sep 2023 19:49:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qier7-0034XP-W7; Tue, 19 Sep 2023 19:49:50 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	George Stark <gnstark@sberdevices.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 14/49] iio: adc: meson_saradc: Convert to platform remove callback returning void
Date: Tue, 19 Sep 2023 19:48:56 +0200
Message-Id: <20230919174931.1417681-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ZkHR8CcCKeoe8xpI5iFY6J8XzVrFo+5T9mEj+BOCCRc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCd7/5JGdT0Pmt5nBcw4BnW+XEh9vgD4K29Z5b xfXIBzNO1eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQne/wAKCRCPgPtYfRL+ TtyyB/9KGPYvM1mpZrWC77cLxlyXUUW16f9paXIMqOTsdqN39ku0SKFMXl5GdBt6GF637YrNRh+ 4/ZziIgwi7gR+93R8mb4L54W1xfR1Y5mB2mvxa/pNKf2pgDBFq6GCdvmqgry+4Z9N9AoHqRSt9p bZ5RJXyZ2jjOTmJqm1Hqicgj+b4RqyzoYth6L4+No+gL8J1k1W/IoxDJQKB0qbLSD26EHGzzSJ8 SfVRQsvSeWNv1tyWvb7jdleAKqoiQBGYadXYx7rni1LtfAJ07wJIfeHeHYfvVsqfP4pYDs0b5dI j6zrkn00M1RW/dA07rttTGsnJYcFlVOFjhuB5bMUvOGC3BBv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_105010_835931_9DBC36C7 
X-CRM114-Status: GOOD (  15.18  )
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
ZV9uZXcoKSB3aWxsIGJlIHJlbmFtZWQgdG8gLnJlbW92ZSgpLgoKVHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpjYWxs
YmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9paW8vYWRjL21lc29uX3NhcmFkYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRj
L21lc29uX3NhcmFkYy5jIGIvZHJpdmVycy9paW8vYWRjL21lc29uX3NhcmFkYy5jCmluZGV4IDMy
MGUzZTdlM2Q0ZC4uYTQwOTg2ZmIyODVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvbWVz
b25fc2FyYWRjLmMKKysrIGIvZHJpdmVycy9paW8vYWRjL21lc29uX3NhcmFkYy5jCkBAIC0xNDM3
LDE1ICsxNDM3LDEzIEBAIHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgbWVzb25f
c2FyX2FkY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lk
IG1lc29uX3Nhcl9hZGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJ
c3RydWN0IGlpb19kZXYgKmluZGlvX2RldiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwog
CiAJaWlvX2RldmljZV91bnJlZ2lzdGVyKGluZGlvX2Rldik7CiAKIAltZXNvbl9zYXJfYWRjX2h3
X2Rpc2FibGUoaW5kaW9fZGV2KTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IG1lc29u
X3Nhcl9hZGNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC0xNDgwLDcgKzE0NzgsNyBA
QCBzdGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKG1lc29uX3Nhcl9hZGNfcG1fb3BzLAog
CiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtZXNvbl9zYXJfYWRjX2RyaXZlciA9IHsK
IAkucHJvYmUJCT0gbWVzb25fc2FyX2FkY19wcm9iZSwKLQkucmVtb3ZlCQk9IG1lc29uX3Nhcl9h
ZGNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gbWVzb25fc2FyX2FkY19yZW1vdmUsCiAJLmRyaXZl
cgkJPSB7CiAJCS5uYW1lCT0gIm1lc29uLXNhcmFkYyIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IG1l
c29uX3Nhcl9hZGNfb2ZfbWF0Y2gsCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
