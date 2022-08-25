Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E15C28D13
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9W4ZGByTU2qQDC8N+Z/0KHZFP0nDk5cbZ4jJ7acW5e8=; b=OoVAEHk54Z9OJ/
	bMWzg30T9KFzj0epscOAqDpbH/4Qi0sPZFMGRebWATvVhLGqU7T4FefkI9k4HYP9xurRhXt0JjrOe
	e3wxC1AEURPqYUfpwBogX3kzWfq48VUkVJmCcoI5nHcIqLMARfAspEr/HHtrrYWl+V80xM9CfYHOY
	KjpSur/czooSgHkgSS8qU9w5kbuFV3hUJ3dqD7dGrGLttfB4lN6XvVKpzjFO2fnf/dAj7NTntDFri
	Xb6xgxUqSqT0dzr71VnAt+ERARKHqD5zOLU3XGkv4RHwu2pyPKofV2T+0aTl/RdGEc9IUlrrlJrSQ
	JhWiuIrvSR3fb7gNpm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREYj-00FbAd-Ih; Thu, 25 Aug 2022 15:14:17 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREY7-00FatE-BN; Thu, 25 Aug 2022 15:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ds1ED9/E8RnGTPOcmFhmM3nxfl6XFIk5DEUz5wvPIYY=; b=XM7AfOD/00Npw2p+NjBfouwELf
	I9bRHc2R4q55W61qDwzprV6raEBmp4A4jIPmklgYwmujyF0ZIsrepW67YNfWDpYTQejiqU9UfqPgu
	mLwLWAV5zakGYqrErCtzYBGrEqWkK/I2qst6oBbL5qVI12WDJ14XSDOOvRgSJlxheFZKfmjx5bf4n
	Gk+1H7L8wo6G2gMVjrLOhbMm1TG24aLDoJYl7EU+tXEf21icteOQdosRQJ5RsbGNc2n6g9FGV4VH8
	RrJn1xVGCUvZumcitD1aHU1U76EUa9VdCG9QH08Xd74yBAyeiWBUMrUxhU5cSSEYP/n3RhqRonkjf
	lUzM52kQ==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=49886)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oREY2-0007oo-36; Thu, 25 Aug 2022 17:13:34 +0200
Message-ID: <863beb42-1012-b38a-0c3d-89b7e035aa82@tronnes.org>
Date: Thu, 25 Aug 2022 17:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
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
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <37a76651-a457-e50d-9a05-00ca9ed5d729@tronnes.org>
 <20220825134408.dioj2lbycl7jm3ld@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220825134408.dioj2lbycl7jm3ld@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_081339_452177_24D1E765 
X-CRM114-Status: GOOD (  16.88  )
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

