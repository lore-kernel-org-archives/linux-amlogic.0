Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EE4C00140
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 10:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weWXjkTChUbzUq3DYd08hqsBZuC5r4ABbn3CTsR6wMc=; b=AHkmqZzLmK+Pds
	cn4NjQid+FhFsYgfVgGuvfQjiVExigQnR7Uts/LcLXmdBqNJM2MVFstVnvs4CPGpMnjJ8jNHVSi1I
	UpUYwiQM87fk7wORTBmZaeYTwkICqY8SmyVvm78Y72lPgLIr9vbXbGfN9xrBfaBnZNHgcpetuPv3f
	Fph84VmJAvRbLtYw1mlFJjJxO2fJt+p+qNdOtpZteEVDgTUAPMPnBZsIvdBBOxcy5INuKr4QwUQV9
	6bPi5+lJ1YSqaJNGgPtkhoVwljHJfD2kygxhkOgD0/Dh1egjL58vc46unIBySM2EwW3v+8haeIj0P
	zyBoBy3BLnR3iBWluz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNXjY-00EyDr-2f; Mon, 15 Aug 2022 10:54:12 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNXfC-00Evdw-9O; Mon, 15 Aug 2022 10:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RWy0N+7/yckvgkArgj6CdthLLzk89M9POcSFkfkYnRA=; b=N5ZGfjRF8WeW92jxf8spYDSDvP
	DmLr5GBnEfOozxMT2zbuHCOgstG6jXgxZ5wxkwGyfP5vzzlblBxN/TDlA+3/FoqB5WAtqQ29QDt4k
	I7R+Ju7eo+dLue5R0eYfsrHl5npb6Pxxb4CRofJP5D9q25kbkPFyx8hY+QxR1zhunkRzFHwm8zoir
	LhKFemOrzlDNk+7snRjUXnE4mwC80sJmm5ktcxiX5A0zOWNq1IhB2Xk5twOaOYewddU6jji0Is8H0
	HisNyFSnBSOpFy8ZsN1IcItt2e+7a+wB/EpsZuyNqDnTVkM33Ktn6GxGRjy19Z46YrPPIn04H4OvH
	vIXWhpWg==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=52575)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oNXf9-0001wP-Ry; Mon, 15 Aug 2022 12:49:39 +0200
Message-ID: <d56c3ff4-8a14-0467-2b61-d559dc936dda@tronnes.org>
Date: Mon, 15 Aug 2022 12:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 06/35] drm/connector: Only register TV mode property if
 present
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
 <20220728-rpi-analog-tv-properties-v1-6-3d53ae722097@cerno.tech>
 <d96df677-a1a7-ae49-bda6-abad025dc974@tronnes.org>
 <20220815104041.6ymspbhpjdxg2aoe@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220815104041.6ymspbhpjdxg2aoe@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_034942_355576_73FB1753 
X-CRM114-Status: GOOD (  12.23  )
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

CgpEZW4gMTUuMDguMjAyMiAxMi40MCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBIaSwKPiAKPiBP
biBNb24sIEF1ZyAwOCwgMjAyMiBhdCAwMjo0OTowOFBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMg
d3JvdGU6Cj4+IERlbiAyOS4wNy4yMDIyIDE4LjM0LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4g
VGhlIGRybV9jcmVhdGVfdHZfcHJvcGVydGllcygpIHdpbGwgY3JlYXRlIHRoZSBUViBtb2RlIHBy
b3BlcnR5Cj4+PiB1bmNvbmRpdGlvbmFsbHkuCj4+Pgo+Pj4gSG93ZXZlciwgc2luY2Ugd2UnbGwg
Z3JhZHVhbGx5IHBoYXNlIGl0IG91dCwgbGV0J3MgcmVnaXN0ZXIgaXQgb25seSBpZiB3ZQo+Pj4g
aGF2ZSBhIGxpc3QgcGFzc2VkIGFzIGFuIGFyZ3VtZW50LiBUaGlzIHdpbGwgbWFrZSB0aGUgdHJh
bnNpdGlvbiBlYXNpZXIuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lQGNlcm5vLnRlY2g+Cj4+Pgo+Pgo+PiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoaXMgbWFr
ZXMgdGhlIHRyYW5zaXRpb24gZWFzaWVyLCBidXQgaWYgeW91Cj4+IHRoaW5rIHNvOgo+IAo+IFNv
IHRoZSBiYXNpYyBpZGVhIGJlaGluZCB0aGlzIHNlcmllcyB3YXMgdG8gaW50cm9kdWNlIHRoZSBu
ZXcgcHJvcGVydHksCj4gZ3JhZHVhbGx5IGNvbnZlcnQgdGhlIG9sZCBkcml2ZXJzIHRvIHRoZSBu
ZXcgb25lLCBhbmQgZmluYWxseSByZW1vdmUgdGhlCj4gb2xkIG9uZS4KPiAKPiBJbiBvcmRlciB0
byBrZWVwIHRoZSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LCB3ZSBuZWVkIHRvIGFkZCB0byB0aGUK
PiBkcml2ZXJzIHNvbWUgY3VzdG9tIGdldC9zZXRfcHJvcGVydHkgaG9vayB0byBleHBvc2UgdGhl
IG9sZCBwcm9wZXJ0eSBhbmQKPiBmaWxsIHRoZSBuZXcgb25lIGlmIG5lZWRlZC4KPiAKPiBUaGF0
IG1lYW5zIHRoYXQgZWFjaCBkcml2ZXIgd291bGQgaGF2ZSB0byBjcmVhdGUgdGhlIG9sZCBwcm9w
ZXJ0eSwgd2hpY2gKPiB3aWxsIGNvbmZsaWN0IHdpdGggdGhhdCBjb2RlCj4gCgpHb3QgaXQuCgpO
b3JhbGYuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
