Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17978C00140
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Aug 2022 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FERo1WlVgjhv6QfHuZlhehfQV4B4OW9JgdoPUNdt1Kk=; b=xonKcIpGhaDYLp
	1kp0Nnl99HqyFe/LY174kxMKEOyg8uTcgHGbJwsqrPvY9la9NtwbTYzMk8FXcfB/CAuSz2vgI2au1
	Fa6XY0edcOG0tmcpAfFphdBDZaezv65iMULHGInTMUB2xXBQXi8UNyKWOcjNSZ8cjIo5pCq/duQOy
	ySYdgKd1OjWbAnYQXOBH8KwxnH0JaAjwMII+WZv/iD/yTM1bO+Vg83Kncyoz7459KX8H9ZMF+wTMp
	1r9DzOJIL97+R8d1+kBRJ5iXJgnCwped9+ER9EEWxrWvRcj3eT30q2QgFLigefmW3jbIBcrF53SzR
	9bOXiVaedAKaG30tjO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPncx-00CHDD-JB; Sun, 21 Aug 2022 16:16:43 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPnch-00CH23-4w; Sun, 21 Aug 2022 16:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mIQV1DIv+YHcvrt01iCOdY9rQtM6K/IZFRYJ2XZbFJU=; b=AZ0zEJ2bJukguObMPt5fh5wnwA
	M66QXI5QOizJu5EQPP6htHxc3mEGcoboM+U3tW+ZGTvv4KeLZvts53lIVzMUhv0CAmpflvbLiqlKQ
	zxRIXSE3lMi4eN1lHFX8/KpxHs1QDSiniB/hIBvlAwvzRVpgZjpHjecI0u9+nIhO31BpbtK/8pVDa
	2dLBM1Z/bJCmtseuRxpgQn8DY/ekr/6MN56CQ4ZUJPr8jgaRYWKQz0phxzdoIeq8JdeK2umijLJrR
	r9LBeO7BD8TDv49hhu7aDDsqeAD3biAng8A+kqv50iAo+zaopqWeGlNcQtqLvEZ9hnAtFaFzyxGX/
	UER29IPQ==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=58457)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oPncb-0008G9-V2; Sun, 21 Aug 2022 18:16:21 +0200
Message-ID: <ba36ab96-962e-2b99-30fd-f62d51e06b47@tronnes.org>
Date: Sun, 21 Aug 2022 18:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 35/35] drm/modes: Introduce more named modes
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-35-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-35-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_091627_310902_AFDE2C0B 
X-CRM114-Status: GOOD (  17.87  )
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



Den 29.07.2022 18.35, skrev Maxime Ripard:
> Now that we can easily extend the named modes list, let's add a few more
> analog TV modes that were used in the wild, and some unit tests to make
> sure it works as intended.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 3634ac9f787d..09ed5ce7746d 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1853,7 +1853,9 @@ struct drm_named_mode {
>  
>  static const struct drm_named_mode drm_named_modes[] = {
>  	{ "NTSC", &drm_mode_480i, DRM_MODE_TV_NORM_NTSC_M, },
> +	{ "NTSC_J", &drm_mode_480i, DRM_MODE_TV_NORM_NTSC_J, },
>  	{ "PAL", &drm_mode_576i, DRM_MODE_TV_NORM_PAL_B, },
> +	{ "PAL_M", &drm_mode_480i, DRM_MODE_TV_NORM_PAL_M, },

Please use a dash instead of an underscore to keep it consistent with
what's used elsewhere.

I tried to use PAL and set the connector as connected, but that didn't
work: video=Composite-1:PALe

Is this a bug and it should work or should it be phrased differently?
It would have been nice to get a warning in the log if the parser fails
to understand.

This very verbose version did work:
video=Composite-1:720x576@50ie,tv_mode=PAL-B

(it seems to me that userspace often treats connection status "unknown"
the same as "disconnected")

Noralf.

>  };
>  
>  static bool drm_mode_parse_cmdline_named_mode(const char *name,
> diff --git a/drivers/gpu/drm/tests/drm_mode_test.c b/drivers/gpu/drm/tests/drm_mode_test.c
> index 006b73a61fd4..991eb8ed687c 100644
> --- a/drivers/gpu/drm/tests/drm_mode_test.c
> +++ b/drivers/gpu/drm/tests/drm_mode_test.c
> @@ -156,6 +156,32 @@ static void drm_mode_named_ntsc(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(&drm_mode_480i, mode));
>  }
>  
> +static void drm_mode_named_ntsc_j(struct kunit *test)
> +{
> +	struct drm_mode_test_priv *priv = test->priv;
> +	struct drm_device *drm = priv->drm;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
> +	struct drm_display_mode *mode;
> +	const char *cmdline = "NTSC_J";
> +	int ret;
> +
> +	KUNIT_ASSERT_TRUE(test,
> +			  drm_mode_parse_command_line_for_connector(cmdline,
> +								    connector,
> +								    cmdline_mode));
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	mode = drm_connector_pick_cmdline_mode(connector);
> +	KUNIT_ASSERT_PTR_NE(test, mode, NULL);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(&drm_mode_480i, mode));
> +}
> +
>  static void drm_mode_named_pal(struct kunit *test)
>  {
>  	struct drm_mode_test_priv *priv = test->priv;
> @@ -182,10 +208,38 @@ static void drm_mode_named_pal(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(&drm_mode_576i, mode));
>  }
>  
> +static void drm_mode_named_pal_m(struct kunit *test)
> +{
> +	struct drm_mode_test_priv *priv = test->priv;
> +	struct drm_device *drm = priv->drm;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
> +	struct drm_display_mode *mode;
> +	const char *cmdline = "PAL_M";
> +	int ret;
> +
> +	KUNIT_ASSERT_TRUE(test,
> +			  drm_mode_parse_command_line_for_connector(cmdline,
> +								    connector,
> +								    cmdline_mode));
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	mode = drm_connector_pick_cmdline_mode(connector);
> +	KUNIT_ASSERT_PTR_NE(test, mode, NULL);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(&drm_mode_480i, mode));
> +}
> +
>  static struct kunit_case drm_mode_tests[] = {
>  	KUNIT_CASE(drm_mode_res_1920_1080_60),
>  	KUNIT_CASE(drm_mode_named_ntsc),
> +	KUNIT_CASE(drm_mode_named_ntsc_j),
>  	KUNIT_CASE(drm_mode_named_pal),
> +	KUNIT_CASE(drm_mode_named_pal_m),
>  	{}
>  };
>  
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
