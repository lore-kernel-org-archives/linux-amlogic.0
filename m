Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103F3C3A5A7
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 08:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Znsbugip0ELAbx5QV57JWETNPpbBVJ+xZuArsffikdY=; b=mE1k3t2axDV9aZ
	xYo8Znqp+jTu35y3xfoVcWlhxR8SRpB90VUlFtVZBYPXiqKzh7gIdjv1ggM2yJdrunCcxDTkASIKT
	tw1XztRNXyRqFAnsX7QtcOMHaUeJVtPtBn/j7/VqiH0OetXX7fwGUDaRm8nJfP9MUDhHJzg3uG9aD
	Uj0GVSvd/KosBowlZoYBF2GptrUVzi30R/VXDHofOEsJwssJ9GsJCHIVqoVW5PpXaH3mAwxKK5/gx
	xkSYfexeNs6SFj7zeItELrMRI/rGljEdtDu3f1UvkqHBzWrlHKSDyzXy5l3Pg9uIK6glxvxSKXgoy
	T18WRxLW5eXoIiF1bpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TPq-004vsV-4b; Tue, 06 Dec 2022 08:35:02 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TP3-004uwH-TP
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 08:34:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id d14so14296487edj.11
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Dec 2022 00:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+091FGCQ4rhzDvkB3AYfkA+OM7BJLCJxULLW5x6V0Y=;
        b=CMulTRGHBt8iZM34cI32BL92j4m/IGpI6bWJ+J8LmB3Bk9XlO8T2iVFu0JkuBVf5zj
         8Wr0rXr9XVkORpLTFHEUXRXlrgQds3a+N8OJcv8pyp5UWyhX043kgJV1IYaeEM1if5ls
         fcn1Xmbm29SFIoT4NocFl/j01Dm8x/9dT3pH/70rdtr7Eiq5IyhhHdZgMX3hHJEvfaOw
         uXWTFUo5QnhQaRm3Q8kBsLYm1Rz7Cg/AknnwM7TowRNpVAl9Bh3+7ivfKDgQHnnwTSgu
         669PfAVJ5wR334uRsypLCsWVOL5aYLZS1wPHtmj3LtsaCbwak5Q8yk1GI3C4z0kIfkyk
         FLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+091FGCQ4rhzDvkB3AYfkA+OM7BJLCJxULLW5x6V0Y=;
        b=4qPFLkQ7gO+2ZOtzRQlbc5FxaWVwTqxGEfWLi0zzq1IyM6+0uTr2yluklHI5ux+HXL
         fabmNtdTSNX2myZQZ7Y4aMO/mu+9G1XDuJE/PQui4shbAl30dm28nAVgsmBGM/4GIfmc
         u48SZTZP9m2lORAg+Q05fw+7pmNVNEAm8rGeD1TyZF8IorY1t1R2mryAnqpu0gLoglDr
         Deqb9aJNSFSdCm+OzMawVUnHyqCCjNVN7Ih4HqQw3ajPFYDHMPiPbYE15d92OHQOtS8Q
         FBhwtT4PHOG921bvEwzKVpl3dE4jXDG8VayVOqPSHnKNCCevsX3sL6BpFQg7inOkpEWp
         kClw==
X-Gm-Message-State: ANoB5pkaRvo4dTKIa8eu2q3/FBo/E7qPvysdFB2Scv9BN5czJj4iMmJi
	qDN4jbBA39SJ3M2p6atLAN75Jw==
X-Google-Smtp-Source: AA0mqf7xShBddJAwFF9w5fCy8BkqKLZeSqJlo3zmXsOR6j9nvha3NC93Pz85cGp3Hed4/H9Fmoo1IQ==
X-Received: by 2002:a05:6402:4516:b0:467:b88c:f3af with SMTP id ez22-20020a056402451600b00467b88cf3afmr1991786edb.24.1670315650207;
        Tue, 06 Dec 2022 00:34:10 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2017:359e:18ef:1c49])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b0078d9b967962sm7019390eja.65.2022.12.06.00.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 00:34:09 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 06 Dec 2022 09:34:02 +0100
Subject: [PATCH v3 2/3] drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
MIME-Version: 1.0
Message-Id: <20221116-s905x_spi_ili9486-v3-2-59c6b58cbfe3@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Carlo Caione <ccaione@baylibre.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_003413_980559_E0439AA4 
X-CRM114-Status: GOOD (  18.71  )
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

The pixel data for the ILI9486 is always 16-bits wide and it must be
sent over the SPI bus. When the controller is only able to deal with
8-bit transfers, this 16-bits data needs to be swapped before the
sending to account for the big endian bus, this is on the contrary not
needed when the SPI controller already supports 16-bits transfers.

The decision about swapping the pixel data or not is taken in the MIPI
DBI code by probing the controller capabilities: if the controller only
suppors 8-bit transfers the data is swapped, otherwise it is not.

This swapping/non-swapping is relying on the assumption that when the
controller does support 16-bit transactions then the data is sent
unswapped in 16-bits-per-word over SPI.

The problem with the ILI9486 driver is that it is forcing 8-bit
transactions also for controllers supporting 16-bits, violating the
assumption and corrupting the pixel data.

Align the driver to what is done in the MIPI DBI code by adjusting the
transfer size to the maximum allowed by the SPI controller.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 2ca7c59771f3..14a9e6ad2d15 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -43,6 +43,7 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
 			     size_t num)
 {
 	struct spi_device *spi = mipi->spi;
+	unsigned int bpw = 8;
 	void *data = par;
 	u32 speed_hz;
 	int i, ret;
@@ -56,8 +57,6 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
 	 * The displays are Raspberry Pi HATs and connected to the 8-bit only
 	 * SPI controller, so 16-bit command and parameters need byte swapping
 	 * before being transferred as 8-bit on the big endian SPI bus.
-	 * Pixel data bytes have already been swapped before this function is
-	 * called.
 	 */
 	buf[0] = cpu_to_be16(*cmd);
 	gpiod_set_value_cansleep(mipi->dc, 0);
@@ -71,12 +70,18 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
 		for (i = 0; i < num; i++)
 			buf[i] = cpu_to_be16(par[i]);
 		num *= 2;
-		speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
 		data = buf;
 	}
 
+	/*
+	 * Check whether pixel data bytes needs to be swapped or not
+	 */
+	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && !mipi->swap_bytes)
+		bpw = 16;
+
 	gpiod_set_value_cansleep(mipi->dc, 1);
-	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, data, num);
+	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, data, num);
  free:
 	kfree(buf);
 

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
