Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290F5606A31C
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 20:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mta/N2T0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mxK01jt4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z5JNsrhb+hpdebyyNnHyR+pLoETqnMD+dDP2JTvkX9s=; b=mta/N2T0wognh4SCmQ1FqH/X1f
	kVNw0vqRhVdZHApAlIax1RmUmHeEB2rTiJjhHNZ5k+eMPTB+FmWXynFAGmwAzVG0iYtpauymiKHrb
	xQRTlsIhsKAYjegh7LjXgcPA8SP7+M473q0FC/ZAUpVxzL1RrL1j0/nCsn1gmZy3vTQzfboCjI11C
	cpfoOnxYcPXyNOua6ALulB+cqmZq4L34sE7YaJkj/rBnGRUxjfoGIhqMj0gTER6HgnmlmF2uskW4M
	BBTJgfxDKURI+MrRcjDLoYYjR2I+A77ZoOhtNRxzES0ywTwYZx17kWZR13V+PVQuGbllDDVU2QjGV
	3ROsBquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPWi-00000006zaq-1LzD;
	Tue, 17 Nov 2026 20:11:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPWf-00000006zah-1o0M;
	Tue, 17 Nov 2026 20:11:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E8EB60F34;
	Tue, 17 Nov 2026 20:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82BB1F000C5;
	Tue, 17 Nov 2026 20:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794946292;
	bh=o1Y/yNbkW2bZMPXGpyxomoYGDfphc/X8oVtcisFJF/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mxK01jt4UnB6GGRkK3XBjM7Wv9pTSp0H6bwXjTnQrTNecq0e19UljW9rpEbjbLou2
	 HT051gZxjbrrOFqQZEEhkMRikxEOy8ATUMeXemwAGWbOtdSVTh+KDD3yl8rYoGfFh+
	 yDOeuBxfYbfClk89EWalLhTbOY22jZv1ufcflwJnyaLtoz855Y7JrAwcPvPYpnSh48
	 Ms8Zv8AEo5qtbbja0tXJxpDK3K2tOJLCwDCYr7vGiOzK+XTMcVlGpT77h0TPwa67r6
	 jPBaSryASiMUdgxzpqyRTLDfff3DRr/jfbvfe8jWjYQ+b3xCbJizPA87xoKAVW5RtO
	 X0Ri0s6MRn/Fw==
