Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CE4C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:06:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C929D2085B
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IlP61gOa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Shcm3pj2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C929D2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJDocWZf0lIHpT0ZiG2JMUZIVaJXdK9bhZ+4DMzMRkU=; b=IlP61gOa4CltSBKIN9miMP89Ob
	WgCgmFene+HhOYNwWbiZLW6eZqq/4sg/CFMBnyTtGA5DXtag7H9w29bcAQ+0k2TC6UC5uRS7ZQFzQ
	RAqdTT0QqfAKQtTYrWJT0LROUUG1goCUiQRDO6ic8Df2mbfYbvwDV+942OekqGIParJhppXKmVqAk
	ur/2YitNDVnevkpKdYU68EmlVNng6/9OUKVJCD8WP3EPOkoBye0axN2Yib9t59DfBSCUnWr4bZeT6
	/nV8HUIK4VKEsM4jisX+uFvqWOO/wib8kSgvgNoOWeq3Dik2CBytK8dvoUrzII/TZ2c380dXVgYSr
	TWFPzOQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdMcB-0000cu-1V; Fri, 13 Nov 2020 00:06:55 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdMc8-0000cE-FU
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 00:06:53 +0000
Received: by mail-wr1-x443.google.com with SMTP id c17so7829549wrc.11
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2020 16:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QaQFi8Mdamg7GyyTVitR5xuLU194FCgV474jmD+Lyb4=;
 b=Shcm3pj2Uvc3XBjCZRyitzZxAEnuJLPvO+5voLfyqAbAjNB9CQ6Jm5rWY+2CU9ofVF
 mFbzhtbNTXLwCLrJ+au4Af/0NLPei492LW8qtAj2qhVQviPXrZELa01A0h+ITsaoy5wx
 mzJgPC/CCp6QgrpUjwjiDenZT3tUubjls6hZ5MHzkawKluASBWU45FIXz33GjmLlLJWm
 V7q4smKL2nW0cqPrve2FjM7b0oRCQG8qMPWnfGOTFtp6jTP0awC0hGvBKGpOipKGVumn
 QRcbLnLRvVhicUwyraGCLX845/1tWmRi/KyKoRl8NlGSztUeNqDtDQ9id8T410ipuxpf
 h1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QaQFi8Mdamg7GyyTVitR5xuLU194FCgV474jmD+Lyb4=;
 b=FlrhmI3dFqthfgLNWB0+RuNC9YnJDopzDa+tfTgMXj0UG2QeKa0dHADt9HDgJy1mZO
 7+M5DIUASIL+TtRYaDXBvOx0h2H9HPXxqV4VmaYC2VszJF60cNfqwf6uKC4HpR1h9VSM
 5+0lL6ST0Py9olW0lbKQhafpJB1FeyXM3Z+Hb7qzQvlLImtTGyZnHfPIhNoO6hZYui90
 6uE1ypbe0YLpqMERu/0qDfaL+5/Zp0lDfgnqaHuV+/ERYmDfryujSVsLFl4M7fyD1G18
 M4Xhf/+MJdEPsW1MvAenbfZ83DNjARgDa5/j+UDck6kYXF9JNm/45zXV236Xok++ub8n
 fNvQ==
X-Gm-Message-State: AOAM532ZEC0yl/6OouwBL+Rweri7ctxM1V9oCHPSISHqDDq/1DLVj/67
 lHlFJAP9aGR1+Nn+L2+8yciNRg==
X-Google-Smtp-Source: ABdhPJxZ1ra0ZfKE6leDhsxONvD1vjbTzP3c9vegGedkTs74gyZWSSsupIzIjbUB9vjMC64hdvHkFQ==
X-Received: by 2002:adf:b109:: with SMTP id l9mr2305827wra.279.1605226011626; 
 Thu, 12 Nov 2020 16:06:51 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
 by smtp.googlemail.com with ESMTPSA id t11sm2010114wrm.8.2020.11.12.16.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 16:06:51 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/3] phy: amlogic: meson8b-usb2: fix shared reset control use
Date: Fri, 13 Nov 2020 01:05:08 +0100
Message-Id: <20201113000508.14702-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201113000508.14702-1-aouledameur@baylibre.com>
References: <20201113000508.14702-1-aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_190652_527744_E3E18EBD 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
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
Important:
Please DO NOT merge before this patch [0] is merged, it adds 
reset_control_rearm() call to the reset framework API.

 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 03c061dd5f0d..2a6c53f52423 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -154,12 +154,14 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	ret = clk_prepare_enable(priv->clk_usb_general);
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB general clock\n");
+		reset_control_rearm(priv->reset);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(priv->clk_usb);
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB DDR clock\n");
+		reset_control_rearm(priv->reset);
 		clk_disable_unprepare(priv->clk_usb_general);
 		return ret;
 	}
@@ -197,6 +199,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 			regmap_read(priv->regmap, REG_ADP_BC, &reg);
 			if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
 				dev_warn(&phy->dev, "USB ID detect failed!\n");
+				reset_control_rearm(priv->reset);
 				clk_disable_unprepare(priv->clk_usb);
 				clk_disable_unprepare(priv->clk_usb_general);
 				return -EINVAL;
@@ -216,6 +219,7 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 				   REG_DBG_UART_SET_IDDQ,
 				   REG_DBG_UART_SET_IDDQ);
 
+	reset_control_rearm(priv->reset);
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
