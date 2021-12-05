Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578E8C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 21:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SlSET5PedHnpstld6kkJLvU13igXV4pNCjp70QpL3o=; b=W2qrSlA2dvPOfO
	RxjcM3mlE4gzb7N8DZ+zAqP2nGlH/bnPqYGYxgvIsPx5Ro0ozWQUtSMcik8qfId6xpx1oI90LC0Zv
	rc7TK4ogtH+4NeUhb2gBzRS7s9D4v5xnvD47ySMfMmWpDgCX/NYOp+a9Q6otGeoSn1giUnXn2n8qw
	OpAxZOByKcMkM4yTBKHhijBpQjeS/AChRkmofycDDDA5YDYmSWoBM3y1YS/mG1ygNTizWqusCPi8a
	MKVquuAhy4aSwWl9foqHoZnrA7UygfoU6r0ylf3YAH95pua8OAHZn0sUl5OKr8bGHVuklueopiYkf
	mfTmf5rRv6+eKchtm89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtzXD-0021TS-My; Sun, 05 Dec 2021 21:59:03 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtzXA-0021Rh-TZ
 for linux-amlogic@lists.infradead.org; Sun, 05 Dec 2021 21:59:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id t5so35115083edd.0
 for <linux-amlogic@lists.infradead.org>; Sun, 05 Dec 2021 13:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lo3UsCaMaL5NAfBrYJDUAK0+9C+4ooYh+4fLJsKdab0=;
 b=ASw01r3PIJQON4NAGFYQKnXd2+BbWbCIcdAkLRviUUlHdvDyyOB4WiDEkudhci7DYF
 cfV32SihvIVCO6CuNoIquwRh3jlN5IIRJqpW2n6cQmEsuO/9a2WSGilXYJwxKJUyhXrr
 zSTl5Ok59h5DJIWpZnupzFisj1HXYXEdRdfg63cgswcdH1QbwneMOc9wbBcdGKDi1jH6
 vZh3u/9HEEBjvEk5KodBy0S/JjnWbXeKtHHXXLyeSlDCkPGNeHjrPSl4ixLBdgDIPRJT
 U/Tdpn58UaOwnTvfg5Y9kp+O6xashRxBjnMl/kfel2W+egtVFz4h30jQpE7q0bvvQI2Q
 KIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lo3UsCaMaL5NAfBrYJDUAK0+9C+4ooYh+4fLJsKdab0=;
 b=x+T+6RfCvnTeIa5SALM0KfmfS+D7+D57Tg9Dq6I9rviYaHHAxmCZh3LVbi+IYDeQxu
 k7xl67BDzL5EZWysDGdFTU5wtiTOb5qgXyLjJY907xJZyjxrp9wM2cFu1fd1nSO5im+Z
 qSgxBk1lPJjXF/A9SbmnJLyuMcRhTnCBTLzgcyEnBM1bl+jirArpXhnYzkyLq5iC78l9
 UWPJfeEWGCeNTx5Uoef6s6gXPFwRTiqyL1VNBtMyxVEN6yjF85jH+bNVSu2hpsVsCpLx
 +vmrZsc49fvgUFaV5ASGgCuh+LeJ9RpmiJEWeaKHXFZ35p7ER4iafieLvgfUpjcM/GSv
 +Ivg==
X-Gm-Message-State: AOAM531FMCErcCBAEQY5XmsvVh76asYiCsYipnC6V5kkKuHPe3hL0n6R
 vZfwJb6a7vkpEAijq+Twst81uA==
X-Google-Smtp-Source: ABdhPJxDW08rqxgjmev9uudRq1hMRU3rZw9W5A9cElENKHZZWg2qg6bvfqw0CJ9j156uWmJpH8XTjg==
X-Received: by 2002:a50:d68e:: with SMTP id r14mr48757026edi.5.1638741539361; 
 Sun, 05 Dec 2021 13:58:59 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id nc29sm5724291ejc.3.2021.12.05.13.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 13:58:59 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v4 2/3] phy: amlogic: meson8b-usb2: Use dev_err_probe()
Date: Sun,  5 Dec 2021 22:58:45 +0100
Message-Id: <20211205215846.153703-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205215846.153703-1-aouledameur@baylibre.com>
References: <20211205215846.153703-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_135900_976097_16AFF80D 
X-CRM114-Status: GOOD (  10.64  )
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
