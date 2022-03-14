Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31C9C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Mar 2022 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OA31jcvbOgSYyxxooBdYn8RRA3bNG0RPed4Y5aC81gE=; b=Ce+QK4HViEpTgC
	RyKJTkKKjkvvgs8BB3nXU6oEMk5601wvF8yPWW0SrZNP1fQ29Ymbsh6F2whLY3eyofvrzmoTm2frm
	mBy/GpbF2523T1DkhilqMgq0Io8IhjEAw410VH2rxKGfKVMMTCHDmo3KaG1JAd02gbBKs0NFXXYF3
	tl6Gtj0ZMUBBmL67VOmv0vib0MBguDPqClvuKshRf38trb5ZETuPnzGZD6ujfawpl5p0G/4k8sDw2
	LAX6HzfhCG5fW34jn2uNyZKLg9SdrfzmRLAFvIWU5jj3W652V0qsvxXD5frmNU6Cebo+OEc45CkES
	t/2sh+Szq1xBtnALYEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTlXB-005dHA-16; Mon, 14 Mar 2022 14:18:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTlVk-005cdN-HC
 for linux-amlogic@lists.infradead.org; Mon, 14 Mar 2022 14:17:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVL-0004zT-8j; Mon, 14 Mar 2022 15:16:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVL-000f2z-Gx; Mon, 14 Mar 2022 15:16:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVJ-0097ao-2C; Mon, 14 Mar 2022 15:16:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v8 05/16] hwrng: meson - Don't open-code
 devm_clk_get_optional_enabled()
Date: Mon, 14 Mar 2022 15:16:32 +0100
Message-Id: <20220314141643.22184-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735; i=uwe@kleine-koenig.org;
 h=from:subject; bh=bfqnxylPnbbJXe+3GBtwLYLgZPhd+qJZuw2RI3jILYE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL035AdG35VtGykFXO3us1e4Qyfe85laP1NXWH96B
 J/ooUYmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9N+QAKCRDB/BR4rcrsCaXiCA
 CYQFfcviJ8XTZvDwlKW0nOhnqK5pTk5a0ilSqlNkH2f7pbLRUYz1rMgQTnxyx4mfi2x7jHSUvQ80ZT
 XrlFiSMUGotXPWPSjAUJtt/ZB9qpJIkDJquiChcWWfqfB93qxX7eOCzqjmM/C3k/uibRqKM6E2qaKK
 kEmkOLoBVbmGMXAlti6yjPpMx+ObbWu4w1cwFw1pLAaCuq8fgXcIjhi95Q/7JfLu+gadS6zU5a44LZ
 Eqie89qMyY4R8y4ZcWGjy+UHyrWlXdQ3RxglzdRGZHT3wAZb+gFSUfxq+FyiKjlwfM8XheHVut3VVz
 P3sPTI8D/NFV8C+7vxPxHB1zuDfQqZ
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_071724_603970_12ED9320 
X-CRM114-Status: GOOD (  12.53  )
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

ZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSByZXR1cm5zIGEgY2xvY2sgcHJlcGFyZWQgYW5kIGVuYWJs
ZWQgYW5kIGFscmVhZHkKcmVnaXN0ZXJzIGEgZGV2bSBleGl0IGhhbmRsZXIgdG8gZGlzYWJsZSAo
YW5kIHVucHJlcGFyZSkgdGhlIGNsb2NrLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2NoYXIvaHdf
cmFuZG9tL21lc29uLXJuZy5jIHwgMjAgKystLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2hhci9od19yYW5kb20vbWVzb24tcm5nLmMgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL21l
c29uLXJuZy5jCmluZGV4IDhiYjMwMjgyY2E0Ni4uMDZkYjVhOTNlMjU3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2NoYXIvaHdfcmFuZG9tL21lc29uLXJuZy5jCisrKyBiL2RyaXZlcnMvY2hhci9od19y
YW5kb20vbWVzb24tcm5nLmMKQEAgLTMzLDE2ICszMywxMCBAQCBzdGF0aWMgaW50IG1lc29uX3Ju
Z19yZWFkKHN0cnVjdCBod3JuZyAqcm5nLCB2b2lkICpidWYsIHNpemVfdCBtYXgsIGJvb2wgd2Fp
dCkKIAlyZXR1cm4gc2l6ZW9mKHUzMik7CiB9CiAKLXN0YXRpYyB2b2lkIG1lc29uX3JuZ19jbGtf
ZGlzYWJsZSh2b2lkICpkYXRhKQotewotCWNsa19kaXNhYmxlX3VucHJlcGFyZShkYXRhKTsKLX0K
LQogc3RhdGljIGludCBtZXNvbl9ybmdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVjdCBtZXNvbl9y
bmdfZGF0YSAqZGF0YTsKLQlpbnQgcmV0OwogCiAJZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHNp
emVvZigqZGF0YSksIEdGUF9LRVJORUwpOwogCWlmICghZGF0YSkKQEAgLTU0LDIwICs0OCwxMCBA
QCBzdGF0aWMgaW50IG1lc29uX3JuZ19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCWlmIChJU19FUlIoZGF0YS0+YmFzZSkpCiAJCXJldHVybiBQVFJfRVJSKGRhdGEtPmJhc2Up
OwogCi0JZGF0YS0+Y29yZV9jbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoZGV2LCAiY29yZSIp
OworCWRhdGEtPmNvcmVfY2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQoZGV2LCAi
Y29yZSIpOwogCWlmIChJU19FUlIoZGF0YS0+Y29yZV9jbGspKQogCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIFBUUl9FUlIoZGF0YS0+Y29yZV9jbGspLAotCQkJCSAgICAgIkZhaWxlZCB0byBn
ZXQgY29yZSBjbG9ja1xuIik7Ci0KLQlpZiAoZGF0YS0+Y29yZV9jbGspIHsKLQkJcmV0ID0gY2xr
X3ByZXBhcmVfZW5hYmxlKGRhdGEtPmNvcmVfY2xrKTsKLQkJaWYgKHJldCkKLQkJCXJldHVybiBy
ZXQ7Ci0JCXJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIG1lc29uX3JuZ19jbGtf
ZGlzYWJsZSwKLQkJCQkJICAgICAgIGRhdGEtPmNvcmVfY2xrKTsKLQkJaWYgKHJldCkKLQkJCXJl
dHVybiByZXQ7Ci0JfQorCQkJCSAgICAgIkZhaWxlZCB0byBnZXQgZW5hYmxlZCBjb3JlIGNsb2Nr
XG4iKTsKIAogCWRhdGEtPnJuZy5uYW1lID0gcGRldi0+bmFtZTsKIAlkYXRhLT5ybmcucmVhZCA9
IG1lc29uX3JuZ19yZWFkOwotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
