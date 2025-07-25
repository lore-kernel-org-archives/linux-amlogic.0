Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B7DC87FCA
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Jul 2025 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5IUWiRVEHLf4IQX3ZAwOr3vwALmhttqsMMKbF15Hg8=; b=2JMicU1tTtST1W
	LMkht+WqUkUZBTEzs8TQ7VdG/NUd9vxJPWiIHolBTl+7qHNtYMWzJfRdbN+jIxts8nIscbJIWUnNC
	sX4+LUzMezs45j2PZPQfTp1e/nSm/EmlZ6Y+LR8OC8H1LIMgtxPLPbAS2V4zyC64yu7qHCTE6SvTI
	wYLgwZozOFcTro2pCRKuhXizVvEEIeacponOfqkAnx4V085cBMLaOSH5vRkc4wn38ayKsVCapX+e/
	UL+f3KDAFS+Z9QtLMMIcpumLRrKSgfgd/VROJMJLjv+b9/y6p60SMzy1HthgnZKDH0Gmtg05K+gQK
	DKTdcXO850WPAxWAvbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKPv-0000000A74c-2qcN;
	Fri, 25 Jul 2025 15:33:03 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKPt-0000000A73c-0mqL
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Jul 2025 15:33:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC9F443370;
	Fri, 25 Jul 2025 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753457574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUw48bVGzQDtnzpFCZ6F0zUPopLUUADYRFUd0lfoHsE=;
	b=gOe7LK/fGYNTmz+SyIELCjPFaJaCHIQ1cZCxpO6F/7sKlMOxRRHmUVPl7IAXCdbmAmgzzJ
	qhK1BlYOirxaOuv7zUtH+7p+NHrT7W6MoGw6U1vHfQA3q6tieo1SqT5AB7M/5eaJxkGkDh
	83V53TpmJLyk2exzGH7/QY3Nr79ar/ovL9WHSEUPkTnM/j18kUW2laDfMW3XjN4q70C7Bn
	d4RvcOiRc1ArRt3EaCCaQHPmX90dMQCNFor+oGojqc5TmT1eBTWfPQ7A+mhqaGcjJZp8H7
	E3OoJs+8MH+AAVPMtTkqeQ2oGKbCKz9KUKrzwRmSNF45iIk+nck7NEh0a/V7Dg==
Date: Fri, 25 Jul 2025 17:32:48 +0200
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
Message-ID: <20250725173248.4cdca9e4@booty>
In-Reply-To: <20250725-juicy-falcon-of-climate-d87ea6@houat>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
	<20250707-strange-warm-bear-cb4ee8@houat>
	<20250707115853.128f2e6f@booty>
	<20250707121319.1e40a73a@booty>
	<20250725-juicy-falcon-of-climate-d87ea6@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtleejjeduvddutefftdduleefudfgudeltdeuffeuudefgfdugeekgedtieehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhop
 ehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_083301_352203_2509C130 
X-CRM114-Status: GOOD (  27.10  )
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

On Fri, 25 Jul 2025 17:22:47 +0200
Maxime Ripard <mripard@kernel.org> wrote:

...

> > The question is: should a DSI host bridge driver:
> > 
> >  A) wait for a DSI device to .attach before drm_bridge_add()ing itself,
> >     or
> >  B) drm_bridge_add() itself unconditionally, and let the DSI device
> >     .attach whenever it happens?
> > 
> > A) is what many drivers (IIRC the majority) does. It implies the card
> > will not be populated until .attach, which in the hotplug case could
> > happen very late
> > 
> > B) is done by a few drivers and allows the card to appear in the
> > hotplug case without the device, which is needed for hotplug.
> > 
> > I had tried simply moving drm_bridge_add() from .attach to probe in
> > the samsung-dsim driver in the pase but that would not work. Now I did
> > yet another check at the code and I suspect it can be done with a small
> > additional change, but cannot access the hardware to test it currently.
> > 
> > Answering this last question might change and simplify the requirements
> > discussed in the (very lengthy, sorry about that) discussion above.  
> 
> You're not going to like the answer too much, but I think that it is
> that "nobody knows".
> 
> The bad news is that I can't give you an answer, but the good one is
> that it gives us some leeway.
> 
> As I said in my previous mail, we should probably figure it out,
> document it, and then make it work for your drivers. Once we have a
> documentation we can point to, the rest will fall in line.

Thanks for taking time to reply this!

I just sent a patch to do the mentioned change in samsung-dsim [0] to
start discussion on real code. I'd appreciate if you could prioritize
that patch over all other patches I have sent.

[0] https://lore.kernel.org/all/20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com/

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
