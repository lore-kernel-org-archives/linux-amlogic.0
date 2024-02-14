Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0C2C48BEB
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Feb 2024 09:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+N9gk9nrJS9mD5qZApvbwk/xr4qc3292DZa2r50o+I=; b=c2t10APWaWt5I+
	VY+jVyDL4OWZq0dkyMmxlAnZhSl8u4pIYe5x7NDBI3fYCta1kFLSv40ajpzALmHxIT1QXDd6R6jWg
	3ZGph6fl/YExZOwTg7IZnXtVx8in2VzZYaRXKJjFS2VITuCpO8zrcK8sLzPbiSqX+eP33vV75M7lL
	5ESAr83h7JRyGxpZV8teZZU/vDY8tzuMcNVCaCZxN378vfZur8Rd/2PS75ywktQs5+WEXUCK3a8Gq
	sdcUVv3iqQVEEqNSDlqJ6VDL3TJrNZPGcwu3a5DDw8Ltu1/HFxMa3cfbo8ept5rXIZxh8SYFKQP0N
	p7WXm2ZeRKF3soDH8ACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBhW-0000000CMdz-1BjG;
	Wed, 14 Feb 2024 09:37:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBf8-0000000CKSa-31Bs
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Feb 2024 09:34:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBey-000581-Ds; Wed, 14 Feb 2024 10:34:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBev-000fDD-3s; Wed, 14 Feb 2024 10:34:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBev-004Y4d-07;
	Wed, 14 Feb 2024 10:34:29 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-pwm@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v6 072/164] pwm: meson: Make use of devm_pwmchip_alloc() function
Date: Wed, 14 Feb 2024 10:31:59 +0100
Message-ID: <6cc57880e910e6ffd8df15bc4a41c42fe9523293.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2224; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=kX6EFouZB5MYYiTP4tBFnKgAGjASoigtowFicYD6b3E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIidWfVfn7Dw31SNgaFp2QH7liUSRq2yticDS k3FNJPT/eCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyInQAKCRCPgPtYfRL+ TjH1B/9AxarRd3srRCG4XrdO83IxtL0DmP5pCLuH6j5u/UYe7Kk+l/xY/+94TOtwPBYp1BTVmJI b6EzX4/KHExsWdsEzep5p8Jt5jyMcM6h4AbZN3kpYWXSdyfy9As0Im1B8t16p6iQEsYvb6CfAfR j3YKtbEnOMGLoUP8qPyIjd7SPTbTyNjf1Jo/yM43unho5vWK4C8Fmzm8NKbYgJcgBmoCYBphUMz t71ruog4QHRUlskKN6z24IDsiIJZp6I07JFTaTdmQe7XYxX/R/Ehn85k7cdijUmlvTs3YQZ60Ma 1IgMCwWM4ojT4nxudd55eWUf1X8Oc9u29UiMWvPxRZOvSSLj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_013442_843660_BEEBA563 
X-CRM114-Status: GOOD (  12.98  )
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
L3B3bS9wd20tbWVzb24uYyB8IDE5ICsrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKaW5kZXggOGY2N2Q2YmE0
NDNkLi40MGE1YjY0YzI2ZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCisr
KyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCkBAIC0xMDIsNyArMTAyLDYgQEAgc3RydWN0IG1l
c29uX3B3bV9kYXRhIHsKIH07CiAKIHN0cnVjdCBtZXNvbl9wd20gewotCXN0cnVjdCBwd21fY2hp
cCBjaGlwOwogCWNvbnN0IHN0cnVjdCBtZXNvbl9wd21fZGF0YSAqZGF0YTsKIAlzdHJ1Y3QgbWVz
b25fcHdtX2NoYW5uZWwgY2hhbm5lbHNbTUVTT05fTlVNX1BXTVNdOwogCXZvaWQgX19pb21lbSAq
YmFzZTsKQEAgLTExNSw3ICsxMTQsNyBAQCBzdHJ1Y3QgbWVzb25fcHdtIHsKIAogc3RhdGljIGlu
bGluZSBzdHJ1Y3QgbWVzb25fcHdtICp0b19tZXNvbl9wd20oc3RydWN0IHB3bV9jaGlwICpjaGlw
KQogewotCXJldHVybiBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0IG1lc29uX3B3bSwgY2hpcCk7
CisJcmV0dXJuIHB3bWNoaXBfZ2V0X2RydmRhdGEoY2hpcCk7CiB9CiAKIHN0YXRpYyBpbnQgbWVz
b25fcHdtX3JlcXVlc3Qoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAq
cHdtKQpAQCAtNTI5LDI5ICs1MjgsMjkgQEAgc3RhdGljIGludCBtZXNvbl9wd21faW5pdF9jaGFu
bmVscyhzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCiAKIHN0YXRpYyBpbnQgbWVzb25fcHdtX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CisJc3RydWN0IHB3bV9jaGlwICpjaGlw
OwogCXN0cnVjdCBtZXNvbl9wd20gKm1lc29uOwogCWludCBlcnI7CiAKLQltZXNvbiA9IGRldm1f
a3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKm1lc29uKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFt
ZXNvbikKLQkJcmV0dXJuIC1FTk9NRU07CisJY2hpcCA9IGRldm1fcHdtY2hpcF9hbGxvYygmcGRl
di0+ZGV2LCBNRVNPTl9OVU1fUFdNUywgc2l6ZW9mKCptZXNvbikpOworCWlmIChJU19FUlIoY2hp
cCkpCisJCXJldHVybiBQVFJfRVJSKGNoaXApOworCW1lc29uID0gdG9fbWVzb25fcHdtKGNoaXAp
OwogCiAJbWVzb24tPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7CiAJaWYgKElTX0VSUihtZXNvbi0+YmFzZSkpCiAJCXJldHVybiBQVFJfRVJSKG1lc29uLT5i
YXNlKTsKIAogCXNwaW5fbG9ja19pbml0KCZtZXNvbi0+bG9jayk7Ci0JbWVzb24tPmNoaXAuZGV2
ID0gJnBkZXYtPmRldjsKLQltZXNvbi0+Y2hpcC5vcHMgPSAmbWVzb25fcHdtX29wczsKLQltZXNv
bi0+Y2hpcC5ucHdtID0gTUVTT05fTlVNX1BXTVM7CisJY2hpcC0+b3BzID0gJm1lc29uX3B3bV9v
cHM7CiAKIAltZXNvbi0+ZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2
KTsKIAotCWVyciA9IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzKCZtZXNvbi0+Y2hpcCk7CisJZXJy
ID0gbWVzb25fcHdtX2luaXRfY2hhbm5lbHMoY2hpcCk7CiAJaWYgKGVyciA8IDApCiAJCXJldHVy
biBlcnI7CiAKLQllcnIgPSBkZXZtX3B3bWNoaXBfYWRkKCZwZGV2LT5kZXYsICZtZXNvbi0+Y2hp
cCk7CisJZXJyID0gZGV2bV9wd21jaGlwX2FkZCgmcGRldi0+ZGV2LCBjaGlwKTsKIAlpZiAoZXJy
IDwgMCkKIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgZXJyLAogCQkJCSAgICAg
ImZhaWxlZCB0byByZWdpc3RlciBQV00gY2hpcFxuIik7Ci0tIAoyLjQzLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
