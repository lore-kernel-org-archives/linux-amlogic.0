Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D71CC10DC1
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Dec 2023 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8JTIyroCbOhmkby3VqsLTvi4uwYIS6TAHCUZ6Ua5q0=; b=o4ActpjOMbxtOs
	v7y4gASeXl32UckyHmxGeTh2Nsof4qwsgb5nAZCBMclXLUfn3nBePxbgis2PwATDjnYHX1m88pveN
	jmh8Erz8x+PAZZzGWYD513vlblva2dl9yUo1rd/QGlBvx1wYpuvYbtci3qkaOFLRj0HQHt5ZM1RDX
	8rGlVQtks6UWempt2QLv9i+rT04ova2jkMJT71Vlr9UyrNUHtVTNGVDnSUdhKHiPhjABvPpqc4aay
	3KPaZCJ6kdCm/pDUSrM/3xNj3HieveYbPDQY51WaLzC3DVnR5FXe7VZjUrm0ja9atGWR7Z1gtCEAo
	f/82on/gK4LL7udXMWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqPw-00A7rb-0n;
	Wed, 06 Dec 2023 11:50:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqOU-00A6Nl-1w
	for linux-amlogic@bombadil.infradead.org;
	Wed, 06 Dec 2023 11:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c9n4SEZCVPXQQDXyLWzJg3IUU8bz3KHBhLU2vHG3sPI=; b=jK5lLccem0zbbLw4zgIBquGC+W
	1XPHOyayDodurGDYdjaIl6sDM1xlSO+LtyQgwCWcdriOeep8w4z0+ToLdv8b+z0Y1MITYcPOmE8vy
	6tRSXR+3O6vOFIWqAyz71fClcvYog4rWjFZ29SryrX8h6wiC6gM0u3j1M53EAEpRPQQ3U25/27jwZ
	XHs2ZNtULsEm4v5t4gMoKVrDc4dpa/hHe/IbnlrII4tGuHuJiUaoBFeCaECi717NS1XRlobnvE7Cx
	qW3JpS1D93u8+06/PMu0dP5fRn0obTIhYJe5QWgWxEIgjPZAKzl/Zwk/vyN7AMU3kLxd/buA0RIQF
	HeFJa2eQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqOR-0059Wn-17
	for linux-amlogic@lists.infradead.org;
	Wed, 06 Dec 2023 11:48:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOJ-00075H-KE; Wed, 06 Dec 2023 12:48:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOG-00Dww2-W1; Wed, 06 Dec 2023 12:48:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOG-00FR1R-MZ; Wed, 06 Dec 2023 12:48:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v4 075/115] pwm: meson: Make use of devm_pwmchip_alloc() function
Date: Wed,  6 Dec 2023 12:44:29 +0100
Message-ID: <513593a5a3d4169abfdabe36de966e5095edfd3b.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=Ue7uTWHXrmzSMDoSz9IIRmhParo0m7noVVdhB3JyFFM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF7vxeYCUx6b41zw71jBPl2OZ+JAcMvlG6qdo PQxFrMNnbSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBe7wAKCRCPgPtYfRL+ TpQoB/9jwwrVemdukqMpPIKwElv1MMey4NJFPvPG1p0tIYmn+U/Z5Z3oV489iLR0av9F66/FnDO xbLWKh+pioz8cfA1T14ObcO+NG7FDxTIofmGuJJ7BzYf2+NMCn92IFjMHnzXbkAjo+w+lzMjeuG 3QGpJ3WakoDR3vwCcam1GShhWmR8AAUmTWh7PboEqBhVBOvrsE6nU57hsZtC3qm/NkrTKVtygtm LAu51/WUIMPiJveV6KFbstu247sEXwvNQQN1x5K0qh+ql699mwgA5/4W8L3WOUWrdIMHtstlpSP +LqUGZlG9XRJ76wm9xIOrwCHgxohWLky0FXG8FEbnbLGx15I
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_114843_517889_AD96B0F2 
X-CRM114-Status: GOOD (  16.23  )
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

