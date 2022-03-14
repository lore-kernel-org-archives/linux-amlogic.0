Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FC0C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Mar 2022 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQ+NUA5Vd957Mb8blkmNaUTwoZetQWk/bkgX+JEWGUE=; b=FVeQNeKCjxKhVq
	o7S36aOoXLMn/C/S2lvv6Kz7kbAba4Ly+9HISTCFR2o23T64pT22nqWrjr5FjE5L2tu07ZAhJGa77
	1VJ46/NCgNnkBanyYM48wdy0QLHCeZgi9jSj2UpuScDZrOyNh6aDc2oyrJdz8sIhcrspig9Ir6roL
	Q2P5eXMtWYQWXsHHnYSZXFW9WBGTmQbSPuzzmqAOBlcjN3Ge3BXlOE/Fwg3K/9XGjPXC5dqUelyn4
	tcMXcXGUGDAN+g6sLTIDgt6Zw6BlJa9JfXLRS+R+uk8GS5zbaazcvJj6i4855Wq4b9dg6pfhziR49
	82JM+Vtz6xjcxpCumwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTlZF-005eTb-LD; Mon, 14 Mar 2022 14:21:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTlWi-005d1l-98
 for linux-amlogic@lists.infradead.org; Mon, 14 Mar 2022 14:18:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVQ-0004zL-Eh; Mon, 14 Mar 2022 15:17:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVI-000f2l-Q9; Mon, 14 Mar 2022 15:16:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVG-0097af-Ma; Mon, 14 Mar 2022 15:16:54 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 UNGLinuxDriver@microchip.com, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Heiko Stuebner <heiko@sntech.de>, Tomislav Denis <tomislav.denis@avl.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 =?utf-8?q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 Cai Huoqing <caihuoqing@baidu.com>, linux-iio@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v8 03/16] hwmon: Make use of devm_clk_get_enabled()
Date: Mon, 14 Mar 2022 15:16:30 +0100
Message-Id: <20220314141643.22184-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5520; i=uwe@kleine-koenig.org;
 h=from:subject; bh=yoWCqkNop/4c6OeHmiSUVdq/1kzaWm1CMWom+WTtANQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL03yCpTW66mjenPvolXbHi93VsM0yzx1/1i/xg38
 JATIi6SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9N8gAKCRDB/BR4rcrsCQkqB/
 9PjEPh2PyWfNPLXABv6MwOZQFQlkQEqb7Uekuh33gB2X0gHncSoOfkEhvSA3yU5f1JKsoWGktEOVRg
 n+3bvFwDe1hNoOS5coZgZV7FTfW8NcDdt1L55ROM501f7GHgh9/VyyqTbW9Jfg108IB6GXoVFmyiA3
 zdrIOdlQb2gSicQGiLiTWR0+HZModM3RWjv+KN8b3Mz5fHJdX2rt20lVLbG6aC4fgbxgl/k2GNIq7F
 utAI4QGzo9+Vc41UCForfyIXi/JNyyOSfFvugrXq8ze/4V3IkxdO+/DOtDfkPum8ClhrVLXZeDmngJ
 RvozUy0kpU8RDShp4aDvanTK0USO9z
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_071824_517686_43AE463F 
X-CRM114-Status: GOOD (  15.52  )
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

