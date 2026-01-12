Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A202ECF45D8
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jan 2026 22:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+isPK0Wf5cmWezmCOY8kYmlZO5INDS8VzdB+hbITRpI=; b=LIxZWhUp9a8YYr
	Wm1s2dB/YY8OmWN8nJgy/l7umrGLASZlDmTLp5dZf4LsOWvuOhlToWgyMfNx4FTyQ1/hHDX3fzXsJ
	IwqtYPtsSfHJFEXRw4xZ9ZsnR87CaYwr94XtdywN0A64X2BZSxsjkLV1V6nsE3uajmXiv8/cPowAx
	gbUZsBKOr6hS8Lkq0ap/1wJ1jADNjzAJl3wIhgb8bJeVYG8ZmOhrudLlezwDq2EO/jATZ1HwK0HtR
	ukX/lqDfcYPgVNYfXs46x0M56iC1gYH2PasI7UP9vr1i2GULOD6shI2bi+xo2OMb4c7Itb9yiaQ3S
	c468kvPd4IbutVjg1U0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQIh-00000006FRY-3GnU;
	Mon, 12 Jan 2026 22:22:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQIg-00000006FQa-2MkX
	for linux-amlogic@bombadil.infradead.org;
	Mon, 12 Jan 2026 22:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=; b=B2NY+Pr6yn8eoWxM0qTkGtBy+Q
	xdu2tQnF7OT9Waqovq2JfLLnvRYbLaof0YiYLM9PBuG7CDMdkZ4fz3+fpqNe6EcXuQXQuXAXLJ1n2
	5mFt9wzojUfmSLn9Luq9XvrAe0aJhgVjsbW3pCfSwP0F6tLT3iVWrikoNYHHQ8OXsnTAo0SLSFlFa
	zK/xlHoDSga1VFU+GyeV2+UgmT427VxZLP0A3Qko2BWlDJHnYkr/yriG/Fl/YU/HbETx23YSl3uEg
	+sbWSwgEAYC2cQoTZY19QsNdFfBHjj5lkfX1p7FmJuKst5eBXWbv87e7dF7uPzQnUt7RnG45ZJhOa
	9n8MhSIg==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQId-00000001kkS-0Rzr
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jan 2026 22:22:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0f3f74587so51509905ad.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jan 2026 14:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768256528; x=1768861328; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=boPJePymbvKlxGfcSUOMsgsoyvA3DchnMbZoNqrR329NgCM39BqAsODsDra3+pJi1T
         9x4vk10KEI+mE9n2l4ndw7PhdHn+VR/y2G4Ro6i3FUYwJmZy0j9a8HXzbI9FQaSN81We
         ++6rSyfI/LDlwXtxUjoAlHnj8qvkQy9+6lY7Vcq9dsikJj8gWYNqOnzjdpWp1bQvL+Hr
         tvK2ANdF6YSp4ZBbCuFO2emOWQSqwVzuS2B/l186OOVrKI1MWhAiBXG6RHc/b/2bI9c+
         zcmajo0SRZrfJH2TNBXSXUXPu6y8OhKRpEMiLHftxnyxiGTzpolnnIqs68feZkvAD7LZ
         4cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768256528; x=1768861328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=ApRWdYVVQGDZnDWeOXw7P1BsReX9I3spbxi4te7ILg9hwi7alBCHyMwhO+hexW1lo3
         +hvBcUixzveH5yx1+NmnvBubKWYhxosP5f9GP5gIjJdRaUilgu5+GDbByHV4LrSO/H5Z
         7LLPGdCqbX4Vmod+pnaVxMkLXtZCiqQeGqSJi2sjPiMt+z5LChXmWKn9h5s9ygJqfig+
         X9Rp6n9pcVvfYJpJtjmC+WXOMwIyuiEAIjXVErzK2+nnQggRWp36aLYwZXX75FZd3C4s
         KwFgxxDlkG6s9DxU2XLPQQHAzFh2eKKwgssbVAX6ph9V/Z9lUFSah5V459Gs65iI2/75
         JTxA==
X-Forwarded-Encrypted: i=1; AJvYcCUj4RqelFyI/ev7xWzNBy8tbT3pMH7S0m+QAzXfpvIbKEyDEqtEG7lt4iktG+lUvKQQJhH+gnj92w5P0vQR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+fOPG7rnTa0Kw3Tha2MFxab7+irRMYkUZnELVbw3TG7xSqrHs
	+Z4D9UpWNtNvvF25fSFO/UmaLsjo0LhnvYBdXELkVCZ9KJn6veHDYANEKEe0Ri0kYWYglDaQHh1
	fVxq3SXTKX78Fri38cMdNWrZtJnYeSSs=
