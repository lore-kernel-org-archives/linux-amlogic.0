Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36463C3ABB0
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Apr 2025 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5W2vTWhJDnZlbtv63B8rZ3vigarvyGDqO7Vexzg6vYA=; b=TlbRVlVgw61MoU
	FJUAbpNBZrakfln/G5q0Tkeh8dfaPFpfCueFNgg0JUBDB1K88Ha33M2pZizNZ4ZWuHzVz2yZyr41y
	nGVmYpk68YmrgvFJUhlWcUGg+DEowMZT88ZJ93rfMzqdnKBDl8Znv4whpXwSib1rb1HnePrtAMk2F
	NwJAlg1EOJ9MSYLatOkNJ9n+0RaIwO83u4VuZMeDoVqdQOlIDvUmMv9NhIWrsTK/TScdRIvs6ZyBN
	r3u57OciNfg6MvLZ8IV1b8BcWNwJAt8QJWhSe9Tgp9aTy6SNz8rVz/CPvK7voWrJunZAGnet2Yzzo
	r0RIbQp93doPIgc/uAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9ui-0000000DMdz-2HQx;
	Wed, 30 Apr 2025 16:04:00 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9jC-0000000DLEo-2Vl3
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Apr 2025 15:52:08 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so52380a91.3
        for <linux-amlogic@lists.infradead.org>; Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746028325; x=1746633125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=JFbhJ3QMRsaZlQ6zwyMbDib1vGYN7KbPWmlUE3iH7+Jf+6HPBumiJC3Wbrm7XS3x7w
         bJwS+JaVesWnUVb58yLHG38/tILSCONrEbCXE8TJo52e83Puev3FsBXhqEUVfMb9jzUy
         4bRg1VnAgFe3hW2I0B4s9nf8kYOfeI+1nP6jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028325; x=1746633125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=fKJ54sD9aQdxScSKRo/DrVju07tUbqbDXdOqFtz3HUxaAZBSf83RZreo8XVGNVT5wu
         hN2zsnS6zrQSeC9vLpOI2ERC8yhn4f/5ipYoIoynvVCKTymYy/sviQLM+AWe3lZstbNa
         /8fO32ZOJqpX6Bq1O+nYIr67SffrlMLJnFSEec6KEyAZx75iTaqkeW45S2ZDVPwlc+Jj
         z/TfiiqUaVA9eNPr0sQgGXapq3GgnWyU9uHBri7BFSzYtt0lQgBo5c5MLPNy4ktHLQbP
         HY5em2YZ4704J8DBDXXg3Y3yqgYAqTdDsWS2FGeTKC4w6RF/FcsvsjJOD9lMh2DpgnMp
         VCgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtoTWDsVSDgyKNGlbb9QK+mlHcaB/lCnEIitdEahv5wnf2ZoV3MdE38QMFxoGkXtA81GDPRJqzv2MQ9iPt@lists.infradead.org
X-Gm-Message-State: AOJu0YwRWq3fhCd/a1zckNgDgfTYViZ7x/B0AzfB11WUazXlKwaZ8Pb7
	LMEJh/HSIUs38YQv4vFEBaVv6HQLwG1IeEoiVSAmQkDzbHSGvlvv0G3qTamF1m9rPLenJcvzizo
	=
X-Gm-Gg: ASbGncu62a9WRflcH8nlRYQ5hP/TWef7iAmsC5CMqaxS0fvwPOCp+otdn2mZ7wyXHoR
	pogNWBZ6i9Xx4fhCIv0i0UOXxu6zZb2vzOczNh/XxJd1NafYhbiIXA3oiMvuc0iqL9atXfMI4Tf
	18FDxy/ZdnuyKGlYUh07squv0JePaqCelG/rwbnzUVkjIo+X7Y6VZ/TjcX5lY7sCO4l/tXfWWZb
	k1X2ePsjaqpT2GSJwah4OTU09V+/MYxpvkVrumHUTV5ISYuJiMxEn8P7ZaXvE1SCywVn/1x3/FT
	kojo+DfX5IpT7dopVTY28sOYoVgKbq6SfvBp5oncX0agFPXLuybb7ADuEkuZKeyMJ7qjk/UHMsy
	CVGx+kLLWWbSHfQW/GvE=
