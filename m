Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4E2C38142
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CApNoNcfcvgjYMmQ2UevGH0zNcLkze7K4BHHxR/y79s=; b=cOcmT/ePrxb2pSCHK/qAIvzZiB
	tWEcVAa4XdweUesSKJSMUfjKH7W8ypnfx9W/feh7TENQ3gLMVEvpnGrWu8njXXpgepJvPpIuQ/8z4
	ziPqSWb1bf2gOoiAwJQq+qckAUjtmJ/+lJwruFI9MGSneV+PcuDkayd3hiiRk+Ol1JxWvdBscp6oa
	RK/DvDqsXk/JVIr+RJbSlg0fFndzd7l2a1Agr/iHWWuqED00KICpn8YSN2PJGzOP7MxxZhLsDDDcj
	K6B33628n2mj37BbFmumIUCQTBsZo3+bimQP78rptL4+iAUUSrwDSGIF/1T4aiBMioBdIAfzVqMVa
	X+IKB/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPEj-003pom-TW; Thu, 19 Jan 2023 07:21:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPEc-003pko-QH
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 07:21:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id z5so908979wrt.6
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 23:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sOs8bQD9F6vMUPoMMlH0+D1lAaueC4ZgIBokJQnOoEo=;
        b=LyOB+NUS2loSPGvywS6q2JTxx+QV/V7RAlJ1e2rlqx9t3Ekf+fP0SKHqB4UBF1Alcb
         +9jHjYipwJSvsZgt9CoSAzkUJuTTXWQ09jEntTema1BIcZethpG+tMxX7X9aAkolenah
         DLrdIJmcSmEIF6vdYgXBV2FeYGIx5vZ2gurB9SeTci839nqNyRWN2sEiDR5MEyF2ltFL
         zh8gOEY/JyjmU3jNfppcc+SoutySEK/QzJqLnd3pFDIzlZ9CAoRCIBGEq9ug3Ps7StLA
         k+ZiQy+qM+CwiihdmGqh5xgqnYtd9E4Ad3CfUn+P57GgQI/X4lL1DHGu6oYtOZ6TFy5e
         bCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOs8bQD9F6vMUPoMMlH0+D1lAaueC4ZgIBokJQnOoEo=;
        b=Sd/aaAbzf9PSbym+zthCKsw9n9eJ/uZWjFEfQaRx54pmgFy+/hM6liG7S5b/W77XRa
         5ONR13YB/W4JgiyvysqmvZcmjrJ8WxOTG7S+b1yJLWq/4Co25LnG+YlnkT/7Ue2K/ufS
         w0cbcPHR/9W+AguHmtxXEekWhZNr5XafpUzv/1n6QQWfp6wUMC7ynIGr56aD380Qi33+
         Q4gtZCFdash9yCe/PF1WjpcqaxCRMI3fAYCuON+vuHFYbev8ngjRuByF1wjWdgNE17RO
         +uMwOjQVE+uK6iV3i5Df5JisLRH99ykHEXRFg2OYw+XTKsT0TZf0kYFIYY+rs/5BvMKo
         /X2g==
X-Gm-Message-State: AFqh2koYSEMPFNBD0XLnHX4FQpEp/zII8Y3PhIUrWZz6trg2JaOCThYv
	7nSKo9DBI4zS9Kt3bRyhek1mtw==
X-Google-Smtp-Source: AMrXdXsVXFK6J3FI/oNC9B2qh8iRRbulOB/J3Gh4vyDVzfdXvWdeQZr51O5qsgmn1ZDrVvMY0QWzVA==
X-Received: by 2002:adf:f70d:0:b0:2bc:7d67:90e with SMTP id r13-20020adff70d000000b002bc7d67090emr7926446wrp.32.1674112875116;
        Wed, 18 Jan 2023 23:21:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e? ([2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d50d0000000b002755e301eeasm15178119wrt.100.2023.01.18.23.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 23:21:14 -0800 (PST)
Message-ID: <a9059443-f125-f6dc-4686-8212165cd431@linaro.org>
Date: Thu, 19 Jan 2023 08:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?77+9ZWNraQ==?=
 <rafal@milecki.pl>, Vaishnav Achath <vaishnav.a@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>, Leilk Liu
 <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>,
 Bert Vermeulen <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Marek Vasut <marex@denx.de>, Birger Koblitz <mail@birger-koblitz.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Anson Huang <Anson.Huang@nxp.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Kuldeep Singh <singh.kuldeep87k@gmail.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_232118_890473_C3728437 
X-CRM114-Status: GOOD (  15.04  )
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

On 18/01/2023 18:39, Krzysztof Kozlowski wrote:
> Cleanup examples:
>   - use 4-space indentation (for cases when it is neither 4 not 2 space),
>   - drop redundant blank lines,
>   - use lowercase hex.
> 
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>   .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--

For meson changes:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>   .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>   .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
>   .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>   .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>   .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>   .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>   .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
>   10 files changed, 150 insertions(+), 152 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> index e5eca3a6f132..4e28e6e9d8e0 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> @@ -100,17 +100,17 @@ unevaluatedProperties: false
>   examples:
>     - |
>       spi@c1108d80 {
> -          compatible = "amlogic,meson-gx-spicc";
> -          reg = <0xc1108d80 0x80>;
> -          interrupts = <112>;
> -          clocks = <&clk81>;
> -          clock-names = "core";
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> -
> -          display@0 {
> -              compatible = "lg,lg4573";
> -              spi-max-frequency = <1000000>;
> -              reg = <0>;
> -          };
> +        compatible = "amlogic,meson-gx-spicc";
> +        reg = <0xc1108d80 0x80>;
> +        interrupts = <112>;
> +        clocks = <&clk81>;
> +        clock-names = "core";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        display@0 {
> +            compatible = "lg,lg4573";
> +            spi-max-frequency = <1000000>;
> +            reg = <0>;
> +        };
>       };
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> index 806043fed4d1..8e769ccda97f 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> @@ -40,15 +40,15 @@ unevaluatedProperties: false
>   examples:
>     - |
>       spi@c1108c80 {
> -          compatible = "amlogic,meson6-spifc";
> -          reg = <0xc1108c80 0x80>;
> -          clocks = <&clk81>;
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> -
> -          flash: flash@0 {
> -              compatible = "spansion,m25p80", "jedec,spi-nor";
> -              reg = <0>;
> -              spi-max-frequency = <40000000>;
> -          };
> +        compatible = "amlogic,meson6-spifc";
> +        reg = <0xc1108c80 0x80>;
> +        clocks = <&clk81>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash: flash@0 {
> +            compatible = "spansion,m25p80", "jedec,spi-nor";
> +            reg = <0>;
> +            spi-max-frequency = <40000000>;
> +        };
>       };

<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
