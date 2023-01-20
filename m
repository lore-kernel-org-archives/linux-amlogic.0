Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D90C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 09:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+50rA76qpltNpC3k/cflz3kqYJpl6DaJP2RWt+7Gj+0=; b=cYdiuysHmehUfJubhs9zvW5fVH
	NTOt4MOyBXYMyq2PsQcsgPSq09kcE0CTC5aVHnmDsfl9obrRxB1SuFmf43kVTkJmTT5GFm7i/YmEq
	WldTCilr4ZomOPD3P65TMATnylNYD4bFKXX8RopvGWEF97YSZrFfwHfrTw85bFIPmtzzmmg2s65n3
	igl36Kxgaz5/lnIc52RKyz7BCFB+Bjigazg14nTXdmAAF23Rf6D9alE0WgEFwgIqtCEvj5xTMMiHL
	96hRIQiZLPTv0qJl2IitweRUIacfnDDEWNc/H6SEFQkiRTc5QP91IIr3N29ZaEafDai+m1rOxqsDj
	fmeYU0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIo9L-009awQ-1d; Fri, 20 Jan 2023 09:57:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInkk-009OXY-Uq
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 09:32:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so5419319wmb.0
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 01:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kwcNWOJu++BSeRCaBZOYmzH+VNI6xbZXZZDxdGPdiVw=;
        b=ZddLHJ21L6LvL+VLyEVw2qy8taGHe0iy5tPJiiKRZ6ceveVeMciYO1lkRYca8zUfIo
         pQDIbKbCkEWsezy5rY/WocrhWzECr6gQ7tow9OPVuQqlbBmX9kq4YdCYZTt1TOvGf2fQ
         9dFelVP29QGMMjT+jAKE2VR0bimyBY8J1sFTLdqMAWH2GYzl6KGwMVglH6JfqCf/TLoC
         ANiolyMquW/5EUvTgFaKQnvQjnlrh9D4+gqX3aBoDgJCcgSSPa259laF5iaDZBk9TULD
         cfrKp7gPIA2r24+1q/p/1zubwJlaZ7AmXNbP/0l4B471FzNmngl/mlU6AMtOFRvd1aTK
         Ulkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwcNWOJu++BSeRCaBZOYmzH+VNI6xbZXZZDxdGPdiVw=;
        b=ZCajWtoXZ5hGI/8pI341GA0Cozt6wDCHa+eo52xeCyyrvJmXtkj9/NgxqYq7+N4UmX
         qDqxArTp2SMGirfD2lvIFeI6J2HkYBQF+Ai/ZnjhGKdzkvd374blMVXG7C0EI8BAUmpc
         6eVJsa6P7Aa3ZuRHiT8Of63spMAA84ctPvG8rWfaQQqfVsXWTeK1sdBoQ+TfMzBqjfaj
         SRTDmVPNbBvK/VvLJb3tbhcaWacvsdj30hcLEVkde7wZq7qO0woBL+eExTo/30FoFyUa
         bgvMzZ6meujuL3zHe6tbbG+jUc35FlEKFMfePhjHJEqhRTrpcpU0ZQWprj5WkIva574U
         ZVvA==
X-Gm-Message-State: AFqh2kr54QOnKz/thaX68WSg3ugJLUrYR/tkHWXaLAZWHJFOF0h30Ggl
	YWEzGB2CqxYHMbE/TuVuLoNpfQ==
X-Google-Smtp-Source: AMrXdXskA1O2lr97eO1VtkYEVuAeFE+zfo7K+thpsW39zCg4BoBdphV/Sl932BgLu6aezuBUgbBlXg==
X-Received: by 2002:a05:600c:684:b0:3cf:5d41:b748 with SMTP id a4-20020a05600c068400b003cf5d41b748mr21784793wmn.36.1674207121229;
        Fri, 20 Jan 2023 01:32:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:39d8:cbee:30fb:cdaa? ([2a01:e0a:982:cbb0:39d8:cbee:30fb:cdaa])
        by smtp.gmail.com with ESMTPSA id q7-20020a05600c46c700b003c6bbe910fdsm2259681wmo.9.2023.01.20.01.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 01:32:00 -0800 (PST)
Message-ID: <770fb64a-b844-79ae-8cd7-bb80cf49b408@linaro.org>
Date: Fri, 20 Jan 2023 10:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: drop unneeded quotes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Tony Huang <tonyhuang.sunplus@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Markus Pargmann <mpa@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_013207_040626_25461DC6 
X-CRM114-Status: GOOD (  12.38  )
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

On 20/01/2023 09:57, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |  2 +-
>   .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   |  2 +-

For Amlogic part:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../devicetree/bindings/mmc/arasan,sdhci.yaml |  6 ++--
>   .../devicetree/bindings/mmc/cdns,sdhci.yaml   | 22 ++++++------
>   .../bindings/mmc/fsl-imx-esdhc.yaml           |  4 +--
>   .../devicetree/bindings/mmc/fsl-imx-mmc.yaml  |  2 +-
>   .../mmc/microchip,dw-sparx5-sdhci.yaml        |  4 +--
>   .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  2 +-
>   .../devicetree/bindings/mmc/mxs-mmc.yaml      |  2 +-
>   .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 36 +++++++++----------
>   .../devicetree/bindings/mmc/owl-mmc.yaml      |  2 +-
>   .../bindings/mmc/renesas,mmcif.yaml           |  2 +-
>   .../devicetree/bindings/mmc/renesas,sdhi.yaml |  6 ++--
>   .../bindings/mmc/rockchip-dw-mshc.yaml        |  2 +-
>   .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |  2 +-
>   .../devicetree/bindings/mmc/sunplus,mmc.yaml  |  2 +-
>   .../bindings/mmc/synopsys-dw-mshc-common.yaml |  2 +-
>   17 files changed, 50 insertions(+), 50 deletions(-)
> 

<snip>

> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
> index 1c391bec43dc..1a6cda82f296 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Amlogic Meson SDHC controller
>   
>   allOf:
> -  - $ref: "mmc-controller.yaml"
> +  - $ref: mmc-controller.yaml
>   
>   maintainers:
>     - Martin Blumenstingl <martin.blumenstingl@googlemail.com>

<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
