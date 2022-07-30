Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56481C3F6B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jul 2022 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZObT3C5a6CewmfT7rAHzw8QkOv+VB995XOiSdXg2IY=; b=ClZ7iRLUB2PHAG
	jgEAAfq1CG9dw3PcbrjG2Ai2AV+EcTUAgHaJ/8Mjm8qFdr+BvdURaB0Oxilg2UmRkhqPa8Z2mTxKF
	OsHVbrLDgueHzeMtVlkJgWjxlDFg+RA0EHsQTz2F9IG6OZikY+WX1Bgqfvlu/I3ZM1IheDjZuj9vk
	8MU0FJayfNYaAGRzQpmWXYs0MIv8kWAjZ8BxYMFKVvutM5478kreP+jB1StorWqLd6Gy+x458UuuG
	XcqoxYPj+K5gJlzRyDIzN6apNcPfD50ExiJFdjDjyzEBtYDgTMCzf7IrEkkh7UJg9/v1Znr/ILlqS
	o3IJAR4xrMMWV1aTSw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiZR-00GukF-1U; Sat, 30 Jul 2022 09:15:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiZ8-00GuYB-J1; Sat, 30 Jul 2022 09:15:23 +0000
Received: by mail-ej1-x62d.google.com with SMTP id sz17so12157039ejc.9;
        Sat, 30 Jul 2022 02:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rwWtE2tS+sQfxC0TkYkw+6LysHn8HM6so6RxZNUEwWQ=;
        b=cUuJZ0nzayLtd8sD1yqDO+l52EhIAyWq6fLaHZagbbZVJKKCUYyqC0sLoFqK5i10zC
         OiQN+JhbXIBEd+ifQUUou0Xm4CHUyrEtDHAFIfsJ/thybpafFsKAGPc+zRW8drWcD/2y
         MbcptzAARs9f2bw9vbEiLNPGkXipLLlozKnC8B+j1/A0VCwDPynRlCFADJymcs/nZQMq
         0r+PNxvDlrSlp8SkpMFbTyC2zaG1kGz6VKlhT0BnkbvQfXkLmm9augDHwmRVcE0vsk27
         xIUv8XBlV3TzjiCAoD1ucUi3DHMqMiTxaxbG+/0huI6IfOY2cXOfRUJCzDSSbZHbPWt6
         B20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rwWtE2tS+sQfxC0TkYkw+6LysHn8HM6so6RxZNUEwWQ=;
        b=CZWqLPa5cQ+vJzxg+AjsuN/eb4ZjtqNJQIdyCBunbvg86CKcMbJKJ/m4oUMWGqQu22
         +7ntnDz3JVzAZCzbtFCZeFbeUxhZMHKCrN9nT8z848DionS0KweWsKbBIE4qFfb6byOG
         tMrPHCnKk6Ujf5F7TNDYxtFk0tq20x+uI8m8DTd7fuRnzSd6sD/95CNYO49IUjUeEs8+
         kX0zvU/uMf/UEGWCpNqQsajgSwSorq67TPKCJQzZSkxUkSNQj8MA7VixM5e0ZeYq4dqP
         akfhva8H9Xnv9lB9ZtVA/pMc672LfUJb5s5hTDC622O+v0jWYisQzrYprrjPWjzwjEvG
         qm0A==
X-Gm-Message-State: AJIora95bmbQcNkaWUjhY4+OLsktmi33oGsH3qo0edMgKoIS3J5H4JQv
	tkZSXrgq9WlKPPgTGaIdccM=
X-Google-Smtp-Source: AGRyM1uUUQf/u0gQ0J3VcW2S6C2L6ixaRhj3FiMEXuT1uyjb9VsBFnqW3+WGYV9mlP57pVmny/vcAA==
X-Received: by 2002:a17:907:7638:b0:72d:f11b:5ebb with SMTP id jy24-20020a170907763800b0072df11b5ebbmr5799655ejc.647.1659172521175;
        Sat, 30 Jul 2022 02:15:21 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net. [194.152.27.124])
        by smtp.gmail.com with ESMTPSA id g5-20020a056402114500b0043cf0d56a61sm3623915edw.8.2022.07.30.02.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 02:15:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 30/35] drm/sun4i: tv: Rename error label
Date: Sat, 30 Jul 2022 11:15:19 +0200
Message-ID: <2245985.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-30-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-30-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_021522_670155_5AEEBEFF 
X-CRM114-Status: GOOD (  13.27  )
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

Dne petek, 29. julij 2022 ob 18:35:13 CEST je Maxime Ripard napisal(a):
> The other error labels in sun4i_tv_bind() are named after the task they
> perform (err_disable_clk to call clk_disable_unprepare for example).
> 
> However, the err_cleanup_connector is named after the calling site
> (drm_connector_init failing) and will actually cleanup the encoder. Let's
> rename it to err_cleanup_encoder to be consistent.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 6d7e1d51569a..ad6a3739bfa9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -580,7 +580,7 @@ static int sun4i_tv_bind(struct device *dev, struct
> device *master, if (ret) {
>  		dev_err(dev,
>  			"Couldn't initialise the Composite 
connector\n");
> -		goto err_cleanup_connector;
> +		goto err_cleanup_encoder;
>  	}
>  	tv->connector.interlace_allowed = true;
> 
> @@ -588,7 +588,7 @@ static int sun4i_tv_bind(struct device *dev, struct
> device *master,
> 
>  	return 0;
> 
> -err_cleanup_connector:
> +err_cleanup_encoder:
>  	drm_encoder_cleanup(&tv->encoder);
>  err_disable_clk:
>  	clk_disable_unprepare(tv->clk);





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
