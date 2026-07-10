Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82A4C43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 19:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/oifhVKpnpPb4Nq019eC4WV18pLRSdZlH73bWInPVc=; b=wBB4n0vId+oBOg
	Alb0BY0SxxNzqWh91/Lk6Fux0atHxjOVJjUXmNIrAzzeK03SDMb/aXptZFAHicWH2f8dm+7bK5+FR
	o9Mw1hYCwi7wTMJOODCD+2I4HNR56sP9F1Ek5zrLvHhivddRElU+UoWhA/usGfVkaSbzudw100iiL
	PVsLkQ2JY8hruEDtdx7kQU5aTlldMJienjUfFNWDPHDopKopgwdbvhNBuf2D+GkhOtbyghWoFzPFo
	JP+rgfnmkhUUVThPyA153d/AcDk9mKHYATiYQdvC2uAaaxLFGumnbZkjzKeR1noywyxXclRtniJIk
	TKUS4Jy0spBdADGcgrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiH1V-00000005cNR-2wuA;
	Fri, 10 Jul 2026 19:36:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiH1U-00000005cMz-0otw
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 19:36:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F011A43EFE
	for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 19:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16B61F00ACA
	for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 19:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712191;
	bh=WfoUlWEeuKtg5ji7K2r6ODJIVODJRvoxIKC//T1cf3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZRDk3Ul5X9eC9ZHcfx5aHpGPMZRj8v9feok6MHcQBdkvh3+onnXs24BVt/Ozpkyqa
	 k7uROJWTLOMduKI1fXPmZSqARmE+YeFZL7qmM+ZCAe7RydX3Vl688CacNjGxU9xYkC
	 9aQcBXDT72NgTkQS/gqdnGh2i6e3UetKU/Aq+EYf+4AdY1aXZTK+aXJnenlLce36vv
	 /JH3DZ58BW+yD4iaSawqTvlJdn8Q6Viahzvtrq7inKWQLrGxwSNFxrLIOukSXMMLmP
	 Uo169aPZYaZ10O5Wi1iwXuWjR2rAXh4YJHoVM+Igo+6E+ioJC/TcKmfh+J5XR+8258
	 Dp9vgcYmBqkLQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1165975e87.3
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 12:36:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr5z+l9a/ZLcvI4MrGAOkFSTuTgr7wUgIXuOauOh52xU1/+4KCcpooEghMi3vSKnhZRy9TTYPmnBUCkT69U@lists.infradead.org
X-Gm-Message-State: AOJu0YyhMGkqzPYYcvoH82nLrAT69EV9l4VqP3DVIVVIz3T39tjmoheL
	DfitXO2MbFa86xEiOtTAa37/AUtNBoqRwpdb9OYjcy7ZOibffGiyYo2E4o56tdksRzIrXhV7m6b
	QOY7nNK90FIzEo+lP0OIRNT+5ZeHnjIw=
X-Received: by 2002:a05:6512:40c4:20b0:5ae:c454:3740 with SMTP id
 2adb3069b0e04-5b0236ec2f0mr64636e87.60.1783712190489; Fri, 10 Jul 2026
 12:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com> <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:36:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLkhkEVsLyoYobV9ZfD0o7YWXh74cNsy2rcFrajna4mRjg@mail.gmail.com>
X-Gm-Features: AUfX_mxF7aXm1NUaeKv9tRmJ75XIeUyINM_M0uEJT4kZsHp0a8M3V6ZUZMQlacY
Message-ID: <CAD++jLkhkEVsLyoYobV9ZfD0o7YWXh74cNsy2rcFrajna4mRjg@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
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

T24gV2VkLCBKdWwgOCwgMjAyNiBhdCAxOjE34oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBD
YXBhYmxlIEh1YikKPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBUaGVz
ZSBhcnJheXMgYWxyZWFkeSBtb3N0bHkgbWF0Y2ggdGhlIG1vc3QgdXNlZCBhbmQgZ2VuZXJhbGx5
Cj4gcmVjb21tZW5kZWQgY29kaW5nIHN0eWxlLiBUaGF0IGlzOgo+Cj4gIC0gbm8gY29tbWEgYWZ0
ZXIgdGhlIGxpc3QgdGVybWluYXRvcjsKPiAgLSBhIGNvbW1hIGFmdGVyIGFuIGluaXRpYWxpemVy
IGlmIChhbmQgb25seSBpZikgdGhlIGNsb3NpbmcgfSBpcyBub3QKPiAgICBkaXJlY3RseSBmb2xs
b3dpbmc7Cj4gIC0gbm8gZXhwbGljaXQgemVyb3MgaW4gdGhlIGxpc3QgdGVybWluYXRvcjsKPiAg
LSBhIHNwYWNlIGFmdGVyIGFuIG9wZW5pbmcgeyBhbmQgYmVmb3JlIGEgY2xvc2luZyB9LCBhIHNp
bmdsZSBzcGFjZSBpbgo+ICAgIHRoZSBsaXN0IHRlcm1pbmF0b3I7Cj4KPiBBZGFwdCB0aGUgb2Zm
ZW5kZXJzIGFjY29yZGluZ2x5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
KFRoZSBDYXBhYmxlIEh1YikgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+CgpSZXZpZXdl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+CgpZb3VycywKTGludXMgV2Fs
bGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
