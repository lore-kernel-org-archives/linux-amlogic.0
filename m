Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755DFC197A0
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Nov 2023 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MX9mdx2MU8DBM0kYVIDusvIzwvargX9LVYgsgo6MpM=; b=uFan3Xj/izHiJT
	La/95h+XIMFTk9KUrQu2mlbXiUcVVj0zmFqj6KhP92wmEA08NgSgZEPG4Q5pwMUBrKRLYCcyiCIWd
	9L8KBLzRWCoLcTKE20hnVJp4Ob4f2IAg9YaFMk87C/Shz5kGc4ePdXdyLLkK/oYR9fhWCNKWKgw1I
	VccyA9njQUf72PKjoVYU3TrArxYdfhPdiNzI1oM0yjIybGP+PePyMl8RrBjQiZih9Rj+4DAQBpFTO
	Zya7oJDgaaiSlGU0XS8xTJfJsElLs44FAjSxxdwb9wzBuvkP9H+Ilt/m41hKEXoafiTVa30xPV/Jz
	yoQfpyblD3fgX8GKcwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aWZ-003EYH-18;
	Thu, 16 Nov 2023 11:27:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aWU-003ETo-0G
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Nov 2023 11:27:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3aWH-00084C-AH; Thu, 16 Nov 2023 12:26:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3aWG-009RE6-J8; Thu, 16 Nov 2023 12:26:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3aWG-002aLv-A1; Thu, 16 Nov 2023 12:26:48 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 1/2] thermal: amlogic: Make amlogic_thermal_disable() return void
Date: Thu, 16 Nov 2023 12:26:35 +0100
Message-ID: <20231116112633.668826-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
References: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zS5bf2K9StbVA3TOdCPCK/qoOEqpcla6Ty+ZtVPLmWY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlVfxrNgTH4AYOVvU000xsT7JO+KmseS6hL84j2 ICo8g/biOuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVX8awAKCRCPgPtYfRL+ Tiz6CACMTqm95KR5Ydn8/rVs3MdqY9osaf9rLaFoZH2F6mps4WDjCz77OFWsNxgSoFX7FuGIwI0 EnOnZGuqaowfkkQDv/gn7gW95l3pcGHSKbEvsne/0W5b/YjpAhwE77VTpFGbxLVF08ek5oE3NMd 5h7i6SEirOL2W9zlsKZiXdml/Zx5MnKt58bwaKTiCrM1CQ3ie+xx+t8NMbbXBTE2trpKX8pKNJ5 EYLkIygs3hZ+oqtyllVkStwGrrew/SFUe2krmKJHnvF1ue32OdR1G/HbEUB9yslono3Igh9vxjX JtSmETfzRiZ3vmTIGYTmX+7easlWI1zIP+LFhamEHe7GqyI2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_032702_126330_0CCE4FDF 
X-CRM114-Status: GOOD (  11.23  )
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

YW1sb2dpY190aGVybWFsX2Rpc2FibGUoKSByZXR1cm5lZCB6ZXJvIHVuY29uZGl0aW9uYWxseSBh
bmQKYW1sb2dpY190aGVybWFsX3JlbW92ZSgpIGFscmVhZHkgaWdub3JlcyB0aGUgcmV0dXJuIHZh
bHVlLgoKTWFrZSBpdCByZXR1cm4gbm8gdmFsdWUgYW5kIG1vZGlmeSBhbWxvZ2ljX3RoZXJtYWxf
c3VzcGVuZCB0byBub3QgY2hlY2sKdGhlIHZhbHVlLgoKVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIG5v
IHNlbWFudGljIGNoYW5nZXMsIGJ1dCBtYWtlcyBpdCBtb3JlIG9idmlvdXMgZm9yCmEgaHVtYW4g
cmVhZGVyIHRoYXQgYW1sb2dpY190aGVybWFsX3N1c3BlbmQoKSBjYW5ub3QgZmFpbC4KClNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+Ci0tLQogZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jIHwgOCArKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgYi9kcml2ZXJzL3RoZXJtYWwv
YW1sb2dpY190aGVybWFsLmMKaW5kZXggNTg3N2NkZTI1Yjc5Li41NjJmNjNiN2JmMjcgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYworKysgYi9kcml2ZXJzL3Ro
ZXJtYWwvYW1sb2dpY190aGVybWFsLmMKQEAgLTE2NywxMyArMTY3LDExIEBAIHN0YXRpYyBpbnQg
YW1sb2dpY190aGVybWFsX2VuYWJsZShzdHJ1Y3QgYW1sb2dpY190aGVybWFsICpkYXRhKQogCXJl
dHVybiAwOwogfQogCi1zdGF0aWMgaW50IGFtbG9naWNfdGhlcm1hbF9kaXNhYmxlKHN0cnVjdCBh
bWxvZ2ljX3RoZXJtYWwgKmRhdGEpCitzdGF0aWMgdm9pZCBhbWxvZ2ljX3RoZXJtYWxfZGlzYWJs
ZShzdHJ1Y3QgYW1sb2dpY190aGVybWFsICpkYXRhKQogewogCXJlZ21hcF91cGRhdGVfYml0cyhk
YXRhLT5yZWdtYXAsIFRTRU5TT1JfQ0ZHX1JFRzEsCiAJCQkgICBUU0VOU09SX0NGR19SRUcxX0VO
QUJMRSwgMCk7CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEtPmNsayk7Ci0KLQlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIGludCBhbWxvZ2ljX3RoZXJtYWxfZ2V0X3RlbXAoc3RydWN0IHRoZXJt
YWxfem9uZV9kZXZpY2UgKnR6LCBpbnQgKnRlbXApCkBAIC0zMDIsNyArMzAwLDkgQEAgc3RhdGlj
IGludCBfX21heWJlX3VudXNlZCBhbWxvZ2ljX3RoZXJtYWxfc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiB7CiAJc3RydWN0IGFtbG9naWNfdGhlcm1hbCAqZGF0YSA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwogCi0JcmV0dXJuIGFtbG9naWNfdGhlcm1hbF9kaXNhYmxlKGRhdGEpOworCWFtbG9n
aWNfdGhlcm1hbF9kaXNhYmxlKGRhdGEpOworCisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQg
X19tYXliZV91bnVzZWQgYW1sb2dpY190aGVybWFsX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
