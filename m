Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C87C63697
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 05:58:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 303692463D
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 05:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0tK/DrfL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YX38hifi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 303692463D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mHqRQgR4Nxc0IBLYWpaXF3NbGcI9e0r7qhaOq9KCXFE=; b=0tK/DrfLJC/89WEKX9WUYFP+RU
	4ECM0e7uSwn6u+O67LL84LEYJSAUPXIgdgrSlBwWkrUh+Vh1001ESKUa7i7i+carkUXfonKvHKrSY
	PMAO/mXxOuw3hBjulSNOTbng1YaooLKNnoIm5XAenUbadliDqFq+JfK+2DMwzXyEX4Ve2AjThuHOE
	7GPpvgltMFboDnGXI2zctg4f1kAWdmyCIJ9T2lzo5SZm8Nkynlh0H8Rws8PtOqocHf0chqYl+Zvlk
	KnOFtvxTZY4K7ApE/UVKIopx68tIm0G7xrYhg0lO9TP0g6U2GL0miP+bNKL7QZ/NJp402PzNussQ3
	om2VfG9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keu0h-0005kw-Vr; Tue, 17 Nov 2020 05:58:36 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keu0e-0005k6-Uc
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 05:58:33 +0000
Received: by mail-pl1-x644.google.com with SMTP id 18so214698pli.13
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 21:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xnycLun0wGTXJ5w4SlwLZ5E7rhEFIbLoOAivxoxcjMU=;
 b=YX38hifiak7WQOUJqn8+5xtTz1bzKEG2biRDzQ72ZLpGENMfpQ85YAAfyYA+RDyKOU
 JaWlSIO4kzBv/fpo/tePuCNr/1zE/jMari7BYAuIINQWpVutDSBzyKJCM6HdctbTUamX
 AS5yVzczEJjEFpVI52zDlYBcg1NleXqWfzF8x9FYgyedqHqq6GMIf7k+CYctNyxRR2CQ
 TFSpXA5SQbKekjMySkJnu3hNCf2hsqgMwcqUFTTylN/cDywnmrSU2jGfhEMLj+liT+D6
 iQyaTOJbWFMV9xFkyB/Tu8SwUMNZP6A/UKENrvFu3AWoXKtzbWq2GqondpIf1uxfZsmK
 YkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xnycLun0wGTXJ5w4SlwLZ5E7rhEFIbLoOAivxoxcjMU=;
 b=htt4hKd/oR76WagLN1pnJoA94MySODf7BouR8H86QIFsaJC5uuS84IqPJBUTnh27Cd
 7QSFegHDUX+dcdJWK+8DwgvOE46mqbYoCGguVOkeIGKT5Zj6ztkhSle2wDulhzz1Dy7K
 SJjvyBcjuVUztDc0FNpR0fvW70IMJw8zU2khnhE7e6rcL3mM+DPWojUpeSd0OeWh38rI
 enObptVr/HsuhYHdPB/XJ1A9TBA2Y7MKlTjqkj32bucbf/hgAn0pljrhxox5M5aKXOYQ
 GarbzQoSfdNJNYiHyo1NIMZaN1VIRQZd7Pw2MsvcgjK1+lxW1bNdlysd/qgAqPV3AgUH
 ydlA==
X-Gm-Message-State: AOAM531nk/6f6ScgvuXjKu336FxoY55usfyelyr2D5eHhQOtLwRuvTbO
 ezfgh40+ubIkRrehBHGS7jE=
X-Google-Smtp-Source: ABdhPJxMktzZl30xTOJeJFAJhDVALgcXZJ+/C9qIfyy0vXG3fQUNueITrB+y/WqASXZI4yww3+e5BA==
X-Received: by 2002:a17:902:6b8c:b029:d6:d32e:4a8c with SMTP id
 p12-20020a1709026b8cb02900d6d32e4a8cmr15885726plk.28.1605592709342; 
 Mon, 16 Nov 2020 21:58:29 -0800 (PST)
Received: from localhost.localdomain ([8.210.202.142])
 by smtp.gmail.com with ESMTPSA id s21sm5955013pgm.65.2020.11.16.21.58.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Nov 2020 21:58:28 -0800 (PST)
From: Yejune Deng <yejune.deng@gmail.com>
To: kishon@ti.com, vkoul@kernel.org, khilman@baylibre.com,
 narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, p.zabel@pengutronix.de
Subject: [PATCH] phy: amlogic: Replace devm_reset_control_array_get()
Date: Tue, 17 Nov 2020 13:58:09 +0800
Message-Id: <1605592689-10108-1-git-send-email-yejune.deng@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_005833_040082_565D7161 
X-CRM114-Status: GOOD (  12.74  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, repk@triplefau.lt,
 lorenzo.pieralisi@arm.com, linux-kernel@vger.kernel.org, yejune.deng@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

devm_reset_control_array_get_exclusive() looks more readable

Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
---
 drivers/phy/amlogic/phy-meson-axg-pcie.c       | 2 +-
 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c | 2 +-
 drivers/soc/amlogic/meson-ee-pwrc.c            | 3 +--
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c        | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
index 377ed0d..3204f02 100644
--- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -155,7 +155,7 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	priv->reset = devm_reset_control_array_get(dev, false, false);
+	priv->reset = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(priv->reset))
 		return PTR_ERR(priv->reset);
 
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
index 08e3227..bab6345 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -418,7 +418,7 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk_ref;
 
-	priv->reset = devm_reset_control_array_get(dev, false, false);
+	priv->reset = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(priv->reset))
 		return PTR_ERR(priv->reset);
 
diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index ed7d2fb..3a879a4 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -413,8 +413,7 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 			dev_warn(&pdev->dev, "Invalid resets count %d for domain %s\n",
 				 count, dom->desc.name);
 
-		dom->rstc = devm_reset_control_array_get(&pdev->dev, false,
-							 false);
+		dom->rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
 		if (IS_ERR(dom->rstc))
 			return PTR_ERR(dom->rstc);
 	}
diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 8790627..b4615b2 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -304,7 +304,7 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap_hhi);
 	}
 
-	rstc = devm_reset_control_array_get(&pdev->dev, false, false);
+	rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
 	if (IS_ERR(rstc)) {
 		if (PTR_ERR(rstc) != -EPROBE_DEFER)
 			dev_err(&pdev->dev, "failed to get reset lines\n");
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
