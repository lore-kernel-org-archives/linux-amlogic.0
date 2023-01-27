Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81655C54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTvRa56+vEsiNWugCQI+afZROLhBcOeWupf295GrzEA=; b=ko89lEbN77pLuK
	PolXPU3VJwJjXaXU1xGy4GqlwngCCEyUoWHEw5E8zJb5MnqgLunl4DKux5r3EXOSlzb7KyNt5RAq3
	5QPPnAiN6+vilPEb7mHhUSP2DEQ6rlkvLXlxtsWLlj705BqW7/AVkqq+DatqeieQyytqWh2XB0Xa9
	i/jil2h/YEEQjKR4c9ObpNGMklAYvP+91MWjQE9wAB7Jx64iDywrK2RHznL2+yNapb9DDOfDNhO6w
	sDE1jkKJ85HK4Rk38uhNPPdWqC/fOrRQXf4Mok8r2RWPRIt8pFXRKufjC2+/fjBhzBIi9tLQ3obdQ
	uWnIVFAdcJeHSdLmOQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLdV-00DrHL-3C; Fri, 27 Jan 2023 10:07:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLdL-00Dr9w-3k
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 10:07:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso222885wms.4
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 02:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZGBWYBP+jLn9qax6QemUknci7LrD7dJVK21sk9z6Zg=;
        b=LAL0s+LA7HHaPIDhE3KYySG/4T3Z24RXZLU2sYBns9Tl6UFrj4rHlJ6IZPV+EmoqhF
         SiX3gtvDDRKTlhmTjiUHRuZZ2jlOsNimugdf5gsSK6wU44ZnlVvrvfzyKpN9ywNqe2sM
         ChzVu0JZf0OMG6yhXOwkaK//DCW0WVKsp9ziPbWzYBpF4L8CJlNpnNX36G6Na8plUiqj
         HOI/IqknRDBWHa4jjRQxThR9wzHyKww32bwK+Av7RQwtqxqVqlD9knOc+ZlxPrLNJ2RH
         iA4jx8SQ/d3ZEBXDrZWZPDZH668klHHrykwf45xgjtd2a+E2hS9v5MK8+mMv5BDMDJxJ
         iOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZGBWYBP+jLn9qax6QemUknci7LrD7dJVK21sk9z6Zg=;
        b=AKUzN0tVZ5l62IHvH6n06MSa2doNyJLiwnh1Ek65cZqN0XXLDErxWxQGzPt9Q8VE9g
         0IozbSjjyRKfuJAt1nJRI9Vd1RyIEJgr55jMdTjPg3sBVnDYERA+QCeRv/EPMEXKW3YU
         50/lR7htmGQ6c/NDbY6WMfCuf5qjAXLaKO6cpoxRH4FXSJAgLDobLyuh6ZPfEiIF/gYW
         alFTL2z81EEMvDFc+C2RsTE0UZWUTr9nf78RXFpqcFc0a0+D9P3AXFcdRvd714NS70wh
         DlJmgGVQczimhgL34fyJDB277UHkOiAqcHgARoLFSLc2+Rl/7kHNRkfgW7mf4XEHyh4A
         m10w==
X-Gm-Message-State: AFqh2krOiQT0FPgi4qixmoHHesIfr1TA+TNgnwHWQfPQEZXxIQY4A6GQ
	VgwL27+E38DnpKxmkvzbuDNcTw==
X-Google-Smtp-Source: AMrXdXsE5NJCOFMShnnXwCTKJoJkEV4/fgpryTXXiLacJHvzUxSC7KVGt8Dsm33+mH4kLSD3wlKQbg==
X-Received: by 2002:a05:600c:2284:b0:3d3:5c21:dd9d with SMTP id 4-20020a05600c228400b003d35c21dd9dmr39012065wmf.19.1674814010311;
        Fri, 27 Jan 2023 02:06:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h23-20020a05600c499700b003dab40f9eafsm3739043wmp.35.2023.01.27.02.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 02:06:49 -0800 (PST)
Message-ID: <a35f7f09-eb19-6cfc-2053-c6b340f10cbd@linaro.org>
Date: Fri, 27 Jan 2023 11:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] arm64: dts: meson: add support for BananaPi M2-Pro
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230127100236.3385154-1-christianshewitt@gmail.com>
 <20230127100236.3385154-5-christianshewitt@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127100236.3385154-5-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_020659_265633_27BAD77C 
X-CRM114-Status: GOOD (  16.37  )
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

On 27/01/2023 11:02, Christian Hewitt wrote:
> BPI-M2-PRO is based upon the BPI-M5 design except for a different
> physical board layout and the following changes:
> 
> - USB 3.0 ports reduced from 4x to 2x
> - 3.5mm Combined CVBS/Audio Jack removed
> - RTL8821BU WiFi/BT module (internal USB connected)
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-sm1-bananapi-m2-pro.dts | 98 +++++++++++++++++++
>  2 files changed, 99 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 97b42e2100e0..644451794aca 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -60,6 +60,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> new file mode 100644
> index 000000000000..4890d5d9a4f7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 BayLibre SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-sm1-bananapi.dtsi"
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +
> +/ {
> +	compatible = "bananapi,bpi-m2-pro", "amlogic,sm1";
> +	model = "Banana Pi BPI-M2-PRO";
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "BPI-M2-PRO";
> +		audio-aux-devs = <&tdmout_b>;
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL2>,
> +				  <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";

It's by default. Did any DTSI disable the sound node?



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
