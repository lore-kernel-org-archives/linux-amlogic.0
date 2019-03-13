Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D93C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 13:55:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03E402087C
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 13:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L7HvjlYK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KKIcVuiS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03E402087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yDtbBDYrnMYXWJmSRJOiM2NV72CfzOtXMFE2dXBl/mQ=; b=L7HvjlYKF4+FGD
	zCFPu380m8+LGAyI9pZ9Q0fe2FDAWwmiAhwt8Q3g4QZGcsQb8RvKh9Kq9DeSrTtK6uqks8nXopCR9
	oZZzQ7mAQHU3P5wNcHZWBrxnzZjedMqUjPKBW3y7+CC3Lwl9eOF6X3LQJoFPCNUgJiIa9odXv5wF7
	lbHiVTRisjRN6w+dMLjMtEHfpmz8Vr1RhVoSQUF0a2cg19dhSDKn4TZ0+siD+qRpqp4iFo2VFRvLf
	klA/cSluFUIGA+znnao7YjQJqrzod7/NZ7FxZ+5pOMwhY9G8rM6olzcKPzXRO76H2ITL8UCkwwn8P
	Uk2qhX6m6oZCv4JiZA/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h44Lg-0007Iw-QT; Wed, 13 Mar 2019 13:55:12 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h44Lc-00077R-Hr
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 13:55:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id t124so1956145wma.4
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/XcG1evH1WLkyrTUwfyNJFSPc+4/xkbOCaOxw4Zna0=;
 b=KKIcVuiSg58QhTbCMj+bu+T/HGR0cNEZIvnK6O17f1iSwyS56caeS33GyZ/o8BP1fz
 8f2h6883+nC/DMfXiS5+Z3EF+cHhOXBgnP7CXrWrqhNeyJUcph0EallekUARYaN3YCnT
 AEDhJeklV5sw1Ujk0HGLDD4gR9tKmZgo4HvRynoen94p8revoKYmpN9FcbXJohPgCSpH
 CAr8TrZCn7mrKi68AJSpahYDMasKhFYznl5fZwPeBl/lwo5TTH+vQSf0pq4uz7Q43pTB
 W8DF4dO21PxkMzVZGGm0ibZrNVe3AKtfaJWqB2AuOoyYRc7fHWEcQUGoyNWy1VQfoQIM
 sXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/XcG1evH1WLkyrTUwfyNJFSPc+4/xkbOCaOxw4Zna0=;
 b=JV5ndszWLgXu8+l01cAJZ499do+J/qTmxZDVyBbYKsgxTCPBioXVieJO3JrVzw+TN5
 gq34lSxyfbrlwD6H80jM5joShy+4flv2Led/aiLLHATgIsDs3amo1becGrdEF0BBHm8g
 nQGSFB5n8oYYcDKcphdsfsOvE+Vesm3tQtPfrt9lAnvW2f/OKxom78eseBTevuCi2g1v
 1BTdSF1tgWfQ/ORI3jjjVEaJj9J7s6taQQop4gLTd6axLJ7cjeVzRlC4e66cVow5Ps+f
 n4BWHPy/xJl5B854FHxIcaq+yvc4wwc/R/wtvxBfw9N85nzrn35t/Nb75o0ihAM8kt0Y
 qbLA==
X-Gm-Message-State: APjAAAUOuqsimQOGnupGqvayF9jok1z8RlZ3RTxoKDKTPFHg5uVS3GYL
 J5N4eKU/CyLnn51+1i4XegC4SpT/kg/pr26h
X-Google-Smtp-Source: APXvYqy861EIsMqnM3GMUNQwAgzamaE1WJuJZgpTU4We/AYfmMtHTiEca8tFB0OcsSPtD9R42ybGHQ==
X-Received: by 2002:a1c:a007:: with SMTP id j7mr2296073wme.25.1552485306152;
 Wed, 13 Mar 2019 06:55:06 -0700 (PDT)
Received: from localhost.localdomain
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id l5sm2216071wmi.24.2019.03.13.06.55.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Mar 2019 06:55:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH] clk: meson-g12a: fix VPU clock parents
Date: Wed, 13 Mar 2019 14:55:03 +0100
Message-Id: <20190313135503.3198-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_065508_641954_EC369067 
X-CRM114-Status: GOOD (  10.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

First two VPU clock parents are wrong, fix it here.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 0e1ce8c03259..9b0151993bcc 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -960,7 +960,7 @@ static struct clk_regmap g12a_sd_emmc_c_clk0 = {
 /* VPU Clock */
 
 static const char * const g12a_vpu_parent_names[] = {
-	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7",
+	"fclk_div3", "fclk_div4", "fclk_div5", "fclk_div7",
 	"mpll1", "vid_pll", "hifi_pll", "gp0_pll",
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
