Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A95C74A5B
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Mar 2023 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/4KNDYV3mLAygO+WpkOHMVC+pcYopP7cA9GAuJsgZg=; b=NqAi4hrmr34sJO
	He+yOZGc+6QdFBDZTbbtqz3tg8S8h3gAxcepj4SI33vrZ9Tdfkccbt3ggCBDK2TqFSyC6Kdu7Vg0Y
	019UqQTs4uQqJy4EQzSdSyfgoEnJEGTjtMiGRgBVeqB7rQi0imHxExHw+g5h+xlOMkdYLd101WDXd
	swKP4Vuy76y8kuAXTux/ZuzAuBbznD9eIkdid08GvTnWiV7AJlcT/T3jvms5AqKb7ZOsfxgywuvp+
	gB5knVjjfWtUwek9XNCC6vfzmNXZadOhOm1dOogmhhh97CUFU9HaCZNARS2YOpD6UmB50Ul8dspJx
	pkNukaj6aLgyWCaEPXIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRSo-008afQ-0u;
	Sun, 26 Mar 2023 14:35:18 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQp-008Z5q-2I
	for linux-amlogic@bombadil.infradead.org;
	Sun, 26 Mar 2023 14:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=amFjOLmwbw/Tb94B++cLzEnyhl0edo3L1BWO2noav/A=; b=MqY8ZQ1k71LsyNzz6SDy164vuY
	2SQMUW0TwWp2UMMUtOWQkR0tlnvwk+4F5VZrl4uC4V16oP101B6scpIQsF54vP6Akgv3gRCH1L2Yy
	ElsKgWynCmKegsvX994OGL3zlhcPRPtH564b2yIAnvPpzlN8+deR1+39YyE58ZhpG0rwp3E+4uEeo
	+Kxs4p17JXufz4vMbpGsx84XZIHiOg2yNUAkal6kvzQ+eNFkAjzL53GvUkkv8yV4oMcvGW7/C3Kl/
	mSM22SYcNuoOvGucF7Z1OP79TFBuXv4GbtNi6IsVJIr131uxbmShPrvu0xHrYqehPlq1qN6vTgHIS
	XX1/xvVg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pgRQl-006aQr-Q1
	for linux-amlogic@lists.infradead.org; Sun, 26 Mar 2023 14:33:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQR-0000RA-8t; Sun, 26 Mar 2023 16:32:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQP-006rh7-CS; Sun, 26 Mar 2023 16:32:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQO-0088ae-JD; Sun, 26 Mar 2023 16:32:48 +0200
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
Subject: [PATCH 106/117] media: meson-ir-tx: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:32:13 +0200
Message-Id: <20230326143224.572654-109-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kHPP5cAhCKQcnI3fcuUH21X+adxb7h92mrf8biP7X1I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFc2doI8Irf3L+APeL6fQdlbpWqvKqvbIdtL/ 9AfRTr1y3OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXNgAKCRCPgPtYfRL+ TiQPB/43rKAeYEk5tngWQ1afUwcGeaTDq/Ex5Lt4HVQ67loUPt2JA9ipfAI7uBnjBX/qYBEDItC 6TV00fMu6QEnNHjgyvSfDyiFqfQ6ccXaPLZEl6Z7E6dddPgGZevqg4rZ7iNmX4soGou0pfDaYy6 8A+ipF0AiIthobt2ZuQv3FmYh7Oo5e8f1AzZXUd5wdCfTCgk3VRarWs4LcTx4csFSMxPGOxWYkO wrcMO1sXIe/Z1+udrBVRtvdQqBHYccSxi+RdXAp0HDWuU+FesUaUGHNoXEFWKcbbmIS4Bez7Ll0 cYhPJ/8L6A61O91JsfUuakFBXJwy8/Tl/zJzDgff0M1N2IiZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_153311_875675_659CA8DE 
X-CRM114-Status: GOOD (  12.76  )
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
dmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS9yYy9tZXNvbi1pci10eC5jIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCmluZGV4
IGFiZGI2MmIxNmU5OC4uNjM1NWI3OTg5M2ZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Jj
L21lc29uLWlyLXR4LmMKKysrIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCkBAIC0z
NzIsMTMgKzM3MiwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBtZXNvbl9pcnR4X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgbWVz
b25faXJ0eF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lk
IG1lc29uX2lydHhfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3Ry
dWN0IHJjX2RldiAqcmMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAogCXJjX3VucmVn
aXN0ZXJfZGV2aWNlKHJjKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBtZXNvbl9pcnR4X2R0X21hdGNoW10gPSB7CkBAIC0zOTAsNyArMzg4LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25faXJ0eF9kdF9tYXRjaFtd
ID0gewogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWVzb25faXJ0eF9kdF9tYXRjaCk7CiAKIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX2lydHhfcGQgPSB7Ci0JLnJlbW92ZSA9
IG1lc29uX2lydHhfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gbWVzb25faXJ0eF9yZW1vdmUsCiAJ
LmRyaXZlciA9IHsKIAkJLm5hbWUgPSBEUklWRVJfTkFNRSwKIAkJLm9mX21hdGNoX3RhYmxlID0g
bWVzb25faXJ0eF9kdF9tYXRjaCwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
