Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE1CEE49AD
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 13:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L9HWL0uLdM698RTc8r2fdyf8ImElz8saY5QS4BXK01w=; b=s3XMtsMuk3SiFRSwrH6b/R9Lcg
	VcKDMzywJV7NE5bPncEwhzyj5l7I7a97KBitPJOk51WgmAuWcfO8YWvOkMqK5AUuan6MumrbB78w5
	qglpjYyTdzM7JjygPxk6K/YzWibqcCEn1BUvmIqJHTPhJ49ycImv7Jrfwshlwz5M3KZ63FOxH98L3
	3Yy0h4mtN/R8uKrZLj3eEruNtlw/MLWmncN70fOauV6PmrtfwXTwucoY7PLS8Il3Cr9nX14s6m3/K
	7u2cbJjyCioCzsFBrQWUE5zPqx25dPnyCTHVuX6anoQKjKIu40dTIP+Xt/KM3LcO9Z8ixgMJaaSiL
	ltlADS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soNkZ-00000009m7H-3U95;
	Wed, 11 Sep 2024 13:51:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soNjW-00000009lsX-2DJr;
	Wed, 11 Sep 2024 13:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B8DB5C06EA;
	Wed, 11 Sep 2024 13:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A823C4CEC5;
	Wed, 11 Sep 2024 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726062609;
	bh=N81tFhroIl/Qerhb+Gan0l3fOl6h2MuZvqVlrmL1Op4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=m+ZX/vz79xdEvcQq3LII2KIDx4oswbO8HI7Pyd2QEsLPgjdFhOskHmuxxhS4JKoiB
	 MWf7HBfXTzmW0+6wbs5J/0NChEwL0aMccQ+H1lpiMCjGZPnCZC4xRu8LozEHFY1+4t
	 CTzF8+iUXuzknMZSUKLVnsQyvBMvjwiKtcSG88Cu0RepC9GQyy7ikqe2C+LD+Hocx1
	 Es4cXg6OItqHE5il2rnt4jrnd39HhiNERbKlhm6bA/5zxjnl26rkaMjo89iKctgdHm
	 V/zvfqhw9ODqC+h+TVfAJ7F4i3pC1v1BYj4Z7rAg8s7mwMgOqfANNeXB+OP4sylclC
	 Id8BUq0fsXaPg==
Date: Wed, 11 Sep 2024 08:50:08 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
Message-Id: <172606224585.90829.12080764539678935748.robh@kernel.org>
Subject: Re: [PATCH 0/7] ARM: dts: amlogic: first easy dtbs fixes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_065010_682164_D94EF73A 
X-CRM114-Status: GOOD (  13.73  )
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


On Wed, 11 Sep 2024 12:19:39 +0200, Neil Armstrong wrote:
> This is the easy fixes to start and fully document the ARM Amlogic
> Device Trees, remaining work includes:
> - ethmac with required phy-mode/clocks/clock-names
> - amlogic,meson-hhi-sysctrl
> - amlogic,meson8-clkc
> - pinctrl: Unevaluated properties are not allowed ('reg', 'reg' were unexpected)
> - bank@80b0:gpio-line-names is too short
> - realtek,rt5640
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (7):
>       ARM: dts: amlogic: meson6: fix clk81 node name
>       ARM: dts: amlogic: meson8: fix soc thermal-zone node name
>       ARM: dts: amlogic: meson8: fix ao_arc_sram node name
>       ARM: dts: amlogic: meson6: delete undocumented nodes
>       ARM: dts: amlogic: meson8b-odroidc1: fix invalid reset-gpio
>       ARM: dts: amlogic: fix /memory node name
>       ARM: dts: amlogic: meson8: use correct pinctrl bank node name
> 
>  arch/arm/boot/dts/amlogic/meson6-atv1200.dts      |  2 +-
>  arch/arm/boot/dts/amlogic/meson6.dtsi             | 18 +++++++++++++++++-
>  arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts |  2 +-
>  arch/arm/boot/dts/amlogic/meson8.dtsi             |  8 ++++----
>  arch/arm/boot/dts/amlogic/meson8b-ec100.dts       |  2 +-
>  arch/arm/boot/dts/amlogic/meson8b-mxq.dts         |  2 +-
>  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts    |  4 ++--
>  arch/arm/boot/dts/amlogic/meson8b.dtsi            |  8 ++++----
>  arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts |  2 +-
>  9 files changed, 32 insertions(+), 16 deletions(-)
> ---
> base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
> change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-69d624b8bccd
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y amlogic/meson6-atv1200.dtb amlogic/meson8-minix-neo-x8.dtb amlogic/meson8b-ec100.dtb amlogic/meson8b-mxq.dtb amlogic/meson8b-odroidc1.dtb amlogic/meson8m2-mxiii-plus.dtb' for 20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org:

arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: pinctrl@9880: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@9880: bank@80b0: Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@9880: bank@80b0:gpio-line-names: ['J2 Header Pin 35', 'J2 Header Pin 36', 'J2 Header Pin 32', 'J2 Header Pin 31', 'J2 Header Pin 29', 'J2 Header Pin 18', 'J2 Header Pin 22', 'J2 Header Pin 16', 'J2 Header Pin 23', 'J2 Header Pin 21', 'J2 Header Pin 19', 'J2 Header Pin 33', 'J2 Header Pin 8', 'J2 Header Pin 10', 'J2 Header Pin 15', 'J2 Header Pin 13', 'J2 Header Pin 24', 'J2 Header Pin 26', 'Revision (upper)', 'Revision (lower)', 'J2 Header Pin 7', '', 'J2 Header Pin 12', 'J2 Header Pin 11', '', '', '', 'TFLASH_VDD_EN', '', '', 'VCCK_PWM (PWM_C)', 'I2CA_SDA', 'I2CA_SCL', 'I2CB_SDA', 'I2CB_SCL', 'VDDEE_PWM (PWM_D)', '', 'HDMI_HPD', 'HDMI_I2C_SDA', 'HDMI_I2C_SCL', 'ETH_PHY_INTR', 'ETH_PHY_NRST', 'ETH_TXD1', 'ETH_TXD0', 'ETH_TXD3', 'ETH_TXD2', 'ETH_RGMII_TX_CLK', 'SD_DATA1 (SDB_D1)', 'SD_DATA0 (SDB_D0)', 'SD_CLK', 'SD_CMD', 'SD_DATA3 (SDB_D3)', 'SD_DATA2 (SDB_D2)', 'SD_CDN (SD_DET_N)', 'SDC_D0 (EMMC)', 'SDC_D1 (EMMC)', 'SDC_D2 (EMMC
 )', 'SDC_D3 (EMMC)', 'SDC_D4 (EMMC)', 'SDC_D5 (EMMC)', 'SDC_D6 (EMMC)', 'SDC_D7 (EMMC)', 'SDC_CLK (EMMC)', 'SDC_RSTn (EMMC)', 'SDC_CMD (EMMC)', 'BOOT_SEL', '', '', '', '', '', '', '', 'ETH_RXD1', 'ETH_RXD0', 'ETH_RX_DV', 'RGMII_RX_CLK', 'ETH_RXD3', 'ETH_RXD2', 'ETH_TXEN', 'ETH_PHY_REF_CLK_25MOUT', 'ETH_MDC', 'ETH_MDIO'] is too short
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: pinctrl@9880: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@9880: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: pinctrl@9880: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@9880: bank@80b0: Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@9880: bank@80b0:gpio-line-names: ['WIFI_SD_D0', 'WIFI_SD_D1', 'WIFI_SD_D2', 'WIFI_SD_D3', 'BTPCM_DOUT', 'BTPCM_DIN', 'BTPCM_SYNC', 'BTPCM_CLK', 'WIFI_SD_CLK', 'WIFI_SD_CMD', 'WIFI_32K', 'WIFI_PWREN', 'UART_B_TX', 'UART_B_RX', 'UART_B_CTS_N', 'UART_B_RTS_N', 'BT_EN', 'WIFI_WAKE_HOST', '', '', '', '', '', '', '', '', '', '', '', '', 'VCCK_PWM_C', 'I2C_SDA_A', 'I2C_SCL_A', 'I2C_SDA_B', 'I2C_SCL_B', 'VDDEE_PWM_D', 'VDDEE_PWM 3V3_5V_EN', 'HDMI_HPD', 'HDMI_I2C_SDA', 'HDMI_I2C_SCL', 'RMII_IRQ', 'RMII_RST#', 'RMII_TXD1', 'RMII_TXD0', 'AV_select_1', 'AV_select_2', 'MCU_Control_S', 'SD_D1_B', 'SD_D0_B', 'SD_CLK_8726MX', 'SD_CMD_8726MX', 'SD_D3_B', 'SD_D2_B', 'CARD_EN_DET (CARD_DET)', 'NAND_D0 (EMMC)', 'NAND_D1 (EMMC)', 'NAND_D2 (EMMC)', 'NAND_D3 (EMMC)', 'NAND_D4 (EMMC)', 'NAND_D5 (EMMC)', 'NAND_D6 (EMMC)', 'NAND_D7 (EMMC)', 'NAND_CS1 (EMMC)', 'NAND_CS2 iNAND_RS1 (EMMC)', 'NAND_nR/B iNAND_CMD (EMMC)', 'NAND_ALE (EMMC)', 'NAND_CLE (EMMC)', 'n
 RE_S1 NAND_nRE (EMMC)', 'nWE_S1 NAND_nWE (EMMC)', '', '', 'SPI_CS', 'RMII_RXD1', 'RMII_RXD0', 'RMII_CRS_DV', 'RMII_50M_IN', 'GPIODIF_4', 'GPIODIF_5', 'RMII_TXEN', 'CPUETH_25MOUT', 'RMII_MDC', 'RMII_MDIO'] is too short
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@9880: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: pinctrl@84: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#
arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@84: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#
arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@84: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#
arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: pinctrl@84: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#
arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: pinctrl@84: Unevaluated properties are not valid under the given schema ('reg', 'reg' were unevaluated and invalid)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
