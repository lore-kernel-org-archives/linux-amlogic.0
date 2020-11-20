Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F5FC5519F
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:04:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E64B221F8
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WFvZ4L80";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PSjQrXjv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E64B221F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YLP85ZCMD4laP7ebaH4XdLghBCnv4q5KNJL3Igdva+8=; b=WFvZ4L80BzaKv8KrZK1zYs8SQw
	jkefuMotTEDJlATs/e4ORVorMaIBH8SvspC9JkEvPl7UvQxOFAXVbndCFtLB5KtnXyVVk01MJohNL
	aXeDfp1i/Sl+NPCPYnFeHnp8IwHjm0U35FuXv0Rt5NcGfw2AY86vGlsljmz1ztoVKUB/Gff5ZBjKc
	iOspcPWzbOBKgtePEEaqU3wDtDMQXfvZVnSFXzMrr14S34KHvUp2hcGMK2x7Q1+6bWXJa+h4Km5KE
	Y3F6VHsotOt+jQA5CliLNhzzH8x1xTSW4sQh7LwqBNcgG+vPAJSJyR3jWKrgDxyI25ZMG4OaIlVJ7
	YTnUQCZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg7xB-0000k0-6M; Fri, 20 Nov 2020 15:04:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg7x6-0000iT-2p
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:03:59 +0000
Received: by mail-wr1-x443.google.com with SMTP id o15so10352820wru.6
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1iZ+W7DQCe9o+mnGwK40d1ggPjKeowkaQExedpZm74A=;
 b=PSjQrXjvs6/4henYPLPz2/D+ZO1Gps8HQF1dGJBEw4T2h8NqTpjDdwowRcT/4qa6hi
 HaTXNzRDdxiQlEqR+1YnGV1rgaUPLJoK9FmsLH7OXuN0qtRKf1zBUouyElencwTajLkD
 gcXCl1IHTLA75JBJ5kSu3pGQUECgcumAUZ7WS4dhMGFbDT3SwYooLzb59VUZodmw7gmr
 CcZd/ftgvfQdQ62HtqKBR1pa2TADkb5LrIwHDIF9AxVfOyBk1DSb79KdAIlGhFtlxWVc
 lDyT2B2D7oJd7sk3hBoYFZzFvE1kAeeZKdYhTqmNyo/05PKBS7+gRSX0EBtQbNCCOqa3
 t/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1iZ+W7DQCe9o+mnGwK40d1ggPjKeowkaQExedpZm74A=;
 b=HMYKVnI7+ynic6yHlLZW191SOh3UD1mAB45Z03M2PqiGYihm176Pdrr039CJ7gBXJY
 90EY1CVb10fIRkIZZzypRzDEcv2L6gCD54imJ3dZGU516Ed7TCxN8pT2QZuKuqpsk258
 YxTSa/DN0ovaBS83nl7yifSjNcZSH6nrSCoyq5xQJr7lM+8GxPwXaEUffMGcg4L1KwYB
 E7wghED3Mms4WaXj6O1iPULYdP60LhWivE5I4x0OXyK+3vvYGrCaB8ZAeYbnG8zuaNm+
 s7rtxd8IQlj+kp6XX+kOzw/1oFM14xJ4MGwQQ6rGO24AAZhNzgUfcOehzrjSfMEk2PGp
 vcmw==
X-Gm-Message-State: AOAM532O35A5s4s1zLe2I6beKC5k9gGXeGqmRHY0BDf9anPanqRwurAw
 QDfCTOkSu9FJBMQaioEKtUO/Ig==
X-Google-Smtp-Source: ABdhPJy7/hLn5ooKuW02nArAMZH3ladnIRrNkwhmo3ERpmjX+UWKTV6MR8UI3eZVfUN9ANs2YHEznA==
X-Received: by 2002:adf:a1c2:: with SMTP id v2mr17237180wrv.95.1605884633065; 
 Fri, 20 Nov 2020 07:03:53 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id h17sm6772175wrp.54.2020.11.20.07.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:03:52 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	vkoul@kernel.org
Subject: [PATCH] phy: amlogic: meson-axg-mipi-pcie-analog: replace DSI_LANE
 definitions with BIT() macro
Date: Fri, 20 Nov 2020 16:03:47 +0100
Message-Id: <20201120150347.3914901-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_100356_434499_815CC30D 
X-CRM114-Status: GOOD (  10.68  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

For consistency, replace DSI_LANE definitions with BIT() macro and remove the unused
DSI_LANE_MASK definition.

Suggested-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
index 6eb21551bdd9..1027ece6ca12 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
@@ -38,12 +38,11 @@
 #define		HHI_MIPI_CNTL2_CH_EN		GENMASK(15, 11)
 #define		HHI_MIPI_CNTL2_CH0_LP_CTL	GENMASK(10, 1)
 
-#define DSI_LANE_0              (1 << 4)
-#define DSI_LANE_1              (1 << 3)
-#define DSI_LANE_CLK            (1 << 2)
-#define DSI_LANE_2              (1 << 1)
-#define DSI_LANE_3              (1 << 0)
-#define DSI_LANE_MASK		(0x1F)
+#define DSI_LANE_0              BIT(4)
+#define DSI_LANE_1              BIT(3)
+#define DSI_LANE_CLK            BIT(2)
+#define DSI_LANE_2              BIT(1)
+#define DSI_LANE_3              BIT(0)
 
 struct phy_axg_mipi_pcie_analog_priv {
 	struct phy *phy;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