VGhpcyBwcmVwYXJlcyB0aGUgcHdtLW1lc29uIGRyaXZlciB0byBmdXJ0aGVyIGNoYW5nZXMgb2Yg
dGhlIHB3bSBjb3JlCm91dGxpbmVkIGluIHRoZSBjb21taXQgaW50cm9kdWNpbmcgZGV2bV9wd21j
aGlwX2FsbG9jKCkuIFRoZXJlIGlzIG5vCmludGVuZGVkIHNlbWFudGljYWwgY2hhbmdlIGFuZCB0
aGUgZHJpdmVyIHNob3VsZCBiZWhhdmUgYXMgYmVmb3JlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJz
L3B3bS9wd20tbWVzb24uYyB8IDIxICsrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKaW5kZXggNjQwZDZm
ZTYzNzk5Li4xODdjZDZmMzVjY2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5j
CisrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCkBAIC0xMDIsNyArMTAyLDYgQEAgc3RydWN0
IG1lc29uX3B3bV9kYXRhIHsKIH07CiAKIHN0cnVjdCBtZXNvbl9wd20gewotCXN0cnVjdCBwd21f
Y2hpcCBjaGlwOwogCWNvbnN0IHN0cnVjdCBtZXNvbl9wd21fZGF0YSAqZGF0YTsKIAlzdHJ1Y3Qg
bWVzb25fcHdtX2NoYW5uZWwgY2hhbm5lbHNbTUVTT05fTlVNX1BXTVNdOwogCXZvaWQgX19pb21l
bSAqYmFzZTsKQEAgLTExNSw3ICsxMTQsNyBAQCBzdHJ1Y3QgbWVzb25fcHdtIHsKIAogc3RhdGlj
IGlubGluZSBzdHJ1Y3QgbWVzb25fcHdtICp0b19tZXNvbl9wd20oc3RydWN0IHB3bV9jaGlwICpj
aGlwKQogewotCXJldHVybiBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0IG1lc29uX3B3bSwgY2hp
cCk7CisJcmV0dXJuIHB3bWNoaXBfZ2V0X2RydmRhdGEoY2hpcCk7CiB9CiAKIHN0YXRpYyBpbnQg
bWVzb25fcHdtX3JlcXVlc3Qoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rldmlj
ZSAqcHdtKQpAQCAtNDQ5LDcgKzQ0OCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hh
bm5lbHMoc3RydWN0IHB3bV9jaGlwICpjaGlwKQogCQltdXhfcGFyZW50X2RhdGFbaV0ubmFtZSA9
IG1lc29uLT5kYXRhLT5wYXJlbnRfbmFtZXNbaV07CiAJfQogCi0JZm9yIChpID0gMDsgaSA8IG1l
c29uLT5jaGlwLm5wd207IGkrKykgeworCWZvciAoaSA9IDA7IGkgPCBjaGlwLT5ucHdtOyBpKysp
IHsKIAkJc3RydWN0IG1lc29uX3B3bV9jaGFubmVsICpjaGFubmVsID0gJm1lc29uLT5jaGFubmVs
c1tpXTsKIAkJc3RydWN0IGNsa19wYXJlbnRfZGF0YSBkaXZfcGFyZW50ID0ge30sIGdhdGVfcGFy
ZW50ID0ge307CiAJCXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKQEAgLTUzNSwyOSAr
NTM0LDI5IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHMoc3RydWN0IHB3bV9j
aGlwICpjaGlwKQogCiBzdGF0aWMgaW50IG1lc29uX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogeworCXN0cnVjdCBwd21fY2hpcCAqY2hpcDsKIAlzdHJ1Y3QgbWVzb25f
cHdtICptZXNvbjsKIAlpbnQgZXJyOwogCi0JbWVzb24gPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRl
diwgc2l6ZW9mKCptZXNvbiksIEdGUF9LRVJORUwpOwotCWlmICghbWVzb24pCi0JCXJldHVybiAt
RU5PTUVNOworCWNoaXAgPSBkZXZtX3B3bWNoaXBfYWxsb2MoJnBkZXYtPmRldiwgTUVTT05fTlVN
X1BXTVMsIHNpemVvZigqbWVzb24pKTsKKwlpZiAoSVNfRVJSKGNoaXApKQorCQlyZXR1cm4gUFRS
X0VSUihjaGlwKTsKKwltZXNvbiA9IHRvX21lc29uX3B3bShjaGlwKTsKIAogCW1lc29uLT5iYXNl
ID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwogCWlmIChJU19FUlIo
bWVzb24tPmJhc2UpKQogCQlyZXR1cm4gUFRSX0VSUihtZXNvbi0+YmFzZSk7CiAKIAlzcGluX2xv
Y2tfaW5pdCgmbWVzb24tPmxvY2spOwotCW1lc29uLT5jaGlwLmRldiA9ICZwZGV2LT5kZXY7Ci0J
bWVzb24tPmNoaXAub3BzID0gJm1lc29uX3B3bV9vcHM7Ci0JbWVzb24tPmNoaXAubnB3bSA9IE1F
U09OX05VTV9QV01TOworCWNoaXAtPm9wcyA9ICZtZXNvbl9wd21fb3BzOwogCiAJbWVzb24tPmRh
dGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7CiAKLQllcnIgPSBtZXNv
bl9wd21faW5pdF9jaGFubmVscygmbWVzb24tPmNoaXApOworCWVyciA9IG1lc29uX3B3bV9pbml0
X2NoYW5uZWxzKGNoaXApOwogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwogCi0JZXJyID0g
ZGV2bV9wd21jaGlwX2FkZCgmcGRldi0+ZGV2LCAmbWVzb24tPmNoaXApOworCWVyciA9IGRldm1f
cHdtY2hpcF9hZGQoJnBkZXYtPmRldiwgY2hpcCk7CiAJaWYgKGVyciA8IDApIHsKIAkJZGV2X2Vy
cigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIFBXTSBjaGlwOiAlZFxuIiwgZXJyKTsK
IAkJcmV0dXJuIGVycjsKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
