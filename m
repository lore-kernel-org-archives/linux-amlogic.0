Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D2C05027
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmoFteBgbRmSdrBeKlgSqlXoCdt9GbEBCtvtmHvX048=; b=cwhrdOVdCHAjKb
	+t4egl+/0/blRTYYHI6O/TwzFWvp4aGniTtCJWc2rzIrTecYVvNR/XdYf1iD3jOCkjikYcehwXLG7
	z7rvXFfF8zfi7/mzptTisT9w5m6KQj7Hghj1dy116e0exXAEhRB2IkeyJlnUViSGV0fc4Ysm2UG9V
	0gVpA66b34YjnlrkPUjXa35VIu3yxgOvLrX85sJaJUVYklyOc/y5lPDvClakeqgShNS/ArhG5u4ke
	s0XZiKK0db+6d4NTglSmDiy1YJ7LSknT5u4SS5JVcSS8+FxKfOej+VjIyuy2KOQrs0sgQ86vaxiIP
	9h5SNFYiFj7GIQO5HrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3pR-00BOIP-6b; Thu, 26 Jan 2023 15:06:17 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3pM-00BODW-Hq; Thu, 26 Jan 2023 15:06:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA4BB301D1;
	Thu, 26 Jan 2023 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1674745564; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7LZ8bUPpnuhki6lkEcSSg4UMVoZg0HMT545NLaP0yeU=;
	b=JJEehSZHlS2AQv3wiOylZUZp3Gid0FHSV+ANCh48RRDV3AQE2jY4ulrNkS2GdJwKgryUo8
	NNfStpvtwG8S33+cLTOcfB8/XN1YyEWx3JwvFoPIwAt/ZNXNwCBGU1yhfife+RKBPSFimZ
	/ErhR7s9InEusOZsuiBC3X36FXi4XCaO1y+/fPsLffoWt7QYDX2PVncNrRZomsR1++oYec
	CYrFJpJTazbD3VUK4tS7rwb3MsZCidMq1y6QBn2wz5ZLIZSn6nJY8LAWDSJlLNeDghkvqj
	BH4aRqYhmPoK/5GDzMJZ9tu+NRv7k3RMmLn7HoVn1SQqNvP04dpH/JxGWxu4Zg==
Message-ID: <da08673e-dcfd-0c14-3843-518690105560@lexina.in>
Date: Thu, 26 Jan 2023 18:06:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
Content-Language: en-US, ru, ru-RU
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
From: Vyacheslav Bocharov <adeep@lexina.in>
In-Reply-To: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_070613_396836_C67AF738 
X-CRM114-Status: GOOD (  14.90  )
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

Tested 6.1/6.2rc3 on axg (JetHub D1/D1+).



On 26/01/2023 17.03, Heiner Kallweit wrote:
> The usage of edge-triggered interrupts lead to lost interrupts under load,
> see [0]. This was confirmed to be fixed by using level-triggered
> interrupts.
> The report was about SDIO. However, as the host controller is the same
> for SD and MMC, apply the change to all mmc controller instances.
> 
> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
> 
> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
> Reported-by: Peter Suti <peter.suti@streamunlimited.com>
> Tested-by: Peter Suti <peter.suti@streamunlimited.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - apply the fix also to meson-axg
> - apply the fix to all host controller instances
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 +++---
>   3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index ed895fb32..a6a3095de 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1886,7 +1886,7 @@ apb: bus@ffe00000 {
>   			sd_emmc_b: mmc@5000 {
>   				compatible = "amlogic,meson-axg-mmc";
>   				reg = <0x0 0x5000 0x0 0x800>;
> -				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
>   				status = "disabled";
>   				clocks = <&clkc CLKID_SD_EMMC_B>,
>   					<&clkc CLKID_SD_EMMC_B_CLK0>,
> @@ -1898,7 +1898,7 @@ sd_emmc_b: mmc@5000 {
>   			sd_emmc_c: mmc@7000 {
>   				compatible = "amlogic,meson-axg-mmc";
>   				reg = <0x0 0x7000 0x0 0x800>;
> -				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
>   				status = "disabled";
>   				clocks = <&clkc CLKID_SD_EMMC_C>,
>   					<&clkc CLKID_SD_EMMC_C_CLK0>,
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 6d7272b2c..13fdaba21 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2324,7 +2324,7 @@ uart_A: serial@24000 {
>   		sd_emmc_a: mmc@ffe03000 {
>   			compatible = "amlogic,meson-axg-mmc";
>   			reg = <0x0 0xffe03000 0x0 0x800>;
> -			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
>   			status = "disabled";
>   			clocks = <&clkc CLKID_SD_EMMC_A>,
>   				 <&clkc CLKID_SD_EMMC_A_CLK0>,
> @@ -2336,7 +2336,7 @@ sd_emmc_a: mmc@ffe03000 {
>   		sd_emmc_b: mmc@ffe05000 {
>   			compatible = "amlogic,meson-axg-mmc";
>   			reg = <0x0 0xffe05000 0x0 0x800>;
> -			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>   			status = "disabled";
>   			clocks = <&clkc CLKID_SD_EMMC_B>,
>   				 <&clkc CLKID_SD_EMMC_B_CLK0>,
> @@ -2348,7 +2348,7 @@ sd_emmc_b: mmc@ffe05000 {
>   		sd_emmc_c: mmc@ffe07000 {
>   			compatible = "amlogic,meson-axg-mmc";
>   			reg = <0x0 0xffe07000 0x0 0x800>;
> -			interrupts = <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
>   			status = "disabled";
>   			clocks = <&clkc CLKID_SD_EMMC_C>,
>   				 <&clkc CLKID_SD_EMMC_C_CLK0>,
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index e3c12e0be..5eed15035 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -603,21 +603,21 @@ apb: apb@d0000000 {
>   			sd_emmc_a: mmc@70000 {
>   				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
>   				reg = <0x0 0x70000 0x0 0x800>;
> -				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
>   				status = "disabled";
>   			};
>   
>   			sd_emmc_b: mmc@72000 {
>   				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
>   				reg = <0x0 0x72000 0x0 0x800>;
> -				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
>   				status = "disabled";
>   			};
>   
>   			sd_emmc_c: mmc@74000 {
>   				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
>   				reg = <0x0 0x74000 0x0 0x800>;
> -				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
>   				status = "disabled";
>   			};
>   		};

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
