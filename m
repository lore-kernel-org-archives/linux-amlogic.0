Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E03EC5B56A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZxvEXaaBdSSb4PknaQFdTv1nDcIT7IJGOzGhDmjtTg=; b=ML+CuP8qYcfpyy
	JLbxgGopPQJTeH68VZRPtrvQfJBvGmCfvgeK7tImhMnIu5oRF4TOgM/5OhAqnmE7IeuwrbWsKtMWd
	TrXDAR2duf8RKDt0KqaSnXzUhYe790K785y5cLca75dyROe/riksdDxinqJ61MlbwpUyZYpEpBHcS
	r70JI+kHavqhFbqIY9OyGejsc+GnUYOvP++kkzh34IhV77G02x9R+e/AEaQ6UWePlOgaYTRVMhxiv
	yWgS01RzwUlijFqTmq8jUksbe/Y9Ux4mDYyGcnIENuiSfh5DvJADVoAQHoUgVPTw9GZ/yyLYkPrTV
	K/lHRC7KBXEifkfVBTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6EW-0000000Ftrk-1bWR;
	Wed, 12 Aug 2026 10:30:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6EV-0000000FtrY-0GJC
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 10:30:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CF1C60A7E;
	Wed, 12 Aug 2026 10:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFF51F000E9;
	Wed, 12 Aug 2026 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786530650;
	bh=BOpIG71E0TwByqFTeubjoNvlAD1w4IgY0jRD8IQSYyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g9k+ige95RBRuTYrpHhh/TMqAT4mD/bdoAJOP3kkS0yneWVoLuPHTYyAdx8QStOPy
	 c7z4CacjTKfgyZQ/ZXUWy0iqDzN5Kuu42CFTlALZgUjTh/GZBaH3DChDqxNXP3HEZe
	 AOxIlNcrBRtPv52i4bB36Uh2EvYvBuXLEAnV//LWrbgrEX9z6jhYMWtWmCeztiJY2D
	 XlpwAaYsTBspacXkMD0eWXdAmBFPVEyCExUyDri6raGAKpsKYeYMWPWJs5AOgBk2VB
	 A16TQjpQ9CNEOiRQrFZsH4SybQ3eBMTIg47e8aqw10d/Gj8j4xkGm1qVi8wpltqgwl
	 Dg8epbzw/qvSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: meson: sync some modify from A4
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
References: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
Date: Wed, 12 Aug 2026 10:30:49 +0000
Message-Id: <20260812103049.EBFF51F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gUmV0dXJuaW5nIDAg
d2l0aCBhcmc9MCBmb3IgZGlzYWJsZWQgUElOX0NPTkZJR19PVVRQVVRfRU5BQkxFIHZpb2xhdGVz
IHRoZSBwaW5jdHJsIGdlbmVyaWMgQVBJIGFuZCBicmVha3MgZGVidWdmcyBkdW1wcy4KLS0KCi0t
LSBQYXRjaCBbMV06IFtQQVRDSF0gcGluY3RybDogbWVzb246IHN5bmMgc29tZSBtb2RpZnkgZnJv
bSBBNCAtLS0KY29tbWl0IDljZDRjZDUyOTQ1ZDM1MzFmOGExOTQ0ZDc5YThkNDUzYTgzMmNlMzMK
QXV0aG9yOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KCnBpbmN0cmw6
IG1lc29uOiBzeW5jIHNvbWUgbW9kaWZ5IGZyb20gQTQKClRoaXMgY29tbWl0IHN5bmNzIGZpeGVz
IGZyb20gQTQsIHNldHRpbmcgdGhlIGRyaXZlIHN0cmVuZ3RoIGJlZm9yZQplbmFibGluZyB0aGUg
b3V0cHV0IHRvIHByZXZlbnQgdW5pbnRlbmRlZCBkcml2ZSBzdHJlbmd0aHMuIEl0IGFsc28gbW9k
aWZpZXMKUElOX0NPTkZJR19PVVRQVVRfRU5BQkxFIHRvIHJlcG9ydCB0aGUgYWN0dWFsIG91dHB1
dCBlbmFibGUgc3RhdGUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVzb24vcGlu
Y3RybC1tZXNvbi5jIGIvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtbWVzb24uYwo+IGlu
ZGV4IDE4Mjk1YjE1ZWNkOWQuLjlmYzMwYWVlOTZhNTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9w
aW5jdHJsL21lc29uL3BpbmN0cmwtbWVzb24uYwo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZXNv
bi9waW5jdHJsLW1lc29uLmMKClsgLi4uIF0KCj4gQEAgLTQ5OCw5ICs0OTgsOSBAQCBzdGF0aWMg
aW50IG1lc29uX3BpbmNvbmZfZ2V0KHN0cnVjdCBwaW5jdHJsX2RldiAqcGNkZXYsIHVuc2lnbmVk
IGludCBwaW4sCj4gIAkJYnJlYWs7Cj4gIAljYXNlIFBJTl9DT05GSUdfT1VUUFVUX0VOQUJMRToK
PiAgCQlyZXQgPSBtZXNvbl9waW5jb25mX2dldF9vdXRwdXQocGMsIHBpbik7Cj4gLQkJaWYgKHJl
dCA8PSAwKQo+ICsJCWlmIChyZXQgPCAwKQo+ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAtCQlhcmcg
PSAxOwo+ICsJCWFyZyA9IHJldDsKCltTZXZlcml0eTogTWVkaXVtXQpUaGUgZ2VuZXJpYyBwaW5j
dHJsIEFQSSBkZWZpbmVzIFBJTl9DT05GSUdfT1VUUFVUX0VOQUJMRSBhcyBhIGJvb2xlYW4KcGFy
YW1ldGVyIHdpdGhvdXQgYW4gYXJndW1lbnQuCgpXaGVuIGEgZmVhdHVyZSBpcyBpbmFjdGl2ZSBv
ciBkaXNhYmxlZCwgZHJpdmVycyBhcmUgZXhwZWN0ZWQgdG8gcmV0dXJuIAotRUlOVkFMIGZyb20g
dGhlIGdldCBjYWxsYmFjay4gQmVjYXVzZSB0aGUgcGFyYW1ldGVyIGhhcyBubyBhcmd1bWVudCwg
dGhlIApjb3JlIHBpbmN0cmwgZGVidWdmcyBsb2dpYyBpZ25vcmVzIHRoZSByZXR1cm5lZCBhcmcg
dmFsdWUuCgpCeSByZXR1cm5pbmcgMCB3aXRoIGFyZyA9IDAgd2hlbiB0aGUgb3V0cHV0IGlzIGRp
c2FibGVkLCB3b24ndCBkZWJ1Z2ZzIApmYWxzZWx5IHJlcG9ydCBhbGwgZGlzYWJsZWQgcGlucyBh
cyBoYXZpbmcgdGhlaXIgb3V0cHV0IGVuYWJsZWQ/CgpTaG91bGQgdGhpcyBjb2RlIHN0aWxsIHJl
dHVybiAtRUlOVkFMIHdoZW4gcmV0IGlzIDAgdG8gYXZvaWQgYnJlYWtpbmcgCmRlYnVnZnMgb3V0
cHV0PwoKPiAgCQlicmVhazsKPiAgCWNhc2UgUElOX0NPTkZJR19MRVZFTDoKCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MTItc3lu
Y19hNC12MS0xLWI3Mjc5YzI2ZTJiY0BhbWxvZ2ljLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
