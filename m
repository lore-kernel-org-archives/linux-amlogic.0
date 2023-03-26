Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5656EC74A5B
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Mar 2023 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QX5Vjdk3yGiUUuWzasg9GppvrGgN/TZeI6SW/CEYhM=; b=OCSqts7Vu7cs4I
	haDkKC5fnbhTjUnBXxwjUVDG0eXIZYjHM4dAgRP6weV8dcMC9AsjpZFluQXIVBuhjx+nh5ZmoPT2D
	lL560OyOWb3+7r6WFHWGav70O4h/fkG1dSv2Y+29OkiLdzjSSIGujKRrA3/FDWGOg8RSqwvGb7ANX
	Xb7D7pXWXX59MvjnSfDGEy1LfY4BSP+2N8woWytUOgkgc+DDtcuCwRoGvifteN5M6UXbRqotkT+q3
	x1oclEu4+h+BFGIEVbvXgqgGts3g0XzWnkZ4IBkfahLt4Pm+EyYQ9AegwL0qx5oqTAcvghOfd5WHd
	3lFvfUOBtVr0W1Hv9zUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSYu-008jfe-0U;
	Sun, 26 Mar 2023 15:45:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSYt-008jfA-1P
	for linux-amlogic@bombadil.infradead.org;
	Sun, 26 Mar 2023 15:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ITfXThuq/s3pVZqMEcAgIrGwSVyjj5H3X8AD3TfSr1E=; b=HJ3TJtMsfsk7r9bbVU4wGp7pbv
	cF9Q0J7grBxWHxKA0Gqssj4Sfl7i0vpU/6vf1bnchN7AvXK0A0Un4W1fphQXUkCaCVUunwwC4enps
	laMTMTJuttY3l0h1kAWHMLHc5zmXjNewSOLfJw4fPgksrHxA0+YHF8arclI9mwtwbtZx8cTffQFLk
	Xe05B5bBMPUFAE4bNgwvFvZaf355eu+6SctLk2sGecUn9mnHQINRJE+YDFwi+lBnpTeRBxf1H3ILV
	tNJnO8HQ7SQD+DKm5odQVYtc2pkSF/8skINOLUT9fXuVLccX3hkPXKQHbd0XbkkKU7Wg7PErIKQTU
	qfgLjPQw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQu-005qll-0f
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Mar 2023 14:33:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQS-0000UE-1O; Sun, 26 Mar 2023 16:32:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQQ-006rhN-4K; Sun, 26 Mar 2023 16:32:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQO-0088ai-Qv; Sun, 26 Mar 2023 16:32:48 +0200
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
Subject: [PATCH 107/117] media: meson-ir: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:32:14 +0200
Message-Id: <20230326143224.572654-110-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wYp5LkcV04MNjqVKDISGMwVDxC08wU2j1G438UbXmc8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFc8B6ECdtaukjrMUlW1e4Am7PV23oSJwTSf7 OW/cQKXajuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXPAAKCRCPgPtYfRL+ TjD8B/9ityswRX4rXG8YFgpVAK+DucWXEhqR7mgWOi4xafFoXQHOz1DViHXR2fqT4og3dIxxdu7 PEGwuvFcnFXLKqLrUZJjAvw2FbwFxZoIVGKATTAljND2DFkHNewqzg2oNwoPTy6lsnrMKuH2lr8 yqG5fnuSuZzCOzfGjsDx0QwQjyMb9Fo6f6KXCU0Ubb7agkNLhofwlos+0WEIjKBRSQCX17aDY+j 3fozbtMGts5Cmg2cJD8HzYzWli2I1Qw0oZFjjSXcVGKQ5zIj6FMQ/ig+Ymu31dH2t5rJvNKD3PW Y5Xufu+bEPutpRRx4q9VpqDh4mAP2h/E1t5hTHHNdUHAw7Vn
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_153320_486857_ACD98115 
X-CRM114-Status: GOOD (  14.82  )
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
dmVycy9tZWRpYS9yYy9tZXNvbi1pci5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9y
Yy9tZXNvbi1pci5jIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci5jCmluZGV4IDRiNzY5MTEx
Zjc4ZS4uNDlhYTMwOWQxYThjIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3JjL21lc29uLWly
LmMKKysrIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci5jCkBAIC0xNzcsNyArMTc3LDcgQEAg
c3RhdGljIGludCBtZXNvbl9pcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IG1lc29uX2lyX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgbWVzb25faXJfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IG1lc29uX2lyICppciA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOwogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CkBAIC0xODYsOCArMTg2LDYg
QEAgc3RhdGljIGludCBtZXNvbl9pcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAlzcGluX2xvY2tfaXJxc2F2ZSgmaXItPmxvY2ssIGZsYWdzKTsKIAltZXNvbl9pcl9zZXRf
bWFzayhpciwgSVJfREVDX1JFRzEsIFJFRzFfRU5BQkxFLCAwKTsKIAlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZpci0+bG9jaywgZmxhZ3MpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyB2b2lk
IG1lc29uX2lyX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCkBAIC0yMjYs
NyArMjI0LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWVzb25faXJfbWF0Y2gpOwogCiBz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtZXNvbl9pcl9kcml2ZXIgPSB7CiAJLnByb2Jl
CQk9IG1lc29uX2lyX3Byb2JlLAotCS5yZW1vdmUJCT0gbWVzb25faXJfcmVtb3ZlLAorCS5yZW1v
dmVfbmV3CT0gbWVzb25faXJfcmVtb3ZlLAogCS5zaHV0ZG93bgk9IG1lc29uX2lyX3NodXRkb3du
LAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCQk9IERSSVZFUl9OQU1FLAotLSAKMi4zOS4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
