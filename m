Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE96CFD318
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Nov 2025 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMqv1oKRtc9C7KnU37cIneMlWCXPBFslidec0P1m8OI=; b=yhsWS0jOzIcBYu
	gY91iEZWd8EEyU1fQgLoo6yaefmWKYko+IhpgRWFMlBeJI6fM9L1P+NnJLAml13DtG/qkS4ZGSsyj
	iQ1PWQ8OkzZocXD+LEgoGW8TlIMEOrLa7rydMvKQIM+i5H6sT6uevIMFGyny5JysueEh80gIKIu4Y
	z74mjgDO2nAfnG92bCSGfRxIS6tw9QTV7yD7tbA2bb1B/5LuOqIgM5F64FmCIpxwjmMbk1y+6PEBR
	tXKF3KZmjysyZWsr5PotJ2Yg0c9qjuoZcsWhPVMzE3R6xZWGN+g9Fm1PxwWMd5Yci9gELByEh5rGi
	rDfRBNoIcS8BlYh6mJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZfz-0000000C0zt-3hka;
	Mon, 24 Nov 2025 16:44:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZfv-0000000C0yY-3xHR
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Nov 2025 16:44:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F3B541A1D1B;
	Mon, 24 Nov 2025 16:44:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7547606FC;
	Mon, 24 Nov 2025 16:44:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1410710371A8F;
	Mon, 24 Nov 2025 17:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764002662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8VxkXwHyVWJtMQb4rGcL9+DawEiYCDxx29eMOS81RRA=;
	b=KrEWDBIww4g7nDza6Zc7hbr+ZoXaAgKnm9t/c7uQL8DjmTM4Lqn6U4mOBDG5vMoUDsvrd2
	z/Sp/kXw6JnOSTYIFsmfxY3UrknEd6H/JIDub3AwK87pZ+UJrv5fYOmUNSbSYDq4WsP5v0
	oneufTmETBFZmFUh0DxP15w3p8E74Qylz6WR0Fur6qK4EEAxebJte+/MSikZrha0b/9Gls
	WRJzAXFmzZG7qJu0L63Dv+MuAQdNPhwTUxava0scvHSMJ7nqGhN0bidohpBwZuGxE/Vr0T
	7wEt+C6kFsdbn3+p0AzKRiI549ZbqiSwVxZK8aOtKlYFNJxrJuYIWVmjCUBcsA==
Mime-Version: 1.0
Date: Mon, 24 Nov 2025 17:44:09 +0100
Message-Id: <DEH2R1Q0XJJG.1NMESYMX9GMFL@bootlin.com>
Subject: Re: [PATCH 04/26] drm/bridge: make of_drm_find_bridge() a wrapper
 of drm_of_find_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Alexey Brodkin"
 <abrodkin@synopsys.com>, "Phong LE" <ple@baylibre.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus"
 <anitha.chrisanthus@intel.com>, "Edmund Dea" <edmund.j.dea@intel.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 "Anusha Srivatsa" <asrivats@redhat.com>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-4-0db98a7fe474@bootlin.com> <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7>
In-Reply-To: <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_084428_116173_6786B2E6 
X-CRM114-Status: GOOD (  21.36  )
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

Hi,

+Cc Anusha

On Mon Nov 24, 2025 at 11:22 AM CET, Maxime Ripard wrote:
> Hi,
>
> On Wed, Nov 19, 2025 at 02:05:35PM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is identical to drm_of_find_bridge() except it does
>> not increment the refcount. Rewrite it as a wrapper and put the bridge
>> being returned so the behaviour is still the same.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Kind of the same comment than on the TODO. Is it worth doing that patch
> when we could just remove it at the end of the series?

This series is not converting all users I'm afraid.

There are still some drivers to convert, but not a big deal.

The main user to be converted is drm_of_find_panel_or_bridge(), which is
very tricky, and in turn it is used by devm_drm_of_get_bridge(). We
discussed this in the past and the conclusion was a rework of the drm_panel
lifetime was needed to be able to properly replace
drm_of_find_panel_or_bridge().

A drm_panel rework had started very well with devm_drm_panel_alloc() that
got upstreamed by Anusha, but I'm not sure if it has made further progress
after that. So AFAICT the plan is still "People will gradually switch to
the new API over time", and the deprecated of_drm_find_bridge() will be
removed after that.

Does it still make sense to you?

Maxime, Anusha, are you aware of any steps forward about dynamic panel
lifetime, after devm_drm_panel_alloc()?

>> @@ -1460,19 +1460,11 @@ EXPORT_SYMBOL(drm_of_find_bridge);
>>   */
>>  struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>>  {
>> -	struct drm_bridge *bridge;
>> -
>> -	mutex_lock(&bridge_lock);
>> +	struct drm_bridge *bridge = drm_of_find_bridge(np);
>>
>> -	list_for_each_entry(bridge, &bridge_list, list) {
>> -		if (bridge->of_node == np) {
>> -			mutex_unlock(&bridge_lock);
>> -			return bridge;
>> -		}
>> -	}
>> +	drm_bridge_put(bridge);
>
> And if it does make sense to keep that patch, we should add a comment
> here to document why we are doing this.

OK, what about:

/**
 * We need to emulate the original semantice of of_drm_find_bridge(), which
 * was not getting any bridge reference. Being now based on
 * drm_of_find_bridge() which gets a reference, put it before returning.
 */

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
