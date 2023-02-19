Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEE9C636CC
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Feb 2023 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/BQmYMXnmoLqJq6koM8w3l29QWyvKs6IB1vZzabyB8U=; b=cdfHJ9swSkg5uc
	g41QUUIXR/3OE1qItIkzKoYWuJwnL40JZ0PQK/jdWx5p23aCBeP46XzxcUliI89TzOQ83+TEnvxDm
	pbRI+Wld0iHKo2hLnugutEnd9QUCqX8N3Ys9ywAgLocXyAc3ry4bCmWkFotbG/Ya2CLK+si5tfFZa
	eEdyGjKtY2okE0SA3u+JqarJnZFQ+MYo6otm2Z/pFJfCAeIHqrrTKibG8+rfcGTeKo+7/9A88iqib
	n4tVYbimVWJtiAC0ECVaHdudg4ixKurTpcQeMGUwoBAOMiN1mmIiTJrBmWsM55OacdZGRHg4V04cn
	/E3JAF5jNw+VmX6BeFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTqYq-002HLw-9U; Sun, 19 Feb 2023 20:45:28 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTqYd-002HJk-Nl
	for linux-amlogic@lists.infradead.org; Sun, 19 Feb 2023 20:45:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pTqYG-0002Zv-Em; Sun, 19 Feb 2023 21:44:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pTqYB-0066oS-9b; Sun, 19 Feb 2023 21:44:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pTqYB-004trh-PA; Sun, 19 Feb 2023 21:44:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v2] iio: adc: meson_saradc: Better handle BL30 not releaseing the hardware
