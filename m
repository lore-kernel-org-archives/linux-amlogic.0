Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E7AC43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 18:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28B5521738
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 18:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qsj6PMtZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8b+G11y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28B5521738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaVcTnGV2HeB5DFNRh0eiffs2zds6Ou3f5wj6FQuZ/0=; b=Qsj6PMtZjyzbZN
	L0Et90+DEYeBuvofnzkT6+YZK4qN/bSbPkrG58muCLj5lmt1Qc0/8oJwhGSNfoBboTp45Hb32F/W5
	OqEXE3ok1LDNoaxB+6HYf79HhyGF8JLzDtauvD94h1wipFStH/kKGIFZcH7Y1ov09o4hXFNvZBt1k
	mxzzVAwNtyaYEcb4kx4Xv3lU9reftGkCmq9QkF2cYPAR6u40xetZwXHIgPKd3fgRIkkYXk+miVE+C
	X6GU+xyPiPgFRbrvHraC3UJSZbcHgXNZDYkOOfWT+JemUSazJlB4y1kiu+i9V9zgzv0JEcMfzbfIM
	GpGWySE0ZHYpL7YyzHCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9CzK-00075Y-Bd; Wed, 27 Mar 2019 18:09:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9CzH-00074u-BS
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 18:09:20 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECF8B217D9;
 Wed, 27 Mar 2019 18:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553710159;
 bh=U5EPkZcf/N+CmLptqtDmvKPoya9zYkggJDEyzh93mPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d8b+G11yjtrPo2P7q03ZnuiDJykQoGJ2Jxl0QkHDm+X415dC59EZzH3e0qkEeJBEF
 hrE/7zKgOz/YJbm0Jl+/bIKf5vpUOAitMOzVZsJ06iHLTuk5CHDm/DHWYWDel1zbgs
 SdZR0FPciTAFVOa/g5RyAVDM8i+0Cgtgkhrud5Ag=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 226/262] pinctrl: meson: fix G12A ao pull
 registers base address
Date: Wed, 27 Mar 2019 14:01:21 -0400
Message-Id: <20190327180158.10245-226-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190327180158.10245-1-sashal@kernel.org>
References: <20190327180158.10245-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_110919_427681_C137F509 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Sasha Levin <sashal@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xingyu Chen <xingyu.chen@amlogic.com>

[ Upstream commit e66dd48e8b0dee104d16417d30361074b08baca8 ]

Since Meson G12A SoC, Introduce new ao registers AO_RTI_PULL_UP_EN_REG
and AO_GPIO_O.

These bits of controlling output level are remapped to the new register
AO_GPIO_O, and the AO_GPIO_O_EN_N support only controlling output enable.

These bits of controlling pull enable are remapped to the new register
AO_RTI_PULL_UP_EN_REG, and the AO_RTI_PULL_UP_REG support only controlling
pull type(up/down).

The new layout of ao gpio/pull registers is as follows:
- AO_GPIO_O_EN_N        [offset: 0x9 << 2]
- AO_GPIO_I             [offset: 0xa << 2]
- AO_RTI_PULL_UP_REG    [offset: 0xb << 2]
- AO_RTI_PULL_UP_EN_REG [offset: 0xc << 2]
- AO_GPIO_O             [offset: 0xd << 2]

From above, we can see ao GPIO registers region has been separated by the
ao pull registers. In order to ensure the continuity of the region on
software, the ao GPIO and ao pull registers use the same base address, but
can be identified by the offset.

Fixes: 29ae0952e85f ("pinctrl: meson-g12a: add pinctrl driver support")
Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index ea87d739f534..a4ae1ac5369e 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -31,6 +31,9 @@
  * In some cases the register ranges for pull enable and pull
  * direction are the same and thus there are only 3 register ranges.
  *
+ * Since Meson G12A SoC, the ao register ranges for gpio, pull enable
+ * and pull direction are the same, so there are only 2 register ranges.
+ *
  * For the pull and GPIO configuration every bank uses a contiguous
  * set of bits in the register sets described above; the same register
  * can be shared by more banks with different offsets.
@@ -488,23 +491,22 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 		return PTR_ERR(pc->reg_mux);
 	}
 
-	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
-	if (IS_ERR(pc->reg_pull)) {
-		dev_err(pc->dev, "pull registers not found\n");
-		return PTR_ERR(pc->reg_pull);
+	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
+	if (IS_ERR(pc->reg_gpio)) {
+		dev_err(pc->dev, "gpio registers not found\n");
+		return PTR_ERR(pc->reg_gpio);
 	}
 
+	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
+	/* Use gpio region if pull one is not present */
+	if (IS_ERR(pc->reg_pull))
+		pc->reg_pull = pc->reg_gpio;
+
 	pc->reg_pullen = meson_map_resource(pc, gpio_np, "pull-enable");
 	/* Use pull region if pull-enable one is not present */
 	if (IS_ERR(pc->reg_pullen))
 		pc->reg_pullen = pc->reg_pull;
 
-	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
-	if (IS_ERR(pc->reg_gpio)) {
-		dev_err(pc->dev, "gpio registers not found\n");
-		return PTR_ERR(pc->reg_gpio);
-	}
-
 	return 0;
 }
 
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
