Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7841CD5BA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E38zN0XbXA1OITiZ5RGE9no1Tse6EOotqoEhGcpZxtI=; b=G1RKaxY94eACnB
	1Fk2vbJmrBCP/VViem5q1dTBdVF9sdop0PP+6m/+InMUnrLedtwi115r49Ify1FWSS8+omub8j7cz
	FMmuV89PQsegMHMNJnfYUwpru+WnjsD++Efb2mYFXYJUMMiu/thARje5kd9GMmaZp6FgY16mOxgN3
	uVn9ZndyIyjiLCi3oIn/xLozHWWx9FERaBw3j021LYUNJRLkb66d7Z1fTZUemvmNm/ApjKoLwmFba
	fa54xmLrwCFRFALR1N30BeW7GyQOjcrNqkmF0mpbo39xbbGvHT5/8DEnaTeAAVhmhLm7HM3HFusP6
	EzilX5slLrHtOMK8+oaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzU4-00000007Gwv-25l0;
	Thu, 21 May 2026 09:14:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzU0-00000007Gum-2qKd;
	Thu, 21 May 2026 09:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RqI6vh+WLkfGwtZ7w9kdY7+93wc7lSm+3beIEWvGDJc=; b=guwmnCLeCXw4BCcRlPU7lYatnl
	sZ/Nc87kEeU7S7IZqvbdwDPiYFJTjE74sti2902t8TOYJhE09mcvx2aicZepZ1U8bjhVHSh3TcZGg
	Y7fM3/5F6hseiuztXmxfbroXQQbM1+lUN1ZkEZS7mipNp/JuFNt40leR8kI9tt5bwyAOk9MjT1Mah
	fcDdyPRGk+GtfFRUn3R1K/3+Wo1fjTkrfsctUZfeNV3O7MJXg2KcaQGMHEV3YddrXsXQor8s3Jw51
	vuV05V9yKOQnUMa5ll/QPX6+CwfbL3npFjv8zCCwiRIWvLvkYYcGxAfEpI9ZahULoTQdlVMPeomaE
	rAUX5teQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v7 00/23] drm: bridge: dw_hdmi: Misc enable/disable,
 CEC and EDID cleanup
Date: Thu, 21 May 2026 11:14:07 +0200
Message-ID: <4998578.ktpJ11cQ8Q@phil>
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_021424_715731_9D8C19F0 
X-CRM114-Status: GOOD (  12.94  )
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
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Sandy Huang <hjc@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QW0gTW9udGFnLCAxOC4gTWFpIDIwMjYsIDIwOjAxOjM2IE1pdHRlbGV1cm9ww6Rpc2NoZSBTb21t
ZXJ6ZWl0IHNjaHJpZWIgSm9uYXMgS2FybG1hbjoKPiBUaGlzIGlzIGEgcmV2aXZhbCBvZiBhbiBv
bGQgZHctaGRtaSBzZXJpZXMgYW5kIGlzIHRoZSBmaXJzdCBzZXJpZXMgcGFydAo+IG9mIGEgbmV3
IGVmZm9ydCB0byB1cHN0cmVhbSBvbGQgTGlicmVFTEVDIEhETUkgMi4wIHBhdGNoZXMgZm9yIFJv
Y2tjaGlwCj4gUkszM3h4IGRldmljZXMuCj4gCj4gVGhpcyBzZXJpZXMgZW5zdXJlIHBvd2Vyb24v
cG93ZXJvZmYgYW5kIENFQyBwaHlzIGFkZHIgaW52YWxpZGF0aW9uIGlzCj4gaGFwcGVuaW5nIGR1
cmluZyBub3JtYWwgRFJNIGZ1bmNzLCBlbnN1cmVzIEVESUQgYW5kIENFQyBwaHlzIGFkZHIgaXMK
PiB1cGRhdGVkIGluIGRldGVjdCgpIHNpbWlsYXIgdG8gaG93IHRoZSBicmlkZ2UgY29ubmVjdG9y
IHdvcmtzIHdpdGggYQo+IEhETUkgYnJpZGdlIGF0dGFjaGVkLCBhbmQgYWxzbyBjaGFuZ2VzIHRv
IGRlYm91bmNlIGhvdHBsdWcgcHJvY2Vzc2luZwo+IHRvIHByZXZlbnQgYSBmdWxsIGRpc2FibGUv
ZW5hYmxlIGN5Y2xlIGR1cmluZyBhIEhQRCBsb3cgdm9sdGFnZSBwdWxzZS4KPiAKPiBBZnRlciB0
aGlzIHNlcmllcyBIUEQsIEVESUQgYW5kIENFQyBoYW5kbGluZyBzaG91bGQgd29yayB2ZXJ5IHNp
bWlsYXIKPiByZWdhcmRsZXNzIGlzIHRoZSBkdy1oZG1pIGNvbm5lY3RvciBvciB0aGUgYnJpZGdl
IGNvbm5lY3RvciBpcyB1c2VkLgo+IEl0IHNob3VsZCBhbHNvIGhlbHAgZW5zdXJlIGEgc21vb3Ro
ZXIgdHJhbnNpdGlvbiB3aGVuIGR3LWhkbWkgaXMgZnVsbHkKPiBjb252ZXJ0ZWQgaW50byBhIEhE
TUkgYnJpZGdlIGluIGEgZnV0dXJlIHNlcmllcy4KPiAKPiBUaGVzZSBjaGFuZ2VzIGhhdmUgbWFp
bmx5IGJlZW4gdGVzdGVkIG9uIFJvY2tjaGlwIFJLMzMyOCwgUkszMzk5IGFuZAo+IFJLMzU2OCBk
ZXZpY2VzIHVzaW5nIGJvdGggdGhlIGR3LWhkbWkgY29ubmVjdG9yIGFuZCBhbHNvIHVzaW5nIGEg
YmFzaWMKPiBjb252ZXJ0IHRvIHVzZSBhIGJyaWRnZSBjb25uZWN0b3IuIFRoZSBjaGFuZ2VzIGhh
cyBhbHNvIGJlZW4gdGVzdGVkIG9uCj4gQW1sb2dpYyBTOTA1WCwgUzkwNVkyIGFuZCBBMzExRCBk
ZXZpY2VzIHRoYXQgdXNlcyB0aGUgYnJpZGdlIGNvbm5lY3Rvci4KCkkgbm93IGFsc28gZ2F2ZSB0
aGlzIGEgc3BpbiBvbiBhIHJrMzMyOCBib2FyZCBhbmQgaGRtaSBzdGlsbCB3b3JreCA6LSkKClRl
c3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4gI3JrMzMyOAoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
