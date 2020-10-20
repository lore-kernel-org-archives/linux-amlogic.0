Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9796C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:26:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52EE82224B
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:26:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JMP6lTid";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="plL+cBeK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52EE82224B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DMz1rggMoox0X/+nPgaRXD4aSxL+g07+ZUgpHmVGI74=; b=JMP6lTid8FEw26TydWQaNHgcV
	Wh7HW3djdHkyP3bxVQeGjz8b0cWHXabJnC0eEhAd3hYUwxEKjt1+cMlemTAusRzaYQ4irebMWxMj/
	rvBe+BuHmE4oDwyfmLICzh09ONRv/V4CChchfyDxD33ahSsY7/l44ymaw/GLfx7JNNF96BVAb3eKH
	3Nq9Wy7EdnSPcLFcA4NxBU1GqXVRb54YcApq1Vu5wGjJnCug/gXaf8MVwy1lHAI3dwB9tYlUD/GX3
	qkOszA8KsK/fSA+JWQqmVCEes7IJdvwbO8yWPVpKQNYffsowrAm8K99sLTE4ReZ5Z6oWQOaPzT9Oj
	Q1rYnklNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUm1t-00083v-P6; Tue, 20 Oct 2020 07:25:57 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUm1c-0007yZ-Oz
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 07:25:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id q5so698776wmq.0
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 00:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/kG+BFVGQXRjJ+mkrHQChx2dsZt9ERLvjJfF1uolhOs=;
 b=plL+cBeKkhcgEoOPkXLmzqJiYdCWDjncM1NsZmzKozDX7/EXncko/dd4visTCbkKoz
 FVwBiWYiP7BhOErruEOjUAZ0Yu1zVHwItfkP/LIiO8Yyva2nN8MZSwH/IEALG0jrFlj0
 4AAUonQVksMpZ9psUcdGrC+dYOPhmg45eFwfSKSW6BHg8WYzwyFpIWGR2sr0nJjM7J0M
 mQtPY5YgoWW3/swFlkwJN8ljigLiIdS8Hc53fJZ3MTliPiri/AQLLIewLgIHEtFVgxE5
 n503uTs3wKrKFrFs+Onqv+dDu7l66uYQBOjD5yRq23qITLoK5YQBTJEZfOP3iZJeKneN
 A0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/kG+BFVGQXRjJ+mkrHQChx2dsZt9ERLvjJfF1uolhOs=;
 b=f8+UJiK6N6axRCe4lFpGvzCyOOTn4fFgOn9qzqOxCOXbS/zQYUdLcAeLO7GgVPYdtk
 /QbKc7M0KlxnlWRZAYjSxvl48iCpta4TQjaa7D+8oE4kLSe3eQlrSYPiNtJPQzTBSrmj
 Pw91+cLubpZUJJ9SOKAkkb9xOKab6xvrhCNzCceDSsC9tFtC5+TYVl1deskIFVVO0yLN
 OeJsatBVmsD2AhJ+BcHkCQodYkfll429pcPb5zcwiQXiVpSOs9qO7d1uyX0FjZZ5jdwa
 iFjo0CpJDR2ja4140Ox+Hl/md7tyrElqHLcgl5ky1SZpMXnifuiGXs5Uylefw1kCpwfa
 woFg==
X-Gm-Message-State: AOAM532Ck6ix/tXFj/6KUhGOfa4NSBNyt1o1KiTZMSdA24No5G/Y4BHT
 vqBUn1fCY6VazzCuFfmJriFiMA==
X-Google-Smtp-Source: ABdhPJzEsj88NtvzD+ZrWDaQD7qm8tQ4VN7+gEQnQXQ3oeSWYew/8wQyY+0+RSRpxq2rM5wZ5F12lw==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr1375882wmc.188.1603178739517; 
 Tue, 20 Oct 2020 00:25:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:3c62:4f82:8f5f:de74])
 by smtp.gmail.com with ESMTPSA id j5sm1487325wrx.88.2020.10.20.00.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 00:25:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: maz@kernel.org
Subject: [PATCH 2/2] arm64: meson: remove MESON_IRQ_GPIO selection
Date: Tue, 20 Oct 2020 09:25:32 +0200
Message-Id: <20201020072532.949137-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201020072532.949137-1-narmstrong@baylibre.com>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_032540_925776_FA20E94C 
X-CRM114-Status: GOOD (  12.54  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Selecting MESON_IRQ_GPIO forces it as built-in, but we may need to build it
as a module, thus remove it here and let the "default ARCH_MESON" build as
built-in by default with the option to switch it to module.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cd58f8495c45..dfb66917f665 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -157,7 +157,6 @@ config ARCH_MESON
 	select COMMON_CLK_GXBB
 	select COMMON_CLK_AXG
 	select COMMON_CLK_G12A
-	select MESON_IRQ_GPIO
 	help
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
