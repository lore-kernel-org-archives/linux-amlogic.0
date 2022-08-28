Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C7ECAAA2
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Aug 2022 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgVClpIIk0VR91b+Wt0LnO2jRC/S3uteO4DbpHxLssE=; b=DTe9Da6UvENHvV
	TtUPdkW9YlWU+aop6ipERdHxudNC54j7YkEZlD48W+TQmijHFWUEnJI8yQOyVLxiH0ot/s1jFK/hS
	X3WD22RkBmYhVluCQboaErjgBl+X7RelMcvX6xzpGzs32QM2AhU+PcVw8t/yooToWsPDyiFrEbN7X
	n+5ZbeVb9R7NolDTxRAExZ7EX/9K9FMWcZoxYvjndDGOmrA3JtgqwC3bP5W5K43Bt3A9wTWzqUXUQ
	FDPHmQ7/VK6p7V4Wn6CnMydfia89P/otLpQ/UhDjc+qwNk+yKx480Br4WJxG2BMjsA0At1P6ajhx3
	PGMiOooleEmR2JR1firQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSM3s-000oFc-Gq; Sun, 28 Aug 2022 17:27:04 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSLk6-000i05-2D; Sun, 28 Aug 2022 17:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VB+iShHArjJp41BB5dqP4/59fbHxHAh8j4VWglqFn7E=; b=U1fK7sWUEHCoKWz84mzGfnRtEQ
	UrW5fXCEBL4DXz/NpfWik98RVrmZoEVwrwKWPWqQ0D7qmdd5DmT5KDBvnK7BW36hkK2ZBwHN6yVBQ
	add4aNGQ0gHcc64K2WMXXFCgY/ZT2ZWuJK7zFKRwTtuWXhz3HEcrGpvUxT3KW0F4xQSlzDG+x9qrb
	a6lUJ/EOI1KyvNFg+KoWOfNGa4TOD9W0e1vfCMmejMqaO4B5WgI9T3oUX781k9Pz/ajsBNJwi/AkG
	e6l5w3Yg/B8Vlc/dOtdyU30knuOvm5MIZcPp7eyelDP/khmC6e1nNYIFzqScoH8s7FpI/pgIDN42X
	onXXhHAg==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=60461)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oSLjq-0002PX-L9; Sun, 28 Aug 2022 19:06:22 +0200
Message-ID: <3b6ec59d-4fad-52f9-e96a-55a25ff3cfb4@tronnes.org>
Date: Sun, 28 Aug 2022 19:06:14 +0200
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
 <3cc08f9d-9f01-b771-c16f-ea95acd7e7cd@tronnes.org>
 <20220826064646.ug2djacis7whybpd@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220826064646.ug2djacis7whybpd@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_100638_673875_B727EE0D 
X-CRM114-Status: GOOD (  12.49  )
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

CgpEZW4gMjYuMDguMjAyMiAwOC40Niwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBPbiBUaHUsIEF1
ZyAyNSwgMjAyMiBhdCAwMjo0MToyN1BNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
IERlbiAyNC4wOC4yMDIyIDE3LjQ1LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4gSGkgTm9yYWxm
LAo+Pj4KPj4+IE9uIFNhdCwgQXVnIDIwLCAyMDIyIGF0IDEwOjE4OjQ3UE0gKzAyMDAsIE5vcmFs
ZiBUcsO4bm5lcyB3cm90ZToKPj4+PiBEZW4gMjkuMDcuMjAyMiAxOC4zNSwgc2tyZXYgTWF4aW1l
IFJpcGFyZDoKPj4+Pj4gT3VyIG5ldyB0diBtb2RlIG9wdGlvbiBhbGxvd3MgdG8gc3BlY2lmeSB0
aGUgVFYgbW9kZSBmcm9tIGEgcHJvcGVydHkuCj4+Pj4+IEhvd2V2ZXIsIGl0IGNhbiBzdGlsbCBi
ZSB1c2VmdWwsIGZvciBleGFtcGxlIHRvIGF2b2lkIGFueSBib290IHRpbWUKPj4+Pj4gYXJ0aWZh
Y3QsIHRvIHNldCB0aGF0IHByb3BlcnR5IGRpcmVjdGx5IGZyb20gdGhlIGtlcm5lbCBjb21tYW5k
IGxpbmUuCj4+Pj4+Cj4+Pj4+IExldCdzIGFkZCBzb21lIGNvZGUgdG8gYWxsb3cgaXQsIGFuZCBz
b21lIHVuaXQgdGVzdHMgdG8gZXhlcmNpc2UgdGhhdCBjb2RlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4KPj4+Pj4KPj4+Pgo+Pj4+
IEluIHRoZSBzdWJqZWN0IGl0IHNheXMgInR2X21vZGUgcHJvcGVydHkiLCBidXQgdGhlIHByb3Bl
cnR5IGlzIGNhbGxlZAo+Pj4+ICJ0diBub3JtIiwgc28gdGhlIG9wdGlvbiBzaG91bGQgYmUgdHZf
bm9ybT8KPj4+Cj4+PiBZZWFoLi4uIEkgZG9uJ3Qga25vdy4gbW9kZSBpcyB0YWtlbiBidXQgaXQn
cyBvYnZpb3VzbHkgdGhlIGJlc3QgbmFtZS4gU28KPj4+IEkgd2VudCB3aXRoIG5vcm0gdG8gYXZv
aWQgdGhlIChpbnRlcm5hbCkgY29uZmxpY3QgYnV0IEkgbGVmdCBtb2RlIGZvcgo+Pj4gdGhlIHVz
ZXIgZmFjaW5nIHByb3BlcnR5Lgo+Pj4KPj4+IEknbSBub3Qgc3VyZSB3aGF0J3MgYmVzdCBoZXJl
LCBvciBtYXliZSB3ZSBjYW4gcGljayBhbm90aGVyIG5hbWUgZW50aXJlbHk/Cj4+Pgo+Pgo+PiBX
aHkgbm90IGp1c3QgY2FsbCBpdCAidHYgbW9kZSIgb3IgZXZlbiBiZXR0ZXIgIlRWIE1vZGUiLiBU
aGUgc3RhdGUKPj4gbWVtYmVyIGNhbiBiZSBjYWxsZWQgdHZfbW9kZSwgYnV0IHRoZSBtb2RlX2Nv
bmZpZyBtZW1iZXIgd2lsbCBuZWVkIGEKPj4gdGVtcG9yYXJ5IG5hbWUgdW50aWwgdGhlICJtb2Rl
IiBwcm9wZXJ0eSBpcyByZW1vdmVkLiB0dl90dl9tb2RlIG9yIG1heWJlCj4+IGNvbm5lY3Rvcl90
dl9tb2RlPwo+IAo+IFllYWgsIHRoYXQgc2VlbXMgbGlrZSBhIGdvb2QgaWRlYS4gV291bGQgbGVn
YWN5X3R2X21vZGUgd29yayBmb3IgeW91Pwo+IAoKT2ggeWVhaCwgcmVuYW1pbmcgdGhlICJtb2Rl
IiBwcm9wZXJ0eSwgdGhhdCB3b3JrcyBmaW5lLgoKTm9yYWxmLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
