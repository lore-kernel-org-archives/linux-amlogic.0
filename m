Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F6AC77B7F
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 May 2023 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVZwyxLsMv59uKlU86962von+tZNWhn8aG+tltrsmjo=; b=rX8m99ngbrTkur
	nsAcXQDdWlhVHPl5XWJEXf25l2+gUieLBRos42+SmVA7OO6VMPOD/0/hynkqbNGPqAjwqWEn28RBa
	PCKc5HsBiGVJ61+ulSuvGHLyaXi8gy768irEP2+0hn9W3j2oL+W5YSbCoHiRtMiI7oGfyomx0bw6V
	IpmHncOvAhlKqgvbkcwKdc/V7liaUh3TVsbtkM9cbUwRRZXl2bJT8AJtT2GJ6a3wMb0lB2ohe6xeZ
	Oj12NGAzbH8mSusxPgA5Kvy4w47CeM9Uv35tAboS+pryMj6CusDhPdO1+NfW1VuJywOsHlqzBsxUf
	9YROr/VudQEJpf0lWVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7rl-001OFW-1i;
	Mon, 08 May 2023 20:53:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7rO-001Nse-0z
	for linux-amlogic@lists.infradead.org;
	Mon, 08 May 2023 20:53:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rG-0003WK-32; Mon, 08 May 2023 22:53:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rE-0024rq-QS; Mon, 08 May 2023 22:53:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rD-002YX4-TW; Mon, 08 May 2023 22:53:19 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Wolfram Sang <wsa@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 36/89] i2c: meson: Convert to platform remove callback returning void
Date: Mon,  8 May 2023 22:52:13 +0200
Message-Id: <20230508205306.1474415-37-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8zGheaYogX/YE5kaz1sKpvMxHgBauI7XYhda0HCqFZ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDOmSwrvvS9XHHVxwppvK8tcbjWr6P6X2z/8 wxptK/usnmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgzgAKCRCPgPtYfRL+ ThpkB/41TZvGeJoA1z1M1+jaZLJi+W/ZehwAidLZQCQ1t7CnDTk0QfY/mlAM6A1ZnLpM4ck/c9Y mu72dpOjCCea0XgZ4Dk0uoOj6rLnkrm3Y6tBLohKF9fipcyPtsWnTglGqsJTrRnNnBaQegIWNJs 9BB2rn78T8POSQHwt01tHbvxM6bE881oEqylJG6hiPZFyR44sSRY2u68EzCqt4N3vJ1LKjQCdUS yKQg940f2l8Kc13ENVBE2l9yECnCLRKO32LN3PMCAkRCano3Wut1lAupo7K9dopA9XDTHdfisrA eQHAkoqa+c1FiVnY9pJc8QINRm/hWo8/POVr7IS3qpL4Ew/A
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_135330_367823_7D6A1D8E 
X-CRM114-Status: GOOD (  15.83  )
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1tZXNvbi5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1tZXNvbi5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tZXNvbi5jCmluZGV4
IDg4OWVmZjA2Yjc4Zi4uMTYwMjZjODk1YmI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLW1lc29uLmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tZXNvbi5jCkBAIC01
MzUsMTQgKzUzNSwxMiBAQCBzdGF0aWMgaW50IG1lc29uX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IG1lc29uX2kyY19y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIG1lc29uX2ky
Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbWVzb25f
aTJjICppMmMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAogCWkyY19kZWxfYWRhcHRl
cigmaTJjLT5hZGFwKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoaTJjLT5jbGspOwotCi0JcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25faTJjX2RhdGEgaTJjX21lc29u
Nl9kYXRhID0gewpAQCAtNTY4LDcgKzU2Niw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1l
c29uX2kyY19tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX2ky
Y19kcml2ZXIgPSB7CiAJLnByb2JlICAgPSBtZXNvbl9pMmNfcHJvYmUsCi0JLnJlbW92ZSAgPSBt
ZXNvbl9pMmNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gbWVzb25faTJjX3JlbW92ZSwKIAkuZHJp
dmVyICA9IHsKIAkJLm5hbWUgID0gIm1lc29uLWkyYyIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IG1l
c29uX2kyY19tYXRjaCwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
