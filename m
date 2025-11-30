Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD56D116F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Nov 2025 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhNM7xA9R7s9fyKU0lG4kmgdJMqOiJb2owacIQbIX/Y=; b=oanv2ts6bOftzk
	GkrrLWs4NdsJnSbJ2Rl5N68hUelI9oo9TkvTbX7n1YQQQU7Gc3ziiJAqjSuhyGxwM2Gp6gz8/1qqS
	xIeCI3whWJbjuG841Hb6Jb9v9Kyvf36vlW+0tqLDTGeIpDdF3JBmwItUTV+PJKSa/RgAg6C+kICQ4
	/p4BNCFi0TXxiGLbNip+poH/a/e8bGu2tzf1738W10c+xIVzw/GJlY2328XLYQxdiewVcDkxoL0KV
	C+YhNLsTwSl1qLTAtrURgHaAHNqPculj4w/h/UPDRiXE+nyzEj2vjjGHlukG93p2bIYKl6M/Nd26p
	fTnH6PXqKAaNWVOSsRAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPhBi-00000002Jt0-1Mfh;
	Sun, 30 Nov 2025 13:10:02 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPhBe-00000002JrX-31e3
	for linux-amlogic@lists.infradead.org;
	Sun, 30 Nov 2025 13:10:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2981f9ce15cso37653315ad.1
        for <linux-amlogic@lists.infradead.org>; Sun, 30 Nov 2025 05:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1764508197; x=1765112997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
        b=MmTd9JxqKojBMLxgxWfZDhevs9d3MowK3bt69xE4RaF5GdYcYD90vgBGBaV2vt3Mib
         jbWQ4aXz8jv1ia9GWpZ80I841QsxRQ/vfKufQo2OMkqbBwWr2zDy53Ne2la6Sj7Wr3NM
         /xZQFAVwEOMief/r/YeK4TUyUP2PJg+HeQ8xp4+PGxonX4Grui6ydvk1rzC21jds5ZUb
         kLL28eRaxo+W4I20Z2EUFpSzH2LtHlWScI7Ter0HDElEgsr/qq8wx1dZogSJzrpIVyeO
         9K6YLWtc4djRsTlv25bOqwA/iPD5NPbrHn0bIqog5VORNqVTI0zUXstEFuAIgKakHeXi
         dlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764508197; x=1765112997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
        b=s9tAjkpCp4fTZjKM0FaayYJ2s+lmboi+iAA9RkICV4/iXpv96VtTbI7jPqKFx/T1hh
         7iOPtxIRfp23GTXOpweLAllaTMGThHixi1jI+kjSyOQaraNlVdoi0QT06vx9icwXLD4D
         m9Blymw8VPgm6NqvfVw9XnyUKCYXR1rIpGOyGf18Y9W5Mxjav4BDfX0hI+DOX+GQk8SL
         NwTXjnZhruO/B6Z+3jZsw+WCQTvALOLqA/fLsyJtm60//zdAoNKIXRDpE5MqTji4kGBj
         W9FHHo0kmLfw2c2yTPKj26HbllM3LRPSANb/7GLY6UYv6a009DhPdiD/qD7tRYy+wD8E
         OoRw==
X-Forwarded-Encrypted: i=1; AJvYcCVm0zk7mIWvtR+byvv5KU2r40gFr/wT7w+/vV1/zCKedL79hYMoapfHV5/+ElBgDoZ6hbu92v0j/JjMfE88@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8e4lpYQT2K/oG6SDFsw7PQcmHo9j4OghuHwlp2/974dYu79k
	6GU0T6tu41QxAhg0lrF6acRaIjE/Ug2RWJh806BhFG/ptAakuiW2AlFCFpVQODqVNLkNpuvOe0m
	oepZcG3v8oiPIB4P+L81r67SUzdl9EY0=
X-Gm-Gg: ASbGnct+XkD2CaLm7GxuxUK3HjWuQCVIbH9GcL5jJogm8/tl6q+/xQsbRse+NInYJhC
	9HCZmjrkP14IEzMpdvXkW1iKI6Yzqoj8BeCkqsLzn+GSz7EBi8Xjf0Nv3I/GUluv5lw65fn5Tez
	XU52b13ma/n7qIBQ2s+RN6tv/uj4gMOfYzEH/tBRiX4Vmn+L04/5suviZk4XhWacoW0dCLgStdb
	S8q3pC12jhAnaH/l56cuQWyde3nanWRc+qPr66DK6Xb0VB+WaLbtZB9C3xdYULD6y5Z0AMRhFs7
	kkEHffFWpTqYVDR75wLnMoxjW/lK
