Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21596C54E58
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2024 00:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkwEctFgQkd+9+AWrsDiGCJuaJo//+yF5OTA4sdcYAg=; b=lA/nJsCkLKQi4c
	lCzweWNbikc08Xf6xWQKtHu7Lwleb94xP5FaK3CsOiSmXKoV+LMb5AGOwM/7H3r7mqRzxxzZUhm+I
	hwTkfhGOvo7XwJoZ9pwJDe0d608WHGeP60DCSzU6jKlQjkyH+NSiLEjRWfc4ARRaB/a4UR2rjzP4l
	SfWoKzcQyOUCmcPmiCQ4hGhhbVTyRw7kVE53wA6SAe1XgZYX5dSUozKPVvMG38GLNwwX4tjNy8uoB
	gIEmuryM3aipBdUkosXitPGWQFO38t9clpmqW3G0k5PvyFChFxhvoJ3D5Pp+O18Cv/SWTd5he6p2T
	jkxR9T4LKyj76sbt+scw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rout8-00000002WqK-43zR;
	Tue, 26 Mar 2024 00:42:03 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rout5-00000002Wns-0svU;
	Tue, 26 Mar 2024 00:42:01 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E2F41120002;
	Tue, 26 Mar 2024 03:41:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E2F41120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711413715;
	bh=GUwFIrijniX6tWOtmBIV4uX2Els9gfR5OyRHtM8oZJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=rsf453z1Okw4SLnv2UFa+1Weco2QHBe2yDbrtP00RdTiCVOmnVFydSkjL3l0kUZ8G
	 9TTa9lIBfD7+rnABLNRsBZXFmdht3xC1gx4zLM3kZme6rKB63HzyRbVj0rXT7JXmYH
	 quGOHeulx6YlFrQenBr/sXUcQK63nogixUBc5XMWDhrQTO3urtv//VQ6OlqTLF3rhd
	 9oobc8gzKZHCrm04Ype9lxwbBCcNcsWRah0Q+TI0iMRYQeyGxTbxCLEHOMxsf7jn46
	 yjntfmqemFh6i2zU8ovDNlnzFFmdA4mOkC/AjpG1XLmeLLfVjh0Lmhi50TFs3V5d+i
	 AD198bynLVz7A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 26 Mar 2024 03:41:55 +0300 (MSK)
