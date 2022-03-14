Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2549C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Mar 2022 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/1EIvlMmRX/zRFlpejZMxTz0OLOFuOcREjrFbb+MXA=; b=el4B2xuFNhxPjJ
	pweXy0ZjQk8bgHw9raY8+sxuSgGcpcj4G1vjZnXpjB3VVdop3zU4tiFfS0aAJULOHXJvuV/ZOWIEH
	sUYi7rJLCgq5LxT45oPs/fFeQj4wEo6EPi4fIrjaMu979ag8XiNZu8X8HHs/8igcnA4R/70cnLRKA
	ekBUu7EZ9Ui0EsTbhLiTdFwDUngSORNTt9TesYwduH64t90e/7c+YAu+3jJhoHcIWPYEcvcT4G5Wy
	Xwa31ZrDpJqX3Sx9kyib3daehYrF81dlsSHjvIYX9rWXzJSNejbbptPtedogHJZyCGbRNVH/hG7Go
	wzOe1K/Mqva7iFVYOJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTlW0-005ciM-It; Mon, 14 Mar 2022 14:17:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTlVX-005cYF-BU
 for linux-amlogic@lists.infradead.org; Mon, 14 Mar 2022 14:17:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVM-00050A-2Z; Mon, 14 Mar 2022 15:17:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVM-000f3E-Kq; Mon, 14 Mar 2022 15:16:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVK-0097bA-H4; Mon, 14 Mar 2022 15:16:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 10/16] clk: meson: axg-audio: Don't duplicate
 devm_clk_get_enabled()
Date: Mon, 14 Mar 2022 15:16:37 +0100
Message-Id: <20220314141643.22184-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=uwe@kleine-koenig.org;
 h=from:subject; bh=ifDCWLNWOL0YsD190lDHgYWEgpILJPKuKKXrEJE9+6k=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL04L4e9IWDji46EkjNnzAhHVqLKQME2Cj5ZGNUdC
 xgjHkqmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9OCwAKCRDB/BR4rcrsCaRsB/
 4lw+anORVBYqdBZWfiCRFFXRQ1s91OC7WxPcmn0FjB9HAVMFy2dbkDyj6f0nmTf+yUwEGrDTPZOFJN
 sm4dQ6knZvNGSweqsOAOLHFzuLkqcEE4Q25ruO0NF7Lvc6zA276x7VDCocmn7B8oKPg2+sITuo7qcW
 l6GpEHjwOvtN+FrW61a/R97V0S9wv6Ko0ZkN43U5h5uQsgt1hGo3JjZEf2wLOMIgq+MDqlMu8Fd7fC
 88wZVw9dR6TsrgMSkJrdXY/2ykuniA9i3TmaWCIZ0qIc9Sa5tOp2sw1MqXJaX1blBcXqn4Kw5x5lZy
 U5SXida2sOuLdzEBzT18QLzS/ce2Dc
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_071711_416083_D12E4C95 
X-CRM114-Status: GOOD (  14.60  )
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

VGhlIGNsayBBUEkgcmVjZW50bHkgZ290IGEgZnVuY3Rpb24gd2l0aCBhIHNsaWdodGx5IGRpZmZl
cmVudCBuYW1lIGFuZAp0aGUgc2FtZSBmdW5jdGlvbmFsaXR5LiBSZW1vdmUgdGhlIGR1cGxpY2F0
aW9uLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2Nsay9tZXNvbi9heGctYXVkaW8uYyB8IDM2ICsr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNv
bi9heGctYXVkaW8uYyBiL2RyaXZlcnMvY2xrL21lc29uL2F4Zy1hdWRpby5jCmluZGV4IGJmZTM2
YmQ0MTMzOS4uNTAxNjY4MmU0N2M4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9heGct
YXVkaW8uYworKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9heGctYXVkaW8uYwpAQCAtMTY1NywzNSAr
MTY1Nyw2IEBAIHN0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCAqY29uc3Qgc20xX2Nsa19yZWdtYXBz
W10gPSB7CiAJJnNtMV9zeXNjbGtfYl9lbiwKIH07CiAKLXN0YXRpYyBpbnQgZGV2bV9jbGtfZ2V0
X2VuYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNoYXIgKmlkKQotewotCXN0cnVjdCBjbGsgKmNs
azsKLQlpbnQgcmV0OwotCi0JY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgaWQpOwotCWlmIChJU19F
UlIoY2xrKSkgewotCQlyZXQgPSBQVFJfRVJSKGNsayk7Ci0JCWRldl9lcnJfcHJvYmUoZGV2LCBy
ZXQsICJmYWlsZWQgdG8gZ2V0ICVzIiwgaWQpOwotCQlyZXR1cm4gcmV0OwotCX0KLQotCXJldCA9
IGNsa19wcmVwYXJlX2VuYWJsZShjbGspOwotCWlmIChyZXQpIHsKLQkJZGV2X2VycihkZXYsICJm
YWlsZWQgdG8gZW5hYmxlICVzIiwgaWQpOwotCQlyZXR1cm4gcmV0OwotCX0KLQotCXJldCA9IGRl
dm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsCi0JCQkJICAgICAgICh2b2lkKCopKHZvaWQgKikp
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlLAotCQkJCSAgICAgICBjbGspOwotCWlmIChyZXQpIHsKLQkJ
ZGV2X2VycihkZXYsICJmYWlsZWQgdG8gYWRkIHJlc2V0IGFjdGlvbiBvbiAlcyIsIGlkKTsKLQkJ
cmV0dXJuIHJldDsKLQl9Ci0KLQlyZXR1cm4gMDsKLX0KLQogc3RydWN0IGF4Z19hdWRpb19yZXNl
dF9kYXRhIHsKIAlzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgcnN0YzsKIAlzdHJ1Y3QgcmVn
bWFwICptYXA7CkBAIC0xNzg3LDYgKzE3NTgsNyBAQCBzdGF0aWMgaW50IGF4Z19hdWRpb19jbGtj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IHJlZ21hcCAqbWFw
OwogCXZvaWQgX19pb21lbSAqcmVnczsKIAlzdHJ1Y3QgY2xrX2h3ICpodzsKKwlzdHJ1Y3QgY2xr
ICpjbGs7CiAJaW50IHJldCwgaTsKIAogCWRhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEo
ZGV2KTsKQEAgLTE4MDQsOSArMTc3Niw5IEBAIHN0YXRpYyBpbnQgYXhnX2F1ZGlvX2Nsa2NfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl9CiAKIAkvKiBHZXQgdGhlIG1hbmRh
dG9yeSBwZXJpcGhlcmFsIGNsb2NrICovCi0JcmV0ID0gZGV2bV9jbGtfZ2V0X2VuYWJsZShkZXYs
ICJwY2xrIik7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwljbGsgPSBkZXZtX2Nsa19nZXRf
ZW5hYmxlZChkZXYsICJwY2xrIik7CisJaWYgKElTX0VSUihjbGspKQorCQlyZXR1cm4gUFRSX0VS
UihjbGspOwogCiAJcmV0ID0gZGV2aWNlX3Jlc2V0KGRldik7CiAJaWYgKHJldCkgewotLSAKMi4z
NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
