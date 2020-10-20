Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A9FC433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:50:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622C5222E8
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opr+laTQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="H0t6yH47"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622C5222E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pkTNpGh82gn/1hx4Ym6fEFtrc6bVM5fP+27Tu+3BHNQ=; b=opr+laTQniKRpU4uoqJ5z4NYhY
	ovsLtEAYRVJzLF7tA2LtXjrEUko6HSWN3Q9ftg+kiw2F/+CM7lbiL3ywnzASZrzI4C1v1aDN+hRHm
	oK9q+Sc16+eIdpP8j429f7vYnQA1NpO5cy5isISWWz0A66Z6P/Sc2mhDKkft1xyFO1lF8eIaiwZO+
	UpUv1j+l5Yz0O/hVyb/onzzmJpuhyMzQ4IJfn+PGtYDlVO1r99jFcL5zji4A7mPr2YpZXQyTQDY1R
	cyuflgGEJMrxBiuC2ctyx+AQSBovHIfgq4ovffk4Q4q5Unj+ftyXa5tObeTieK/oX1NzJY7h+YxIt
	JPUxrWFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUmPx-0003ZJ-Cr; Tue, 20 Oct 2020 07:50:49 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUmPu-0003YV-QE
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 07:50:47 +0000
Received: by mail-wm1-x341.google.com with SMTP id k18so759201wmj.5
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 00:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W2CHqTGmRLFM8SxH14NrAbLcG1auMYs1HJe8WWLSeMk=;
 b=H0t6yH47JSVHOZlqce1pEiVYeAw1UwR6yx2vbm3nBHzeVAM2+d3vvklhylW7AhkVln
 iYJQrUMHfnVROfl7zgROAiTkUrE+Jq/RhFhczaJ2dd3B5uy4I2eTIaoZozNBA8x+VZDe
 Ro125OKGKSWFwAuFIHvgRTgjcaorXXX1NnjgZxVNDStq/nxnKTfceo7JLPPJg9oYqi4h
 drfTNXjAD9SsygCzkl5euU4pOPlVNOQknL47COvnqQ9RkNLuTUADL78RpIr2KIJClxSx
 7KiPxbGiHF2+1zOV+agG8LNm6R1831pkLUgDActZ6A+mXOHbGEf6JK+5MSUOMc42Rb5x
 ehKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W2CHqTGmRLFM8SxH14NrAbLcG1auMYs1HJe8WWLSeMk=;
 b=VmboWK61OUxTN3A9fCGm4CxIKu2fkwmTf6a7aIATwP2VDdLJMugBJSBiVTuxMyB0Dz
 /VDPoAwsz1ucf9nBExKYoUq85DAKAB+YKI0Hcw1no0G+LtxknD6qK3VAqcjxWsLjrQ1F
 Jza5xSirJz67EOoDU+h961as+CQPhZhJI92yUuHCsHEdj34LdDfsxnSTjFOPGVPTyyUJ
 vhD6DkZzMkprPvrTO7XazCUiyWepb2o7E5U+03yxrF4LYVxIFxKzqNLf2I7tkV4/TRi2
 yWWqy6qWjKrKUq2STefShU8Qf4fxENZO+enxmJw+9D4w1TcQw0qipslqg/0qFOAlGD1a
 ZLVg==
X-Gm-Message-State: AOAM531jC5LHVR2Dv8xC9cwVi+3MJ1iBuX9NdZn9NE2NqcrTeginfZax
 R7tKfbnzVK47hvn4iW2XL93t6g==
X-Google-Smtp-Source: ABdhPJxAp0T8Wu0nof3FUngVbIlSCx4PXBGnHY1SZVmSy0ucqgnYFErytdl+DC/K5fnC/RR5+maKLQ==
X-Received: by 2002:a1c:254:: with SMTP id 81mr90965wmc.21.1603180245337;
 Tue, 20 Oct 2020 00:50:45 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id t19sm1504703wmi.26.2020.10.20.00.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 00:50:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] arm64: meson: ship only the necessary clock controllers
Date: Tue, 20 Oct 2020 09:50:34 +0200
Message-Id: <20201020075034.172825-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_035047_042146_3C031108 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

There now the menu entries for the amlogic clock controllers.
Do not select these when ARM64 is enabled so it possible to ship only the
required.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cd58f8495c45..b22d1bdd6eb6 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -154,9 +154,6 @@ config ARCH_MESON
 	bool "Amlogic Platforms"
 	select PINCTRL
 	select PINCTRL_MESON
-	select COMMON_CLK_GXBB
-	select COMMON_CLK_AXG
-	select COMMON_CLK_G12A
 	select MESON_IRQ_GPIO
 	help
 	  This enables support for the arm64 based Amlogic SoCs
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
