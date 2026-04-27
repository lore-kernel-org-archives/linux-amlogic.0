Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21571FF8862
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2026 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IPXt7aHbkMxiryuCvg3D5jeiptoRm/Tvf2GerAjaO7k=; b=Ba6nfrNSPoZzIE
	Ayxj9zBsesOchn4jkezfsMShblPbouoCXoMj2/X7vWf2E78MMyo10m/eIQPjkENqAPBc0XZMYtoyy
	osoa4exw5IEIjdmnkUwwjBycdTtyNCEv1VzzqwTJsOvplIujs/fXazXaYSpkxNJ3bUGM/PtXckLwh
	GPk+ktME2iyIyvyyGbYjd6GCfnuxvXI2H2+nW+Ut9m/DjRgxolyVUwV6CJGF9/1hBMYvhRCp3asGv
	iHKxB8U9IUUw3wZbzx/+hqgyHU98hm8J5dGJq0/hXuMqCVfLFj/u7lci0OFYeoTVqAKygCiJvJGna
	RJrPem0vtVPqv1TnbVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK6q-0000000GnVy-26HM;
	Mon, 27 Apr 2026 11:26:40 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK6n-0000000GnVH-3ZNh
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Apr 2026 11:26:39 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f1f6103afso4600156b3a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Apr 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289197; x=1777893997; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRULM3iCCqXJE5g/4xg/Q1GMtMSkkTbAvywHS3WulkU=;
        b=nZ54fFwhdU3n+tmJtpOcjA0ZGExgTbsEFQd4oyav+zcKmgoTHnEC+AmeIUiDww7afQ
         n0puCsl+iaLKALjQTyAWByX1IJ6UJAQgf0/hk62Yx/haHr/F5uaKF2NG03tIN/BzWe3d
         wQJgrGFweHFOJ1xwnisXuVAtsGcuMVopHrU3lgxn+2LF4zAtWiCpVSJ3o8mfKr8cjdZV
         jZNjTOmRcghqlk/QDFy70XxAPN/mKVKbpkG6BK8CpPR7rtFvTfr/VPNemW5SMTbBDXzH
         J842HLGHWHKIv5wIwpTQgMp3G9Vm3z/b8LGKxk7hctgjDjn5oqeV0pwy4MYnSdJrOQtl
         UCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289197; x=1777893997;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRULM3iCCqXJE5g/4xg/Q1GMtMSkkTbAvywHS3WulkU=;
        b=EIJTTlAbJcejqAgVNFwpqyrZHmocX28HseLjW4CHtH5Zs8fAGM0GmtW+Dz0JyIETDu
         WEp8x2QlI9x7tCwJbEakz9qHCYrPjtbe0pDwMj6HDUU8TeHPfJaW9oTJ24xWJebsx7Pn
         Uk/9JtiLr7i8p1qW5y51OalMoc9CYfpNhUm/PTHw9I0chflGDWM6y8cSGENaPCBlQr4D
         bSZlNfF02fxBQLYaqTaMIZ4aLGii5FwmtcCZqUZKKMC+BiUWR1fucE7wXtvIxR/cZZI3
         FbEwpN2ynScFLEby24tOBdlPkEUdp58ScTX0ADUk0CIiBQj58yYAwUTR/7FRFE8x6w/t
         g13w==
X-Forwarded-Encrypted: i=1; AFNElJ/Aw3i+RV3YToE2psOX5fdTFZ48RLZF2owIKx5w73ESCPxxUaWEEzuX3/xIZCjf2pEMnBWD+XEuAtdIW3vL@lists.infradead.org
X-Gm-Message-State: AOJu0YwOiqatVpbrIeoaXmLGlCNXMGKMMdIoFgVPbJ0NDxrhMGuy5FVZ
	tMFvMoIqgGaXLerBG0kvHZLY6gn+KX+KxDt7jbZJXZ4YSU+6Ec5aQHB/UIHFF1cO2uc=
X-Gm-Gg: AeBDiesBiuRDEKYtwvm2mf2DROShmEbCARstMN4kVXEH8+UVqzmsd0+NYR07Oi7V637
	UhxCjMI5hmstys9ywaT+jmEKzTzSMF/a0YajVxxAwL0wUz/5sQeGHNi8iEltuLOFW7LBogGohSn
	ptKRo+pgiBgzto0ka6WDDS0ZL29ovms2uvw1ydtr9k0o8SWb/CUEPj9WE85ubcyKdgOtVWekMcl
	/GaxothZRlSGFC8+3gfagFE1hvAv0UvmfrybnNqb/eTfTZqeWiMPIY8xOKh4lVqdSrIzHTaFvew
	2kmaFrPHIy7W1hKtRRATB0EiQGHHappJEqJ5TZsoPIBdFj4OX2SvU2m3RysoaVShscjveLxYQRh
	n2yFt5QYlBV7+E3LEn6DRGFAFnx5gCFiTjHda7mzQWhzRHhqNo39tBrw9eDYgNlUKIkLYQIE5H3
	quG5C39R5/T6aqOhli+RLBXVmd80TURsiNASkg6xTLMh1SS0kegF0gvTV4jk41DeAacfnKq4UTF
	0dbAbUBSHotVKwd36OmNVB4HSp/UHw=
X-Received: by 2002:a05:6a00:3019:b0:82f:8b84:50c0 with SMTP id d2e1a72fcca58-82f8c973bf6mr46567455b3a.45.1777289196476;
        Mon, 27 Apr 2026 04:26:36 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm31504074b3a.40.2026.04.27.04.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:26:36 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 27 Apr 2026 19:26:31 +0800
Subject: [PATCH v2] iio: adc: meson-saradc: fix calibration buffer leak on
 error
MIME-Version: 1.0
Message-Id: <20260427-meson_saradc-v2-1-8981c56fd05e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOZH72kC/1XMQQrCMBCF4auUWRtppkmwrryHFEmTsR2wTUkkK
 KV3NxZcuPwfvG+FRJEpwblaIVLmxGEugYcK3GjngQT70oA1mlqhFhOlMN+SjdY7oZXtnUbf9o2
 Eclki3fm1c9eu9MjpGeJ717P8rj/I/ENZCikMtabH9oRONZdhsvw4ujBBt23bByPCEXmoAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777289193; l=1435;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=kEiZHKJqit4MGPY+b2Ld1n2nTYLDwv8qfRcBrOW6l7Y=;
 b=OgBTJVEKI4XrARc7cMlcqcU7gP8GsABoiiF9yu7IVEyF9y6+My2J18Bx+/02Bvsj4MdK4S/nU
 QSfZVGrBreDD30Ae6PJwlEGnW3XjAo8m8gDqfw2XihWA8ZQPKwIUPfM
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_042638_024266_C5491CDC 
X-CRM114-Status: GOOD (  11.39  )
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

Fix this by adding missing kfree(buf).

Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Switch to a minimal fix according to Jonathan's comment.
- Link to v1: https://lore.kernel.org/r/20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com
---
 drivers/iio/adc/meson_saradc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 23991a3612bd..000e39ca5c62 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -817,9 +817,11 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 	}
 
 	priv->tsc_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "amlogic,hhi-sysctrl");
-	if (IS_ERR(priv->tsc_regmap))
+	if (IS_ERR(priv->tsc_regmap)) {
+		kfree(buf);
 		return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
 				     "failed to get amlogic,hhi-sysctrl regmap\n");
+	}
 
 	trimming_bits = priv->param->temperature_trimming_bits;
 	trimming_mask = BIT(trimming_bits) - 1;

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
