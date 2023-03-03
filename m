Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F863C7EE2F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1M7y4TX2MQ7CjEN06FcSlhpQllz/BIS1oXe5d+tdyw=; b=sX/Se0GHxxSL8u
	1QXbstCECxxttjYOt0osV33BJw+g0NRfXAWqQwsxeW1fmDb6ea2FWc4pz0nWZhhGshdJlEKfMg7w/
	imPCLs/VMro4ieljNZwoTUvKYOox06i5eg4w6AgZ8uQrVpEE5PxJ42RumnbTPki0zlpIcgrtkegte
	GCb9y7EECTFchiRnrxtQlzbCCTAC+tT/0u5JGpmYEtTPlzHExuiyIuQ/J5yC40Bpxt1bu/fKBAO8z
	P63Fuf4WxTnCibTJ20HhWYZFt7Ucr1AvvQki3OMuiwN/2orTJBv8wuE+DASj5C3geOrCLeuBaLu+y
	HBUi/vD+6uxiINlb9vMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY97C-006tq0-0F; Fri, 03 Mar 2023 17:22:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY95i-006t5y-EI
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 17:21:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95X-0006jK-SB; Fri, 03 Mar 2023 18:20:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95W-001blA-Ey; Fri, 03 Mar 2023 18:20:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95V-001tk1-Nq; Fri, 03 Mar 2023 18:20:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 34/87] spi: meson-spicc: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:19:48 +0100
Message-Id: <20230303172041.2103336-35-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wIKxT+p09a0fMoGZJNJn4gwEKy4eROv6P/ZQUF4MM+k=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiuOf9Ck8KGreXQk8ppcZGL96mgVOkKETYFH2 8xtL7oh4z6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIrjgAKCRDB/BR4rcrs CWQSB/9bLoPdSsOw65mZJnhNRlSUBlLizDd9TirYEdQHZfdFcOVvkknt9iZgPuk/FYZjWFuI6ms buMjzYfy0p+hYrUr51QImPSpCKWC6PYboFaZ/x4TVWAVKNrd3S/rxkOiZb22E7gjEn3uMXnopPu M8a56KZABV97BXO2hjYLtE1DHJytSPEqK5lRN3coI5A848+uSZBmw/0NkYk9ZjP+orcm66ArLW9 RRNN/vU6rH7z+ek080wVoJkLBln5u1eFo6sH4qUAsbdBljEuT4cMU63VLi35k4a3bYPe2aXacNp 2/lSrSXiuJ6m9PB5n4L4wkobMS4nAlJt/0UIz5czGmGXXzS+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_092110_506932_E3CC2F8C 
X-CRM114-Status: GOOD (  15.59  )
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
dmVycy9zcGkvc3BpLW1lc29uLXNwaWNjLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9z
cGktbWVzb24tc3BpY2MuYyBiL2RyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGljYy5jCmluZGV4IGQ0
N2YyNjIzYTYwZi4uYjlmODEyODM3Y2Q2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktbWVz
b24tc3BpY2MuYworKysgYi9kcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYwpAQCAtOTEwLDcg
KzkxMCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fc3BpY2NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IG1lc29uX3NwaWNjX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgbWVzb25fc3Bp
Y2NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IG1lc29u
X3NwaWNjX2RldmljZSAqc3BpY2MgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIApAQCAt
OTIxLDggKzkyMSw2IEBAIHN0YXRpYyBpbnQgbWVzb25fc3BpY2NfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNwaWNjLT5wY2xrKTsK
IAogCXNwaV9tYXN0ZXJfcHV0KHNwaWNjLT5tYXN0ZXIpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fc3BpY2NfZGF0YSBtZXNvbl9zcGljY19neF9kYXRhID0g
ewpAQCAtOTY3LDcgKzk2NSw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1lc29uX3NwaWNj
X29mX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWVzb25fc3BpY2Nf
ZHJpdmVyID0gewogCS5wcm9iZSAgID0gbWVzb25fc3BpY2NfcHJvYmUsCi0JLnJlbW92ZSAgPSBt
ZXNvbl9zcGljY19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBtZXNvbl9zcGljY19yZW1vdmUsCiAJ
LmRyaXZlciAgPSB7CiAJCS5uYW1lID0gIm1lc29uLXNwaWNjIiwKIAkJLm9mX21hdGNoX3RhYmxl
ID0gb2ZfbWF0Y2hfcHRyKG1lc29uX3NwaWNjX29mX21hdGNoKSwKLS0gCjIuMzkuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
