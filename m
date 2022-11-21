Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDB1C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Nov 2022 09:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dq8RnLMTr5Y5aq6i/sobFNxgAXEflNPq2EQI7NJGCPs=; b=HTykqWoRk73bVm
	CmfythI9G93F8jMXsamBPaUYn/J56Z5tqOd0+iiwf0IXP4H/30XUCz7+JfhAu7gPfRanifAL0f3v2
	MdXmlnEa7C7yup580TgLd9RH5b4v2rcwrIfBkX1Uhojik0lnf+GE/wVTKz/6royKQr0sluJqS0ITz
	Lr/evTvwyospPAWaA8GSXYrQeyqRC+3FwEknO4PRN4T6nZTDk5XOGnvdPk8fG1YZpAQ7cpZLNoCXW
	sGawrOGEHLI/JVWScecF0tkhQxyiUyUcUXgSafPuGjWJFAB2aYZv8weTpbnfkGqZxkWC/Vi/Mmnzn
	1n3mfbRtZSaInw9U9Wlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3KR-00Buka-0M; Mon, 21 Nov 2022 09:43:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3KC-00BuZi-Fo
	for linux-amlogic@bombadil.infradead.org; Mon, 21 Nov 2022 09:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Hu5U86ige5HyMDl6UUjo7RBdCuH6co9yADRt72Y/8MY=; b=K6GB7OoHleuF3HJwSU7MCpG3YR
	1pde+JjeNFGJ/LiLFODqY3mRpeY/POIksxzJ8OIm6tQVMdwyC5lxckdMEltHceTQmL0SRqO0QNFnf
	yT1skxQz1GbMcjipwpzSWDXnj0OhiTSTaZT7SmEO80z1aeyErd+OEahZ++4FmU5SrF2TCar6hRa/t
	lMumJbGMEOzGlSH2koESet7mcwbcC+ZvM6CDdAtmEgFoXOTYbl8hHdRazDndjJDuf3CrLFR5TbPOq
	ZNQRlS7vGUE7J7wSujZW8AX+4LKIlnGmLPpezv3hKFOusI5p5pemEnyi+MwqFsTpXYeSfNMEfhm2J
	XqFmlNiQ==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3K8-00347o-2q
	for linux-amlogic@lists.infradead.org; Mon, 21 Nov 2022 09:42:46 +0000
Received: by mail-ej1-x631.google.com with SMTP id bj12so27065244ejb.13
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Nov 2022 01:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hu5U86ige5HyMDl6UUjo7RBdCuH6co9yADRt72Y/8MY=;
        b=hA9fcWmto4ybP9K5GSKv+Pfqt4s/xOpxBEdTWZGxoXk6kt2zLckX/Yk82YP6m+DRQH
         sIF9hMmmAMqBUceUi3M1Z/0jgaKEQAGWC0QiBrGojCm9mqwLy8C3CThNtvEkPyHQJcjW
         4xKF6ACJiKqPomEiYRKmMCyDNJSNXrdq9bFaNJbmXHgXIeBGD5jZ5z4ORQ7jgp1Kw6VI
         /b19SKnEYkxN5X1LFi3izAJW23uJ9NO5iJuVGGA2PTfj9oAlSXXN9j4ewaG37Vjeic6s
         99UtizGD47CZl7b9UFTfW2JeHkMp208v3pRhlTmm6YlX3PeDAT60zsSPk5xRzaFPIcHj
         d3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hu5U86ige5HyMDl6UUjo7RBdCuH6co9yADRt72Y/8MY=;
        b=tZp3gCbNtgGC4Gir3vQLw+Csh27X5SAxo8EMHGHLzJbbmsJZ5SxNLjJN7o5OPem6rH
         yTls9aUNJzlnJ5cTsBIhAE7nDPSqTY+FXhj5fzk3o9Pgju2OSqPCtZpjlhHvPTfZjGgR
         2xfV2w1U1P4NWvszIWK9EDRF5UXWo8F5Y9HJC3Ex9cxMsV2M/tw5TTepfWQIHfnLIur+
         N8S645ETgHpetYC99GmWB2ynpr2F9fZPNsCPvXkyG4OADzLiFYc4lOLEh6biKZSPHmqX
         8Isr9x1jeFAZT5GkVtNish7dbPpqSBov7cCSlulyUOhpnl1xcMLlZUojcamTEop8LF5M
         HKmA==
X-Gm-Message-State: ANoB5pmjs7R5l11ZM/qVsLGX1gpwPh9fCE/MivQx4MAyDqOBLftrhFrX
	Mk6R/1cYhwWgFYsVwt3Z3TuZzw==
X-Google-Smtp-Source: AA0mqf7R80CBcgut7WKoqa2UyoJjTe+iSCNXbGx9E8tOfUa5mUdWN2uLlo6XvJ+69OMC/vUzYl5ZwQ==
X-Received: by 2002:a17:907:986b:b0:7ad:b7c2:a2f7 with SMTP id ko11-20020a170907986b00b007adb7c2a2f7mr14848367ejc.227.1669023761673;
        Mon, 21 Nov 2022 01:42:41 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:c97f:bc5d:82d3:1a3b])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090632cb00b0078d3f96d293sm4822240ejk.30.2022.11.21.01.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 01:42:41 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 21 Nov 2022 10:42:31 +0100
Subject: [PATCH v2 2/2] drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
MIME-Version: 1.0
Message-Id: <20221116-s905x_spi_ili9486-v2-2-084c6e3cd930@baylibre.com>
References: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_094244_455153_51DBC236 
X-CRM114-Status: GOOD (  19.50  )
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
tranfer size to the maximum allowed by the SPI controller.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index bd37dfe8dd05..4d80a413338f 100644
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
