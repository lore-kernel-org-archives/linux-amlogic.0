Return-Path: <SRS0=PNGY=AL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1936CC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jun 2020 20:31:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8DC220772
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jun 2020 20:31:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TU3vXWxQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etZ7q+p4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8DC220772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DN2hdibc/Wkix9wtRXB6qofYapBSCyOHQeB3k1SqfC4=; b=TU3vXWxQftwe8CruKZHXRtb0A
	Lm/nBLy3PmjCxN2wTQUIbew3CTwOueac2Lm41gAIhQ2+u1sufgeyoDInGy+TzwnLD0HZ5ccL9IsLw
	MihibWJUDCIPMiPDW3BQ/PpZYZrZ7aYZfwEzPVPMHlKk4kJ2E2lf783OsBYrDLzkMu582oAwomP2s
	Wm22a6t69foxN8m+77rMoe54C39I3SuDN4pRQG2sU3EESD7DlX8UVyh4SGTKhNnwD0pkGHttr7DQN
	ICthggNJvHHogiDHUhHcczalleQBMWFeH2cYlz5H7WyZLV4w7FcZJsu5yTne/RKDsBzpyq8pBqHjy
	Wwr046GiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqMuD-0001rw-6w; Tue, 30 Jun 2020 20:31:01 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqMu7-0001qB-3Q; Tue, 30 Jun 2020 20:30:56 +0000
Received: by mail-ej1-x642.google.com with SMTP id lx13so3283773ejb.4;
 Tue, 30 Jun 2020 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=K3IWd4UOczfyNkWWyUS87fNAOE77K5rHLOtlJQ7STrg=;
 b=etZ7q+p4B2JFHM3KgC5RB2LKoUpfAVWQDOfoXe5kfFnF3sWFTpdsPYELXT8nRbRB8V
 5c31y2BRn1+HmCNdo1tmp3MfuAEy4DbPFs4TATQyhUTLx/qbfnjtDxgdEbovPSeSkVd3
 HCON9M+7BVdC606lmFGthsXOEIyJ1OCEqJh/TYsKGzxmQbVQJbQdMDwWp+75c4oitJu9
 e0AAGXCgi2g9MI7I5S5SYIcwD28Um6LlUd2sUgAbg3N87yQ/ufYEtsbVwedargaRYob/
 35RyETkHIdLM/27llnpBYTq0XeGhtpSfFmP/V0K8VzsYJIZa1aNjZT5FQm97TaOkQT8H
 B34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=K3IWd4UOczfyNkWWyUS87fNAOE77K5rHLOtlJQ7STrg=;
 b=f00ynqrzvcYJPKIA/MKN6vkomiedA5pOe/wQyKOgDG1JpL2d5WDY6T95enjO/H6mPK
 9twzdLxsKza5W8l6WRcRY76V/0G5YVWeGYZiXKBbZyU1PGVwSvT4jKMxDPNNgAHGn0as
 7LVW0GMfXWQfhSokrbGgvYC97biKEsH1Nubhilk3LcxtQ36Nv9RaAbIZQAzuRjz/VV3/
 v3YOSZxcFOYCllURixKb4BwCvFAfLU1CAsUOWu/FMbj8swd4I33jocMFKBzjjvnBg/iW
 0TZwyGMDc9H34Iw/fY6N0olxFva4GFAlvj5mL4ABKtn4S9t5rcxlEImmcj1QGnuPh742
 fbWw==
X-Gm-Message-State: AOAM532I9IIPfrskApVitE6Jq9eI5ZOku9DbIQVgwRHxPWO6C91ZHPjO
 UBXVKZPQrM72AffQH2C32Xw=
X-Google-Smtp-Source: ABdhPJxSukwxBOIw9LOnc/r5bA5e2YJNHfx7DSS/vLi6YTJhehVxo3tDqN9KmjRn0mC68Sho61Xt2Q==
X-Received: by 2002:a17:906:f298:: with SMTP id
 gu24mr19537400ejb.302.1593549051139; 
 Tue, 30 Jun 2020 13:30:51 -0700 (PDT)
