Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF2C25B0C
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9VHtXGmuV2FWBonQbjOrfRkc7/OOCwkZ14wovjfBes=; b=yOf8mkeaRHXA6W
	NgxI+9CR6dRZZ5BJvu/Fq6F83LZ2+GZ3VlGL7NXer2+BEKMvw3OoLOaJ+abUlzda3lleTzS0Yp05Y
	jWBxgM3We0/2VUMkX+UYYIYF6YGR/NVCoEHrtg8a/RlhsHfas3Cu1/KOsNf4uON7I4smITifVagxb
	49y5TqibehnmjXo3mczKP3z1VK3Fj4rx8RRj2tbjg6+XnJeOabW7VoWn56dEjVnqil1HaaMzMbSKC
	hs9xSOcOIYF1r/Dq41WKLJmm1rQTWfv7SkpiNCLmkskxnDPCShkdgkBXaPu0s6nwH4hIfPWCd4/X6
	0Qy29k0cXMsniURumGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL1pa-00Df18-5V; Mon, 08 Aug 2022 12:26:02 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL1pO-00Deup-58; Mon, 08 Aug 2022 12:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v49Gv+vvLdx2K8EmwF94ITIRDlwX8hbS7d3UiPb1pM0=; b=qr4XgPypiXoBj/EGs5WV0wPjUl
	Nm//fZoqFvDP4KJ7stWC6EZH8lS3KZAVLRztAS215esJhmOH71vRxOoKydxK0vubFnolyzYbLf1Kd
	erG+gveaYm54y+J6TWgEx9dUiwtGZy47rZRNgE5nvDfgF9OXZVLRxS6I+NPrV56XUhCl/xyT5JAaU
	uvutKHw7fytMD/AA38WxKcsTuhzuxobpDTVjeAt6G4qtbKcK+XQOW8m1vfy7gMOxaP/mlEt/juiCN
	iMsIr/HTF46es8F2dboXYr/sfQAFhCpLo+tlz1XFxfhK36YLld+PtctnTvDRLgA5MmsoiiMfnMzgy
	Jekey9ZA==;
Received: from [2a01:799:961:d200:fd91:af1e:9da7:f964] (port=64062)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oL1pF-0005Gv-RZ; Mon, 08 Aug 2022 14:25:41 +0200
Message-ID: <633ff81a-8fe1-da85-1235-18d14aebf6b0@tronnes.org>
Date: Mon, 8 Aug 2022 14:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/35] drm/atomic-helper: Rename
 drm_atomic_helper_connector_tv_reset to avoid ambiguity
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-1-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-1-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_052550_211231_95C41064 
X-CRM114-Status: GOOD (  13.66  )
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

CgpEZW4gMjkuMDcuMjAyMiAxOC4zNCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBXZSBjdXJyZW50
bHkgaGF2ZSB0d28gc2V0cyBvZiBUViBwcm9wZXJ0aWVzLgo+IAo+IFRoZSBmaXJzdCBvbmUgaXMg
dGhlcmUgdG8gZGVhbCB3aXRoIGFuYWxvZyBUViBwcm9wZXJ0aWVzLCBjcmVhdGluZwo+IHByb3Bl
cnRpZXMgc3VjaCBhcyB0aGUgVFYgbW9kZSwgc3ViY29ubmVjdG9ycywgc2F0dXJhdGlvbiwgaHVl
IGFuZCBzbyBvbi4KPiBJdCdzIGNyZWF0ZWQgYnkgY2FsbGluZyB0aGUgZHJtX21vZGVfY3JlYXRl
X3R2X3Byb3BlcnRpZXMoKSBmdW5jdGlvbi4KPiAKPiBUaGUgc2Vjb25kIG9uZSBpcyB0aGVyZSB0
byBkZWFsIHdpdGggcHJvcGVydGllcyB0aGF0IG1pZ2h0IGJlIHVzZWZ1bCBvbiBhCj4gVFYsIGNy
ZWF0aW5nIHRoZSBvdmVyc2NhbiBtYXJnaW5zIGZvciBleGFtcGxlLiBJdCdzIGNyZWF0ZWQgYnkg
Y2FsbGluZyB0aGUKPiBkcm1fbW9kZV9jcmVhdGVfdHZfbWFyZ2luX3Byb3BlcnRpZXMoKS4KPiAK
PiBIb3dldmVyLCB3ZSBhbHNvIGhhdmUgYSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfdHZf
cmVzZXQoKSBmdW5jdGlvbgo+IHRoYXQgd2lsbCByZXNldCB0aGUgVFYgbWFyZ2luIHByb3BlcnRp
ZXMgdG8gdGhlaXIgZGVmYXVsdCB2YWx1ZXMsIGFuZCB0aHVzCj4gaXMgc3VwcG9zZWQgdG8gYmUg
Y2FsbGVkIGZvciB0aGUgbGF0dGVyIHNldC4gVGhpcyBjcmVhdGVzIGFuIGFtYmlndWl0eSBkdWUK
PiB0byB0aGUgaW5jb25zaXN0ZW50IG5hbWluZy4KPiAKPiBXZSBjYW4gdGh1cyByZW5hbWUgdGhl
IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9yZXNldCgpIGZ1bmN0aW9uIHRvCj4gZHJt
X2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3R2X21hcmdpbnNfcmVzZXQoKSB0byByZW1vdmUgdGhh
dCBhbWJpZ3VpdHkKPiBhbmQgaG9wZWZ1bGx5IG1ha2UgaXQgbW9yZSBvYnZpb3VzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPgo+IAoKUmV2aWV3
ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
