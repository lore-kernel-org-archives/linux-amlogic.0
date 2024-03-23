Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812A1C54E67
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2024 23:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+2gVDh66dpUYng9jW4Wux8TkcXqgKm4ynDn1w8pVYE=; b=bf5tefcnvOHCNQ
	rUWV4xkRcYdD/H2vG2Gv7a5gW/e3Ve9gdX5XZf2vW8lJ7LZygbGRzG2h3L58OrjRB1GBsLzfslVeD
	yM7NUABkuiok7XzqeL0aErLa6h640s9ohbuVVw2CYZg//oL/7ZXaLScVZZU92vBqqGdIfiHvm+8D5
	1k29mw3yIZiOFYNZvXjIiAlDag7YHYXhRYHIw1S4jBYTAZK04IXLVLU7urakVL5Ip7XtouWCL3Iiu
	YNFpGo1oaWuDktDJOWQT1bRD7YR4ANUZAD+94m4rXJcQ+cH6SDEI3anj0SNjGEa1OgNB3pckt9SP8
	4CD14x8m65qfAc8wI3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roAYM-0000000BMr7-21LN;
	Sat, 23 Mar 2024 23:13:30 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roAYG-0000000BMoV-3Neh;
	Sat, 23 Mar 2024 23:13:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-341b01dbebbso1942184f8f.0;
        Sat, 23 Mar 2024 16:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1711235603; x=1711840403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+wkttBX+iSKjpPSrwwLyAmpLqj+dv8BQ9EiIlhtH+A=;
        b=eBdjd3DcVk8tKUzXjQ4wmC5DVY2dSa3ASCDr15JaKXPYwCNLOJNLTi5CYqK7GM4wAn
         QrcJhs2xjN78b/fFWm+Yfm7ZTcUm53DtYKEAKB0LgGjQJyu7R8bwS8QoftGzYNYpjmYd
         q/pbi6HRTgmdPa6tNEV2w+GIJxYV8sFKY1o1SRk6iqHcOGiOgqbK2bQE73aVBAol0Qzs
         9QkjLqJOpw1p+5lDmkuuahtkugGuBhzpzqdM/dC0ZQ8wZkwx+xTBebxuVCqRzwTINWug
         l/wVOwMs7bnkRS5G1/8g8nA0CKk5Zv76qkPESCGo4Oxb8pC4PLyaLsvNe4OU0NUwNsXM
         TDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711235603; x=1711840403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+wkttBX+iSKjpPSrwwLyAmpLqj+dv8BQ9EiIlhtH+A=;
        b=sBu1SciiEgQTOL3J6778kWpnkQEsXlJeoeDclJCPTm1Dzb/URaFPYccekpxpffd4CV
         Tccm6gJrPN4odNf7XarJ8Rx244I2awRHiS9d5cqGYuw5GSC+FkBoXAvhGTcN1Ugbc9Xs
         JScmBrJGDbZGAxj48oaDKjFPVDqDZT8XZLqA+E4VBLmWECNuKJxupa2K7wSYB+5Rj3l8
         efm3B9HZ9XNyZkSpdV854WHyXan9NL/Czt6pqplqPBcIN2cAlQoF13hlp46xXBa1EvwG
         ctOX+85fbOd0b9manlviH848geVbU0A0DavZkyYDZCOE6KLKPk9CbXxFMN+f90ED1hRV
         jsvA==
X-Gm-Message-State: AOJu0YwygEehMNzQ7GfNv6HNpycYCKLEBCmafphPFLYhDWY1ZteKvs+t
	S3AsVQcuFI94U4xA7nOVT6I53V1E0yixryxMbSiIl1cVYCvoqb7PRG2CiVk4
X-Google-Smtp-Source: AGHT+IGaGiJGJBEwz2g/fX8DIOJst2hHZiYa664cIHZgdBzahgfTDnPlGG/I/2i3Ze0ExnTcmGWGJw==
X-Received: by 2002:a05:6000:1185:b0:33e:7a7c:a058 with SMTP id g5-20020a056000118500b0033e7a7ca058mr2551774wrx.18.1711235602417;
        Sat, 23 Mar 2024 16:13:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-6fc3-1a00-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:6fc3:1a00::e63])
        by smtp.googlemail.com with ESMTPSA id h10-20020a170906590a00b00a46196a7faesm1375116ejq.57.2024.03.23.16.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 16:13:21 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gnstark@salutedevices.com,
	neil.armstrong@linaro.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/3] iio: adc: meson: simplify MESON_SAR_ADC_REG11 register access
Date: Sun, 24 Mar 2024 00:13:09 +0100
Message-ID: <20240323231309.415425-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_161324_872801_D377E38F 
X-CRM114-Status: GOOD (  13.23  )
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

