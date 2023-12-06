Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7C6C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Dec 2023 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jkV8jyHovoAV24jA6mx5fWUyu6t9FFzLvWRX10cfdso=; b=XSkpRw04aIOCTM
	8HWvBxNMtseOFSe0R2zo11hGm80jvtp4qS07TpuozZi8o1wVa2dFIBVWRgmNETusMhVdLFN2yWkkD
	ZJiV8I4K0qgG7RXtrtl/P2rtvxh+RSgrWJ4cyGNVOt0axhUIzNr7Rj1HlnovYj4+W5bIWgm6cqP7U
	0iIKmmDNMVu8ZIVjp+iFt1ip1uz1GIbaRtGmL06NyrJt5yX5dRzcYpOgU5T9+KwO7EpYsVJkU360p
	D4OJpLEEFGCpp2UgrK+8gT9a79DlTS4SsT9q5HnaPCNZwLAdqAZSCjGZlMOCkCdlFNkFoBmdbJc9L
	6/AxcnNdVaKn/7Tv0VqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAzl2-00BM47-0n;
	Wed, 06 Dec 2023 21:48:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAzkw-00BM3S-0B
	for linux-amlogic@lists.infradead.org;
	Wed, 06 Dec 2023 21:48:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAzkq-0006V7-IU; Wed, 06 Dec 2023 22:48:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAzko-00E2zQ-W9; Wed, 06 Dec 2023 22:48:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAzko-00Fh9M-LU; Wed, 06 Dec 2023 22:48:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] pwm: meson: Simplify using dev_err_probe()
Date: Wed,  6 Dec 2023 22:48:18 +0100
Message-ID: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2883; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Tn8Hd9ONNtE2oPg+bCO9zcBlXllZPjUZaxCmuYjP46A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcOwiRLiLQc7W+J0r7gA8aypN9RAAEHybHtcjb dHsEK9S3y+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXDsIgAKCRCPgPtYfRL+ Ts2SB/91J0AnPhUkJn5Q3Y5TPHeY4M+MGzxkgGMZ8h8+ulbkSg9UD+Vgpx4wsFEbFTYNiAgOB2X 6GSLD0Nw01kYXexbtt7HqvcyB60mYDzrbRORULe8LS/2WLxCFW9UbvHZG9kh2Q5UnrUoPOJH/Of c+9IDyQ6Xfof38BCSRziGrP069PbbllwC7XxzzeK3uIq4/uhH4PA57w+l1caH75Q7c7stFqF7Ur gSjFqvCS+pQCqMpF/Ca/i8oVOWE0u9lkJg4L5J/baNVCY4vWH0rbcYai/nL+QjCOCljt/fHATZQ TimH1zz1JNxJNaQj3YqOhUT/wuPOSl8mesSFHSr7A8QXPUT9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_134834_114186_27408314 
X-CRM114-Status: GOOD (  13.51  )
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

