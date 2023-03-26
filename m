Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A417C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Mar 2023 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpRm193WzDCPXM8gN/WH8G1KA1PXavuqNBAWQoQ5kS8=; b=I1HYyRxW0lMZHT
	zDNlt4Jt1OjBn2bX+Bb7eLvlB71IQrNKSlrQ07sVrB1AtZLa09B0qz5HAnFxzgQF43dc1sfolDbX9
	X3dwFr27Qp00J3Zq17C7Ey30rKGNDkAaU5a6xLkorCZxv6qJZrnwv+EeQ0G98wQp7j/d+K8yzURnH
	3GizXsqX/imlYAgZ0scCQQFzanVZ3XQP1K+af+sLM2n7+mv5NvlLJEvmnt0T4A3CmsT6jfCnhh/7Q
	uaVObvwinMvrU9dxGKmJp2QHuUEWSsx0fNb1x0boz9Y6p9hENWgpuJbVe688VHz0e4eUDsIX+dUOY
	ikx+WUM4JfjH1f9SEJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSYW-008jWP-0I;
	Sun, 26 Mar 2023 15:45:16 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQG-008YMZ-30
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Mar 2023 14:32:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ4-0007kr-D7; Sun, 26 Mar 2023 16:32:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ3-006rYy-LC; Sun, 26 Mar 2023 16:32:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ2-0088U2-Ca; Sun, 26 Mar 2023 16:32:26 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 004/117] media: ao-cec-g12a: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:30:31 +0200
Message-Id: <20230326143224.572654-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=v1wYGsh94W2lZgFeQJwM78nPF+W6bmgfpxjhbc5mNVE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFZ71dphtajewDN9c9hG2KxI9Sc8tzx2SkZbo HDC3rcHxbKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWewAKCRCPgPtYfRL+ Tr6rCACJ5dd9wV3bKSu9kvblrZbNIhyIOzeYRxGMF/5SPdamElcP0qqsv960558Vb6Nz1qeTP3t EhZAqGmghQIP7sia/5v9oWXOQyCtaRoHecq7X+TdL2E1BmiGmGGAh4EWX4PS2etoZ0Cp6Llblr6 yucTSe3Anc9LELmrN5Kq1TCU8/Sxv3L0dGvLR2k+yppvduOlWsD3gZAVlwmRsbVDy7/+mqTu323 GEZb18L83DSZh3DWo8felBcyQVCd+jo/agxDgy7Q+nsBzOzoRjvzMgh6JUI1c8wWCPXvQhNDcwX 92epQ4KNdNKMDy/UhyqnQyHbQtSQgdIb6hS63u8u6hH03pPC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_073241_031898_DA04ABB4 
X-CRM114-Status: GOOD (  15.36  )
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
dmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vbWVzb24vYW8tY2VjLWcxMmEuYyB8IDYgKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL21lc29uL2FvLWNlYy1nMTJhLmMgYi9kcml2
ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9tZXNvbi9hby1jZWMtZzEyYS5jCmluZGV4IDY4ZmU2ZDZh
ODE3OC4uNTEyOTRiOWI2Y2Q1IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9y
bS9tZXNvbi9hby1jZWMtZzEyYS5jCisrKyBiL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL21l
c29uL2FvLWNlYy1nMTJhLmMKQEAgLTc0NCw3ICs3NDQsNyBAQCBzdGF0aWMgaW50IG1lc29uX2Fv
X2NlY19nMTJhX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJl
dDsKIH0KIAotc3RhdGljIGludCBtZXNvbl9hb19jZWNfZzEyYV9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIG1lc29uX2FvX2NlY19nMTJhX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBtZXNvbl9hb19jZWNfZzEy
YV9kZXZpY2UgKmFvX2NlYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCkBAIC03NTMs
OCArNzUzLDYgQEAgc3RhdGljIGludCBtZXNvbl9hb19jZWNfZzEyYV9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAljZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5yZWdpc3Rlcihh
b19jZWMtPm5vdGlmeSwgYW9fY2VjLT5hZGFwKTsKIAogCWNlY191bnJlZ2lzdGVyX2FkYXB0ZXIo
YW9fY2VjLT5hZGFwKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG1l
c29uX2FvX2NlY19nMTJhX2RhdGEgYW9fY2VjX2cxMmFfZGF0YSA9IHsKQEAgLTc4MCw3ICs3Nzgs
NyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtZXNvbl9hb19jZWNfZzEyYV9vZl9tYXRjaCk7
CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX2FvX2NlY19nMTJhX2RyaXZl
ciA9IHsKIAkucHJvYmUgICA9IG1lc29uX2FvX2NlY19nMTJhX3Byb2JlLAotCS5yZW1vdmUgID0g
bWVzb25fYW9fY2VjX2cxMmFfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gbWVzb25fYW9fY2VjX2cx
MmFfcmVtb3ZlLAogCS5kcml2ZXIgID0gewogCQkubmFtZSA9ICJtZXNvbi1hby1jZWMtZzEyYSIs
CiAJCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihtZXNvbl9hb19jZWNfZzEyYV9vZl9t
YXRjaCksCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