Simply check the max_register value to decide whether
MESON_SAR_ADC_REG11 is present on the current IP revision. This allows
dropping two additional bool fields from struct meson_sar_adc_param
which previously had to be manually kept in sync. No functional changes
intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 6b2af0c2bbc7..8c1e542c0ab7 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -320,14 +320,12 @@ static const struct iio_chan_spec meson_sar_adc_and_temp_iio_channels[] = {
 struct meson_sar_adc_param {
 	bool					has_bl30_integration;
 	unsigned long				clock_rate;
-	u32					bandgap_reg;
 	unsigned int				resolution;
 	const struct regmap_config		*regmap_config;
 	u8					temperature_trimming_bits;
 	unsigned int				temperature_multiplier;
 	unsigned int				temperature_divider;
 	bool					disable_ring_counter;
-	bool					has_reg11;
 	bool					has_vref_select;
 	bool					cmv_select;
 	bool					adc_eoc;
@@ -995,7 +993,7 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 			   MESON_SAR_ADC_REG3_CTRL_CONT_RING_COUNTER_EN,
 			   regval);
 
-	if (priv->param->has_reg11) {
+	if (priv->param->regmap_config->max_register >= MESON_SAR_ADC_REG11) {
 		regval = priv->param->adc_eoc ? MESON_SAR_ADC_REG11_EOC : 0;
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_EOC, regval);
@@ -1031,16 +1029,15 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 static void meson_sar_adc_set_bandgap(struct iio_dev *indio_dev, bool on_off)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
-	const struct meson_sar_adc_param *param = priv->param;
-	u32 enable_mask;
 
-	if (param->bandgap_reg == MESON_SAR_ADC_REG11)
-		enable_mask = MESON_SAR_ADC_REG11_BANDGAP_EN;
+	if (priv->param->regmap_config->max_register >= MESON_SAR_ADC_REG11)
+		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
+				   MESON_SAR_ADC_REG11_BANDGAP_EN,
+				   on_off ? MESON_SAR_ADC_REG11_BANDGAP_EN : 0);
 	else
-		enable_mask = MESON_SAR_ADC_DELTA_10_TS_VBG_EN;
-
-	regmap_update_bits(priv->regmap, param->bandgap_reg, enable_mask,
-			   on_off ? enable_mask : 0);
+		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELTA_10,
+				   MESON_SAR_ADC_DELTA_10_TS_VBG_EN,
+				   on_off ? MESON_SAR_ADC_DELTA_10_TS_VBG_EN : 0);
 }
 
 static int meson_sar_adc_hw_enable(struct iio_dev *indio_dev)
@@ -1205,7 +1202,6 @@ static const struct iio_info meson_sar_adc_iio_info = {
 static const struct meson_sar_adc_param meson_sar_adc_meson8_param = {
 	.has_bl30_integration = false,
 	.clock_rate = 1150000,
-	.bandgap_reg = MESON_SAR_ADC_DELTA_10,
 	.regmap_config = &meson_sar_adc_regmap_config_meson8,
 	.resolution = 10,
 	.temperature_trimming_bits = 4,
@@ -1216,7 +1212,6 @@ static const struct meson_sar_adc_param meson_sar_adc_meson8_param = {
 static const struct meson_sar_adc_param meson_sar_adc_meson8b_param = {
 	.has_bl30_integration = false,
 	.clock_rate = 1150000,
-	.bandgap_reg = MESON_SAR_ADC_DELTA_10,
 	.regmap_config = &meson_sar_adc_regmap_config_meson8,
 	.resolution = 10,
 	.temperature_trimming_bits = 5,
@@ -1227,10 +1222,8 @@ static const struct meson_sar_adc_param meson_sar_adc_meson8b_param = {
 static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
 	.has_bl30_integration = true,
 	.clock_rate = 1200000,
-	.bandgap_reg = MESON_SAR_ADC_REG11,
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 10,
-	.has_reg11 = true,
 	.vref_voltage = VREF_VOLTAGE_1V8,
 	.cmv_select = true,
 };
@@ -1238,11 +1231,9 @@ static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
 static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.has_bl30_integration = true,
 	.clock_rate = 1200000,
-	.bandgap_reg = MESON_SAR_ADC_REG11,
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 12,
 	.disable_ring_counter = 1,
-	.has_reg11 = true,
 	.vref_voltage = VREF_VOLTAGE_1V8,
 	.cmv_select = true,
 };
@@ -1250,11 +1241,9 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 	.has_bl30_integration = true,
 	.clock_rate = 1200000,
-	.bandgap_reg = MESON_SAR_ADC_REG11,
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 12,
 	.disable_ring_counter = 1,
-	.has_reg11 = true,
 	.vref_voltage = VREF_VOLTAGE_1V8,
 	.has_vref_select = true,
 	.vref_select = VREF_VDDA,
@@ -1264,11 +1253,9 @@ static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
 	.has_bl30_integration = false,
 	.clock_rate = 1200000,
-	.bandgap_reg = MESON_SAR_ADC_REG11,
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 12,
 	.disable_ring_counter = 1,
-	.has_reg11 = true,
 	.vref_voltage = VREF_VOLTAGE_0V9,
 	.adc_eoc = true,
 	.has_vref_select = true,
-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
