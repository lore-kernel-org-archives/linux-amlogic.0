Return-Path: <SRS0=kAbd=P7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF9CC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 16:33:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A4C460524
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 16:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A4C460524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkQ6Bo7992P6WWT0h7cvP1DreCBSKzJjYATDq1+jCG4=; b=BY9wj2DHkiTlkz
	at3fBuCwXQmUkgfdOSLKk89Bc04ERiTiRB2l/SgsWrwX8PXLoWLtKoCQ0kTWMAPV8WdB5tjwzAtjy
	ZDdWvlXFxwvu80O1mkPLsb6Z5vwrh5CdRhKUXUm2gOs5T/afeMUQOiIJmbOGFWAGn3TuUFQygSV9D
	ZQPSYrDBcf5p8Uved8urv4ay2Kl93BasoZHaRdnd7p2tXeW80iCIULGd2OBrSSOntQSNhCxRuUJGe
	tGxwzP6N8k1rmUDr7rDzjpbEs7nYXMJzBl4MxcyuUqL1881b5+askelDp9Vdo6vcAIgunTZ73nSJx
	U6L3jVi90MqDXShnDZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlZU1-00BEir-MI; Fri, 12 Nov 2021 16:32:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlZTx-00BEgo-PE
 for linux-amlogic@lists.infradead.org; Fri, 12 Nov 2021 16:32:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r8so16434562wra.7
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Nov 2021 08:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EGKUSGKtLFj44yzs+ZJ05zEIvv3LfPz2d/+T3ZZAwrY=;
 b=zNZg9CCNXXFkQwszxD+xvUqQjfREfGlJ87bFXONypKNRSpdEs3HT1X//C7GyxRiK9r
 6Sb8z0ojOE2Vbj5GAogYfz4gBnd8ztC6FELdNwbMNYf0PZDaky8o4HJarbeK/0koRcFm
 5zN52PHwT9MlRMKDQEOP+PyRoK63Z2UlditWTuCrJDsTnp6ezHZJ/OjOds9fzkFAAXKz
 Ae3humcL3Am0PHYTQck78M5BBP6hEpxGuLW0D2M/ODU5QeFaz7mo3WcRqp+V5QHams5n
 nOD8iCa1UakV6m3K8bDpCptrZi6rTEGK5nZSmrI1hSmxIsittL+qtciHw9BLrUKtVcxg
 xV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EGKUSGKtLFj44yzs+ZJ05zEIvv3LfPz2d/+T3ZZAwrY=;
 b=AgezDr8Uto/RCKecuuJHXqznFmqUP2F5waeG0mbs/qQZA+LU92fNBgSp7WVdpjE9Zg
 LbAX8eUhznuZQD1OGa4sopQVcMIHztM4rJRkBOxjsQeuemP/Ceqsr9vZr4/zsalrw8et
 HL/jZuPbArgSCB68w0rau8r900VaIdbBoO8+u1yFsSWK7N4r4a+aCPjpvG9E6QV7hMUW
 14i0u/gAf0ZkLEEPgR0je8dgjy72Mmlk+IX/8Q5DH18HJx1nMVdtoylwX79BYvfhc1Ou
 qRpFTZwvD2PvcC+crIrFG6Csnhe1fSvgnwU1zQbnx4E+1UmGEnAmZP9s9wstVVBWLc2K
 Nmyw==
X-Gm-Message-State: AOAM5313Z2u/bX+zCRQG9+44DV8bj+Jj1P5ILqKp0kpyh/NLyiLW5mMK
 +Tly7renxltB/DHBibOOYRLpBw==
X-Google-Smtp-Source: ABdhPJxRxksvOD26GekokFvPEm27nCXht9IQYJiQdZxzfsNqhBLqbNGJGsuI+ejvei9GfRgTqw1ieA==
X-Received: by 2002:adf:e38d:: with SMTP id e13mr20027652wrm.402.1636734772006; 
 Fri, 12 Nov 2021 08:32:52 -0800 (PST)
Received: from amjad.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h15sm6253796wml.9.2021.11.12.08.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 08:32:51 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
Date: Fri, 12 Nov 2021 17:28:25 +0100
Message-Id: <20211112162827.128319-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112162827.128319-1-aouledameur@baylibre.com>
References: <20211112162827.128319-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_083253_862988_E6DA5235 
X-CRM114-Status: GOOD (  12.18  )
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
phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework. Therefore, use of reset_control_reset() on shared reset line
should be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 2b3c0d730f20..9a9c769ecabc 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -110,8 +110,10 @@ static int phy_meson_gxl_usb2_init(struct phy *phy)
 	int ret;
 
 	ret = reset_control_reset(priv->reset);
-	if (ret)
+	if (ret) {
+		reset_control_rearm(priv->reset);
 		return ret;
+	}
 
 	ret = clk_prepare_enable(priv->clk);
 	if (ret)
@@ -125,6 +127,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
 
 	clk_disable_unprepare(priv->clk);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
