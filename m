Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BB3C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 May 2022 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmSjxZVCAdKQzstKhSyzJzu1C4PdVgXeIO+AvoIYCws=; b=0ZU1yfv4TqUa+s
	ZfJl8SV/0BWuTDMkoroUftiOUhR5sIux3qnEtupFPJixYu/RzgHePGiaQrl3g0zTnHC0YcKGUUZR3
	7ZDjU/ajBr5wWGzoTxdbMAQJwq3tofaKfJtkSQ40EdKxXH4HYBvoSDYqu8ex8AJ8cNSMpfUBbnJks
	sqH3C6gAVUjDKB2CRoJL4Qtmq4LZB+Xw3HHtky7HmTNz7LxcpZBj/XJRoxJF/NOze+hx3CUON0IKe
	QQznsMaWyWh/jpBWU/eb6rdQOMYrqerpGjnH7sEdrlmyYEWjM2MMioDY+DAIw2ffwI3CdPrCSvahT
	9obQcIZIjxC/FQeTCHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrxWf-00BAE7-5Y; Fri, 20 May 2022 07:58:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrxWc-00BACJ-59
 for linux-amlogic@lists.infradead.org; Fri, 20 May 2022 07:58:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nrxWI-0006bJ-3L; Fri, 20 May 2022 09:57:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nrxWH-003RP0-VN; Fri, 20 May 2022 09:57:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nrxWF-00Avea-Ti; Fri, 20 May 2022 09:57:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de,
 Michael Turquette <mturquette@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v9 4/4] clk: meson: axg-audio: Don't duplicate
 devm_clk_get_enabled()
Date: Fri, 20 May 2022 09:57:37 +0200
Message-Id: <20220520075737.758761-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; h=from:subject;
 bh=emep3XTkeTU0GpA6wJdvDAVmYPRGFjZLqCqv5c74cSE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih0nqFtRg24pg7iF4i0BIc3b62DZbS0YtPVV+6mw8
 mTbF7qmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYodJ6gAKCRDB/BR4rcrsCYLpB/
 91Ah3ys+uVCA3xVXezxTZAjAHX5LK2RJgoLEEz0GbNNL44wWlYFBRErQO/r3KnOU9lsaRDpstCBZ6E
 E3jpb025VuPXKQR59SOMXhkHRclNY6Vm1xLlT3thqs4yU55BuoLkHm6k23EkzvMc6APn8kXV8pzCai
 hiQEcbLzzWm42ehymmL39l4VW4dRYoz2xNmSiZEcT3JB1SP/ja3SjmHzjWKlb9IR216d2mjiZT0QZp
 WP7m8cla/i9IZ5SqyZg/zIn26pv5cGTb5yaDKiOLQR9ISfVyfZFa8/zhwYczzr+Fa0Rhsks7/ayIvc
 BTqxJa4Q/Ymo7DxBS+1tEUT0qfF+lW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_005818_231684_31F2D21E 
X-CRM114-Status: GOOD (  14.13  )
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

VGhlIGNsayBBUEkganVzdCBnb3QgYSBmdW5jdGlvbiB3aXRoIGEgc2xpZ2h0bHkgZGlmZmVyZW50
IG5hbWUgYW5kCnRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkuIFJlbW92ZSB0aGUgZHVwbGljYXRpb24u
CgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvY2xrL21lc29uL2F4Zy1hdWRpby5jIHwgMzYgKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDMyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2F4
Zy1hdWRpby5jIGIvZHJpdmVycy9jbGsvbWVzb24vYXhnLWF1ZGlvLmMKaW5kZXggYmZlMzZiZDQx
MzM5Li41MDE2NjgyZTQ3YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lc29uL2F4Zy1hdWRp
by5jCisrKyBiL2RyaXZlcnMvY2xrL21lc29uL2F4Zy1hdWRpby5jCkBAIC0xNjU3LDM1ICsxNjU3
LDYgQEAgc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwICpjb25zdCBzbTFfY2xrX3JlZ21hcHNbXSA9
IHsKIAkmc20xX3N5c2Nsa19iX2VuLAogfTsKIAotc3RhdGljIGludCBkZXZtX2Nsa19nZXRfZW5h
YmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgY2hhciAqaWQpCi17Ci0Jc3RydWN0IGNsayAqY2xrOwot
CWludCByZXQ7Ci0KLQljbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCBpZCk7Ci0JaWYgKElTX0VSUihj
bGspKSB7Ci0JCXJldCA9IFBUUl9FUlIoY2xrKTsKLQkJZGV2X2Vycl9wcm9iZShkZXYsIHJldCwg
ImZhaWxlZCB0byBnZXQgJXMiLCBpZCk7Ci0JCXJldHVybiByZXQ7Ci0JfQotCi0JcmV0ID0gY2xr
X3ByZXBhcmVfZW5hYmxlKGNsayk7Ci0JaWYgKHJldCkgewotCQlkZXZfZXJyKGRldiwgImZhaWxl
ZCB0byBlbmFibGUgJXMiLCBpZCk7Ci0JCXJldHVybiByZXQ7Ci0JfQotCi0JcmV0ID0gZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwKLQkJCQkgICAgICAgKHZvaWQoKikodm9pZCAqKSljbGtf
ZGlzYWJsZV91bnByZXBhcmUsCi0JCQkJICAgICAgIGNsayk7Ci0JaWYgKHJldCkgewotCQlkZXZf
ZXJyKGRldiwgImZhaWxlZCB0byBhZGQgcmVzZXQgYWN0aW9uIG9uICVzIiwgaWQpOwotCQlyZXR1
cm4gcmV0OwotCX0KLQotCXJldHVybiAwOwotfQotCiBzdHJ1Y3QgYXhnX2F1ZGlvX3Jlc2V0X2Rh
dGEgewogCXN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiByc3RjOwogCXN0cnVjdCByZWdtYXAg
Km1hcDsKQEAgLTE3ODcsNiArMTc1OCw3IEBAIHN0YXRpYyBpbnQgYXhnX2F1ZGlvX2Nsa2NfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgcmVnbWFwICptYXA7CiAJ
dm9pZCBfX2lvbWVtICpyZWdzOwogCXN0cnVjdCBjbGtfaHcgKmh3OworCXN0cnVjdCBjbGsgKmNs
azsKIAlpbnQgcmV0LCBpOwogCiAJZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYp
OwpAQCAtMTgwNCw5ICsxNzc2LDkgQEAgc3RhdGljIGludCBheGdfYXVkaW9fY2xrY19wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCX0KIAogCS8qIEdldCB0aGUgbWFuZGF0b3J5
IHBlcmlwaGVyYWwgY2xvY2sgKi8KLQlyZXQgPSBkZXZtX2Nsa19nZXRfZW5hYmxlKGRldiwgInBj
bGsiKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCWNsayA9IGRldm1fY2xrX2dldF9lbmFi
bGVkKGRldiwgInBjbGsiKTsKKwlpZiAoSVNfRVJSKGNsaykpCisJCXJldHVybiBQVFJfRVJSKGNs
ayk7CiAKIAlyZXQgPSBkZXZpY2VfcmVzZXQoZGV2KTsKIAlpZiAocmV0KSB7Ci0tIAoyLjM1LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
