Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D308EC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Mar 2022 08:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2k+0fsjkqaVqISV4F0dINO+2wIWjyMQEpJ6w8TykdDg=; b=NPVgwGhJOg/WAM
	Vu3x/gZ068VmHe4HT0n8wzdNngjgLq8CCODEOEIHRgehzftjSe6sBgqMk4bXVbvJyIe41bLceEUYT
	GbvlEmf19W0VqcYS8fAOTyMl9b8lHpTtS5PxbdPg4jx7TOAnt41rCM+2IS2NFd2VoVCLuXsFHw0+o
	HNvO3LJxf6c4DgT0Tf1YdtIFWQWt3zmI0ze2nAomsFg2LXHnkVFjm0lh7YR2sNxGmkPOkfwAi2sZV
	JjEOanxI3VbKZE/+h4abCUi/dGTrhLw1yq9VHBtn5fPK6wULL5X1XtDNyEZov1J5noDM0YACsS7w2
	BwBm1utDCH0JT+L0EDMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfrA-004NxG-M9; Mon, 14 Mar 2022 08:15:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfbm-004H1t-MH
 for linux-amlogic@lists.infradead.org; Mon, 14 Mar 2022 07:59:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso7964430wms.0
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Mar 2022 00:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MC6HDIsM6caLoZkWRofVBLBIti9B8aptOUAXfQ9m/U4=;
 b=ZSxujdAdsFj6jAc592keazUoY8tCR3tyKlPrO1d9Xr9614sPJMihXDvqBIASV0+oB1
 sAH9WjvUsnvCRaTa2wN7LthSDB4mX8Rs8SChTwlj15ueSSct7xRE4oy7v8TShpjbuDnx
 2ZwzIg4oIk1nQm2ruxX3hM/Ce7la41Axu/mLY5SXWUw2Msl5DDaRdejWucUZEoxs2wbY
 2woJbA/SqfSP+Z/KY4q0wFadO7t5YYis8ELDSIs+bSr2+S7LCMB3uExztaeQw35ijtm8
 t5owtwNuaZ62pJJ+GcF6ppoWRYQ7Oy/R4h4Tv6dvyQVOWqbfO/BHG57hQUMl61xj7VS2
 c8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MC6HDIsM6caLoZkWRofVBLBIti9B8aptOUAXfQ9m/U4=;
 b=ms9kRUEm9MeFZ1XaURpEz3xYbZkSB9l6iUznH3n9s0n7uW5ph59Zu8N5dX96jLCcKF
 o5lprF/5t4jSTy8pCry+QwD5X8YtourJKG4PUzmlAtQqunLM0WndoBDGNsQqQSCSFDa/
 9nGqC5S5dFGNH4yxXKFb+f36vtjUMgY1EeJXOlqljE0d9OzWYlnmVv+IXGuBlDUotiOd
 hr6AbmUFJYVaRtNQnLgxG8/JiQh069zqLh+nW1myHN4i824SaQ63OCJcaRVZY2ggh+cq
 RszXZCB3SYrXZ6hFSrjSk+yrD3digA4QaEWy9OAAZIykKFgr3HSCRvcQ5ibL4lEToKS4
 i55g==
X-Gm-Message-State: AOAM533wA5uG9jWI4ib6ENoj7X56zy4jg74hWW3jsS9kLD1FHYDG2Qrg
 x2PEmKP2N8l5qk7LAmHTS7YntQ==
X-Google-Smtp-Source: ABdhPJzEiifCc3FGV7IxyMbRZlCmOa5yD5BOm940pyHmakvmgXmE4JGdL18CH7IYG0SmsQ6mSHuzQg==
X-Received: by 2002:a7b:cc15:0:b0:381:3fb8:5f93 with SMTP id
 f21-20020a7bcc15000000b003813fb85f93mr24657016wmh.106.1647244753060; 
 Mon, 14 Mar 2022 00:59:13 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:67f0:57f7:2185:6d18?
 ([2001:861:44c0:66c0:67f0:57f7:2185:6d18])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c358400b00389f61bce7csm14307774wmq.32.2022.03.14.00.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 00:59:12 -0700 (PDT)
