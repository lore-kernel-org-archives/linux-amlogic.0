Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D28D637DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Dec 2025 00:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocx7lqNXLJG3X88pfH6TxxdTp1FITLWmLx5J7cAFINs=; b=mWI6X4kRq+rbcY
	BLAnCFNZhy7SHRD+spwmWe/jmUWqSBxFqVsnORuGq9l/+/9zar9nAlIaKLjWxgk6KyvRT4W7uR7CW
	DfzGaNNPvk7jAci90zMYljkG4WYnFFT+9MjQUnpBva6l2NMbJ9khQDMVpfeloNUbytK0ife7QN1q+
	UpV/XiGTPYCP233ZTNBKcE4ddm40qT6Xoocm5W70DKh3dciZc6fDUF8xjQXuvq/ENTd53RBq4sl0R
	9J+A0BcK8e8iTFIlqH7qgan33WKSxGQjYSXvI4xG57nyLD/KbsvjWrHIYmJScx7+6yXf1Sey6DhTr
	ldrZaC+54Xp5GDraGKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVezM-00000005yBg-35Hv;
	Wed, 17 Dec 2025 00:01:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVezJ-00000005yAL-1wNp
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Dec 2025 00:01:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29f102b013fso63283915ad.2
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Dec 2025 16:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765929712; x=1766534512; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
        b=Y6lvMtaUUlimY3qYWq5S57cCVyv9M8rnxJw2Ye0iVgzrKyRicHZBe6EPfC2AZOV3B3
         qv8Uh5jnd9oRQDoO5/bNS16R1YFCJyUti8YUPxjqINhRvx4XG6b0Me2xio+5Zw7TFSiW
         tbgwmwha+d4NgH0um54iKsgAPVgU5XIPpigBIhxMZ75FEmQUWd8dXNfzX7ijQydgfEb8
         liGZ/ayFkBNOnpPeXEneYvPgfkfWcCwtRGN+D7aJqDbbpZT7z8Zu8dXh83DaUsQupLbr
         icx3JCL5oVYJ+EFt6fJLvfyb2Fpf2JB79NPO07+47KmZaGtsPIFLHDS4Az4LGIUrVqry
         XeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765929712; x=1766534512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
        b=VUPbM+QMsONe1xvZD97CAc5256x+82mqR1M6WNvPGf4ewre9KAAfvUAl5wpHIOP7Oa
         tmdlV7+TucF3XcOXYWWw0DYBMRpSVZ0U5aP0KNXRYEeBOO3WBdNKM6IT3cdAqVHfEia6
         sGIX/Ag5xU6mp3DmioakRk/VsqVh3QrpCJzT90JRkMIce6EVWezduQiBVQG1SxmOreLA
         r7slhYClgLKysJqlr54Ssg/mWCjqqJCzrV5qtNJw+a9yD73NiEFwbdLjCGz1+iHj3u3a
         1N8a2tImprT9yxpderSKZT8cg7RUjmmaJq9GKmF4kkgBN/duQn5u0KQOT3oyQa1fApzB
         JNwg==
X-Forwarded-Encrypted: i=1; AJvYcCX0JDQxSnLlat10iXVTXUxBQ63yCJ29Csp2+3mB6cJAmzvOn+R+UqixoiyDYPmObsHhi+iVLW07ejnnvTkL@lists.infradead.org
X-Gm-Message-State: AOJu0YyzDbwVBLrlXtaKMST6MGt6dDmnI0DjwMzEyXT8iVB82Zs8hKev
	eyutG9crcA9imM/bzpt2Ysz0I/XhvtqCjwJQLhppZQ2xgQ8FksheuPFs1r8yMZEJGQbQnAOhCaD
	r4HLF8dSUWPm+ohBlbSTafBjSJZKT67k=
X-Gm-Gg: AY/fxX76+69GG+ZfK1nouc8rtoxmzHFElDg+ZfxK74k0vL/uX2XSWFozWQfbnsu76RJ
	DzLLDJyjtfSWwN6kN2aj5gBfV5hiPg6kqVV7++Zv88tEJi/rSCvuzc7lXesp4OV7tvuSgrMezFh
	gaUYnLTgdJbNY9eW0IJAZHD0NPGgdG6U+YksoIboH53LoK0LwXX8DEtUy31Ws2293BLYN6EHjEK
	KYEsTSqhldENGnUoxGbZILwaY4AUtLGSVMomEh6fwhV+81CGooNFUu4o2cWn2Oge+ce51kwqHk3
	6w9N2QXOGVV8E8lPMkcVV3SAPZ0=
X-Google-Smtp-Source: AGHT+IGJCumVLPI6LXTb+R3wbQ5b6SSgqQC0QLByiXYYrEmbkjlG0jzydWOiaHp0sl9AgFqwMi+afZ8/iOgSdsy9IWU=
X-Received: by 2002:a17:903:1446:b0:295:425a:350e with SMTP id
 d9443c01a7336-29f23de66ebmr152982955ad.8.1765929712310; Tue, 16 Dec 2025
 16:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
 <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com> <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
In-Reply-To: <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 01:01:40 +0100
X-Gm-Features: AQt7F2qigiuBf-2umKIaZyZh98eVY_wIo1vz8CYcqmMw3ZJiZleOgoOUFsOFlyM
Message-ID: <CAFBinCBaXRNBHpY2uYy4FxyAOnRA4NxJtHbraG0=j_U6Dzz2=A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251216_160153_524598_C1916925 
X-CRM114-Status: GOOD (  20.62  )
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

