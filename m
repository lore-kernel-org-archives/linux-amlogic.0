Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A805C19F2A
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMh2CUf6/E5cKOOEGA/TcFTpezKyDnfd43Pa7nO8Xkc=; b=ylKYIVyHTUYPjv
	4qiMPBTrkxMEJ9Ocfm7z8gpTCfW0hK+ggusfg5Q25tU8p0aK/GoHmPHhJPZ0nS5hOgri0HzmI6B4h
	AVRx5BSS6FbfxJbZqv57FlAiFuTArMPAbWeAomhMw+7GHA1842OR2BTcY0Wp7MTn3I2ct8Gguj487
	DJ0EoKqZQCSC5ysC5OjzynxS8YdHVJm/dZy1umK69AEpqUQygHPR4bmdleScBv0E+wh6KCpiSmhPT
	kfLL9IN+TP1+n8OWZ33Ksc+lsMRoQFsHkgTTKUAoqJnfWVPI/bzckYsmiJoeTbfa/pA5k9SgaPINe
	7G1Zi692btbNsDJ6QEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTSe-0072Ri-Qk; Fri, 29 Jul 2022 17:07:40 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSye-006SZK-JF; Fri, 29 Jul 2022 16:36:42 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id C9F1958095A;
	Fri, 29 Jul 2022 12:36:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112599; x=
	1659119799; bh=AbNcPzJA6v/1uyYWumbYgSqegXZI6Xt12q0cobRS6KU=; b=S
	2ZADGuo9ZIFB5W0yiNQUOgLYWbIvo3HriE7GN2yzby9+XyODXiuUp4zd12rZnkq7
	PznbIbn/ZssNgWJh0/XoDoMC794l1lBDZ+3iqkQEn+Wf8Fjfs/Vxss3a/Ivj0GFa
	RvmIIbjotac56Ab8FrKPH8ZQpH+4pBNZsQJw/Da4sJkv2s2SDFbJgCXs61rSgVWy
	teSAmefS3UgPmHaJ/4Ag3bu7t6bQZUlzWNSjJvM+2bkqXNMH3pK/W1MIYvgpMHaI
	qTWJxPE/M51B1iBA68ot4ODqW5bHK/NVa7pEjXe9+WIgsv7LH6mnfFPk9Sd+tXw3
	1QnVG5BUidOVd9uYR5EkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112599; x=
	1659119799; bh=AbNcPzJA6v/1uyYWumbYgSqegXZI6Xt12q0cobRS6KU=; b=c
	uXI7RYXu/CYtaumHSYijNmhPTAc69E6acqDsOPEiJV2DhisNYOMCEPnyvHyQZN4e
	ANEog9t3IJ/EfK6UukMBauG4sOKb4asdVZ5KEQkVGh+Ike51K5Qx3mry3ZTzYPXm
	LF6AQmFom6pP+pXN9J2Z/jt59PqUiTAlXrKy+iVAYPmJzwPhpzZqGGPu5deJE3V+
	z6SDqU6KJP7lPXrBH8FkvC3pjHzfuxWLg5YDWyOGjlgtKtoOWmhIdOnDc4UkOrbL
	eLmtZrUeCuTZgwVK2syhHpfD15lsAXrCNfCvm74q3EMB51ducvJSO8WLI6cjRyZY
	vQgojyOliaep7cfJCcY9Q==
X-ME-Sender: <xms:lwzkYrlwtQbB9iUJk1UbRBhYZZRkFDu0gcRDFIJ2v8jrOOmZAJttRQ>
    <xme:lwzkYu1QCX8d1xOUk4s8Puw3GJl-3Fc4VtsNifpylob9Qv9LZu8vr8tyElTb07eBo
    mYS-toW75hQOeB_BRY>
X-ME-Received: <xmr:lwzkYhq7iI00-l5t1a6YTQnQ5fGBEb1Tdc6hUbEXtkOkTrPg7GGuzhIdl2Pg07ARMaziBROLbsKhg9eyUPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lwzkYjlyLGinsBuVLZofx8nnnRUx2NrpK1IBbo_CEYH9ohfL0hWL-A>
    <xmx:lwzkYp2cW0CWHRhw4WbOKTaManrumGwEiDVsrHJPooatTp2SHQrFNA>
    <xmx:lwzkYitZWb2WbmxenJVAsYbFkt5v2bnekBwkxuviQNS6oikBpUwoIw>
    <xmx:lwzkYkEyfQPOf0np-oHcelKkmbaysisF36WQNRIwvbJPRXrn_gkSOg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:38 -0400 (EDT)
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
Subject: [PATCH v1 20/35] drm/vc4: vec: Switch for common modes
Date: Fri, 29 Jul 2022 18:35:03 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-20-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=maxime@cerno.tech; h=from:subject:message-id; bh=D8SpF+ipMcOmIfOKSwAuLhopKhw+DWNbLfscw43wats=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFK2TaX/aiA1Achtoznca7X69ijj0Tuj30usYIxbZJd 9WTTjlIWBmEOBlkxRZbrgm/t+MKi3CJ4PmyGmcPKBDKEgYtTACbCsZGRYdol8Ulb9X32PT1Q9btpcf zy+2v1uZzqw9Vu8bS0rWnVnMnI8OXmB/vuB15sk04aqmrlFM8UvDg1JkNmqx5f7YtQt0y2mwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093640_784064_F6A25B71 
X-CRM114-Status: UNSURE (   7.93  )
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

Now that the core has a definition for the 525 and 625 lines analog TV
modes, let's switch to it for vc4.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 8f30a530b2d5..255bba563fce 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -224,38 +224,24 @@ static const struct debugfs_reg32 vec_regs[] = {
 	VC4_REG32(VEC_DAC_MISC),
 };
 
-static const struct drm_display_mode ntsc_mode = {
-	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
-		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
-		 480, 480 + 7, 480 + 7 + 6, 525, 0,
-		 DRM_MODE_FLAG_INTERLACE)
-};
-
-static const struct drm_display_mode pal_mode = {
-	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
-		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
-		 576, 576 + 4, 576 + 4 + 6, 625, 0,
-		 DRM_MODE_FLAG_INTERLACE)
-};
-
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 	[VC4_VEC_TV_MODE_NTSC] = {
-		.mode = &ntsc_mode,
+		.mode = &drm_mode_480i,
 		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_NTSC_J] = {
-		.mode = &ntsc_mode,
+		.mode = &drm_mode_480i,
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_PAL] = {
-		.mode = &pal_mode,
+		.mode = &drm_mode_576i,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_PAL_M] = {
-		.mode = &pal_mode,
+		.mode = &drm_mode_576i,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
 		.custom_freq = 0x223b61d1,

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
