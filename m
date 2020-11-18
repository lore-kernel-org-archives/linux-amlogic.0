Return-Path: <SRS0=v4K1=EY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BF4C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 02:37:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9485720DD4
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 02:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZp0xpfM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sch+ceLd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9485720DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5X8WXv88owIDI4lmncGwl+oujZLgiUmS1MgNOoZE+TE=; b=EZp0xpfMA9vZxHoHQQqbZoJPPJ
	kbxEq1MyPEa4c1ZkP9HTLaEMS4DZ5d1x1ZdLwyflaKW+0DpJC58S1zEqtz3PQXJHA36SxSt7jjms5
	vrLMOe1KFqceoIwRlbzhZo78A7eQr/XGIIMEo19iBO41QL4fX5Bt9X1y0x+K/TnbsNzjI318I1KTG
	O1JH5daSz0ehoPE3nX/4Mo6vSYqfP5VaO9R2JIGxRCc2TbbVoNiFf89jVswUdFFUL7RsVXR2CdPd6
	pqduwxFw0Rejor1LFlcAfWoM1huQB2qbcETX7uz7xXgokSteBSwSZ5WBpqE6jLzS3WKkaiG6AuQPV
	x+ndZJyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfDLC-0004dd-HH; Wed, 18 Nov 2020 02:37:02 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfDL7-0004d4-SE; Wed, 18 Nov 2020 02:36:59 +0000
Received: by mail-pj1-x1042.google.com with SMTP id oc3so274318pjb.4;
 Tue, 17 Nov 2020 18:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=aLAwBEV8rDngSyjP7XaDJT1gxKz3iKkOVuPY4qMJ+Y4=;
 b=Sch+ceLdIm2niHQkFOJ3RkQtWCgGPslipO9TDCg80Dz8aSnw71wPiGwAt4FFHCu9TP
 0moiF/HLPZzkrpPTLpEPUi+5JWMNHGcHhrve/sDuxvkvTn3cueVFkHooYeS4xA2lwDVm
 VHQmGw3VHT/VyGLy5qg/RW2njNOmvbQfAw9Jowtp0v5iLmJEZikCW+GnyRYMnq93Loc7
 pUI+EBC5HfuWHE0V5hEpVWUj0RyK22dnnvFtZlpquHX9+XhfXhcwvXvSJjxvzukxQldq
 iR5NbMx33PeZQUd6YyNAhDWdJi6eq54gcKe7wUqJaPXvRLU9ldx+Z3wlxgqLZoguyWq/
 bozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aLAwBEV8rDngSyjP7XaDJT1gxKz3iKkOVuPY4qMJ+Y4=;
 b=m+wp7vU3WSaiffw7pxdQ0tzfMYE3QScJitq9IRCkxvC5A8ywDytfitNYTAl8aANbuW
 YwVBNlWDJ0zcUl8ncZ+705Q/qPaO5i71w7zzjsE4D2OaOcEKVZ73R0ex1c0vmBRklKaL
 OHYF93c45uiDaDtGXg2/kKcUPzOuKLP+7vQAMcuOSrbIkQnX78bH1Jh4Pube+g7uJEMU
 /91siutVgzZLXjIVhjagu6/5+uBixrmVepcOxvKzJoCDbmYOOf1p04qYbx9omi+DylKP
 cFpgyDbZ1DovnGKurLq6f3FCJ2dwpNvR/FfdQzEdafsEBuJG2M8K1y6VVwAnrVBCtXMi
 ZtYA==
X-Gm-Message-State: AOAM532PTYn1SIyJmfq8Enqh+Qj/vPHWvpHwtccauIHlyk+EAQAkatHm
 OeSZ0tBIImmJvpGZDOdCoXE=
X-Google-Smtp-Source: ABdhPJwXsbmgh7VDl77Mqc7qiFziVJuy+X4wawPYtGcauQ+tk8eWNX35YVsHNvvaJBdiBqEEDRhe/w==
X-Received: by 2002:a17:90b:b15:: with SMTP id
 bf21mr1911068pjb.21.1605667015399; 
 Tue, 17 Nov 2020 18:36:55 -0800 (PST)
Received: from localhost.localdomain ([8.210.202.142])
 by smtp.gmail.com with ESMTPSA id j11sm7210265pfe.26.2020.11.17.18.36.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 18:36:55 -0800 (PST)
From: Yejune Deng <yejune.deng@gmail.com>
To: kishon@ti.com, vkoul@kernel.org, khilman@baylibre.com,
 narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, p.zabel@pengutronix.de,
 lorenzo.pieralisi@arm.com, repk@triplefau.lt, yejune.deng@gmail.com
Subject: [PATCH] phy: amlogic: replace devm_reset_control_array_get()
Date: Wed, 18 Nov 2020 10:36:35 +0800
Message-Id: <1605666995-16462-1-git-send-email-yejune.deng@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_213658_180523_EB225823 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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
 2 files changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