X-Google-Smtp-Source: AGHT+IG53GhYkY/+dF5qGVT19Jadft1SJnnMvw5Wcu0qyYtU4QLG8FtzqF0lB0krYhtMk3QufvRzdFqig5aHMJFxvm0=
X-Received: by 2002:a17:903:903:b0:295:a1a5:bae9 with SMTP id
 d9443c01a7336-29b6be86b48mr332545755ad.8.1764508197220; Sun, 30 Nov 2025
 05:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Nov 2025 14:09:46 +0100
X-Gm-Features: AWmQ_bkqQ0yeDiiVRXlgzLTrdqIA678_lHRrauQKV29M6KsFuJAoinD-iLMIAaM
Message-ID: <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use devm_of_drm_get_bridge()
 to put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_050958_824162_9ED87850 
X-CRM114-Status: GOOD (  18.35  )
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

SGkgTHVjYSwKCk9uIEZyaSwgTm92IDI4LCAyMDI1IGF0IDU6NTTigK9QTSBMdWNhIENlcmVzb2xp
IDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IFRoaXMgZHJpdmVyIG9idGFp
bnMgYSBicmlkZ2UgcG9pbnRlciBmcm9tIG9mX2RybV9maW5kX2JyaWRnZSgpIGluIHRoZSBwcm9i
ZQo+IGZ1bmN0aW9uIGFuZCBzdG9yZXMgaXQgdW50aWwgZHJpdmVyIHJlbW92YWwuIG9mX2RybV9m
aW5kX2JyaWRnZSgpIGlzCj4gZGVwcmVjYXRlZC4gTW92ZSB0byBkZXZtX29mX2RybV9nZXRfYnJp
ZGdlKCkgd2hpY2ggcHV0cyB0aGUgYnJpZGdlCj4gcmVmZXJlbmNlIG9uIHJlbW92ZSBvciBvbiBw
cm9iZSBmYWlsdXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJl
c29saUBib290bGluLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Vu
Y29kZXJfY3Zicy5jIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rl
cl9kc2kuYyAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2hk
bWkuYyB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29k
ZXJfY3Zicy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfY3Zicy5jCj4g
aW5kZXggZGMzNzRiZmM1OTUxLi5iZjg1ODhhNWY2ZGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfY3Zicy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2VuY29kZXJfY3Zicy5jCj4gQEAgLTI0MSw3ICsyNDEsNyBAQCBpbnQgbWVz
b25fZW5jb2Rlcl9jdmJzX3Byb2JlKHN0cnVjdCBtZXNvbl9kcm0gKnByaXYpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBtZXNvbl9lbmNvZGVyX2N2
YnMtPm5leHRfYnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKHJlbW90ZSk7Cj4gKyAgICAgICBt
ZXNvbl9lbmNvZGVyX2N2YnMtPm5leHRfYnJpZGdlID0gZGV2bV9vZl9kcm1fZ2V0X2JyaWRnZShw
cml2LT5kZXYsIHJlbW90ZSk7Cj4gICAgICAgICBvZl9ub2RlX3B1dChyZW1vdGUpOwo+ICAgICAg
ICAgaWYgKCFtZXNvbl9lbmNvZGVyX2N2YnMtPm5leHRfYnJpZGdlKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gZGV2X2Vycl9wcm9iZShwcml2LT5kZXYsIC1FUFJPQkVfREVGRVIsCldvdWxkIHlv
dSBiZSBoYXBweSB3aXRoIG1lIHNlbmRpbmcgYSBwYXRjaCB0aGF0IHJlcGxhY2VzIHRoZSB3aG9s
ZQpsb2dpYyBpbiB0d28gbWVzb25fZW5jb2Rlcl97Y3Zicyxkc2ksaGRtaX0uYyB3aXRoCmRldm1f
ZHJtX29mX2dldF9icmlkZ2UoKT8KSSBzZWUgdHdvIGJlbmVmaXRzOgotIHNpbXBsZXIgY29kZQot
IGEgcGF0Y2ggbGVzcyBpbiB5b3VyIHNlcmllcyAobGVzcyBtYWludGVuYW5jZSBidXJkZW4gZm9y
IHlvdSkKCldoYXQgSSdtIG5vdCBzdXJlIGFib3V0IGlzIGhvdyB0aGlzIHNlcmllcyBpbnRlcmFj
dHMgd2l0aApkZXZtX2RybV9vZl9nZXRfYnJpZGdlKCkgd2hpY2ggaXMgd2h5IEknbSBhc2tpbmcg
YmVmb3JlIGNvb2tpbmcgYQpwYXRjaC4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
