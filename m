Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142B9CD11DB
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2024 23:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2XepbfNTqZYfGiTJdH2pvzgLIkl9279m7FlKF+80us=; b=wRMVRkssjErZJT
	ByZbU4m4bjL7I1JaK+0rAYYlm81+FyQCdcTEmcYVAcgeujIxViN+uNk0tpc8g7FzXDMPkUxKDqndf
	ma1hg3TLohiFubnS7lem9yffQhvlG1FmegjNIgieL4aDjVqjnrTFVt4GdL/X3XFZfUAMB2pYWW/OF
	2tI8D8FESbKvr7kiLX0JTDWpne2cqpdh5l36ahe23Mnq3KH+z7Cn604dn4GCExRc8P2rbzHDLEFww
	oNrnM0DI80Fwu+fqbMtRakS3/JXqsCH7P30CXFfw4MtigsJFiXkY6p7DVx84/+LG2SF75FDozSxzI
	Id8OpkSSn7WyB3TKeWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roAYJ-0000000BMpz-20GM;
	Sat, 23 Mar 2024 23:13:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roAYF-0000000BMoA-2HQG;
	Sat, 23 Mar 2024 23:13:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a4751063318so13391166b.0;
        Sat, 23 Mar 2024 16:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1711235601; x=1711840401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pl5FSLTmapATQPm5Ns2r32N7hJqg6smdpvXe4R0K3sc=;
        b=WQpBnHLePDWDFGbN/kaGXF7lYf4+tLyqe5xm/CAOG17sWspoZyBMt9qK4ViUmtp479
         b1wVtr3vbci0kWbxEe2U7EsW4M4maYBxv7SUB4n292xY3OmheQvKfgi/3tJcsMZUZuew
         ucoDsMC94Tz9QiQdYcXh4xOGcKlh89V2T7sBc89/OXJRN6enbVSPD9XsqxM6ibAeGuHS
         +hvgdEvYPCxsW0TcngOpL79tSrhxlYh0kjDRh5E3zaPu68+GG/lgSYopOV3TOVqgTkJF
         ariOTc/H+ze/2FR8yJDuM3m1t53CxLDLjIvaXC08fPoS0cZbZqrX7qC2wagUYf3MYdgy
         YnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711235601; x=1711840401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pl5FSLTmapATQPm5Ns2r32N7hJqg6smdpvXe4R0K3sc=;
        b=h4rfX/+kccWv3Gqnr/sJfwuWsTwEPVJwmZOSQOFL38SEacrLC7PpC72hll2aBWBIV8
         2x0em0gIJ3+Qwd43iifvwJ2RdwaCFAzrEtFMErGD+LJZ08KThuEDquu5H8aPD4fwRR84
         Vqule0aUhlgI+R7qNY8/qSdIFJRWYInlwjOdN4RaDsImvRgJcoP9GMh47K8E3KdN4x2j
         SEkW/RQaqtFW6bTCSLypxH61aP1Lqu0fJTjQFFE7GM11CakoO10HpzWiR4hpjjMQy6z9
         lJR3Symmt4xqnEx/u6bHf/pWipVB/6YzJV4+CGTLQxJBQoQe6TDCa+qbwDsQG2/f/wI7
         tSVw==
X-Gm-Message-State: AOJu0YwJGTwSg5VbCCP+6wxi5RZJSpDvBrJlmpECFjuhX7LlysJtSHZm
	Om14IPMfd5+96HmO9/QwApuBoAzKcyMbWPb6dYiiFmeI2AwCXyJd/WJPZR/o
X-Google-Smtp-Source: AGHT+IHkSp+Kp1Rin3dfE++TtJyWaSTFTXA0kMhD7ktC/2pkXCOs/6AXmhSKiWjCvHMi9cpI+ukKjw==
X-Received: by 2002:a17:906:fa14:b0:a46:c8e3:c9b9 with SMTP id lo20-20020a170906fa1400b00a46c8e3c9b9mr2059741ejb.42.1711235601112;
        Sat, 23 Mar 2024 16:13:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-6fc3-1a00-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:6fc3:1a00::e63])
        by smtp.googlemail.com with ESMTPSA id h10-20020a170906590a00b00a46196a7faesm1375116ejq.57.2024.03.23.16.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 16:13:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gnstark@salutedevices.com,
	neil.armstrong@linaro.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/3] iio: adc: meson: consistently use bool/enum in struct meson_sar_adc_param
Date: Sun, 24 Mar 2024 00:13:08 +0100
Message-ID: <20240323231309.415425-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_161323_610773_BE6CCB3D 
X-CRM114-Status: GOOD (  13.74  )
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

Consistently use bool for any register bit that enables/disables
functionality and enum for register values where there's a choice
between different settings. The aim is to make the code easier to read
and understand by being more consistent. No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 47 +++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 2615d74534df..6b2af0c2bbc7 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -156,9 +156,9 @@
 #define MESON_SAR_ADC_REG11					0x2c
 	#define MESON_SAR_ADC_REG11_BANDGAP_EN			BIT(13)
 	#define MESON_SAR_ADC_REG11_CMV_SEL                     BIT(6)
