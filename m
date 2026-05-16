Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145A0CD4851
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnGl+RcSojHtF95iVppabj7C75ppGDKwy+Q6h4i3LHQ=; b=S3gRBTUlzoN2aj
	Od5K5v4jaigr2rf8retjzuHX/S/tBOvxlgZnQ9Mlb2ECulBsjmooH9B4yXfHM8BgQyslSl5NkDhA7
	3OpvZf7Z9HjwrKOgYzHryMh4/xZs2j2esn5HHvz05GiCldcAb3+ZwFWYedl37ANAYyw/DOazjRofJ
	Wzs/6nk6gcTpOgCUTHdd9U0ELZulE1G1x/5IPcznD3HwIr57oUGZdY95KNLr81Jk9FVSmwyMmHikk
	UFh+Wmdb0eoATsvc1Yz+U7Jdk7i2K9QcXR5ZROWo9ktQ0uV7c/BysblhEklsW+VvoqH3nWS8I8TeV
	c0An7JJQoli7AaaQo8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOL3j-0000000BPZa-2oNL;
	Sat, 16 May 2026 19:52:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOL3g-0000000BPYl-3Oj3
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:52:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3249640A8F;
	Sat, 16 May 2026 19:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D23C19425;
	Sat, 16 May 2026 19:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778961144;
	bh=wBiUkMKE2/fn+M4Bu0CfTv4s5XqMChnUixqGRUy9bEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Kw8ZCSe1gu4lnQ7epI6WJasyyT62yMs8tHAlHd0yXuPRjymzeGcFAwhH2RfwBqHcG
	 rsAIApLHw3b1sl2hlbwvDnGG7BWLJAwFvQ2yW1kVkRkD4jMGzyCVqKJ6lAIB2cmPKs
	 eOJgLbONYedWc/rOaS7JSE8pgONcxpjnV/P74PKfzYdK4dtuxnEqCY5hXdZq01Xx2d
	 6mrL3STeVMzZAc/S6Bor0GRGKUMek0FYADd7EQb6dHy9Nf3c34R/tipEvo9upBEWO5
	 ZdPcnckGmXeI6ZsS/+kE9zdJcMuPgWHGoIbzEK2AjMJ5wjLO517TOG5Trkac7TgwgU
	 wN092HzAz6Spw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/22] drm: bridge: dw_hdmi: Update EDID and CEC phys
 addr in bridge detect()
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260516183838.2024991-15-jonas@kwiboo.se>
References: <20260516183838.2024991-15-jonas@kwiboo.se>
Date: Sat, 16 May 2026 19:52:23 +0000
Message-Id: <20260516195223.C5D23C19425@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_125224_887061_A98AE034 
X-CRM114-Status: GOOD (  13.54  )
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFJlZHVuZGFudCwgYmFj
ay10by1iYWNrIEVESUQgcmVhZHMgb3ZlciBJMkMgY2F1c2luZyBzaWduaWZpY2FudCBsYXRlbmN5
IGR1cmluZyBwcm9iZS4KLSBbSGlnaF0gVW5jaGVja2VkIHJldHVybiB2YWx1ZSBmcm9tIGBkcm1f
ZWRpZF9yYXcoKWAgY2F1c2VzIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIG9uIG1hbGZvcm1l
ZCBFRElEcy4KLS0KCmNvbW1pdCA3OTVjMTcyZmFkZGFiYTAyMmE0ZmQzYWVjZmUwODk4ZjAyOTE1
NTBmCkF1dGhvcjogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgoKZHJtOiBicmlkZ2U6
IGR3X2hkbWk6IFVwZGF0ZSBFRElEIGFuZCBDRUMgcGh5cyBhZGRyIGluIGJyaWRnZSBkZXRlY3Qo
KQoKVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgRURJRCBhbmQgQ0VDIHBoeXNpY2FsIGFkZHJlc3Mg
aW4gdGhlIGJyaWRnZQpkZXRlY3QoKSBmdW5jdGlvbi4gVGhpcyBpcyBpbnRlbmRlZCB0byBjbG9z
ZWx5IG1hdGNoIHRoZSBiZWhhdmlvciBvZiBhCmJyaWRnZSBjb25uZWN0b3Igd2l0aCBhbiBIRE1J
IGJyaWRnZSBhdHRhY2hlZCBhbmQgdGhlIGR3LWhkbWkgY29ubmVjdG9yLgoKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IGluZGV4IDJiYjA0M2Q2NGI2NTguLjM2
NDljY2Y4ZDk5NGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYwo+IEBAIC0yOTY5LDggKzI5NjksMTcgQEAgc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9z
dGF0dXMKPiAgZHdfaGRtaV9icmlkZ2VfZGV0ZWN0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Us
IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiAgCXN0cnVjdCBkd19oZG1p
ICpoZG1pID0gYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZTsKPiArCWVudW0gZHJtX2Nvbm5lY3Rvcl9z
dGF0dXMgc3RhdHVzOwo+ICsKPiArCXN0YXR1cyA9IGR3X2hkbWlfZGV0ZWN0KGhkbWkpOwo+ICsK
PiArCS8qCj4gKwkgKiBVcGRhdGUgRURJRCBhbmQgQ0VDIHBoeXMgYWRkciB0byBtYXRjaCB0aGUg
YmVoYXZpb3Igb2YgYSBicmlkZ2UKPiArCSAqIGNvbm5lY3RvciB3aXRoIGEgSERNSSBicmlkZ2Ug
YXR0YWNoZWQgYW5kIHRoZSBkdy1oZG1pIGNvbm5lY3Rvci4KPiArCSAqLwo+ICsJZHdfaGRtaV9j
b25uZWN0b3Jfc3RhdHVzX3VwZGF0ZShoZG1pLCBjb25uZWN0b3IsIHN0YXR1cyk7CgpEb2VzIHRo
aXMgY2F1c2UgcmVkdW5kYW50IEVESUQgcmVhZHMgb3ZlciBJMkMgZHVyaW5nIHByb2JlPwoKQmVj
YXVzZSB0aGUgZHJpdmVyIGRvZXMgbm90IHNldCBEUk1fQlJJREdFX09QX0hETUksIHRoZSBEUk0g
Y29yZSBicmlkZ2UKZnJhbWV3b3JrIChkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9nZXRfbW9kZXNfZWRp
ZCkgaXMgdW5hd2FyZSBvZiB0aGlzIEVESUQKdXBkYXRlLgoKQ29uc2VxdWVudGx5LCBkdXJpbmcg
YSBzdGFuZGFyZCBtb2Rlc2V0IHByb2JlLCB0aGUgY29yZSBmcmFtZXdvcmsgY2FsbHMKZGV0ZWN0
KCkgYWdhaW4gYW5kIHRoZW4gZWRpZF9yZWFkKCksIHJlc3VsdGluZyBpbiB1cCB0byB0aHJlZSBz
ZXBhcmF0ZQpJMkMgRURJRCByZWFkcyBwZXIgcHJvYmUgY3ljbGUgKG9uZSBmcm9tIGluaXRpYWwg
ZGV0ZWN0LCBvbmUgZnJvbQpnZXRfbW9kZXMgZGV0ZWN0LCBhbmQgb25lIGZyb20gZ2V0X21vZGVz
IGVkaWRfcmVhZCkuIFNpbmNlIEREQyByZWFkcyBhcmUKc2xvdywgY291bGQgdGhpcyBjYXVzZSBh
IGxhdGVuY3kgcmVncmVzc2lvbj8KCkFkZGl0aW9uYWxseSwgY291bGQgY2FsbGluZyBkd19oZG1p
X2Nvbm5lY3Rvcl9zdGF0dXNfdXBkYXRlKCkgaGVyZSB0cmlnZ2VyCmEgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlIG9uIG1hbGZvcm1lZCBFRElEcz8KCmR3X2hkbWlfY29ubmVjdG9yX3N0YXR1c191
cGRhdGUoKSBjYWxscyBkd19oZG1pX2VkaWRfcmVhZCgpLCB3aGljaAp1bmNvbmRpdGlvbmFsbHkg
Y2FsbHMgZHJtX2VkaWRfcmF3KCkgYW5kIGRlcmVmZXJlbmNlcyB0aGUgcmVzdWx0LiBIb3dldmVy
LApkcm1fZWRpZF9yYXcoKSBjYW4gcmV0dXJuIE5VTEwgZm9yIG1hbGZvcm1lZCBFRElEcyB3aGVy
ZSB0aGUgZXh0ZW5zaW9uCmNvdW50IGluZGljYXRlcyBhIHNpemUgbGFyZ2VyIHRoYW4gdGhlIHJl
YWQgYnVmZmVyLgoKV2hpbGUgdGhpcyBiZWhhdmlvciBleGlzdGVkIHByZXZpb3VzbHksIGhvb2tp
bmcgdGhlIEVESUQgcmVhZCBpbnRvIHRoZQpkZXRlY3QoKSBjYWxsYmFjayBtYWtlcyB0aGlzIGJ1
ZyBzaWduaWZpY2FudGx5IG1vcmUgcmVhY2hhYmxlLiBDb3VsZCB0aGlzCmNhdXNlIGEga2VybmVs
IHBhbmljIHNpbXBseSBieSBjb25uZWN0aW5nIGEgbW9uaXRvciB3aXRoIGEgbWFsZm9ybWVkCkVE
SUQgb24gaG90cGx1Zz8KCj4gIAo+IC0JcmV0dXJuIGR3X2hkbWlfZGV0ZWN0KGhkbWkpOwo+ICsJ
cmV0dXJuIHN0YXR1czsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxNjE4MzgzOC4yMDI0OTkxLTEtam9uYXNAa3dpYm9v
LnNlP3BhcnQ9MTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