Date: Sun, 19 Feb 2023 21:44:39 +0100
Message-Id: <20230219204439.1641640-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UFb/C7xXSmr0LKHXSvPXadmaMrdeCgJrt6qsOgXktPA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj8oo0s1jtpBKhA696qEv+cQLED42WqCqwi4fam y48gJ9dgVuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/KKNAAKCRDB/BR4rcrs CeejB/9OmUvOfyvHfDjjyWCsorSUvO1jy2RVvo6aU55Xu8NQspq9ntKSUpz1vwFymaYhjkcADr+ QoiCQMQqfkUtOeECpb0aIO4fuey/2+vUeydRiystje/dPU+xLg1YpAuDFD59SPjwreWOuFkUb6q dvetVwVIEi7SZQgrFPM8nweGWb7hFm/V6iTXT9vE4wzVeQdkINFJvZSvXOTm5Sv81DZEzd3BZ2N HoVxMdH8zMJ92VYp2ny+zCfzdr8eCu0P551TN/gE6uadx1YnuTo23FQadmMNWZKtQvqLhiYf5mD tlO3C+Kn+vCxAxowG7nMk43l3+TzCCpOyQN5mN5RPuE69adL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_124515_776649_662ABAAA 
X-CRM114-Status: GOOD (  14.38  )
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
YW5kIHJlZ3VsYXRvcnMgb24gd2hpY2ggaXMgbmV2ZXIKY2xlYW5lZCB1cCBsYXRlci4KCkdpdmVu
IHRoZSBCTDMwIG5vdCBnaXZpbmcgdXAgaXRzIGxvY2sgaXMgYSBzdHJvbmcgaGludCBmb3IgYnJv
a2VuCmJlaGF2aW91ciwgYW5kIHRoZXJlIGlzIG5vdGhpbmcgd2UgY2FuIGRvIGFib3V0IHRoYXQ6
IEp1c3QgY2xlYW4gdXAKaWdub3JpbmcgdGhlIGZhY3QgdGhhdCB3ZSdyZSBub3QgaG9sZGluZyB0
aGUgbG9jay4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQpIZWxsbywKCmNoYW5nZXMgc2luY2UgKGltcGxpY2l0KSB2
MToKCiAtIElnbm9yZSBmYWlsdXJlIHRvIGdldCB0aGUgbG9jayBhcyBzdWdnZXN0ZWQgYnkgTWFy
dGluLgogLSBBZGFwdCBhIGNhbGxlciBmb3IgbWVzb25fc2FyX2FkY19od19kaXNhYmxlKCkgcmV0
dXJuaW5nIHZvaWQgbm93CiAgICh3aGljaCB1c2VkIHRoZSByZXR1cm4gdmFsdWUpCgogZHJpdmVy
cy9paW8vYWRjL21lc29uX3NhcmFkYy5jIHwgMjEgKysrKysrKysrKysrKystLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2lpby9hZGMvbWVzb25fc2FyYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvbWVzb25f
c2FyYWRjLmMKaW5kZXggODViNjgyNmNjMTBjLi4xODkzN2EyNjJhZjYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvaWlvL2FkYy9tZXNvbl9zYXJhZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvbWVzb25f
c2FyYWRjLmMKQEAgLTk1NywxNCArOTU3LDE4IEBAIHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY19o
d19lbmFibGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldikKIAlyZXR1cm4gcmV0OwogfQogCi1z
dGF0aWMgaW50IG1lc29uX3Nhcl9hZGNfaHdfZGlzYWJsZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9f
ZGV2KQorc3RhdGljIHZvaWQgbWVzb25fc2FyX2FkY19od19kaXNhYmxlKHN0cnVjdCBpaW9fZGV2
ICppbmRpb19kZXYpCiB7CiAJc3RydWN0IG1lc29uX3Nhcl9hZGNfcHJpdiAqcHJpdiA9IGlpb19w
cml2KGluZGlvX2Rldik7CiAJaW50IHJldDsKIAorCS8qCisJICogSWYgdGFraW5nIHRoZSBsb2Nr
IGZhaWxzIHdlIGhhdmUgdG8gYXNzdW1lIHRoYXQgQkwzMCBpcyBicm9rZW4uIFRoZQorCSAqIGJl
c3Qgd2UgY2FuIGRvIHRoZW4gaXMgdG8gcmVsZWFzZSB0aGUgcmVzb3VyY2VzIGFueWhvdy4KKwkg
Ki8KIAlyZXQgPSBtZXNvbl9zYXJfYWRjX2xvY2soaW5kaW9fZGV2KTsKIAlpZiAocmV0KQotCQly
ZXR1cm4gcmV0OworCQlkZXZfZXJyKGluZGlvX2Rldi0+ZGV2LnBhcmVudCwgIkZhaWxlZCB0byBs
b2NrIEFEQyAoJXBFKVxuIiwgRVJSX1BUUihyZXQpKTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFy
ZShwcml2LT5hZGNfY2xrKTsKIApAQCAtOTc3LDkgKzk4MSw4IEBAIHN0YXRpYyBpbnQgbWVzb25f
c2FyX2FkY19od19kaXNhYmxlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCiAKIAlyZWd1bGF0
b3JfZGlzYWJsZShwcml2LT52cmVmKTsKIAotCW1lc29uX3Nhcl9hZGNfdW5sb2NrKGluZGlvX2Rl
dik7Ci0KLQlyZXR1cm4gMDsKKwlpZiAoIXJldCkKKwkJbWVzb25fc2FyX2FkY191bmxvY2soaW5k
aW9fZGV2KTsKIH0KIAogc3RhdGljIGlycXJldHVybl90IG1lc29uX3Nhcl9hZGNfaXJxKGludCBp
cnEsIHZvaWQgKmRhdGEpCkBAIC0xMjgzLDE0ICsxMjg2LDE4IEBAIHN0YXRpYyBpbnQgbWVzb25f
c2FyX2FkY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWlpb19kZXZp
Y2VfdW5yZWdpc3RlcihpbmRpb19kZXYpOwogCi0JcmV0dXJuIG1lc29uX3Nhcl9hZGNfaHdfZGlz
YWJsZShpbmRpb19kZXYpOworCW1lc29uX3Nhcl9hZGNfaHdfZGlzYWJsZShpbmRpb19kZXYpOwor
CisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY19zdXNwZW5kKHN0cnVj
dCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2ID0gZGV2X2dldF9k
cnZkYXRhKGRldik7CiAKLQlyZXR1cm4gbWVzb25fc2FyX2FkY19od19kaXNhYmxlKGluZGlvX2Rl
dik7CisJbWVzb25fc2FyX2FkY19od19kaXNhYmxlKGluZGlvX2Rldik7CisKKwlyZXR1cm4gMDsK
IH0KIAogc3RhdGljIGludCBtZXNvbl9zYXJfYWRjX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CgpiYXNlLWNvbW1pdDogOTI1Y2YwNDU3ZDdlNjJjZTA4ODc4ZmZiNzg5MTg5YWMwOGNhODY3Nwot
LSAKMi4zOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
