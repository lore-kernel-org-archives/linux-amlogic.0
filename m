Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DBACD4F50
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLEl7S38ZXU/pGo0DOxCGTTx2V+c/dOZf8yOmkWprlw=; b=j9tOa+Ff2kvgVs
	AFytRG0EfvSydWtq8jx1nBG4X6FpSW1CuMXLTVVlrFwyQzQ4oM3HD7jUN2tlDZtaDhKOMNtVx6n3f
	4wGYKJV8+0+0sq/AIAcAbDJk4KH0x8n+vD4VYIw4Rfc+zrlKsncLNW0w+6I7PAJEHctL9KywwR2sD
	gNmZ1wUsXB+GlZa8uw3ssqRUrdw090hTYQ5RhumXfq3ctv4PmnaqI0q7XtRj42jC6ZhufkH4n+SbM
	bwtKBspMzsQ/jCBPxpRXKCOybDfJF1eDHYFPuGiGT9TTAApWm47LQ17tHNvAHz+2oHxWKP2uLU+tz
	0TXUCgr12I/Qm1FzLEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP30K-0000000GbfG-0R7f;
	Mon, 18 May 2026 18:47:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP30H-0000000Gbek-40Kt
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 18:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4192B440AB;
	Mon, 18 May 2026 18:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC7EC2BCB7;
	Mon, 18 May 2026 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779130069;
	bh=MUnT2y1oLieX9a2dR9KXeK15JblQSN6VkDgO5lObSzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nBEqGO0Njf1+sJucoufedI/9pkr4m8Vgq3dg3OwQ9cSHpmEgZRWBPXYbvDWacFKMe
	 RY3buDUM97j1nm8nKZdPzwsJbONjdGlSPD/PV6+dDrhdY77fH8V/6OdZsA0Hy2F5mH
	 +zyzz8b9nyy6tu7WbBZwT+NXAlFdjMgjR2jKGk5P/ebJGle2rAiANJABbEfRPMND/Y
	 +e8/jAPd3Y5i2Yvn6NItTAK23SEzan7GSPkD37aW6z8dW/o/J79biRTKHRuU+AW15a
	 +hT8pe2+8dlDYVlbfBgIXyS/I2KCOLEFsxjuiiWeIcU4gTCHmcB28ZhVhLW4qOsgk2
	 EnYi4nkkt4B+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/23] drm: bridge: dw_hdmi: Use
 dw_hdmi_connector_status_update()
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: imx@lists.linux.dev, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260518180206.2480119-14-jonas@kwiboo.se>
References: <20260518180206.2480119-14-jonas@kwiboo.se>
Date: Mon, 18 May 2026 18:47:48 +0000
Message-Id: <20260518184748.CDC7EC2BCB7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_114750_029247_5B1B23C8 
X-CRM114-Status: GOOD (  10.55  )
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBDRUMgcGh5c2lj
YWwgYWRkcmVzcyBpcyBubyBsb25nZXIgc2V0IHdoZW4gdGhlIGNvbm5lY3RvciBzdGF0dXMgaXMg
YGNvbm5lY3Rvcl9zdGF0dXNfdW5rbm93bmAsIGJyZWFraW5nIENFQyBmdW5jdGlvbmFsaXR5IGZv
ciBkaXNwbGF5cyB3aXRoIHVucmVsaWFibGUgSFBELgotIFtIaWdoXSBVbmNvbmRpdGlvbmFsIEVE
SUQgcmVhZCBvdmVyIEkyQyBpbiBgZGV0ZWN0KClgIGlnbm9yZXMgdGhlIGBmb3JjZWAgcGFyYW1l
dGVyLCBjYXVzaW5nIHNldmVyZSBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBhbmQgSTJDIHNwYW0u
Ci0tCgpjb21taXQgZDVkMjcwMDExYTJiMDJmMDAzMjE4YWU3Yjk2ZjYyZmFlMmI0NDdlOQpBdXRo
b3I6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KZHJtOiBicmlkZ2U6IGR3X2hkbWk6
IFVzZSBkd19oZG1pX2Nvbm5lY3Rvcl9zdGF0dXNfdXBkYXRlKCkKClRoaXMgY29tbWl0IHVwZGF0
ZXMgdGhlIGR3LWhkbWkgY29ubmVjdG9yIHRvIGZldGNoIEVESUQgYW5kIHVwZGF0ZSBDRUMKcGh5
c2ljYWwgYWRkcmVzc2VzIGR1cmluZyBkZXRlY3QgYW5kIGZvcmNlIGZ1bmN0aW9ucyByYXRoZXIg
dGhhbiBpbiBnZXRfbW9kZXMuCkl0IGFpbXMgdG8gZW5zdXJlIHVzZXJzcGFjZSBhbHdheXMgaGFz
IGFjY2VzcyB0byB0aGUgbGF0ZXN0IHJlYWQgRURJRC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jCgpbIC4uLiBdCgo+IEBAIC0yNDczLDM2ICsyNDczLDM2IEBAIGR3X2hkbWlfY29ubmVj
dG9yX3N0YXR1c191cGRhdGUoc3RydWN0IGR3X2hkbWkgKmhkbWksCgpbIC4uLiBdCgo+ICAJZHJt
X2VkaWQgPSBkd19oZG1pX2VkaWRfcmVhZChoZG1pLCBjb25uZWN0b3IpOwo+ICAJZHJtX2VkaWRf
Y29ubmVjdG9yX3VwZGF0ZShjb25uZWN0b3IsIGRybV9lZGlkKTsKPiAgCWRybV9lZGlkX2ZyZWUo
ZHJtX2VkaWQpOwo+ICAKPiAtCWNlY19ub3RpZmllcl9zZXRfcGh5c19hZGRyKGhkbWktPmNlY19u
b3RpZmllciwKPiAtCQkJCSAgIGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLnNvdXJjZV9waHlzaWNh
bF9hZGRyZXNzKTsKPiArCWlmIChzdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQp
Cj4gKwkJY2VjX25vdGlmaWVyX3NldF9waHlzX2FkZHIoaGRtaS0+Y2VjX25vdGlmaWVyLAo+ICsJ
CQkJY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uc291cmNlX3BoeXNpY2FsX2FkZHJlc3MpOwo+ICB9
CgpEb2VzIHRoaXMgYnJlYWsgQ0VDIGZ1bmN0aW9uYWxpdHkgZm9yIGRpc3BsYXlzIHdpdGggdW5y
ZWxpYWJsZSBIUEQ/IAoKQnkgZ3VhcmRpbmcgdGhlIGNlY19ub3RpZmllcl9zZXRfcGh5c19hZGRy
KCkgY2FsbCB3aXRoIGEgY2hlY2sgZm9yCmNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkLCB0aGUg
Q0VDIHBoeXNpY2FsIGFkZHJlc3MgdXBkYXRlIGlzIHNraXBwZWQgaWYgdGhlCnN0YXR1cyBldmFs
dWF0ZXMgdG8gY29ubmVjdG9yX3N0YXR1c191bmtub3duLiAKClByZXZpb3VzbHksIHRoaXMgd2Fz
IGNhbGxlZCB1bmNvbmRpdGlvbmFsbHkgYWZ0ZXIgYSBzdWNjZXNzZnVsIEVESUQgcmVhZCwKd2hp
Y2ggYWxsb3dlZCBDRUMgdG8gd29yayBldmVuIHdoZW4gSFBEIHdhcyB1bnJlbGlhYmxlLgoKPiAg
c3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMKPiAgZHdfaGRtaV9jb25uZWN0b3JfZGV0
ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCj4gIHsKPiAt
CXN0cnVjdCBkd19oZG1pICpoZG1pID0gY29udGFpbmVyX29mKGNvbm5lY3Rvciwgc3RydWN0IGR3
X2hkbWksCj4gLQkJCQkJICAgICBjb25uZWN0b3IpOwo+ICsJc3RydWN0IGR3X2hkbWkgKmhkbWkg
PSBjb250YWluZXJfb2YoY29ubmVjdG9yLCBzdHJ1Y3QgZHdfaGRtaSwgY29ubmVjdG9yKTsKPiAg
CWVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgc3RhdHVzOwo+ICAKPiAgCXN0YXR1cyA9IGR3X2hk
bWlfZGV0ZWN0KGhkbWkpOwo+ICAKPiAtCWlmIChzdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c19k
aXNjb25uZWN0ZWQpCj4gLQkJY2VjX25vdGlmaWVyX3BoeXNfYWRkcl9pbnZhbGlkYXRlKGhkbWkt
PmNlY19ub3RpZmllcik7Cj4gKwlkd19oZG1pX2Nvbm5lY3Rvcl9zdGF0dXNfdXBkYXRlKGhkbWks
IGNvbm5lY3Rvciwgc3RhdHVzKTsKCldpbGwgdGhpcyBjYXVzZSBwZXJmb3JtYW5jZSBpc3N1ZXMg
YnkgcGVyZm9ybWluZyB1bmNvbmRpdGlvbmFsIEkyQyBFRElEIHJlYWRzCm9uIGV2ZXJ5IGRldGVj
dCBjYWxsPyAKClRoZSBkd19oZG1pX2Nvbm5lY3Rvcl9zdGF0dXNfdXBkYXRlKCkgZnVuY3Rpb24g
cmVhZHMgdGhlIEVESUQgb3ZlciBJMkMgdW5sZXNzCnRoZSBzdGF0dXMgaXMgZGlzY29ubmVjdGVk
LCBidXQgdGhpcyBjb21wbGV0ZWx5IGlnbm9yZXMgdGhlIGZvcmNlIHBhcmFtZXRlcgpwYXNzZWQg
dG8gZGV0ZWN0LiBJZiBhIHN5c3RlbS13aWRlIGhvdHBsdWcgZXZlbnQgb2NjdXJzIG9uIGFub3Ro
ZXIgcG9ydCwKZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KCkgd2lsbCBjYWxsIGRldGVjdCB3aXRo
IGZvcmNlPWZhbHNlIG9uIGFsbCBIUEQtY2FwYWJsZQpjb25uZWN0b3JzLgoKQ291bGQgdGhpcyB0
cmlnZ2VyIGFuIHVubmVjZXNzYXJ5IDIwLTUwbXMgSTJDIEVESUQgcmVhZCBoZXJlLCBzcGFtbWlu
ZyB0aGUgSTJDCmJ1cyBhbmQgYmxvY2tpbmcgdGhlIHNoYXJlZCBLTVMgc3lzdGVtIHdvcmtxdWV1
ZT8KCj4gIAo+ICAJcmV0dXJuIHN0YXR1czsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxODE4MDIwNi4yNDgwMTE5LTEt
am9uYXNAa3dpYm9vLnNlP3BhcnQ9MTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
