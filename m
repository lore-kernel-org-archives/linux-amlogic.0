Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2575C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Mar 2022 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXk3MeXAZ00+4DYPIP4IIr9Ca7SzroePrZotFYskb2I=; b=od8Y17DnWtswIO
	8apHpgYa20xYEaHE15ZlGnmDriXIljkZfqz7wwleFwngf5wFWgCMHSG3FJj3ZkJTFprH24qI3I1yM
	KLXbVLkRbVMesc/Bqicpzt1vqODdo5p1lVDeLkoYJhdV886oJHTNDJOSDB0tgcUc14RnGVh6Wk4Mv
	XI2JWKbLxVA9lIvkoltMJTfSkgLmivJTL0HKFfPuZu77QX6Idulg+Orlu1Hon3hGtm1Mjvf4Kdreg
	twGijFq6uom1TZDVKdW7U3Bjp8c8bpKSz2erfAE+RCVlzz1DVzijdzkGEf7paa8MYl5hwx7uud1S/
	+mH7NyXHziVgZ1iKXP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTlW1-005ciw-D3; Mon, 14 Mar 2022 14:17:41 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTlVZ-005cZ5-3a
 for linux-amlogic@lists.infradead.org; Mon, 14 Mar 2022 14:17:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVL-0004zV-JM; Mon, 14 Mar 2022 15:16:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVL-000f35-Nf; Mon, 14 Mar 2022 15:16:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVJ-0097ay-KN; Mon, 14 Mar 2022 15:16:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 08/16] drm/meson: dw-hdmi: Don't open code
 devm_clk_get_enabled()
