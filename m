Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FEACD6E55
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nu9E5lwZtqsay2TsiQPw6VauMoheVj3RMQihazzw4kc=; b=Le6mnArSVLDdQc
	Pl5v1TowEp5HOpg6RJ3Vky+0OOsCl/gapZ+monMFcWC4ZwEh6lGdSYWkgx3HMB+6N1erhLN1JZ3pE
	PesuQRhjVPfzfARYRm/4LD6b9ZvmiLf+2exlmeTlc5Qh3mBj9WG7rY7uqP5KyDzYXBnSOANbYo+f3
	UXLM7s4DYW7WLqJpYFlvE+X/qOcTzBcieq2X4jgporTdeAZuMe7LYx8I/odatVC0GcQR9gghfO8oB
	K/AvY9ag6yxEV/lcY1RWDsYm0n9k0mF0wRN2NXPuCZgXNr/pTg/ppdf5d7TfrhbXrgiXIqX2rX3/z
	d6HInR6N7ht9q6ISTWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbUV-00000009NLS-1zFw;
	Sun, 31 May 2026 08:25:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbUT-00000009NLF-3TCd
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 08:25:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3BBB60220;
	Sun, 31 May 2026 08:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98F81F00893;
	Sun, 31 May 2026 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780215947;
	bh=XU/2vv1g14VpA84ZpXCUHR0wUln8A+2pZwXwb3xawBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IV54rJKfj/g7FG79qClTbAtB3V17serAEciOY480+9ibtCstcl8bvi7tRtt0JvM25
	 CYCXZ+iW/rVDypJkcnK1PSZpu0ihzD+rwj3X0nv1hhitaZ8GNPMItUqd5sF9FtBfxY
	 qwFmjzHcmJI3+ntZbNoaUZx5zZl8dGo+8LHGHf+GDSg5JGFHes/s56chJcx2hY+25c
	 AwWgGLQDsqgeGnIz1LoTYwNJl7aG9PZxvCWb17bws/L65PUaCtv5ltWMgO7m/Q7xW0
	 SQBfQ+MzINl4LT+ra5mqesA3kBYCNrD7KejZnOMdhufNy0cs8GPDzujaiUMyNdZXHP
	 t3A+pvCq4l17g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] drm/meson: Open-code drm_simple_encoder_init() in
 encoder_dsi