X-Gm-Gg: AY/fxX49a/oIO4x6aA2k7mOBZn2S56wV23VTQhD9GS9CSMGZO5S0zaHV2L4Upa1A0DK
	Csrxx/a5s29aaPi2iS5pL5nHJTt02At663AoQbr3rb4xzcOgwHu0NpJsPu+697EifRv92Uj2xQL
	qKQuIfKYFPhEHOdrMQnf/3hh+uxiQn4ktaEm6MvoBr79Ly/4t//8TGQeRgQKFSnTeR1f14f0ZAu
	EuLA6P34rvWDOR4uFcLE2+srxuabfPZdlWzVtC5Tvea1NQTQ9SJVoG2v6KX4iStbQNQtkz5sL2C
	NSHfgPXTSkAOoGRRjO4u33Udcw5N
X-Google-Smtp-Source: AGHT+IF7+Y5y+W1I/oKu3PaWNvUb9K8PSy+WoJh05TRnlBlC82+qzM+GksYGzWHyPWmgmkdzBXyTwo91e0gYk9qAGBM=
X-Received: by 2002:a17:903:40ca:b0:295:592e:7633 with SMTP id
 d9443c01a7336-2a3ee4c0fb5mr187274885ad.29.1768256527834; Mon, 12 Jan 2026
 14:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 Jan 2026 23:21:56 +0100
X-Gm-Features: AZwV_Qj9tssGMaPejz2Zl0XwPzPqVqwiSQM5-St_AAUm7gwon2Sgi9P4XfkbVUU
Message-ID: <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_222211_369832_C37B25C6 
X-CRM114-Status: GOOD (  13.46  )
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

SGkgTHVjYSwKCk9uIEZyaSwgSmFuIDksIDIwMjYgYXQgMTE6MDPigK9BTSBMdWNhIENlcmVzb2xp
IDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IG9mX2RybV9maW5kX2JyaWRn
ZSgpIGlzIGRlcHJlY2F0ZWQuIE1vdmUgdG8gaXRzIHJlcGxhY2VtZW50Cj4gb2ZfZHJtX2ZpbmRf
YW5kX2dldF9icmlkZ2UoKSB3aGljaCBnZXRzIGEgYnJpZGdlIHJlZmVyZW5jZSwgYW5kIGVuc3Vy
ZSBpdAo+IGlzIHB1dCB3aGVuIGRvbmUuCj4KPiBkd19oZG1pLT5icmlkZ2UgaXMgdXNlZCBvbmx5
IGluIGR3X2hkbWlfdG9wX3RocmVhZF9pcnEoKSwgc28gaW4gb3JkZXIgdG8KPiBhdm9pZCBwb3Rl
bnRpYWwgdXNlLWFmdGVyLWZyZWUgZW5zdXJlIHRoZSBpcnEgaXMgZnJlZWQgYmVmb3JlIHB1dHRp
bmcgdGhlCj4gZHdfaGRtaS0+YnJpZGdlIHJlZmVyZW5jZS4KPgo+IEFja2VkLWJ5OiBNYXhpbWUg
UmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29s
aSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5z
dGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpbLi4uXQo+IEBAIC03
ODksOCArNzg5LDEyIEBAIHN0YXRpYyB2b2lkIG1lc29uX2R3X2hkbWlfdW5iaW5kKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdm9pZCAqZGF0YSkKPiAgewo+ICAgICAgICAgc3RydWN0IG1lc29uX2R3
X2hkbWkgKm1lc29uX2R3X2hkbWkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArICAgICAgIHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKPiAr
ICAgICAgIGludCBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+Cj4gKyAgICAgICBk
ZXZtX2ZyZWVfaXJxKGRldiwgaXJxLCBtZXNvbl9kd19oZG1pKTsKSSBoYXZlIG9uZSBxdWVzdGlv
biAoc28gSSBjYW4gdW5kZXJzdGFuZCB0aGluZ3MgYmV0dGVyKToKaXMgdGhlcmUgYSBwYXJ0aWN1
bGFyIHJlYXNvbiB3aHkgeW91IHdlbnQgd2l0aCBmcmVlJ2luZyB0aGUgSVJRCmluc3RlYWQgb2Yg
Imp1c3QiIG1hc2tpbmcgaXQgKHNvIHRoZSBoYXJkd2FyZSB3b24ndCBmaXJlIGFueW1vcmUgb2YK
dGhvc2UgSVJRcyk/CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
