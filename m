Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EEBC5DF87
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 07:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNtHo7MY5M6lJgyT280xodwBZhAMOaLNuJf+WHy8/CY=; b=wIHK2FHoKYQj3m
	ocTIiRxQJQAgUBUv4Uw2Dw6Pu/EfMm2b/odQQdXdSieZ7tb7ZYaGIk0M/SUgVfP4iHG0rLHkR4rhU
	EwY4QpBKMODgkNntErNOjCsufaksbIuBqYtDBzykFOHbub6gucwNHPz3caUt2svrVXbmvqYJGUXyj
	Ruu1Q+5Yw4rYmOhXoyRSmOafIhTxSXhkyzFuAWAkd0rEtxKkpBCQsXsarzKXWvKfhmvCDS/fGogpi
	pA8a78Q9DtwVnHyK1mpMTHvQedJosCp28hhXeOxpr8aZnU9bg3V/1Wdw+ItNjjOHBmR8/C7bNRqx9
	UuTQXbPl6Y/I7RHkhZHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJbj-0000000ChBc-1KAN;
	Fri, 21 Aug 2026 07:24:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJbi-0000000ChBO-08Sz
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 07:24:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4821D435BD;
	Fri, 21 Aug 2026 07:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F001F000E9;
	Fri, 21 Aug 2026 07:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787297045;
	bh=+D+0qgBaAp4Lhw/H/2MaR9l6LVKXMe7xTX1Wu+7ofBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MCS2d7zeLkq8f/BYkkLuOH7lsKtxZw0fVezKYEGaVikfwkseeE2HAhjjOob+4VFLX
	 VY6ggKMfA6grojdoFRXyTtqE06QzkTGglK/6SJflTYXGJgp60CTBMvACrruAtbolTM
	 ZcIMdxHqUsRJImIXxxIWawxfrNbDOSEwheQIOhoLvi/0b8gk/kqULXHmjrRnyeNMQu
	 IafgJU+SBO9IsbYKLqiCmUdvn0fMdn56K1FVrynRY47s4YGbbMsPo3bOZgqXZ9iHV4
	 cXpBdGl0ajez8eYvF43LLPxJh1pd9MpJ68P1t18XSZ+9m25ueS7aJYVlfHSthsNhcA
	 mdXfwuB/Jp0Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: rc: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
