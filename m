Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8606C48260
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jan 2024 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmscLgaBK1U/+A/XXQvWWCwvuby0NTXaOc6Im8Od42c=; b=Kw1E4QR+Podewo
	S64ZyLaEYFAIwr1xhAsfjHCV/0mPQ1vp4vH4w6blCOvs6lr1TY4zT1ZIngbZH5j3/qbcu/KF8ssy8
	oktIFwlx2X/eSWcZn+6Fg7LQSwEHl1tdjKYF/Lg8ZdTYw+lQpvvzQog1AmIUbqTfP17udTy/RcDm0
	IM6NVafvqP92IcrKARrx5GyWS/AKXvIore6O+c7KNtbXoBwwqD2+9Q1OhKwdzbYs3DzJHqPpNIF3L
	ASgWD0wnIdvdT4iIA6mexeTttL7B5jZZSeA3iYFsRLlXJAEXT8wUJzvGlqn7ik0DSAr5YOyM1H37z
	tAprWqH6fWLXx1FlZ3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0PM-00000000FHJ-05Gh;
	Thu, 25 Jan 2024 14:08:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Oe-00000000Exx-46nv
	for linux-amlogic@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DoBDSizlhGxg56AeVJwqv1E1op+2VJ/F7USVHLvNloM=; b=so5DE47wgPcktlEwtbxCDuT44I
	zDMoj9XPlvQZxbvlz504QJEm3/ar+cSvTWMux9dO9Zvw+42aNgN6GzmDF9bhXnaVqKjy4Apn2Lab9
	FOz9w3EC1ZRrP7YuMVIqRKHGDYQs7ReC86oN3ySeQ2gTxfZswY0D/ifginQzkK9UcZizfrIHSlh7M
	SolI41quM/uyl/5QFhRpclmq2MAgkKbcLLTRHxPQ5NqE+FX2v89V7NH5WF9hv4xcilYNLeuT+uxKc
	GCYkzn/l4fJDrsAqfY2eYbRQPTrUAascyNRnseThohBttZuqyLGKIf/82ybh4uzRt3lhqZyHLAFNo
	+kg9xK8A==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSybh-00000009sDZ-3gNT
	for linux-amlogic@lists.infradead.org;
	Thu, 25 Jan 2024 12:13:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZL-0004RC-OT; Thu, 25 Jan 2024 13:10:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZK-002HTN-8J; Thu, 25 Jan 2024 13:10:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZK-007n2y-0X;
	Thu, 25 Jan 2024 13:10:54 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-pwm@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v5 072/111] pwm: meson: Make use of devm_pwmchip_alloc() function
Date: Thu, 25 Jan 2024 13:09:34 +0100
Message-ID: <bf6f7c6253041f60ee8f35b5c9c9e8d595332fb0.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2615; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=tbf+Q2Gxrb81SZI03PQrpWoV9hGmidTqVonqvgzF990=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk+Ps9GWUz16FfY73NvDjTCMhYVcOfguNy68z bzG8PvGCR2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPjwAKCRCPgPtYfRL+ TqjuCACTkTZutcwEYIAetP5/AnxvzOgESXYd5G4R2im/Y3HsmdptBtCo5AOOfuzXrbfejfnh74I iG5FTd+XcdAShxd3o91Yiv5Fc6ktPwv3ckxk+GDnd/y0+EKX9jAlgMP7ggC14b0Xg7MCL253ufx q0lV7JWwmrNn9n82i9O6PrzwH1IjQ5ZT6gNjm6ANh7oqn728Wk09If78UNy1De8YxVH+XLA5Bqz FLdS4pu+lb/I1bpLoTRfLI3rTuNAD3HGo6E/fAbexVkcUT0hJGYBbHEjJd7Y1NQ5YvDDwR169/2 DpoAM+Klwutd44wmbOSqFnbswNBAsYTAcmSJbij2W7ACJO0E
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_121323_573711_D1EF2747 
X-CRM114-Status: GOOD (  12.16  )
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
cnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKaW5kZXggZGQwZTE4
NDM3YmU5Li40MGE1YjY0YzI2ZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5j
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
ZW50ID0ge307CiAJCXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKQEAgLTUyOSwyOSAr
NTI4LDI5IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHMoc3RydWN0IHB3bV9j
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
cHdtY2hpcF9hZGQoJnBkZXYtPmRldiwgY2hpcCk7CiAJaWYgKGVyciA8IDApCiAJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIGVyciwKIAkJCQkgICAgICJmYWlsZWQgdG8gcmVnaXN0
ZXIgUFdNIGNoaXBcbiIpOwotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
