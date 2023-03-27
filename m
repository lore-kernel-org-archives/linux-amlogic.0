Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C79C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+YwWCTl4imYVMYgM34AsqF/ts0ep9ZcTycQQ8gpR8I=; b=0OMVlAtM/Ri3/eFvBHFUM+tGB/
	cCLYNGLERZc5QSS985punmG1t985iJBTXFT8Qb5kHmTmWwhS4VTTPW6uyyw97cX6iyU6kR79C4fnC
	YX6+r7QlvXB0M9NjmEX7TW8EIWDTGWqGljqF4xwrp8tg+l2DVjpep9JHU8kjk3LFXptX4VAiX4SLH
	dDqszX6KmXY+s1JEuGcsbjyS6bozepD3K4+JN/U/4QbvG/aNhNA+pu4pm/HUL9SCmE2fysWhzpTpT
	4aYDjirsLRrkYb29F5w00YGsKSJRacDS9Un56gLcUDWURTkfVmMEEPUob9le6supR12+j81D/6kxM
	wxcj49Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnj2-00BIxI-32;
	Mon, 27 Mar 2023 14:21:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgniz-00BIuz-1V
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 14:21:30 +0000
Received: by mail-wr1-x433.google.com with SMTP id r29so8955100wra.13
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679926885;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QhLnEwjwsoWc9aZTSn67ibLwJ87PQNQMnbYTZ4CEi4s=;
        b=X9dOLlwNgQNZtTPmCh+2m457iV6i02S/z07+EXNX/Lg6sgq5aUpjyDb8WamkQx0HiR
         TDjd7fy96R7/clPGzK480WbgODjJpp6RdiTv+GGCX9ZU7XfBLf54YKjdaBlcOfdqNFTV
         nTQjfJxzw6pePCAzevhui0HX+CktmhhxrCCQUxX9ARlGJm0IgDPF3sutpcwO8rjAcGBc
         3ueXQZJdwXE0pg73FqYoJcgo0o2e7VvD2eonKawacZVmnG7C86vvOtQkMSmiyM1u0lYh
         jbhbje+QEJN1EqIDeKVcfJd1aSW+5x1weY4AkVjHTpS/OuajtzIAmudK4ToZVe99ErYw
         LMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926885;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhLnEwjwsoWc9aZTSn67ibLwJ87PQNQMnbYTZ4CEi4s=;
        b=tf5EAQZYVYi0ijcAuxjFYA7Us18Fy+M8NnrpXawqKspGCnuBfAmEj0/B9l/fw+avPM
         nupcSbXw3ySARyiCR5U/DISj62/hlc2LkoNhADikPeuIQbrrlOKpg2J49wesnOIf4irt
         zN3zghZpetygxXQ3muFQbOKMdKbAZntWnPCZ8pydEwzNlOFTPlxo0hY7XudBj50eLU/5
         finN8ZSAhEnS5H53U+lXLtWLraGFIPiE5zoNWygDXV1jkOY3qrRbC7qTFx3zXv7qtaQH
         5RZ+A/fWrIzWdh+F+bS2q1higrp7xM+jETYAa0/f7tovGEqvP+UP1U9lFosCxDOkqiYk
         cgZQ==
X-Gm-Message-State: AAQBX9cZzoHMqdNeIB52KpgJGRM0M35tpGIqpUt6JR6Z5FvlJn6J78iM
	vopHRuH0Lp6MM8qopBpj5boUxg==
X-Google-Smtp-Source: AKy350Yalnhf1ofXS3cljMNjUMGdZjsPm+iNh5Kybdj784HGmldIAj5rjsRDQamQV1hVEbgZlj4pcQ==
X-Received: by 2002:adf:e401:0:b0:2d4:896:a204 with SMTP id g1-20020adfe401000000b002d40896a204mr9228430wrm.60.1679926885281;
        Mon, 27 Mar 2023 07:21:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2? ([2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2])
        by smtp.gmail.com with ESMTPSA id h6-20020adfe986000000b002d09cba6beasm25426882wrm.72.2023.03.27.07.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:21:24 -0700 (PDT)
Message-ID: <f4ab8920-6d9a-539d-e5fe-2173aa80081c@linaro.org>
Date: Mon, 27 Mar 2023 16:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] boards: amlogic: switch LibreTech-CC v2 and WeTek Core2
 to EE powerdomain
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230326060625.2734090-1-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326060625.2734090-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_072129_508116_E8E8E0D8 
X-CRM114-Status: GOOD (  11.82  )
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

On 26/03/2023 08:06, Christian Hewitt wrote:
> The LibreTech-CC (LePotato) v2 and WeTek Core2 boards are still using
> the older GX VPU powerdomain driver. Update their configs to use the
> newer EE driver like other Amlogic boards [0].
> 
> [0] https://lore.kernel.org/all/20201106101901.2472557-5-narmstrong@baylibre.com/T/#u
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   configs/libretech-cc_v2_defconfig | 2 +-
>   configs/wetek-core2_defconfig     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/libretech-cc_v2_defconfig b/configs/libretech-cc_v2_defconfig
> index 30b1651554..ea71f055d9 100644
> --- a/configs/libretech-cc_v2_defconfig
> +++ b/configs/libretech-cc_v2_defconfig
> @@ -51,7 +51,7 @@ CONFIG_MESON_GXL_USB_PHY=y
>   CONFIG_PINCTRL=y
>   CONFIG_PINCTRL_MESON_GXL=y
>   CONFIG_POWER_DOMAIN=y
> -CONFIG_MESON_GX_VPU_POWER_DOMAIN=y
> +CONFIG_MESON_EE_POWER_DOMAIN=y
>   CONFIG_DEBUG_UART_ANNOUNCE=y
>   CONFIG_DEBUG_UART_SKIP_INIT=y
>   CONFIG_MESON_SERIAL=y
> diff --git a/configs/wetek-core2_defconfig b/configs/wetek-core2_defconfig
> index f5149fc002..07d2587f77 100644
> --- a/configs/wetek-core2_defconfig
> +++ b/configs/wetek-core2_defconfig
> @@ -44,7 +44,7 @@ CONFIG_MESON_GXL_USB_PHY=y
>   CONFIG_PINCTRL=y
>   CONFIG_PINCTRL_MESON_GXL=y
>   CONFIG_POWER_DOMAIN=y
> -CONFIG_MESON_GX_VPU_POWER_DOMAIN=y
> +CONFIG_MESON_EE_POWER_DOMAIN=y
>   CONFIG_DM_REGULATOR=y
>   CONFIG_DM_REGULATOR_FIXED=y
>   CONFIG_DEBUG_UART_ANNOUNCE=y

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
