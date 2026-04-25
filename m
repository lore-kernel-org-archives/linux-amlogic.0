Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8769DFF885C
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Apr 2026 16:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nfxGC22xA6gnoP8kp2bXQx3xkc/QtwsRhrjdXzF7DFA=; b=qxXyCmGz7/rJZ4
	P/44ZYRhzDOzZ8qrfvFwGnHAQHoFiJiwW4wsEAGnXZ3PRAa88NP/9Zz0jj+jEx3PrFh8N/StBOiO0
	ao58ROSgEz5yhAvnuMiZo/1EUTrc6UGSAYfkTI4ukN7RE/gd524hx/w5xs0Fm+vxUoS/uOvZDh0lc
	rbUR/rpZ0Ygs/gWPgdDPXtOdy7BrYWoEMxLKaAuChGLTy2zjYhcDpzyDblfpb12p1bRX1OZnGG01A
	fVfzsNW6IWpV/R18PAaiCmsI8H5rAkB2ltLaWHHIjxu0tVh5YshHRvMUNMImcbCsuB21Nr51CoXFb
	CLUjb0VGeYPErMmOnzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfXk-0000000EZBg-24ZI;
	Sat, 25 Apr 2026 16:07:44 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfXi-0000000EZAa-0Cgu
	for linux-amlogic@lists.infradead.org;
	Sat, 25 Apr 2026 16:07:43 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso6933521a91.1
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Apr 2026 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777133261; x=1777738061; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iD/M1fyNXTAwfQKzUaSJw2dnydcQ7vF9bXiqIToJulA=;
        b=rNnB8FfHUCDriYjoPteE1PtjvI1/OPf4UwhetOtCmcdGMoMLbMQdSUAEtD0EfuuccW
         jXDtjemf6UcO1QHwIOg/gjxV1dINF/QBIiTACIVPRvJMVTST+3XiEZRqhdSJLeY5zv09
         d7r9JN59qEwYHw9e+rLM7fVAg6mvfoA7ujbU3vhynj/BF3R5BKfwVhIhPE7qCpolyYjU
         Q5XigVk+c1QskExanXRkQ+E9Ftig6eO3YRPaO5wsT6g8MOKQd1lsKym4T10lFiiQAJZd
         sUKnawY1jbzY0SJ4kUiVhdqqAo1opLvtTwq8N96Trg4O+RGJrrVn8jELzukSK0umPi+C
         9+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777133261; x=1777738061;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iD/M1fyNXTAwfQKzUaSJw2dnydcQ7vF9bXiqIToJulA=;
        b=C2z850749gm8zTf98ErKoNibsz01+5yV5cjBmkcQp5jghBY+XwOJeSg7fq00OFKG5g
         7RnlFOFYHeZ/o6UToz44yfxxBemwfzPPrWD6hoZUbwRn7NTY3OD3jE5cCwjYI+yhAmll
         p2pZkjAWzudsOEb8t9/12JVykUkKQXMgSdkMpg21bXYxk3Mm61LTYVndwGdKOFf9onV9
         t8Vtr0p5VzVhiG7UtcC8HQX6jCEkDGeQNBmWjEtFJzR8BOVS5tOe9dRzOwWgu0A9cZPR
         PTj3BXF+DSqZoEPjkSCAmBJ3FDt2yNf0/3RLUIQvTJzHk2C9PpPB1wYgJYbaa8dP8Asd
         oH4g==
X-Forwarded-Encrypted: i=1; AFNElJ/fP44xyLaW6EOtOpRbt2qcaSICDNf2MOdBZm5Ukit2BKYHUaMCICoXTGmTfYADNsb/1jfsN3tk27CDn13n@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5z9dGQ4u57u9C9SmQX78wfxXPZ0Gqq2S3cyQhdXUB/JT01uvJ
	0VLU+x23kBcv5n86p6NNy4KRR01PlSKX+RSoamieCw+WpF2ox8RSDnWq
