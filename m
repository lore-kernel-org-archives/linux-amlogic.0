Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB380EDEC04
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 04:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NmTi9e7Fnzpzdm3mKceAX9ZhmIPK8+x/3IrvJwYRTs0=; b=J2DohC2vYwJnLU
	Rw2u9pzmRYgRUPgtxafdq67qulYk98KYV5AepQS0E2JGvj8T9cxX5Vo9UO9MwVzPgLjB6rDIqBihx
	nDOwhLcLvohbBOzdGrLY7joJ5UvkRA5CMRYCZnZg8xSWq9pp0mqHJAyjksd3+j2XOTRpK6KoUdnye
	0TVfcvnjnj/lSuEqoHZ16WUipzTTU8acqKJXyiSzxMGD3KcqD6k+l1CbCec1HfSOzVzEHEjERa0/8
	9DcgRlF8zbDPAf633ANM7920uX8+R88YbnIiVwQR+zG644ReCpEZfbQNafnpPBhJwd4mQXfZi/MLl
	iVXClLp44m0WEzXyZfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdg5-0000000GQj8-17mR;
	Wed, 04 Mar 2026 04:17:41 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdg2-0000000GQiT-3TRp
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 04:17:39 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-78fc4425b6bso63158627b3.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Mar 2026 20:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772597857; x=1773202657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cj2evDlwnNkzABttd4YNchw6wVbpncuY/X8XS90rCSg=;
        b=NbyJEpcyF/20i2pn4jUok7EwNsiP4JHsOZ6CJ2Znej9fO2YsCCX3lr23yWvyA5q7JC
         zwvg7ISdrwdKyOS1Tzrc1+mx4Iqu5Hh2bgVdRMCJj8pEdJBUfHhB58vnll5XybnrV0NB
         FQ0qEQWxJaQUTJJMdAAFstQU5xYgwsT/dXpMCrgfdEXymuL98IO5M7Naw/YD63NlL8oX
         KM28qltba7czpzSXHOe7Q9xcm+/CtMBOgvq6Nu7dx9yM1CaH2vM1iO6G4fcBDb0EGcl1
         5oXI4QTvN1EDj2OvGKF1gMyVydymtQJw2yiNM8jkm2VS5FxluIuJqtMxyEH22zt9gBCd
         Up4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772597857; x=1773202657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj2evDlwnNkzABttd4YNchw6wVbpncuY/X8XS90rCSg=;
        b=V2EhVAFn5KbYSAJxll6FbWE+jsaNHXnPNRCN4X76kz+1ebne+BkvGA1byOXDKhLlF7
         r4xkLXyM8CDO6wo9AttnAD1xEn8V1vueK257NE3Rg3vAGnoJN3YA1KJWihnfNlMEL+B+
         v2FK9Z08V5kgxM6QbGbsWzbSPjoLI5dM8ndGlbGFyRsa/JtavbByJVO3T1/V3gB/PyUt
         qaKVLaxFFIyPJqDmyOZlc043o3pwZemKjqfkbVvMgECOTNHM7xfjb6+D5zfiFc0Wi3FM
         2BzXOwZhgjv4YZXA4ww5VM4S0sH2wQ0LRmGyWBvoqHdpUNfRyjp0J7HrMEQDAo5RRLPw
         s6IA==
X-Forwarded-Encrypted: i=1; AJvYcCXSB1XUFk30kpOg2+6dOCxdFBI3xI0lyXPkQ0o7LWt9x5AyI8grjpUiHpJoWWxQFgA/sVHnwySe1TG8facU@lists.infradead.org
X-Gm-Message-State: AOJu0YzQrchrtojWjVoyzzOBtZZcHrtGD1Nk88Ky8JmXDvgKTY/HYbzA
	4L15149LRZvFQ8OvVSHV0WzKkaPaB8dkQiY5j6CHA0nMT7F0vJWgdIyX
X-Gm-Gg: ATEYQzy4EPFjSvBv5ZFcTr9yyCeEl69ID5L1P2BOl6YVex0MBPC82rsH98OVpmr1syy
	UOSEjDYZXvH05sMgYsfADOGxOHyrDfpvSSh9hgJYSqZ1w1C4TT0dyZtMGGXxJEww3uYeTqvEtIO
	2l4t+l8GmwAz5GsWJJT2ze3pnoA2f44iGgtB6uiL2ljFR1M99y7iHyhT/VHJE1NYp/+g97ibaAx
	VeQrdBzqELwwG6mr+j8XQLCxQBWEkJbgMhsLiu06IwFbt637uTJPLx+xM64lw/0AxTvA5GSpd48
	QRNOp/dnTfwjRZKLoAU3RMiWTmXRiEefb9xTyyfxj4hoNgfRCeU8a+aVY5AZWgTo98FW8FaUSOK
	ck9cEq4OWMbE6qbMmODlqzxhkOecGO62nCMQM6OqcZCQpRKOW5kuUZ7x+ihUI8+GU0YY6TDcBiE
	CMjzftbdNLc5/8pyXtPG+3Rs30RLx/LKk/c35UYkKCMkn2zjlH/KfpyyNn8FOVa+JS
X-Received: by 2002:a05:690c:6983:b0:796:371c:7afd with SMTP id 00721157ae682-798c6b8a015mr5803047b3.13.1772597857322;
        Tue, 03 Mar 2026 20:17:37 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ad9045sm69989297b3.16.2026.03.03.20.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:17:35 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Xichao Zhao <zhao.xichao@vivo.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iio: adc: meson: no devm for nvmem_cell_get
Date: Tue,  3 Mar 2026 20:17:16 -0800
Message-ID: <20260304041716.7631-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_201738_874072_C779AC3D 
X-CRM114-Status: GOOD (  10.52  )
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

There is no reason to extend the lifetime of this post removal of the
driver when it's only needed in one spot.

Moved tsc_regmap assignment to avoid two nvmem_cell_put calls.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/iio/adc/meson_saradc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 47cd350498a0..ed91edf0e391 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -792,7 +792,7 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 	size_t read_len;
 	int ret;
 
-	temperature_calib = devm_nvmem_cell_get(dev, "temperature_calib");
+	temperature_calib = nvmem_cell_get(dev, "temperature_calib");
 	if (IS_ERR(temperature_calib)) {
 		ret = PTR_ERR(temperature_calib);
 
@@ -806,13 +806,9 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 		return dev_err_probe(dev, ret, "failed to get temperature_calib cell\n");
 	}
 
-	priv->tsc_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "amlogic,hhi-sysctrl");
-	if (IS_ERR(priv->tsc_regmap))
-		return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
-				     "failed to get amlogic,hhi-sysctrl regmap\n");
-
 	read_len = MESON_SAR_ADC_EFUSE_BYTES;
 	buf = nvmem_cell_read(temperature_calib, &read_len);
+	nvmem_cell_put(temperature_calib);
 	if (IS_ERR(buf))
 		return dev_err_probe(dev, PTR_ERR(buf), "failed to read temperature_calib cell\n");
 	if (read_len != MESON_SAR_ADC_EFUSE_BYTES) {
@@ -820,6 +816,11 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 		return dev_err_probe(dev, -EINVAL, "invalid read size of temperature_calib cell\n");
 	}
 
+	priv->tsc_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "amlogic,hhi-sysctrl");
+	if (IS_ERR(priv->tsc_regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
+				     "failed to get amlogic,hhi-sysctrl regmap\n");
+
 	trimming_bits = priv->param->temperature_trimming_bits;
 	trimming_mask = BIT(trimming_bits) - 1;
 
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