X-Google-Smtp-Source: AGHT+IF9heErQwdspGtAiTAJAAqwjqsp9DrA2xdNWXLoiV2x4mtREVHjptiA0KfQhyeJUdU+cG1QFg==
X-Received: by 2002:a17:90b:4b84:b0:309:eb44:2a58 with SMTP id 98e67ed59e1d1-30a33356211mr4531815a91.22.1746028325088;
        Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34748940sm1798968a91.12.2025.04.30.08.52.04
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af589091049so5664893a12.1
        for <linux-amlogic@lists.infradead.org>; Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJqNc07AHMFdmcIxHWuC4Lv0hHKx+Fvtg/2wHWc7UXMo8u49jLDzT2V/bIf/17+2E5dNrOGE9qSvujWqVC@lists.infradead.org
X-Received: by 2002:a17:90b:17d0:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30a3330bd2amr6121407a91.17.1746028323966; Wed, 30 Apr 2025
 08:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com> <20250430123557.3d8b1de4@booty>
In-Reply-To: <20250430123557.3d8b1de4@booty>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 08:51:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
X-Gm-Features: ATxdqUFfYEEYqvpO67K1TXBYapYURxE3d7Z_gt9FzIWHk5tUMzE1QBIfnvJL-xI
Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_085206_654393_3EB8BD52 
X-CRM114-Status: GOOD (  20.01  )
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

SGksCgpPbiBXZWQsIEFwciAzMCwgMjAyNSBhdCAzOjM24oCvQU0gTHVjYSBDZXJlc29saSA8bHVj
YS5jZXJlc29saUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBEb3VnLAo+Cj4gT24gTW9u
LCAyOCBBcHIgMjAyNSAxMzo1OTo1MCAtMDcwMAo+IERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBbLi4uXQo+Cj4gPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBB
bmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiAjIHBhcmFkZS1wczg2NDAKPiA+IFRlc3Rl
ZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiAjIHBhcmFkZS1w
czg2NDAKPgo+IFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchCj4KPiBIb3dldmVyIEknbGwgYmUg
c2VuZGluZyB2MyB3aXRoIHNvbWUgZGlmZmVyZW5jZXMgdy5yLnQuIHYyLCBpbiBvcmRlciB0bwo+
IGZpeCB0aGUgMyBidWdzIHJlcG9ydGVkIGJ5IEFuZHkgWWFuIHBsdXMgYSBzaW1pbGFyIG9uZSBJ
IHNwb3R0ZWQuIFRoZQo+IGZpeCBqdXN0IGlzIHJlcGxhY2luZyBQVFJfRVJSKCkgd2l0aCBFUlJf
Q0FTVCgpIGluIHRoZSA0IGNhc2VzIHdoZXJlIHRoZQo+IGludm9sdmVkIGZ1bmN0aW9uIGlzIHJl
dHVybmluZyBhIHBvaW50ZXIgaW5zdGVhZCBvZiBhbiBpbnQuCj4KPiBZb3VyIHJldmlldy90ZXN0
IHRhZ3MgYXBwZWFyIGdsb2JhbCB0byB0aGUgd2hvbGUgcGF0Y2gsIHRodXMgYmVpbmcgdGhlCj4g
cGF0Y2ggZGlmZmVyZW50IEkgdGhpbmsgSSBjYW5ub3QgaW5jbHVkZSB5b3VyIHRhZ3MgaW4gdjMu
Cj4KPiBMZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgSSBzaG91bGQgZG8gZGlmZmVyZW50bHkuCj4K
PiBTb3JyeSBhYm91dCB0aGF0LgoKSXQncyBmaW5lIGlmIHlvdSB3YW50IHRvIGRyb3AgbXkgdGFn
LiBJIGRpZG4ndCBoYXZlIHRpbWUgdG8gcmV2aWV3IHRoZQp3aG9sZSB0aGluZyBidXQgSSBmZWx0
IGxpa2UgSSBzaG91bGQgYXQgbGVhc3QgcmV2aWV3IHRoZSBkcml2ZXJzIEknbQpzaWduZWQgdXAg
YXMgYSByZXZpZXdlciBmb3IuIFRoYXQgYmVpbmcgc2FpZCwgSSdtIG5vdCBjb3VudGluZyB0YWdz
IG9yCmFueXRoaW5nIHNvIEknbSBub3Qgb2ZmZW5kZWQgaWYgdGhleSdyZSBkcm9wcGVkLgoKTXkg
dW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBoYXNodGFnIGF0IHRoZSBlbmQgaXMgYXQgbGVhc3Qg
YQpzZW1pLXN0YW5kYXJkIHdheSB0byBzYXkgdGhhdCBteSB0YWcgb25seSBhcHBsaWVzIHRvIGEg
c21hbGwgcGFydCBvZgp0aGUgcGF0Y2gsIHNvIGl0IHNlZW1zIGxpa2UgaXQgd291bGQgYmUgT0sg
dG8gY2FycnkgaXQsIHRob3VnaC4uLgoKLURvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
