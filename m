Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B35AC00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cefbWPs7zzYKVN59I4nBwB9Pb3XZYCGER5bP0vk2jNc=; b=M3hUzoo2bsBQv3
	9L3D5o2XXzstg6TbgCrH4jGA7XBkY0fe9R48ADmB7DyhGyzl9UDZ8t6fRYT/Vb8JUkNkmoVlXJGyz
	/Y60ufvIGuHHih8OJzce5SXm1QpyCWDq4Epy5mxVSj+8UfAmO4yD1BUlC1/Ek2sI5rvu+2HkTtvi0
	eIjPM1b3Ng+yoblKAMeGWADVP9ZNZRJ/ezIoDx78pxIK28CSqRgX96NuZxxfk+SqJmnH7UsxgWmx6
	/q8h6qpXO5d+quxA8n0/iIHs8c0M8Y5UwfC7O+ew39FW/IwKR7XiHyOmm+KcvVw3hy5TdSys+8nXT
	lnMEVH6U7/f1kYIquOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTbn-007WhF-OH; Fri, 29 Jul 2022 17:17:07 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSz5-006Ssd-HZ; Fri, 29 Jul 2022 16:37:12 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id D652F58098F;
	Fri, 29 Jul 2022 12:37:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112626; x=
	1659119826; bh=4qGx3hZit6lgcEk+++mw0lRXGNof3zdttC570gMtjkM=; b=l
	GACZXlgopYcJNm4Jm6wUqewu+H5w79l2k87mB6ByuFKrffOg2jW04MqWIKX7wXuT
	tu/gXq7aZ6MiPhdXSCQmnR867FM5S6bHMgb0KwLbCKQ14lB8/+d7mWV+uoJ2Zko5
	g1Z7KdTmmhnvUoLy8ujVPawPqvy5dzvTz2I7fK8w0UU9vA/6m00uKcbwRCLKYxgv
	LgrX4C6bJMXUPRpVpH//dPw5Qg6kA+iiqpchNOcxcJH0ywL+lTuEermd8+goPpm2
	Al17zY5g3h814WxOVm0PqSUgBIOUCc8QbX2keq3Dp8adm4spk62UB4BcMgT8FYIh
	gW+9bhBxWG4Q4+7miGbRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112626; x=
	1659119826; bh=4qGx3hZit6lgcEk+++mw0lRXGNof3zdttC570gMtjkM=; b=c
	OvUOHm9ML7xSguz94NpbYgHBEoQHjTx71dbbu2OgTJHN5RqyOhVUVVd7T2XgB++S
	rge56cRXsONSQYTJPXBHlrxJcnLQhqZUuEL2CejFHEyupVXss4H+jxOoHqnFqdoe
	MHKeeegoNvasrgU8EvWVngBhAxcnYt34ro6tEP+6kwAB5KXpVO6e3Q5n8INY/f3N
	58JM5mw/1GrjZEBePm/sRYLWZ/D6R6n5ECtzNf420wkyUCYxLhAnlMJis3HzKW4u
	qnGs0TK+kzZ2BoajUJHv9aeICJY5wvfoTT17tiupUS2js06CdfeACWHksF1EQZoi
	tsA+DY71nFeZTrqzkku1w==
X-ME-Sender: <xms:sgzkYtkz2igTVrIsv4wD5TTDGtzjOyx3dc1k-LTYA00VIpRgoLjE8A>
    <xme:sgzkYo0lf7HKkWLM1KcKiSAB8A4B0WxXZy8B07vtbHVAp8u9VXoPV8L6TAvfmfCGM
    OtDnPAnvfSTWEWH-EM>
X-ME-Received: <xmr:sgzkYjoDPKoAaxu2C_-ypyZJW6qCKxwPmQl9gOEdRpqb7NoYY4eFT-ITJ-bJ7yfYesn6BUzDYyugEJaZh0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sgzkYtnnzvCIrnkoeZfuupii8TnxYLTrIn0Vyo9DVbEQxQ2g_UTcrg>
    <xmx:sgzkYr1xtZIIvkJu4p4CirYW0QgUEx7xo6OmbvSmPxjsl7WsXsm_0A>
    <xmx:sgzkYsvXk7wj0tkYE9lgDsSW8bgon7iKJ8nAXoRhYtPZrokwTqUHHg>
    <xmx:sgzkYmEKF4G1B_FABO6kc972JK6uqx9D0oCMHNk150ek6jjaEnsTYQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	Emma Anholt <emma@anholt.net>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v1 27/35] drm/sun4i: tv: Merge mode_set into atomic_enable
Date: Fri, 29 Jul 2022 18:35:10 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-27-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=maxime@cerno.tech; h=from:subject:message-id; bh=j0+yMQ24E6EGIp+/t0OCzlRHmGmJAkQbvTve/uup35s=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VGqVGbNf3G7w++iaqyd3Kqsk+uWPVoba7c/5YyfxaFb WYHyHaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAEyksJLhr9TCllaboHWHGySPhz76Lh d0kvNi/moR/VCrqnx7lj82Bxn+cHLyujT81VqYnaCcyHro4GX9Aisdiy2z8nnkWrxmN2i5AwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093707_723000_92FA6E6D 
X-CRM114-Status: UNSURE (   8.52  )
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

Our mode_set implementation can be merged into our atomic_enable
implementation to simplify things, so let's do this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index f7aad995ab5b..3944da9a3c34 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -359,23 +359,13 @@ static void sun4i_tv_enable(struct drm_encoder *encoder,
 {
 	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
 	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
-
-	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
-
-	sunxi_engine_apply_color_correction(crtc->engine);
-
-	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
-			   SUN4I_TVE_EN_ENABLE,
-			   SUN4I_TVE_EN_ENABLE);
-}
-
-static void sun4i_tv_mode_set(struct drm_encoder *encoder,
-			      struct drm_display_mode *mode,
-			      struct drm_display_mode *adjusted_mode)
-{
-	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
+	struct drm_crtc_state *crtc_state =
+		drm_atomic_get_new_crtc_state(state, encoder->crtc);
+	struct drm_display_mode *mode = &crtc_state->mode;
 	const struct tv_mode *tv_mode = sun4i_tv_find_tv_by_mode(mode);
 
+	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
+
 	/* Enable and map the DAC to the output */
 	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
 			   SUN4I_TVE_EN_DAC_MAP_MASK,
@@ -468,12 +458,17 @@ static void sun4i_tv_mode_set(struct drm_encoder *encoder,
 		      SUN4I_TVE_RESYNC_FIELD : 0));
 
 	regmap_write(tv->regs, SUN4I_TVE_SLAVE_REG, 0);
+
+	sunxi_engine_apply_color_correction(crtc->engine);
+
+	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
+			   SUN4I_TVE_EN_ENABLE,
+			   SUN4I_TVE_EN_ENABLE);
 }
 
 static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
 	.atomic_disable	= sun4i_tv_disable,
 	.atomic_enable	= sun4i_tv_enable,
-	.mode_set	= sun4i_tv_mode_set,
 };
 
 static int sun4i_tv_comp_get_modes(struct drm_connector *connector)

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
