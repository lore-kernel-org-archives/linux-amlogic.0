Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14960C64ED6
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dlGDrpDHwlHOfZxQmHTCRN72278kHAndYqpv0btVM4s=; b=FmUzK0plBJeNRf
	mqHW6gFW2x274orhVA+VU14Zo5y6LjKyjG+fcJJnoCKQZE4Pmkb9wWifoQmjt5U9PbSw+dfiotnjA
	a7SiDytQ8mBg2B+PmkqatGlKgMt+2Pl/cxvONSj/XrqbN+2af6LVW0lHjxPL822n/T1Fz14DHfLzI
	MVJEBIkyaJ0iZBlCi0kq+s9am5wVKXifS5EVuvIO7l8lM51YjsAhj11NHVRGUt4xgkA1NP+FWiGqb
	+TIA9QPmNuXo1JJyVYNN9+uI2omkaPA0c+hPrejXwZONN0M73sfc+J88VfQ8zot09atn9syylV8t5
	NcDoVFSWuEWgTPbwvkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSevl-00AVsG-VP; Thu, 16 Feb 2023 14:08:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSevj-00AVnB-UT
	for linux-amlogic@lists.infradead.org; Thu, 16 Feb 2023 14:08:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pSev9-0002pN-1z; Thu, 16 Feb 2023 15:07:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pSev4-005NMl-29; Thu, 16 Feb 2023 15:07:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pSev4-00432u-Av; Thu, 16 Feb 2023 15:07:30 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Cc: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] iio: adc: meson_saradc: Better handle BL30 not releaseing the hardware
Date: Thu, 16 Feb 2023 15:07:25 +0100
Message-Id: <20230216140725.1181867-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KZdpbbbUsYmkCke9LHHnK/zq1DqCnV5CR7J0anvetnE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj7jiZLIduR6lon2oWtpeLvCnuQmd4PLmHteVCZ Z6gIajQhR+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+44mQAKCRDB/BR4rcrs CQBNB/928xQq4fPeOYoLbi0j2ro5FOg5WJAuYzDjfwf36vP+Bc5SzH6JIlqIDnp31ZidP/WKzKR 3yzzkuFEQqNH1x0oKvehaZpX1jaiKhxsIYRnUeNf4ir1TKT9XIXjbJYwXJjAn644+RvYiNGae5U 3aNVF3ksW7BGlY1R8X6FDOesyRkkkmQCXI7AlBZffcl+WcNoVyMw480/Ac8bp52Z4xR/8+JRzSz OF98G2eI9aPKkWeqv5RdifESBcnPA2ah4KIKcyQOghGcysDh1JTvWHgPATbRuVbr0N0UUQmg3jj LhGyJS8EzNPDSOjx4uItw+tqM1345BnMh0Ze9TmwEL9fuihO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_060812_012406_2AB6B86B 
X-CRM114-Status: GOOD (  14.68  )
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

