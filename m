Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B96C44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN09/8jLcCAJy6fJWsxJJUkv6k5GiRrKJDUjmmAoN3U=; b=T8l7lBh7075Qjk
	U+u0rQ1A0APda3CWjYFfStoG7PXcfKC9Ud/iq+Nz7h32auVy4GkoSoOMhMmwuNN1ZuRKPobD8JRlN
	PtFPSOWM9t55kiLsrg39Rfd2GdCMWXmEoMmm/lE7wu3huBJ/Xys1j41Xhwa0jeehVQBgjrWdxzTUe
	0vk2PSk35sOLSrHDfJFxe/Sjz5JdeExLFE0Nv/7/8gQ4fqDAJcPTCmdLqLFGPzsU1w7PpCh2qjB4R
	mHyF30qRshnEuIsib23OhxeZd3YzW6kvQiHf4E32xsoHYLRgMa+mmvY9piY3Oa55Kvrd2c2BiiAYm
	EPGcKxrC67hLchiv7c/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqWf-00000007JPq-007r;
	Mon, 20 Jul 2026 16:07:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqWd-00000007JPQ-2WxQ
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 16:07:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AAD9860052;
	Mon, 20 Jul 2026 16:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26491F00A3A;
	Mon, 20 Jul 2026 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784563646;
	bh=JF6x3v05IF6JcSqACDd1Ioo37Y1aQR5NcKaWwtQBaB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VmzVp+RI15t4zvpJkkWoY9d5TgC9d8RG2zYDlPpM2oK3npFP9nwgV3cXY+pke5mmq
	 vFo+jBvr17XZC09CRsqIaj2HYL30DebOdI7t48fRQQUFtvhdG6nDh24Ty1n+2cRYxM
	 /PyZnH7vNUnhJk0Gndyq94EpLFthhgQKiXWcEi0i2AQHeDzJSG7Dmld5uZGfUuFMQp
	 Du66Ttodx3dFesyvQ9GGRB0rkVaAz4NtLZIqmd4ZJfTYLDOPp+NuPK7XdiSU5awLT5
	 rKOmXx6cKBoL2RMl3f5NDn2TFhpMF8yRvGaMFI0tAURRhEicgYGSwpQpvbQh23OgkV
	 Beycik5fCTH2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, dri-devel@lists.freedesktop.org, imx@lists.linux.dev
