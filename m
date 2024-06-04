Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FBAC25B74
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 05:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgM8d8SwHhCqFDfvYBtqdUW4OJWCUpOxAPVZ/o/ii3g=; b=e9kdRiCG9wUFCA
	7dficHdAVB2m4OBDrZV6UUs/JFGXyeVspIWtAOkIbH++RYpIYBIKufwHklpRWJiG7AZjFMt+7v5Hg
	ICXDGLWlBEVOQF5naP2VUvDV/CSuFwWZxuHGGIx7pPuwqVw9NlwHSdNvTJ8eqgpaYnesX3ZsuyhI9
	5lnmvyLdLb1lghibcxlFQnLfSS5QkxTNMohh69XwvSK6T8OnSuEoOhI7rilSj3L5G5Vtqm+pVqPwm
	886OFAjz6O+w0oyJ/BGKdDfnxa4eTPc6GrBzIxrLGYBL6yL8tADgxsIOGd3GSekUC9szcqjIXL9u6
	EpBQ6YIoLN7U9sqrQgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEN87-00000001JuX-42Jl;
	Tue, 04 Jun 2024 05:54:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEN84-00000001Jsd-2J67;
	Tue, 04 Jun 2024 05:54:41 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-57a85cc2d96so45438a12.2;
        Mon, 03 Jun 2024 22:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717480479; x=1718085279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNXQ/SoJYaWo0NJj93vx8GPkV2wEKcXWEow45UeQsg8=;
        b=mduG5W+byrm4UaZk3YmrzWryF6xyzlm4g0Nw0x22dA2N1ISaSh/Pt5ZsfKx3BEdo29
         SR6rABXzDXbTfAMUw2/rVtsnwn5LKTQrisXIks2lDkUNa+C2wQVSMJPHbsE73kPQTeMK
         JIb3vir9ZCO7ZoohKo7vWiqvLVJRd0mOb5Le3k6Bu609p+YtGCywEqjkLI/7b+jf4708
         v+fsTM25IHMRU1i3+QZLRiaVApj8iyL29ZEUN2elpz5GG6XBAhFXJw+mVbL1QfoeaAdT
         1JP2qTbphwIYTwp0t1wBEm2cBNph/vohxrAvLeghP9EwBB+hPTBwIa1uzwBpkDuccP22
         gqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717480479; x=1718085279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNXQ/SoJYaWo0NJj93vx8GPkV2wEKcXWEow45UeQsg8=;
        b=ZSHJ0s+fjSZ87v2zrJbPvHZ1utBHqbzuCuR0Mo/e3WA8G8GPI4By9EOGqY8w+911JN
         ROYfWdiZpweXcdfPtN3DIR/HBY/M0Qudwpx5nGgjiEmtqZL0UPFDhdL787SC8xtsZ+77
         xw7ZkpK3tUZjgunm/vKzbmiLyKQcEarmrLhvRbrvdBZdHGTRkiGWhPKJHJYy2LLS454x
         DMbgT5H9nwjs4I1utQmSxUEExc1iMLPzoJh37QoZcdC3kL8go2Mx2oatS2n4HL7NR/Wr
         /4DyIGpyXIpxyNwqxFLR9NxmCbBBoTlTSAoNQg8+97mpAf1d6wQB+O+8vBZh3IuNHNi5
         ikZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7cV1VVSFUv2tUw5zBYbHSgKUJAaP31u/g+QO7ocHwOWBZmerrHPsiJaYUx5UjUjv2VEuKLzvTdyCr/pPLLIy6cceZiT7+UPfIJGT0ZbqLRPnAjfSHfCql5/Yg3K1ceQnci3FAjZueRoTkSiiXCIq/73rfV+/QOA==
X-Gm-Message-State: AOJu0YzmSsT+CSaO6x/caUnsNUS5lRpee78X6d1Y2uU5IXgBDGg+PbAI
	K7Xeayh1/F0VrvtADtYBUDBH/y0TaWqJgZD/CnPMkoCQBnjf0k3b
