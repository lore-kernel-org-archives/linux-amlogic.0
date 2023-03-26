Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1AAC74A5B
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Mar 2023 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwaGHGIq7l5EmZyna4xsQrImVcP5dmlSDR7ilAQC51w=; b=cRh9/xXqEH7rQe
	xZ5s2et0gUvJqoErrEJ6HPIySEFpbbQRk7E0S844dGs1XAiIsA9S2YW/eFwpYU8gW5wGbWzZZTKVQ
	uq443eTIAotqeYS3FIst3p49I8ovj3YQGt/xTMzZp35BhkEEuCzl1q+Eo0IpLiRU4he8JE9P+YX5/
	uoDA6czWrYbrHUMtn+fUHDU2o/h/CMlObzhxkP09GSz0qxKkXow0gpgTDiwm3ublxK5kYy3buvQTv
	/de5NjQy5OVJ9hU34e7YWaUCf88ad5kLxAiMmcrl77sM9MBcOyJfoTxtOlBiIDsT4P2cA3Kr3Fl6g
	/MmnR82Qiir9sKYYTweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSYV-008jWE-2O;
	Sun, 26 Mar 2023 15:45:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQG-008YNM-2z
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Mar 2023 14:32:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ6-0007pl-GU; Sun, 26 Mar 2023 16:32:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ5-006rZp-KM; Sun, 26 Mar 2023 16:32:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ4-0088Ug-I6; Sun, 26 Mar 2023 16:32:28 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 014/117] media: ge2d: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:30:41 +0200
Message-Id: <20230326143224.572654-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1Y2LMBpcPDvt234Wp0dDVBnpVYLd4OVe9vUMJb/0CJo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaPHpPZLurdzamlVy431QhD+mjXxTj3yEi11 b3JX4DQ1+eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWjwAKCRCPgPtYfRL+ TokHB/oCVX586LRzYvkBN8oWwTVDT73e7QvszRskadSAbTyrdfG0dcliNNP2ISe6ZClTGMsX//c ojHnF2SfwNbxw1J/KhNver2BUCsy1bQ0sMHPsVpJ1HHhQ7ZxOAT3MYwydcrytIyk+UHZ0K5wcWU jLAfkcBDkCvQfzI5fcZPFEsnUpHmslqTLrKCpVtu0wJ/kgwOSL4yHDt95bFIICKuWj5W6hjEYjn 1ibxLueJ8kwI6/hCJH71RofwjUL+JS/dqvhAYgPWid6NjljemM4La2jMWgNLxSKW3q7JsmT/e6i YUNsIz2i0t8LnFBj9d/gdt31vCQwmE37Kew1ZVkpPGb7cbPq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_073241_059275_167F06EE 
X-CRM114-Status: GOOD (  15.34  )
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
dmVycy9tZWRpYS9wbGF0Zm9ybS9hbWxvZ2ljL21lc29uLWdlMmQvZ2UyZC5jIHwgNiArKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbWxvZ2ljL21lc29uLWdlMmQvZ2UyZC5jIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbWxvZ2ljL21lc29uLWdlMmQvZ2UyZC5jCmluZGV4IDE0
MmQ0MjFhOGQ3Ni4uMDk0MDk5MDhiYTVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL2FtbG9naWMvbWVzb24tZ2UyZC9nZTJkLmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9hbWxvZ2ljL21lc29uLWdlMmQvZ2UyZC5jCkBAIC0xMDI0LDcgKzEwMjQsNyBAQCBzdGF0aWMg
aW50IGdlMmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0
OwogfQogCi1zdGF0aWMgaW50IGdlMmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCitzdGF0aWMgdm9pZCBnZTJkX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCBtZXNvbl9nZTJkICpnZTJkID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRl
dik7CiAKQEAgLTEwMzIsOCArMTAzMiw2IEBAIHN0YXRpYyBpbnQgZ2UyZF9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl2NGwyX20ybV9yZWxlYXNlKGdlMmQtPm0ybV9kZXYp
OwogCXY0bDJfZGV2aWNlX3VucmVnaXN0ZXIoJmdlMmQtPnY0bDJfZGV2KTsKIAljbGtfZGlzYWJs
ZV91bnByZXBhcmUoZ2UyZC0+Y2xrKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBtZXNvbl9nZTJkX21hdGNoW10gPSB7CkBAIC0xMDQ3LDcgKzEw
NDUsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtZXNvbl9nZTJkX21hdGNoKTsKIAogc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZ2UyZF9kcnYgPSB7CiAJLnByb2JlID0gZ2UyZF9w
cm9iZSwKLQkucmVtb3ZlID0gZ2UyZF9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBnZTJkX3JlbW92
ZSwKIAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJtZXNvbi1nZTJkIiwKIAkJLm9mX21hdGNoX3Rh
YmxlID0gbWVzb25fZ2UyZF9tYXRjaCwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
