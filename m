Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744FBC38A2D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Oct 2022 07:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HfdJ7Xkg19upSLUGluZq9QDsbe7KRJyvLPEVjUFs5VI=; b=GINxoLzzprMZGF
	xxvmkfsAdH1LiK9pRCJi9XMcV410rPUpmy73cLSBzbx4K5dpkvtbhtZLnWV98BYldIvlm/5gFgHaV
	v/Z2R+rxO0/APCepWkx/l59nr+0q9Sk7iraaLJAwzAusphP6/lPuRoNa556reI8zFXeR/CmjIZHJm
	osNspka6V+WSDjlgc60/rgFPL6pNEBKVUOqdzTW17c/r2nPdE/hap/gHg84/nNumZBgfjX0vM7ovn
	V7PnbGZW4G60zbSIs9LTYtgJAieeiJ71x1DJ+vqLeuJ+hUuqcTWcud9zo/H1RARr+C8Deqy/TdFs1
	pDOaEjJnIdsepf52XaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onbJ8-008TCB-0m; Wed, 26 Oct 2022 07:58:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onbJ5-008TBT-Lx
	for linux-amlogic@lists.infradead.org; Wed, 26 Oct 2022 07:58:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so942593wmq.4
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Oct 2022 00:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+jyjrbZo+ELkTQHp1UO8qB1tgFnSatDzGs6yA5dAalk=;
        b=D+lIzuFmmhNmptsvaY8BGQUNGKXCtzv9MHCJaBqvK9nBESL8oazEgpAqhXJVAJywpB
         i0qxXytK2Dwz3lYx3b2byIBa7MjTi4+3R/V3Jt+8aDopFCPUPRQVDBddysrWAA0Phax+
         GsYYY4ORqfBeJ0gh58fwYn4mOe9jZKXpaONekw+G4azlTm6jgFc3k+AqCucxptEumHuc
         liQt7PiNML/sEXGIyXfUbanAFC9/tbEOA3DkJTRlKddeRB5fVya50nxVvbfV6LinPlC1
         h3/iWju6Wi1Po0962nuxTwR6MKDELIciU2qzNQA7vRW34v/ASomx6+uoD/vRzRiOITSX
         RO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jyjrbZo+ELkTQHp1UO8qB1tgFnSatDzGs6yA5dAalk=;
        b=5159LdPVhOAqKCDH8i3iQSZofp+Y/sdH4wi2P3siHJQ0kbFAAl9TRYyfyCDhpqGczU
         TPuohDlknsQZ+Ei4VDA5B1VMU6Bwk22BZ2pREuH8HTjF3f46CwKpdZEJZJK3PL3Xy3zn
         BGUq1VU3+lnElEGohBC66xrW6bk3VKFSMGxzI8JpxrzZtdIhgCVixkVeOO9yJqrOeG4Y
         tntiSgBFIhoT58SbH2dS/ctJ0aWfA/inbX0rPJQ2Qm5B/lmpIvVeSeJLv6v7hgHfodz8
         xbUnhlyay3sYpaZOAUod/eDjoO9UVnnPZsQqmpuIn4RswriX9350PrFdpUz70VcAN2j3
         itoA==
X-Gm-Message-State: ACrzQf0HgjGBzcWJM0L5vCHptZYc6hBaUUzDTi5WTdzjQ4lJAfIldlXS
	WgkJXYHkU7dobj8KLWQWytlPog==
X-Google-Smtp-Source: AMsMyM6biL997EUrBv+5AmVPUHlDggoRWcpPcDDG67spwOF+g8th63MEzdahrujErNWbC8OUcQgQOw==
X-Received: by 2002:a05:600c:1e28:b0:3c6:e046:9da7 with SMTP id ay40-20020a05600c1e2800b003c6e0469da7mr1497424wmb.43.1666771113122;
        Wed, 26 Oct 2022 00:58:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d6e81000000b0022cc3e67fc5sm4562593wrz.65.2022.10.26.00.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 00:58:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 26 Oct 2022 09:58:28 +0200
Subject: [PATCH] spi: meson-spicc: move wait completion in driver to take
 bursts delay in account
MIME-Version: 1.0
Message-Id: <20221026-spicc-burst-delay-v1-0-1be5ffb7051a@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-spi@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_005835_758406_E9F64852 
X-CRM114-Status: GOOD (  15.85  )
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

Some delay occurs between each bursts, thus the default delay is wrong
and a timeout will occur with big enough transfers.

The solution is to handle the timeout management in the driver and
add some delay for each bursts in the timeout calculation.

Reported-by: Da Xue <da@libre.computer>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
To: Mark Brown <broonie@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/spi/spi-meson-spicc.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index bad201510a99..52bffab18329 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -160,6 +160,7 @@ struct meson_spicc_device {
 	struct clk			*clk;
 	struct spi_message		*message;
 	struct spi_transfer		*xfer;
+	struct completion		done;
 	const struct meson_spicc_data	*data;
 	u8				*tx_buf;
 	u8				*rx_buf;
@@ -282,7 +283,7 @@ static irqreturn_t meson_spicc_irq(int irq, void *data)
 		/* Disable all IRQs */
 		writel(0, spicc->base + SPICC_INTREG);
 
-		spi_finalize_current_transfer(spicc->master);
+		complete(&spicc->done);
 
 		return IRQ_HANDLED;
 	}
@@ -386,6 +387,7 @@ static int meson_spicc_transfer_one(struct spi_master *master,
 				    struct spi_transfer *xfer)
 {
 	struct meson_spicc_device *spicc = spi_master_get_devdata(master);
+	unsigned long timeout;
 
 	/* Store current transfer */
 	spicc->xfer = xfer;
@@ -410,13 +412,29 @@ static int meson_spicc_transfer_one(struct spi_master *master,
 	/* Setup burst */
 	meson_spicc_setup_burst(spicc);
 
+	/* Setup wait for completion */
+	reinit_completion(&spicc->done);
+
+	/* For each byte we wait for 8 cycles of the SPI clock */
+	timeout = 8LL * MSEC_PER_SEC * xfer->len;
+	do_div(timeout, xfer->speed_hz);
+
+	/* Add 10us delay between each fifo bursts */
+	timeout += ((xfer->len >> 4) * 10) / MSEC_PER_SEC;
+
+	/* Increase it twice and add 200 ms tolerance */
+	timeout += timeout + 200;
+
 	/* Start burst */
 	writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPICC_CONREG);
 
 	/* Enable interrupts */
 	writel_relaxed(SPICC_TC_EN, spicc->base + SPICC_INTREG);
 
-	return 1;
+	if (!wait_for_completion_timeout(&spicc->done, msecs_to_jiffies(timeout)))
+		return -ETIMEDOUT;
+
+	return 0;
 }
 
 static int meson_spicc_prepare_message(struct spi_master *master,
@@ -743,6 +761,8 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	spicc->pdev = pdev;
 	platform_set_drvdata(pdev, spicc);
 
+	init_completion(&spicc->done);
+
 	spicc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spicc->base)) {
 		dev_err(&pdev->dev, "io resource mapping failed\n");

---
base-commit: 247f34f7b80357943234f93f247a1ae6b6c3a740
change-id: 20221026-spicc-burst-delay-ea0526602760

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