Received: from felia ([2001:16b8:2d31:bc00:cc6f:aee9:d326:7bf7])
 by smtp.gmail.com with ESMTPSA id w15sm2902179ejk.103.2020.06.30.13.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:30:50 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 30 Jun 2020 22:30:39 +0200 (CEST)
X-X-Sender: lukas@felia
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH SECOND RESEND] MAINTAINERS: adjust entries to moving CEC
 platform drivers
In-Reply-To: <20200525142946.8268-1-lukas.bulwahn@gmail.com>
Message-ID: <alpine.DEB.2.21.2006302228320.4753@felia>
References: <20200525142946.8268-1-lukas.bulwahn@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_163055_192677_6977213C 
X-CRM114-Status: GOOD (  19.05  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On Mon, 25 May 2020, Lukas Bulwahn wrote:

> Commit 4be5e8648b0c ("media: move CEC platform drivers to a separate
> directory") moved various files into a new directory structure, but did
> not adjust the entries in MAINTAINERS.
> 
> Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches F: drivers/media/platform/s5p-cec/
>   warning: no file matches F: drivers/media/platform/tegra-cec/
>   warning: no file matches F: drivers/media/platform/cec-gpio/
>   warning: no file matches F: drivers/media/platform/meson/ao-cec-g12a.c
>   warning: no file matches F: drivers/media/platform/meson/ao-cec.c
>   warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.c
>   warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.h
>   warning: no file matches F: drivers/media/platform/sti/cec/
> 
> Update the MAINTAINERS entries to the new file locations.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Mauro, please pick this non-urgent minor clean-up patch on top of the
> CEC platform driver moves.
>  

Just a short ping for you, Mauro. Can you pick up this minor clean-up 
patch?

Lukas

> applies cleanly on next-20200417, next-20200505 and still on next-20200525
> for this second resend.
> 
> v1 send here:
> https://lore.kernel.org/lkml/20200418093630.6149-1-lukas.bulwahn@gmail.com/
> 
> v1 first resend here:
> https://lore.kernel.org/lkml/20200506050744.4779-1-lukas.bulwahn@gmail.com/
> 
>  MAINTAINERS | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a442b48f24b..bf5cb149101b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2403,7 +2403,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/s5p-cec.txt
> -F:	drivers/media/platform/s5p-cec/
> +F:	drivers/media/cec/platform/s5p/
>  
>  ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
>  M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> @@ -2548,7 +2548,7 @@ L:	linux-tegra@vger.kernel.org
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/tegra-cec.txt
> -F:	drivers/media/platform/tegra-cec/
> +F:	drivers/media/cec/platform/tegra/
>  
>  ARM/TETON BGA MACHINE SUPPORT
>  M:	"Mark F. Brown" <mark.brown314@gmail.com>
> @@ -3969,7 +3969,7 @@ S:	Supported
>  W:	http://linuxtv.org
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/cec-gpio.txt
> -F:	drivers/media/platform/cec-gpio/
> +F:	drivers/media/cec/platform/cec-gpio/
>  
>  CELL BROADBAND ENGINE ARCHITECTURE
>  M:	Arnd Bergmann <arnd@arndb.de>
> @@ -11146,8 +11146,7 @@ S:	Supported
>  W:	http://linux-meson.com/
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
> -F:	drivers/media/platform/meson/ao-cec-g12a.c
> -F:	drivers/media/platform/meson/ao-cec.c
> +F:	drivers/media/cec/platform/meson/
>  
>  MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
>  M:	Liang Yang <liang.yang@amlogic.com>
> @@ -15212,8 +15211,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
>  SECO BOARDS CEC DRIVER
>  M:	Ettore Chimenti <ek5.chimenti@gmail.com>
>  S:	Maintained
> -F:	drivers/media/platform/seco-cec/seco-cec.c
> -F:	drivers/media/platform/seco-cec/seco-cec.h
> +F:	drivers/media/cec/platform/seco/
>  
>  SECURE COMPUTING
>  M:	Kees Cook <keescook@chromium.org>
> @@ -16249,7 +16247,7 @@ STI CEC DRIVER
>  M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/stih-cec.txt
> -F:	drivers/media/platform/sti/cec/
> +F:	drivers/media/cec/platform/sti/
>  
>  STK1160 USB VIDEO CAPTURE DRIVER
>  M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> -- 
> 2.17.1
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