U2V2ZXJhbCBkcml2ZXJzIG1hbnVhbGx5IHJlZ2lzdGVyIGEgZGV2bSBoYW5kbGVyIHRvIGRpc2Fi
bGUgdGhlaXIgY2xrLgpDb252ZXJ0IHRoZW0gdG8gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKS4KClNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+Ci0tLQogZHJpdmVycy9od21vbi9heGktZmFuLWNvbnRyb2wuYyB8IDE1ICstLS0tLS0t
LS0tLS0tLQogZHJpdmVycy9od21vbi9sdGMyOTQ3LWNvcmUuYyAgICB8IDE3ICstLS0tLS0tLS0t
LS0tLS0tCiBkcml2ZXJzL2h3bW9uL21yNzUyMDMuYyAgICAgICAgIHwgMjYgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvaHdtb24vc3Bhcng1LXRlbXAuYyAgICAgfCAxOSArLS0t
LS0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNzMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9heGktZmFuLWNvbnRyb2wuYyBi
L2RyaXZlcnMvaHdtb24vYXhpLWZhbi1jb250cm9sLmMKaW5kZXggZDIwOTJjMTdkOTkzLi5jZTQw
NGVkOWM1M2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaHdtb24vYXhpLWZhbi1jb250cm9sLmMKKysr
IGIvZHJpdmVycy9od21vbi9heGktZmFuLWNvbnRyb2wuYwpAQCAtMzkzLDExICszOTMsNiBAQCBz
dGF0aWMgaW50IGF4aV9mYW5fY29udHJvbF9pbml0KHN0cnVjdCBheGlfZmFuX2NvbnRyb2xfZGF0
YSAqY3RsLAogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyB2b2lkIGF4aV9mYW5fY29udHJvbF9j
bGtfZGlzYWJsZSh2b2lkICpjbGspCi17Ci0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNsayk7Ci19
Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHdtb25fY2hhbm5lbF9pbmZvICpheGlfZmFuX2NvbnRy
b2xfaW5mb1tdID0gewogCUhXTU9OX0NIQU5ORUxfSU5GTyhwd20sIEhXTU9OX1BXTV9JTlBVVCks
CiAJSFdNT05fQ0hBTk5FTF9JTkZPKGZhbiwgSFdNT05fRl9JTlBVVCB8IEhXTU9OX0ZfRkFVTFQg
fCBIV01PTl9GX0xBQkVMKSwKQEAgLTQ3NywyMCArNDcyLDEyIEBAIHN0YXRpYyBpbnQgYXhpX2Zh
bl9jb250cm9sX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKElTX0VS
UihjdGwtPmJhc2UpKQogCQlyZXR1cm4gUFRSX0VSUihjdGwtPmJhc2UpOwogCi0JY2xrID0gZGV2
bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOworCWNsayA9IGRldm1fY2xrX2dldF9lbmFibGVk
KCZwZGV2LT5kZXYsIE5VTEwpOwogCWlmIChJU19FUlIoY2xrKSkgewogCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJjbGtfZ2V0IGZhaWxlZCB3aXRoICVsZFxuIiwgUFRSX0VSUihjbGspKTsKIAkJcmV0
dXJuIFBUUl9FUlIoY2xrKTsKIAl9CiAKLQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoY2xrKTsK
LQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwotCi0JcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jl
c2V0KCZwZGV2LT5kZXYsIGF4aV9mYW5fY29udHJvbF9jbGtfZGlzYWJsZSwgY2xrKTsKLQlpZiAo
cmV0KQotCQlyZXR1cm4gcmV0OwotCiAJY3RsLT5jbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShjbGsp
OwogCWlmICghY3RsLT5jbGtfcmF0ZSkKIAkJcmV0dXJuIC1FSU5WQUw7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2h3bW9uL2x0YzI5NDctY29yZS5jIGIvZHJpdmVycy9od21vbi9sdGMyOTQ3LWNvcmUu
YwppbmRleCA1NDIzNDY2ZGU2OTcuLjYyNmY1YmYyYzljNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9o
d21vbi9sdGMyOTQ3LWNvcmUuYworKysgYi9kcml2ZXJzL2h3bW9uL2x0YzI5NDctY29yZS5jCkBA
IC05NTYsMTMgKzk1Niw2IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpsdGMyOTQ3X2F0dHJz
W10gPSB7CiB9OwogQVRUUklCVVRFX0dST1VQUyhsdGMyOTQ3KTsKIAotc3RhdGljIHZvaWQgbHRj
Mjk0N19jbGtfZGlzYWJsZSh2b2lkICpkYXRhKQotewotCXN0cnVjdCBjbGsgKmV4dGNsayA9IGRh
dGE7Ci0KLQljbGtfZGlzYWJsZV91bnByZXBhcmUoZXh0Y2xrKTsKLX0KLQogc3RhdGljIGludCBs
dGMyOTQ3X3NldHVwKHN0cnVjdCBsdGMyOTQ3X2RhdGEgKnN0KQogewogCWludCByZXQ7CkBAIC05
ODksNyArOTgyLDcgQEAgc3RhdGljIGludCBsdGMyOTQ3X3NldHVwKHN0cnVjdCBsdGMyOTQ3X2Rh
dGEgKnN0KQogCQlyZXR1cm4gcmV0OwogCiAJLyogY2hlY2sgZXh0ZXJuYWwgY2xvY2sgcHJlc2Vu
Y2UgKi8KLQlleHRjbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoc3QtPmRldiwgTlVMTCk7CisJ
ZXh0Y2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQoc3QtPmRldiwgTlVMTCk7CiAJ
aWYgKElTX0VSUihleHRjbGspKQogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShzdC0+ZGV2LCBQVFJf
RVJSKGV4dGNsayksCiAJCQkJICAgICAiRmFpbGVkIHRvIGdldCBleHRlcm5hbCBjbG9ja1xuIik7
CkBAIC0xMDA3LDE0ICsxMDAwLDYgQEAgc3RhdGljIGludCBsdGMyOTQ3X3NldHVwKHN0cnVjdCBs
dGMyOTQ3X2RhdGEgKnN0KQogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0KIAotCQlyZXQgPSBjbGtf
cHJlcGFyZV9lbmFibGUoZXh0Y2xrKTsKLQkJaWYgKHJldCkKLQkJCXJldHVybiByZXQ7Ci0KLQkJ
cmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHN0LT5kZXYsIGx0YzI5NDdfY2xrX2Rpc2Fi
bGUsCi0JCQkJCSAgICAgICBleHRjbGspOwotCQlpZiAocmV0KQotCQkJcmV0dXJuIHJldDsKIAkJ
LyogYXMgaW4gdGFibGUgMSBvZiB0aGUgZGF0YXNoZWV0ICovCiAJCWlmIChyYXRlX2h6ID49IExU
QzI5NDdfQ0xLX01JTiAmJiByYXRlX2h6IDw9IDEwMDAwMDApCiAJCQlwcmUgPSAwOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9od21vbi9tcjc1MjAzLmMgYi9kcml2ZXJzL2h3bW9uL21yNzUyMDMuYwpp
bmRleCAxYmExZTMxNDU5NjkuLjBjNjkxZjI5MWE2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9od21v
bi9tcjc1MjAzLmMKKysrIGIvZHJpdmVycy9od21vbi9tcjc1MjAzLmMKQEAgLTQ2MSwyNCArNDYx
LDYgQEAgc3RhdGljIGludCBwdnRfZ2V0X3JlZ21hcChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LCBjaGFyICpyZWdfbmFtZSwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIHZvaWQgcHZ0X2Ns
a19kaXNhYmxlKHZvaWQgKmRhdGEpCi17Ci0Jc3RydWN0IHB2dF9kZXZpY2UgKnB2dCA9IGRhdGE7
Ci0KLQljbGtfZGlzYWJsZV91bnByZXBhcmUocHZ0LT5jbGspOwotfQotCi1zdGF0aWMgaW50IHB2
dF9jbGtfZW5hYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHB2dF9kZXZpY2UgKnB2dCkK
LXsKLQlpbnQgcmV0OwotCi0JcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHB2dC0+Y2xrKTsKLQlp
ZiAocmV0KQotCQlyZXR1cm4gcmV0OwotCi0JcmV0dXJuIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNl
dChkZXYsIHB2dF9jbGtfZGlzYWJsZSwgcHZ0KTsKLX0KLQogc3RhdGljIHZvaWQgcHZ0X3Jlc2V0
X2NvbnRyb2xfYXNzZXJ0KHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IHB2dF9kZXZpY2UgKnB2dCA9
IGRhdGE7CkBAIC01MTUsMTYgKzQ5NywxMCBAQCBzdGF0aWMgaW50IG1yNzUyMDNfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0J
cHZ0LT5jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCBOVUxMKTsKKwlwdnQtPmNsayA9IGRldm1fY2xr
X2dldF9lbmFibGVkKGRldiwgTlVMTCk7CiAJaWYgKElTX0VSUihwdnQtPmNsaykpCiAJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwdnQtPmNsayksICJmYWlsZWQgdG8gZ2V0IGNs
b2NrXG4iKTsKIAotCXJldCA9IHB2dF9jbGtfZW5hYmxlKGRldiwgcHZ0KTsKLQlpZiAocmV0KSB7
Ci0JCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBjbG9ja1xuIik7Ci0JCXJldHVybiBy
ZXQ7Ci0JfQotCiAJcHZ0LT5yc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZShk
ZXYsIE5VTEwpOwogCWlmIChJU19FUlIocHZ0LT5yc3QpKQogCQlyZXR1cm4gZGV2X2Vycl9wcm9i
ZShkZXYsIFBUUl9FUlIocHZ0LT5yc3QpLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9zcGFy
eDUtdGVtcC5jIGIvZHJpdmVycy9od21vbi9zcGFyeDUtdGVtcC5jCmluZGV4IDk4YmU0OGUzYTIy
YS4uMDRmZDg1MDVlNWQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2h3bW9uL3NwYXJ4NS10ZW1wLmMK
KysrIGIvZHJpdmVycy9od21vbi9zcGFyeDUtdGVtcC5jCkBAIC0yNiwxMyArMjYsNiBAQCBzdHJ1
Y3QgczVfaHdtb24gewogCXN0cnVjdCBjbGsgKmNsazsKIH07CiAKLXN0YXRpYyB2b2lkIHM1X3Rl
bXBfY2xrX2Rpc2FibGUodm9pZCAqZGF0YSkKLXsKLQlzdHJ1Y3QgY2xrICpjbGsgPSBkYXRhOwot
Ci0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNsayk7Ci19Ci0KIHN0YXRpYyB2b2lkIHM1X3RlbXBf
ZW5hYmxlKHN0cnVjdCBzNV9od21vbiAqaHdtb24pCiB7CiAJdTMyIHZhbCA9IHJlYWRsKGh3bW9u
LT5iYXNlICsgVEVNUF9DRkcpOwpAQCAtMTEzLDcgKzEwNiw2IEBAIHN0YXRpYyBpbnQgczVfdGVt
cF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBkZXZpY2Ug
Kmh3bW9uX2RldjsKIAlzdHJ1Y3QgczVfaHdtb24gKmh3bW9uOwotCWludCByZXQ7CiAKIAlod21v
biA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmh3bW9uKSwgR0ZQX0tFUk5FTCk7
CiAJaWYgKCFod21vbikKQEAgLTEyMywxOSArMTE1LDEwIEBAIHN0YXRpYyBpbnQgczVfdGVtcF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChJU19FUlIoaHdtb24tPmJh
c2UpKQogCQlyZXR1cm4gUFRSX0VSUihod21vbi0+YmFzZSk7CiAKLQlod21vbi0+Y2xrID0gZGV2
bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOworCWh3bW9uLT5jbGsgPSBkZXZtX2Nsa19nZXRf
ZW5hYmxlZCgmcGRldi0+ZGV2LCBOVUxMKTsKIAlpZiAoSVNfRVJSKGh3bW9uLT5jbGspKQogCQly
ZXR1cm4gUFRSX0VSUihod21vbi0+Y2xrKTsKIAotCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZSho
d21vbi0+Y2xrKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwotCi0JcmV0ID0gZGV2bV9hZGRf
YWN0aW9uX29yX3Jlc2V0KCZwZGV2LT5kZXYsIHM1X3RlbXBfY2xrX2Rpc2FibGUsCi0JCQkJICAg
ICAgIGh3bW9uLT5jbGspOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7Ci0KIAlzNV90ZW1wX2Vu
YWJsZShod21vbik7CiAKIAlod21vbl9kZXYgPSBkZXZtX2h3bW9uX2RldmljZV9yZWdpc3Rlcl93
aXRoX2luZm8oJnBkZXYtPmRldiwKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
