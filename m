Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA779C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 776AA2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f/NS8OXi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HzOoNuPd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 776AA2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JIrU2TaftBMvkm+jxprS7WV3zbs2wp/4RQNwfrWQpg=; b=f/NS8OXily/wsB
	e2vD2JB4Yy63OW/RN9iVeSzTkLPxGAzdmX+UE5e9PuhOaTzSiXI0qWujZdRw8Uf2Dsh6b2YvsHTNl
	fhgKsdO8kqfeHweWcLLtqDVOXquf3qLzyeq2fHJjlmcs1ybaLHOqLBY6zjQtM5HNlW4auJBVznkIr
	N1SFhFuToC0va3Y/NU42cBQMQD0zQwzO4z8ichhpyKgSLB+6RVK/WEXub+44uvns6P1IuJrgKKAS0
	nZeDdOAhUI7TS+/jtCjcgL4rxHhEgV5Fj6pRL7x9XXD4vsigYP01boN3GMUuru3UZLyivkJiagBCN
	Izte3sa1R2wrIbbJGWVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk4ph-0004kc-R0; Thu, 17 Jan 2019 10:23:33 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk4pb-0004g5-It
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 10:23:29 +0000
Received: by mail-wm1-x343.google.com with SMTP id y139so434981wmc.5
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 02:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Y0Y5B6s0w0R3Gp1L8M/91nvIc1hUn7ja0tycQpJro8=;
 b=HzOoNuPdoK9zHB3vqZE86aLSUSENong1ks01P2QHeVQ6ZAHt5MqnxRh8hf1J/cwIo6
 GqRcSKTR03esabYqdhw0iJkLipx5NqOqTkny55JN+wxHdeuqzLGSt/M0I36Tn7Z+pPik
 2QacXWzVG+re0r3nAtURi3FSsSjyuL+S2XbS0rla/qUP5N6Dv6t8fUQG2cH4RrRzLnau
 g/DnhUptnm7Z13p5IoN79X642DJTDCQyDzhOkR+8/Q9WsgSy0yudjp4xKuLNOPJF6D0Q
 OUydwcTgOzE/g9VugndT90IAdQ9fagXP5YBeaYyehkLvo+vluMNnOkl7rmkrOZwkv9+n
 +2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Y0Y5B6s0w0R3Gp1L8M/91nvIc1hUn7ja0tycQpJro8=;
 b=JA761B3yHCjcW4MTGOJZQYuNdPkDe4ELBoXE+wfSEu1zmxeEj8EbRvV/1QmIeiSoCd
 qIndjqSNThWOrmcf7UQKiMXvaslNwuvoyl05b9vVq2e9p2vs9uvr2rdK3VNO9UdT8C9x
 IG+tRw3qeudgC9YepUmZEk53CIRyF8oAC+S7gKEX7pSruW5FuVwJ1AzHQ6DvsTNJkJh7
 kdijG6w4JFVvRdpn++T5/Y74jBk+dFcLG23F/eGKgi8hjtxXVl0hNZC4ZdubbvxcSIpL
 h4j3qZa3emImtPcYvBAlX8hXCQn6yDmEm7L0hQDSjhdIGvGeZctT3A30zxFoXs9/wCpS
 y3DQ==
X-Gm-Message-State: AJcUukeV8F/CMXUMzGAQ1glsNeh0YMV2GH2EgYW7Tea3t+dYnQl7CkNy
 0XFWDYvspjdsKDdhtL2JkeZEVg==
X-Google-Smtp-Source: ALg8bN6oj3zTDxDK/3lEWYmXIfBdJ8/WDqpeY/FgGXn5Hhv/4j6+xjMsB0USmaApqRcJRBcid+MceQ==
X-Received: by 2002:a1c:f509:: with SMTP id t9mr11758492wmh.76.1547720606130; 
 Thu, 17 Jan 2019 02:23:26 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id u10sm66400530wrr.33.2019.01.17.02.23.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 02:23:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/3] pinctrl: meson: fix G12A ao pull registers base address
Date: Thu, 17 Jan 2019 11:23:14 +0100
Message-Id: <20190117102315.1833-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190117102315.1833-1-jbrunet@baylibre.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_022327_706307_F7221A59 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xingyu Chen <xingyu.chen@amlogic.com>

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
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
