Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96594606A321
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 02:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TYv0H84D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wj8MNaCB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jCbd6FfnWhkdskTY/twfM2WG405WAphASUDmVdTQ/YY=; b=TYv0H84DlN+7Mih1HWIrWXMtcS
	6iiwpz4AGyqBI9/i7IhHMufHcqImExgqagsBkCMrPkW2Byb7Jq7Wl+ingtff4pRsesWaoAhnP2xT9
	no81zdeRCNteM79KwTWWWVvwwNj/Zox09Gfsak9ibjzwK61LKjl6CKGVF0qi9dO95gY/22Uq9hiSL
	wct8px9jHgB7CEi24t6edKiqsEPjZ9S+Im+IXEL68MLawOc6EYMAfaNMVQH8cZ988MwnTiBUtiqc5
	4wKdWv6ZB5lPa3TVYbL3GoaZgOkbdGCTaXok9iNcniGLSvEMdffbMP+dvT6O7e7dKmxDxnEhgtjhU
	kerl9sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxsV-00000005QNG-0jg7;
	Wed, 11 Nov 2026 02:15:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxsS-00000005QLt-0vgH
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 02:15:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8818F6186E
	for <linux-amlogic@lists.infradead.org>; Wed, 11 Nov 2026 02:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9191F00A09
	for <linux-amlogic@lists.infradead.org>; Wed, 11 Nov 2026 02:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794363354;
	bh=lAhgMwbCGkquv8DnXUEthq+pkw17wZ1l1EuClqj5Zd0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Wj8MNaCBwCApL0nTzYAS6EYvG7ywnTpsSyVO1RVP4BFQVcTKVD/xFPa9uKjVihy4l
	 i8TrDB9BxnQmoT7ICSmt+i/6FWJHckwiddrOW7Mh3JjG7GzuGAqoJYRpPeuVNw4WWq
	 WVx2DE5obNSxISliSnIOu+FCfuSZQuvlgZahdlCburPIokjd/kp7AOkkNgYq0RSqxh
	 sDONNoLJVcigvR6CjUKTeY86U6444zeeCCqPsVglY8cq+ZR4zOv7IKu4rGSAZwHmst
	 T3dHgqqICzdzoli+qk/lZ8dlQGGm9ir1G43jJYmWkRuvxt1BJySHsytUXBGdRzr5pE
	 VzSzwLr7YvJNg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14e307f29so2827526e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Nov 2026 18:15:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGdfxDernunlN1M5TMg3tvsug4ZCpeGpnmGZsJ+xqv980LJjdJwqsc5ht6JUdwgMiNeK78bwI9iuI3HpFA1@lists.infradead.org
X-Gm-Message-State: APuU4Z82k8xXPh/yaw/sSoAqVIfxp7GFZyU97SuA9GYAXPgaXs9W8ab8
	hrtQzGadebJESHW7NewHhp6QMSugHAWgCeC1yrYnVK92a+X60l0fT+5eGct+/V29S/81PQxyOL1
	1IpQMI4RXVuSg6AwxZVqYMY1TnCd3Ou0=
X-Received: by 2002:a2e:be8d:0:b0:3ac:429f:6d93 with SMTP id
 38308e7fff4ca-3ae126c230bmr1415561fa.29.1794363351836; Tue, 10 Nov 2026
 18:15:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com> <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Nov 2026 11:15:39 +0900
X-Gmail-Original-Message-ID: <CAGb2v67xpAbsmez2qt7pypW5T8czE93PtU2QjcSPuQ4a7c7qoA@mail.gmail.com>
X-Gm-Features: AclHuK-PEU8_Ju7uMZ7QoR2Wn0i8AsTrMLtFibJe7hATAjuodc-7gCHep5Ph93s
Message-ID: <CAGb2v67xpAbsmez2qt7pypW5T8czE93PtU2QjcSPuQ4a7c7qoA@mail.gmail.com>
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
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
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linux-rpi-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgNjo1NuKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUg
Q2FwYWJsZSBIdWIpCjx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFRo
ZXNlIGFycmF5cyBhbHJlYWR5IG1vc3RseSBtYXRjaCB0aGUgbW9zdCB1c2VkIGFuZCBnZW5lcmFs
bHkKPiByZWNvbW1lbmRlZCBjb2Rpbmcgc3R5bGUuIFRoYXQgaXM6Cj4KPiAgLSBubyBjb21tYSBh
ZnRlciB0aGUgbGlzdCB0ZXJtaW5hdG9yOwo+ICAtIGEgY29tbWEgYWZ0ZXIgYW4gaW5pdGlhbGl6
ZXIgaWYgKGFuZCBvbmx5IGlmKSB0aGUgY2xvc2luZyB9IGlzIG5vdAo+ICAgIGRpcmVjdGx5IGZv
bGxvd2luZzsKPiAgLSBubyBleHBsaWNpdCB6ZXJvcyBpbiB0aGUgbGlzdCB0ZXJtaW5hdG9yOwo+
ICAtIGEgc3BhY2UgYWZ0ZXIgYW4gb3BlbmluZyB7IGFuZCBiZWZvcmUgYSBjbG9zaW5nIH0sIGEg
c2luZ2xlIHNwYWNlIGluCj4gICAgdGhlIGxpc3QgdGVybWluYXRvcjsKPgo+IEFkYXB0IHRoZSBv
ZmZlbmRlcnMgYWNjb3JkaW5nbHkuCj4KPiBSZXZpZXdlZC1ieTogQW5kcsOpIERyYXN6aWsgPGFu
ZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4gIyBmb3IgTWF4aW0gTUFYNzc3NTkKPiBSZXZpZXdlZC1i
eTogQ2hhcmxlcyBLZWVwYXggPGNrZWVwYXhAb3BlbnNvdXJjZS5jaXJydXMuY29tPgo+IFJldmll
d2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiAjIHJl
bmVzYXMKPiBSZXZpZXdlZC1ieTogTWF0aGlldSBEdWJvaXMtQnJpYW5kIDxtYXRoaWV1LmR1Ym9p
cy1icmlhbmRAYm9vdGxpbi5jb20+ICMgbWF4NzM2MAo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxs
ZWlqIDxsaW51c3dAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9tZmQvODhwbTg2MHgtY29yZS5jICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL21m
ZC9hYjg1MDAtc3lzY3RybC5jICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbWZkL2FjMTAwLmMgICAg
ICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbWZkL2FjdDg5NDVhLmMgICAgICAgICB8ICA0ICsr
LS0KPiAgZHJpdmVycy9tZmQvYWx0ZXJhLWExMHNyLmMgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9t
ZmQvYWx0ZXJhLXN5c21nci5jICAgIHwgIDIgKy0KPiAgZHJpdmVycy9tZmQvYXJpem9uYS1pMmMu
YyAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9tZmQvYXJpem9uYS1zcGkuYyAgICAgIHwgIDIgKy0K
PiAgZHJpdmVycy9tZmQvYXMzNzExLmMgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL21m
ZC9hczM3MjIuYyAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbWZkL2F0bWVsLWhsY2Rj
LmMgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbWZkL2F0bWVsLXNtYy5jICAgICAgICB8ICAyICst
CgoKPiAgZHJpdmVycy9tZmQvYXhwMjB4LWkyYy5jICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9t
ZmQvYXhwMjB4LXJzYi5jICAgICAgIHwgIDIgKy0KCkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdl
bnNAa2VybmVsLm9yZz4gIyBheHAyMHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
