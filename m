Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B058C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 23:10:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29B51223C6
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 23:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFDvFELG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GNHDwpg5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29B51223C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v8gZRIHZPEJWv9a6w6NlZKnMoISzhAB54JUrE7JA3eY=; b=pFDvFELGETLS2V6Skx8AxW7JN
	8/9HBl2/birC+QOS4uyVUgybV2xyNFmnk2sjVnAqN8P8Zs07a+z2ffohC6LIotWXKZjKH4dKb53TR
	86a2ce1ThWLPynljUa4lx8Tl8I0kl7Ej8iIoxF8zHl/OaPyUCZ0qYhjR7DAPQbNSb6SXfNVY0ycSC
	FYv7yyt1kMH+hfka0rmRapa6r2KbXI9mL6iyvZxskBhWbBgf1t/+wcIz+CaNMSp4pEQlY2h7zOCvk
	Gy5NElWM03oslfYdnMlAaH/AGYGQC4hGrXm+n8mplcj2YuF/RnkIf9Qm21A7JeIhQ+5KG14WdTzUN
	d429z3fZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kV0m3-0000Td-4B; Tue, 20 Oct 2020 23:10:35 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kV0ly-0000SG-3W
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 23:10:32 +0000
Received: by mail-pj1-x1042.google.com with SMTP id hk7so138462pjb.2
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 16:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=VOGFC+9C7Ee/7QcBtFUufnDJvjCV5vtOV2Aqb8frmgk=;
 b=GNHDwpg5z5pFPRbdWbGBnoMmZK+uoOw4XYb/0p7/OvIuWWKvjvPTQhSOhwNO17/GZE
 v8CKS7U1hEpmo1N6biUf2aw3iHaxcTcDkN5x6VunUTydguDA18hX848AwdvAXeLlFeF2
 N4qlrsG0NECExH0If8dmgvrw3OSAr3fdnd/Im68yoMJdoVY96w4DfH0hGnTzeJsi43ZE
 cXkxRdEOtQYsxrs9z6SjdB2g3+7QB0PxyI8r4roxP0sSNocmsThILO7QrIr+wNL53Ao9
 cm9ofHx5ofSZE8GY6/uB+iTV1hF8A1w1LI1xRsaEdI36BIZPJ5jY9idKZOQBIxFG2Xhj
 qeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=VOGFC+9C7Ee/7QcBtFUufnDJvjCV5vtOV2Aqb8frmgk=;
 b=hIXEdBlA1GKv5Y/ztwo+vUaRXDTGivlLpBhgeEp5PdziPjJm81PXlCH9SO/KFs6Ogd
 Z0ZvSt1mo7LMPA/1GqMxw5HBSYx7QmEqodmouIl7s5buuUa6vTk/1JUsN+VZJAoAR8jH
 8+IqRiF32anez7QuUsATD5z8E+qko1heBcvfXq+9Nxipzswe46gAphTzBClPhJyJjZbD
 0s1gjTesbHJaE7SVSbza4kNRGQWRO3R0KqSb/QMgaiGB/F+qwakaSz892ikKzbZFxh4B
 IW+yHcltpAv5ad2CnycI0HOu4rc7VKYXXvWjxAfWXtPhzGDNZ8mpFBJ/ooR3cjIKEGHa
 XwCA==
X-Gm-Message-State: AOAM5336+W0SgFV5XlD1T9adKjbEW6UyehwJK4AtI8UBRQ5m7LEuk57j
 SThHZg60OF2vagcBKh+atgULmA==
X-Google-Smtp-Source: ABdhPJwdIr5BveUPeae8lCGGgOtWgJ2X5z6HuFsZeLfltQ8UDf5CjKNZc7gGdyEnVJO6KDlR688u3g==
X-Received: by 2002:a17:902:b78c:b029:d4:da94:8766 with SMTP id
 e12-20020a170902b78cb02900d4da948766mr497971pls.31.1603235426121; 
 Tue, 20 Oct 2020 16:10:26 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y15sm187181pjt.41.2020.10.20.16.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 16:10:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com, repk@triplefau.lt
