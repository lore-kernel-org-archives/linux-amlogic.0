Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB16C61D92
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Nov 2023 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nX8t9i9naEkoTHXttfo6vtb//2shE3xTO1qn56tQLQQ=; b=uBLnHubRRT0eKI
	01sBYDOPoY20FXfbKO3NefAU6UjIL6Slb/AC5I9woomYYavFvRRdFeYCoJWSvwyuHGXL3FpeP5n0J
	0CfA0jBuPGuBwGixaWFFdM1nmPgxKEYziYYCvEJTOvWE/2IzB1NdxAAh3zLoMMczZFs5OlfumDOaH
	fzy5CNeRZPnJrz0xkFNfnmdMdEv2r00HQ6D2Zh7cXz2mDw+W0m7dZw6HyFHNOMmHWSYe8kBSOLoEg
	Zl2OIR3oVsdzcKz8DkKUiR/18ovPcwkMREFIPeR28LZ3NMjhqbDmL1cKUmbjHGioYF8nAUbIjdKaq
	QAOjR6q0nD42fAp2q7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RBr-00GvmI-10;
	Tue, 21 Nov 2023 13:53:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RAg-00GuRo-0c
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Nov 2023 13:52:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAY-0005zl-FC; Tue, 21 Nov 2023 14:52:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAV-00Ab0e-35; Tue, 21 Nov 2023 14:51:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAU-004xfT-Q9; Tue, 21 Nov 2023 14:51:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v3 069/108] pwm: meson: Make use of devm_pwmchip_alloc() function
Date: Tue, 21 Nov 2023 14:50:11 +0100
Message-ID: <20231121134901.208535-70-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iT0/+e4OYwkndR6FY1kdSGnWNKnW5iEtUQudVFeGmxU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLWYAZktdvRW17kUyXKlLA4fWXYXjvCwdtdjQ +P+RPnqI9uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1mAAKCRCPgPtYfRL+ Tuh+B/9pq4qyYChMcfUno2k+6J1gG+qo6PSb8SRknmBdEZ91xWQqfF68dgWrNNPjWbJ/N3VnDN6 jZ8vpDkoECf0W8TFlX+2HT21WZKcYIU+klX5Bl2M0BTSzvJor9BAz1AmAdza9IHL8YzJgUeRt8d 4B+NTVjhY6tsOeM1WsQ5V3E8g5QJlynb6EJg8IXykzF/VpmCvZH0opmbFGBacZgV7egpwKvITia 6jEeQ516Jl3KOkVeaeV/LKfb9xA273tZ2Ia4/c6og/gwms59C60vviPR59rA03oVqdoXNu8kie5 qrvOqractZT7py87mw0FVJRZm6/lnNXyb9QODu6H0mlo2Kxi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_055210_254505_CBCD5D23 
X-CRM114-Status: GOOD (  16.74  )
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
ZTYzNzk5Li5hZTQyYTdkOWY2MzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5j
CisrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCkBAIC0xMDIsNyArMTAyLDYgQEAgc3RydWN0
IG1lc29uX3B3bV9kYXRhIHsKIH07CiAKIHN0cnVjdCBtZXNvbl9wd20gewotCXN0cnVjdCBwd21f
Y2hpcCBjaGlwOwogCWNvbnN0IHN0cnVjdCBtZXNvbl9wd21fZGF0YSAqZGF0YTsKIAlzdHJ1Y3Qg
bWVzb25fcHdtX2NoYW5uZWwgY2hhbm5lbHNbTUVTT05fTlVNX1BXTVNdOwogCXZvaWQgX19pb21l
bSAqYmFzZTsKQEAgLTExNSw3ICsxMTQsNyBAQCBzdHJ1Y3QgbWVzb25fcHdtIHsKIAogc3RhdGlj
IGlubGluZSBzdHJ1Y3QgbWVzb25fcHdtICp0b19tZXNvbl9wd20oc3RydWN0IHB3bV9jaGlwICpj
aGlwKQogewotCXJldHVybiBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0IG1lc29uX3B3bSwgY2hp
cCk7CisJcmV0dXJuIHB3bWNoaXBfcHJpdihjaGlwKTsKIH0KIAogc3RhdGljIGludCBtZXNvbl9w
d21fcmVxdWVzdChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20p
CkBAIC00NDksNyArNDQ4LDcgQEAgc3RhdGljIGludCBtZXNvbl9wd21faW5pdF9jaGFubmVscyhz
dHJ1Y3QgcHdtX2NoaXAgKmNoaXApCiAJCW11eF9wYXJlbnRfZGF0YVtpXS5uYW1lID0gbWVzb24t
PmRhdGEtPnBhcmVudF9uYW1lc1tpXTsKIAl9CiAKLQlmb3IgKGkgPSAwOyBpIDwgbWVzb24tPmNo
aXAubnB3bTsgaSsrKSB7CisJZm9yIChpID0gMDsgaSA8IGNoaXAtPm5wd207IGkrKykgewogCQlz
dHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwgKmNoYW5uZWwgPSAmbWVzb24tPmNoYW5uZWxzW2ldOwog
CQlzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIGRpdl9wYXJlbnQgPSB7fSwgZ2F0ZV9wYXJlbnQgPSB7
fTsKIAkJc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHt9OwpAQCAtNTM1LDI5ICs1MzQsMjkg
QEAgc3RhdGljIGludCBtZXNvbl9wd21faW5pdF9jaGFubmVscyhzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXApCiAKIHN0YXRpYyBpbnQgbWVzb25fcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiB7CisJc3RydWN0IHB3bV9jaGlwICpjaGlwOwogCXN0cnVjdCBtZXNvbl9wd20gKm1l
c29uOwogCWludCBlcnI7CiAKLQltZXNvbiA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXpl
b2YoKm1lc29uKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFtZXNvbikKLQkJcmV0dXJuIC1FTk9NRU07
CisJY2hpcCA9IGRldm1fcHdtY2hpcF9hbGxvYygmcGRldi0+ZGV2LCBNRVNPTl9OVU1fUFdNUywg
c2l6ZW9mKCptZXNvbikpOworCWlmIChJU19FUlIoY2hpcCkpCisJCXJldHVybiBQVFJfRVJSKGNo
aXApOworCW1lc29uID0gdG9fbWVzb25fcHdtKGNoaXApOwogCiAJbWVzb24tPmJhc2UgPSBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7CiAJaWYgKElTX0VSUihtZXNvbi0+
YmFzZSkpCiAJCXJldHVybiBQVFJfRVJSKG1lc29uLT5iYXNlKTsKIAogCXNwaW5fbG9ja19pbml0
KCZtZXNvbi0+bG9jayk7Ci0JbWVzb24tPmNoaXAuZGV2ID0gJnBkZXYtPmRldjsKLQltZXNvbi0+
Y2hpcC5vcHMgPSAmbWVzb25fcHdtX29wczsKLQltZXNvbi0+Y2hpcC5ucHdtID0gTUVTT05fTlVN
X1BXTVM7CisJY2hpcC0+b3BzID0gJm1lc29uX3B3bV9vcHM7CiAKIAltZXNvbi0+ZGF0YSA9IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKIAotCWVyciA9IG1lc29uX3B3bV9p
bml0X2NoYW5uZWxzKCZtZXNvbi0+Y2hpcCk7CisJZXJyID0gbWVzb25fcHdtX2luaXRfY2hhbm5l
bHMoY2hpcCk7CiAJaWYgKGVyciA8IDApCiAJCXJldHVybiBlcnI7CiAKLQllcnIgPSBkZXZtX3B3
bWNoaXBfYWRkKCZwZGV2LT5kZXYsICZtZXNvbi0+Y2hpcCk7CisJZXJyID0gZGV2bV9wd21jaGlw
X2FkZCgmcGRldi0+ZGV2LCBjaGlwKTsKIAlpZiAoZXJyIDwgMCkgewogCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgUFdNIGNoaXA6ICVkXG4iLCBlcnIpOwogCQlyZXR1
cm4gZXJyOwotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
