Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B34C32771
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 11:55:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C2EC20656
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 11:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EDdG9fOe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C2EC20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjWknYvnoJwm637humwUIjoTdN7Omhzl9XPel76V0eI=; b=EDdG9fOeyMvNWG
	vX8Ql73eKtPyI5qGSHBFwfh1iUJE83YIIFVUhcawr3P51jcbbH8Rgt22MkrixbgvnNjLRlPnm/1Pw
	fSt8RtXUublLwNl4JMVpDKRCFNRHo8Rzl43ZB4tlLVOmut/khsvRHK7TgUV8FB+C9ZqSIE4YIFn0w
	4PGK/47S1Yh1y+c8DzwZFW0kp2dBAkauAGg5XWOA1yPZ5dff/1LUq+zQxTOOe8bK16mIlnbz3KuTH
	E5rY2SFc+frVTVJ1TG5IcJcOllmZAjM3RIH3qAoDj18hxO+c+g4c7+YUHMevZnPwC2A0GSUc/MUU8
	nEb5sI/2/wvIcY0nl6hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipWOw-00022q-VT; Thu, 09 Jan 2020 11:54:58 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipWOt-000224-Ki; Thu, 09 Jan 2020 11:54:57 +0000
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 9 Jan
 2020 19:55:18 +0800