Received: from [172.28.66.90] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 26 Mar 2024 03:41:55 +0300
Message-ID: <37cb9bc9-88c0-4e2b-8f46-0f67b91bc5be@salutedevices.com>
Date: Tue, 26 Mar 2024 03:41:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] iio: adc: meson: consistently use bool/enum in
 struct meson_sar_adc_param
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<neil.armstrong@linaro.org>, <lars@metafoo.de>, <jic23@kernel.org>,
	<linux-amlogic@lists.infradead.org>, "kernel@salutedevices.com"
	<kernel@salutedevices.com>
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
 <20240323231309.415425-3-martin.blumenstingl@googlemail.com>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240323231309.415425-3-martin.blumenstingl@googlemail.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184404 [Mar 25 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 11 0.3.11 5ecf9895443a5066245fcb91e8430edf92b1b594, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/25 18:32:00 #24438765
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_174159_979777_FCFC1887 
X-CRM114-Status: GOOD (  21.48  )
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

Hello Martin

On 3/24/24 02:13, Martin Blumenstingl wrote:
> Consistently use bool for any register bit that enables/disables
> functionality and enum for register values where there's a choice
> between different settings. The aim is to make the code easier to read
> and understand by being more consistent. No functional changes intended.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/iio/adc/meson_saradc.c | 47 +++++++++++++++++++---------------
>   1 file changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 2615d74534df..6b2af0c2bbc7 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -156,9 +156,9 @@
>   #define MESON_SAR_ADC_REG11					0x2c
>   	#define MESON_SAR_ADC_REG11_BANDGAP_EN			BIT(13)
>   	#define MESON_SAR_ADC_REG11_CMV_SEL                     BIT(6)
> -	#define MESON_SAR_ADC_REG11_VREF_VOLTAGE                BIT(5)
> -	#define MESON_SAR_ADC_REG11_EOC                         BIT(1)
> -	#define MESON_SAR_ADC_REG11_VREF_SEL                    BIT(0)
> +	#define MESON_SAR_ADC_REG11_VREF_VOLTAGE		BIT(5)
> +	#define MESON_SAR_ADC_REG11_EOC				BIT(1)
> +	#define MESON_SAR_ADC_REG11_VREF_SEL			BIT(0)
>   
>   #define MESON_SAR_ADC_REG13					0x34
>   	#define MESON_SAR_ADC_REG13_12BIT_CALIBRATION_MASK	GENMASK(13, 8)
> @@ -224,6 +224,11 @@ enum meson_sar_adc_vref_sel {
>   	VREF_VDDA = 1,
>   };
>   
> +enum meson_sar_adc_vref_voltage {
> +	VREF_VOLTAGE_0V9 = 0,
> +	VREF_VOLTAGE_1V8 = 1,
> +};
> +
>   enum meson_sar_adc_avg_mode {
>   	NO_AVERAGING = 0x0,
>   	MEAN_AVERAGING = 0x1,
> @@ -321,13 +326,13 @@ struct meson_sar_adc_param {
>   	u8					temperature_trimming_bits;
>   	unsigned int				temperature_multiplier;
>   	unsigned int				temperature_divider;
> -	u8					disable_ring_counter;
> +	bool					disable_ring_counter;
>   	bool					has_reg11;
>   	bool					has_vref_select;
> -	u8					vref_select;
> -	u8					cmv_select;
> -	u8					adc_eoc;


The reason to choose u8 type over bool was that those are not actually
bool values but direct values of hw register bits. We have little 
information about real meaning of these bits so it won't help much to
add bool layer and keep real values in the init code instead of param 
section (adc_eoc, cmv_select).
bool disable_ring_counter will look deceptive too because it doesn't
say whether disable ring_counter or not (we always disable it) but
how to disable it (write 0 or 1)

I think the poor choice was not the type of variables but their names:
u8 adc_eoc_bit;
u8 cmv_select_bit;
u8 disable_ring_counter_bit;

would be clearer.


> -	enum meson_sar_adc_vref_sel		vref_voltage;
> +	bool					cmv_select;
> +	bool					adc_eoc;
> +	enum meson_sar_adc_vref_sel		vref_select;
> +	enum meson_sar_adc_vref_voltage		vref_voltage;
>   };
>   
>   struct meson_sar_adc_data {
> @@ -982,14 +987,16 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
>   				   MESON_SAR_ADC_DELTA_10_TS_REVE0, 0);
>   	}
>   
> -	regval = FIELD_PREP(MESON_SAR_ADC_REG3_CTRL_CONT_RING_COUNTER_EN,
> -			    priv->param->disable_ring_counter);
> +	if (priv->param->disable_ring_counter)
> +		regval = MESON_SAR_ADC_REG3_CTRL_CONT_RING_COUNTER_EN;
> +	else
> +		regval = 0;
>   	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
>   			   MESON_SAR_ADC_REG3_CTRL_CONT_RING_COUNTER_EN,
>   			   regval);
>   
>   	if (priv->param->has_reg11) {
> -		regval = FIELD_PREP(MESON_SAR_ADC_REG11_EOC, priv->param->adc_eoc);
> +		regval = priv->param->adc_eoc ? MESON_SAR_ADC_REG11_EOC : 0;
>   		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
>   				   MESON_SAR_ADC_REG11_EOC, regval);
>   
> @@ -1005,8 +1012,7 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
>   		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
>   				   MESON_SAR_ADC_REG11_VREF_VOLTAGE, regval);
>   
> -		regval = FIELD_PREP(MESON_SAR_ADC_REG11_CMV_SEL,
> -				    priv->param->cmv_select);
> +		regval = priv->param->cmv_select ? MESON_SAR_ADC_REG11_CMV_SEL : 0;
>   		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
>   				   MESON_SAR_ADC_REG11_CMV_SEL, regval);
>   	}
> @@ -1225,8 +1231,8 @@ static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
>   	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
>   	.resolution = 10,
>   	.has_reg11 = true,
> -	.vref_voltage = 1,
> -	.cmv_select = 1,
> +	.vref_voltage = VREF_VOLTAGE_1V8,
> +	.cmv_select = true,
>   };
>   
>   static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
> @@ -1237,8 +1243,8 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
>   	.resolution = 12,
>   	.disable_ring_counter = 1,
>   	.has_reg11 = true,
> -	.vref_voltage = 1,
> -	.cmv_select = 1,
> +	.vref_voltage = VREF_VOLTAGE_1V8,
> +	.cmv_select = true,
>   };
>   
>   static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
> @@ -1249,10 +1255,10 @@ static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
>   	.resolution = 12,
>   	.disable_ring_counter = 1,
>   	.has_reg11 = true,
> -	.vref_voltage = 1,
> +	.vref_voltage = VREF_VOLTAGE_1V8,
>   	.has_vref_select = true,
>   	.vref_select = VREF_VDDA,
> -	.cmv_select = 1,
> +	.cmv_select = true,
>   };
>   
>   static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
> @@ -1263,7 +1269,8 @@ static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
>   	.resolution = 12,
>   	.disable_ring_counter = 1,
>   	.has_reg11 = true,
> -	.adc_eoc = 1,
> +	.vref_voltage = VREF_VOLTAGE_0V9,
> +	.adc_eoc = true,
>   	.has_vref_select = true,
>   	.vref_select = VREF_VDDA,
>   };

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
