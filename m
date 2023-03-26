Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC02C74A5B
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Mar 2023 14:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1YWDhM3RTgl/78fszcjO/FZWVkotR7JPY/4oGaTUIA=; b=EwLmZgP5U/8/Rd
	L9FckVVMKBXhDG++qRl3VSH+RM8qn//J95JuiP1aF3nSyVnOuO69MFvjg0eGWvCB+x9nYnyF43Wu5
	y49i7d1NmPhcV7H4RcCizN/Oqa8RQ9nwSIDEyHWF/Gs9yvSKfoRhi5IughJh7rpdQsNnUSsYq5iaG
	6O7acd9Fl/ZE4cL5tGVeTlprZHZCgG8d28n4FsQbxCujKSDVfIEQGtF0Q8FHKRIBqvwDRuhl1m4LX
	mSa1tcZ2fXHrVNSdWeQ1d7lcJ3cZkHhhlP5kT8KNKcMm1eA4q2OAElaSLTU2HfggsJta6KW4oRriA
	JPB6opkvDyR4b49LdnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQV-008Yih-2c;
	Sun, 26 Mar 2023 14:32:55 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQG-008YMY-2z
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Mar 2023 14:32:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ4-0007lN-Qf; Sun, 26 Mar 2023 16:32:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ4-006rZC-4F; Sun, 26 Mar 2023 16:32:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ2-0088U6-JU; Sun, 26 Mar 2023 16:32:26 +0200
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
Subject: [PATCH 005/117] media: ao-cec: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:30:32 +0200
Message-Id: <20230326143224.572654-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=T42yo2zTTmIkn3GXSFDOaa/xozG97/RfNm55diexSxI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsJovD344vJ19Nu3j9tuvcjkPH01uN1b2VZC26H36b 1vXTO9pnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMZMYCDoZOlmdfKxeylh38 lMt5wERbf8WFaq/GQGH5Sn2xpErPvyfjAy4fv/r83K2bHRJqXoX2J8uDo0OuXG7Sd/xkZeCpdjB gxu/88iklj4OcNuZKrPNMVYu4retkYd528P37NVmc+VYMBhHXM1vSlNmetLL28LxJSuruPJR/W6 v3+NUl+u28m1sbjSzCyrZlXImrzk943WZasXL7f9XbiY93nTxbs7F+tmJW7temi6/f+703u1K8J 7Uq7dbFnEeLjtWba5n8nvby0uvGD40CQd98izLrbk34+s80S9NI+5uoU5SA7++m0N1PtaV+W6om TpK+5CNlbNO25ALr8buOYl/MXnAfmPbnpezztVvazWrMAQ==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_073241_013387_C02ECFE3 
X-CRM114-Status: GOOD (  15.46  )
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
dmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vbWVzb24vYW8tY2VjLmMgfCA2ICsrLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9tZXNvbi9hby1jZWMuYyBiL2RyaXZlcnMvbWVkaWEv
Y2VjL3BsYXRmb3JtL21lc29uL2FvLWNlYy5jCmluZGV4IDZiNDQwZjA2MzVkOS4uZjZmNTFhMzRm
N2JkIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9tZXNvbi9hby1jZWMu
YworKysgYi9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9tZXNvbi9hby1jZWMuYwpAQCAtNjk2
LDcgKzY5Niw3IEBAIHN0YXRpYyBpbnQgbWVzb25fYW9fY2VjX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBtZXNvbl9hb19j
ZWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBtZXNv
bl9hb19jZWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IG1lc29uX2FvX2NlY19kZXZpY2UgKmFvX2NlYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYp
OwogCkBAIC03MDQsOCArNzA0LDYgQEAgc3RhdGljIGludCBtZXNvbl9hb19jZWNfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAljZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5y
ZWdpc3Rlcihhb19jZWMtPm5vdGlmeSwgYW9fY2VjLT5hZGFwKTsKIAljZWNfdW5yZWdpc3Rlcl9h
ZGFwdGVyKGFvX2NlYy0+YWRhcCk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25fYW9fY2VjX29mX21hdGNoW10gPSB7CkBAIC03MTYsNyAr
NzE0LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWVzb25fYW9fY2VjX29mX21hdGNoKTsK
IAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWVzb25fYW9fY2VjX2RyaXZlciA9IHsK
IAkucHJvYmUgICA9IG1lc29uX2FvX2NlY19wcm9iZSwKLQkucmVtb3ZlICA9IG1lc29uX2FvX2Nl
Y19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBtZXNvbl9hb19jZWNfcmVtb3ZlLAogCS5kcml2ZXIg
ID0gewogCQkubmFtZSA9ICJtZXNvbi1hby1jZWMiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9t
YXRjaF9wdHIobWVzb25fYW9fY2VjX29mX21hdGNoKSwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
