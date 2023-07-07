Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DADEEB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 14:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xADA1EKzHewV+q4bVk9X0jUFPr2HPRMK72cXML3N6qM=; b=Oc2Iwx77/yc7m3s5BzcYFi+cTN
	LTN3vCxnD/FmfdEz27Qe/9yVnU60+ApJZZtpUNB6wlhAdbCiHQCBVMQmblqdTXdihhCenwQ6rwitj
	dyepNpRCsklm2zhw8s/rqFAxLEC7zrmfjrQ8pQEdZLqnTgJIT7C+XGAEjHW0d6zUM5EHY3HpB9Iqh
	/FiOFbcucJneWADbBK/FkJPWejmkkBvUrLlCO2Yw3bSGqzY9oVUrMwib6SY7By3UAUaPASvqqUNSX
	Gn8W4JwDDsVRKfzxmPPuFf+lBGo/RFXZLQ1rwhlzQQ4Hr4jI/nQEJb3dbYMthkDOlr/2X50uY3JpX
	s/1bBvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmfO-004thT-0M;
	Fri, 07 Jul 2023 14:42:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmfL-004tgc-07
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 14:42:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so24987865e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688740953; x=1691332953;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z4lWoBqUTsmtDgqpIXQd4kMN9P4iNoBN46guAJ4J0UY=;
        b=PY8Trs51ttpj0rQ77raRmZRLf1dKh8mRaBthfH/Z69kQfenZfIgqssui+V1ic649Mu
         y83Av13S3K2KL2ROegnSN6y/mrKgyyrxz8l9iu5L4EsrDokiMpcsTbwtVwV15nZu9OCY
         3Sa0LitqLGs5/ED0l7IjmKZuu89vfFGj+OT8FwOoSoZUUuBMy7tuuZ6w1EsUyFjAnews
         GLcS5IWrlr5KyMocqgNAwAR8R8os91F1mbaF2dldsrhAxHlRgLZJWYNKAg81F5U6IjMQ
         ArhQACobVp3SBs5CsONrv4Rqmb/GDRbU3vi4J8HXCUj79yyZlp3AflM1oqLHpljJ8x1q
         AZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688740953; x=1691332953;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4lWoBqUTsmtDgqpIXQd4kMN9P4iNoBN46guAJ4J0UY=;
        b=lj7Q6sJukiLN1otiQYcblSB0jmK+0yPWDGWAh/GHpIz2MNnV9Oj/KT3X3DlF4NrBRg
         fSRJ6gO+S+pvE3xE+ocH1TUpUtIRooifzmaXg7RKWDygTw2cj/UINauJzc2V1MUmIeXl
         abGg6srV1PclAKfYemPmM6vHsqRVEQOeiftLAequceM/hDp2BVbhT2UIOpN4zT9/pNRc
         mC/OFaPeUB2cqjuFjD8EDrzzm758yZ4RDCYY79EIwafBWE5qu8/kSkgmOwNp+Hgaa8Mv
         iywnL8jIhntOcbO0GaLeM4dqXfMMWbmH+V5/y0iKAZQABe+fLcngtBeybc0vbAcfPhnr
         5N0A==
X-Gm-Message-State: ABy/qLbL9htxXjZQJdVQyD5Yox5HsI9FNP8mmH27k76FhsFBCx8SXKNF
	0gND7ie28GJZZnsFqy17qyzFWg==
X-Google-Smtp-Source: APBJJlHBP9G/LqJXiH8qNwypAEFyU81HIVpOXYc4p9njD0acJ2CEliu5SxfbBxyOn5IJb2gB5tdV5w==
X-Received: by 2002:adf:ee0c:0:b0:314:3997:530d with SMTP id y12-20020adfee0c000000b003143997530dmr6132017wrn.31.1688740953164;
        Fri, 07 Jul 2023 07:42:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ac80:753:1ffc:791b? ([2a01:e0a:982:cbb0:ac80:753:1ffc:791b])
        by smtp.gmail.com with ESMTPSA id h16-20020adff4d0000000b0031134bcdacdsm4631399wrp.42.2023.07.07.07.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 07:42:32 -0700 (PDT)
Message-ID: <0c8938a9-7a26-bf97-51ee-0c271901ec21@linaro.org>
Date: Fri, 7 Jul 2023 16:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the
 genpd dir
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-4-ulf.hansson@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230707140434.723349-4-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_074235_095235_8122DF85 
X-CRM114-Status: GOOD (  14.75  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 07/07/2023 16:04, Ulf Hansson wrote:
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: <linux-amlogic@lists.infradead.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>   MAINTAINERS                                        | 1 +
>   drivers/genpd/Makefile                             | 1 +
>   drivers/genpd/amlogic/Makefile                     | 4 ++++
>   drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c     | 0
>   drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c | 0
>   drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c | 0
>   drivers/soc/Makefile                               | 1 -
>   drivers/soc/amlogic/Makefile                       | 3 ---
>   8 files changed, 6 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/genpd/amlogic/Makefile
>   rename drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c (100%)
>   rename drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c (100%)
>   rename drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 588769fab516..9b8c9ae2375d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1843,6 +1843,7 @@ F:	Documentation/devicetree/bindings/phy/amlogic*
>   F:	arch/arm/boot/dts/amlogic/
>   F:	arch/arm/mach-meson/
>   F:	arch/arm64/boot/dts/amlogic/
> +F:	drivers/genpd/amlogic/
>   F:	drivers/mmc/host/meson*
>   F:	drivers/phy/amlogic/
>   F:	drivers/pinctrl/meson/
> diff --git a/drivers/genpd/Makefile b/drivers/genpd/Makefile
> index a2d5b2095915..cdba3b9f0c75 100644
> --- a/drivers/genpd/Makefile
> +++ b/drivers/genpd/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y					+= actions/
> +obj-y					+= amlogic/
> diff --git a/drivers/genpd/amlogic/Makefile b/drivers/genpd/amlogic/Makefile
> new file mode 100644
> index 000000000000..3d58abd574f9
> --- /dev/null
> +++ b/drivers/genpd/amlogic/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
> +obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
> +obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/genpd/amlogic/meson-ee-pwrc.c
> similarity index 100%
> rename from drivers/soc/amlogic/meson-ee-pwrc.c
> rename to drivers/genpd/amlogic/meson-ee-pwrc.c
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
> similarity index 100%
> rename from drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> rename to drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
> similarity index 100%
> rename from drivers/soc/amlogic/meson-secure-pwrc.c
> rename to drivers/genpd/amlogic/meson-secure-pwrc.c
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 3b0f9fb3b5c8..dc93e1762ca7 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -23,7 +23,6 @@ obj-y				+= mediatek/
>   obj-y				+= microchip/
>   obj-y				+= nuvoton/
>   obj-y				+= pxa/
> -obj-y				+= amlogic/
>   obj-y				+= qcom/
>   obj-y				+= renesas/
>   obj-y				+= rockchip/
> diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
> index 7b8c5d323f5c..c25f835e6a26 100644
> --- a/drivers/soc/amlogic/Makefile
> +++ b/drivers/soc/amlogic/Makefile
> @@ -2,7 +2,4 @@
>   obj-$(CONFIG_MESON_CANVAS) += meson-canvas.o
>   obj-$(CONFIG_MESON_CLK_MEASURE) += meson-clk-measure.o
>   obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
> -obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
>   obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
> -obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
> -obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o

I've a few changes for v6.6, how shall we handle that ?

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks !
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