Subject: Re: [PATCH v2 3/3] phy: amlogic: phy-meson-axg-mipi-pcie-analog: add
 support for MIPI DSI analog
In-Reply-To: <6f87aa99-e044-f7f6-802f-ea2fe8b9de6d@baylibre.com>
References: <20200915130339.11079-1-narmstrong@baylibre.com>
 <20200915130339.11079-4-narmstrong@baylibre.com>
 <6f87aa99-e044-f7f6-802f-ea2fe8b9de6d@baylibre.com>
Date: Tue, 20 Oct 2020 16:10:24 -0700
Message-ID: <7h5z74jxy7.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_191030_334709_16391261 
X-CRM114-Status: GOOD (  20.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kishon,

It's been another few weeks, so another slightly less gentle ping. :)

Kevin

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi Kishon,
>
> Gentle ping.
>
> Thanks,
> Neil
>
> On 15/09/2020 15:03, Neil Armstrong wrote:
>> The AXG Analog MIPI-DSI PHY also provides functions to the PCIe PHY,
>> thus we need to have inclusive support for both interfaces at runtime.
>> 
>> This fixes the regmap get from parent node, removes cell param
>> to select a mode and implement runtime configuration & power on/off
>> for both functions since they are not exclusive.
>> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Reviewed-by: Remi Pommarel <repk@triplefau.lt>
>> ---
>>  drivers/phy/amlogic/Kconfig                   |   1 +
>>  .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 204 ++++++++++++------
>>  2 files changed, 136 insertions(+), 69 deletions(-)
>> 
>> diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
>> index 99e8a4c7f1f3..db5d0cd757e3 100644
>> --- a/drivers/phy/amlogic/Kconfig
>> +++ b/drivers/phy/amlogic/Kconfig
>> @@ -66,6 +66,7 @@ config PHY_MESON_AXG_MIPI_PCIE_ANALOG
>>  	depends on OF && (ARCH_MESON || COMPILE_TEST)
>>  	select GENERIC_PHY
>>  	select REGMAP_MMIO
>> +	select GENERIC_PHY_MIPI_DPHY
>>  	help
>>  	  Enable this to support the Meson MIPI + PCIE analog PHY
>>  	  found in Meson AXG SoCs.
>> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
>> index 1431cbf885e1..6eb21551bdd9 100644
>> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
>> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
>> @@ -4,9 +4,13 @@
>>   *
>>   * Copyright (C) 2019 Remi Pommarel <repk@triplefau.lt>
>>   */
>> +#include <linux/bitfield.h>
>> +#include <linux/bitops.h>
>>  #include <linux/module.h>
>>  #include <linux/phy/phy.h>
>>  #include <linux/regmap.h>
>> +#include <linux/delay.h>
>> +#include <linux/mfd/syscon.h>
>>  #include <linux/platform_device.h>
>>  #include <dt-bindings/phy/phy.h>
>>  
>> @@ -14,10 +18,10 @@
>>  #define		HHI_MIPI_CNTL0_COMMON_BLOCK	GENMASK(31, 28)
>>  #define		HHI_MIPI_CNTL0_ENABLE		BIT(29)
>>  #define		HHI_MIPI_CNTL0_BANDGAP		BIT(26)
>> -#define		HHI_MIPI_CNTL0_DECODE_TO_RTERM	GENMASK(15, 12)
>> -#define		HHI_MIPI_CNTL0_OUTPUT_EN	BIT(3)
>> +#define		HHI_MIPI_CNTL0_DIF_REF_CTL1	GENMASK(25, 16)
>> +#define		HHI_MIPI_CNTL0_DIF_REF_CTL0	GENMASK(15, 0)
>>  
>> -#define HHI_MIPI_CNTL1 0x01
>> +#define HHI_MIPI_CNTL1 0x04
>>  #define		HHI_MIPI_CNTL1_CH0_CML_PDR_EN	BIT(12)
>>  #define		HHI_MIPI_CNTL1_LP_ABILITY	GENMASK(5, 4)
>>  #define		HHI_MIPI_CNTL1_LP_RESISTER	BIT(3)
>> @@ -25,100 +29,170 @@
>>  #define		HHI_MIPI_CNTL1_INPUT_SEL	BIT(1)
>>  #define		HHI_MIPI_CNTL1_PRBS7_EN		BIT(0)
>>  
>> -#define HHI_MIPI_CNTL2 0x02
>> +#define HHI_MIPI_CNTL2 0x08
>>  #define		HHI_MIPI_CNTL2_CH_PU		GENMASK(31, 25)
>>  #define		HHI_MIPI_CNTL2_CH_CTL		GENMASK(24, 19)
>>  #define		HHI_MIPI_CNTL2_CH0_DIGDR_EN	BIT(18)
>>  #define		HHI_MIPI_CNTL2_CH_DIGDR_EN	BIT(17)
>>  #define		HHI_MIPI_CNTL2_LPULPS_EN	BIT(16)
>> -#define		HHI_MIPI_CNTL2_CH_EN(n)		BIT(15 - (n))
>> +#define		HHI_MIPI_CNTL2_CH_EN		GENMASK(15, 11)
>>  #define		HHI_MIPI_CNTL2_CH0_LP_CTL	GENMASK(10, 1)
>>  
>> +#define DSI_LANE_0              (1 << 4)
>> +#define DSI_LANE_1              (1 << 3)
>> +#define DSI_LANE_CLK            (1 << 2)
>> +#define DSI_LANE_2              (1 << 1)
>> +#define DSI_LANE_3              (1 << 0)
>> +#define DSI_LANE_MASK		(0x1F)
>> +
>>  struct phy_axg_mipi_pcie_analog_priv {
>>  	struct phy *phy;
>> -	unsigned int mode;
>>  	struct regmap *regmap;
>> +	bool dsi_configured;
>> +	bool dsi_enabled;
>> +	bool powered;
>> +	struct phy_configure_opts_mipi_dphy config;
>>  };
>>  
>> -static const struct regmap_config phy_axg_mipi_pcie_analog_regmap_conf = {
>> -	.reg_bits = 8,
>> -	.val_bits = 32,
>> -	.reg_stride = 4,
>> -	.max_register = HHI_MIPI_CNTL2,
>> -};
>> +static void phy_bandgap_enable(struct phy_axg_mipi_pcie_analog_priv *priv)
>> +{
>> +	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> +			HHI_MIPI_CNTL0_BANDGAP, HHI_MIPI_CNTL0_BANDGAP);
>>  
>> -static int phy_axg_mipi_pcie_analog_power_on(struct phy *phy)
>> +	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> +			HHI_MIPI_CNTL0_ENABLE, HHI_MIPI_CNTL0_ENABLE);
>> +}
>> +
>> +static void phy_bandgap_disable(struct phy_axg_mipi_pcie_analog_priv *priv)
>>  {
>> -	struct phy_axg_mipi_pcie_analog_priv *priv = phy_get_drvdata(phy);
>> +	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> +			HHI_MIPI_CNTL0_BANDGAP, 0);
>> +	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> +			HHI_MIPI_CNTL0_ENABLE, 0);
>> +}
>>  
>> -	/* MIPI not supported yet */
>> -	if (priv->mode != PHY_TYPE_PCIE)
>> -		return -EINVAL;
>> +static void phy_dsi_analog_enable(struct phy_axg_mipi_pcie_analog_priv *priv)
>> +{
>> +	u32 reg;
>>  
>>  	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> -			   HHI_MIPI_CNTL0_BANDGAP, HHI_MIPI_CNTL0_BANDGAP);
>> +			   HHI_MIPI_CNTL0_DIF_REF_CTL1,
>> +			   FIELD_PREP(HHI_MIPI_CNTL0_DIF_REF_CTL1, 0x1b8));
>> +	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> +			   BIT(31), BIT(31));
>> +	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> +			   HHI_MIPI_CNTL0_DIF_REF_CTL0,
>> +			   FIELD_PREP(HHI_MIPI_CNTL0_DIF_REF_CTL0, 0x8));
>> +
>> +	regmap_write(priv->regmap, HHI_MIPI_CNTL1, 0x001e);
>> +
>> +	regmap_write(priv->regmap, HHI_MIPI_CNTL2,
>> +		     (0x26e0 << 16) | (0x459 << 0));
>> +
>> +	reg = DSI_LANE_CLK;
>> +	switch (priv->config.lanes) {
>> +	case 4:
>> +		reg |= DSI_LANE_3;
>> +		fallthrough;
>> +	case 3:
>> +		reg |= DSI_LANE_2;
>> +		fallthrough;
>> +	case 2:
>> +		reg |= DSI_LANE_1;
>> +		fallthrough;
>> +	case 1:
>> +		reg |= DSI_LANE_0;
>> +		break;
>> +	default:
>> +		reg = 0;
>> +	}
>> +
>> +	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL2,
>> +			   HHI_MIPI_CNTL2_CH_EN,
>> +			   FIELD_PREP(HHI_MIPI_CNTL2_CH_EN, reg));
>> +
>> +	priv->dsi_enabled = true;
>> +}
>>  
>> +static void phy_dsi_analog_disable(struct phy_axg_mipi_pcie_analog_priv *priv)
>> +{
>>  	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> -			   HHI_MIPI_CNTL0_ENABLE, HHI_MIPI_CNTL0_ENABLE);
>> -	return 0;
>> +			HHI_MIPI_CNTL0_DIF_REF_CTL1,
>> +			FIELD_PREP(HHI_MIPI_CNTL0_DIF_REF_CTL1, 0));
>> +	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0, BIT(31), 0);
>> +	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> +			HHI_MIPI_CNTL0_DIF_REF_CTL1, 0);
>> +
>> +	regmap_write(priv->regmap, HHI_MIPI_CNTL1, 0x6);
>> +
>> +	regmap_write(priv->regmap, HHI_MIPI_CNTL2, 0x00200000);
>> +
>> +	priv->dsi_enabled = false;
>>  }
>>  
>> -static int phy_axg_mipi_pcie_analog_power_off(struct phy *phy)
>> +static int phy_axg_mipi_pcie_analog_configure(struct phy *phy,
>> +					      union phy_configure_opts *opts)
>>  {
>>  	struct phy_axg_mipi_pcie_analog_priv *priv = phy_get_drvdata(phy);
>> +	int ret;
>>  
>> -	/* MIPI not supported yet */
>> -	if (priv->mode != PHY_TYPE_PCIE)
>> -		return -EINVAL;
>> +	ret = phy_mipi_dphy_config_validate(&opts->mipi_dphy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	memcpy(&priv->config, opts, sizeof(priv->config));
>> +
>> +	priv->dsi_configured = true;
>> +
>> +	/* If PHY was already powered on, setup the DSI analog part */
>> +	if (priv->powered) {
>> +		/* If reconfiguring, disable & reconfigure */
>> +		if (priv->dsi_enabled)
>> +			phy_dsi_analog_disable(priv);
>> +
>> +		usleep_range(100, 200);
>> +
>> +		phy_dsi_analog_enable(priv);
>> +	}
>>  
>> -	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> -			   HHI_MIPI_CNTL0_BANDGAP, 0);
>> -	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
>> -			   HHI_MIPI_CNTL0_ENABLE, 0);
>>  	return 0;
>>  }
>>  
>> -static int phy_axg_mipi_pcie_analog_init(struct phy *phy)
>> +static int phy_axg_mipi_pcie_analog_power_on(struct phy *phy)
>>  {
>> +	struct phy_axg_mipi_pcie_analog_priv *priv = phy_get_drvdata(phy);
>> +
>> +	phy_bandgap_enable(priv);
>> +
>> +	if (priv->dsi_configured)
>> +		phy_dsi_analog_enable(priv);
>> +
>> +	priv->powered = true;
>> +
>>  	return 0;
>>  }
>>  
>> -static int phy_axg_mipi_pcie_analog_exit(struct phy *phy)
>> +static int phy_axg_mipi_pcie_analog_power_off(struct phy *phy)
>>  {
>> +	struct phy_axg_mipi_pcie_analog_priv *priv = phy_get_drvdata(phy);
>> +
>> +	phy_bandgap_disable(priv);
>> +
>> +	if (priv->dsi_enabled)
>> +		phy_dsi_analog_disable(priv);
>> +
>> +	priv->powered = false;
>> +
>>  	return 0;
>>  }
>>  
>>  static const struct phy_ops phy_axg_mipi_pcie_analog_ops = {
>> -	.init = phy_axg_mipi_pcie_analog_init,
>> -	.exit = phy_axg_mipi_pcie_analog_exit,
>> +	.configure = phy_axg_mipi_pcie_analog_configure,
>>  	.power_on = phy_axg_mipi_pcie_analog_power_on,
>>  	.power_off = phy_axg_mipi_pcie_analog_power_off,
>>  	.owner = THIS_MODULE,
>>  };
>>  
>> -static struct phy *phy_axg_mipi_pcie_analog_xlate(struct device *dev,
>> -						  struct of_phandle_args *args)
>> -{
>> -	struct phy_axg_mipi_pcie_analog_priv *priv = dev_get_drvdata(dev);
>> -	unsigned int mode;
>> -
>> -	if (args->args_count != 1) {
>> -		dev_err(dev, "invalid number of arguments\n");
>> -		return ERR_PTR(-EINVAL);
>> -	}
>> -
>> -	mode = args->args[0];
>> -
>> -	/* MIPI mode is not supported yet */
>> -	if (mode != PHY_TYPE_PCIE) {
>> -		dev_err(dev, "invalid phy mode select argument\n");
>> -		return ERR_PTR(-EINVAL);
>> -	}
>> -
>> -	priv->mode = mode;
>> -	return priv->phy;
>> -}
>> -
>>  static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>>  {
>>  	struct phy_provider *phy;
>> @@ -126,27 +200,20 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>>  	struct phy_axg_mipi_pcie_analog_priv *priv;
>>  	struct device_node *np = dev->of_node;
>>  	struct regmap *map;
>> -	struct resource *res;
>> -	void __iomem *base;
>>  	int ret;
>>  
>>  	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
>>  	if (!priv)
>>  		return -ENOMEM;
>>  
>> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	base = devm_ioremap_resource(dev, res);
>> -	if (IS_ERR(base)) {
>> -		dev_err(dev, "failed to get regmap base\n");
>> -		return PTR_ERR(base);
>> -	}
>> -
>> -	map = devm_regmap_init_mmio(dev, base,
>> -				    &phy_axg_mipi_pcie_analog_regmap_conf);
>> +	/* Get the hhi system controller node */
>> +	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
>>  	if (IS_ERR(map)) {
>> -		dev_err(dev, "failed to get HHI regmap\n");
>> +		dev_err(dev,
>> +			"failed to get HHI regmap\n");
>>  		return PTR_ERR(map);
>>  	}
>> +
>>  	priv->regmap = map;
>>  
>>  	priv->phy = devm_phy_create(dev, np, &phy_axg_mipi_pcie_analog_ops);
>> @@ -160,8 +227,7 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>>  	phy_set_drvdata(priv->phy, priv);
>>  	dev_set_drvdata(dev, priv);
>>  
>> -	phy = devm_of_phy_provider_register(dev,
>> -					    phy_axg_mipi_pcie_analog_xlate);
>> +	phy = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>>  
>>  	return PTR_ERR_OR_ZERO(phy);
>>  }
>> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
