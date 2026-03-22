Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6A7FC72C2
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Mar 2026 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2w7JMQHbNXHLx7oScFPVYS8XY3jXxWso4Lq8UPW4HZ0=; b=NvOd6sn0MgJbvz
	7BOnMbzj1jyjjm86DJM3xCiP61f0JDCKugs7+k29gKIgQoM8YBqEMpSgpo2fW0toLtU1zX5yo0W7C
	h6jrviECFob8VOf8zEXoxloaX3drkGjn4YkXl1PlMDkyJVW36qBzvYJe7MfEbFSkBFeZ56Cayawmy
	8RuvkSSnu/ABoemgDwq0lmRPqgLTo857nfRpp4oCHPoY9apqcarhpLrUnC+F2REWdrmm5pNKb6Gmy
	TFLoCecIBPJtuyaiRTFwIeEaFtys0MAzmjt+P+G1R540BmZ0uruaqHOH5VTSMxkyzgHSMKYVcaZi9
	U/2d7YQ/cViEQ4BTN2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4IsY-0000000FMod-1sHf;
	Sun, 22 Mar 2026 13:30:06 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4IsV-0000000FMo2-3mSe
	for linux-amlogic@lists.infradead.org;
	Sun, 22 Mar 2026 13:30:04 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2aae4816912so12984345ad.2
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Mar 2026 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774186202; x=1774791002; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SrIW8xtAyVysxyWJhbGBQFiTsDupVZxP4JLEp/IdUF4=;
        b=ToJ1CVDrTMsi7R6RXobSuzEY6x6QXFWdnFwVvyxTKJaZbgOTafQha6PfS+G9gXD3mK
         p1IvZRFwRjci5fWEBWax2DHAqCO7m0qjzPR8Dk/3qQf4pSbD2/N4RfUudba9xXgT9o71
         bL5i2EtVjesfNUHXCfP3z0oPqiAEoB3njffF6tDXO2r1vNnfzUUeUurfASCx9g6jn847
         /L6931ZvB52Mmy0yIWf7STYamRPa6Gd1gclDpSak+KpGASsqmrpClsF83QXuIYFF7PK5
         dwKvzak4/22GtdjdjcI1skBmYhmSqw3Mj6k6Oieg96lW6YByPYONvDlVn3ZGxxCF9Q30
         ghew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774186202; x=1774791002;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrIW8xtAyVysxyWJhbGBQFiTsDupVZxP4JLEp/IdUF4=;
        b=SBzb7FnS//k/KjJiszaAi6h3kY9iUN6ZgQotVjipR+YT041nz6dsFzpUL44EPSCJqS
         o/MlCYeWS86e6cMz2P4ftRR+bJPdHlQ0bBs7Pz1fRj7iZRjkbNVPaF5eNxiFht/qxj+E
         AAMlaBWEo/GwqQ4Lx+qKdthEnMJiIalVi7PVbD2sbd3+A57rjwM9aiXidSJmUCptZQwF
         ALThfdtKg1v82GRcBBl1pNlpLc+XqaARXRULHxexIHSxy1i+agQF9o91GOVr1YJNluy1
         QKjzaXeDEm4aq0xuZX6rVUmkTQKPCm61fUg9RpleaZv9lREypBRZRYYfwiTaSay6VprT
         W2/g==
X-Forwarded-Encrypted: i=1; AJvYcCXl1ydrgrCWCZUizGr9dFyPZVLduT2LAEAJmNSquWDU+j+hF6ebXMvg+KgLtHTx6XNSB70hSGJjW5eNXX+D@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzx3jDv8EKOupMcbE6v5H0u9ABbd4FVUE0Fr1HAlZa2ZNDif1y
	JaSlqFjrLgZRfleGzBwOrl/5go9/SLK2y1XUpJ4zOMAhS2r8Oc/flUfoRblvz3q61j1lEA==
X-Gm-Gg: ATEYQzxjvx10hTpdrIevbWajdHQ6COBsqEBsJrY7sazHn2Zl0+tMs3puZq8fUtAhqbd
	5ro/KFUrRKjsmolWb3MSSMsP5y2yyA+l8Jfk9iLMuXcp7C2VnnlbBEm5ONkEinH1fCm/liBP0LY
	XNe0tPt+jCdOc5f0d84TAXWcqy3t9o0juDxCbsZmVrEKN4Y+/NO5abWVES5rl65/BP/gZDvS21/
	XxIkTxOmAT1/2vupxsaT5/g9GTsO1FwjtmEN9PTOxjEpJishuO0j9CsxlWCUw++QphUr9yjyj/7
	UIV9IzYUsDw+qbPihvN4SWt1KeRc1IQ3Gz2lyoXgUY4FOpX7J1qFXjQDy2OPDCmqoEodtt+4CZz
	AdfFwx60nw57tEZvrNlsiJc+ZdeSi5WF2Sp+9ihChq9wDX3NoLUpJPaEJRQIOqDs9I2kW61Serj
	B1mc9ZdbAtqKv3kHRaqImuTJXeQPBM0/W/8JHW
X-Received: by 2002:a17:902:eccc:b0:2b0:5472:ac85 with SMTP id d9443c01a7336-2b08278b1c6mr81255475ad.26.1774186202363;
        Sun, 22 Mar 2026 06:30:02 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm82428685ad.23.2026.03.22.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 06:30:01 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 22 Mar 2026 21:29:56 +0800
Subject: [PATCH] spi: meson-spicc: Fix double-put in remove path
MIME-Version: 1.0
Message-Id: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com>
X-B4-Tracking: v=1; b=H4sIANPuv2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMj3aL85OzkjMwCXaNEMwMjQwsjM0NjcyWg8oKi1LTMCrBR0bG1tQA
 QXofoWgAAAA==
X-Change-ID: 20260322-rockchip-2a6021826137
To: Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Dongliang Mu <mudongliangabcd@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774186199; l=1052;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=IgWmy4QA7Nns3VcVuEiMlxkNPJRgKy13zfHehRaQ8LU=;
 b=dLgftTxPLhBEjASFdBodKe9Oa/2BVSKKuobIs2yLPKcz6YEYlPHAm2ZONouYTQlHozSyDTzz4
 Hbhn7HkyqvYB/ymGHGdt7PmckUH6vjxfwNcoNmgq+lvWTlIbDGTgtK6
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_063003_947551_87221779 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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

meson_spicc_probe() registers the controller with
devm_spi_register_controller(), so teardown already drops the
controller reference via devm cleanup.

Calling spi_controller_put() again in meson_spicc_remove()
causes a double-put.

Fixes: 8311ee2164c5 ("spi: meson-spicc: fix memory leak in meson_spicc_remove")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-meson-spicc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index a7001b9e36e6..57768da3205d 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -1101,8 +1101,6 @@ static void meson_spicc_remove(struct platform_device *pdev)
 
 	/* Disable SPI */
 	writel(0, spicc->base + SPICC_CONREG);
-
-	spi_controller_put(spicc->host);
 }
 
 static const struct meson_spicc_data meson_spicc_gx_data = {

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260322-rockchip-2a6021826137

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
