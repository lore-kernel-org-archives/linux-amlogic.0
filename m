Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7512DC04AA5
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qpE1nRY93+DKtZJq4C9QEcK8oeh0If8TfbVJmwJJsc=; b=Y78yLhekDu46DL
	IiKc5x/bp7VAjJGyWCcerpBhrOB4A3waKP2h2BssnClCe/KDTcwolmxk61usnzMUWCbnMgFFnTPNx
	u1EqeT0ckWJsUQTcC3rCT8X73IY34QSgbbmxouibZiPPJBw0IpQtZWoUbBB0Qpx88WtUczJtr9+W+
	RO8+qMybN/JrRjB/48ZNpZzoDC810iFN2LECYIu8VszQXLgd3n6EGJhMrr7l5yZL7AkdF8g6sxVAf
	5Qkn6zSzfeOPwVctJCwFW9mbRX1+6WYQuwt8YkD37qZSnRMXh3UgwNhsYuM4dcd6lwhorW+UPBcC0
	GaqTzsGxTW6SvHCD71HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCgk-00Ea6K-Ey; Thu, 25 Aug 2022 13:14:26 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCgT-00EZM1-BU; Thu, 25 Aug 2022 13:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HE8hTk+H5l+7TVDNJJZsO8rmjAkuVyVw8iY3tny3vDM=; b=fGwxP9A2syGp/ejDXu2bKS2mFC
	CW0jtYFVyzVsNSvpKIvYVXukB5W1rP7NYwwkrWkkTPBUwg0GaeeTQQo02hU+/T08VxcDor1vicyfe
	CKFE2p6xI64sUWgC2FcN8SSGKMFJ+F0Bryif7wVyR4J/6m4tJcFwkaSNu79RWTzs9y3J7gvSgjNkH
	2/9duRDkWKmwqJtKcx6ugWMtFp+pKF4uPqABJZJYCsbGAicistOldWIRhovFatcsSiWtITzDcY/Lg
	aF7yAEP6nUKDjOKyV8flHCPd0SSbzCKO9ld5ZY1JNrndfD1AsMC7CcJmOvp5oeh0i3KeoRkPvGBZF
	tjrKBgqw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=63408)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oRCgQ-0001R9-1W; Thu, 25 Aug 2022 15:14:06 +0200
Message-ID: <7bdcc3c4-e04c-c2f3-5691-bcbdb158276f@tronnes.org>
Date: Thu, 25 Aug 2022 15:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 23/35] drm/vc4: vec: Convert to the new TV mode
 property
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-23-3d53ae722097@cerno.tech>
 <0255f7c6-0484-6456-350d-cf24f3fee5d6@tronnes.org>
 <20220824152619.5def5b2puj5b2a3o@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220824152619.5def5b2puj5b2a3o@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_061409_415681_4BA932B8 
X-CRM114-Status: GOOD (  18.58  )
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

