Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3583C54F30
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 May 2025 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1qEVw+SPaOtE+X/GgQG7Ej6fEBxXle48VCnD8skeqY=; b=ii+SwWtj1S1i9B
	eNCiN9AsRbInEYBoB0+J7GXyHaeVpM4Xm07PU+YWxBiOIDN7f0RrBo1/QEcwFOC9M3W9DnMJj8w57
	7GYdUTbM1m5pQlYkJTJy1/fk1lKkV9t0Sq/xdtNz3K0RtD/tgChXWHpmW27IrSAOc2bBF2uXAWUXD
	dmC3sxp2XUAjEBUM+q7XjRug4pyo8h5LTIAAYixlAQqtKHDgHpx5IoIhE7/jq2lE7KiV+SdPzYo8A
	/eFHAWS68WkBLtOlSbontCvFVZ0cHlkDxKTdaBboASZcojLTP7rxUgISUbgLFFfe5h7dumWj3F8g1
	zWheNwbyCXAqWUWmAJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISYU-00000003yOO-0Ym2;
	Fri, 23 May 2025 13:35:22 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISMp-00000003wVf-2XuX;
	Fri, 23 May 2025 13:23:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80E3043E92;
	Fri, 23 May 2025 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748006596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PdDU2oRP8k2jUeSve/BOd06ch34w47FFumvJv+pxA64=;
	b=mZbEGMe25lkA6a1/A5PYNbESnCSL60bu6GbmptADGVwaEkiGNBcHGN8VrT72jRA/+HNkP4
	O/QwRUKwwl3xkt4gQ3Mrs7lKrRaKRz4fTUwt/DbNDv7ugEEzoi1dGDejSURTrPhZAOKVZL
	UYuYChVv7ASMlrgAyMynb3Hu9Ovs5zXPwNEjo60hL8sbBVmrDkv74b2ln1iasNoULv1Ksw
	tA2Y1gP38lTQKZNvYVM6ebTePuQP8PIROVBEJmhCXewn1NVtuepbzztVtobDhFgEQBqe6V
	8LOSAQYNXvNBh9HNPCzuX8wiU0bL+1nw3VrunFS4/yawaszCy5VqLmvRqmwd3g==
Date: Fri, 23 May 2025 15:23:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Inki Dae <daeinki@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>, Anusha Srivatsa
 <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, Dmitry
 Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Louis Chauvet
 <louis.chauvet@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Manikandan Muralidharan
 <manikandan.m@microchip.com>, Adam Ford <aford173@gmail.com>, Adrien
 Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin
 <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung
 <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Christoph
 Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko
 Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne
 Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE
 <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang
 <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan
 <mordan@ispras.ru>, "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan
 <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, Xin Ji
 <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Peter Senna Tschudin
 <peter.senna@gmail.com>, Helge Deller <deller@gmx.de>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Michal Simek
 <michal.simek@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250523152304.5c66e195@booty>
In-Reply-To: <CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
	<20250521162216.79dd3290@booty>
	<CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekleeiucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepleehpdhrtghpthhtohepuggrvghinhhkihesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhin
 hhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_062319_957670_AEC65E72 
X-CRM114-Status: GOOD (  22.44  )
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

