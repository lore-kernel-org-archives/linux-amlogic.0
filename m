Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282B3C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 May 2023 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bo+NONGenSmixOnH9U/soiX/gngMcvbBilQtFI+GwNA=; b=OwRbHT6zMDSNS3
	m0gkJMK2WOvErHTG/4E1i7mADqUTLzYB2cFUvjz9n+MIgffLJbHJsFhziazTXEL85YBBbkp7TOKao
	SokKf7dYXGvBhPVcNunVtaDI+iqbCjhN1RdJWh+9izwg0zT5RnrVi6/txytZz05GmBHjynPpWFnL2
	+8AgVe2ymriXWLjE8sFcsrYS0vDsenWeet+m6V3jfWM2eNymOb/OAXsRIHc6rdah0GCZCSgd7JTz5
	aB9zPLsxJGYYRYmByOBCXTMaGRdLXBvSssbbwWC6WHXtFcWoOF099IlsX85o25wKSmNZpFogEXdqb
	8ih4/eVU8toHkehE3/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pugj3-0095an-18;
	Thu, 04 May 2023 21:42:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pugj2-0095a3-1a
	for linux-amlogic@bombadil.infradead.org;
	Thu, 04 May 2023 21:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=exIKl4SXzzPcLml9C+Yej286MNPRxh8Pu9GbtwQQrmU=; b=QdXbFow5uVrOwIMMHSXFFdU5oc
	lIFKWX+C2DefXO4OWBGdhrAz3qhMzhtMMaAJvaJ2v8AiF4SwuJQL/2uEE86NWLOKNjwX7WbQjIp+6
	vKo0GzKSuJTcv8ue+AdRLZRAezv3p6YuvHunhQ6xS9ZGNPc25GEHOrpXwwBxy9tgO4LJXvRyA7Wc9
	sJHX46rZw4T9JzDY4n+i/71jc+jXBjl321Oq1/7pcacfrkEoJrvbryao7BgAUOcnHn9yxffZcpdHr
	1iSNxFkN+sF9GTmMV0Hqxm4HQmd8Nargi4CKmlk7AsEMS6KZsAowXPrJAGOyRpqrbDeWCgqXLUJVe
	B+C6+KeA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puetW-001oy0-01
	for linux-amlogic@lists.infradead.org;
	Thu, 04 May 2023 19:45:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1puet3-0007fI-8n; Thu, 04 May 2023 21:45:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puet2-0018FL-IM; Thu, 04 May 2023 21:45:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puet1-001JhV-Vu; Thu, 04 May 2023 21:45:07 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 05/18] remoteproc: meson_mx_ao_arc: Convert to platform remove callback returning void
Date: Thu,  4 May 2023 21:44:40 +0200
Message-Id: <20230504194453.1150368-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lIbUsGc2XtYKyArZjzb1rasuyQpFQ613/CD76txdktc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnC3BTj2gjhnUzSm00m0WxUfVv6vhFkWlrNn CG7h+7WfCCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJwgAKCRCPgPtYfRL+ TsIxCACnRWeKUcB9rtEk+j7OZ2fPTQcYDF0Utpqxrf+7oOC2Z1eOHm9Dr4QDmahOTsH+pxLtujX QW3Fj4VbCXKkGOdxjzQDC0goSUbrSCei3IijiKOS05oHnWi2EqPfbMA6N1/6T/+BNnufAsiIleg W8SwS0T9qzf5dX1wtYS8/hK6bUc3ujQhLCS9MLLJAZJcubWfERslVQftGhz0b8YmL1FkXLkvkIm SIrvFpGfX0Gpxt31SkktpF918UsUhO7xIrVw9qV5z0sjS1bya3/EjZo3CutbE/3vqsZnIuNDsyi 6VDVz6P2FTReHbFZnhwk1I4QTyulR1SXnx1YM5Ccp+d0cZa9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_204538_204466_417DEC63 
X-CRM114-Status: GOOD (  15.07  )
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
dmVycy9yZW1vdGVwcm9jL21lc29uX214X2FvX2FyYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9yZW1vdGVwcm9jL21lc29uX214X2FvX2FyYy5jIGIvZHJpdmVycy9yZW1vdGVwcm9jL21lc29u
X214X2FvX2FyYy5jCmluZGV4IDQ2MmNkZGFiNjUxOC4uZjY3NDRiNTM4MzIzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3JlbW90ZXByb2MvbWVzb25fbXhfYW9fYXJjLmMKKysrIGIvZHJpdmVycy9yZW1v
dGVwcm9jL21lc29uX214X2FvX2FyYy5jCkBAIC0yMjgsMTUgKzIyOCwxMyBAQCBzdGF0aWMgaW50
IG1lc29uX214X2FvX2FyY19ycHJvY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgbWVzb25fbXhfYW9fYXJjX3Jwcm9jX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgbWVzb25fbXhf
YW9fYXJjX3Jwcm9jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0
cnVjdCBycHJvYyAqcnByb2MgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3Qg
bWVzb25fbXhfYW9fYXJjX3Jwcm9jX3ByaXYgKnByaXYgPSBycHJvYy0+cHJpdjsKIAogCXJwcm9j
X2RlbChycHJvYyk7CiAJZ2VuX3Bvb2xfZnJlZShwcml2LT5zcmFtX3Bvb2wsIHByaXYtPnNyYW1f
dmEsIHByaXYtPnNyYW1fc2l6ZSk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25fbXhfYW9fYXJjX3Jwcm9jX21hdGNoW10gPSB7CkBAIC0y
NDgsNyArMjQ2LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWVzb25fbXhfYW9fYXJjX3Jw
cm9jX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWVzb25fbXhfYW9f
YXJjX3Jwcm9jX2RyaXZlciA9IHsKIAkucHJvYmUgPSBtZXNvbl9teF9hb19hcmNfcnByb2NfcHJv
YmUsCi0JLnJlbW92ZSA9IG1lc29uX214X2FvX2FyY19ycHJvY19yZW1vdmUsCisJLnJlbW92ZV9u
ZXcgPSBtZXNvbl9teF9hb19hcmNfcnByb2NfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1l
ID0gIm1lc29uLW14LWFvLWFyYy1ycHJvYyIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IG1lc29uX214
X2FvX2FyY19ycHJvY19tYXRjaCwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
