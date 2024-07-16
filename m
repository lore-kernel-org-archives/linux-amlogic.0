Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A65C3DA49
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jul 2024 09:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpW5HHPker4gJFcLgPYOT0rDzeZucChs0L69HT0wkuQ=; b=tgh8StsdM+4uHv
	uDYeV71QDHisdKCnSIPsLfpmzjozYuCGA9P67V2++Gkg9mVI0v7s6AA+CFe2IqjzngWNF/vvEgQvh
	B9TNd+uB19wonuxpfUYPsQf+XKCGJHEoZ/u243b74l7xGcDL0BBmcg3w+bfcTy+3QTznpUUTc80f4
	4ElQ9avZvZQgBQO0Vkhg8JKdifvxSXpiKeB2Whqz1x8QNU58MrSdHQhes168qkc3WZngeGDk0sUnK
	OfanvpyCRIXTWeiT2pOP4cqcNEBKALdvtdCsNKXOoq9QYe0OekdVgNyyKsCw2S4TgLTeM3ljikm05
	oSadSK/LK3Q7tf7S4wMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTei1-00000009url-0akB;
	Tue, 16 Jul 2024 09:42:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTehy-00000009urB-1GHw;
	Tue, 16 Jul 2024 09:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A905760304;
	Tue, 16 Jul 2024 09:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82D1C116B1;
	Tue, 16 Jul 2024 09:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721122973;
	bh=gDVpLTlm7lBzqAAT1y+n80sMgKwLRhbqPLufAivER2Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=bs6ovHpwe2yWXn0F3AasvaT0I9cp3MjORXkUWDKeHHYlApUX1laz7G3TE5RZ+3Jj+
	 TG3VKC2uWktVdXdjJSwxZIndsY1UKZiG5nbjx5vL8Abybaldxg7kysjkpNAWhg6Lmq
	 5bmHBMyoZIqgckSmPy0d6bP2O+MLst1RjKorDzb3JQJFOYdYHaQWVkFeMVRRgdkbJh
	 pTfAUkUn5zsWg83t3X60WPPtiOZWLV7FLoTmJZDom4O/G/wIC+stSHFYKlevzxvqcN
	 s5lQPuqdxuKPnESNh+3vSaZGWggDoMyzSYJzZuyqtHqJ/crn4o61e9U0WvX46e7R5K
	 jfUFkHbLvy3+g==
Message-ID: <26a64cd3ad422eaa9367917dd90d65b7@kernel.org>
Date: Tue, 16 Jul 2024 09:42:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 5/5] drm/bridge-connector: reset the HDMI connector
 state
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-5-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-5-61e6417cfd99@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, igt-dev@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Anitha
 Chrisanthus" <anitha.chrisanthus@intel.com>, "Biju Das" <biju.das.jz@bp.renesas.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Edmund
 Dea" <edmund.j.dea@intel.com>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Kevin Hilman" <khilman@baylibre.com>, "Kieran
 Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurentiu
 Palcu" <laurentiu.palcu@oss.nxp.com>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Mikko Perttunen" <mperttunen@nvidia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Cercueil" <paul@crapouillou.net>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shawn Guo" <shawnguo@kernel.org>, "Thierry Reding" <thierry.reding@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_024254_412651_11E29C80 
X-CRM114-Status: UNSURE (   5.01  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 15 Jul 2024 09:33:05 +0300, Dmitry Baryshkov wrote:
> On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> IGT chokes on the max_bpc property in several kms_properties tests due
> to the drm_bridge_connector failing to reset HDMI-related
> properties.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
