Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E7ECCF9EA
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 05:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rEoQIDemNYdPmnlRiietLqD6VhBZQpLT7npm77ZSUWY=; b=toPvA0SZO8Vx+a
	XVcdkP0pmtn6rOmfUFfwXenTODk8Z51AtLhJqOQlKZwW7iHIyIJsaWPDiF/t3XiJIFvV4ATbF46KF
	6p27GP7VAJeWAx3Kk6RqdZWdSlNDnOZRB1lE1Bz02OAfjlVunqlkww5TEHgL12JMGDuaUbI9evtwr
	tvaadA0EPbvO6uBWLw2nqUkTMqjMLWlcjCgz46qiMo5b7UclMwc+yj0cGjEREo0WBxKAbEV+ne2QK
	qx114GiWtR9npI5sm0c2wh/lRoGFs7T54jQILngZKjWw9xjBKx2EmZNdbduOObpmA9SroPJcEz+MN
	bRCL8yCa9Y4u5P3N8d+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL96-00000003Uxj-2DQs;
	Thu, 30 Oct 2025 05:24:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL93-00000003Uvd-2Vq2;
	Thu, 30 Oct 2025 05:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 260BC44378;
	Thu, 30 Oct 2025 05:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C27FCC4CEFB;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761801857;
	bh=2jU1k23psQLoti835WJhUi8hPO5zOMCVn1KLTW6Gx7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fqct62npqZNU+7aZwsQZWh1JWHKkBg0YVUWAGL+i6XEbL232ekVUazCOU0HaAR0BD
	 fYn8Zp9ku2mPyqXsQ7ga1lJPG1sQuWmBb7U5Ct0cRa7lq8pf7w5swmYJE/k5gNz/BM
	 YhO9IS/JzLvmVvjE6VVBiAzz1RrbYlWudw4yeIC9+YEUWq8n4DegFGe5cMjCMb/fqh
	 8f4VYoV9BU/WxYmvCQOLj1dnLobZJ/Aim7AueiiF2q+D4+O9FqFQ/dCKKwFslC43uD
	 /rl+FO5cWp/+8hT9quRlpMAj3Sbb74Ip7NZIz4bD3zWIByIxmdW4pEFuRWoqznm8nm
	 ybfwXVyuNfiEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE968CCF9F6;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 30 Oct 2025 13:24:12 +0800
Subject: [PATCH v2 2/5] clk: amlogic: Improve the issue of PLL lock
 failures
MIME-Version: 1.0
Message-Id: <20251030-optimize_pll_driver-v2-2-37273f5b25ab@amlogic.com>
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
In-Reply-To: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>, da@libre.computer
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761801855; l=1329;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=By36+5Xc3F4ZCx2+oODMEZ/7arVOVHo8uzE39j79UAI=;
 b=uZ6pe/g6+Kcpzahmm37OY/aCUYb8QAGsQ9XhgLK57CE/ZIYOWn0w0solOn5GWD1DFWNqs20OZ
 DbfMN8DGCptAdPPnCDKIoA1yjDdyQRO7hVdZKe6PPNqGayQVvll6NrY
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_222421_690758_DC258EFE 
X-CRM114-Status: GOOD (  11.23  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Due to factors such as temperature and process variations, the
internal circuits of the PLL may require a longer time to reach a
steady state, which can result in occasional lock failures on some
SoCs under low-temperature conditions.

After enabling the PLL and releasing its reset, a 20 us delay is
added at each step to provide enough time for the internal PLL
circuit to stabilize, thus reducing the probability of PLL lock
failure.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 629f6af18ea1..f81ebf6cc981 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -368,11 +368,16 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
+	/* Wait for Bandgap and LDO to power up and stabilize */
+	udelay(20);
 
 	/* Take the pll out reset */
 	if (MESON_PARM_APPLICABLE(&pll->rst))
 		meson_parm_write(clk->map, &pll->rst, 0);
 
+	/* Wait for PLL loop stabilization */
+	udelay(20);
+
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
 	 * is newly added for A1, keep the new power-on sequence to enable the

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
