Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C92F9937E
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 11:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DdvIFyYReLqVThiINRjt6pRq6lEejt4M3ztWhFpQIA=; b=F5xy2NSviSlTQv
	2YfmPSX62kVD6/7KAuTG47Q0qQsS3EHqTpXVKgWDgiMTl6BhWQzljatsdXaboZV7iwQDQzDWXIMDi
	PYguHxg+mnWm54O9d5ywFJMGWjXTB5+DS2+ffq20YskQmKemvgjJiUmoUGLkp4PoGr7WtkvrHrljJ
	RYjK4INvj5rKC7k8izPdwvhNFz+VQgfjIdhn4rjif8gCDjroGK0fR1doRjA/r/EFbR6F8O/u08Qi0
	oFmKKC4J0ERTxSEV5zKccc4ClYPXSHuwKyyNrNHf8NmoQV/rIKxIKN5IwuTFWmkibc/wNhWETWfm/
	hrW45cIhYT8iM5fzwbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsgw-0000000BZFj-1W6D;
	Thu, 23 Apr 2026 11:57:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsgs-0000000BZEq-181g
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Apr 2026 11:57:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7F104C5EF0F;
	Thu, 23 Apr 2026 11:58:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37646604EB;
	Thu, 23 Apr 2026 11:57:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE3F410460B5E;
	Thu, 23 Apr 2026 13:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776945468; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=spuptGyV229bp7Qtkgr1ixwBRfqXgocmfypIw6kmo+c=;
	b=AXAb/y2Bu2/h1zVZusCyq2Ei4v6S+jsdxsaOItC/9pWvFe5z5ZNY8NkXDZrV7nuv8YXKCD
	cYGs2bhNNlxLYr4qLpRRLOROvawFRmrk1sEiotgNJXJA15Y0dIqBeHJ/7QAdmkPedDc/Qm
	AgEsfqtMkoS+GsycOpgdhUiPhFaM9eEuNy698KJqsv1X/CcGzwn03eoO6a0ruvPbJLUIPi
	zepLlm7m1ekb/+2YJ3idxzIpxDeyOBq5v4PLAfhsDN/ZONV0GpRhZY9hN/8vSJP+rwj0ju
	mTKEAiXevn2ItoM4AsiD580raKJ9GtU8u8Kl/xuZ7gVjZwAEIQdJ8hkQOuT0zA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Liu Ying <victor.liu@nxp.com>,
	Douglas Anderson <dianders@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 36/41] drm/tidss: remove now-redundant call to drm_connector_attach_encoder()
Date: Thu, 23 Apr 2026 13:55:45 +0200
Message-ID: <20260423115550.444930-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_045754_619603_84933420 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

drm_connector_attach_encoder() is now called by
drm_bridge_connector_init().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/tidss/tidss_encoder.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index db467bbcdb77..34db8d2a3792 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -123,12 +123,6 @@ int tidss_encoder_create(struct tidss_device *tidss,
 		return PTR_ERR(connector);
 	}
 
-	ret = drm_connector_attach_encoder(connector, enc);
-	if (ret) {
-		dev_err(tidss->dev, "attaching encoder to connector failed\n");
-		return ret;
-	}
-
 	t_enc->connector = connector;
 
 	dev_dbg(tidss->dev, "Encoder create done\n");
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