SGVsbG8gSW5raSwKCk9uIEZyaSwgMjMgTWF5IDIwMjUgMDA6MTE6MjQgKzA5MDAKSW5raSBEYWUg
PGRhZWlua2lAZ21haWwuY29tPiB3cm90ZToKCj4gSGVsbG8gTHVjYSBDZXJlc29saSwKPiAKPiAy
MDI164WEIDXsm5QgMjHsnbwgKOyImCkg7Jik7ZuEIDExOjIzLCBMdWNhIENlcmVzb2xpIDxsdWNh
LmNlcmVzb2xpQGJvb3RsaW4uY29tPuuLmOydtCDsnpHshLE6Cj4gPgo+ID4gSGVsbG8gTWF4aW1l
LCBTaGF3biwgTGl1LCBhbGwsCj4gPgo+ID4gT24gRnJpLCAwOSBNYXkgMjAyNSAxNTo1MzoyNiAr
MDIwMAo+ID4gTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4gd3JvdGU6
Cj4gPiAgCj4gPiA+IGRldm1fZHJtX2JyaWRnZV9hbGxvYygpIFswXSBpcyB0aGUgbmV3IEFQSSB0
byBhbGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBhIERSTQo+ID4gPiBicmlkZ2UsIGFuZCB0aGUgb25s
eSBvbmUgc3VwcG9ydGVkIGZyb20gbm93IG9uLiBJdCBpcyB0aGUgZmlyc3QgbWlsZXN0b25lCj4g
PiA+IHRvd2FyZHMgcmVtb3ZhbCBvZiBicmlkZ2VzIGZyb20gYSBzdGlsbCBleGlzdGluZyBEUk0g
cGlwZWxpbmUgd2l0aG91dAo+ID4gPiB1c2UtYWZ0ZXItZnJlZS4gIAo+ID4KPiA+IEkgYXBwbGll
ZCBvbiBkcm0tbWlzYy1uZXh0IHBhdGNoZXMgMy0xNywyMC0yMSBhcyB0aGV5IG1hdGNoIGFsbCB0
aGUKPiA+IGNyaXRlcmlhOgo+ID4gIC0gQXQgbGVhc3QgYSBBY2tlZC1ieSAob3IgUi1ieSBtYWlu
dGFpbmVycykKPiA+ICAtIHBhdGNoIGlzIGZvciBkcm0tbWlzYwo+ID4KPiA+IEJlaW5nIG15IHZl
cnkgZmlyc3QgY29tbWl0cyB0byBkcm0tbWlzYywgSSB0cmllZCB0byBiZSBjYXJlZnVsLCBhbmQK
PiA+IGRvdWJsZSBjaGVja2VkIGFsbCB0aGUgcGF0Y2hlcyB3aXRoIExvdWlzICh0aGFua3MhKS4K
PiA+Cj4gPiBIZXJlIGFyZSB0aGUgcGVuZGluZyBxdWVzdGlvbnMgYW5kIHBsYW4gZm9yIHRoZSBy
ZW1haW5pbmcgcGF0Y2hlcy4KPiA+ICAKPiA+ID4gICAgICAgUmV2ZXJ0ICJkcm0vZXh5bm9zOiBt
aWM6IGNvbnZlcnQgdG8gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJIiAgCj4gPgo+ID4gVGhp
cyByZXZlcnRzIHRoZSBjb21taXQgYXBwbGllZCBteSBtaXN0YWtlOgo+ID4gaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9taXNjL2tlcm5lbC8tL2NvbW1pdC85MWM1YzdiNWJiMmRk
MDliNDNiMDI1YmNlNmQ3OTBkM2M3OWY0NTE4Cj4gPgo+ID4gTmVpdGhlciB0aGUgIG9yaWdpbmFs
IHBhdGNoIG5vciB0aGUgcmV2ZXJ0IGhhcyBiZWVuIHJldmlld2VkL2Fja2VkLgo+ID4KPiA+IEFz
IHRoZSBjb21taXQgd2FzIGEgbWlzdGFrZSwgSSdtIGFwcGx5aW5nIHRoZSByZXZlcnQgYnkgdGhl
IGVuZCBvZiB0aGlzCj4gPiB3ZWVrIChpLmUuIG9uIEZyaWRheSkgdW5sZXNzIHRoZXJlIGFyZSBi
ZXR0ZXIgaW5zdHJ1Y3Rpb25zLiAgCj4gCj4gUmVhbGx5IHNvcnJ5IGZvciBsYXRlLiBJIHdhcyBt
YWRlIGF3YXJlIG9mIGl0IGxhdGVyIHRocm91Z2ggYQo+IGNvbGxlYWd1ZSdzIHJlbWFyay4gVGhl
cmUgaXMgbm8gbmVlZCB0byBwcm9jZWVkIHdpdGggdGhlIHJldmVydC4KPiBBY2tlZC1ieSA6IElu
a2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBB
cyBhZ3JlZWQgd2l0aCBNYXhpbWUgYW5kIGFwcHJvdmVkIGJ5IHlvdSwgSSdtCmxlYXZpbmcgdGhl
IGNvbW1pdCBhcyBpcywgd2l0aG91dCByZXZlcnRpbmcgYW5kIHJlYXBwbHlpbmcuIFlvdXIKQWNr
ZWQtYnkgaXMgaW4gdGhlIHJlY29yZHMgYW55d2F5LCBzbyBzb21laG93IHJlYWNoYWJsZSBpbiBj
YXNlIG9mIG5lZWQuCgpMdWNhCgotLSAKTHVjYSBDZXJlc29saSwgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