Date: Mon, 14 Mar 2022 15:16:35 +0100
Message-Id: <20220314141643.22184-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666; i=uwe@kleine-koenig.org;
 h=from:subject; bh=YhET4fR0Omj8gJ/JCkSwUJxwvBYawy9/DlBkkMAAnOI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL04EyEHJOItayKHmew1fSM2xmrHq4+SWHnqUOQnS
 kKp0Dr2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9OBAAKCRDB/BR4rcrsCddkCA
 CAisftWSdUNCnYOFUA6r4wIsgWzLZYQ396YWYMZkQQBC6DXAThdrh1a/WIy8BEpr3wbFQNBL2loko5
 kJ2p6cWyeNYDVeKT7iRuClSG8JnvWw55qDtphq6pz4SQXK2Un3STKZc26NxmIoln93Yg+qfevK5WnG
 ydjVSz0wApZ769rEmeP45xTHd7rRYDiXWw4GeEeTvBR/alJGPVrpp2K6QqWMdJpae2GsFFRpULtrJe
 fSHYK6Yo5jEbhgaIu47FXZkBYBWfygDwv/BVwA3xd5S5kHHm+RAjQ0dodEJ8I/Rr9LbHYit2s4f5Je
 H3fc37FLniTUu0zu464M9/qguAsgrO
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_071713_175935_8C2F3018 
X-CRM114-Status: GOOD (  15.04  )
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
YW5kIHVucHJlcGFyZSkgdGhlIGNsb2NrLgoKVGhlcmUgaXMgc2xpZ2h0IGNoYW5nZSBpbiBiZWhh
dmlvciBhcyBhIGZhaWx1cmUgdG8gZW5hYmxlIHRoZSBjbG9jawpub3cgcmVzdWx0cyBpbiBhbiBl
cnJvciBtZXNzYWdlLCB0b28uIEFsc28gdGhlIGFjdHVhbCBlcnJvciBjb2RlIGlzIGFkZGVkCnRv
IHRoZSBtZXNzYWdlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
ZHdfaGRtaS5jIHwgNDggKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9kd19oZG1pLmMKaW5kZXggNWNkMmIyZWJiYmQzLi42MDM0ZTgwYzViMmUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwpAQCAtNjcwLDI5ICs2NzAsNiBAQCBzdGF0aWMg
dm9pZCBtZXNvbl9kaXNhYmxlX3JlZ3VsYXRvcih2b2lkICpkYXRhKQogCXJlZ3VsYXRvcl9kaXNh
YmxlKGRhdGEpOwogfQogCi1zdGF0aWMgdm9pZCBtZXNvbl9kaXNhYmxlX2Nsayh2b2lkICpkYXRh
KQotewotCWNsa19kaXNhYmxlX3VucHJlcGFyZShkYXRhKTsKLX0KLQotc3RhdGljIGludCBtZXNv
bl9lbmFibGVfY2xrKHN0cnVjdCBkZXZpY2UgKmRldiwgY2hhciAqbmFtZSkKLXsKLQlzdHJ1Y3Qg
Y2xrICpjbGs7Ci0JaW50IHJldDsKLQotCWNsayA9IGRldm1fY2xrX2dldChkZXYsIG5hbWUpOwot
CWlmIChJU19FUlIoY2xrKSkgewotCQlkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBnZXQgJXMgcGNs
a1xuIiwgbmFtZSk7Ci0JCXJldHVybiBQVFJfRVJSKGNsayk7Ci0JfQotCi0JcmV0ID0gY2xrX3By
ZXBhcmVfZW5hYmxlKGNsayk7Ci0JaWYgKCFyZXQpCi0JCXJldCA9IGRldm1fYWRkX2FjdGlvbl9v
cl9yZXNldChkZXYsIG1lc29uX2Rpc2FibGVfY2xrLCBjbGspOwotCi0JcmV0dXJuIHJldDsKLX0K
LQogc3RhdGljIGludCBtZXNvbl9kd19oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlICptYXN0ZXIsCiAJCQkJdm9pZCAqZGF0YSkKIHsKQEAgLTcwMiw2ICs2NzksNyBA
QCBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2UgKm1hc3RlciwKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGF0YTsKIAlzdHJ1
Y3QgbWVzb25fZHJtICpwcml2ID0gZHJtLT5kZXZfcHJpdmF0ZTsKIAlzdHJ1Y3QgZHdfaGRtaV9w
bGF0X2RhdGEgKmR3X3BsYXRfZGF0YTsKKwlzdHJ1Y3QgY2xrICpjbGs7CiAJaW50IGlycTsKIAlp
bnQgcmV0OwogCkBAIC03NjMsMTcgKzc0MSwyMyBAQCBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlf
YmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAlpZiAoSVNf
RVJSKG1lc29uX2R3X2hkbWktPmhkbWl0eCkpCiAJCXJldHVybiBQVFJfRVJSKG1lc29uX2R3X2hk
bWktPmhkbWl0eCk7CiAKLQlyZXQgPSBtZXNvbl9lbmFibGVfY2xrKGRldiwgImlzZnIiKTsKLQlp
ZiAocmV0KQotCQlyZXR1cm4gcmV0OworCWNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKGRldiwg
ImlzZnIiKTsKKwlpZiAoSVNfRVJSKGNsaykpIHsKKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8g
Z2V0IGVuYWJsZWQgaXNmciBwY2xrICglcGUpXG4iLCBjbGspOworCQlyZXR1cm4gUFRSX0VSUihj
bGspOworCX0KIAotCXJldCA9IG1lc29uX2VuYWJsZV9jbGsoZGV2LCAiaWFoYiIpOwotCWlmIChy
ZXQpCi0JCXJldHVybiByZXQ7CisJY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoZGV2LCAiaWFo
YiIpOworCWlmIChJU19FUlIoY2xrKSkgeworCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQg
ZW5hYmxlZCBpYWhiIHBjbGsgKCVwZSlcbiIsIGNsayk7CisJCXJldHVybiBQVFJfRVJSKGNsayk7
CisJfQogCi0JcmV0ID0gbWVzb25fZW5hYmxlX2NsayhkZXYsICJ2ZW5jaSIpOwotCWlmIChyZXQp
Ci0JCXJldHVybiByZXQ7CisJY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoZGV2LCAidmVuY2ki
KTsKKwlpZiAoSVNfRVJSKGNsaykpIHsKKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGVu
YWJsZWQgdmVuY2kgcGNsayAoJXBlKVxuIiwgY2xrKTsKKwkJcmV0dXJuIFBUUl9FUlIoY2xrKTsK
Kwl9CiAKIAlkd19wbGF0X2RhdGEtPnJlZ20gPSBkZXZtX3JlZ21hcF9pbml0KGRldiwgTlVMTCwg
bWVzb25fZHdfaGRtaSwKIAkJCQkJICAgICAgJm1lc29uX2R3X2hkbWlfcmVnbWFwX2NvbmZpZyk7
Ci0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
