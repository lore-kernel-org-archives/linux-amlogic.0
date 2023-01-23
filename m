Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E582C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 22:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDokarPQ/LPinmrSYsZYouW3AkaUKaa8jKuTtFdKbSo=; b=XFQut5nKkMSuOx
	O8dBQfL+v3AipXUGtfTRibQpRldly5z7bZCulcdq5wg3Vvdhy6zrPrJsfpHJUBF3dIGQCqySfpGeE
	f5Kk/CTlMzN9TWtL0w9ZySBj2k0x67P9emJSYqXtwCjvs8VLvCjOX7hYt+8jVydOm4OjPP3IVXP28
	ZLEOtfiok5+k3znB5i7Fag1w52m7dizVRMftx2wpPb6xomVxP07TdffUuqItNdUO1EI47ssP7mSP1
	DdDUeH0ZPeZuKw9Acvo3bfYFW93WMoPp/2KqQyMMnCOWds1ZFfPc1kA8ud1Zl/ANvQHAT8uHVT3Pl
	gcYX5Sl3GU6dvb3gIMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4vZ-001eoQ-Eg; Mon, 23 Jan 2023 22:04:33 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4vN-001elZ-Qs; Mon, 23 Jan 2023 22:04:23 +0000
Received: by mail-oi1-f182.google.com with SMTP id s124so11705613oif.1;
        Mon, 23 Jan 2023 14:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpuxLyhBst2nOzeGBnZjMCF3/gd2HElPUlYwXSvlCHQ=;
        b=eJziBhMseaBgMrvl2HZFXyPY0uiCwX6hYLM9mI58wyRa7yoncR5abLASR8mAq1+eJW
         A1iJaGEeF2R8Cjy7x+82VXMXM5tbcb3BPn85I4oBbCUwNNR3TlzdNGrHIo3IyIfW9DDx
         lgEkQTltYpHF6qDJRPozxn3cOVPo28gfxXvnou452NRwrr1TtEY+C0+XowOk3ubxWMsv
         Zs6m5c11x4KRqD5dch1lHh9XrU6Td0ljMmNgcU1Y1sEWN26zehE7e+dU7eYEtZNiR7To
         NTNrSgyqQTZ14p0Fiidp8I/Rbgq+DNwV4pEsBAfq/p1XGauGDyauA61EEEP9OXdD/0OM
         KRag==
X-Gm-Message-State: AFqh2kpml+w8F/+b4a9yl4TcjdekT4v6gsjBh9zymuF5Bj0sop57Qaev
	BvXqCwiueXo/fdsWe7X6Hg==
X-Google-Smtp-Source: AMrXdXvgQ12re4a3YxVwTSF0Qz/NX5WxqeUHb2/GhWU5TZhVunu5BYf8mwhHnwtYWmXTwGSj1UfgUA==
X-Received: by 2002:aca:b882:0:b0:35e:d30c:e918 with SMTP id i124-20020acab882000000b0035ed30ce918mr10351484oif.39.1674511459544;
        Mon, 23 Jan 2023 14:04:19 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j88-20020a9d17e1000000b00684ccbfe012sm184800otj.27.2023.01.23.14.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 14:04:19 -0800 (PST)
Received: (nullmailer pid 2719397 invoked by uid 1000);
	Mon, 23 Jan 2023 22:04:17 -0000
Date: Mon, 23 Jan 2023 16:04:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Steen Hegelund <Steen.Hegelund@microchip.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Daniel Machon <daniel.machon@microchip.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	", Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Markus Pargmann <mpa@pengutronix.de>, UNGLinuxDriver@microchip.com, 
	linux-tegra@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	"linux-rockchip@lists.infradead.org , Tony Huang" <tonyhuang.sunplus@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-actions@lists.infradead.org, 
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	Li-hao Kuo <lhjeff911@gmail.com>, linux-amlogic@lists.infradead.org, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: drop unneeded quotes
Message-ID: <167451145691.2719339.9543782878107648705.robh@kernel.org>
References: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_140421_886235_D90E3DA8 
X-CRM114-Status: GOOD (  10.42  )
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


On Fri, 20 Jan 2023 09:57:21 +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |  2 +-
>  .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   |  2 +-
>  .../devicetree/bindings/mmc/arasan,sdhci.yaml |  6 ++--
>  .../devicetree/bindings/mmc/cdns,sdhci.yaml   | 22 ++++++------
>  .../bindings/mmc/fsl-imx-esdhc.yaml           |  4 +--
>  .../devicetree/bindings/mmc/fsl-imx-mmc.yaml  |  2 +-
>  .../mmc/microchip,dw-sparx5-sdhci.yaml        |  4 +--
>  .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  2 +-
>  .../devicetree/bindings/mmc/mxs-mmc.yaml      |  2 +-
>  .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 36 +++++++++----------
>  .../devicetree/bindings/mmc/owl-mmc.yaml      |  2 +-
>  .../bindings/mmc/renesas,mmcif.yaml           |  2 +-
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml |  6 ++--
>  .../bindings/mmc/rockchip-dw-mshc.yaml        |  2 +-
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |  2 +-
>  .../devicetree/bindings/mmc/sunplus,mmc.yaml  |  2 +-
>  .../bindings/mmc/synopsys-dw-mshc-common.yaml |  2 +-
>  17 files changed, 50 insertions(+), 50 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