To: "Naman Arora" <namanarora029@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260531074627.8936-3-namanarora029@gmail.com>
References: <20260531074627.8936-3-namanarora029@gmail.com>
Date: Sun, 31 May 2026 08:25:46 +0000
Message-Id: <20260531082546.D98F81F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBUaGUgZW5jb2RlciBhdG9taWMgZW5hYmxlIGNhbGxiYWNrIHVzZXMgYSBzbGVlcGlu
ZyBwb2xsaW5nIGZ1bmN0aW9uLCB3aGljaCB2aW9sYXRlcyBEUk0gYXRvbWljIGNvbnRleHQgcnVs
ZXMuCi0tCgpjb21taXQgNzkwNWIyNTllMGZmZjk3YjY4MDNjMjM2MGJmOTdmZjBkYzc0ZGFlMgpB
dXRob3I6IE5hbWFuIEFyb3JhIDxuYW1hbmFyb3JhMDI5QGdtYWlsLmNvbT4KCmRybS9tZXNvbjog
T3Blbi1jb2RlIGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkgaW4gZW5jb2Rlcl9kc2kKClRoZSBo
ZWxwZXIgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKSBpcyBhIHRoaW4gd3JhcHBlciBhcm91bmQK
ZHJtX2VuY29kZXJfaW5pdCgpIHdpdGggYSBzaW1wbGUgZGVzdHJveS1vbmx5IGVuY29kZXIgZnVu
Y3Mgc3RydWN0LgpSZW1vdmUgdGhlIGRlcGVuZGVuY3kgb24gZHJtX3NpbXBsZV9rbXNfaGVscGVy
IGJ5IG9wZW4tY29kaW5nIHRoZQplbmNvZGVyIGluaXRpYWxpemF0aW9uIGRpcmVjdGx5IGluIHRo
ZSBkcml2ZXIuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5j
b2Rlcl9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2RzaS5jCj4g
aW5kZXggYzFmNDY4NTA3M2JiYy4uYmJiNWI2NWNiMGQ5NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9lbmNvZGVyX2RzaS5jCgpbIC4uLiBdCgo+IEBAIC05OSw2ICs5OCwxMCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgbWVzb25fZW5jb2Rlcl9kc2lf
YnJpZGdlX2Z1bmNzID0gewo+ICAJLmF0b21pY19yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Jy
aWRnZV9yZXNldCwKPiAgfTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGlu
ZyBpc3N1ZSwgYnV0IGRvZXMgdGhpcyBicmlkZ2UgY29uZmlndXJhdGlvbiBjYXVzZSBhCnNsZWVw
IGluIGF0b21pYyBjb250ZXh0PwoKTG9va2luZyBhdCB0aGUgYXRvbWljX2VuYWJsZSBwYXRoIGZv
ciB0aGlzIGJyaWRnZSBpbgpkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9kc2ku
YzoKCm1lc29uX2VuY29kZXJfZHNpX2F0b21pY19lbmFibGUoKQogIG1lc29uX2VuY2xfbG9hZF9n
YW1tYSgpCiAgICBtZXNvbl9lbmNsX3NldF9nYW1tYV90YWJsZSgpCgpJbiBkcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fdmVuYy5jLCBtZXNvbl9lbmNsX3NldF9nYW1tYV90YWJsZSgpIGNhbGxz
OgpyZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dCguLi4sIDEwLCAxMDAwMCkKClRoZSByZWFkbF9y
ZWxheGVkX3BvbGxfdGltZW91dCBtYWNybyBleHBhbmRzIHRvIHVzbGVlcF9yYW5nZSB3aGVuIGEg
bm9uLXplcm8KZGVsYXkgaXMgcHJvdmlkZWQgKGxpa2UgMTAgaGVyZSksIHdoaWNoIHdpbGwgY2F1
c2UgdGhlIHRocmVhZCB0byBzbGVlcC4KClNpbmNlIGJyaWRnZSBhdG9taWNfZW5hYmxlIGNhbGxi
YWNrcyBleGVjdXRlIGluIGFuIGF0b21pYyBjb250ZXh0IHdoZXJlCnNsZWVwaW5nIGlzIHN0cmlj
dGx5IGZvcmJpZGRlbiwgY291bGQgdGhpcyBjYXVzZSBrZXJuZWwgd2FybmluZ3MgKG1pZ2h0X3Ns
ZWVwKQpvciBwb3RlbnRpYWwgZGVhZGxvY2tzIGlmIGxvY2tzIGFyZSBoZWxkPwoKU2hvdWxkIHRo
aXMgY29kZSBwYXRoIHVzZSBhIG5vbi1zbGVlcGluZyBwb2xsaW5nIG1lY2hhbmlzbSBzdWNoIGFz
CnJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21pYyBpbnN0ZWFkPwoKPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyBtZXNvbl9lbmNvZGVyX2RzaV9kcm1fZW5jb2Rl
cl9mdW5jcyA9IHsKPiArCS5kZXN0cm95ID0gZHJtX2VuY29kZXJfY2xlYW51cCwKPiArfTsKPiAr
Cj4gIGludCBtZXNvbl9lbmNvZGVyX2RzaV9wcm9iZShzdHJ1Y3QgbWVzb25fZHJtICpwcml2KQo+
ICB7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNTMxMDc0NjI3Ljg5MzYtMS1uYW1hbmFyb3JhMDI5QGdtYWlsLmNvbT9wYXJ0PTYK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
