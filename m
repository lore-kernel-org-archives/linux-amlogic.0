Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E5FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Mar 2022 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJZrhjRIQSnwvRm1CUvsWCx9GM/Q5iELTC9Pdm3dYtA=; b=MtNZ34J4/u6IRg
	Dg0451Rf0GxgVCf3APzIUZCg17CxoRhFF5RJZvfrRfrLtfAjFJigjZhF/YjUckMPU0NPaN0Ntfp7w
	X95n2HSs4anKQGO27WV9J2/xyxGgU4OIKXGMi411qXn3lM3TKUfWibru90yKeuxnUZv9pSfWB1BZk
	ndapp2dmYv8GieDW9Vi6CmwdDKLDk8pUbZXdb2RcM94QLJdso+ciTp1FdunPXpfdSt1zzgkUKCutt
	S3Q3kl4c8rcW66k9p7lE8mWzp6oNmCHOgF6ajtnez/bc05+I5VEw4IYJMVjKS3eFgV5giEgdHbBCz
	POokorwn7hS32h/ROKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfpx-004NJQ-5D; Mon, 14 Mar 2022 08:13:53 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfbG-004GjH-DQ
 for linux-amlogic@lists.infradead.org; Mon, 14 Mar 2022 07:58:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id q14so22467456wrc.4
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Mar 2022 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/5Zssy/qjVUOmPsZXKpDZoEyYQBzcz5Dm2scyxNbSsA=;
 b=n3RGtDc2CCcmEaO+ZmuOAdVGFk3zitR0zNUbdXbyUn0BHStT95/PKeqMMtVymaSvd/
 yiaogIAhl+c4P1WkXsTL0UFhQXZhr7EGQR8HgOI3jDXe3ZXTMHIXUxUXkgP5tAk0Mbkj
 kebtY+mS33Xud1OYXhlHhn6kUyGAp2PVynNhGneppc4CMlXftscaILOlvFoJE+ecG9Cz
 k5YC0UF/2ev7YNvGPDoZgOhMWOAmIpb/Pz/sCPechPg52p5uLq6cmUY1CDgenn7daE/L
 082zn8NLzg2Pacm5UPD0AB3m/uEiG09/YASrX4XcSjw7TzBCCuPkXwFpx+tsofMluZqe
 vECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/5Zssy/qjVUOmPsZXKpDZoEyYQBzcz5Dm2scyxNbSsA=;
 b=APjgQRM8rAvb98bqJH8QCq5QU06PA2ChrPAY8MkjayNQh+55QPjnVTf3DU7eOGmBmq
 dTQb47hP7RxjsVliBxMq5r7yPpuTxrF9aY4is0Am6jNBPFaG+nGWqvrc+2aSqp0HexRG
 kfT2MUH+FGjvKT22wgOqEfQCbjiwNlOofLQB6f64/smDihWR21DwK7ZeQjnl23UCue4t
 JOwjignhsEOU2LyfNlH6NgKi377FwzpMHirl/8nes+Mfoq7cCdZ/rszthYhe5hAhJx8j
 5DbqANp879fHdsfLES8HujEWJjgK0uepwFkVCzA7+asA5V020k1UXrUoVBn9jJipOpSz
 HJ7g==
X-Gm-Message-State: AOAM530BdQRS0ET9T051U4dd2awZy9PQO25ktoTOPwSbtkgH9jAqapdS
 pevELakyAHO2Lyh3GetJ9vxhxQ==
X-Google-Smtp-Source: ABdhPJw1z7cYzXUMIL5+a9eG7REnc743MAoQ09qp8cu1JHEUssDSrlUz7mcW02Gv4wBksBmSahqjeA==
X-Received: by 2002:a5d:64e5:0:b0:1f1:fa31:e7d3 with SMTP id
 g5-20020a5d64e5000000b001f1fa31e7d3mr16190255wri.573.1647244720101; 
 Mon, 14 Mar 2022 00:58:40 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:67f0:57f7:2185:6d18?
 ([2001:861:44c0:66c0:67f0:57f7:2185:6d18])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm12670304wrv.79.2022.03.14.00.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 00:58:39 -0700 (PDT)
Message-ID: <01247ed7-16ef-e4bc-8745-a8fc5bfa1818@baylibre.com>
Date: Mon, 14 Mar 2022 08:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 15/64] media: platform: ge2d: move config to its own file
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Dmitry Osipenko <digetx@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <cover.1647242578.git.mchehab@kernel.org>
 <fe12b0fc0692a8d31b7461d57ca8874eeeb7e45a.1647242579.git.mchehab@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <fe12b0fc0692a8d31b7461d57ca8874eeeb7e45a.1647242579.git.mchehab@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_005842_509339_2D4087CA 
X-CRM114-Status: GOOD (  17.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 14/03/2022 08:55, Mauro Carvalho Chehab wrote:
> In order to better organize the platform/Kconfig, place
> ge2d-specific config stuff on a separate Kconfig file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/
> 
>   drivers/media/platform/Kconfig            | 15 +--------------
>   drivers/media/platform/meson/ge2d/Kconfig | 14 ++++++++++++++
>   2 files changed, 15 insertions(+), 14 deletions(-)
>   create mode 100644 drivers/media/platform/meson/ge2d/Kconfig
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 57ca2426a83b..d3b7bef19237 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -47,6 +47,7 @@ source "drivers/media/platform/coda/Kconfig"
>   source "drivers/media/platform/davinci/Kconfig"
>   
>   source "drivers/media/platform/exynos-gsc/Kconfig"
> +source "drivers/media/platform/meson/ge2d/Kconfig"
>   source "drivers/media/platform/omap/Kconfig"
>   
>   source "drivers/media/platform/aspeed/Kconfig"
> @@ -273,20 +274,6 @@ config VIDEO_MEM2MEM_DEINTERLACE
>   	help
>   	    Generic deinterlacing V4L2 driver.
>   
> -config VIDEO_MESON_GE2D
> -	tristate "Amlogic 2D Graphic Acceleration Unit"
> -	depends on V4L_MEM2MEM_DRIVERS
> -	depends on VIDEO_DEV && VIDEO_V4L2
> -	depends on ARCH_MESON || COMPILE_TEST
> -	select VIDEOBUF2_DMA_CONTIG
> -	select V4L2_MEM2MEM_DEV
> -	help
> -	  This is a v4l2 driver for Amlogic GE2D 2D graphics accelerator.
> -	  GE2D is a standalone 2D graphic acceleration unit, with color converter,
> -	  image scaling, BitBLT & alpha blending operations.
> -
> -	  To compile this driver as a module choose m here.
> -
>   config VIDEO_SAMSUNG_S5P_G2D
>   	tristate "Samsung S5P and EXYNOS4 G2D 2d graphics accelerator driver"
>   	depends on V4L_MEM2MEM_DRIVERS
> diff --git a/drivers/media/platform/meson/ge2d/Kconfig b/drivers/media/platform/meson/ge2d/Kconfig
> new file mode 100644
> index 000000000000..8c3f3b1b6b05
> --- /dev/null
> +++ b/drivers/media/platform/meson/ge2d/Kconfig
> @@ -0,0 +1,14 @@
> +config VIDEO_MESON_GE2D
> +	tristate "Amlogic 2D Graphic Acceleration Unit"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	depends on ARCH_MESON || COMPILE_TEST
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	help
> +	  This is a v4l2 driver for Amlogic GE2D 2D graphics accelerator.
> +	  GE2D is a standalone 2D graphic acceleration unit, with color converter,
> +	  image scaling, BitBLT & alpha blending operations.
> +
> +	  To compile this driver as a module choose m here.
> +

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