-	#define MESON_SAR_ADC_REG11_VREF_VOLTAGE                BIT(5)
-	#define MESON_SAR_ADC_REG11_EOC                         BIT(1)
-	#define MESON_SAR_ADC_REG11_VREF_SEL                    BIT(0)
+	#define MESON_SAR_ADC_REG11_VREF_VOLTAGE		BIT(5)
+	#define MESON_SAR_ADC_REG11_EOC				BIT(1)
+	#define MESON_SAR_ADC_REG11_VREF_SEL			BIT(0)
 
 #define MESON_SAR_ADC_REG13					0x34
 	#define MESON_SAR_ADC_REG13_12BIT_CALIBRATION_MASK	GENMASK(13, 8)
@@ -224,6 +224,11 @@ enum meson_sar_adc_vref_sel {
 	VREF_VDDA = 1,
 };
 
+enum meson_sar_adc_vref_voltage {
+	VREF_VOLTAGE_0V9 = 0,
+	VREF_VOLTAGE_1V8 = 1,
+};
+
 enum meson_sar_adc_avg_mode {
 	NO_AVERAGING = 0x0,
 	MEAN_AVERAGING = 0x1,
@@ -321,13 +326,13 @@ struct meson_sar_adc_param {
 	u8					temperature_trimming_bits;
 	unsigned int				temperature_multiplier;
 	unsigned int				temperature_divider;
-	u8					disable_ring_counter;
+	bool					disable_ring_counter;
 	bool					has_reg11;
 	bool					has_vref_select;
-	u8					vref_select;
-	u8					cmv_select;
-	u8					adc_eoc;
-	enum meson_sar_adc_vref_sel		vref_voltage;
+	bool					cmv_select;
+	bool					adc_eoc;
+	enum meson_sar_adc_vref_sel		vref_select;
+	enum meson_sar_adc_vref_voltage		vref_voltage;
 };
 
 struct meson_sar_adc_data {
@@ -982,14 +987,16 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 				   MESON_SAR_ADC_DELTA_10_TS_REVE0, 0);
 	}
 
-	regval = FIELD_PREP(MESON_SAR_ADC_REG3_CTRL_CONT_RING_COUNTER_EN,
-			    priv->param->disable_ring_counter);
+	if (priv->param->disable_ring_counter)
+		regval = MESON_SAR_ADC_REG3_CTRL_CONT_RING_COUNTER_EN;
+	else
+		regval = 0;
 	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
 			   MESON_SAR_ADC_REG3_CTRL_CONT_RING_COUNTER_EN,
 			   regval);
 
 	if (priv->param->has_reg11) {
-		regval = FIELD_PREP(MESON_SAR_ADC_REG11_EOC, priv->param->adc_eoc);
+		regval = priv->param->adc_eoc ? MESON_SAR_ADC_REG11_EOC : 0;
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_EOC, regval);
 
@@ -1005,8 +1012,7 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_VREF_VOLTAGE, regval);
 
-		regval = FIELD_PREP(MESON_SAR_ADC_REG11_CMV_SEL,
-				    priv->param->cmv_select);
+		regval = priv->param->cmv_select ? MESON_SAR_ADC_REG11_CMV_SEL : 0;
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_CMV_SEL, regval);
 	}
@@ -1225,8 +1231,8 @@ static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 10,
 	.has_reg11 = true,
-	.vref_voltage = 1,
-	.cmv_select = 1,
+	.vref_voltage = VREF_VOLTAGE_1V8,
+	.cmv_select = true,
 };
 
 static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
@@ -1237,8 +1243,8 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.resolution = 12,
 	.disable_ring_counter = 1,
 	.has_reg11 = true,
-	.vref_voltage = 1,
-	.cmv_select = 1,
+	.vref_voltage = VREF_VOLTAGE_1V8,
+	.cmv_select = true,
 };
 
 static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
@@ -1249,10 +1255,10 @@ static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 	.resolution = 12,
 	.disable_ring_counter = 1,
 	.has_reg11 = true,
-	.vref_voltage = 1,
+	.vref_voltage = VREF_VOLTAGE_1V8,
 	.has_vref_select = true,
 	.vref_select = VREF_VDDA,
-	.cmv_select = 1,
+	.cmv_select = true,
 };
 
 static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
@@ -1263,7 +1269,8 @@ static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
 	.resolution = 12,
 	.disable_ring_counter = 1,
 	.has_reg11 = true,
-	.adc_eoc = 1,
+	.vref_voltage = VREF_VOLTAGE_0V9,
+	.adc_eoc = true,
 	.has_vref_select = true,
 	.vref_select = VREF_VDDA,
 };
-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