bWVzb25fc2FyX2FkY19sb2NrKCkgbWlnaHQgcmV0dXJuIGFuIGVycm9yIGlmIEJMMzAgZG9lc24n
dCByZWxlYXNlIGl0cwpsb2NrIG9uIHRoZSBoYXJkd2FyZS4gSnVzdCByZXR1cm5pbmcgZWFybHkg
ZnJvbSAucmVtb3ZlKCkgaXMgd3JvbmcKaG93ZXZlciBhcyB0aGlzIGtlZXBzIHRoZSBjbG9ja3Mg
YW5kIHJlZ3VsYXRvcnMgb24gd2hpY2ggaXMgbmV2ZXIKY2xlYW5lZCB1cCBsYXRlci4KClNvIG9u
bHkgc2tpcCBoYXJkd2FyZSBhY2Nlc3NlcyB3aXRoIGFuIGVycm9yIG1lc3NhZ2UgaWYKbWVzb25f
c2FyX2FkY19sb2NrKCkgZmFpbHMsIGJ1dCBkaXNhYmxlIGNsb2NrcyBhbmQgcmVndWxhdG9yIGFu
ZCByZXR1cm4KemVybyB0byBzdXBwcmVzcyBhbm90aGVyIGVycm9yIG1lc3NhZ2UgYnkgdGhlIGRy
aXZlciBjb3JlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCkhlbGxvLAoKbWF5YmUgc29tZW9uZSB3aXRoIG1vcmUg
aGFyZHdhcmUgc3BlY2lmaWMga25vd2xlZGdlIGNhbiBpbXByb3ZlIHRoZQpwcm9jZWR1cmUgaGVy
ZS4gTWF5YmUgc29tZSBIVyBhY2Nlc3MgaXMgZmluZSBldmVuIHdpdGhvdXQgdGhlIGxvY2sgdG8K
cXVpZXNjZW50IGl0LCBvciBtYXliZSB0aGUgbG9jayBjYW4gYmUgZHJvcHBlZCBjb21wbGV0ZWx5
PyBPciB0aGUKb3JkZXJpbmcgY2FuIGJlIGNoYW5nZWQgdG8gcmVkdWNlIHRoZSBudW1iZXIgb2Yg
aWYgYmxvY2tzLgoKQmVzdCByZWdhcmRzClV3ZQoKIGRyaXZlcnMvaWlvL2FkYy9tZXNvbl9zYXJh
ZGMuYyB8IDIxICsrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL21l
c29uX3NhcmFkYy5jIGIvZHJpdmVycy9paW8vYWRjL21lc29uX3NhcmFkYy5jCmluZGV4IDg1YjY4
MjZjYzEwYy4uNjM2ZmVlMjdiNmIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvbWVzb25f
c2FyYWRjLmMKKysrIGIvZHJpdmVycy9paW8vYWRjL21lc29uX3NhcmFkYy5jCkBAIC05NTcsMjkg
Kzk1NywzMCBAQCBzdGF0aWMgaW50IG1lc29uX3Nhcl9hZGNfaHdfZW5hYmxlKHN0cnVjdCBpaW9f
ZGV2ICppbmRpb19kZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBtZXNvbl9zYXJf
YWRjX2h3X2Rpc2FibGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldikKK3N0YXRpYyB2b2lkIG1l
c29uX3Nhcl9hZGNfaHdfZGlzYWJsZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQogewogCXN0
cnVjdCBtZXNvbl9zYXJfYWRjX3ByaXYgKnByaXYgPSBpaW9fcHJpdihpbmRpb19kZXYpOwogCWlu
dCByZXQ7CiAKIAlyZXQgPSBtZXNvbl9zYXJfYWRjX2xvY2soaW5kaW9fZGV2KTsKIAlpZiAocmV0
KQotCQlyZXR1cm4gcmV0OworCQlkZXZfZXJyKGluZGlvX2Rldi0+ZGV2LnBhcmVudCwgIkZhaWxl
ZCB0byBsb2NrIEFEQyAoJXBFKVxuIiwgRVJSX1BUUihyZXQpKTsKIAogCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShwcml2LT5hZGNfY2xrKTsKIAotCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdt
YXAsIE1FU09OX1NBUl9BRENfUkVHMywKLQkJCSAgIE1FU09OX1NBUl9BRENfUkVHM19BRENfRU4s
IDApOworCWlmICghcmV0KSB7CisJCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsIE1F
U09OX1NBUl9BRENfUkVHMywKKwkJCQkgICBNRVNPTl9TQVJfQURDX1JFRzNfQURDX0VOLCAwKTsK
IAotCW1lc29uX3Nhcl9hZGNfc2V0X2JhbmRnYXAoaW5kaW9fZGV2LCBmYWxzZSk7CisJCW1lc29u
X3Nhcl9hZGNfc2V0X2JhbmRnYXAoaW5kaW9fZGV2LCBmYWxzZSk7CisJfQogCiAJY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKHByaXYtPmNvcmVfY2xrKTsKIAogCXJlZ3VsYXRvcl9kaXNhYmxlKHByaXYt
PnZyZWYpOwogCi0JbWVzb25fc2FyX2FkY191bmxvY2soaW5kaW9fZGV2KTsKLQotCXJldHVybiAw
OworCWlmICghcmV0KQorCQltZXNvbl9zYXJfYWRjX3VubG9jayhpbmRpb19kZXYpOwogfQogCiBz
dGF0aWMgaXJxcmV0dXJuX3QgbWVzb25fc2FyX2FkY19pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkK
QEAgLTEyODMsNyArMTI4NCw5IEBAIHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY19yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWlpb19kZXZpY2VfdW5yZWdpc3RlcihpbmRp
b19kZXYpOwogCi0JcmV0dXJuIG1lc29uX3Nhcl9hZGNfaHdfZGlzYWJsZShpbmRpb19kZXYpOwor
CW1lc29uX3Nhcl9hZGNfaHdfZGlzYWJsZShpbmRpb19kZXYpOworCisJcmV0dXJuIDA7CiB9CiAK
IHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKCmJh
c2UtY29tbWl0OiAxYjkyOWMwMmFmZDM3ODcxZDVhZmI5ZDQ5ODQyNmY4MzQzMmU3MWMyCi0tIAoy
LjM5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