Message-ID: <5ad6d9bb-c0ba-4112-b015-44f992b56d00@baylibre.com>
Date: Mon, 14 Mar 2022 08:59:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 42/64] media: platform: rename meson/ge2d/ to
 amlogic/meson-ge2d/
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Cai Huoqing <caihuoqing@baidu.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dmitry Osipenko <digetx@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jacopo Mondi <jacopo@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1647242578.git.mchehab@kernel.org>
 <ca17efa7ff931475071461fd046e50c300575834.1647242579.git.mchehab@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <ca17efa7ff931475071461fd046e50c300575834.1647242579.git.mchehab@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_005914_795043_3BB39599 
X-CRM114-Status: GOOD (  14.20  )
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
> As the end goal is to have platform drivers split by vendor,
> rename meson/ge2d/ to amlogic/meson-ge2d/.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/
> 
>   MAINTAINERS                                                     | 2 +-
>   drivers/media/platform/Kconfig                                  | 2 +-
>   drivers/media/platform/Makefile                                 | 2 +-
>   .../media/platform/{meson/ge2d => amlogic/meson-ge2d}/Kconfig   | 0
>   .../media/platform/{meson/ge2d => amlogic/meson-ge2d}/Makefile  | 0
>   .../platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d-regs.h     | 0
>   .../media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d.c    | 0
>   7 files changed, 3 insertions(+), 3 deletions(-)
>   rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/Kconfig (100%)
>   rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/Makefile (100%)
>   rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d-regs.h (100%)
>   rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b83cf0eb99ce..09b0e60da4e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12523,7 +12523,7 @@ L:	linux-amlogic@lists.infradead.org
>   S:	Supported
>   T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
> -F:	drivers/media/platform/meson/ge2d/
> +F:	drivers/media/platform/amlogic/meson-ge2d/
>   
>   MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
>   M:	Liang Yang <liang.yang@amlogic.com>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 0a4260627a00..b4faee0a1b63 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -67,6 +67,7 @@ config VIDEO_MUX
>   
>   source "drivers/media/platform/allegro-dvt/Kconfig"
>   source "drivers/media/platform/am437x/Kconfig"
> +source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>   source "drivers/media/platform/amphion/Kconfig"
>   source "drivers/media/platform/aspeed/Kconfig"
>   source "drivers/media/platform/atmel/Kconfig"
> @@ -77,7 +78,6 @@ source "drivers/media/platform/exynos-gsc/Kconfig"
>   source "drivers/media/platform/exynos4-is/Kconfig"
>   source "drivers/media/platform/intel/Kconfig"
>   source "drivers/media/platform/marvell/Kconfig"
> -source "drivers/media/platform/meson/ge2d/Kconfig"
>   source "drivers/media/platform/mtk-jpeg/Kconfig"
>   source "drivers/media/platform/mtk-mdp/Kconfig"
>   source "drivers/media/platform/mtk-vcodec/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 8b2deba4b62c..48531f93d92f 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -7,6 +7,7 @@
>   # (e. g. LC_ALL=C sort Makefile)
>   obj-y += allegro-dvt/
>   obj-y += am437x/
> +obj-y += amlogic/meson-ge2d/
>   obj-y += amphion/
>   obj-y += aspeed/
>   obj-y += atmel/
> @@ -17,7 +18,6 @@ obj-y += exynos-gsc/
>   obj-y += exynos4-is/
>   obj-y += intel/
>   obj-y += marvell/
> -obj-y += meson/ge2d/
>   obj-y += mtk-jpeg/
>   obj-y += mtk-mdp/
>   obj-y += mtk-vcodec/
> diff --git a/drivers/media/platform/meson/ge2d/Kconfig b/drivers/media/platform/amlogic/meson-ge2d/Kconfig
> similarity index 100%
> rename from drivers/media/platform/meson/ge2d/Kconfig
> rename to drivers/media/platform/amlogic/meson-ge2d/Kconfig
> diff --git a/drivers/media/platform/meson/ge2d/Makefile b/drivers/media/platform/amlogic/meson-ge2d/Makefile
> similarity index 100%
> rename from drivers/media/platform/meson/ge2d/Makefile
> rename to drivers/media/platform/amlogic/meson-ge2d/Makefile
> diff --git a/drivers/media/platform/meson/ge2d/ge2d-regs.h b/drivers/media/platform/amlogic/meson-ge2d/ge2d-regs.h
> similarity index 100%
> rename from drivers/media/platform/meson/ge2d/ge2d-regs.h
> rename to drivers/media/platform/amlogic/meson-ge2d/ge2d-regs.h
> diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
> similarity index 100%
> rename from drivers/media/platform/meson/ge2d/ge2d.c
> rename to drivers/media/platform/amlogic/meson-ge2d/ge2d.c

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