VXNpbmcgZGV2X2Vycl9wcm9iZSgpIGVtaXR0aW5nIGFuIGVycm9yIG1lc3NhZ2UgbWVudGlvbmlu
ZyBhIHJldHVybgp2YWx1ZSBhbmQgcmV0dXJuaW5nIHRoYXQgdmFsdWUgY2FuIGJlIGRvbmUgaW4g
YSBzaW5nbGUgc3RhdGVtZW50LiBNYWtlCnVzZSBvZiB0aGF0IHRvIHNpbXBsaWZ5IHRoZSBwcm9i
ZSBwYXJ0IG9mIHRoZSBkcml2ZXIuIFRoaXMgaGFzIHRoZQphZGRpdGlvbmFsIGFkdmFudGFnZSB0
byBlbWl0IHRoZSBzeW1ib2xpYyBuYW1lIGZvciB0aGUgZXJyb3IgaW5zdGVhZCBvZgp0aGUgaW50
ZWdlciBlcnJvciB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQpIZWxsbywKCndoaWxlIHRyeWluZyB0byB1
bmRlcnN0YW5kIEplcm9tZSdzIHNlcmllc1sxXSBJIG5vdGljZWQgdGhpcyBwYXRjaApvcHBvcnR1
bml0eS4KCkJlc3QgcmVnYXJkcwpVd2UKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1wd20vMjAyMzExMjkxMzQwMDQuMzY0MjEyMS0xLWpicnVuZXRAYmF5bGlicmUuY29tCgogZHJp
dmVycy9wd20vcHdtLW1lc29uLmMgfCAzNSArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1l
c29uLmMKaW5kZXggNWJlYTUzMjQzZWQyLi4yOTcxYmJmM2I1ZTcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvcHdtL3B3bS1tZXNvbi5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCkBAIC00Njgs
MTAgKzQ2OCw5IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHMoc3RydWN0IG1l
c29uX3B3bSAqbWVzb24pCiAJCWNoYW5uZWwtPm11eC5ody5pbml0ID0gJmluaXQ7CiAKIAkJZXJy
ID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXIoZGV2LCAmY2hhbm5lbC0+bXV4Lmh3KTsKLQkJaWYgKGVy
cikgewotCQkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgJXM6ICVkXG4iLCBuYW1l
LCBlcnIpOwotCQkJcmV0dXJuIGVycjsKLQkJfQorCQlpZiAoZXJyKQorCQkJcmV0dXJuIGRldl9l
cnJfcHJvYmUoZGV2LCBlcnIsCisJCQkJCSAgICAgImZhaWxlZCB0byByZWdpc3RlciAlc1xuIiwg
bmFtZSk7CiAKIAkJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAiJXMjZGl2JXUiLCBkZXZf
bmFtZShkZXYpLCBpKTsKIApAQCAtNDkxLDEwICs0OTAsOSBAQCBzdGF0aWMgaW50IG1lc29uX3B3
bV9pbml0X2NoYW5uZWxzKHN0cnVjdCBtZXNvbl9wd20gKm1lc29uKQogCQljaGFubmVsLT5kaXYu
bG9jayA9ICZtZXNvbi0+bG9jazsKIAogCQllcnIgPSBkZXZtX2Nsa19od19yZWdpc3RlcihkZXYs
ICZjaGFubmVsLT5kaXYuaHcpOwotCQlpZiAoZXJyKSB7Ci0JCQlkZXZfZXJyKGRldiwgImZhaWxl
ZCB0byByZWdpc3RlciAlczogJWRcbiIsIG5hbWUsIGVycik7Ci0JCQlyZXR1cm4gZXJyOwotCQl9
CisJCWlmIChlcnIpCisJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIGVyciwKKwkJCQkJICAg
ICAiZmFpbGVkIHRvIHJlZ2lzdGVyICVzXG4iLCBuYW1lKTsKIAogCQlzbnByaW50ZihuYW1lLCBz
aXplb2YobmFtZSksICIlcyNnYXRlJXUiLCBkZXZfbmFtZShkZXYpLCBpKTsKIApAQCAtNTEzLDE3
ICs1MTEsMTMgQEAgc3RhdGljIGludCBtZXNvbl9wd21faW5pdF9jaGFubmVscyhzdHJ1Y3QgbWVz
b25fcHdtICptZXNvbikKIAkJY2hhbm5lbC0+Z2F0ZS5sb2NrID0gJm1lc29uLT5sb2NrOwogCiAJ
CWVyciA9IGRldm1fY2xrX2h3X3JlZ2lzdGVyKGRldiwgJmNoYW5uZWwtPmdhdGUuaHcpOwotCQlp
ZiAoZXJyKSB7Ci0JCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciAlczogJWRcbiIs
IG5hbWUsIGVycik7Ci0JCQlyZXR1cm4gZXJyOwotCQl9CisJCWlmIChlcnIpCisJCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIGVyciwgImZhaWxlZCB0byByZWdpc3RlciAlc1xuIiwgbmFtZSk7
CiAKIAkJY2hhbm5lbC0+Y2xrID0gZGV2bV9jbGtfaHdfZ2V0X2NsayhkZXYsICZjaGFubmVsLT5n
YXRlLmh3LCBOVUxMKTsKLQkJaWYgKElTX0VSUihjaGFubmVsLT5jbGspKSB7Ci0JCQllcnIgPSBQ
VFJfRVJSKGNoYW5uZWwtPmNsayk7Ci0JCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3Rl
ciAlczogJWRcbiIsIG5hbWUsIGVycik7Ci0JCQlyZXR1cm4gZXJyOwotCQl9CisJCWlmIChJU19F
UlIoY2hhbm5lbC0+Y2xrKSkKKwkJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihj
aGFubmVsLT5jbGspLAorCQkJCQkgICAgICJmYWlsZWQgdG8gcmVnaXN0ZXIgJXNcbiIsIG5hbWUp
OwogCX0KIAogCXJldHVybiAwOwpAQCAtNTU0LDEwICs1NDgsOSBAQCBzdGF0aWMgaW50IG1lc29u
X3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gZXJyOwog
CiAJZXJyID0gZGV2bV9wd21jaGlwX2FkZCgmcGRldi0+ZGV2LCAmbWVzb24tPmNoaXApOwotCWlm
IChlcnIgPCAwKSB7Ci0JCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBQ
V00gY2hpcDogJWRcbiIsIGVycik7Ci0JCXJldHVybiBlcnI7Ci0JfQorCWlmIChlcnIgPCAwKQor
CQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBlcnIsCisJCQkJICAgICAiZmFpbGVk
IHRvIHJlZ2lzdGVyIFBXTSBjaGlwXG4iKTsKIAogCXJldHVybiAwOwogfQotLSAKMi40Mi4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
