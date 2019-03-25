Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C50C10F03
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC70920896
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QpWz1Uys";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZZd5Ns67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC70920896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnIxZlzkJZXekedbBSUIwlRchknVxBrk+ar744WftbM=; b=QpWz1UysEtPPVA
	7q/LCfH64F6TIm5OPmPbC7W+V+aikgyZS36+euRML95m/L2yXd/zqpdU3j025fp/iRx8RVCtcFse6
	YC6faDGhJ63q85CdaADO0J49NUNyFr1ycwcsQVsa6WY4dUKXPD4xiMU5FLxlVJyyKcQYw/PJ4K4+t
	E6NgtFd4nz35zU/liMgf8aBBqkl5vL+yeVbAErckjJwkZadGaJMEqxzTinUEMpLoIBFFxITiLRHKc
	J5NVw/6RFl7jlcTzFVJUEF5uBeolIerpGLLPga2mL8yPxAkEM6VkzXQbFFh4QtmAHAFIF2gvYzQKn
	hXDAtb3INfr7NVXhcj7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8QR4-0007mc-KE; Mon, 25 Mar 2019 14:18:46 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8QQt-0007f6-Fl
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:18:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id q1so10388312wrp.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=52hJFpx6eea8OG1nyjqevGtis1G8l6iyh9Mvzmr0/WY=;
 b=ZZd5Ns675Fv7SdJvWPaG+nkFLB2qG19pTCqrUmN9Jxk3tnH41x+ixgP+zSAyKAsAvh
 15E1gu1hZ1S2P61LZ3KO5SNr40sI83/YhN5R2VYBnj4a9BuReS3zA2h3TWi9OUnBKAKN
 9acAdQRbl/JUWBCWRYdeMCbVn/eUgbAMPLIdY1yp3FortWoR8BxRSCNNLj9oOQlIYdd2
 I6OJfcvZhSOgA+8KTj/dgvx0hifNnl+8LlPyGDBK+gFctxwLc6sMQN21RnFR8M+u/ocl
 SORKNC1Pw/aMyHyVCmOAsQ97wWO0JBf5/1vAbDkaXwoCEpSNKPUc3w+t8aAl3zlD40ma
 g4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=52hJFpx6eea8OG1nyjqevGtis1G8l6iyh9Mvzmr0/WY=;
 b=BRxllwm2ZZuZXADSvn2nAdmDn1lSbxhhuW3E0xoG2jtEk9Y7OcK+gpQ77D1VsUW9AG
 8/HSOR+I7GL2Nj04izi6OrJ/La/Jmpmu5CqfoAFaj68zT7tveJQdK3dGxJ9LcdnByU9q
 qwEZZ8ioX6sV98ZzV6fytrSAhurew1E8CFZxP4brz1YhEK5B9XYWXtUk+J4zPxuunTA/
 USIFVrfEqfdvC4OCj+9TAryDAUxIAAJAUykwei9EI/p5UPyDD3xYzMhJPECXkF6/g6QC
 6c7HvzfzonMxty3+lInDyoykScR9GpnY49ufaRu8xmiJWLHktll3UXlCRYsKyMkSBywX
 cJ2A==
X-Gm-Message-State: APjAAAUoNvDwVGnu6m4HAhPS+LGZq+Hg0CVVkIR61gwtB+ovp+5c6BB0
 IjKN1bsWtsG7mIfGsXfZ6RrnAoFqJwBMjA==
X-Google-Smtp-Source: APXvYqy+TZCnTHBwrMnEw0i+HlNS+c2Blf1SSeOJiBn4jfPP8LPPlJdLeO6T4Z4xb0lJugstgJelCg==
X-Received: by 2002:adf:e443:: with SMTP id t3mr16880535wrm.257.1553523508828; 
 Mon, 25 Mar 2019 07:18:28 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 132sm26976794wmd.30.2019.03.25.07.18.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:18:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] drm/meson: Switch PLL to 5.94GHz base for 297Mhz pixel
 clock
Date: Mon, 25 Mar 2019 15:18:14 +0100
Message-Id: <20190325141824.21259-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325141824.21259-1-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_071835_520799_65B9BB79 
X-CRM114-Status: GOOD (  11.10  )
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
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Amlogic G12A SoC, the 2,97GHz PLL frequency is not stable enough
to provide a correct 297MHz pixel clock, so switch the PLL base
frequency with a /2 OD when the 297MHz pixel clock is requested.

This solves the issue on G12A and also works fine on GXBB, GXL & GXM.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index f6ba35a405f8..c15a5a5df633 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -396,8 +396,8 @@ struct meson_vclk_params {
 	},
 	[MESON_VCLK_HDMI_297000] = {
 		.pixel_freq = 297000,
-		.pll_base_freq = 2970000,
-		.pll_od1 = 1,
+		.pll_base_freq = 5940000,
+		.pll_od1 = 2,
 		.pll_od2 = 1,
 		.pll_od3 = 1,
 		.vid_pll_div = VID_PLL_DIV_5,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