SGkgTHVjYSwKCk9uIFR1ZSwgRGVjIDE2LCAyMDI1IGF0IDE6NDbigK9QTSBMdWNhIENlcmVzb2xp
IDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPiB3cm90ZToKWy4uLl0KPiA+IFdoYXQgSSdtIG5v
dCBzdXJlIGFib3V0IGlzIGhvdyB0aGlzIHNlcmllcyBpbnRlcmFjdHMgd2l0aAo+ID4gZGV2bV9k
cm1fb2ZfZ2V0X2JyaWRnZSgpIHdoaWNoIGlzIHdoeSBJJ20gYXNraW5nIGJlZm9yZSBjb29raW5n
IGEKPiA+IHBhdGNoLgo+Cj4gQXBvbG9naWVzIGZvciB0aGUgbG9uZyBkZWxheSBpbiBnZXR0aW5n
IGJhY2sgdG8geW91LiBZb3UgbWlnaHQgaGF2ZSBub3RpY2VkCj4gc29tZSBkaXNjdXNzaW9uIGFi
b3V0IHRoZSBvdmVyYWxsIGFwcHJvYWNoLCBhbmQgSSB3YWl0ZWQgZm9yIGl0IHRvIHNldHRsZS4K
VGhhdCBoYXNuJ3QgZ29uZSB1bm5vdGljZWQhCgo+IEFib3V0IGRldm1fZHJtX29mX2dldF9icmlk
Z2UoKSwgaXQgaXMgYSB2ZXJ5IGRpZmZlcmVudCBmdW5jdGlvbiBzbyBpdCBkb2VzCj4gbm90IGFm
ZmVjdCB0aGlzIHNlcmllcy4gVGhlIG5hbWUgc2ltaWxhcml0eSBpcyBjb25mdXNpbmcgaW5kZWVk
LCBidXQKPiBkZXZtX29mX2RybV9nZXRfYnJpZGdlKCkgaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIG15
IGFwcHJvYWNoLCBzbyBvbmUgbGVzcwo+IHNvdXJjZSBvZiBjb25mdXNpb24uCkkgaGF2ZSB0byBj
b25mZXNzIHRoYXQgSSdtIHN0aWxsIGNvbmZ1c2VkLiBkcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRn
ZS5jIHN0YXRlczoKIkRpc3BsYXkgZHJpdmVycyBhcmUgcmVzcG9uc2libGUgZm9yIGxpbmtpbmcg
ZW5jb2RlcnMgd2l0aCB0aGUgZmlyc3QgYnJpZGdlCiBpbiB0aGUgY2hhaW5zLiBUaGlzIGlzIGRv
bmUgYnkgYWNxdWlyaW5nIHRoZSBhcHByb3ByaWF0ZSBicmlkZ2Ugd2l0aAogZGV2bV9kcm1fb2Zf
Z2V0X2JyaWRnZSgpLiBPbmNlIGFjcXVpcmVkLCB0aGUgYnJpZGdlIHNoYWxsIGJlIGF0dGFjaGVk
IHRvIHRoZQogZW5jb2RlciB3aXRoIGEgY2FsbCB0byBkcm1fYnJpZGdlX2F0dGFjaCgpLgoKIEJy
aWRnZXMgYXJlIHJlc3BvbnNpYmxlIGZvciBsaW5raW5nIHRoZW1zZWx2ZXMgd2l0aCB0aGUgbmV4
dCBicmlkZ2UgaW4gdGhlCiBjaGFpbiwgaWYgYW55LiBUaGlzIGlzIGRvbmUgdGhlIHNhbWUgd2F5
IGFzIGZvciBlbmNvZGVycywgd2l0aCB0aGUgY2FsbCB0bwogZHJtX2JyaWRnZV9hdHRhY2goKSBv
Y2N1cnJpbmcgaW4gdGhlICZkcm1fYnJpZGdlX2Z1bmNzLmF0dGFjaCBvcGVyYXRpb24uIgpEb2Vz
IHRoaXMgbWVhbiB5b3VyIHNlcmllcyBlZmZlY3RpdmVseSBkZXByZWNhdGVzIGRldm1fZHJtX29m
X2dldF9icmlkZ2UoKT8KCj4gSSdtIHNvb24gc2VuZGluZyB2MywgYW5kIEkgaGF2ZSB1cGRhdGVk
IG15IHBhdGNoIHRvCj4gZXNvbl9lbmNvZGVyX3tjdmJzLGRzaSxoZG1pfS5jLCBhY3R1YWxseSBz
cGxpdHRpbmcgaXQgaW4gMy4gSSdkIGJlIGdyYXRlZnVsCj4gaWYgeW91IGNvdWxkIHJldmlld2Qg
YW5kL290IHRlc3QgdGhlbSB3aGVuIEkgc2VuZCB2My4gQnV0IEkgZG9uJ3QgdGhpbmsKPiB0aGVy
ZSBpcyBhIG5lZWQgZm9yIHlvdSB0byBzZW5kIGFueSBwYXRjaGVzIHJlbGF0ZWQgdG8gdGhpcyB0
b3BpYy4KUmVnYXJkbGVzcyBvZiB0aGUgcXVlc3Rpb25zIEkgc3RpbGwgaGF2ZSBhcm91bmQKZGV2
bV9kcm1fb2ZfZ2V0X2JyaWRnZSgpOiBJJ2xsIGdpdmUgeW91ciBwYXRjaGVzIGEgZ28gaW4gdGhl
IG5leHQKZGF5cy4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
