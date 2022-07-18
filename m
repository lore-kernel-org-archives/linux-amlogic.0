Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C129C43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Jul 2022 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+xACl++DEf+BuuuO7LGInq3za8lArljqSzP952BEGo=; b=kYKhLF9V7esAQtBvQ6uoeE4wPt
	vp6dQXQ2VW1QY+SAajuDu1FcTQImqVfnv2XToG9dJy4YYitYmUo4Wp87g9Mt7zqYD4IfO5WPr6EpE
	u3Iw1xO70uu03+zHb4Vz8Do0uAtKShK9RIGFKM9AkgiZwBUUN/lclMYr6QXBawekjo4KxZPSSGZ1P
	gwDelCQp6X+wUOHd2YBrOrGCwd49801ynLwnPrjoG+t4vLS2UgRX+DFMwzG8Lc1+tzJkb2gRf1xBm
	dHMamz4WfjTTwJKCbxMNfLKilK5Hpm/1ugLk7IJ3CmWRNDHuh8wIbJlX/gH7jZrDJ54GAyxGNcDC+
	Ad5TzxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLiB-00BbZj-AU; Mon, 18 Jul 2022 08:02:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLi8-00BbXy-HN
	for linux-amlogic@lists.infradead.org; Mon, 18 Jul 2022 08:02:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id r203-20020a1c44d4000000b003a2fa488efdso682800wma.4
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Jul 2022 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=Bb5/lM+GRxAa42IupCRmP1fczOrPwTmyAqspZ+OTEr0=;
        b=lIK4VnICjYO/FSib0CuiP0Ty9FS5V5HeSDTRVvHSE3kEBDtBt5kncpqJdVdp88rCVE
         r5SPVF6BkPrnsK7gINwsbCRAobI10eFBcnvN/gNv8bnpeFRQ3Vwyb8kJthUwOV1EbfdC
         hAcZ3rSloUFp05Eb0qLFzV3sfqMqpqrTgyn9w6yUsLoSsiEGEahnTzTgiF6X6/dT/xdl
         oDqt3Ho+MhXxW8jBNDRiiHQC/abKQm67PqGiYX862DRrZNLhW3kllGOQ0HRfzE7xFKNq
         o9HF+2uRA8OIIcNuN+5cuVwhEQ77MrPXJzGDFGoORH2s9ICWlnoBNq6dbZ+xUTzQXYwp
         5IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Bb5/lM+GRxAa42IupCRmP1fczOrPwTmyAqspZ+OTEr0=;
        b=I8IamAGpHVI/SqKOqzoe6Eif/mjlmzHM2zcOR1pX+g0LCigQ25qMhTGd/pZ783ikem
         SQ+9yGXiQyMT7BqsjWgRcAIjQyTzqjJS71IekWPOpxuiBZlNNeH4StXf9/UBv38k1HhN
         wjbwNMSUrsPkRqUUmKbqDC81suOdul0AC5E6NlXLqFvF1pYV2gXTA2axBHfyP8xfdo/x
         8eBLgGdw0gPSIviLd9EeyRxiRpTTI4Z++Kf7ZDrDyy0wp6dW9bJw7EPQXF3rF4WeYrWT
         IJXbWw7ioLXDjzIp0UuaywOcqmPF62DtHnXCaDS1eFMiIx8esRP+mBRiBYMAW8pXbpo1
         RjDQ==
X-Gm-Message-State: AJIora++Xky7ZqJ1i37A0vBdX1Pcfjv7BO5ykU0z+KrQNkBsi+QIL5fl
	Iio2MPs0iCud7MVVry2iECrIKpoNXC5br10Y
X-Google-Smtp-Source: AGRyM1uJQtTmoxMAsdym6wWB8qaOW4x9WJFAjInH6TcNkN08gGgfGVZN73TTqZ53xQV1tJy7SHs8rA==
X-Received: by 2002:a05:600c:4ece:b0:3a3:1c7d:daaf with SMTP id g14-20020a05600c4ece00b003a31c7ddaafmr2355238wmq.181.1658131353926;
        Mon, 18 Jul 2022 01:02:33 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a2b7:375c:fabd:3626? ([2001:861:44c0:66c0:a2b7:375c:fabd:3626])
        by smtp.gmail.com with ESMTPSA id d14-20020adffd8e000000b0021d6a23fdf3sm10130704wrr.15.2022.07.18.01.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 01:02:33 -0700 (PDT)
Message-ID: <050c3f94-5c65-d745-ffe7-6035e55a372f@baylibre.com>
Date: Mon, 18 Jul 2022 10:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] Add MagicBox M16S support
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <tencent_5FC75850BB8ECD9374E98461C38C41CAC506@qq.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <tencent_5FC75850BB8ECD9374E98461C38C41CAC506@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_010236_614238_4619A207 
X-CRM114-Status: GOOD (  16.13  )
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

Hi,

On 12/07/2022 16:24, Zhang Ning wrote:
> MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
> 
> it's gxm_q201_v1 according u-boot log.
> and it's almost same as Q201 reference design.
> 
> add a simple dts to support this Tv box.
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>   .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 20 +++++++++++++++++++
>   2 files changed, 21 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 8773211df50e..e0907fb41829 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-magicbox-m16s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> new file mode 100644
> index 000000000000..be543d65a529
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Zhang Ning <zhangn1985@qq.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxm.dtsi"
> +#include "meson-gx-p23x-q20x.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
> +	model = "MagicBox M16S";
> +};

The compatible should be documented in the DT bindings in:
Documentation/devicetree/bindings/arm/amlogic.yaml

> +&ethmac {
> +        phy-mode = "rmii";
> +        phy-handle = <&internal_phy>;
> +};

Is the sd_emmc_a change incompatible with the M16S ?

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
