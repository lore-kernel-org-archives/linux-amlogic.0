Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432E7C5DF85
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 19:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wp7smuyx4cqmmE3S8sV9+nPIKOCFX9muTMFnxC5Hi4I=; b=1ixLZJQFxbSw/n
	xSQ/UrvXPWlSsxNBXhK9FIP25ngCLWXi8k9ml7mK5g6RvlTqCPLRtWAYnMJH0vOmC02pF52awdoHK
	eyaXGs0JoTbUyD4n0OlShr2dAM4yIkpy+7DhG5dNJHwU5hNl7dpiJ/SRjn3aMYFpPVbrZm8EnV1GX
	JVhQ4ihhRQsUamGH67g2ZsCGGWeE5aMOwdRjwJ9zdsB2ifiP/gnYW8+27C6B69jqtReQNFu0OOAom
	cr0r3CzU+zn7h7NikEXvBlStpL6O2SrX0xabk+knkWRk0ZojZ8SsBSiMzbCorTL+aX5aOAa4aWUeg
	sAYmj/ZqPol+bDsKQOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwliw-0000000AR4K-21Zu;
	Wed, 19 Aug 2026 19:13:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwliv-0000000AR3t-1MLJ
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 19:13:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D78F7413CA;
	Wed, 19 Aug 2026 19:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2F21F000E9;
	Wed, 19 Aug 2026 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166796;
	bh=7QPB8xntRosfEaEsyywjE8Y9e9e7wAx1p25F0kiuc9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=avFL27vf7uiDuhOHLuxB/2oCnPMbgPs124dXFVRT5tHaeRQQCP2+ZifxIXNr163q2
	 0WmOepLH205z65+O10bAs3Vs3o9P+7gMNQJSoER6EPsgVcLrdvg9AhHM25vpQD4TBn
	 D7zzhY7iNTS25TLnTyPGlM0Z4ugnBZLe/UkucPfZmSjQD/DjwXn/VGH6WULFwtEIqd
	 EFe19QZUf3E8F9SDthfUMIVl4MrNFn1LFrQWoxUh1S95SvS5g3u+Zl9n2ksOSMqwqs
	 sL+XArbeCt8QqsqbIfzmhN/qwKpv/2F7M5AtiFK/Vj7pwf0IXIJozlH7biGZyhTfLL
	 pmeSDzXiC4yUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-hwmon@vger.kernel.org
In-Reply-To: <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
Date: Wed, 19 Aug 2026 19:13:16 +0000
Message-Id: <20260819191316.8F2F21F000E9@smtp.kernel.org>
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
IFtIaWdoXSBJbmNvbXBsZXRlIGZpeCBmb3IgdW5pbml0aWFsaXplZCBzdGFjayB2YXJpYWJsZXM6
IGBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIHBhcmVudF9kYXRhYCByZW1haW5zIHVuaW5pdGlhbGl6
ZWQgb24gdGhlIHN0YWNrLCBsZWFkaW5nIHRvIGEga2VybmVsIGNyYXNoIGR1cmluZyBjbG9jayBy
ZWdpc3RyYXRpb24uCi0tCgotLS0gUGF0Y2ggWzRdOiBbUEFUQ0ggdHJlZXdpZGUgNC81XSBpaW86
IGZyZXF1ZW5jeTogYWRmNDM3NzogTWFrZSBzdXJlIGNsa19pbml0X2RhdGEgaXMgZnVsbHkgaW5p
dGlhbGl6ZWQgLS0tCmNvbW1pdCA5OWUwMjRhNzdmNWJjZTU5MjFkM2M2YjQ2MDU0MjYzYWE0NTA2
MTBkCkF1dGhvcjogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4K
CmlpbzogZnJlcXVlbmN5OiBhZGY0Mzc3OiBNYWtlIHN1cmUgY2xrX2luaXRfZGF0YSBpcyBmdWxs
eSBpbml0aWFsaXplZAoKVGhpcyBjb21taXQgaW5pdGlhbGl6ZXMgdGhlIGNsa19pbml0X2RhdGEg
c3RydWN0dXJlIGluCmFkZjQzNzdfY2xrX3JlZ2lzdGVyKCkgdG8gemVyby4gVGhpcyBwcmV2ZW50
cyBjcmFzaGVzIGNhdXNlZCBieQp1bmluaXRpYWxpemVkIGZpZWxkcyBsaWtlIHBhcmVudF9uYW1l
cyB3aGVuIENPTkZJR19JTklUX1NUQUNLX0FMTF9QQVRURVJOCm9yIENPTkZJR19JTklUX1NUQUNL
X05PTkUgaXMgZW5hYmxlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2ZyZXF1ZW5jeS9h
ZGY0Mzc3LmMgYi9kcml2ZXJzL2lpby9mcmVxdWVuY3kvYWRmNDM3Ny5jCj4gLS0tIGEvZHJpdmVy
cy9paW8vZnJlcXVlbmN5L2FkZjQzNzcuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2ZyZXF1ZW5jeS9h
ZGY0Mzc3LmMKPiBAQCAtOTk5LDcgKzk5OSw3IEBAIHN0YXRpYyBpbnQgYWRmNDM3N19jbGtfcmVn
aXN0ZXIoc3RydWN0IGFkZjQzNzdfc3RhdGUgKnN0KQo+ICB7Cj4gIAlzdHJ1Y3Qgc3BpX2Rldmlj
ZSAqc3BpID0gc3QtPnNwaTsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzcGktPmRldjsKPiAt
CXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQ7Cj4gKwlzdHJ1Y3QgY2xrX2luaXRfZGF0YSBpbml0
ID0ge307Cj4gIAlzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIHBhcmVudF9kYXRhOwoKW1NldmVyaXR5
OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIHN0cnVj
dCBjbGtfcGFyZW50X2RhdGEgYWxzbwpuZWVkIHRvIGJlIHplcm8taW5pdGlhbGl6ZWQ/CgpPbmx5
IGZ3X25hbWUgaXMgZXhwbGljaXRseSBhc3NpZ25lZCBiZWxvdywgbGVhdmluZyBuYW1lLCBodywg
YW5kIGluZGV4CnBvcHVsYXRlZCB3aXRoIHN0YWNrIGdhcmJhZ2UuIFdoZW4gYWRmNDM3N19jbGtf
cmVnaXN0ZXIoKSBwYXNzZXMgdGhpcyB0bwp0aGUgY2xvY2sgZnJhbWV3b3JrLCBjbGtfY29yZV9w
b3B1bGF0ZV9wYXJlbnRfbWFwKCkgd2lsbCByZWFkCnBhcmVudF9kYXRhLm5hbWUgYW5kIHBhc3Mg
aXQgdG8gY2xrX2NweV9uYW1lKCksIHdoaWNoIHVsdGltYXRlbHkgY2FsbHMKc3RybGVuKCkgYW5k
IGNhbiBjYXVzZSBhIHBhZ2UgZmF1bHQgZHVyaW5nIHByb2JlLgoKWyAuLi4gXQoKPiAgCXBhcmVu
dF9kYXRhLmZ3X25hbWUgPSAicmVmX2luIjsKPiAgCj4gIAlpbml0Lm9wcyA9ICZhZGY0Mzc3X2Ns
a19vcHM7Cj4gIAlpbml0LnBhcmVudF9kYXRhID0gJnBhcmVudF9kYXRhOwoKLS0gClNhc2hpa28g
QUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC9jb3Zlci4xNzg3MTY1
MzI5LmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZT9wYXJ0PTQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
