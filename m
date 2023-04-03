Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82A3C76188
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 15:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MraA9BlBH14lUrUJjO5F6RlqotfTaAylC6iuOgjmc8I=; b=F7sQegaD85VPXI
	/cmicgoxGp/9C2QLaJxMgt3yLwVwQI3zvB55T10dOlFkFuQMLzyzLb0UuR6YAAnyWYyN1Vn+7Uk7M
	TzrcdqNtsij+alB5KWV5UqNRnBdYIYeo9Ep8ZZyLdtsLuMSW0D2CZmXfPKJOJIfCSYc0/3tCvdARr
	qxJQVQTEBlPzXyhWW0b3EJABWCuv7feV9osrhiZjnInN6up7WMaN9lEb//EdYD4BXyNrfN4rtBEcp
	cpCpMGKD0rRZ3AU9t6SyaKEyW1q0bDjwrvFFuRpsNMkIRGpukp0pIQJWe0SVLZNe+zty8vP0L7eRp
	DQM8On+3oRFgQ6AxjBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMIL-00FnuI-2O;
	Mon, 03 Apr 2023 15:40:33 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMII-00Fnpt-2F
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Apr 2023 15:40:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI8-0004cF-Pm; Mon, 03 Apr 2023 17:40:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI7-008ibA-U6; Mon, 03 Apr 2023 17:40:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI7-00AHxC-6k; Mon, 03 Apr 2023 17:40:19 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 12/24] staging: media: meson: vdec: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:40:02 +0200
Message-Id: <20230403154014.2564054-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=P35Ck+M/VCEEhMxrFcldV2WJMFcTdpa/K3Pjr50rJgY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNC+Co7HXuwCgK9dynbHKEeaG/SrHOkFUjJf PSTTykY77WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzQgAKCRCPgPtYfRL+ Tq8iB/9x4510NGqWNWqDe3F7xIdKw4MHr48k3D6ErVInKJ8cbY2e9hxwfh+QDDN2NrfyEORhugN dAVuUglboK+yBgqO2sRgzqPeiCe4YxZ0DSE8qz+ZWFeja9SnkRipTWUYSlvA/j79DeEK6qkp+z6 1U1iy14P7YzLKp53mlAYIzl3dRTWwjzsNGPfjxMBxBmDPkztxADjGiTbtewobyMMP6ciUNY0atm D2kYwZNSDgy5gX00iy1hHAj69rYE9VGYUgikPMjRT3vifLU5IiaHa0CL0d2nb1PZNTCa4hqxXt1 Q7+vQd/NqegyuVe3qIBq99mNdpZje2hyLylux42jeV10bvTj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_084030_753835_17FE89A3 
X-CRM114-Status: GOOD (  15.58  )
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
dmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jIGIvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL21lc29uL3ZkZWMvdmRlYy5jCmluZGV4IDUyZjIyNGQ4ZGVmMS4uNWNhNGIxMjAwODMxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKKysrIGIv
ZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jCkBAIC0xMTA2LDE5ICsxMTA2
LDE3IEBAIHN0YXRpYyBpbnQgdmRlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgdmRlY19yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHZkZWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGFtdmRlY19jb3JlICpjb3JlID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldik7CiAKIAl2aWRlb191bnJlZ2lzdGVyX2RldmljZShjb3JlLT52ZGV2
X2RlYyk7CiAJdjRsMl9kZXZpY2VfdW5yZWdpc3RlcigmY29yZS0+djRsMl9kZXYpOwotCi0JcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX3ZkZWNfZHJp
dmVyID0gewogCS5wcm9iZSA9IHZkZWNfcHJvYmUsCi0JLnJlbW92ZSA9IHZkZWNfcmVtb3ZlLAor
CS5yZW1vdmVfbmV3ID0gdmRlY19yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAibWVz
b24tdmRlYyIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IHZkZWNfZHRfbWF0Y2gsCi0tIAoyLjM5LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
