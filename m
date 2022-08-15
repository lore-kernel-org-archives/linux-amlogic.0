Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB9C00140
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQcgpXZAQLyIgX2WDV0YV1yGXsHn9J6xKDve2D8rDEo=; b=ebcp30+lDTOCKX
	MGATZRNLwo3P+x3JC9GM6EfPs7E3n88Y68TI/yOmvI640iJSKPVVYiVavFKq0aYVqyKYRt7//Wyza
	3xu7blP1jG5S2Am0q/e/1FLcDUurOVwLV2EC5FwcCCPu8b4o5ZUOha6JoizSLZrRKbT3m9R4hLcqq
	qq3JDBoB9IYvTvplFcK4+noGSV7t7Eis+0oc4i+Z7Md0jetH1Urpo6vdUnut4bArwuXc+Erajk1S0
	ckd2AMRBUqbWAVLtolZPUDNbtZ1jFW4ugQShRds9sTYXZls+rFESlQvh/24RvnYf/wJPMl+3Ks+gU
	8cnbFeEL3KjKDHyW1xUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNXiA-00ExAi-Qv; Mon, 15 Aug 2022 10:52:46 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNXe8-00Ev7e-4p; Mon, 15 Aug 2022 10:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vh4WP5c9FJ0MbLK61vY6yRT/SQaaMEr8RbbREz+rZ1g=; b=b1TJYcymPjKnvyimmR5TjK81Mu
	VqbuVBHbCfn54WGnqn0VB7piwq8YS9MKHNpYBPPOvVgVgp2zlJtU9MFGi7NrC9Be70mYyrw+TW1EW
	cNVYeWCOkfSvyulTlCiQT9jnM28OmqhwKChxRrhWHa812xj2Du4i5eaMDXWJDocyjv1ikGAs+wYcB
	XQ4Z6Yh28waRpNDKXpQZisudD5+cFUqFL8m9SLmx+AKeDFVXUCU0neZoELSCxtN5DM7H077grQe+s
	zywFm7UJLVQ7ZJpq4rQVY2XG4QCDYe/PczZS6fBvKKfGIJWQ+oB40qpMJNvxKx2PZqV93BUmiJ1d+
	2i/+GCAA==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=52543)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oNXe0-00013Y-A2; Mon, 15 Aug 2022 12:48:28 +0200
Message-ID: <53216533-d0d6-90d5-b9d1-c7d935867a54@tronnes.org>
Date: Mon, 15 Aug 2022 12:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 03/35] drm/atomic: Add TV subconnector property to
 get/set_property
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
 <20220728-rpi-analog-tv-properties-v1-3-3d53ae722097@cerno.tech>
 <6e47ce2d-25c7-7254-703d-2a1d3bb64373@tronnes.org>
 <20220815073546.4isrl7o3bt5g23pk@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220815073546.4isrl7o3bt5g23pk@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_034836_230112_1E77E17A 
X-CRM114-Status: GOOD (  15.65  )
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

CgpEZW4gMTUuMDguMjAyMiAwOS4zNSwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBIaSBOb3JhbGYs
Cj4gCj4gVGhhbmtzIGZvciB5b3VyIHJldmlldwo+IAo+IE9uIE1vbiwgQXVnIDA4LCAyMDIyIGF0
IDAyOjMwOjQyUE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4gRGVuIDI5LjA3LjIw
MjIgMTguMzQsIHNrcmV2IE1heGltZSBSaXBhcmQ6Cj4+PiBUaGUgc3ViY29ubmVjdG9yIHByb3Bl
cnR5IHdhcyBjcmVhdGVkIGJ5IGRybV9tb2RlX2NyZWF0ZV90dl9wcm9wZXJ0aWVzKCksCj4+PiBi
dXQgd2Fzbid0IGV4cG9zZWQgdG8gdGhlIHVzZXJzcGFjZSB0aHJvdWdoIHRoZSBnZW5lcmljCj4+
PiBhdG9taWNfZ2V0L3NldF9wcm9wZXJ0eSBpbXBsZW1lbnRhdGlvbiwgYW5kIHdhc24ndCBzdG9y
ZWQgaW4gYW55IGdlbmVyaWMKPj4+IHN0YXRlIHN0cnVjdHVyZS4KPj4+Cj4+PiBMZXQncyBzb2x2
ZSB0aGlzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJu
by50ZWNoPgo+Pgo+PiBJIGp1c3QgcmVhbGlzZWQgdGhhdCB0aGlzIGFuZCB0aGUgc2VsZWN0X3N1
YmNvbm5lY3RvciBwcm9wZXJ0eSBpc24ndAo+PiB1c2VkIGJ5IGFueSBkcml2ZXJzLiBEbyB5b3Ug
cGxhbiB0byB1c2UgdGhlbT8gTWF5YmUgdGhleSBkb24ndCBuZWVkIHRvCj4+IGJlIHdpcmVkIHVw
IGF0IGFsbC4KPiAKPiBJJ20gbm90IHN1cmUgcmVhbGx5Cj4gCj4gSXQncyB0cnVlIHRoYXQgdGhl
IHN1YmNvbm5lY3RvciBhbmQgc2VsZWN0X3N1YmNvbm5lY3RvciBmaWVsZHMgaW4gdGhlIFRWCj4g
Y29ubmVjdG9yIHN0YXRlIGFyZW4ndCB1c2VkIGJ5IGFueSBkcml2ZXIsIGJ1dCB0aGUgY2g3MDA2
IGFuZCBub3V2ZWF1Cj4gd2lsbCB1cGRhdGUgdGhlIHByb3BlcnR5IGNvbnRlbnQgdGhyb3VnaCBh
IGNhbGwgdG8KPiBkcm1fb2JqZWN0X3Byb3BlcnR5X3NldF92YWx1ZQo+IAo+IGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2kyYy9j
aDcwMDZfZHJ2LmMjTDIxNwo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvdHZudjE3LmMjTDE4NQo+
IAo+IEkgdGhpbmsgaXQgY291bGQgc3RpbGwgYmUgdXNlZnVsIHRvIHJlcG9ydCBpdCBpbiB0aGUg
Y29ubmVjdG9yIHN0YXRlLCBpZgo+IG9ubHkgZm9yIGNvbnNpc3RlbmN5Pwo+IAoKWWVhaCBtYXli
ZS4KCkkganVzdCByZWFsaXNlZCB0aGF0IEkgaGF2ZSBzdXBwb3J0IGluIHRoZSBHVUQgcHJvdG9j
b2wgZm9yIHRoZXNlCnByb3BlcnRpZXMgc28gYW55IGZ1dHVyZSBkZXZpY2VzIHRoYXQgcmVseSBv
biB0aGVtIHRoZW0gd2lsbCBuZWVkIHRoaXMKcGF0Y2gsIHNvIEknbSBub3cgc3VkZGVubHkgaW4g
ZmF2b3Igb2YgdGhpcyA6KQoKTm9yYWxmLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
