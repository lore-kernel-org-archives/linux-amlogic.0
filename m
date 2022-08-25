Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000DAC28D13
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwwHbnZRt4tzJFrmkhvV1D31ytNqtH/ONwoz80/8/+E=; b=TyCLa4lzn3L5JR
	W4fJH8q+vM3O5pT85qNG64cgiaBmWdXUzNWe/9zoAGpE2i2Olac5QLyR+dQKgaFoII/ITk0zwN8CB
	CCm5f5d9l2NY3RZrjeDo9hu1zPfPZHP8oAAiNevGqGYBpUYsFrBd609a/0nGWBI/h2e0hydw5UzES
	PAXJHOr+EP6Pp/ZdY9Cp/fva8NMrjflLgbFmBgT853f9meSvxqRGAwkdxJYj1fcM/rosigL/qb1NC
	Bb7f0hJLn/YR6UlwYChdm7cy4m4nMPU6YOMyFWz9IjqK11hh55N+ESznnSDRaL2xCFIAwvkztNSET
	E43jzmohcYRj9qSyZomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCBO-00DvCZ-4b; Thu, 25 Aug 2022 12:42:02 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCB6-00DuZM-Tv; Thu, 25 Aug 2022 12:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xCMa+Y2jIKgZ56OuN/h0oLf2cyBRDehvHfcF2kieVHM=; b=gtp5fNPa37EZTLE4UGvnHplqbA
	vyMYlZGWuG6x/vlNK5aG2I5bnpXR++EbUNXT5tssiuWTzKYGbg/uDWZJyWkScURq7WSC91GXEypRb
	msmYY5Vtm/smg/6qT3kp3/NM+rpKf/Zoo6+pVoVy5NgLXszqvnDIzv7NCZPoHhaw3tEQMyx0T9QWj
	wbSFrbvlHvg0lTIOcpEKPzF60IulT6FyItMHYnBJryjafFhRX/FNOBFHa2MjE0CZe4gxZiQMhS6Vv
	2putyWLiHBGSPlKbLugUZIQCCxB6ySVfyRE0AY7mv9qlkRambhZQ3Bznh1FE0CjI/PFnHyR3kZHCT
	bHMHsv1Q==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=62698)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oRCAx-0005T0-Nh; Thu, 25 Aug 2022 14:41:35 +0200
Message-ID: <3cc08f9d-9f01-b771-c16f-ea95acd7e7cd@tronnes.org>
Date: Thu, 25 Aug 2022 14:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
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
 <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
 <eedb1a86-c1fb-cc76-2a43-4ed349d7d826@tronnes.org>
 <20220824154543.bdtpz2evwzsjrdrz@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220824154543.bdtpz2evwzsjrdrz@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_054145_037617_E6A65984 
X-CRM114-Status: GOOD (  14.13  )
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

CgpEZW4gMjQuMDguMjAyMiAxNy40NSwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBIaSBOb3JhbGYs
Cj4gCj4gT24gU2F0LCBBdWcgMjAsIDIwMjIgYXQgMTA6MTg6NDdQTSArMDIwMCwgTm9yYWxmIFRy
w7hubmVzIHdyb3RlOgo+PiBEZW4gMjkuMDcuMjAyMiAxOC4zNSwgc2tyZXYgTWF4aW1lIFJpcGFy
ZDoKPj4+IE91ciBuZXcgdHYgbW9kZSBvcHRpb24gYWxsb3dzIHRvIHNwZWNpZnkgdGhlIFRWIG1v
ZGUgZnJvbSBhIHByb3BlcnR5Lgo+Pj4gSG93ZXZlciwgaXQgY2FuIHN0aWxsIGJlIHVzZWZ1bCwg
Zm9yIGV4YW1wbGUgdG8gYXZvaWQgYW55IGJvb3QgdGltZQo+Pj4gYXJ0aWZhY3QsIHRvIHNldCB0
aGF0IHByb3BlcnR5IGRpcmVjdGx5IGZyb20gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUuCj4+Pgo+
Pj4gTGV0J3MgYWRkIHNvbWUgY29kZSB0byBhbGxvdyBpdCwgYW5kIHNvbWUgdW5pdCB0ZXN0cyB0
byBleGVyY2lzZSB0aGF0IGNvZGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lQGNlcm5vLnRlY2g+Cj4+Pgo+Pgo+PiBJbiB0aGUgc3ViamVjdCBpdCBzYXlzICJ0
dl9tb2RlIHByb3BlcnR5IiwgYnV0IHRoZSBwcm9wZXJ0eSBpcyBjYWxsZWQKPj4gInR2IG5vcm0i
LCBzbyB0aGUgb3B0aW9uIHNob3VsZCBiZSB0dl9ub3JtPwo+IAo+IFllYWguLi4gSSBkb24ndCBr
bm93LiBtb2RlIGlzIHRha2VuIGJ1dCBpdCdzIG9idmlvdXNseSB0aGUgYmVzdCBuYW1lLiBTbwo+
IEkgd2VudCB3aXRoIG5vcm0gdG8gYXZvaWQgdGhlIChpbnRlcm5hbCkgY29uZmxpY3QgYnV0IEkg
bGVmdCBtb2RlIGZvcgo+IHRoZSB1c2VyIGZhY2luZyBwcm9wZXJ0eS4KPiAKPiBJJ20gbm90IHN1
cmUgd2hhdCdzIGJlc3QgaGVyZSwgb3IgbWF5YmUgd2UgY2FuIHBpY2sgYW5vdGhlciBuYW1lIGVu
dGlyZWx5Pwo+IAoKV2h5IG5vdCBqdXN0IGNhbGwgaXQgInR2IG1vZGUiIG9yIGV2ZW4gYmV0dGVy
ICJUViBNb2RlIi4gVGhlIHN0YXRlCm1lbWJlciBjYW4gYmUgY2FsbGVkIHR2X21vZGUsIGJ1dCB0
aGUgbW9kZV9jb25maWcgbWVtYmVyIHdpbGwgbmVlZCBhCnRlbXBvcmFyeSBuYW1lIHVudGlsIHRo
ZSAibW9kZSIgcHJvcGVydHkgaXMgcmVtb3ZlZC4gdHZfdHZfbW9kZSBvciBtYXliZQpjb25uZWN0
b3JfdHZfbW9kZT8KCkJ1dCBJTU8sIGlmIHRoZXJlIGFyZSBubyB1c2VycyBvZiB0aGlzIHByb3Bl
cnR5LCBhZGRpbmcgaXQgc2hvdWxkIGhhdmUgYQpkcm0gbWFpbnRhaW5lcnMgYWNrLgoKTm9yYWxm
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
