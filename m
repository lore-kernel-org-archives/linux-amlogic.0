Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BADEC83F17
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jul 2025 17:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PI3tNsgALCOst7A/sdAG9N6oVs1+zO6scIpg/LT9HM=; b=Ojpk6mmJLd0Ygp
	6wOv/1xTAhFC2IOPXGHVHG3RyI21Bc86WUCw4xqE+Qevi5lZIGdxvCoPcFb78oUPVxrgoveehjSS4
	Rt9itEp18D4GIif3ASRCAwHJkc+4npXaXvWtMUQoRzFRTw4Z6fLi/EAILBS/Jxunh9KLULKKg+Qoz
	9vaJQ7RTHEyMxzokB3xDMB4AHSf2fi4qTp7HKHSdfvmmkGFmPe0dfqJQF7BvO55j48hTjrszfnMmG
	bx7Ud6RpsWLCLqlGzq0cyKtsDp2vKcEVB18Bb9W0F5ER3wia9el7i4O8yyd80eYPaM4dnXZdXNsIo
	EWcK8d+TZ9Ys1ZC2zA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMzw-00000002xoE-16Yt;
	Mon, 14 Jul 2025 17:29:52 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL6r-00000002fuV-0f0x
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Jul 2025 15:28:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8729F442A2;
	Mon, 14 Jul 2025 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752506930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FH7mbmy9dxnMHrp8nr70Ezf/5UVtiIiZlJSsEGAGlLs=;
	b=Ya44pY77iHOQNF60LEEuM+0Eyg6Nn9Ip9xr+EVnEcKDdwS2wCBAAisJGaRKqT8ShlWuHmz
	KlljPt9MzYtpAhUIVpmcvEq/NAPApnq83ZlfLb/MLBRDkr2ZHruyaXvFN/vaenjyV36VSM
	TIgYWLCHaUCKahpcakMBnFFcjeuhxLhG4CashqCrx4rigem23MCmXl4pZikHkaJFHdlJa4
	vRvGcSCtjYwWEYzHMXzacL3XbtIUyu701ikDh0wALD2gC8e8WHycvcyZp0Bj4fZ9Ni9gDU
	bf76krJLFiByvbOqRZWXo+VhKCfTgkzIOrMEzEdNf9Z6LpvaJQiPU2Yfrj5EaA==
Date: Mon, 14 Jul 2025 17:28:45 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae
 <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 00/32] drm/mipi-dsi: avoid DSI host drivers to have
 pointers to DSI devices
Message-ID: <20250714172845.1432972f@booty>
In-Reply-To: <20250707121319.1e40a73a@booty>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
	<20250707-strange-warm-bear-cb4ee8@houat>
	<20250707115853.128f2e6f@booty>
	<20250707121319.1e40a73a@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnn
 hesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_082854_017258_4AA42A72 
X-CRM114-Status: GOOD (  31.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Maxime,

On Mon, 7 Jul 2025 12:13:19 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

...

> > Post scriptum. The very initial issue that led to all this discussion
> > when writing the hotplug-bridge driver is that the samsung-dsim driver
> > will not drm_bridge_add() until a DSI device does .attach to it. Again,
> > see the comments before hotplug_bridge_dsi_attach() in [0] for details.
> > However by re-examining the driver for the N-th time now from a new
> > POV, I _think_ this is not correct and potentially easy to solve. But this leads to one fundamental question:  
> 
> The question is: should a DSI host bridge driver:
> 
>  A) wait for a DSI device to .attach before drm_bridge_add()ing itself,
>     or
>  B) drm_bridge_add() itself unconditionally, and let the DSI device
>     .attach whenever it happens?
> 
> A) is what many drivers (IIRC the majority) does. It implies the card
> will not be populated until .attach, which in the hotplug case could
> happen very late
> 
> B) is done by a few drivers and allows the card to appear in the
> hotplug case without the device, which is needed for hotplug.

I haven't received any reply to this e-mail. Should this be due to the
fuzzyness of what I wrote, you're perfectly understood. :-)

Let me try to start cleaner, and focus only on the question quoted here
above. It is very relevant to the hotplug work, so I'd like any informed
opinions about it in the first place. Many other things depend on it.

The samsung-dsim driver, which is in the hardware I'm working on, falls
in the A) case, and this is problematic.

> I had tried simply moving drm_bridge_add() from .attach to probe in
> the samsung-dsim driver in the pase but that would not work. Now I did
> yet another check at the code and I suspect it can be done with a small
> additional change, but cannot access the hardware to test it currently.

I managed to try today and test on hardware, and I can confirm that the
samsung-dsim driver can be moved from A) to B). In other words the
drm_bridge_add() call to add the samsung-dsim bridge can be moved from
the mipi_dsi_host_ops.attach op to the probe function, but this
requires an additional change, at least when using the imx8mp LCDIF:

@@ -1645,6 +1645,9 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 {
        struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
+       if (!dsi->out_bridge)
+               return -EPROBE_DEFER;
+
        return drm_bridge_attach(encoder, dsi->out_bridge, bridge,
                                 flags);
 }

Without the above change, the mxsfb driver will hard-fail because
mxsfb_attach_bridge() [0] finds the next bridge (the samsung-dsim
bridge, which is now added earlier, in probe) but cannot attach it to
the encoder chain (the samsung-dsim bridge still hasn't got an
out_bridge).

I have a working draft of the above samsung-dsim changes working with
the hotplug-bridge, and it makes the hotplug code one relevant step
simpler.

Your opinion would be appreciated before I proceed to cleaning up and
sending such change.

[0] https://elixir.bootlin.com/linux/v6.16-rc5/source/drivers/gpu/drm/mxsfb/mxsfb_drv.c#L128-L145

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