CgpEZW4gMjUuMDguMjAyMiAxNS40NCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBIaSwKPiAKPiBP
biBTYXQsIEF1ZyAyMCwgMjAyMiBhdCAxMDoxMjo0NlBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMg
d3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5j
bHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4+PiBpbmRleCAxZTk5OTZiMzNjYzguLjc4Mjc1ZTY4
ZmY2NiAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+Pj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4+PiBAQCAtMTQzLDYgKzE0MywzMiBAQCBl
bnVtIHN1YnBpeGVsX29yZGVyIHsKPj4+ICAKPj4+ICB9Owo+Pj4gIAo+Pj4gKyNkZWZpbmUgRFJN
X01PREVfVFZfTk9STV9OVFNDXzQ0MwkoMSA8PCAwKQo+Pj4gKyNkZWZpbmUgRFJNX01PREVfVFZf
Tk9STV9OVFNDX0oJCSgxIDw8IDEpCj4+PiArI2RlZmluZSBEUk1fTU9ERV9UVl9OT1JNX05UU0Nf
TQkJKDEgPDwgMikKPj4+ICsjZGVmaW5lIERSTV9NT0RFX1RWX05PUk1fUEFMXzYwCQkoMSA8PCAz
KQo+Pj4gKyNkZWZpbmUgRFJNX01PREVfVFZfTk9STV9QQUxfQgkJKDEgPDwgNCkKPj4+ICsjZGVm
aW5lIERSTV9NT0RFX1RWX05PUk1fUEFMX0QJCSgxIDw8IDUpCj4+PiArI2RlZmluZSBEUk1fTU9E
RV9UVl9OT1JNX1BBTF9HCQkoMSA8PCA2KQo+Pj4gKyNkZWZpbmUgRFJNX01PREVfVFZfTk9STV9Q
QUxfSAkJKDEgPDwgNykKPj4+ICsjZGVmaW5lIERSTV9NT0RFX1RWX05PUk1fUEFMX0kJCSgxIDw8
IDgpCj4+PiArI2RlZmluZSBEUk1fTU9ERV9UVl9OT1JNX1BBTF9NCQkoMSA8PCA5KQo+Pj4gKyNk
ZWZpbmUgRFJNX01PREVfVFZfTk9STV9QQUxfTgkJKDEgPDwgMTApCj4+PiArI2RlZmluZSBEUk1f
TU9ERV9UVl9OT1JNX1BBTF9OQwkJKDEgPDwgMTEpCj4+PiArI2RlZmluZSBEUk1fTU9ERV9UVl9O
T1JNX1NFQ0FNXzYwCSgxIDw8IDEyKQo+Pj4gKyNkZWZpbmUgRFJNX01PREVfVFZfTk9STV9TRUNB
TV9CCSgxIDw8IDEzKQo+Pj4gKyNkZWZpbmUgRFJNX01PREVfVFZfTk9STV9TRUNBTV9ECSgxIDw8
IDE0KQo+Pj4gKyNkZWZpbmUgRFJNX01PREVfVFZfTk9STV9TRUNBTV9HCSgxIDw8IDE1KQo+Pj4g
KyNkZWZpbmUgRFJNX01PREVfVFZfTk9STV9TRUNBTV9LCSgxIDw8IDE2KQo+Pj4gKyNkZWZpbmUg
RFJNX01PREVfVFZfTk9STV9TRUNBTV9LMQkoMSA8PCAxNykKPj4+ICsjZGVmaW5lIERSTV9NT0RF
X1RWX05PUk1fU0VDQU1fTAkoMSA8PCAxOCkKPj4+ICsjZGVmaW5lIERSTV9NT0RFX1RWX05PUk1f
SEQ0ODBJCQkoMSA8PCAxOSkKPj4+ICsjZGVmaW5lIERSTV9NT0RFX1RWX05PUk1fSEQ0ODBQCQko
MSA8PCAyMCkKPj4+ICsjZGVmaW5lIERSTV9NT0RFX1RWX05PUk1fSEQ1NzZJCQkoMSA8PCAyMSkK
Pj4+ICsjZGVmaW5lIERSTV9NT0RFX1RWX05PUk1fSEQ1NzZQCQkoMSA8PCAyMikKPj4+ICsjZGVm
aW5lIERSTV9NT0RFX1RWX05PUk1fSEQ3MjBQCQkoMSA8PCAyMykKPj4+ICsjZGVmaW5lIERSTV9N
T0RFX1RWX05PUk1fSEQxMDgwSQkoMSA8PCAyNCkKPj4+ICsKPj4KPj4gVGhpcyBpcyBhbiBhcmVh
IHdoZXJlIERSTSBvdmVybGFwcyB3aXRoIHY0bDIsIHNlZToKPj4gLSBpbmNsdWRlL2R0LWJpbmRp
bmdzL2Rpc3BsYXkvc2R0di1zdGFuZGFyZHMuaAo+PiAtIHY0bDJfbm9ybV90b19uYW1lKCkKPj4K
Pj4gTWF5YmUgd2Ugc2hvdWxkIGZvbGxvdyBzdWl0LCBidXQgaWYgd2UgZG8gb3VyIG93biB0aGlu
ZyBwbGVhc2UgbWVudGlvbgo+PiB3aHkgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+IAo+IEFyZSB5
b3Ugc3VnZ2VzdGluZyB0aGF0IHdlJ2Qgc2hhcmUgdGhhdCBkZWZpbml0aW9uIHdpdGggdjRsMj8K
PiAKCklmIHBvc3NpYmxlLCB5ZXMuCgo+IEkndmUgdHJpZWQgdG8gc2hhcmUgc29tZSBjb2RlIGlu
IHRoZSBwYXN0IGJldHdlZW4gdjRsMiBhbmQgRFJNLCBhbmQgaXQKPiBnb3QgY29tcGxldGVseSBz
aHV0IGRvd24gc28gaXQncyBub3Qgc29tZXRoaW5nIEknZCBsaWtlIHRvIHRyeSBhZ2FpbiwgaWYK
PiBwb3NzaWJsZS4KPiAKCkJ1dCB0aGF0IGlzIGEgZ29vZCBlbm91Z2ggcmVhc29uIG5vdCB0byBk
byBzby4gSSBqdXN0IGdvdCB0aGUgaW1wcmVzc2lvbgpmcm9tIHNvbWUgb2YgTGF1cmVudCdzIGVt
YWlscyBhIHdoaWxlIGJhY2sgdGhhdCB0aGVyZSB3YXMgc29tZQpjb29wZXJhdGl2IGF0bW9zcGhl
cmUsIGJ1dCBJIG1pZ2h0IGJlIG1pc3Rha2VuIGluIG15IHJlYWRpbmcvdW5kZXJzdGFuZGluZy4K
Ckl0IGlzIG9mYyBwb3NzaWJsZSB0byBqdXN0IGNvcHkgdGhlIHZhbHVlcyBmcm9tIHNkdHYtc3Rh
bmRhcmRzLmgsIGJ1dCBJCnNlZSB0aGF0IGhkKiBpcyBtaXNzaW5nIGZyb20gdGhhdCBsaXN0LCBz
byBub3Qgc3VyZSBpZiB0aGVyZSdzIG11Y2gKcG9pbnQgaWYgaXQgaGFzIHRvIGJlIGV4dGVuZGVk
IHdpdGhvdXQgY2hhbmdpbmcgdGhlIHNvdXJjZS4KCldlIGNhbiBhdCBsZWFzdCB1c2UgdGhlIG5h
bWVzIGZyb20gdjRsMl9ub3JtX3RvX25hbWUoKSwgYnV0IGZyb20gYSBxdWljawpsb29rIGl0IHNl
ZW1zIHlvdSBhbHJlYWR5IGRvIHNvLgoKTm9yYWxmLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
