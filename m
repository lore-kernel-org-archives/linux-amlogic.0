Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8B0C00144
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Aug 2022 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UImIV5vxUD3kfrNbzMCnrr6WnfbzV6dQV7UU7GFIDxA=; b=WowfP8G/ysCX3C
	o2LFteAj6rWRX+9XDWW69W39r/koiWefjBwpInLOS2inghB/wjJdrPTeRGHnPCYBh2uwSJgIgDYWR
	JJCv+wSsWGyIlZfQ3/SZVQZKpWHTYImMxNcp/4dY0q7Dp2QGxMCB/2mZrgVw2JyzFe2RfSsN2NdUA
	fFz5x+sqNvn9CPr766Lk05RWgaxffPp9E9fuUZUbCwQ5PWVmxJDrx1IsCTZTGCjs99a6Dx7YO6hPP
	gzI7yTGyEQ3p1oHO3GZ+BzRM2W3BglA1TbWHFSzsP0oLIG7v2QWzJmgKvGdTqoY0lGp4lGABIWbz4
	mP42DsU4SnANiY8c+J3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIRde-004Qdf-Of; Mon, 01 Aug 2022 09:23:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIRdR-004QUb-P5
	for linux-amlogic@lists.infradead.org; Mon, 01 Aug 2022 09:22:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id v3so12415234wrp.0
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Aug 2022 02:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=NGyhhBpF08caSp9ryVolnpYSv07YhtzN63176RAsoRU=;
        b=l/30398qzN7b2NPQpN3AbWdp4u5F62TY0f7bHO8KhDH6oUYCSXYZZFAgib548IFdVB
         sMAN+0tkDOuMrFmM7txJL4GxCcuOUZwEuv8DW0u+5+GYCI6RSENGwHswISFRdzrwNB8v
         EivuaoqHpIGLGhFvzeNIKxHpJ+ef9YkRqFw5ZTOQEFXlphPCmUxHP+K0PVx/llU3aXMI
         YuhkNe87ad5XUhKJRtwJy4l/RQaPjOE1Tl0B8p9l7J+mnHP3XRpMGBLP45AYSLK5udRD
         P/9uGyfKaYLMMxHfiuX0ZigIe7Z/8Wm8qgkmoAPfOhbbTVFh556IUwOYrk+2YKGmU3SQ
         Ek2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=NGyhhBpF08caSp9ryVolnpYSv07YhtzN63176RAsoRU=;
        b=ickxjhVo3PC4+bQWZ7lpN7UV8esFrD0nnyqs6I7LWpwkGFiligpcff9lTGH4z2v819
         V94BGkSIdM9P9mRNr5a528d4VNyQy3qo+jxx+i/H7iL+I450Giu8VD2pa/ud+AoEz7kr
         +KHLAcQHjhZKBq+6XlacBDQ1D/rTkG25LnX9ZZXwdYvId1o0kbBfklFEygG5h/sYJHBw
         8cPBocm/xVm7egacD9iXvS4yN/QwIexXtZhxdMpX6vtYGJU/Cz1MvMi74cug0EjmgFII
         7nPr0EJuluw4n12IcrvWlVOMH81vWf/6sRNAS9COxtD0K2gDjgKsNp08jUZkiW0uCZ21
         HR9A==
X-Gm-Message-State: ACgBeo1yvgBxrc1Stj39CGRsxJLJ0gaVj1Ie61diNvdPYnQeaeXu0iiW
	5dh9ZTVqN3WdO0SefH1vhuj3AQ==
X-Google-Smtp-Source: AA6agR6mnS/kyqOIglz+91cHGdVqd9XYyn4LrVlZGvLKmhDtkndnSHB3h76n4PACAFQZ+hYVLrOHxQ==
X-Received: by 2002:a5d:4f09:0:b0:21e:cc31:50b6 with SMTP id c9-20020a5d4f09000000b0021ecc3150b6mr9186504wru.124.1659345766067;
        Mon, 01 Aug 2022 02:22:46 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q17-20020a05600c2e5100b003a3186fa559sm13504028wmf.29.2022.08.01.02.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 02:22:45 -0700 (PDT)
From: Philippe Boos <pboos@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Philippe Boos <pboos@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] watchdog: meson: keep running if already active
Date: Mon,  1 Aug 2022 11:21:50 +0200
Message-Id: <20220801092150.4449-1-pboos@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_022249_825428_97AA4FD7 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If the watchdog is already running (e.g.: started by bootloader) then
the kernel driver should keep the watchdog active but the amlogic driver
turns it off.

Let the driver fix the clock rate if already active because we do not
know the previous timebase value. To avoid unintentional resetting we
temporarily set it to its maximum value.

Then keep the enable bit if is was previously active.

Signed-off-by: Philippe Boos <pboos@baylibre.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fbcfa..8be8fd9e5637 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -146,6 +146,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct meson_gxbb_wdt *data;
 	int ret;
+	u32 ctrl_reg;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -177,13 +178,26 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
+	ctrl_reg = readl(data->reg_base + GXBB_WDT_CTRL_REG) &
+				GXBB_WDT_CTRL_EN;
+
+	if (ctrl_reg) {
+		/* Watchdog is running - keep it running but extend timeout
+		 * to the maximum while setting the timebase
+		 */
+		set_bit(WDOG_HW_RUNNING, &data->wdt_dev.status);
+		meson_gxbb_wdt_set_timeout(&data->wdt_dev,
+				GXBB_WDT_TCNT_SETUP_MASK / 1000);
+	}
+
 	/* Setup with 1ms timebase */
-	writel(((clk_get_rate(data->clk) / 1000) & GXBB_WDT_CTRL_DIV_MASK) |
-		GXBB_WDT_CTRL_EE_RESET |
-		GXBB_WDT_CTRL_CLK_EN |
-		GXBB_WDT_CTRL_CLKDIV_EN,
-		data->reg_base + GXBB_WDT_CTRL_REG);
+	ctrl_reg |= ((clk_get_rate(data->clk) / 1000) &
+			GXBB_WDT_CTRL_DIV_MASK) |
+			GXBB_WDT_CTRL_EE_RESET |
+			GXBB_WDT_CTRL_CLK_EN |
+			GXBB_WDT_CTRL_CLKDIV_EN;
 
+	writel(ctrl_reg, data->reg_base + GXBB_WDT_CTRL_REG);
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 
 	watchdog_stop_on_reboot(&data->wdt_dev);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