In-Reply-To: <20260720-drm_simple_encoder_init-v2-15-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-15-5020b630668a@gmail.com>
Date: Mon, 20 Jul 2026 16:07:25 +0000
Message-Id: <20260720160725.F26491F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gSW5jb21wbGV0ZSByZWZh
Y3RvcmluZyBjYXVzZXMgYnVpbGQgZmFpbHVyZSBpbiB0aGUgZ21hNTAwIGRyaXZlciBkdWUgdG8g
dW5jb252ZXJ0ZWQgdXNhZ2VzIG9mIGBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpYC4KLS0KCi0t
LSBQYXRjaCBbMTVdOiBbUEFUQ0ggdjIgMTUvMTVdIERvY3VtZW50YXRpb24vZ3B1OiByZW1vdmUg
Y29tcGxldGVkIGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkgdG9kbyAtLS0KY29tbWl0IGVjZWZi
YzQyZmYxY2JkMGUyMjhhMTc4NWMwNjZjZDNjYWI4ZGVhZmMKQXV0aG9yOiBEaW9nbyBTaWx2YSA8
ZGlvZ29tcGFpc3NpbHZhQGdtYWlsLmNvbT4KCkRvY3VtZW50YXRpb24vZ3B1OiByZW1vdmUgY29t
cGxldGVkIGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkgdG9kbwoKQWxsIGRybV9zaW1wbGVfZW5j
b2Rlcl9pbml0KCkgdXNlcnMgaGF2ZSBiZWVuIHJlbW92ZWQsIHNvIGRyb3AgdGhlCmNvbXBsZXRl
ZCB0b2RvIGl0ZW0uCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBi
L0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gaW5kZXggMTRjZjM3NTkwZmM3ZS4uYjczNTE0
NjdkYzc0YyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gQEAgLTI5LDIxICsyOSw2IEBAIHJlZmFjdG9y
aW5ncyBhbHJlYWR5IGFuZCBhcmUgYW4gZXhwZXJ0IGluIHRoZSBzcGVjaWZpYyBhcmVhCj4gIFN1
YnN5c3RlbS13aWRlIHJlZmFjdG9yaW5ncwo+ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT0K
PiAgCj4gLU9wZW4tY29kZSBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpCj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gLQo+IC1UaGUgaGVscGVyIGRybV9zaW1wbGVfZW5j
b2Rlcl9pbml0KCkgd2FzIHN1cHBvc2VkIHRvIHNpbXBsaWZ5IGVuY29kZXIKPiAtaW5pdGlhbGl6
YXRpb24uIEluc3RlYWQgaXQgb25seSBhZGRlZCBhbiBpbnRlcm1lZGlhdGUgbGF5ZXIgYmV0d2Vl
biBhdG9taWMKPiAtbW9kZXNldHRpbmcgYW5kIHRoZSBEUk0gZHJpdmVyLgo+IC0KPiAtVGhlIHRh
c2sgaGVyZSBpcyB0byByZW1vdmUgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKS4gU2VhcmNoIGZv
ciBhIGRyaXZlcgoKW1NldmVyaXR5OiBMb3ddCkFyZSB0aGVyZSBzdGlsbCByZW1haW5pbmcgdXNl
cnMgb2YgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKSBpbiB0aGUgdHJlZT8KCkxvb2tpbmcgYXQg
dGhlIGdtYTUwMCBkcml2ZXIsIGl0IGFwcGVhcnMgdGhlcmUgYXJlIHNldmVyYWwgdW5jb252ZXJ0
ZWQgY2FsbHMKcmVtYWluaW5nLCBzdWNoIGFzIGluIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2
X2ludGVsX2NydC5jOgoKY2R2X2ludGVsX2NydF9pbml0KCkgewogICAgLi4uCiAgICByZXQgPSBk
cm1fc2ltcGxlX2VuY29kZXJfaW5pdChkZXYsIGVuY29kZXIsIERSTV9NT0RFX0VOQ09ERVJfREFD
KTsKICAgIC4uLgp9CgpUaGVyZSBhbHNvIHNlZW0gdG8gYmUgc2ltaWxhciBjYWxscyBpbiBjZHZf
aW50ZWxfZHAuYywgY2R2X2ludGVsX2hkbWkuYywKY2R2X2ludGVsX2x2ZHMuYywgb2FrdHJhaWxf
aGRtaS5jLCBvYWt0cmFpbF9sdmRzLmMsIGFuZCBwc2JfaW50ZWxfbHZkcy5jLgoKV2lsbCB0aGlz
IGNhdXNlIGEgYnVpbGQgZmFpbHVyZSB3aGVuIGNvbXBpbGluZyB3aXRoIENPTkZJR19EUk1fR01B
NTAwIGlmIHRoZQp1bmRlcmx5aW5nIGZ1bmN0aW9uIGlzIHJlbW92ZWQgYmVmb3JlIHRoZXNlIGFy
ZSBjb252ZXJ0ZWQ/Cgo+IC10aGF0IGNhbGxzIGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkgYW5k
IGlubGluZSB0aGUgaGVscGVyLiBUaGUgZHJpdmVyIHdpbGwKPiAtYWxzbyBuZWVkIGl0cyBvd24g
aW5zdGFuY2Ugb2YgZHJtX2VuY29kZXJfZnVuY3MuCj4gLQo+IC1Db250YWN0OiBUaG9tYXMgWmlt
bWVybWFubiwgcmVzcGVjdGl2ZSBkcml2ZXIgbWFpbnRhaW5lcgo+IC0KPiAtTGV2ZWw6IEVhc3kK
PiAtCj4gIFJlcGxhY2Ugc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlIHdpdGggcmVndWxh
ciBhdG9taWMgaGVscGVycwo+ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjAtZHJtX3NpbXBsZV9lbmNvZGVy
X2luaXQtdjItMC01MDIwYjYzMDY2OGFAZ21haWwuY29tP3BhcnQ9MTUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