CgpEZW4gMjQuMDguMjAyMiAxNy4yNiwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBIaSwKPiAKPiBP
biBTYXQsIEF1ZyAyMCwgMjAyMiBhdCAwNzoyMjo0OFBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMg
d3JvdGU6Cj4+IERlbiAyOS4wNy4yMDIyIDE4LjM1LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4g
Tm93IHRoYXQgdGhlIGNvcmUgY2FuIGRlYWwgZmluZSB3aXRoIGFuYWxvZyBUViBtb2RlcywgbGV0
J3MgY29udmVydCB0aGUgdmM0Cj4+PiBWRUMgZHJpdmVyIHRvIGxldmVyYWdlIHRob3NlIG5ldyBm
ZWF0dXJlcy4KPj4+Cj4+PiBXZSd2ZSBhZGRlZCBzb21lIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkg
dG8gc3VwcG9ydCB0aGUgb2xkIFRWIG1vZGUgcHJvcGVydHkKPj4+IGFuZCB0cmFuc2xhdGUgaXQg
aW50byB0aGUgbmV3IFRWIG5vcm0gcHJvcGVydHkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWF4
aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X3ZlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdmVjLmMK
Pj4KPj4+ICBzdGF0aWMgaW50IHZjNF92ZWNfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+Pj4gIHsKPj4+IC0Jc3RydWN0IGRybV9jb25uZWN0b3Jf
c3RhdGUgKnN0YXRlID0gY29ubmVjdG9yLT5zdGF0ZTsKPj4+ICAJc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGU7Cj4+PiAgCj4+PiAtCW1vZGUgPSBkcm1fbW9kZV9kdXBsaWNhdGUoY29ubmVj
dG9yLT5kZXYsCj4+PiAtCQkJCSAgdmM0X3ZlY190dl9tb2Rlc1tzdGF0ZS0+dHYubW9kZV0ubW9k
ZSk7Cj4+PiArCW1vZGUgPSBkcm1fbW9kZV9kdXBsaWNhdGUoY29ubmVjdG9yLT5kZXYsICZkcm1f
bW9kZV80ODBpKTsKPj4+ICsJaWYgKCFtb2RlKSB7Cj4+PiArCQlEUk1fRVJST1IoIkZhaWxlZCB0
byBjcmVhdGUgYSBuZXcgZGlzcGxheSBtb2RlXG4iKTsKPj4+ICsJCXJldHVybiAtRU5PTUVNOwo+
Pj4gKwl9Cj4+PiArCj4+PiArCWRybV9tb2RlX3Byb2JlZF9hZGQoY29ubmVjdG9yLCBtb2RlKTsK
Pj4+ICsKPj4+ICsJbW9kZSA9IGRybV9tb2RlX2R1cGxpY2F0ZShjb25uZWN0b3ItPmRldiwgJmRy
bV9tb2RlXzU3NmkpOwo+Pgo+PiBNYXliZSB0aGUgbW9kZSB0aGF0IG1hdGNoZXMgdHYubm9ybSBz
aG91bGQgYmUgbWFya2VkIGFzIHByZWZlcnJlZCBzbwo+PiB1c2Vyc3BhY2Uga25vd3Mgd2hpY2gg
b25lIHRvIHBpY2s/Cj4gCj4gSSdtIG5vdCBzdXJlIGhvdyByZWFsaXN0aWMgdGhhdCB3b3VsZCBi
ZS4gRG9pbmcgdGhpcyBiYXNlZCBvbiB0aGUgZHJpdmVyCj4gLyBjbWRsaW5lIHByZWZlcmVuY2Ug
aXMgZ29pbmcgdG8gYmUgZmFpcmx5IGVhc3ksIGJ1dCB0aGVuIGl0J3MgYQo+IHByb3BlcnR5LCBp
dCdzIGdvaW5nIHRvIGJlIHVwZGF0ZWQsIGFuZCB3ZSBwcm9iYWJseSBkb24ndCB3YW50IHRvIG1l
c3MKPiBhcm91bmQgdGhlIG1vZGUgZmxhZ3MgYmFzZWQgb24gbmV3IHByb3BlcnR5IHZhbHVlcz8K
PiAKClN0cmljdGx5IHNwZWFraW5nIHdlIG5lZWQgdG8gZmlyZSBhbiBldmVudCB0byB1c2Vyc3Bh
Y2UgaWYgdGhlIG1vZGUKY2hhbmdlcywgYW5kIHRoaXMgaXMgcHJvYmFibHkgbm90IHN0cmFpZ2h0
Zm9yd2FyZCB0byBkbyB1bmRlcm5lYXRoCm1vZGVzZXQgbG9ja3MsIHdvdWxkIHByb2JhYmx5IG5l
ZWQgYSB3b3JrZXIuCgpDbGV2ZXIgdXNlcnNwYWNlIGxpa2UgR05PTUUgd2lsbCB0cnkgdG8gdXNl
IHRoZSBhY3RpdmUgbW9kZSwgc28gaXQgd2lsbApoYW5kbGUgdGhpcyB0aGF0IHdheS4gSWYgc29t
ZW9uZSBoYXMgc2V0IHVwIHRoZSBwaXBlbGluZSBmaXJzdCB0aGF0IGlzLgpkcm1fY2xpZW50L2Zi
ZGV2IGFuZCBwbHltb3V0aCBjYW4gZG8gdGhhdCBiZWNhdXNlIHRoZXkgaG9ub3VyIHVzZXJkZWYg
bW9kZXMuCgpPdGhlciB1c2Vyc3BhY2UgdGhhdCBkb24ndCBrbm93IHRoZSB1c2VyZGVmIGZsYWcg
d2lsbCBmYWxsYmFjayB0byB0aGUKZmlyc3QgbW9kZSB3aGljaCBpcyBOVFNDIHdoaWNoIGlzIGFs
c28gdGhlIGRlZmF1bHQgdHZtb2RlLCBzbyBtYXliZSB0aGlzCmlzIGdvb2QgZW5vdWdoLiBQQUwg
dXNlcnMgd2lsbCBoYXZlIHRvIHNwZWNpZnkgdGhlIG1vZGUsIG9yIHRlYWNoIHRoZWlyCnByb2dy
YW0gYWJvdXQgdGhlIHVzZXJkZWYgZmxhZy4KCkJ1dCBvZmMgcmVseWluZyBvbiB0aGUgdXNlcmRl
ZiBmbGFnIGRlcGVuZHMgb24gdGhlIGZhY3QgdGhhdCB0aGVyZSdzIGEKbW9kZSBvbiB0aGUga2Vy
bmVsIGNvbW1hbmQgbGluZSwgYnV0IG1heWJlIHRoZXJlJ3Mgbm8gd2F5IHRvIGF2b2lkIHRoYXQK
c2luY2UgbXVjaC9tb3N0PyB1c2Vyc3BhY2UgdHJlYXQgInVua25vd24iIGNvbm5lY3RvciBzdGF0
dXMgYXMKZGlzY29ubmVjdGVkIHNvIG1hbnkgd2lsbCBoYXZlIHRvIGZvcmNlIHRoZSBjb25uZWN0
b3IgdG8gImNvbm5lY3RlZCIKYW55d2F5LiBBdCBsZWFzdCBJIGRvbid0IGtub3cgYW55IHdheSB0
byBwZXJtYW5ldGx5IGZvcmNlIHRoZSBjb25uZWN0b3IKc3RhdHVzIG90aGVyIHRoYW4gdXNpbmcg
dmlkZW89LgoKTm9yYWxmLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