To: "Triet Hoang" <triet.hoang.dev@gmail.com>
Cc: linux-amlogic@lists.infradead.org, media-ci@linuxtv.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260821071533.215821-1-triet.hoang.dev@gmail.com>
References: <20260821071533.215821-1-triet.hoang.dev@gmail.com>
Date: Fri, 21 Aug 2026 07:24:04 +0000
Message-Id: <20260821072404.D5F001F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtMb3ddIElu
Y29ycmVjdCBQTSB3cmFwcGVyIG1hY3JvIHVzZWQgZm9yIHRoZSBkZXZfcG1fb3BzIHN0cnVjdHVy
ZSBwb2ludGVyLgoKUHJlLWV4aXN0aW5nIGlzc3VlczoKLSBbQ3JpdGljYWxdIFRoaXMgcHJvYmxl
bSB3YXNuJ3QgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgdGhlcmUgaXMgYSB1c2UtYWZ0
ZXItZnJlZSBvZiB0aGUgUkMgZGV2aWNlIG9uIGRyaXZlciByZW1vdmFsIGFuZCBwcm9iZSBlcnJv
ciBwYXRocyBkdWUgdG8gYW4gYWN0aXZlIGRldnJlcy1tYW5hZ2VkIElSUSBoYW5kbGVyLgotLQoK
LS0tIFBhdGNoIFsxXTogW1BBVENIXSBtZWRpYTogcmM6IENvbnZlcnQgdG8gREVGSU5FX1NJTVBM
RV9ERVZfUE1fT1BTKCkgLS0tCmNvbW1pdCA1YWQwMTNjZTQ3YjkwMWY0YmQ4YTUzYTFjMDJiMjIy
YThkZjY4NThhCkF1dGhvcjogVHJpZXQgSG9hbmcgPHRyaWV0LmhvYW5nLmRldkBnbWFpbC5jb20+
CgptZWRpYTogcmM6IENvbnZlcnQgdG8gREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKCkKCkNvbnZl
cnQgdGhlIGRlcHJlY2F0ZWQgU0lNUExFX0RFVl9QTV9PUFMgdG8gREVGSU5FX1NJTVBMRV9ERVZf
UE1fT1BTCmFuZCBwbV9zbGVlcF9wdHIoKS4gVGhpcyBsZXRzIHVzIGRyb3AgdGhlIF9fbWF5YmVf
dW51c2VkIGFubm90YXRpb25zCmZyb20gaXRzIHN1c3BlbmQgYW5kIHJlc3VtZSBjYWxsYmFja3Ms
IGFsc28gcmVkdWNlcyBrZXJuZWwgc2l6ZSBpbgpjYXNlIENPTkZJR19QTSBvciBDT05GSUdfUE1f
U0xFRVAgaXMgZGlzYWJsZWQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3JjL3N1bnhp
LWNpci5jIGIvZHJpdmVycy9tZWRpYS9yYy9zdW54aS1jaXIuYwo+IGluZGV4IDI4ZTg0MGE3ZTVi
OGMuLjdmZDQ4YzUxMDE0M2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9yYy9zdW54aS1j
aXIuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcmMvc3VueGktY2lyLmMKClsgLi4uIF0KCj4gQEAg
LTQyMiw3ICs0MjIsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdW54aV9pcl9k
cml2ZXIgPSB7Cj4gIAkuZHJpdmVyID0gewo+ICAJCS5uYW1lID0gU1VOWElfSVJfREVWLAo+ICAJ
CS5vZl9tYXRjaF90YWJsZSA9IHN1bnhpX2lyX21hdGNoLAo+IC0JCS5wbSA9ICZzdW54aV9pcl9w
bV9vcHMsCj4gKwkJLnBtID0gcG1fc2xlZXBfcHRyKCZzdW54aV9pcl9wbV9vcHMpLAoKW1NldmVy
aXR5OiBMb3ddCkRvZXMgdGhpcyBjb2RlIHVzZSB0aGUgY29ycmVjdCB3cmFwcGVyIG1hY3JvIGZv
ciBhIGRldl9wbV9vcHMgc3RydWN0dXJlCnBvaW50ZXI/IFNpbmNlIHN1bnhpX2lyX3BtX29wcyBp
cyBhIHN0cnVjdHVyZSBwb2ludGVyIHJhdGhlciB0aGFuIGEgc2xlZXAKY2FsbGJhY2ssIHNob3Vs
ZCBpdCB1c2UgcG1fcHRyKCkgaW5zdGVhZCBvZiBwbV9zbGVlcF9wdHIoKT8KCj4gIAl9LAo+ICB9
OwoKW1NldmVyaXR5OiBDcml0aWNhbF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0
IGNvdWxkIHRoZXJlIGJlIGEgdXNlLWFmdGVyLWZyZWUgb2YgdGhlIFJDCmRldmljZSBvbiBkcml2
ZXIgcmVtb3ZhbCBhbmQgcHJvYmUgZXJyb3IgcGF0aHM/CgpUaGUgZHJpdmVyIGluaXRpYWxpemVz
IGEgZGV2cmVzLW1hbmFnZWQgSVJRIGluIHN1bnhpX2lyX3Byb2JlKCk6CgoJcmV0ID0gZGV2bV9y
ZXF1ZXN0X2lycShkZXYsIGlyLT5pcnEsIHN1bnhpX2lyX2lycSwgMCwgU1VOWElfSVJfREVWLCBp
cik7CgpPbiBwcm9iZSBmYWlsdXJlIG9yIGR1cmluZyBzdW54aV9pcl9yZW1vdmUoKSwgdGhlIGRy
aXZlciBtYW51YWxseSBjYWxscwpyY191bnJlZ2lzdGVyX2RldmljZSgpIGFuZCByY19mcmVlX2Rl
dmljZSgpLCBmcmVlaW5nIHRoZSBSQyBkZXZpY2UgbWVtb3J5OgoKZXhpdF91bnJlZ2lzdGVyX2Rl
djoKCXJjX3VucmVnaXN0ZXJfZGV2aWNlKGlyLT5yYyk7CmV4aXRfZnJlZV9kZXY6CglyY19mcmVl
X2RldmljZShpci0+cmMpOwoKQmVjYXVzZSBkZXZyZXMgY2xlYW51cCBoYXMgbm90IHlldCBydW4s
IHRoZSBJUlEgcmVtYWlucyBhY3RpdmUuIElmIGFuCmludGVycnVwdCBmaXJlcyBvciBpcyBhbHJl
YWR5IGluLWZsaWdodCBvbiBhbm90aGVyIENQVSBkdXJpbmcgdGhpcyB3aW5kb3csCndvdWxkIHN1
bnhpX2lyX2lycSgpIGRlcmVmZXJlbmNlIHRoZSBmcmVlZCBpci0+cmM/CgoJaXJfcmF3X2V2ZW50
X292ZXJmbG93KGlyLT5yYyk7CgpBbHNvLCBjb3VsZCB0aGlzIHJlYWQgZnJvbSBkaXNhYmxlZCBo
YXJkd2FyZSBpZiBhbiBpbnRlcnJ1cHQgZmlyZXMgYWZ0ZXIKc3VueGlfaXJfaHdfZXhpdCgpIGlz
IGNhbGxlZD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjA4MjEwNzE1MzMuMjE1ODIxLTEtdHJpZXQuaG9hbmcuZGV2QGdtYWlsLmNv
bT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
