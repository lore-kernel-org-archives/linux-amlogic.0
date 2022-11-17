Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B430C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 08:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFY49xSlvjpqJDPqaBQDs0etlsnIg0pKKCebYvDC4zQ=; b=saS0NEn6tBh9me
	xg4VmERIYZUkOcUMJhtc0qcVbAxBnG+TYcL8PVNmxvJawqAqBnhv5/gbx0nL+jvVKUD5CIDJ4NBKf
	vbD5tpBjePn6oGt3JosNTN1lAr6XIHj9Q/9V7G7STewY/KNcZRnRfgFpS3NYNBXQW5QHb3Dm2abQl
	zS9Tw4Cbvc1FqLY7fv6YxYLybapHsTgut1IbmhTXqvzDoDr6VjHl5JVEN/smidu3H10iPmAWdE0VN
	x56vuXjjZJECBR7xVdjIEv5TVmTIJzYMJAl17DfRcauogHT8dYDM7GApCNjilBEwJQfTUnsbaPtUV
	mU53UR8tojwAZcpLCvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovabU-00BpXI-RI; Thu, 17 Nov 2022 08:50:36 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovaYz-00BoED-4e
	for linux-amlogic@lists.infradead.org; Thu, 17 Nov 2022 08:48:04 +0000
Received: by mail-ed1-x535.google.com with SMTP id i21so1509647edj.10
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Nov 2022 00:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idox2DWf9CfxY6np+xVajajSNgisazAtYo+m3/oXIzQ=;
        b=YJtoDwNevsDYE56TfvpY13pJKKdr1ptUtkThXpzJvzyqFNfQ0lQAYsHeD/G6ijoQb9
         FzNX3VDp0JST+f3q3q97kt/nU09VpZOu7LMruQ2aOWiPdjy515rP0ho3XAzk1xer9fUN
         oo8Xij8p06FD8ZWJk/LZaY9rS8uvkmH0Z1QGAUQbauZoRhXRKl8mkUxO/VfQ94d/bxDO
         0PA707ZmvAL0b7U1IDRpV2graHjHktcAA/oqFa82GZMPJbLgLQQ8+eIAE7kVfLldaMqZ
         ih7RbpltfyVp99rBOpxzOCYnMi64Up3c/VX8yVq0MmjyQIqG90pWGWBylHcJm+0gLN/P
         +P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idox2DWf9CfxY6np+xVajajSNgisazAtYo+m3/oXIzQ=;
        b=iS1ad8avS+zOx6MUWgEJMeIMcBK+Q35/dopczVpxkGFcM2+rthAMLf8wlZuAy7Ys52
         CAhSfIhQ5LuIVfZQuJuYuPm3usPod/haQSGLapV8s4e6i1CSFAGdpGuYpA1YVtAVmtJC
         Grptf3OgH3aS0SOKbdPaSFLg/DZEk/50VthbiBWQeERDIPwiD1kBvNWaS8ywxMDpxuSV
         ETCJowsRO8olN9WeBlJ/Mebra4aFZRgZro1Fg9IZvPce39pkD3cqFAJT2oQofTQTEFA6
         dFKs9rN+VlqiKdjiZqxVQa5EmrRKupvg0SP3H015SHpX9BRGElH9wvcO8Rk+5hOikq74
         KwHg==
X-Gm-Message-State: ANoB5plWSiIwqq88SOgGiDZrwME7/fuool6HHz8dEKKria7NNxmqQCnC
	XOgnm/UnMzq5l3zXIVgcOrh8hQ==
X-Google-Smtp-Source: AA0mqf4yWjrqIlKEjUvVEQZBYNp9Cyg1fui9YTk3qSoXBiIO38liYCs7aLKXOQNddd4uvH2WBxvUEA==
X-Received: by 2002:a05:6402:3707:b0:467:6847:83d3 with SMTP id ek7-20020a056402370700b00467684783d3mr1257987edb.247.1668674874355;
        Thu, 17 Nov 2022 00:47:54 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
        by smtp.gmail.com with ESMTPSA id s22-20020a1709067b9600b0077205dd15basm77332ejo.66.2022.11.17.00.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 00:47:54 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 17 Nov 2022 09:47:41 +0100
Subject: [PATCH 3/3] spi: meson-spicc: Lower CS between bursts
MIME-Version: 1.0
Message-Id: <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, dri-devel@lists.freedesktop.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_004801_246787_6AFB2CAD 
X-CRM114-Status: GOOD (  11.58  )
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

On some hardware (reproduced on S905X) when a large payload is
transmitted over SPI in bursts at the end of each burst, the clock line
briefly fluctuates creating spurious clock transitions that are being
recognised by the connected device as a genuine pulses, creating an
offset in the data being transmitted.

Lower the GPIO CS between bursts to avoid the clock being interpreted as
valid.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/spi/spi-meson-spicc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index d47f2623a60f..af8d74b53519 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -291,6 +291,10 @@ static inline void meson_spicc_setup_burst(struct meson_spicc_device *spicc)
 static irqreturn_t meson_spicc_irq(int irq, void *data)
 {
 	struct meson_spicc_device *spicc = (void *) data;
+	struct spi_device *spi_dev;
+
+	spi_dev = spicc->message->spi;
+	gpiod_set_value(spi_dev->cs_gpiod, 0);
 
 	writel_bits_relaxed(SPICC_TC, SPICC_TC, spicc->base + SPICC_STATREG);
 
@@ -309,6 +313,8 @@ static irqreturn_t meson_spicc_irq(int irq, void *data)
 	/* Setup burst */
 	meson_spicc_setup_burst(spicc);
 
+	gpiod_set_value(spi_dev->cs_gpiod, 1);
+
 	/* Start burst */
 	writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPICC_CONREG);
 

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
