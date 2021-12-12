Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936F3C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 20:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqNK3/JKdmBbvAlz2+gefCckZyigp1/fsgvzGH36Mzs=; b=bYudcPg2/ai7hj
	klB4RiPjn+MBXQxdXQnbPppM7MMhRCJPhFUoUFUi1rADxCHVnuvrd9Q1Wy+maPPuAGi3a0QbHbLC3
	9QzbHEMjMvfgQ4KD94YDzkI9+UWsUocr+f/TIl3vnfv0Bdb7O8LF+oCceHrNlztltZlOOlDwC8a5t
	ltf3sxqsmkDrTB8pXfS+JbKSTdkMGqBov4220WdWNqU9A9sIh7nQntIRugzfzJul3BA5McBM2U1oc
	55PenKSY5xf0XYL3QLWMh7aoGNDf8bUGg7xE6WWMcKJvwnQ3WWadNs9p69SLSAALga+/rrmejdHof
	PgJ/fa0cxCJdVFPCO8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwVJb-007Bg8-JE; Sun, 12 Dec 2021 20:19:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwVJJ-007BVw-HZ
 for linux-amlogic@lists.infradead.org; Sun, 12 Dec 2021 20:19:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so10360446wme.4
 for <linux-amlogic@lists.infradead.org>; Sun, 12 Dec 2021 12:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kg/EoUTvtJCV0eIOzDDw+a6fO7fnDbKWvif2j9QvU1k=;
 b=pcjNcXo7dFjKe9b3PBWARFRWZr4FFcHxkOlewPzmHYW8JxHjngMhrx0q+knnJqVDab
 QNJvLN85AfBHFPP8BiSpZQ6oXra++aByHtSUTJT43ycUaBS8gvZWDOhelrbn8xCY9vBl
 F+QBryo0cuQttHFEApUNveZJ2lGksjVT7MKTBvtqHFuMqxj2lFyREZkUPQfug759skRx
 TPXKV8Rky63hnwLWIYcZR3ULPibkwz7wUzgX0SNVR6KUJ/NL59u/Gnj5siakM1H3RX18
 mCmT9FYecMGk6isn6Lh1oDJPLBs56QfP2a+l/z2GQRpDo0Ao6lONSzrj3JBxGe1VWqqg
 wfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kg/EoUTvtJCV0eIOzDDw+a6fO7fnDbKWvif2j9QvU1k=;
 b=LEVCMTRr9zYKGwvRMuTDcdCCsX81utOVOkgryxDfYDIjsH+iEeEiromg9A1iuJfMYD
 O2PoNMDQucXSVaNmV64cX82J7y0yzE8I06Ajh9+0f9INK7UcXwIWcxMNJAm0u3+ZRJQY
 0sXbsVT5PnfWaof5hxVxrH8BrpuzO/AqN09+Ew7XUsW23LV+9N0jwkUL8tPb/zGE5JR4
 dDoPNasu1N7U0eJfrcbGcfczshuxfM5+GytJgfUC4g2urdQ406LPIo0nulxHzWXlpADx
 SkK7wXKwaoNmBJRhznK5LlvDJg06faySWMVOyacuc1t9jxqh/ukLlUsHnAQjPAysYS3U
 L4gg==
X-Gm-Message-State: AOAM531XzpXqCPcf6W2sXLVcr3PmQOMzV/aDzcL+weEew82CSbHQ4EOt
 +vldv3j+L0oyUQtOti0LuJvttA==
X-Google-Smtp-Source: ABdhPJwgdpYCgr0z0RkhIAAroY4dPi0MQtlkklljD6krZXWkI9iwaVuD8lv9C9Q0BP7oIqg6Dm7GiQ==
X-Received: by 2002:a7b:c197:: with SMTP id y23mr32689470wmi.44.1639340333806; 
 Sun, 12 Dec 2021 12:18:53 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id p5sm9092710wrd.13.2021.12.12.12.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 12:18:53 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 3/3] phy: amlogic: meson8b-usb2: fix shared reset control
 use
Date: Sun, 12 Dec 2021 21:18:44 +0100
Message-Id: <20211212201844.114949-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211212201844.114949-1-aouledameur@baylibre.com>
References: <20211212201844.114949-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_121905_644258_D13008D5 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Use reset_control_rearm() call if an error occurs in case
phy_meson8b_usb2_power_on() fails after reset() has been called, or in
case phy_meson8b_usb2_power_off() is called i.e the resource is no longer
used and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework, use of reset_control_reset() on shared reset line should
be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 77e7e9b1428c..dd96763911b8 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -154,6 +154,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	ret = clk_prepare_enable(priv->clk_usb_general);
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB general clock\n");
+		reset_control_rearm(priv->reset);
 		return ret;
 	}
 
@@ -161,6 +162,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB DDR clock\n");
 		clk_disable_unprepare(priv->clk_usb_general);
+		reset_control_rearm(priv->reset);
 		return ret;
 	}
 
@@ -199,6 +201,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 				dev_warn(&phy->dev, "USB ID detect failed!\n");
 				clk_disable_unprepare(priv->clk_usb);
 				clk_disable_unprepare(priv->clk_usb_general);
+				reset_control_rearm(priv->reset);
 				return -EINVAL;
 			}
 		}
@@ -218,6 +221,7 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
+	reset_control_rearm(priv->reset);
 
 	/* power off the PHY by putting it into reset mode */
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
