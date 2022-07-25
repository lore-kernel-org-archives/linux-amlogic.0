Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7733DC43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jul 2022 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whQoCaWlG1hzej5mIz2C4AzPYSlThi5augp52xx4dy0=; b=rmmEtZ502TMIOc
	cLQyIC4CG2WBwQAG55izMrR3TEODcCXbrd8DhFenI66krRiBteRhb33v8N3IMpKLnC9HWXoqbmYbk
	3ugty23oOIT9xIIer2N7N6pKRFuYi0mc7CeGZwOtDZlTz35rpY3DyQs+ORYn1gzxfaZ4k1Ihc7Cvo
	Iitq1aU77vcjL0QX13D6Uj1hntFYxdHVP/yNqGd9qvhnk8tJQ41yTUcg8k04tHEzR4YoJAT0M4aIx
	35twlBcsL0FL3JR4fFqYLilSW+JH8jwDY+J841ESKTD6vXdjtD9je36BkaZBQTX6RcEd+FkYH6CZe
	Tz0cvTpNKrGDQ4rGKJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG10L-00FfiR-Hv; Mon, 25 Jul 2022 16:32:25 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG10I-00FfhJ-Gb
	for linux-amlogic@lists.infradead.org; Mon, 25 Jul 2022 16:32:23 +0000
Received: by mail-lf1-x130.google.com with SMTP id a23so16523259lfm.10
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Jul 2022 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=zwZY6X82dfmJAnPeF/543yFoWYLt1Gv+miG51a8O22U=;
        b=XqWWIfNGdNrCMrr708mX/AiOlm89+pSsgkiw68yz/sr2h5wwtX9TtNRYeSV8r/+ato
         NMJIYc8uMXHPgLz/hFSYuVzb0kaG0hi+JsrKbW8pqh2AbdvfLR1MTdtzJConCrgpYrJe
         tp0J8bPjIfahm5H6qpO4t521nr+5GdaOwQgcaTwd4HxvuH4uCj2e6wHcFLeaZbPF/6eZ
         bpSrmmJ08XitHRwyba/I1ywmqzL4Zon7yQi+aRbsKUJsvV/szXNQn5GxtmLTWRCyXnZ5
         l9GlUedTAP9jBF6tt2TspYrwLo7jWvMDqwZnRxr1DqXR8zOBUpFmDAb/sQxLk8ADdjnm
         WeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zwZY6X82dfmJAnPeF/543yFoWYLt1Gv+miG51a8O22U=;
        b=NvlxVQLk8aaN3Zxr0RqvMUYSKblIBJsAjavgbGioSDG/GGTVhKUiazpvTcLHmh5yXH
         IO97zlsHAyEEEk6TNvjPYBDz3wbdg/cAeOtmeCaB12nGkg5iC64yRM6twKkm3Z3IIGHm
         kHU8ndWDRoxmERnV6hCmuUfUEpRxL3CAf0ZVAIDeX/PGNGvxaMhtJFznKZU6B8oMUpCt
         YXOFz412WwWqRdDoOfpALHDc9eNRt6xtrrUkPb64eUYsfzQsy7BlpxTC3/NZhCOoiD22
         IpfoWuaHSBz3b2bR/3CDnldNcKda5+/Jol/Hn81gAeNnsQTzUBiHzHlI5kLyv80u58Hf
         mz+g==
X-Gm-Message-State: AJIora/+lPplsqoqswgBt/Fak1kzNQm9pGUJSXhywiqQUbynVRTo9GwD
	+h5SIGuKFSAd4DAdczTrSP/7lw==
X-Google-Smtp-Source: AGRyM1seBt8XbPbgtD0Ok/a7aF3Z7uOFexdivos6yxqErhHZreedg5ZO3Y1QCkz14lxzT/wh//90pg==
X-Received: by 2002:ac2:4e12:0:b0:489:ddbe:83c5 with SMTP id e18-20020ac24e12000000b00489ddbe83c5mr5398208lfr.371.1658766738799;
        Mon, 25 Jul 2022 09:32:18 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id b6-20020a196446000000b00488d0e38283sm2721731lfj.153.2022.07.25.09.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:32:18 -0700 (PDT)
Message-ID: <677c9314-593e-3512-539a-fd74f634c470@linaro.org>
Date: Mon, 25 Jul 2022 18:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [v5 4/4] arm64: dts: meson: Add MagicBox M16S support
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>, martin.blumenstingl@googlemail.com,
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sean@mess.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_9D885D188E51B537DB904A774CEC35E4180A@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_9D885D188E51B537DB904A774CEC35E4180A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_093222_589420_729BB345 
X-CRM114-Status: GOOD (  17.13  )
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

On 25/07/2022 01:17, Zhang Ning wrote:
> MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
> with spec:
> 
>  - Amlogic S912-H (S912 with dolby and dts)
>  - 2G ddr3
>  - 16G emmc
>  - Marvell sd8897 BT/wifi module
>  - 100M ethernet
>  - IR reciever
>  - 4K HDMI
>  - AV out
>  - Rest hole
>  - 5V2A power input
>  - white LED
> 
> it's q201_v1 according u-boot log.
> and it's almost same as Q201 reference design.
> 
> add a simple dts to support this Tv box.
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 8773211df50e..e0907fb41829 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-magicbox-m16s.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> new file mode 100644
> index 000000000000..69e72687ac9c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> @@ -0,0 +1,40 @@
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
> +
> +/ {
> +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
> +	model = "MagicBox M16S";
> +
> +	gpio-keys-polled {

Just gpio-keys (or even "keys").

> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Address/size cells are not correct.

> +		poll-interval = <100>;
> +
> +		button-power {
> +			label = "power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};

Missing blank line.

> +&ethmac {


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