X-Gm-Gg: AeBDietlKLpMxNTvCIBnyazm+VYA06u+nxdbhvHaBNvrFsvsRjub5ws/V5BVjswqk/t
	fXUWtK0Qy/G+7A+155hCucdnxdaGBIgCAHH4R9RtwWZCjGxvmK9o1cyXGfrUaf17/p2w9BmpFTJ
	jSnsX0byqsehCJuiA9o28tUoRWaNYtx+Dx5xSPfhY9C1mFPgshRprQVk0yb71tah2xskRhgVPIy
	ooRWewcicurF843Xxq5GYk8VBMRqkO9JGTOSUZYMqGH4c6Ln5wg7GwIfAEnZbme22PAHdeAgzwK
	v2qFb6FJbgAiXkP5V7s1ItkKTq4jyJxeK5m7Fmj23o5ZnO2GuuY6JCe9axWzX4EuuUZ7Uo/c010
	97pdvIAIs13JS7QBq+Kigkg0kz4SUspQkAaB23U4Ew6SDaYgl+5a9VeZ53OuzTlNuj8ocNXRwig
	7ozuJLWWyJ6wm6Nrt1bDLlKbY19quyc/rMTOCDJid0F2d+lPJcsPiUDIyT3wVLQ1sfm8AI4G6DR
	cOvySVnn0x4yQj8TxrihOQsJ6B7iaGKs4Dz517XGg==
X-Received: by 2002:a17:90b:35d2:b0:35f:bbc0:e570 with SMTP id 98e67ed59e1d1-36140228e16mr38201383a91.0.1777133260516;
        Sat, 25 Apr 2026 09:07:40 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f3e5sm21431182a12.5.2026.04.25.09.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:07:40 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 26 Apr 2026 00:07:24 +0800
Subject: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
MIME-Version: 1.0
Message-Id: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
X-B4-Tracking: v=1; b=H4sIALvm7GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNT3dzU4vy8+OLEosSUZF1Tk8SkZFOjFMskY0MloJaCotS0zAqwcdG
 xtbUA8wWlq14AAAA=
X-Change-ID: 20260425-meson_saradc-54abc52d9b31
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rosen Penev <rosenp@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777133256; l=2229;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=KjIIBYWTn6p4BuyO0upgqtz3U+Oi6OBq7Ml4SOzFSuc=;
 b=Vjn5Dax+7/hZTXWQgOoS9q3jBjBGAaFI0EgVquwXjkkRPefUzhwtIOndDXMCrGBT4d0Tqueia
 Q0c34yJMIvXARu6F1W6/gneXeBQgC3XHQ9lvOdScnQGncIwqotb2Oua
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_090742_145539_7EE83325 
X-CRM114-Status: GOOD (  10.27  )
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

meson_sar_adc_temp_sensor_init() allocates a buffer with
nvmem_cell_read(), but the old code leaked it if
syscon_regmap_lookup_by_phandle() failed.

Switch buf to __free(kfree) so all return paths release it.

Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/iio/adc/meson_saradc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 23991a3612bd..9708ddcc4919 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -786,7 +786,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
 static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
-	u8 *buf, trimming_bits, trimming_mask, upper_adc_val;
+	u8 trimming_bits, trimming_mask, upper_adc_val;
 	struct device *dev = indio_dev->dev.parent;
 	struct nvmem_cell *temperature_calib;
 	size_t read_len;
@@ -807,14 +807,12 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 	}
 
 	read_len = MESON_SAR_ADC_EFUSE_BYTES;
-	buf = nvmem_cell_read(temperature_calib, &read_len);
+	u8 *buf __free(kfree) = nvmem_cell_read(temperature_calib, &read_len);
 	nvmem_cell_put(temperature_calib);
 	if (IS_ERR(buf))
 		return dev_err_probe(dev, PTR_ERR(buf), "failed to read temperature_calib cell\n");
-	if (read_len != MESON_SAR_ADC_EFUSE_BYTES) {
-		kfree(buf);
+	if (read_len != MESON_SAR_ADC_EFUSE_BYTES)
 		return dev_err_probe(dev, -EINVAL, "invalid read size of temperature_calib cell\n");
-	}
 
 	priv->tsc_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "amlogic,hhi-sysctrl");
 	if (IS_ERR(priv->tsc_regmap))
@@ -835,8 +833,6 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 	priv->temperature_sensor_adc_val |= upper_adc_val << BITS_PER_BYTE;
 	priv->temperature_sensor_adc_val >>= trimming_bits;
 
-	kfree(buf);
-
 	return 0;
 }
 

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260425-meson_saradc-54abc52d9b31

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
