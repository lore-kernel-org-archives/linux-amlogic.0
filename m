Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574DAC00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTjH/V3x51POaXHdLQmwYwUH1hvi09wICZnEapeXcEU=; b=wDM+FnKbUi9GcK
	9Pu8Byr1sNOTmuu2LRysTONm45SmojQSO88CKlDvPA2BZzKojvTLz2eXbRyVOzwwphoFtw+Uwo6ZX
	kvpi/uI46LC9hZ7h3Z8fQdE5lLjjp1yIZ1X3XhPp+7/fEyD2IbMr0Tr0e8blJhInAfc+ExZTSWcl6
	mvlfDkG43ZVmjIJlZnTT+NpFRG6/2aXs3dnYoXfCSB3Epw6S+7j889xnecL6tRExLY+G6Q5SRcYJW
	MzfY6chbhsAZCljtngOV4towFknNbjZw+9tmyp8eso0xjmfYJteztSYwyDMfFI2TmHc/ewrLVRvkh
	wXhFEh7Un8bUGsmOP4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTak-007T2w-0G; Fri, 29 Jul 2022 17:16:02 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSz1-006SqF-Mm; Fri, 29 Jul 2022 16:37:05 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id BFF1B58098C;
	Fri, 29 Jul 2022 12:37:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 29 Jul 2022 12:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112622; x=
	1659119822; bh=XckcpoELRAAukT+qCBdvHaSrqmBkD7IAU61uNE+rv7c=; b=j
	5OTEe9/ikhzjIBEHcRVP3n4XSH68mICFLAMWOa+MfxgmIge1F1uPH/lXRx7eP/ec
	a165ZF/rRh8AYgzmv1nxuDYXqGJE5OSWR90UrReF+MmMxaB9alL09MfiVa89ustS
	Q9aB0l78V6v5itSekOqdN4mB4IShHItwWBSuKvOabMY3IK1jzLhDh1LAdkVphfl8
	jtUvlN/LhBbEn3eHl+psxH/hUfsFUisNKB/NGdYSax+B+lDkSOA6wLE7+QDu+lEN
	eRXj1jPdjAftUz9TB+4NVh0iuTeRGYv2dEHlXGLNvLpRYCUVK483utVd1CX0f5GE
	Lr2t3LoV7Zc2dHkOssqIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112622; x=
	1659119822; bh=XckcpoELRAAukT+qCBdvHaSrqmBkD7IAU61uNE+rv7c=; b=s
	AF3Da3EY5YoxK1fo01f536wWejrgWzd7TM9jGrQ0CYJHqvxt2KzjQfi1mwA11OAR
	S1Wnwtze6MRqp2ARoA64gZHvD01fHTSNXHvD9ZcFApL/MeaQC/A4oSCd1w8CdRUg
	KjbuB1ynEgEWO2RqN6oaYCUDquksz+Ilf18fbiirVn3t/9M3vRHBAFYyAkv8+LbT
	mNsUvlM0G4PwDQKiIiP6jCdaTw8lKF2xyKWbpbjKIKOu4hDbU5NsGQb2QLNU0ZzK
	SkVuuJTyufbW653qDIAGQfdxrK2nut5YL5rDo4pMTUAhN6Jhb+2DWcymWJbN8o5/
	SgMSDGu0mhyk/4ntzinrw==
X-ME-Sender: <xms:rQzkYjQsX7L-7Ujc-qReTQobJhjbNEIr51p4hHZDCy3tNBKOwpj_Pg>
    <xme:rQzkYkymIpQ8aCvTFXjmEpOTPK-KliEPuMYrPJizB37kDIPQAHzaaq6bq8t1ND28j
    rzC8IoDuUpJHEn3pRM>
X-ME-Received: <xmr:rQzkYo1umWGzFd_CHN4CFE3FZ4F_OiE2tCdU_3-cQ0U1i5ge57XGuJf0K3MLR9DRtnbFab6DPJniM0iVth4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rQzkYjAshtz7u1LoO9Z3AQfWbjRmZaE447Nmca-uw9LqwAnaRQixAg>
    <xmx:rQzkYsi0VwlOyxANgsNV0kkoOIjLlVgs-VuHwm7XAiqpupoiKINyEQ>
    <xmx:rQzkYnpFCmAtCWwG-ikV88ds_Ol0OI-rzxzQ5919nVptVEMS9dv_Nw>
    <xmx:rgzkYjSbYw3BSevVsGPJV5btvgUTKFClIL7v3JCdcucifxvazYp2mQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:00 -0400 (EDT)
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
Subject: [PATCH v1 26/35] drm/sun4i: tv: Convert to atomic hooks
Date: Fri, 29 Jul 2022 18:35:09 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-26-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=maxime@cerno.tech; h=from:subject:message-id; bh=rHEOub477XlbL+5lo6Ff+MJpYcQ5tUS9w6PRTcDJwtg=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFyZDbY0vu+cOkaQx7r9NN+Hyvr/17ekrb1G3tE7TpV rumuHaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAEzklSHDXzmtmae1W/5G/3/v3ucfo/ Qp7kRd43Yf0WOvInrWMwcc2sbwv2SV9Yy2n8IzTe+cFdTdvetm4Kyf7+r7bbc5c1g1WvQYawIA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093703_884632_AB02EF0E 
X-CRM114-Status: UNSURE (   7.39  )
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

The VC4 VEC driver still uses legacy enable and disable hook
implementation. Let's convert to the atomic variants.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 53152d77c392..f7aad995ab5b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -339,7 +339,8 @@ static void sun4i_tv_mode_to_drm_mode(const struct tv_mode *tv_mode,
 	mode->vtotal = mode->vsync_end  + tv_mode->vback_porch;
 }
 
-static void sun4i_tv_disable(struct drm_encoder *encoder)
+static void sun4i_tv_disable(struct drm_encoder *encoder,
+			    struct drm_atomic_state *state)
 {
 	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
 	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
@@ -353,7 +354,8 @@ static void sun4i_tv_disable(struct drm_encoder *encoder)
 	sunxi_engine_disable_color_correction(crtc->engine);
 }
 
-static void sun4i_tv_enable(struct drm_encoder *encoder)
+static void sun4i_tv_enable(struct drm_encoder *encoder,
+			    struct drm_atomic_state *state)
 {
 	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
 	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
@@ -469,8 +471,8 @@ static void sun4i_tv_mode_set(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
-	.disable	= sun4i_tv_disable,
-	.enable		= sun4i_tv_enable,
+	.atomic_disable	= sun4i_tv_disable,
+	.atomic_enable	= sun4i_tv_enable,
 	.mode_set	= sun4i_tv_mode_set,
 };
 

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