X-Google-Smtp-Source: AGHT+IFvO3hGcwGjzkhM2BCfkJy/zitS1v/oJjTYW85m+xbHO4VeID9IRH5+ElX1GrCzxo+B/yunjA==
X-Received: by 2002:a50:9ee1:0:b0:578:36a2:7073 with SMTP id 4fb4d7f45d1cf-57a36450a36mr7711221a12.29.1717480478704;
        Mon, 03 Jun 2024 22:54:38 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a4fc842b5sm4895643a12.71.2024.06.03.22.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 22:54:38 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] iio: adc: meson: add support for the GXLX SoC
Date: Tue,  4 Jun 2024 05:54:31 +0000
Message-Id: <20240604055431.3313961-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604055431.3313961-1-christianshewitt@gmail.com>
References: <20240604055431.3313961-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_225440_618546_C72CBFB9 
X-CRM114-Status: GOOD (  14.27  )
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

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

The SARADC IP on GXLX is identical to the one found on GXL SoCs: except
GXLX requires poking the first three bits in the MESON_SAR_ADC_REG12
register to get the three MPLL clocks (used as clock generators for the
audio frequencies) to work. Register bits are from the vendor kernel.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/iio/adc/meson_saradc.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 13b473d8c6c7..200eb8271617 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -160,6 +160,11 @@
 	#define MESON_SAR_ADC_REG11_EOC                         BIT(1)
 	#define MESON_SAR_ADC_REG11_VREF_SEL                    BIT(0)
 
+#define MESON_SAR_ADC_REG12					0x30
+	#define MESON_SAR_ADC_REG12_MPLL0_UNKNOWN		BIT(0)
+	#define MESON_SAR_ADC_REG12_MPLL1_UNKNOWN		BIT(1)
+	#define MESON_SAR_ADC_REG12_MPLL2_UNKNOWN		BIT(2)
+
 #define MESON_SAR_ADC_REG13					0x34
 	#define MESON_SAR_ADC_REG13_12BIT_CALIBRATION_MASK	GENMASK(13, 8)
 
@@ -327,6 +332,7 @@ struct meson_sar_adc_param {
 	u8					vref_select;
 	u8					cmv_select;
 	u8					adc_eoc;
+	bool					mpll_clock_bits;
 	enum meson_sar_adc_vref_sel		vref_volatge;
 };
 
@@ -1009,6 +1015,12 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 				    priv->param->cmv_select);
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_CMV_SEL, regval);
+
+		if (priv->param->mpll_clock_bits)
+			regmap_write(priv->regmap, MESON_SAR_ADC_REG12,
+				     MESON_SAR_ADC_REG12_MPLL0_UNKNOWN |
+				     MESON_SAR_ADC_REG12_MPLL1_UNKNOWN |
+				     MESON_SAR_ADC_REG12_MPLL2_UNKNOWN);
 	}
 
 	ret = clk_set_parent(priv->adc_sel_clk, priv->clkin);
@@ -1241,6 +1253,17 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.cmv_select = 1,
 };
 
+static const struct meson_sar_adc_param meson_sar_adc_gxlx_param = {
+	.has_bl30_integration = true,
+	.clock_rate = 1200000,
+	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
+	.resolution = 12,
+	.disable_ring_counter = 1,
+	.vref_voltage = VREF_VOLTAGE_1V8,
+	.cmv_select = true,
+	.mpll_clock_bits = true,
+};
+
 static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 	.has_bl30_integration = true,
 	.clock_rate = 1200000,
@@ -1293,6 +1316,11 @@ static const struct meson_sar_adc_data meson_sar_adc_gxl_data = {
 	.name = "meson-gxl-saradc",
 };
 
+static const struct meson_sar_adc_data meson_sar_adc_gxlx_data = {
+	.param = &meson_sar_adc_gxlx_param,
+	.name = "meson-gxlx-saradc",
+};
+
 static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
 	.param = &meson_sar_adc_gxl_param,
 	.name = "meson-gxm-saradc",
@@ -1324,6 +1352,9 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
 	}, {
 		.compatible = "amlogic,meson-gxl-saradc",
 		.data = &meson_sar_adc_gxl_data,
+	}, {
+		.compatible = "amlogic,meson-gxlx-saradc",
+		.data = &meson_sar_adc_gxlx_data,
 	}, {
 		.compatible = "amlogic,meson-gxm-saradc",
 		.data = &meson_sar_adc_gxm_data,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
