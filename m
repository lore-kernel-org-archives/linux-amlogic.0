Return-Path: <SRS0=kAbd=P7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D077C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 16:33:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3752660524
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 16:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3752660524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRKZnDESTejASS+V+pBtcNnGu+M4N0ieWrRqpe+O4Qc=; b=1AvDHavhpjOzwj
	CBdFtgQMa3l3tFyZ5VW05odE4N4JFveamCQhCLZ8b9wVVzDrDVmV0nu61ihWsBjCKJTbSDL0pkCc9
	q9RyMOBtRIjnUuBYQNWDs4/Rx/E8zcMDWycFdeGQ5YUq03pA3TA8ezwltfL1i+ap3U2eijAR7ukTC
	Fo3a6qe7B5HReZnnD3auV/Oye98rndJnHBNYJorm7Xz6TN1DmzRkSurLokHg2tNrPyHeDkdsRbOe+
	uB8n01OlK/cC5lMB2dsySPjR7ak5eB19ZQUkYn11LbbKMAEvrF8FW1MuJFzA7SsmM1plvNgZIkqAL
	440Q2EXGg7seLzEkEpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlZU5-00BEkm-Pe; Fri, 12 Nov 2021 16:33:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlZU2-00BEi5-05
 for linux-amlogic@lists.infradead.org; Fri, 12 Nov 2021 16:32:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d5so16536822wrc.1
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Nov 2021 08:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EOnn36aeo16MhozSZgWuY/58jgLwvjCwwFTIYXWx3ds=;
 b=sakY2AHeEjqZFhuR1Qn7v0LUV+9sK+o5s4j6b15GXchii6gy/AmyjpFjM40oBvSa3W
 dG+l2iBOaCAbDXtharwfe9FlF4nu/LSUScGWTe0vFxBLbwxzMg68XdMZggC9DF8s5IjW
 XCZz2dWhRLXl9+SLbDlwKRpWYvMEUEykj8KUL6apBshn3V44q7ULfumIdqUpWrl7u+XL
 5amiri8sTYxGU4ASbEX5INr66OqInuAjYf0HwBMia/pRg9xQIr5gs//5Fa+n/QOjWRGi
 ch2+fFtQDW7R8J4A3KWdI1Y0MwS1JJaPVO48uJIVIg7VJq9eu939Z5RtJZmSxo/Xd5SN
 6QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOnn36aeo16MhozSZgWuY/58jgLwvjCwwFTIYXWx3ds=;
 b=tfI1gMavrtOWqC6g5dSg75OkUSENMFdu7nkpaUW3HNe77o+Dm9tZZSsxMN9pNUUUgQ
 ayNt0JahBnlDRT97WZbOpv9fL1BHAlfkO+CejcXEp2gS9q6ZiPjYYr+JYH2SvS5i3x/E
 QX3IFHnDcDSTJvHalPit4Z/f6tye3C1hz7F9XxI6PzcgdF8nm9SogszqnC2o8ybCfbCr
 dLzvUXNPaXTnbOPKqhPdOMhxZ3yqNioabCpu3qCt/PxTsK62duxYiZKIMYZ8UQPg26cE
 gM5jb9r5EIMRZOw5h2Xrc4WdR1z6TkjqGEdbO6wD7g8/gzxZUdfwwUfJKoQXJ6sMVQ7Q
 AbTw==
X-Gm-Message-State: AOAM5333u1+RPvI0qVXJY2JumJP4WuHbpmZtbsPwo61c1g21023rLEmu
 GseQUnAKmX6B0Y7k9VWMEj9J9Q==
X-Google-Smtp-Source: ABdhPJy3+UcYNBPyR34uuOLhM47GlKeQga5JGMrsFqE+xFIEv4G0dGAs8SpT0A2/2FT6JivlJG7PSw==
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr20154451wrw.78.1636734774629; 
 Fri, 12 Nov 2021 08:32:54 -0800 (PST)
Received: from amjad.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h15sm6253796wml.9.2021.11.12.08.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 08:32:54 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 3/3] phy: amlogic: meson8b-usb2: fix shared reset control
 use
Date: Fri, 12 Nov 2021 17:28:27 +0100
Message-Id: <20211112162827.128319-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112162827.128319-1-aouledameur@baylibre.com>
References: <20211112162827.128319-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_083258_066740_DEA8F013 
X-CRM114-Status: UNSURE (   9.58  )
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
index cf10bed40528..a6e74288ca8f 100644
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
