Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE239C10F1B
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Dec 2022 09:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BvI492TZEYdVnowJbZBICYC8UOrEUPKDWNJ7BjvDfs=; b=TfHPhN/aD7VQio
	Dcycvyl6dmfNyx80ikkKt7w8QRCiae1mjVlF6maDdX6ozV6CwrLPHtRrsIGnJpFAHjaHuD3tc/Xva
	NPzFGEAMXIi4eOh+Cb0RR6mR7+bZ0UXvEZIKjgWrQ/fv7+9AHnCU0AXerwSpXLk+U6d7mAj2vzV/W
	WzqSJSU8nhVujTcG5+Vg5wFeuj82PsQqKfN0iQuOY2XFy2pHX2BvVd4bsLErK9IL402MjxmLM7sac
	+wcAWZ2LDiv83gbWJhspFFulVNX8I/gKLAInWuCBVMMLQspWwYA6kSECITcqWDWA8SjPCTeH6Bsly
	U1X8u+MOtKRzJLNZR/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7C52-00AzDI-88; Mon, 19 Dec 2022 09:05:05 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7C2y-00Axyj-Bs
	for linux-amlogic@lists.infradead.org; Mon, 19 Dec 2022 09:02:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id fc4so19759048ejc.12
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Dec 2022 01:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqYmIYoxTMMpoYQgw16ovQhh+oEOozpYMDvGaahlUYc=;
        b=TQKO3zLxYXBYDTiW46AltPoen3RSbIyB8k2VaIuFnkph0BiNvBuGnifXGOY+zKrLEI
         LO5sFtmIdDq2PxEMYgnOvt2kONxeu0CuvZRF7RG/Gb6oTqzzUuJb9rGcEoDCqV3AfH8D
         qAURFDAeigb5FUW7znBFd1NHo9RBqP5xErBkXZNwvBgtXINDIsMZb8RgnpocJwD+jkf2
         VUdQamL9R5duw9muX5u3+cYEnVdypu8N/js/a0YoywML0zu71Y0/HOQnRBi/T3dGWZ2F
         Bj5NawWiidI5fAUlI1sNlIVVeHkSlVpIpZHKEllff2+QyHvAPo0tSDNC02X/hcvuvfUF
         NETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqYmIYoxTMMpoYQgw16ovQhh+oEOozpYMDvGaahlUYc=;
        b=CQ9IdIxUA4RM7oOss6vhwxwFN2b3tbeIs8QEJgYJ9BJvL356xH9C3LHRh3aidK6Pbm
         KJLh7g+hcy/nsEtfTsmtgo3TYeLs3uvDpm3OSxIBRlgA7mrZ3i9x8w/dwZrnLML9NUb7
         GKlplt+Ft1hjMjtcW5Xy2+506Y4UUpP6gpzBSuLCezOruNFi9Hval0pQkkAkjxliEZfR
         +lld+umKzCtSInJr7Xx7J/aWky3W1osB32TjUVuercYQYRmrJDCBbAMZ6GrPACR+jQth
         tvPF3QCyjFcwTvjqoKI2lVgdMNRNuaJbD/UiYjQf5MmUcVxX9VW0Sta/DDRiWKrZfpzx
         I0aw==
X-Gm-Message-State: ANoB5pkFxr+Oqme2x/kHT80g85e8SpOXGpzclOCKvRTZJnrdGcOjArsK
	pcZ0FtKXsAxSPRNLFErG4ZbCVQ==
X-Google-Smtp-Source: AA0mqf4NSk7Yw/HcS1h8rMvyHtywLl/r5oAAdXCCDdnKAMEYPX1/1IxBA282Q7E2z2acv/RmzDLBFw==
X-Received: by 2002:a17:907:910b:b0:7c1:1c5:c7cd with SMTP id p11-20020a170907910b00b007c101c5c7cdmr28846533ejq.5.1671440571173;
        Mon, 19 Dec 2022 01:02:51 -0800 (PST)
Received: from [127.0.1.1] ([2001:b07:5d39:f336:a0ba:cfa5:2107:c2c4])
        by smtp.gmail.com with ESMTPSA id u11-20020a170906b10b00b00781dbdb292asm4082721ejy.155.2022.12.19.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 01:02:50 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 19 Dec 2022 10:02:38 +0100
Subject: [PATCH v4 2/2] drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
MIME-Version: 1.0
Message-Id: <20221116-s905x_spi_ili9486-v4-2-f86b4463b9e4@baylibre.com>
References: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_010256_513487_F120DB7C 
X-CRM114-Status: GOOD (  19.22  )
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
index 8bf0dca0b05d..6f03531175bd 100644
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