Message-ID: <sashiko-outbox-219570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] drm/meson: dw-hdmi: Drop manual HHI clock and
 memory PD setup
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-6-9e0ac931381c@aliel.fr>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-6-9e0ac931381c@aliel.fr>
Date: Tue, 17 Nov 2026 20:11:31 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRybS9tZXNvbjogZHctaGRt
aTogc2tpcHBlZCBIRE1JVFggbWVtIFBEIHBvd2VyLXVwIGluCiAgbWVzb25fZHdfaGRtaV9pbml0
KCkKLS0KCmNvbW1pdCBjOGU3ODIwOTlmNzU4YmY2MzU0MDI3MDVhMjBmNTdkN2RmOTY4MmE3CkF1
dGhvcjogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cgpkcm0vbWVz
b246IGR3LWhkbWk6IERyb3AgbWFudWFsIEhISSBjbG9jayBhbmQgbWVtb3J5IFBEIHNldHVwCgpU
aGlzIGNvbW1pdCByZW1vdmVzIHRoZSBkaXJlY3QgSEhJX0hETUlfQ0xLX0NOVEwgYW5kIEhISV9N
RU1fUERfUkVHMApyZWdpc3RlciB3cml0ZXMgaW4gbWVzb25fZHdfaGRtaV9pbml0KCkgYW5kIHRh
a2VzIGEgcnVudGltZSBQTSByZWZlcmVuY2UKaW4gbWVzb25fZHdfaGRtaV9wcm9iZSgpIHRvIHBv
d2VyIG9uIHRoZSBWUFUgcG93ZXIgZG9tYWluLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
d19oZG1pLmMKPiBpbmRleCBlYjMzYzcwZjI5YzMxLi4yMGE4MjE5MzZiM2FmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jClsgLi4uIF0KPiBAQCAtNTk5LDEyICs1OTgs
NiBAQCBzdGF0aWMgdm9pZCBtZXNvbl9kd19oZG1pX2luaXQoc3RydWN0IG1lc29uX2R3X2hkbWkg
Km1lc29uX2R3X2hkbWkpCj4gIHsKPiAgCXN0cnVjdCBtZXNvbl9kcm0gKnByaXYgPSBtZXNvbl9k
d19oZG1pLT5wcml2Owo+ICAKPiAtCS8qIEVuYWJsZSBjbG9ja3MgKi8KPiAtCXJlZ21hcF91cGRh
dGVfYml0cyhwcml2LT5oaGksIEhISV9IRE1JX0NMS19DTlRMLCAweGZmZmYsIDB4MTAwKTsKPiAt
Cj4gLQkvKiBCcmluZyBIRE1JVFggTUVNIG91dHB1dCBvZiBwb3dlciBkb3duICovCj4gLQlyZWdt
YXBfdXBkYXRlX2JpdHMocHJpdi0+aGhpLCBISElfTUVNX1BEX1JFRzAsIDB4ZmYgPDwgOCwgMCk7
Cj4gLQo+ICAJLyogUmVzZXQgSERNSVRYIEFQQiAmIFRYICYgUEhZICovCj4gIAlyZXNldF9jb250
cm9sX3Jlc2V0KG1lc29uX2R3X2hkbWktPmhkbWl0eF9hcGIpOwo+ICAJcmVzZXRfY29udHJvbF9y
ZXNldChtZXNvbl9kd19oZG1pLT5oZG1pdHhfY3RybCk7Cj4gQEAgLTgyOSw5ICs4MjIsMjkgQEAg
c3RhdGljIGludCBfX21heWJlX3VudXNlZCBtZXNvbl9kd19oZG1pX3BtX3Jlc3VtZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgbWVzb25f
ZHdfaGRtaV9wbV9wdXQodm9pZCAqZGV2KQo+ICt7Cj4gKwlwbV9ydW50aW1lX3B1dF9zeW5jKGRl
dik7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgbWVzb25fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gLQlyZXR1cm4gY29tcG9uZW50X2FkZCgmcGRldi0+
ZGV2LCAmbWVzb25fZHdfaGRtaV9vcHMpOwo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gZGV2bV9wbV9ydW50aW1lX2VuYWJsZShk
ZXYpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCXJldCA9IHBtX3J1bnRp
bWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gcG93ZXIgb24gSERNSSBUWFxuIik7CgpbU2V2ZXJp
dHk6IEhpZ2hdCkNhbiBkcm9wcGluZyB0aGUgSEhJX01FTV9QRF9SRUcwIHdyaXRlIGxlYXZlIHRo
ZSBIRE1JVFggbWVtb3J5IHBvd2VyZWQKZG93biB3aGVuIHRoZSBib290bG9hZGVyIHR1cm5zIG9u
IHRoZSB0b3AtbGV2ZWwgVlBVIGRvbWFpbiB3aXRob3V0CmVuYWJsaW5nIEhETUk/CgpJbiB0aGUg
VlBVIHBvd2VyIGRvbWFpbiBkcml2ZXIsIHB3cmNfZWVfaXNfcG93ZXJlZF9vZmYoKSBvbmx5IGNo
ZWNrcyB0aGUKdG9wLWxldmVsIEFPIHNsZWVwIGJpdCBhbmQgZG9lcyBub3QgY2hlY2sgSEhJX01F
TV9QRF9SRUcwWzE1OjhdLiAgV2hlbgp0aGUgdG9wLWxldmVsIFZQVSBkb21haW4gaXMgYWxyZWFk
eSBwb3dlcmVkIG9uIGF0IGJvb3QsCm1lc29uX2VlX3B3cmNfaW5pdF9kb21haW4oKSByZWdpc3Rl
cnMgdGhlIGdlbnBkIGFzIGFscmVhZHkgb24gd2l0aG91dApjYWxsaW5nIG1lc29uX2VlX3B3cmNf
b24oKToKCmRyaXZlcnMvcG1kb21haW4vYW1sb2dpYy9tZXNvbi1lZS1wd3JjLmM6bWVzb25fZWVf
cHdyY19pbml0X2RvbWFpbigpIHsKCS4uLgoJaWYgKGRvbS0+bnVtX2Nsa3MgJiYgZG9tLT5kZXNj
LmlzX3Bvd2VyZWRfb2ZmICYmICFkb20tPmRlc2MuaXNfcG93ZXJlZF9vZmYoZG9tKSkgewoJCXJl
dCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKGRvbS0+bnVtX2Nsa3MsIGRvbS0+Y2xrcyk7CgkJ
aWYgKHJldCkKCQkJcmV0dXJuIHJldDsKCgkJZG9tLT5iYXNlLmZsYWdzID0gR0VOUERfRkxBR19B
TFdBWVNfT047CgkJcmV0ID0gcG1fZ2VucGRfaW5pdCgmZG9tLT5iYXNlLCBOVUxMLCBmYWxzZSk7
CgkJaWYgKHJldCkKCQkJcmV0dXJuIHJldDsKCX0KCS4uLgp9CgpCZWNhdXNlIHRoZSBnZW5wZCBp
cyBpbml0aWFsaXplZCBpbiB0aGUgT04gc3RhdGUgd2l0aApHRU5QRF9GTEFHX0FMV0FZU19PTiwg
cG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGlzIGEgbm8tb3AgYW5kCm1lc29uX2VlX3B3cmNf
b24oKSBuZXZlciBydW5zIHRvIGNsZWFyIEhISV9NRU1fUERfUkVHMFsxNTo4XSwgbGVhdmluZwpI
RE1JVFggbWVtb3J5IHBvd2VyZWQgZG93biB3aGVuIG1lc29uX2R3X2hkbWlfaW5pdCgpIGFuZCBk
d19oZG1pX3Byb2JlKCkKYWNjZXNzIHRoZSBjb250cm9sbGVyLgoKSW4gYWRkaXRpb24sIHBvd2Vy
LWRvbWFpbnMgYW5kIGFzc2lnbmVkLWNsb2NrcyBhcmUgb3B0aW9uYWwgaW4gdGhlCmFtbG9naWMs
bWVzb24tZHctaGRtaSBiaW5kaW5nIGFuZCB3ZXJlIG9ubHkgYWRkZWQgdG8gaW4tdHJlZSBEVHMg
aW4KdjYuMTEsIHNvIGRyb3BwaW5nIHRoZSBISElfSERNSV9DTEtfQ05UTCBhbmQgSEhJX01FTV9Q
RF9SRUcwIHdyaXRlcyBhbHNvCnJlZ3Jlc3NlcyBvbGRlciBEVEJzICh3aGVyZSBtZXNvbl92Y2xr
X3NldCgpIG9ubHkgY29uZmlndXJlcwpISElfSERNSV9DTEtfQ05UTCBsYXRlciBhdCBhdG9taWNf
ZW5hYmxlIHRpbWUpIGFuZCBidWlsZHMgd2l0aCBDT05GSUdfUE0KZGlzYWJsZWQuCgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTE3
LW1lc29uLWRybS1jcmVhdGUtaGRtaXR4LXBoeS12MS0wLTllMGFjOTMxMzgxY0BhbGllbC5mcj9w
YXJ0PTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
