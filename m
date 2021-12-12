Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B24C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 20:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SlSET5PedHnpstld6kkJLvU13igXV4pNCjp70QpL3o=; b=Ig9WPk+TjpLq0O
	9++bpMfksUIQesNa60xxUrxmXxMi6oCdW5ERwx8UmSToDd23y2L5bfyz9Z2IRMZFMP4ANegz8yruN
	dLvvsN/dSi1L56BzaH8ivYZloJjFk904q/x4LOMlpxG0RZ3OqhmxeWmFIR0P/9io3rP87Nn21d+8I
	lqJe9v8SXWogak0LIoRxwOvjGfJ291Eg9if4qAU+zJdsHT2nKhsXK5dxV8Q1iklFImzc3eaZxEzBL
	xSlK0cRzss+nRGRiZlz3zMRC6ZACGjaqjbXQF4Xbjcpfjp6GZTeKc+ePc2kxYzAsNasI8nxSrfgIU
	EOxn4qWeCfdNJh7+SSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwVJF-007BY4-6P; Sun, 12 Dec 2021 20:19:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwVJ9-007BVp-Ql
 for linux-amlogic@lists.infradead.org; Sun, 12 Dec 2021 20:18:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id o13so23802150wrs.12
 for <linux-amlogic@lists.infradead.org>; Sun, 12 Dec 2021 12:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lo3UsCaMaL5NAfBrYJDUAK0+9C+4ooYh+4fLJsKdab0=;
 b=KOjWC5DgtgOF3XopqQeDoC4MVI2YzCCJsJn8/SGztamIk/lV+JZzFLMjwvUek/C2ZM
 ndDa0DMlr49uRS9eqfUBYj92kbhkfjFObEG+DRifDkxdoBYEB7gRSZckSVQAGGFcawno
 RE8Bj4wJ63PdPyxMLUnd/xr0tiIADoDIRmI74SBLwB6JpcY+HM3hqnWw1yWG9+JaZsuc
 GYwJrxl1P8rOrMdxdpEL9pHK78VsdvHIneYLUsNdWmsIHSoRl63RP/4Nduknj9YE41Oj
 oLgEQCXOPnnBmlIeR+17DENRftJWrm5+h1WQ1IA3G8ePsuJi9eIh6KF9iSoXeRZMmBke
 q7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lo3UsCaMaL5NAfBrYJDUAK0+9C+4ooYh+4fLJsKdab0=;
 b=bg32pxY6PFtzvedl3CGds4/DVn+IvTRB1tl4ezviU2q0uudkNhSItnmIc0ZtDfF/6o
 7vtFUP9vsORYNkto7IBKpNNSy0UBLI5CAIydCFZ2Yu8+O8uWTqfS5UnvcWyWPwTEBLUI
 8U7En8nv+MDIpGZ8BcMUpHehcZ2oXNQKFLNwr/tWqHE3NyoxC10saTJpoY/enMBfczy1
 eYXT4fSySY+FI2X9nBtnOOQ7YDpONuqIyWiOHyYTcN5HZ84FTfvaeUC1P3fGimD4rVgT
 7WAoCMP0/nBFdOZj8zJ6TekJQAxpW+Ougz/mVSX4T1Ru/uMR4OpAPiiVSIS7KDCwdmdT
 5p0Q==
X-Gm-Message-State: AOAM532xD11yU+CXWt6G8MhzkDYipQUtsXx6rbU3ovPoFCsY3v1Nstgw
 t4MWqDgYoCjm93k0vL/fOb5btg==
X-Google-Smtp-Source: ABdhPJy0qTqHTrXdybd8Z/alToU7dWXX4j89dgDjRwcQXHgR+4kefRJlnJxM84Ub3lrX7YqunzPnCg==
X-Received: by 2002:adf:ee04:: with SMTP id y4mr28043885wrn.0.1639340333104;
 Sun, 12 Dec 2021 12:18:53 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id p5sm9092710wrd.13.2021.12.12.12.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 12:18:52 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v5 2/3] phy: amlogic: meson8b-usb2: Use dev_err_probe()
Date: Sun, 12 Dec 2021 21:18:43 +0100
Message-Id: <20211212201844.114949-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211212201844.114949-1-aouledameur@baylibre.com>
References: <20211212201844.114949-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_121855_946059_88C669C0 
X-CRM114-Status: GOOD (  10.70  )
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

Use the existing dev_err_probe() helper instead of open-coding the same
operation.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index cf10bed40528..77e7e9b1428c 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -265,8 +265,9 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk_usb);
 
 	priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
-	if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
-		return PTR_ERR(priv->reset);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset),
+				     "Failed to get the reset line");
 
 	priv->dr_mode = of_usb_get_dr_mode_by_phy(pdev->dev.of_node, -1);
 	if (priv->dr_mode == USB_DR_MODE_UNKNOWN) {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
