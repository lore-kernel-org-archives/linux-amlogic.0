Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7A4CD4F50
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 18:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDYf8/LEG6cthFHE8aejcGjq84rckOrmjZY2zVO+u30=; b=jrsnA0Bmm013oH
	oo8p8ZkzGYVThAtsya8xxYkL14gYYPdAGsmMFKcmXL5juoM8Q2O7SaiQQr3OG+mdSekBgxBPgxc/N
	J012p/I3U3ImQu+Qz34N4rDDT2gHOWn0s2qcf1ft8D6nFV9zCEdpM6xqKBUQk+SN9DnFW9aMsfZuM
	kFq6PFELEvePaWeT5e47OzRARRrgI9cx7E1BPGFs+8kjh8bIgyql6x4tYSMz08Ku0k2MFVrMzEThJ
	JlkHq4ZXiymOIZ+4onm3agCebACqWV9AIRnKN0nEkWdVGQx/84O2onKL49uBps+g5hl8AuljnxtGJ
	JzvCcF92cMwlllvC+1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP35L-0000000GcAQ-2zol;
	Mon, 18 May 2026 18:53:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP35K-0000000GcAC-0tsa
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 18:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FE1F600CB;
	Mon, 18 May 2026 18:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C749CC2BCB7;
	Mon, 18 May 2026 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779130381;
	bh=4DaHqEpj3TMelD/uCH0T6WqVKDAv3bT1C1a4E2RlCgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NsEkwlwKnXWhNk1X1k6myeUH95kydGj4oAY/GXDxlQk1P/9l0sSNAqgCq78U1TW7N
	 lQ+sSdvucYsCRO0P8DgBarV22iV1cSpmIA29bA19VhcLY+92yG3O/0LoKkeSxz+EOL
	 RCqjwfQo78hwpMFZZl3Zg/S5GAbjhmmysCaj/67ElUC09aO6lM/ghII4B1x01p/Svf
	 2eE95NXfsqcaMgO1yrDNFibbdLiUqwDXqCla6C9mb70FLb/Img+qu1pJqbCZdJWxdr
	 j2H7IpQOm7BkYv7e0aKpTm0G4sDB5rzy69Z6jS1GlN3ZbnnNzO9cX6Bqa3h09PaEPX
	 lXUKTI85zjHFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 15/23] drm: bridge: dw_hdmi: Use generic CEC notifier
 helpers
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260518180206.2480119-16-jonas@kwiboo.se>
References: <20260518180206.2480119-16-jonas@kwiboo.se>
Date: Mon, 18 May 2026 18:53:00 +0000
Message-Id: <20260518185300.C749CC2BCB7@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFVzZS1BZnRlci1GcmVl
IGFuZCBtZW1vcnkgbGVhayBkdWUgdG8gZHJtbSBhY3Rpb24gbGlmZXRpbWUgbWlzbWF0Y2ggd2l0
aCB0aGUgY29ubmVjdG9yCi0tCgpjb21taXQgN2EzZDJkNGM5YWU2MTA3ZmZlZjg4Yjg2N2Q3M2Nj
MzlkZDdlODU2NwpBdXRob3I6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KZHJtOiBi
cmlkZ2U6IGR3X2hkbWk6IFVzZSBnZW5lcmljIENFQyBub3RpZmllciBoZWxwZXJzCgpUaGlzIGNv
bW1pdCByZXBsYWNlcyB0aGUgb3Blbi1jb2RlZCBDRUMgbm90aWZpZXIgaGFuZGxpbmcgd2l0aCB0
aGUgZ2VuZXJpYwpEUk0gSERNSSBDRUMgbm90aWZpZXIgaGVscGVycy4KCj4gVGhlIGRybW0gcmVs
ZWFzZSBhY3Rpb24gZm9yIHRoZSBnZW5lcmljIENFQyBub3RpZmllciBzaG91bGQgcnVuIGp1c3QK
PiBiZWZvcmUgZHdfaGRtaV9jb25uZWN0b3JfZGVzdHJveSgpLCBjbG9zZWx5IG1hdGNoaW5nIHRo
ZSBsaWZldGltZSBvZgo+IHRoZSByZXBsYWNlZCBDRUMgbm90aWZpZXIgYW5kIHRoZSBjb25uZWN0
b3IuCgpJcyB0aGlzIGFzc3VtcHRpb24gYWNjdXJhdGUgZm9yIGFsbCBkcml2ZXJzIHVzaW5nIGR3
X2hkbWk/CgpXaGVuIG1hc3RlciBkcml2ZXJzIGxpa2Ugc3VuNGkgb3IgaW14IGFyZSB1bmJvdW5k
LCBkcm1fbW9kZV9jb25maWdfY2xlYW51cCgpCmlzIG9mdGVuIGNhbGxlZCBzeW5jaHJvbm91c2x5
LCB3aGljaCBpbiB0dXJuIGNhbGxzIGR3X2hkbWlfY29ubmVjdG9yX2Rlc3Ryb3koKS4KCklmIGEg
dXNlcnNwYWNlIHByb2Nlc3MgaG9sZHMgdGhlIERSTSBmaWxlIGRlc2NyaXB0b3Igb3BlbiwgdGhl
IGRybV9kZXZpY2UKb3V0bGl2ZXMgdGhlIHVuYmluZC4gRG9lc24ndCB0aGlzIG1lYW4gdGhlIGRy
bW0gcmVsZWFzZSBhY3Rpb24gd2lsbCBydW4KbXVjaCBsYXRlciB0aGFuIGR3X2hkbWlfY29ubmVj
dG9yX2Rlc3Ryb3koKSwgcmF0aGVyIHRoYW4ganVzdCBiZWZvcmUgaXQ/Cgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gaW5kZXggMGU4NGRmZjcyNDcwNi4uMzc0
MDY1NTVhZjdiYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jClsgLi4uIF0KPiBAQCAtMjU4NywxNSArMjU3OCw4IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9j
b25uZWN0b3JfY3JlYXRlKHN0cnVjdCBkd19oZG1pICpoZG1pKQo+ICAKPiAgCWRybV9jb25uZWN0
b3JfYXR0YWNoX2VuY29kZXIoY29ubmVjdG9yLCBoZG1pLT5icmlkZ2UuZW5jb2Rlcik7Cj4gIAo+
IC0JY2VjX2ZpbGxfY29ubl9pbmZvX2Zyb21fZHJtKCZjb25uX2luZm8sIGNvbm5lY3Rvcik7Cj4g
LQo+IC0Jbm90aWZpZXIgPSBjZWNfbm90aWZpZXJfY29ubl9yZWdpc3RlcihoZG1pLT5kZXYsIE5V
TEwsICZjb25uX2luZm8pOwo+IC0JaWYgKCFub3RpZmllcikKPiAtCQlyZXR1cm4gLUVOT01FTTsK
PiAtCj4gLQloZG1pLT5jZWNfbm90aWZpZXIgPSBub3RpZmllcjsKPiAtCj4gLQlyZXR1cm4gMDsK
PiArCXJldHVybiBkcm1tX2Nvbm5lY3Rvcl9oZG1pX2NlY19ub3RpZmllcl9yZWdpc3Rlcihjb25u
ZWN0b3IsIE5VTEwsCj4gKwkJCQkJCQkgaGRtaS0+ZGV2KTsKPiAgfQoKQ291bGQgdGhpcyBjYXVz
ZSBhIHVzZS1hZnRlci1mcmVlIHdoZW4gdGhlIGRybV9kZXZpY2UgaXMgZmluYWxseSByZWxlYXNl
ZD8KCkxvb2tpbmcgYXQgZHdfaGRtaV9jb25uZWN0b3JfZGVzdHJveSgpLCBpdCBjbGVhbnMgdXAg
dGhlIGNvbm5lY3RvciBzdGF0ZToKCmR3X2hkbWlfY29ubmVjdG9yX2Rlc3Ryb3koKQogIGRybV9j
b25uZWN0b3JfY2xlYW51cChjb25uZWN0b3IpCiAgICAuLi4KICAgIG1lbXNldChjb25uZWN0b3Is
IDAsIHNpemVvZigqY29ubmVjdG9yKSk7CgpTaW5jZSB0aGUgY29ubmVjdG9yIGlzIGVtYmVkZGVk
IGluIHN0cnVjdCBkd19oZG1pIHdoaWNoIGlzIG1hbmFnZWQgYnkgZGV2cmVzCmFuZCB0aGUgYnJp
ZGdlIHJlZmNvdW50LCB0aGUgbWVtb3J5IHdpbGwgYmUgZnJlZWQgd2hlbiB0aGUgcGxhdGZvcm0g
ZGV2aWNlCnVuYmluZCBjb21wbGV0ZXMuCgpXaGVuIHRoZSBkcm1tIGFjdGlvbiBkcm1fY29ubmVj
dG9yX2hkbWlfY2VjX25vdGlmaWVyX3VucmVnaXN0ZXIoKSBldmVudHVhbGx5CmV4ZWN1dGVzIGR1
cmluZyBkcm1fZGV2X3JlbGVhc2UoKSwgd29uJ3QgaXQgYXR0ZW1wdCB0byBkZXJlZmVyZW5jZSB0
aGUKYWxyZWFkeSBmcmVlZCBjb25uZWN0b3IgcG9pbnRlcj8KCklmIHRoZSBtZW1vcnkgaGFwcGVu
cyB0byBzdGlsbCBiZSBhY2Nlc3NpYmxlLCB3b24ndCBpdCByZWFkIHRoZSB6ZXJvZWQKY29ubmVj
dG9yLT5jZWMuZGF0YSBhcyBhIE5VTEwgcG9pbnRlciwgc2lsZW50bHkgbGVha2luZyB0aGUgQ0VD
IG5vdGlmaWVyPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MDUxODE4MDIwNi4yNDgwMTE5LTEtam9uYXNAa3dpYm9vLnNlP3BhcnQ9
MTUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
