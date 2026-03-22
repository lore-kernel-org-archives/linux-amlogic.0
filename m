Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CA0FC72C2
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Mar 2026 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzxVWPy4xPLyDqhfonD9h4WREwHvTL1C1Uf8y0IKokY=; b=oKsLhcxAMCSsdW
	SahPef3Qg8pMy5kDoNqlzvUX/b5MjjLnc/qqIVrkefck7I9g7WiT/JEjgPOSLNoLL3YAn6oVF5PTe
	8Q5pepdGhnRIExDr5VA1DBInE3UzZgJ900Ee6tPfRLVVKWHRn4xp9j6D7WOn08gaCGsgI26txIbZy
	No/uUwSDP0Q0Hme/LxPQcwwsX5PiHFzQ9dSeB5MZghuWGW08uOGN1ptrSDlDlPvEltP2DEeFlNaW+
	yL7t7tiBb1nVmjVmhPsyUKnC4TlhAV+FQmYXqPs8o/PECUGlTcRjhfyPwbfp56rZqUIFIfXWL3Pbg
	Ln9mzhl6qjU9LTvVXhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JYX-0000000FOYy-28Qx;
	Sun, 22 Mar 2026 14:13:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JYU-0000000FOXj-3HJ1
	for linux-amlogic@lists.infradead.org;
	Sun, 22 Mar 2026 14:13:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57F96445ED
	for <linux-amlogic@lists.infradead.org>; Sun, 22 Mar 2026 14:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C80EC2BCB2
	for <linux-amlogic@lists.infradead.org>; Sun, 22 Mar 2026 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774188806;
	bh=6WyenFkskQRviNgIdSNi6d7LvQNFj/WN1yDFKmE61aM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m1JSvO3vBoAW11h+1jUFpD4M3o87pi5WVIS30EG+IpjrhSbVVm0n+a1tBuAfjEvBt
	 DUqzvAtEE8KJ6CZfJtmKqQq9BVDuNmVeWZsoYGhGiqY+t+Q6RwWFQc5ZQdL1p/KZIY
	 UFQwKK08jzzYTvqEXZ4Ac8G4DE5xsSYsUXc8IfhWTBw9DfA2DD2C6LLzRNU24IbyFb
	 lrOIf3a8BJJBT9sBoXhMHNUMb8I5hhEpcoV0xfuwNuKiNcSCrIcGPuQKtmayUZ9HXR
	 hFKtrSq+WjK11fCbeC076eyEPEXZo0kTu3ZozNAe6J8tQQi2tgc/U6j9xLH40yQ+qZ
	 AsEOEj7QkGiCQ==
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-127380532eeso1358907c88.1
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Mar 2026 07:13:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+J39ObcexO40xJPgBGysrJXSk2NZH1E0ceYKkNu4sghEvLoPXR37soOLi1Syp4XFTb2kKu54fKBVND7en@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7OYYymItTiP0IGcnVRIAoEEE/EqLylascEFgvGMJBcE+wGh8w
	NQXxtGfr3sTm2jmVFfIDITC64lZ7+X+DsKANippa6bf/owRnOvJatI13XnU7n6G4Xn7shKAqQDu
	eIXesFhl0vTaTR/ZRHKM3cB+KJ2k2hw==
X-Received: by 2002:a05:7022:629f:b0:11b:9386:7ecd with SMTP id
 a92af1059eb24-12a726e3eadmr3908663c88.42.1774188804941; Sun, 22 Mar 2026
 07:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-4-ef48a517828e@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-4-ef48a517828e@bootlin.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 14:13:12 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9PH4yV-mDFZ+mkNRT7R9qoZOtjQhhqmyWjx1LWSu=giw@mail.gmail.com>
X-Gm-Features: AaiRm5108rX0H_CDRkg1jedFrdyn5bPiHycKlLMUICMJdSqU48gN54_ILYySwo8
Message-ID: <CAAOTY_9PH4yV-mDFZ+mkNRT7R9qoZOtjQhhqmyWjx1LWSu=giw@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_071326_868956_F03F8BC4 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

THVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4g5pa8IDIwMjblubQx5pyI
N+aXpemAseS4iSDkuIvljYg0OjIy5a+r6YGT77yaCj4KPiBvZl9kcm1fZmluZF9icmlkZ2UoKSBp
cyBkZXByZWNhdGVkLiBNb3ZlIHRvIGl0cyByZXBsYWNlbWVudAo+IG9mX2RybV9maW5kX2FuZF9n
ZXRfYnJpZGdlKCkgd2hpY2ggZ2V0cyBhIGJyaWRnZSByZWZlcmVuY2UsIGFuZCBlbnN1cmUgaXQK
PiBpcyBwdXQgd2hlbiBkb25lIGJ5IHVzaW5nIHRoZSBkcm1fYnJpZGdlOjpuZXh0X2JyaWRnZSBw
b2ludGVyLgoKQWNrZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
PgoKPgo+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxp
bi5jb20+Cj4gLS0tCj4gMi41Mi4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