Subject: Re: [PATCH v4 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com>
 <1578537045-23260-4-git-send-email-hanjie.lin@amlogic.com>
 <da0a5130-f4f4-1262-382c-b0420211f39e@baylibre.com>
From: Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <e1f6c8db-39bb-6c63-82ce-78d2f23020a9@amlogic.com>
Date: Thu, 9 Jan 2020 19:55:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <da0a5130-f4f4-1262-382c-b0420211f39e@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_035455_683510_87BFC1C9 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: devicetree@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jian Hu <jian.hu@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2020/1/9 17:22, Neil Armstrong wrote:
> On 09/01/2020 03:30, Hanjie Lin wrote:
>> This adds support for the USB2 PHY found in the Amlogic A1 SoC Family.
>>
>> It supports host mode only.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  drivers/phy/amlogic/phy-meson-g12a-usb2.c | 99 +++++++++++++++++++++----------
>>  1 file changed, 69 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>> index 9065ffc..16a1c0e 100644
>> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>> @@ -146,11 +146,17 @@
>>  #define RESET_COMPLETE_TIME					1000
>>  #define PLL_RESET_COMPLETE_TIME					100
>>  
>> +enum meson_soc_id {
>> +	MESON_SOC_G12A  = 0,
>> +	MESON_SOC_A1,
>> +};
>> +
>>  struct phy_meson_g12a_usb2_priv {
>>  	struct device		*dev;
>>  	struct regmap		*regmap;
>>  	struct clk		*clk;
>>  	struct reset_control	*reset;
>> +	int                     soc_id;
>>  };
>>  
>>  static const struct regmap_config phy_meson_g12a_usb2_regmap_conf = {
>> @@ -164,6 +170,7 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>  {
>>  	struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
>>  	int ret;
>> +	unsigned int value;
>>  
>>  	ret = reset_control_reset(priv->reset);
>>  	if (ret)
>> @@ -192,18 +199,22 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>  		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT2, 2) |
>>  		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT1, 9));
>>  
>> -	regmap_write(priv->regmap, PHY_CTRL_R18,
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
>> -		     PHY_CTRL_R18_MPLL_ACG_RANGE);
>> +	value = FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
>> +		FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
>> +		FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
>> +		FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
>> +		FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
>> +		FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
>> +		FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
>> +		FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
>> +		FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
>> +		FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
>> +		PHY_CTRL_R18_MPLL_ACG_RANGE;
>> +
>> +	if (priv->soc_id == MESON_SOC_A1)
>> +		value |= PHY_CTRL_R18_MPLL_DCO_CLK_SEL;
>> +
>> +	regmap_write(priv->regmap, PHY_CTRL_R18, value);
>>  
>>  	udelay(PLL_RESET_COMPLETE_TIME);
>>  
>> @@ -227,13 +238,24 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>  		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_VREF_4_0, 0) |
>>  		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_DBG_1_0, 0));
>>  
>> -	regmap_write(priv->regmap, PHY_CTRL_R4,
>> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
>> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
>> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
>> -		     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
>> -		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
>> -		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
>> +	if (priv->soc_id == MESON_SOC_G12A)
>> +		regmap_write(priv->regmap, PHY_CTRL_R4,
>> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
>> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
>> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
>> +			     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
>> +			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
>> +			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
>> +	else if (priv->soc_id == MESON_SOC_A1) {
>> +		regmap_write(priv->regmap, PHY_CTRL_R21,
>> +			     PHY_CTRL_R21_USB2_CAL_ACK_EN |
>> +			     PHY_CTRL_R21_USB2_TX_STRG_PD |
>> +			     FIELD_PREP(PHY_CTRL_R21_USB2_OTG_ACA_TRIM_1_0, 2));
>> +
>> +		/* Analog Settings */
>> +		regmap_write(priv->regmap, PHY_CTRL_R13,
>> +			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
>> +	}
>>  
>>  	/* Tuning Disconnect Threshold */
>>  	regmap_write(priv->regmap, PHY_CTRL_R3,
>> @@ -241,11 +263,13 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>  		     FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 1) |
>>  		     FIELD_PREP(PHY_CTRL_R3_DISC_THRESH, 3));
>>  
>> -	/* Analog Settings */
>> -	regmap_write(priv->regmap, PHY_CTRL_R14, 0);
>> -	regmap_write(priv->regmap, PHY_CTRL_R13,
>> -		     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
>> -		     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
>> +	if (priv->soc_id == MESON_SOC_G12A) {
>> +		/* Analog Settings */
>> +		regmap_write(priv->regmap, PHY_CTRL_R14, 0);
>> +		regmap_write(priv->regmap, PHY_CTRL_R13,
>> +			     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
>> +			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
>> +	}
>>  
>>  	return 0;
>>  }
>> @@ -286,16 +310,24 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>>  	if (IS_ERR(base))
>>  		return PTR_ERR(base);
>>  
>> +	priv->soc_id = (enum meson_soc_id)of_device_get_match_data(&pdev->dev);
>> +
>>  	priv->regmap = devm_regmap_init_mmio(dev, base,
>>  					     &phy_meson_g12a_usb2_regmap_conf);
>>  	if (IS_ERR(priv->regmap))
>>  		return PTR_ERR(priv->regmap);
>>  
>> -	priv->clk = devm_clk_get(dev, "xtal");
>> -	if (IS_ERR(priv->clk))
>> -		return PTR_ERR(priv->clk);
>> +	if (priv->soc_id == MESON_SOC_G12A) {
>> +		priv->clk = devm_clk_get(dev, "xtal");
>> +		if (IS_ERR(priv->clk))
>> +			return PTR_ERR(priv->clk);
>> +	} else if (priv->soc_id == MESON_SOC_A1) {
>> +		priv->clk = devm_clk_get(dev, "xtal_usb_phy");
>> +		if (IS_ERR(priv->clk))
>> +			return PTR_ERR(priv->clk);
>> +	}
>>  
>> -	priv->reset = devm_reset_control_get(dev, "phy");
>> +	priv->reset = devm_reset_control_get(dev, NULL);
> 
> 
> PLease keep the reset-names in the bindings and leave this as-is.
> 

Ok, Neil

I will revert reset-names change to keep consistence with G12A.

Thanks,
Hanjie


>>  	if (IS_ERR(priv->reset))
>>  		return PTR_ERR(priv->reset);
>>  
>> @@ -321,8 +353,15 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>>  }
>>  
>>  static const struct of_device_id phy_meson_g12a_usb2_of_match[] = {
>> -	{ .compatible = "amlogic,g12a-usb2-phy", },
>> -	{ },
>> +	{
>> +		.compatible = "amlogic,g12a-usb2-phy",
>> +		.data = (void *)MESON_SOC_G12A,
>> +	},
>> +	{
>> +		.compatible = "amlogic,a1-usb2-phy",
>> +		.data = (void *)MESON_SOC_A1,
>> +	},
>> +	{ /* Sentinel */ }
>>  };
>>  MODULE_DEVICE_TABLE(of, phy_meson_g12a_usb2_of_match);
>>  
>>
> 
> With the devm_reset_control_get change reverted:
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Neil
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
